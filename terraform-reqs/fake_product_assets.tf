resource "aws_s3_bucket" "fake_product_assets" {
  bucket = "fake-product-assets"
}

resource "aws_iam_user" "fake_product" {
  name = "fake-product"
}

resource "aws_iam_user_policy_attachment" "fake_product_assets_rw" {
  user       = aws_iam_user.fake_product.name
  policy_arn = aws_iam_policy.fake_product_assets_rw.arn
}

resource "aws_iam_policy" "fake_product_assets_rw" {
  name   = "fake-product-assets-rw"
  policy = data.aws_iam_policy_document.fake_product_assets_rw.json
}

data "aws_iam_policy_document" "fake_product_assets_rw" {
  statement {
    effect = "Allow"

    actions = ["s3:*"]

    resources = [
      aws_s3_bucket.fake_product_assets.arn,
      "${aws_s3_bucket.fake_product_assets.arn}/*",
    ]
  }
}
