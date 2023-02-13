Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 933E2693EEC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Feb 2023 08:28:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbjBMH2a (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Feb 2023 02:28:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbjBMH23 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2023 02:28:29 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73594D50B;
        Sun, 12 Feb 2023 23:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1676273308; x=1707809308;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wYCmXhgdhhTmQsJ7X2QgB0MWujfFM9VvV9u0zJ/Ba2w=;
  b=Qt3hQIzXySn98l3KD9rNbj4RJWUA8dpAiGlcLoKOagmEgpHOiTl9IJvu
   1KWVdxPxXHrPMdivbsETkdmFl8IX74GO8NtuuwmnzEcmSj1oaWoBpKK6B
   sRgCN14LWLE7mqHI4W80ou8MaP79y+8+RV1uVMm7BzPYaiVubPKNW5CFV
   Dy5916ySsziPvp5+WsijZVRPYph63lLEMc64a29Oa4k21ZIJlpIk9Ht2R
   ZoAg6l8tCVGVgrev3/yY/sksoRoMF2seiZwqQdKqJQEoDTJZDG4NcVl4A
   X8szzEt+Fn3DB6y4edJV6TSKabHEO2e2O4QZrUPxymr1uQtddDAWCPYvS
   w==;
X-IronPort-AV: E=Sophos;i="5.97,293,1669071600"; 
   d="scan'208";a="29031053"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 13 Feb 2023 08:28:25 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 13 Feb 2023 08:28:25 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 13 Feb 2023 08:28:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1676273305; x=1707809305;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wYCmXhgdhhTmQsJ7X2QgB0MWujfFM9VvV9u0zJ/Ba2w=;
  b=CrWBKWAG5Wj/abp/2mR1xWLJkOdlmroNr91KVPX0n2FOqhcl2XgIX30j
   F4rCkbRgxBWbEza2VnPmmUg4qTFyv/0KqP/RiDd05xbxe/N6c7wpums1t
   wmaZyFeuqZ22pLTiErJV60LXBdWyM3yKk8cVRxVETzDiPOPceOXO16xXc
   HHEqHYIvBqflefg+ADY7YQT0yHUAZQd+Jy/gHHKX3vE9t4nwf6OTFyxCA
   2cUvSPUrOniH2DfqW+kw6GvUAgeGcsqTJUfKPLMuNtngPFjF5SnEB30Mr
   5TDa1zx/W4PIYGl9CLMawXNlCcLYYDtaxJiuXvKDszOKFwL+UFx9uh54L
   g==;
X-IronPort-AV: E=Sophos;i="5.97,293,1669071600"; 
   d="scan'208";a="29031052"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 13 Feb 2023 08:28:24 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id AA435280056;
        Mon, 13 Feb 2023 08:28:24 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Marek Vasut <marex@denx.de>, linux-renesas-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/4] clk: rs9: Check for vendor/device ID
Date:   Mon, 13 Feb 2023 08:28:22 +0100
Message-ID: <5909960.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230110100003.370917-1-alexander.stein@ew.tq-group.com>
References: <20230110100003.370917-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Stephen,

want me to resend adding all Reviewed-By?

Best regards,
Alexander

Am Dienstag, 10. Januar 2023, 11:00:00 CET schrieb Alexander Stein:
> This is in preparation to support additional devices which have different
> IDs as well as a slightly different register layout.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v2:
> * Use dev_err_probe to include return statement in one line
>=20
>  drivers/clk/clk-renesas-pcie.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>=20
> diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pci=
e.c
> index e6247141d0c05..bba09a88c2ccc 100644
> --- a/drivers/clk/clk-renesas-pcie.c
> +++ b/drivers/clk/clk-renesas-pcie.c
> @@ -45,6 +45,13 @@
>  #define RS9_REG_DID				0x6
>  #define RS9_REG_BCP				0x7
>=20
> +#define RS9_REG_VID_IDT				0x01
> +
> +#define RS9_REG_DID_TYPE_FGV			(0x0 <<=20
RS9_REG_DID_TYPE_SHIFT)
> +#define RS9_REG_DID_TYPE_DBV			(0x1 <<=20
RS9_REG_DID_TYPE_SHIFT)
> +#define RS9_REG_DID_TYPE_DMV			(0x2 <<=20
RS9_REG_DID_TYPE_SHIFT)
> +#define RS9_REG_DID_TYPE_SHIFT			0x6
> +
>  /* Supported Renesas 9-series models. */
>  enum rs9_model {
>  	RENESAS_9FGV0241,
> @@ -54,6 +61,7 @@ enum rs9_model {
>  struct rs9_chip_info {
>  	const enum rs9_model	model;
>  	unsigned int		num_clks;
> +	u8			did;
>  };
>=20
>  struct rs9_driver_data {
> @@ -270,6 +278,7 @@ static int rs9_probe(struct i2c_client *client)
>  {
>  	unsigned char name[5] =3D "DIF0";
>  	struct rs9_driver_data *rs9;
> +	unsigned int vid, did;
>  	struct clk_hw *hw;
>  	int i, ret;
>=20
> @@ -306,6 +315,20 @@ static int rs9_probe(struct i2c_client *client)
>  	if (ret < 0)
>  		return ret;
>=20
> +	ret =3D regmap_read(rs9->regmap, RS9_REG_VID, &vid);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D regmap_read(rs9->regmap, RS9_REG_DID, &did);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (vid !=3D RS9_REG_VID_IDT || did !=3D rs9->chip_info->did)
> +		return dev_err_probe(&client->dev, -ENODEV,
> +				     "Incorrect VID/DID: %#02x, %#02x.=20
Expected %#02x, %#02x\n",
> +				     vid, did, RS9_REG_VID_IDT,
> +				     rs9->chip_info->did);
> +
>  	/* Register clock */
>  	for (i =3D 0; i < rs9->chip_info->num_clks; i++) {
>  		snprintf(name, 5, "DIF%d", i);
> @@ -349,6 +372,7 @@ static int __maybe_unused rs9_resume(struct device *d=
ev)
> static const struct rs9_chip_info renesas_9fgv0241_info =3D {
>  	.model		=3D RENESAS_9FGV0241,
>  	.num_clks	=3D 2,
> +	.did		=3D RS9_REG_DID_TYPE_FGV | 0x02,
>  };
>=20
>  static const struct i2c_device_id rs9_id[] =3D {

=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


