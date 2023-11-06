Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5896B7E1DE4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Nov 2023 11:08:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbjKFKIg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Nov 2023 05:08:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230195AbjKFKIf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Nov 2023 05:08:35 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2104.outbound.protection.outlook.com [40.107.113.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B86FA9;
        Mon,  6 Nov 2023 02:08:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hMPjaxQiOJZ3RDMQZCtOcGs6nWCgsnj5+P0mCF1LdhsUxmksysLdJXb74mUuiBIFGuUfdBr3Vh0Rzf3bXwbFPSftiyT30LeKiGk+ZFsMIugLSiKmnmlXgNhMOoqxjj2iTP2XbBat/S4zcRbL+cZyzTOQlmRo/vrOyhJCU+6dE7aFupSB31suXdXbVWpgKcBTIHtsM7pMPRcsFrK9SKRD0I4DxkFtXNrUUZy6nP5HKtc+4iBi6RU5k91ykznAzdnPf14bNAECWneBOhGRErVUUUmC5Cg/Ess494m3HAH7dbDUHukE2sS7tFTUD19MV5RjwkPP/VpUoN0fF8SRoAGtDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PdPWmnEmO/aI2trxWzx/cqHLnyEocBXxtcQ7HEoISEo=;
 b=lWwiMLurEg5oL+Y2DEPF03oCTrsL60QcWun7bsNUKTvDbjEqoK/BPp9BrVZuuiMly+glOuneB1StgA1P8U1xFmKzx9Bm1dRiK1lVxdxuF3U75CEJw0J5CfudvjsjvauqRzKGsVXSxHNCmeMvErQWvBX/131uaPGJuJg609mcIZqxkPW2G3LZ790gbVmY39pcn6GLGnDJtizh4VebTRHSdzdcMBmWJeJrmLRyZM4BsYxkkb8vy3x2Pa7F/qa4tR8G9ZdPmLBEq/wX371Qrarw5aouUrBcnjCnRjrOGyYV73tEwDjfHqYFNdO2aji/ZzJX/XouXqY90IKTNOD0nOL/Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdPWmnEmO/aI2trxWzx/cqHLnyEocBXxtcQ7HEoISEo=;
 b=M6KH1ga9tz7M3lVQO8cSLO4GldOdhiwv5QUE/kvupORYU0TknLUEon6f53RuXjvwIJDoG+T3Jb8iaFiKSbgcbq4H/b4G8eeBLURNNjYphnkz+2rM5r5vVR64qaz5Mly5ROsu1TTwXnTOCEHntFl7VRht0Aj1yt1k/mxa/dfumNQ=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYTPR01MB11046.jpnprd01.prod.outlook.com
 (2603:1096:400:39a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Mon, 6 Nov
 2023 10:08:27 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6cb:4ed9:b0be:36c0]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6cb:4ed9:b0be:36c0%7]) with mapi id 15.20.6954.027; Mon, 6 Nov 2023
 10:08:27 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>
CC:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/2] clk: rs9: Add support for 9FGV0841
Thread-Topic: [PATCH 2/2] clk: rs9: Add support for 9FGV0841
Thread-Index: AQHaECPdPQT6l/fGpkiP28IxJEXawbBs6czwgAAmMoCAAAFJwA==
Date:   Mon, 6 Nov 2023 10:08:26 +0000
Message-ID: <TYCPR01MB112692504E01464816E9E0F1C86AAA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231105200812.62849-1-marek.vasut+renesas@mailbox.org>
 <20231105200812.62849-2-marek.vasut+renesas@mailbox.org>
 <TYCPR01MB11269765042382E404A16FAB986AAA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <5732995.DvuYhMxLoT@steina-w>
In-Reply-To: <5732995.DvuYhMxLoT@steina-w>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYTPR01MB11046:EE_
x-ms-office365-filtering-correlation-id: 67c0be46-b6cb-4271-0c09-08dbdeb051c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O5NRKR7AuGQfZOXGNvsL3HPKL0t23eAC84P2HyEaPi5w6U+CzJrdqO8T+wDqFc9rXbAim5rgUzuopJOwdNQHBbxY0Une+r4aek+/6dGw3UmGQXUl2WT41PV+3PkDT1eMxdE88E7J2al80E8D94W0M3xK5C9d3IRUTE4Wo02uRsxNuxzlOhzO6fvoeqj6TpI0DHyrjC5ikmA28VNAxfLk4+vrbmvTHAERRjzoh6mImnH/2Nj+V3tAIuUio817s3IZDE1uvv3P00Ikn61UZpPs2DFCDhC+TXxSgvps1h4mTIvVvAUdv9wHOP8JS4HL1/goQNpDdBFgsqeyZsqYJrORs2ef0fKszaA7crU6G9mXxK4FxIbxhizycWDBO1/dLIF4wBEpwKLBnMALPhMgWjCSDaJDI0rzbCAtyKxScjwl5GCsh3A8510uJKvgQqBU7oOBtrngT7MEIVrDk89v9EQduu3AEylto2JQCjebE0lTo6cCfGnjrhJuNgFK3M41PLg7nad6jFV3vDtJotuk6OYjcJe6vKda0wU3eLQFXNY2gWYmkGiQau/c4cdArtuXUtGwvqeaanVmXulAfMVm8uL1hsklTbuVkyuZ2HkFm4sHLs6Byj+48+cBZJ899xJSrT8H
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(39860400002)(136003)(396003)(376002)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(9686003)(316002)(66446008)(66476007)(66556008)(64756008)(76116006)(54906003)(110136005)(66946007)(71200400001)(53546011)(26005)(7696005)(6506007)(38070700009)(38100700002)(83380400001)(122000001)(33656002)(86362001)(478600001)(2906002)(52536014)(5660300002)(4326008)(41300700001)(8676002)(8936002)(7416002)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XoS6AHp1zMfZOjg5yZcGKkj7h8/RNCA8UQsRf4W4kJwzHBlpBlCqOn2fObx1?=
 =?us-ascii?Q?0rI+RAgyPRffPhmSbbO4OGDDv+iQ+6c2o28+fq22aHjUv0GyrqPXPOpGz16V?=
 =?us-ascii?Q?8DM8+lZE/YSR0XM7luRfLzeAeTPwqQ8eIV16p13WIRLygEVlgvHKlkWoGWsj?=
 =?us-ascii?Q?QcJi4n2I+Mb20D5i5U920/WqDvNSgy5CA5BM4qT52spm7Dq89v9/rrsf53SW?=
 =?us-ascii?Q?c7ta2gFpmLDx0ndHRB4vU5fiCgvANcGOtJ8RvJIJ/I4Ou2PSfOGtd/CCjvA6?=
 =?us-ascii?Q?C6PGuEPUQMkcf2Jhe+lHepdkVnLQ9HkXV41BsAswBraY932n0zfovpzCqzDm?=
 =?us-ascii?Q?BELHUTXnor+PO59SCSlitGpHDLeR90dBpHkf4DX5tKjyMNU6s8uyCRj2Tf5V?=
 =?us-ascii?Q?SvFpIPHkT37u0u4axZLJRgEKB9/ttL27+M+O2sNCNfoB8OfooDGj6PT6vD/8?=
 =?us-ascii?Q?xh3qbIUg5JYeoaun1dryWBRLoKZdO1w5lVcWyGW5ctmeotz2ImTWaXS8rlni?=
 =?us-ascii?Q?b0yXV7uZZjFu48Wtx/PWGnFm6AN/smbBtPiUccarq57bYvCt2ele5qlZAll6?=
 =?us-ascii?Q?PTHEvlARdPZ0I6X//QprksAai1NWsf+2d7VGJar1HpqmuzE6xYMWpn1ZLD1S?=
 =?us-ascii?Q?+DDD2fAS42sneXogD2PNRXG5NdUUWqjwl7VcAO/WTUoQ7pe8rPZbt9y2v0FS?=
 =?us-ascii?Q?AS8yKbKrZdHJhZ1DdVzEhb3jqLN5gO7xgNiI+KOzz6uGsvE4fZaKe/PyACke?=
 =?us-ascii?Q?r0xi2eQXLEQRsrq8Qpvw1tgRqPeq47XjhcudtQYEcPUuKOkg7VKy/isJ6hSh?=
 =?us-ascii?Q?yoBKh6x+6cdekfhn6mM6nDc5hiWncVYFOSUr83rdknv5d8x//zBhk2GcNNqg?=
 =?us-ascii?Q?4cX0GHihN1vOX9EFQZmdfoedDvpeExfcGZLvvwMwdRIdpOnM9mcorUMYRFTT?=
 =?us-ascii?Q?2LYon+alDjrLgOvCHflWX502u1bMypEiYhjg3LXpIcgRjiBzPwqdzw0VYtkw?=
 =?us-ascii?Q?AUTnKZClN43nvxWikI+WBt8AKQrkzvmQK9cOiLwF8k8yFxoriTnHV9M3mjR8?=
 =?us-ascii?Q?8w6NRkf3zywpyn1ZKOP3UkxKS0hXl0hIvcXgpXLIOkTR21xqnkwfkNKs6JdS?=
 =?us-ascii?Q?/bfbnkjrOQAKMS5cM2PjasD0uW4DWKnuE1AaR+gY96mdMZ6bKsRWQS9a1Kc2?=
 =?us-ascii?Q?14P0ACizDqUa/AMq2k/zxtob+yPe6PsvMVW7vYf9/xV1HsNvjhfePfmOJ35j?=
 =?us-ascii?Q?ZgK69vdBGpq2+InHxXdDm/du+aCYO3E/bWUe358UAPYP0uw73abDYoNRw91R?=
 =?us-ascii?Q?iRyQotqeXsvREutQ/eZfM4rUVk1gEcREx/GYehCXuC/POlfVPIBYc6za1FdZ?=
 =?us-ascii?Q?ffD8OhcoDGHPxIz6mjjftWYnJIMPDvXyPeOkRE4dXb9BjsBqAcVKdFWQ9g0u?=
 =?us-ascii?Q?UBkF6wdE4ScRG6TX5K33rfaH0lecDhTMEiOaeNOuMQ4VPhqWj8WhHWKSWowK?=
 =?us-ascii?Q?liKiMckdLwVcfnmJVLGvw3oM+8Ipe1w7/2XUkLprsrwjOuw5gwPhF3iO0ROb?=
 =?us-ascii?Q?d1U8lHDypGozZo1nH4xJlh/MPGA+c2Nq42PQORGhC0PIq0c8o7BIdQUlDnGG?=
 =?us-ascii?Q?YQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67c0be46-b6cb-4271-0c09-08dbdeb051c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2023 10:08:26.9877
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5xLBdBI5y1PEbW9cToQO8MnoMMddCzedSbOXXnNSk5cNj46LQ3WiNDofU4xUs9CUD4ky42eFfey82dWyIAGncAP392RwRaPhIeQaX+QCjA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTPR01MB11046
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Alexander Stein,

> -----Original Message-----
> From: Alexander Stein <alexander.stein@ew.tq-group.com>
> Subject: Re: [PATCH 2/2] clk: rs9: Add support for 9FGV0841
>=20
> Hi,
>=20
> Am Montag, 6. November 2023, 08:49:10 CET schrieb Biju Das:
> > Hi Marek,
> >
> > Thanks for the patch.
> >
> > > -----Original Message-----
> > > From: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > > Sent: Sunday, November 5, 2023 8:08 PM
> > > Subject: [PATCH 2/2] clk: rs9: Add support for 9FGV0841
> > >
> > > This model is similar to 9FGV0441, the DIFx bits start at bit 0
> > > again, except this chip has 8 outputs. Adjust rs9_calc_dif() to
> > > special-case the
> > > 9FGV0241 where DIFx bits start at 1. Extract only vendor ID from VID
> > > register, the top 4 bits are revision ID which are not useful for
> > > the vendor ID check.
> > >
> > > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > > ---
> > > Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > Cc: Conor Dooley <conor+dt@kernel.org>
> > > Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> > > Cc: Michael Turquette <mturquette@baylibre.com>
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > Cc: Stephen Boyd <sboyd@kernel.org>
> > > Cc: devicetree@vger.kernel.org
> > > Cc: linux-clk@vger.kernel.org
> > > Cc: linux-renesas-soc@vger.kernel.org
> > > ---
> > >
> > >  drivers/clk/clk-renesas-pcie.c | 23 +++++++++++++++++++----
> > >  1 file changed, 19 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/clk/clk-renesas-pcie.c
> > > b/drivers/clk/clk-renesas- pcie.c index 6606aba253c5..f8dd79b18d5a
> > > 100644
> > > --- a/drivers/clk/clk-renesas-pcie.c
> > > +++ b/drivers/clk/clk-renesas-pcie.c
> > > @@ -7,6 +7,7 @@
> > >
> > >   * Currently supported:
> > >   *   - 9FGV0241
> > >   *   - 9FGV0441
> > >
> > > + *   - 9FGV0841
> > >
> > >   *
> > >   * Copyright (C) 2022 Marek Vasut <marex@denx.de>
> > >   */
> > >
> > > @@ -42,6 +43,7 @@
> > >
> > >  #define RS9_REG_DID				0x6
> > >  #define RS9_REG_BCP				0x7
> > >
> > > +#define RS9_REG_VID_MASK			GENMASK(3, 0)
> > >
> > >  #define RS9_REG_VID_IDT				0x01
> > >
> > >  #define RS9_REG_DID_TYPE_FGV			(0x0 <<
> RS9_REG_DID_TYPE_SHIFT)
> > >
> > > @@ -53,6 +55,7 @@
> > >
> > >  enum rs9_model {
> > >
> > >  	RENESAS_9FGV0241,
> > >  	RENESAS_9FGV0441,
> > >
> > > +	RENESAS_9FGV0841,
> > >
> > >  };
> > >
> > >  /* Structure to describe features of a particular 9-series model */
> > > @@ -
> > >
> > > 162,12 +165,15 @@ static u8 rs9_calc_dif(const struct
> > > rs9_driver_data *rs9, int idx)  {
> > >
> > >  	enum rs9_model model =3D rs9->chip_info->model;
> > >
> > > +	/*
> > > +	 * On 9FGV0241, the DIF OE0 is BIT(1) and DIF OE(1) is BIT(2),
> > > +	 * on 9FGV0441 and 9FGV0841 the DIF OE0 is BIT(0) and so on.
> > > +	 * Increment the index in the 9FGV0241 special case here.
> > > +	 */
> >
> > I guess model enum variable in struct rs9_chip_info can be replaced
> > with a variable for the above hardware differences(eg: BIT(idx) value
> > in struct
> > rs9_chip_inf) . Then you don't need this function at all.
>=20
> That's true for 9FGV family. If support for 9QXL family will ever be adde=
d
> (the header claims the support can be added), this enum is required again
> as the register model is completely different.


I may be wrong, Still all the hw differences can be handled by feature, dat=
a and functions in
struct rs9_chip_info. You don't need comparison with model all over the pla=
ces.

Cheers,
Biju


>=20
> Best regards,
> Alexander
>=20
> > Cheers,
> > Biju
> >
> > >  	if (model =3D=3D RENESAS_9FGV0241)
> > >
> > > -		return BIT(idx + 1);
> > > -	else if (model =3D=3D RENESAS_9FGV0441)
> > > -		return BIT(idx);
> > > +		idx++;
> > >
> > > -	return 0;
> > > +	return BIT(idx);
> > >
> > >  }
> > >
> > >  static int rs9_get_output_config(struct rs9_driver_data *rs9, int
> > > idx) @@
> > >
> > > -333,6 +339,7 @@ static int rs9_probe(struct i2c_client *client)
> > >
> > >  	if (ret < 0)
> > >
> > >  		return ret;
> > >
> > > +	vid &=3D RS9_REG_VID_MASK;
> > >
> > >  	if (vid !=3D RS9_REG_VID_IDT || did !=3D rs9->chip_info->did)
> > >
> > >  		return dev_err_probe(&client->dev, -ENODEV,
> > >
> > >  				     "Incorrect VID/DID: %#02x, %#02x.
> > >
> > > Expected %#02x, %#02x\n", @@ -391,9 +398,16 @@ static const struct
> > > rs9_chip_info renesas_9fgv0441_info =3D {
> > >
> > >  	.did		=3D RS9_REG_DID_TYPE_FGV | 0x04,
> > >
> > >  };
> > >
> > > +static const struct rs9_chip_info renesas_9fgv0841_info =3D {
> > > +	.model		=3D RENESAS_9FGV0841,
> > > +	.num_clks	=3D 8,
> > > +	.did		=3D RS9_REG_DID_TYPE_FGV | 0x08,
> > > +};
> > > +
> > >
> > >  static const struct i2c_device_id rs9_id[] =3D {
> > >
> > >  	{ "9fgv0241", .driver_data =3D
> > >
> > > (kernel_ulong_t)&renesas_9fgv0241_info },
> > >
> > >  	{ "9fgv0441", .driver_data =3D
> > >
> > > (kernel_ulong_t)&renesas_9fgv0441_info },
> > > +	{ "9fgv0841", .driver_data =3D
> > > (kernel_ulong_t)&renesas_9fgv0841_info },
> > >
> > >  	{ }
> > >
> > >  };
> > >  MODULE_DEVICE_TABLE(i2c, rs9_id);
> > >
> > > @@ -401,6 +415,7 @@ MODULE_DEVICE_TABLE(i2c, rs9_id);  static const
> > > struct of_device_id clk_rs9_of_match[] =3D {
> > >
> > >  	{ .compatible =3D "renesas,9fgv0241", .data =3D
> > >
> > > &renesas_9fgv0241_info },
> > >
> > >  	{ .compatible =3D "renesas,9fgv0441", .data =3D
> > >
> > > &renesas_9fgv0441_info },
> > > +	{ .compatible =3D "renesas,9fgv0841", .data =3D
> > > &renesas_9fgv0841_info },
> > >
> > >  	{ }
> > >
> > >  };
> > >  MODULE_DEVICE_TABLE(of, clk_rs9_of_match);
> > >
> > > --
> > > 2.42.0
>=20
