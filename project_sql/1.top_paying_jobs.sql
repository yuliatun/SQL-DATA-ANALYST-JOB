-- pertanyaan
-- 1. Apa saja pekerjaan analis data dengan bayaran tertinggi?
-- 2. Identifikasi 10 peran analis data dengan bayaran tertinggi yang tersedia secara jarak jauh.
-- 3. Berfokus pada lowongan pekerjaan dengan gaji tertentu (remote null).
-- 4. Mengapa? Soroti peluang dengan bayaran tertinggi untuk analis data, yang menawarkan wawasan tentang pekerjaan
SELECT job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
    AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10