Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93C1D669C9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2019 11:19:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbfGLJT4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Jul 2019 05:19:56 -0400
Received: from mail-eopbgr1410093.outbound.protection.outlook.com ([40.107.141.93]:6127
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725989AbfGLJTz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Jul 2019 05:19:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yswMiyVDYg/7G1Z1ALteY3F0ua6OvH2gZOSIdYt1HDM=;
 b=Y8i5TYJQwSSezVUHwdi15AiE13OnVc+UQz+D8xIz6JcgQ4wgLLxwCcXOEz25335Btmh2gWhA4zVRvBFkwZtXEOt2q+4yl5/+yCaGSf+ZgyWBMc+JSuqdSt8aVkyaLjbu2n3v5l16W18wlAbkaUuSg3oSRT50p9uocrTnxju3YzY=
Received: from OSAPR01MB4529.jpnprd01.prod.outlook.com (20.179.176.20) by
 OSAPR01MB2226.jpnprd01.prod.outlook.com (52.134.235.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.20; Fri, 12 Jul 2019 09:19:48 +0000
Received: from OSAPR01MB4529.jpnprd01.prod.outlook.com
 ([fe80::6c17:80bd:1713:5fcc]) by OSAPR01MB4529.jpnprd01.prod.outlook.com
 ([fe80::6c17:80bd:1713:5fcc%7]) with mapi id 15.20.2073.012; Fri, 12 Jul 2019
 09:19:48 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     Lihua Yao <Lihua.Yao@desay-svautomotive.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Hien Dang <hien.dang.eb@renesas.com>,
        Linh Phung <linh.phung.jy@renesas.com>
Subject: RE: [PATCH] clk: renesas: cpg-mssr: Fix reset control race condition
Thread-Topic: [PATCH] clk: renesas: cpg-mssr: Fix reset control race condition
Thread-Index: AQHVN+khR8N/7lmi1E2fDohgjmSMGabGsnwg
Date:   Fri, 12 Jul 2019 09:19:47 +0000
Message-ID: <OSAPR01MB452973ED58BF61D04962698ED8F20@OSAPR01MB4529.jpnprd01.prod.outlook.com>
References: <20190711130359.1060-1-geert+renesas@glider.be>
In-Reply-To: <20190711130359.1060-1-geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 999a3003-9693-44ed-ca70-08d706aa1611
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSAPR01MB2226;
x-ms-traffictypediagnostic: OSAPR01MB2226:
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-microsoft-antispam-prvs: <OSAPR01MB222673E41418805E0799CAE6D8F20@OSAPR01MB2226.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00963989E5
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(39860400002)(136003)(396003)(346002)(376002)(199004)(189003)(66946007)(53936002)(76116006)(4326008)(6436002)(54906003)(486006)(5660300002)(25786009)(6506007)(446003)(110136005)(3846002)(7736002)(9686003)(14454004)(55016002)(26005)(6116002)(186003)(102836004)(52536014)(6246003)(229853002)(66476007)(66556008)(64756008)(107886003)(86362001)(66446008)(71190400001)(8936002)(99286004)(7696005)(33656002)(476003)(71200400001)(74316002)(2906002)(8676002)(81156014)(81166006)(76176011)(66066001)(11346002)(14444005)(256004)(478600001)(305945005)(316002)(68736007);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB2226;H:OSAPR01MB4529.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: J4Gp3AD3VTukyMzdHhF8bLUJ64sS/rPtHOfjsnyZjhoyqXIu+jg4ZAkK6vnMkwDU6eeHavTzPk9YGdiNA/zIWPZJzSG7ZXOv2TV/HveZ7up3JXLabhR/iZk8obymG6nv0h1rlO/0Muj23brVEYncSWbupjztdW8dBL4PBNWPsGKc14UGm/HKR8u9AI5GbbHzCmVckTjUMDN3ysWpq4Xo49dnBAyaxMN89JxrP5J70EpYUD96utX4TmlxcO3GCpFL1RpFHoSGHHAx9fNLRsDi3EywnegCreXMHEL5IS7jOVob2m6BU2y90PcZIss1vWVU4l83O1gXNxA2Mmrv5Kc7kXV7IToNgMb2NWqQ5QrMOxwDaKFDztWLz6k2sBwS3F7wabmC8aOi4SLJOhg3BRtC+xeqEq2ojlV43p0PEPu7JNM=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 999a3003-9693-44ed-ca70-08d706aa1611
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2019 09:19:47.8607
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2226
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Thursday, July 11, 2019 10:04 PM
>=20
> The module reset code in the Renesas CPG/MSSR driver uses
> read-modify-write (RMW) operations to write to a Software Reset Register
> (SRCRn), and simple writes to write to a Software Reset Clearing
> Register (SRSTCLRn), as was mandated by the R-Car Gen2 and Gen3 Hardware
> User's Manuals.
>=20
> However, this may cause a race condition when two devices are reset in
> parallel: if the reset for device A completes in the middle of the RMW
> operation for device B, device A may be reset again, causing subtle
> failures (e.g. i2c timeouts):
>=20
> 	thread A			thread B
> 	--------			--------
>=20
> 	val =3D SRCRn
> 	val |=3D bit A
> 	SRCRn =3D val
>=20
> 	delay
>=20
> 					val =3D SRCRn (bit A is set)
>=20
> 	SRSTCLRn =3D bit A
> 	(bit A in SRCRn is cleared)
>=20
> 					val |=3D bit B
> 					SRCRn =3D val (bit A and B are set)
>=20
> This can be reproduced on e.g. Salvator-XS using:
>=20
>     $ while true; do i2cdump -f -y 4 0x6A b > /dev/null; done &
>     $ while true; do i2cdump -f -y 2 0x10 b > /dev/null; done &
>=20
>     i2c-rcar e6510000.i2c: error -110 : 40000002
>     i2c-rcar e66d8000.i2c: error -110 : 40000002
>=20
> According to the R-Car Gen3 Hardware Manual Errata for Rev.
> 0.80 of Feb 28, 2018, reflected in Rev. 1.00 of the R-Car Gen3 Hardware
> User's Manual, writes to SRCRn do not require read-modify-write cycles.
>=20
> Note that the R-Car Gen2 Hardware User's Manual has not been updated
> yet, and still says a read-modify-write sequence is required.  According
> to the hardware team, the reset hardware block is the same on both R-Car
> Gen2 and Gen3, though.
>=20
> Hence fix the issue by replacing the read-modify-write operations on
> SRCRn by simple writes.
>=20
> Reported-by: Yao Lihua <Lihua.Yao@desay-svautomotive.com>
> Fixes: 6197aa65c4905532 ("clk: renesas: cpg-mssr: Add support for reset c=
ontrol")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Thank you for the patch! Our test team tested this patch, so

Tested-by: Linh Phung <linh.phung.jy@renesas.com>

> So far I haven't been able to reproduce the issue on R-Car Gen2 (after
> forcing i2c reset on Gen2, too).  Perhaps my Koelsch doesn't have enough
> CPU cores.  What about Lager?

According to the test team, Lager also could not reproduce this issue.
Should we investigate it why?

Best regards,
Yoshihiro Shimoda

> Hi Mike, Stephen,
>=20
> As this is a bugfix, can you please take this directly, if accepted?
>=20
> Thanks!
> ---
>  drivers/clk/renesas/renesas-cpg-mssr.c | 16 ++--------------
>  1 file changed, 2 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas=
/renesas-cpg-mssr.c
> index 52bbb9ce3807db31..d4075b13067429cd 100644
> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -572,17 +572,11 @@ static int cpg_mssr_reset(struct reset_controller_d=
ev *rcdev,
>  	unsigned int reg =3D id / 32;
>  	unsigned int bit =3D id % 32;
>  	u32 bitmask =3D BIT(bit);
> -	unsigned long flags;
> -	u32 value;
>=20
>  	dev_dbg(priv->dev, "reset %u%02u\n", reg, bit);
>=20
>  	/* Reset module */
> -	spin_lock_irqsave(&priv->rmw_lock, flags);
> -	value =3D readl(priv->base + SRCR(reg));
> -	value |=3D bitmask;
> -	writel(value, priv->base + SRCR(reg));
> -	spin_unlock_irqrestore(&priv->rmw_lock, flags);
> +	writel(bitmask, priv->base + SRCR(reg));
>=20
>  	/* Wait for at least one cycle of the RCLK clock (@ ca. 32 kHz) */
>  	udelay(35);
> @@ -599,16 +593,10 @@ static int cpg_mssr_assert(struct reset_controller_=
dev *rcdev, unsigned long id)
>  	unsigned int reg =3D id / 32;
>  	unsigned int bit =3D id % 32;
>  	u32 bitmask =3D BIT(bit);
> -	unsigned long flags;
> -	u32 value;
>=20
>  	dev_dbg(priv->dev, "assert %u%02u\n", reg, bit);
>=20
> -	spin_lock_irqsave(&priv->rmw_lock, flags);
> -	value =3D readl(priv->base + SRCR(reg));
> -	value |=3D bitmask;
> -	writel(value, priv->base + SRCR(reg));
> -	spin_unlock_irqrestore(&priv->rmw_lock, flags);
> +	writel(bitmask, priv->base + SRCR(reg));
>  	return 0;
>  }
>=20
> --
> 2.17.1

