
test_that("we can build a URL",{
          expect_that(raatams::burl("aatams_sattag_nrt_profile_dat"), is_a("character"))
}
  )

st <- raatams::burl("aatams_sattag_nrt_profile_dat")
## &CQL_FILTER=timestamp%20%3E%3D%20'2015-12-31T13%3A00%3A00Z'
test_that("we can build and download", {
           expect_that(st, is_a("character"))
       expect_silent(raatams:::bulkinitialdownload())
}
)

