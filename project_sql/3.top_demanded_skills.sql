-- Pertanyaan: Apa saja Skills yang paling dibutuhkan untuk analis data?
-- - Gabungkan lowongan pekerjaan ke tabel gabungan dalam (inner join table) yang mirip dengan kueri 2.
-- - Identifikasi 5 Skills teratas yang paling dibutuhkan untuk analis data.
-- - Fokus pada semua lowongan pekerjaan.
-- - Mengapa? Menampilkan 5 Skills teratas dengan permintaan tertinggi di pasar kerja.
-- Memberikan wawasan tentang keterampilan yang paling berharga bagi para pencari kerja.
SELECT skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
    AND job_work_from_home = True
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5