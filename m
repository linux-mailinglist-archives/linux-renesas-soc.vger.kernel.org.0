Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6C877E1DC6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Nov 2023 11:01:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbjKFKBC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Nov 2023 05:01:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229974AbjKFKBB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Nov 2023 05:01:01 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D41EA6;
        Mon,  6 Nov 2023 02:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1699264858; x=1730800858;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OIDyp/g50d55txnxogYWipBT01q6u2+t7gX+4MtqKDA=;
  b=ccw0qAUHwFuNap7kh6kWh22G/7t1RJf7S4oSLQblRChYHFNOkClihHkQ
   FlLUQlLMSzvuNPzJ/lJFKrwOeUFK9jHUnjHtiPVvB5HynrS5haPbEdZA7
   ijeSX13cFEnlX4ASR4LO0UIhryz0MVzhq0g4KNg2QW0RVbdjVqbYDLIW1
   lYwdARl0Cwq2TT7/dDQ81xDyeo60l6Yn6W2N5NYREmzvb0gHb1JIqW3l0
   N/9wxlbXtegFSofgCdNQ2xvDJ1i/G2Atoqepx2KhRVhmDXwWDWeEUOJX6
   +Ovzmz4KwaGfN8pmFW6V8om8UkEHnl/vQRf3gpV+GEmXzpuyCNQdeHIxF
   A==;
X-IronPort-AV: E=Sophos;i="6.03,281,1694728800"; 
   d="scan'208";a="33823323"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 06 Nov 2023 11:00:55 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 7F70428007F;
        Mon,  6 Nov 2023 11:00:55 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 2/2] clk: rs9: Add support for 9FGV0841
Date:   Mon, 06 Nov 2023 11:00:57 +0100
Message-ID: <5732995.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <TYCPR01MB11269765042382E404A16FAB986AAA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231105200812.62849-1-marek.vasut+renesas@mailbox.org> <20231105200812.62849-2-marek.vasut+renesas@mailbox.org> <TYCPR01MB11269765042382E404A16FAB986AAA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

Am Montag, 6. November 2023, 08:49:10 CET schrieb Biju Das:
> Hi Marek,
>=20
> Thanks for the patch.
>=20
> > -----Original Message-----
> > From: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > Sent: Sunday, November 5, 2023 8:08 PM
> > Subject: [PATCH 2/2] clk: rs9: Add support for 9FGV0841
> >=20
> > This model is similar to 9FGV0441, the DIFx bits start at bit 0 again,
> > except this chip has 8 outputs. Adjust rs9_calc_dif() to special-case t=
he
> > 9FGV0241 where DIFx bits start at 1. Extract only vendor ID from VID
> > register, the top 4 bits are revision ID which are not useful for the
> > vendor ID check.
> >=20
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > ---
> > Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-clk@vger.kernel.org
> > Cc: linux-renesas-soc@vger.kernel.org
> > ---
> >=20
> >  drivers/clk/clk-renesas-pcie.c | 23 +++++++++++++++++++----
> >  1 file changed, 19 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-
> > pcie.c index 6606aba253c5..f8dd79b18d5a 100644
> > --- a/drivers/clk/clk-renesas-pcie.c
> > +++ b/drivers/clk/clk-renesas-pcie.c
> > @@ -7,6 +7,7 @@
> >=20
> >   * Currently supported:
> >   *   - 9FGV0241
> >   *   - 9FGV0441
> >=20
> > + *   - 9FGV0841
> >=20
> >   *
> >   * Copyright (C) 2022 Marek Vasut <marex@denx.de>
> >   */
> >=20
> > @@ -42,6 +43,7 @@
> >=20
> >  #define RS9_REG_DID				0x6
> >  #define RS9_REG_BCP				0x7
> >=20
> > +#define RS9_REG_VID_MASK			GENMASK(3, 0)
> >=20
> >  #define RS9_REG_VID_IDT				0x01
> > =20
> >  #define RS9_REG_DID_TYPE_FGV			(0x0 <<=20
RS9_REG_DID_TYPE_SHIFT)
> >=20
> > @@ -53,6 +55,7 @@
> >=20
> >  enum rs9_model {
> > =20
> >  	RENESAS_9FGV0241,
> >  	RENESAS_9FGV0441,
> >=20
> > +	RENESAS_9FGV0841,
> >=20
> >  };
> > =20
> >  /* Structure to describe features of a particular 9-series model */ @@=
 -
> >=20
> > 162,12 +165,15 @@ static u8 rs9_calc_dif(const struct rs9_driver_data
> > *rs9, int idx)  {
> >=20
> >  	enum rs9_model model =3D rs9->chip_info->model;
> >=20
> > +	/*
> > +	 * On 9FGV0241, the DIF OE0 is BIT(1) and DIF OE(1) is BIT(2),
> > +	 * on 9FGV0441 and 9FGV0841 the DIF OE0 is BIT(0) and so on.
> > +	 * Increment the index in the 9FGV0241 special case here.
> > +	 */
>=20
> I guess model enum variable in struct rs9_chip_info can be replaced with a
> variable for the above hardware differences(eg: BIT(idx) value in struct
> rs9_chip_inf) . Then you don't need this function at all.

That's true for 9FGV family. If support for 9QXL family will ever be added=
=20
(the header claims the support can be added), this enum is required again a=
s=20
the register model is completely different.

Best regards,
Alexander

> Cheers,
> Biju
>=20
> >  	if (model =3D=3D RENESAS_9FGV0241)
> >=20
> > -		return BIT(idx + 1);
> > -	else if (model =3D=3D RENESAS_9FGV0441)
> > -		return BIT(idx);
> > +		idx++;
> >=20
> > -	return 0;
> > +	return BIT(idx);
> >=20
> >  }
> > =20
> >  static int rs9_get_output_config(struct rs9_driver_data *rs9, int idx)=
 @@
> >=20
> > -333,6 +339,7 @@ static int rs9_probe(struct i2c_client *client)
> >=20
> >  	if (ret < 0)
> >  =09
> >  		return ret;
> >=20
> > +	vid &=3D RS9_REG_VID_MASK;
> >=20
> >  	if (vid !=3D RS9_REG_VID_IDT || did !=3D rs9->chip_info->did)
> >  =09
> >  		return dev_err_probe(&client->dev, -ENODEV,
> >  	=09
> >  				     "Incorrect VID/DID: %#02x, %#02x.
> >=20
> > Expected %#02x, %#02x\n", @@ -391,9 +398,16 @@ static const struct
> > rs9_chip_info renesas_9fgv0441_info =3D {
> >=20
> >  	.did		=3D RS9_REG_DID_TYPE_FGV | 0x04,
> > =20
> >  };
> >=20
> > +static const struct rs9_chip_info renesas_9fgv0841_info =3D {
> > +	.model		=3D RENESAS_9FGV0841,
> > +	.num_clks	=3D 8,
> > +	.did		=3D RS9_REG_DID_TYPE_FGV | 0x08,
> > +};
> > +
> >=20
> >  static const struct i2c_device_id rs9_id[] =3D {
> > =20
> >  	{ "9fgv0241", .driver_data =3D
> >=20
> > (kernel_ulong_t)&renesas_9fgv0241_info },
> >=20
> >  	{ "9fgv0441", .driver_data =3D
> >=20
> > (kernel_ulong_t)&renesas_9fgv0441_info },
> > +	{ "9fgv0841", .driver_data =3D
> > (kernel_ulong_t)&renesas_9fgv0841_info },
> >=20
> >  	{ }
> > =20
> >  };
> >  MODULE_DEVICE_TABLE(i2c, rs9_id);
> >=20
> > @@ -401,6 +415,7 @@ MODULE_DEVICE_TABLE(i2c, rs9_id);  static const str=
uct
> > of_device_id clk_rs9_of_match[] =3D {
> >=20
> >  	{ .compatible =3D "renesas,9fgv0241", .data =3D
> >=20
> > &renesas_9fgv0241_info },
> >=20
> >  	{ .compatible =3D "renesas,9fgv0441", .data =3D
> >=20
> > &renesas_9fgv0441_info },
> > +	{ .compatible =3D "renesas,9fgv0841", .data =3D
> > &renesas_9fgv0841_info },
> >=20
> >  	{ }
> > =20
> >  };
> >  MODULE_DEVICE_TABLE(of, clk_rs9_of_match);
> >=20
> > --
> > 2.42.0


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


