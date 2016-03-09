
test_that("we can build a URL",
          expect_that(raatams::burl("aatams_sattag_nrt_profile_dat"), is_a("character"))
          )

test_that("we can build and download",
          st <- raatams::burl("aatams_sattag_nrt_profile_dat")
          ## &CQL_FILTER=timestamp%20%3E%3D%20'2015-12-31T13%3A00%3A00Z'
#          expect_that(, is_a("character"))
)

