-- 연금·절세 통합관리(pension-manager) 테이블 + 보안 규칙
-- Supabase(personal-apps) → SQL Editor 에 붙여넣고 Run (한 번만)
-- 캐시플로우의 cf_allowed() (허용 이메일 두 개)를 그대로 써서, 부부가 같은 연금 장부를 함께 읽고 씀
-- ※ 캐시플로우의 supabase/cashflow.sql 을 먼저 실행해 두어야 합니다

create table if not exists public.pension_data (
  household   text primary key default 'home',
  data        jsonb not null default '{}'::jsonb,
  updated_at  timestamptz not null default now(),
  updated_by  text
);

alter table public.pension_data enable row level security;

drop policy if exists "pension_data_shared" on public.pension_data;
create policy "pension_data_shared" on public.pension_data
  for all to authenticated
  using (public.cf_allowed())
  with check (public.cf_allowed());
