-- pertanyaan: Skills apa saja yang dibutuhkan untuk pekerjaan analis data bergaji tinggi?
-- - gunakan 10 pekerjaan analis data bergaji tertinggi dari pertanyaan pertama
-- - tambahkan skills spesifik yang dibutuhkan untuk peran ini.
-- - mengapa? Ini memberikan gambaran detail tentang pekerjaan bergaji tinggi mana yang membutuhkan keahlian tertentu,
-- membantu pencari kerja memahami keahlian mana yang perlu dikembangkan agar sesuai dengan gaji tertinggi.
-- CTEs
WITH top_paying_job AS (
    SELECT job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM job_postings_fact
        LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE job_title_short = 'Data Analyst'
        AND job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)
SELECT top_paying_job.*,
    skills
FROM top_paying_job
    INNER JOIN skills_job_dim ON top_paying_job.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC