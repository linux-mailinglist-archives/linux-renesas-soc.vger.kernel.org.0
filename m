Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC56F65D0AF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jan 2023 11:32:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234483AbjADKch (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Jan 2023 05:32:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234333AbjADKcf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Jan 2023 05:32:35 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3E0D95BE;
        Wed,  4 Jan 2023 02:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1672828354; x=1704364354;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ag5rlRoVANH4ZBzlzlE6lTj3OJTl7mId4PLIYfPay1Y=;
  b=JHL8jl2d0L/js5BAvrK6AVv63adw9ogqozaK7fckAR8NySi3AGTYJ+r2
   SiL1XDSoFuOlM2W3QS5BP5fPzTnfT5VQwEPkgNYiWD79t4YKCl+Y+G6YG
   2m1HPnRT+4gMha6XuPWvh1AJJzpk5gpzhBB2oz2y53ejKDp2WyPLQtVYb
   she/HzYN2BjqWmsO4mP2MsL+iCVNMMxf6hkjmnNRgh42wURuyr6ib8SOA
   68OPS13FJF693cyWr5ddZ8wvMKfGMob9PoGKSy/GVDsdyn+ZnvlX4qoYv
   dsOSEVBU+I8MHNP+vW2L1XGUUbN/N7j2prn/xw0jR6mug3Mfo9pwNSOJj
   g==;
X-IronPort-AV: E=Sophos;i="5.96,299,1665439200"; 
   d="scan'208";a="28238335"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 04 Jan 2023 11:32:32 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 04 Jan 2023 11:32:32 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 04 Jan 2023 11:32:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1672828352; x=1704364352;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ag5rlRoVANH4ZBzlzlE6lTj3OJTl7mId4PLIYfPay1Y=;
  b=Ck/ykvIHWW8c94aweQ3nmzsuS24QL0M6C76YwhX1nAFN2ZgAMsCVFdeQ
   Wj9jXrK6tYEtZyLypA+iW8sPOEFqFChTMakyok92xDmJltsgy2mf/HsC5
   cyV2eOgvS6W675qH7JTWExE9MhMqLykhn3ua/OcOYwq03ViHdCkYdVVLq
   XYNmonq3ZmbCXFJKlKJxSimhMQ5w8eQV6OkNSyQsonENvxeXXvxa0piUE
   4UgMa0jB8u8FQgbPd8LwsW7c6gJDjzqU8bYQHNCqYunNvi3utICetbU8x
   V8VFyf2g9Rmcvs6DZYZFDGfsnHyu3UmVJk/Jww3MGpgx2dAD/hWJ287aF
   w==;
X-IronPort-AV: E=Sophos;i="5.96,299,1665439200"; 
   d="scan'208";a="28238334"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 04 Jan 2023 11:32:32 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id F054E280056;
        Wed,  4 Jan 2023 11:32:31 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Marek Vasut <marex@denx.de>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: rs9: Support device specific dif bit calculation
Date:   Wed, 04 Jan 2023 11:32:31 +0100
Message-ID: <5905764.31tnzDBltd@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <8e9cc8fa-cddc-3c99-9810-f2355a1e1913@denx.de>
References: <20230103123154.3424817-1-alexander.stein@ew.tq-group.com> <20230103123154.3424817-3-alexander.stein@ew.tq-group.com> <8e9cc8fa-cddc-3c99-9810-f2355a1e1913@denx.de>
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

Hi Marek,

Am Dienstag, 3. Januar 2023, 15:31:21 CET schrieb Marek Vasut:
> On 1/3/23 13:31, Alexander Stein wrote:
> > The calculation DIFx is BIT(n) +1 is only true for 9FGV0241. With
> > additional devices this is getting more complicated.
> > Support a base bit for the DIF calculation, currently only devices
> > with consecutive bits are supported, e.g. the 6-channel device needs
> > additional logic.
> > 
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > 
> >   drivers/clk/clk-renesas-pcie.c | 29 ++++++++++++++++-------------
> >   1 file changed, 16 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/clk/clk-renesas-pcie.c
> > b/drivers/clk/clk-renesas-pcie.c index 0076ed8f11b0..d19b8e759eea 100644
> > --- a/drivers/clk/clk-renesas-pcie.c
> > +++ b/drivers/clk/clk-renesas-pcie.c
> > @@ -18,7 +18,6 @@
> > 
> >   #include <linux/regmap.h>
> >   
> >   #define RS9_REG_OE				0x0
> > 
> > -#define RS9_REG_OE_DIF_OE(n)			BIT((n) + 1)
> > 
> >   #define RS9_REG_SS				0x1
> >   #define RS9_REG_SS_AMP_0V6			0x0
> >   #define RS9_REG_SS_AMP_0V7			0x1
> > 
> > @@ -31,9 +30,6 @@
> > 
> >   #define RS9_REG_SS_SSC_MASK			(3 << 3)
> >   #define RS9_REG_SS_SSC_LOCK			BIT(5)
> >   #define RS9_REG_SR				0x2
> > 
> > -#define RS9_REG_SR_2V0_DIF(n)			0
> > -#define RS9_REG_SR_3V0_DIF(n)			BIT((n) + 1)
> > -#define RS9_REG_SR_DIF_MASK(n)		BIT((n) + 1)
> > 
> >   #define RS9_REG_REF				0x3
> >   #define RS9_REG_REF_OE				BIT(4)
> >   #define RS9_REG_REF_OD				BIT(5)
> > 
> > @@ -62,6 +58,7 @@ struct rs9_chip_info {
> > 
> >   	const enum rs9_model	model;
> >   	unsigned int		num_clks;
> >   	u8			did;
> > 
> > +	u8			(*calc_dif)(int idx);
> > 
> >   };
> >   
> >   struct rs9_driver_data {
> > 
> > @@ -160,8 +157,14 @@ static const struct regmap_config rs9_regmap_config =
> > {> 
> >   	.reg_read = rs9_regmap_i2c_read,
> >   
> >   };
> > 
> > +static u8 rs9fgv0241_calc_dif(int idx)
> > +{
> > +	return BIT(idx) + 1;
> 
> Can't we just do
> 
> if (model == ...)
>   return BIT(idx) + 1
> else if (model == ...)
>   return BIT(idx);
> ...

I was tempted going this way. But I opted for a callback due to the fact that 
this driver might support 9FGV/9DBV/9DMV/9FGL/9DML/9QXL/9SQ as well(your 
comment in the header).
Even just considering 9FVG, 9FGV0641 has an even more complex DIF offset 
calculation. 
The mapping is
* DIF OE0 - Bit 0
* DIF OE1 - Bit 2
* DIF OE2 - Bit 3
* DIF OE3 - Bit 4
* DIF OE4 - Bit 6
* DIF OE5 - Bit 7

So the calucation might not fit into one line, so the readability benefit is 
gone.

Best regards,
Alexander


