Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC74665D0A4
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jan 2023 11:27:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233659AbjADK1b (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Jan 2023 05:27:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234365AbjADK1a (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Jan 2023 05:27:30 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D587D1007B;
        Wed,  4 Jan 2023 02:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1672828049; x=1704364049;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rvbK2fuFK98L2dD+XhK85CTrFSSQbvb7qREPeD+6OTc=;
  b=VqkzhhVrgMqt2OL0DiqTQD8HO/vcZuUrpW91XBDyu4SxT2lqtkDjO6FJ
   ETS/zirCiO/d5dDF8QaJJ9nQldBKqanR7hGumjP+Yeiphyog9PD3GnXKO
   AfK/dPNgqsCYTqDClsUIATCqCgsGjZEakz/3sr3Mj9JfT0HfQ4Y90fXgZ
   UVvplx6sEt2aQ46+MY1xrLKwAoJgV5PsjEQMDuBQF5O3WH4PwonttDigJ
   gU/fjxgTFYKrd/Te9UjwAcTdGarZf88eccbwu/scutKikKTWmx1j3Yw6X
   XA9JHU0Xda4entcMmOEK9mUtG0L0R8aOTQqrPRdpWJy0BocQ57cv3sVHJ
   w==;
X-IronPort-AV: E=Sophos;i="5.96,299,1665439200"; 
   d="scan'208";a="28238217"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 04 Jan 2023 11:27:27 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 04 Jan 2023 11:27:27 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 04 Jan 2023 11:27:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1672828047; x=1704364047;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rvbK2fuFK98L2dD+XhK85CTrFSSQbvb7qREPeD+6OTc=;
  b=IvMVHzuT/x2LLA5nsvEh4nwccWaWHn86TmrneNHxLo0opBPvb8m2AbpK
   7STpNcD+2TAtBj054lcwjyqEgqzX3pkcKHzmYSVik/RKPc8A1Xg8G1Uon
   ti/Q2w+QBr9gj+5mXZ/pNr4+rgOALEvnjEyBvK3xF85ujmBJ3a+atBfLZ
   LlxIiH5nk0eLOT3BSt+H8NNgRxcpnO5av3w4BOlnFNO2NdTZl6TfG85DI
   DygQzVeAKAVaiwmFVkJU4Ku4ko6asyy1rJs+eKeNjhOKuiv8nwuxNRvJY
   wjzbtm/prrY7T97kOgiaTLDqIIbwakx9OQWp+Rmne8H+4MDOg2lc73BF7
   g==;
X-IronPort-AV: E=Sophos;i="5.96,299,1665439200"; 
   d="scan'208";a="28238216"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 04 Jan 2023 11:27:27 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 235CE280056;
        Wed,  4 Jan 2023 11:27:27 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Marek Vasut <marex@denx.de>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] clk: rs9: Check for vendor/device ID
Date:   Wed, 04 Jan 2023 11:27:26 +0100
Message-ID: <3826066.fW5hKsROvD@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <2ba4e002-9f27-2e36-2bd2-8753c455b21f@denx.de>
References: <20230103123154.3424817-1-alexander.stein@ew.tq-group.com> <2ba4e002-9f27-2e36-2bd2-8753c455b21f@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Am Dienstag, 3. Januar 2023, 15:28:16 CET schrieb Marek Vasut:
> On 1/3/23 13:31, Alexander Stein wrote:
> > This is in preparation to support additional devices which have different
> > IDs as well as a slightly different register layout.
> > 
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > 
> >   drivers/clk/clk-renesas-pcie.c | 24 ++++++++++++++++++++++++
> >   1 file changed, 24 insertions(+)
> > 
> > diff --git a/drivers/clk/clk-renesas-pcie.c
> > b/drivers/clk/clk-renesas-pcie.c index e6247141d0c0..0076ed8f11b0 100644
> > --- a/drivers/clk/clk-renesas-pcie.c
> > +++ b/drivers/clk/clk-renesas-pcie.c
> > @@ -45,6 +45,13 @@
> > 
> >   #define RS9_REG_DID				0x6
> >   #define RS9_REG_BCP				0x7
> > 
> > +#define RS9_REG_VID_IDT				0x01
> > +
> > +#define RS9_REG_DID_TYPE_FGV			(0x0 << 
RS9_REG_DID_TYPE_SHIFT)
> > +#define RS9_REG_DID_TYPE_DBV			(0x1 << 
RS9_REG_DID_TYPE_SHIFT)
> > +#define RS9_REG_DID_TYPE_DMV			(0x2 << 
RS9_REG_DID_TYPE_SHIFT)
> 
> I'm not entirely sure whether this shouldn't be using the BIT() macro,
> what do you think ?

As Geert already pointed out these are not just one-bit values.

> > +#define RS9_REG_DID_TYPE_SHIFT			0x6
> > +
> > 
> >   /* Supported Renesas 9-series models. */
> >   enum rs9_model {
> >   
> >   	RENESAS_9FGV0241,
> > 
> > @@ -54,6 +61,7 @@ enum rs9_model {
> > 
> >   struct rs9_chip_info {
> >   
> >   	const enum rs9_model	model;
> >   	unsigned int		num_clks;
> > 
> > +	u8			did;
> 
> Should this be const (and also the num_clks) ?

Does this make a difference? chip_info in rs9_driver_data is already const, so 
you can't write into it anyway.

> >   };
> >   
> >   struct rs9_driver_data {
> > 
> > @@ -270,6 +278,7 @@ static int rs9_probe(struct i2c_client *client)
> > 
> >   {
> >   
> >   	unsigned char name[5] = "DIF0";
> >   	struct rs9_driver_data *rs9;
> > 
> > +	unsigned int vid, did;
> > 
> >   	struct clk_hw *hw;
> >   	int i, ret;
> > 
> > @@ -306,6 +315,20 @@ static int rs9_probe(struct i2c_client *client)
> > 
> >   	if (ret < 0)
> >   	
> >   		return ret;
> > 
> > +	ret = regmap_read(rs9->regmap, RS9_REG_VID, &vid);
> > +	if (ret < 0)
> > +		return ret;
> 
> Newline here.

Okay, will do.

> > +	ret = regmap_read(rs9->regmap, RS9_REG_DID, &did);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	if ((vid != RS9_REG_VID_IDT) || (did != rs9->chip_info->did)) {
> 
> Drop the unnecessary inner () parenthesis .

Okay, will remove them.

> > +		dev_err(&client->dev,
> 
> return dev_err_probe() might work better here ?

How? This error branch always returns -ENODEV, so no deferred probing will 
occur at all.

Best regards,
Alexander

> > +			"Incorrect VID/DID: %#02x, %#02x. Expected 
%#02x, %#02x\n",
> > +			vid, did, RS9_REG_VID_IDT, rs9->chip_info->did);
> > +		return -ENODEV;
> > +	}
> 
> [...]




