Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E94E3423E38
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Oct 2021 14:53:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232217AbhJFMzh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 Oct 2021 08:55:37 -0400
Received: from mail-eopbgr1400110.outbound.protection.outlook.com ([40.107.140.110]:19919
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231259AbhJFMzh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Oct 2021 08:55:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a2flIsrTtIOZSH/LtlbMKk45+rTYypzN/GBRHyfOAYANHexJ8IFeW3m4bWAV72mpOv/1XHuFzSG8UCYzOMCUiMgLUzHQ9/WBN5E8kB+qJtvm/QXnaedtd4iG9A6e935iBQXQvviZqAQlYxQZqwiAJ39C4srmGgr7NDRjqGO4S9kR/771HwdEBi1ej5Dg5uMoRBJjxqSZfjWtxR/wnszHcTfGrGSIw9MRh0JftVeSUSvGy3OCaTl0L2URDS7/giOt/FwiR1Y91XFPyBIl0hk/+XTptZqQAJCmoy/OhXEKU4ypkX/UBfL4kvmpXDGQjYYQVk8Q4ByEtzcpHTmiqpe/Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYxLVqNFveWrmTmb2wcCJvXo8JrBOcQkQmdTSuJf6Qk=;
 b=UMJNDJgDoSOmLsZu8JGFzuyEaot8Pjio6UnKqww6CT5NKpQo8GVWoY1Qozovysr9K2c1ZPAMrb4tPmHfOTEPlc/+SpStg6vp4bxofGcZnm4HFrqgWI1twQHGwzKRcw6awIyVbE8mWU1WiZW6ueUckj+FY+AWBfgPSlRPeOBRLKSFchMpWJT4eQanBaP5GnfYksweHy0oo9q/fvvJLNYNN4wvAoHRgzxz8rFAgp4PhHvL3cvfij12w9vu6FU86IkFvEdWb1OFevY1KzGIBq5oiWSf+iaTC+mRREhpTBmxaRnPd57to+d/SAuUPd7gMsJ9lO2HcqBF9/AI1PmOlzm2sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYxLVqNFveWrmTmb2wcCJvXo8JrBOcQkQmdTSuJf6Qk=;
 b=gi4rwyJk0POMVwqVHQKlccCF6JXOKNoS5JRYJuVbbrWRIDmGTNOVVUawRX8Zodr388PkjqiwhAeDeqLHbBUdzYpqyNe3BWn3SKYm2L7U4tl/PijuwZWDbsBPfMEVQ8zo3ibb7o4EKEnDZJzoav+1LqrFTq8UxLdjIsTBsOO27vM=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB1943.jpnprd01.prod.outlook.com (2603:1096:603:23::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Wed, 6 Oct
 2021 12:53:43 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9ca6:1cf:5:9fc1]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9ca6:1cf:5:9fc1%3]) with mapi id 15.20.4587.018; Wed, 6 Oct 2021
 12:53:43 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: RE: [PATCH] mmc: renesas_sdhi: fix regression with hard reset on old
 SDHIs
Thread-Topic: [PATCH] mmc: renesas_sdhi: fix regression with hard reset on old
 SDHIs
Thread-Index: AQHXmlNVs4LNmIzCAkCmNj25qUqILavE3GMAgAFNm3CAAAMKAA==
Date:   Wed, 6 Oct 2021 12:53:43 +0000
Message-ID: <OS0PR01MB5922BFD462F4D2A3AB82F5B386B09@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210826082107.47299-1-wsa+renesas@sang-engineering.com>
 <OS0PR01MB5922BA32F4FB02E3390781DD86AF9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB59224A73CA29E3D07CD2F0C486B09@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59224A73CA29E3D07CD2F0C486B09@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bp.renesas.com; dkim=none (message not signed)
 header.d=none;bp.renesas.com; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c104966-1ee8-4be1-c3ef-08d988c85400
x-ms-traffictypediagnostic: OSBPR01MB1943:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB194368D4EBFF269F7CC8649786B09@OSBPR01MB1943.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TRNPadIbK2oJWNiHSNY14hCXoOUJlditNFFwbRNigHQEkd+Hz3w3tph0dePpkq5SaClzj/pyKBknpociF3bai8Uc4EuKI0jM9B1254drrixnd6BpD8i9MZ8cWfPL3aT2A/l8xaEVs/5jgCnJOYCwOqi0JfS3caiceKZ25YwfJPZZgg9J0a7WTDbw1HK5RuUwR5A63I0/QAfMkyLH2XlzkMkvsCKstQY7fV9YTX3+IB0dGrZdGXKYJbje4VrNf5AjQuefHtAReDcUImWSZtMuK/KdRHtP/wzIpHva38Wic4JKa5N+SeYN5FRMcBwol/Qh1Lg3x6kj61yh4mWhAAiVRXTfgr7zG47ne+cN5Juv4vK7CGMtY9JOnTIFocAqIF1QCTV8Vp0BUXu6RfDDABRbcETyk0DtfVlDcXX0rMokm9+c4JK3tg5zUAKBdz8CVT+UcUukpVmv1bzLubUxcjNk5j9zY99cfM8isyIPNX83AWtXXZGf+iMOtNibox/F8jIOZGZ4B7ptIw3HLbG6rOD6Bx4qHn/2n4wLkxrXx6L2u/Cpjy2wdfw6bzKsWfxUjLmlZwgQWRMCGom1/mev8I0TiVFj6D+GkH2DZv5X+Uunwl7/eIpfU2Ae45KBPffy/DHSXKCbIn9dSlskt9dpJ4pPvcyppmGhrKOF2DNMM7wx37CWJjejpsSmjz1FDIrvjdR9WrGu/WSNbdVh+tPisjXOXQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2940100002)(6506007)(53546011)(8936002)(316002)(38100700002)(110136005)(54906003)(122000001)(33656002)(86362001)(38070700005)(9686003)(83380400001)(8676002)(55016002)(186003)(5660300002)(26005)(7696005)(4326008)(76116006)(71200400001)(66556008)(66476007)(2906002)(508600001)(66946007)(64756008)(66446008)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?I1+R6XrySEkS8gaTo+/khJMcUsYbMmSYKT3cbwCyNlK7wKuQWM7XMGFm3MZ3?=
 =?us-ascii?Q?NVTaYXGzJPNjF+MkxcUhNMDzjD/vtymK+fw9B0/rLqfrAXif4Y56tGX0YmhX?=
 =?us-ascii?Q?aKOyq234oZBoFVMPtfhIyxaKBcYgTtpDEnnRgE426mrzm5GEyKWSSXWteNBo?=
 =?us-ascii?Q?HSq/9HfeLlbNvDubPwh1sqsFqV3YajCygD48vDkitYaWJbEfs2ZvqNPhEjUW?=
 =?us-ascii?Q?LbSEMC9G0fPH6AmWJiFuHZdpDHZp5akv716Js2LD5WXnGjG8x4oZrpsB+qM9?=
 =?us-ascii?Q?QtklKgjVPZXvaey1Lrb7MYNNvthcnjQoWlxsOHfhYR3qp31Ct1CzTMoTGeAj?=
 =?us-ascii?Q?Wq9Sc6I86c1CO8YanKvwHdtJsElfPSKdxF3mmWSAO0Rpujtl7EMq8E1msZW7?=
 =?us-ascii?Q?E1ci8YBaLqBPXBzN4/kR35cexpA6NArOM45GGbayvKIMeRawLaQu591Bmc5+?=
 =?us-ascii?Q?PMgEhVCZ5OibL9rLPgdShow7p/LSyeYjuXVNDl2JYCnK1NaMjk3cCcY2gvU9?=
 =?us-ascii?Q?QKHwJmQm0A8yOn1WsJxpyEjOuNIp7z++cFcZOdoevygAgGmxE2VJdaG7RIpi?=
 =?us-ascii?Q?+gQUoj6/Zj9mQp2dBR9rNLOJydQX0HOBxwq9whB7ovfh7RVcgUDafdAwArAr?=
 =?us-ascii?Q?x+4qbMnhKkpBQbabf3NRRyMi1okMwvKoaiVCq+1he3T4Vf3oUvmYRES8Je5i?=
 =?us-ascii?Q?bsHplLGyTL/2iLbXZRkl0E2j5XhFbo3pZ0z3ovCWyYBc/1UesmEIHhHM334G?=
 =?us-ascii?Q?cH8lNbkP6eYrd+gPjRid64IpWx+yNKf8dlPIOWFAsiJl+2lAHepvlzG8PIwo?=
 =?us-ascii?Q?/J4VdeymaZj09KTZGkNQlJo3w2oGDYpeux6cjFKAmI9/nX5ymAe5ZA3HHF/R?=
 =?us-ascii?Q?hVsU4CkEN2ybkdggl0oFK8aIM6/v0WkbqvEMDT79q4wj232IWGa6oKZ6vVIM?=
 =?us-ascii?Q?pom6tRK9M5pE9dVxVoGf93WNu0LNCkilcyfggXVWZMzOqACHuJoB3rvmRIfr?=
 =?us-ascii?Q?aMGS5+BC8oG8u0vTLmxQTv6pg+ApUrZeotKvLF1GrnkE/XkhJ6VybyPild6C?=
 =?us-ascii?Q?TEyLIHFy+g1yH2zfx0IRPm+3G8S50dTDzyhTEgZ9SfRinkTIGzVJfEFqCRMW?=
 =?us-ascii?Q?NEA8SrggeVJytolnu4CMF09K55PIxhL5PtEooy2GMnlhmQ9quAOlkxnz5Uxt?=
 =?us-ascii?Q?BPMfp+ff0amm0D2VYVgcwq4+yydU291FSTctyBki7lmFmNDpyvaIA0yATeBz?=
 =?us-ascii?Q?m9AwGvIuljf8/dL9xLuePFGlfajv/r2w4GFQKEqMZ80RTK/8ppc4ZHMoyttv?=
 =?us-ascii?Q?HSs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c104966-1ee8-4be1-c3ef-08d988c85400
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2021 12:53:43.2415
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: htw3oW+IyrHZ5xDQgk7i2oD3QIkj62VekEE2nEwZLwEvM5z5I+Y/RL8JHS2Oa42a0C+2zu8lOBYgTIPHIRO54dC4NXlzl5A3M/o9O3LG0yI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1943
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

Just to add, I made the below changes to test cd using SDHI IRQ rather than=
 gpio interrupt on RZ/G2M board.

diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/bo=
ot/dts/renesas/hihope-common.dtsi
index 0c7e6f790590..334225c39003 100644
--- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
@@ -225,15 +225,29 @@
        };
=20
        sdhi0_pins: sd0 {
-               groups =3D "sdhi0_data4", "sdhi0_ctrl";
-               function =3D "sdhi0";
-               power-source =3D <3300>;
+               sd0_data {
+                       groups =3D "sdhi0_data4", "sdhi0_ctrl";
+                       function =3D "sdhi0";
+                       power-source =3D <3300>;
+               };
+
+               sd0_mux {
+                       groups =3D "sdhi0_cd";
+                       function =3D "sdhi0";
+               };
        };
=20
        sdhi0_pins_uhs: sd0_uhs {
-               groups =3D "sdhi0_data4", "sdhi0_ctrl";
-               function =3D "sdhi0";
-               power-source =3D <1800>;
+               sd0_data_uhs {
+                       groups =3D "sdhi0_data4", "sdhi0_ctrl";
+                       function =3D "sdhi0";
+                       power-source =3D <1800>;
+               };
+
+               sd0_mux_uhs {
+                       groups =3D "sdhi0_cd";
+                       function =3D "sdhi0";
+               };
        };
=20
        sdhi2_pins: sd2 {
@@ -294,7 +308,6 @@
=20
        vmmc-supply =3D <&reg_3p3v>;
        vqmmc-supply =3D <&vccq_sdhi0>;
-       cd-gpios =3D <&gpio3 12 GPIO_ACTIVE_LOW>;

Regards,
Biju

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 06 October 2021 13:46
> To: Wolfram Sang <wsa+renesas@sang-engineering.com>; linux-
> mmc@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org; Geert Uytterhoeven
> <geert+renesas@glider.be>; Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com>; Geert Uytterhoeven
> <geert+renesas@glider.be>
> Subject: RE: [PATCH] mmc: renesas_sdhi: fix regression with hard reset on
> old SDHIs
>=20
> Hi All,
>=20
> I have reproduced this issue on RZ/G2M pin by configuring cd using SDHI
> instead of gpio irq.
> After applying the patch card detection/removal works as expected.
>=20
> Looks like the issue is present on R-Car Gen3 boards with cd as pin(ie,
> card detection/removal using SDHI IRQ).
> I will post a patch to fixing this issue.
>=20
> Please find the logs
>=20
> With IRQ fix on reset function
> -----------------------------------
>     3.090956] renesas_sdhi_internal_dmac ee100000.mmc: mmc1 base at
> 0x00000000ee100000, max clock rate 200 MHz
> [    4.855266] mmc1: new ultra high speed SDR104 SDHC card at address aaa=
a
> [    4.865396] mmcblk1: mmc1:aaaa SP32G 29.7 GiB
> [    4.885474]  mmcblk1: p1
>=20
>=20
> root@hihope-rzg2m:~# [   60.220648] mmc1: card aaaa removed
> [   61.613520] mmc1: new ultra high speed SDR104 SDHC card at address aaa=
a
> [   61.626103] mmcblk1: mmc1:aaaa SP32G 29.7 GiB
> [   61.647925]  mmcblk1: p1
>=20
> root@hihope-rzg2m:~# cat /proc/interrupts | grep ee100000.mmc
> 162:       2158          0          0          0          0          0
> GIC-0 197 Level     ee100000.mmc
>=20
>=20
> without IRQ fix.
> -----------------
>=20
> renesas_sdhi_internal_dmac ee140000.mmc: mmc2 base at 0x00000000ee140000,
> max clock rate 200 MHz
>=20
> But there is no card detection during boot.
> it is not detecting card removal/removal at all
>=20
> root@hihope-rzg2m:~# cat /proc/interrupts | grep ee100000.mmc
> 162:          0          0          0          0          0          0
> GIC-0 197 Level     ee100000.mmc
> root@hihope-rzg2m:~#
>=20
>=20
> regards,
> Biju
>=20
>=20
>=20
> > -----Original Message-----
> > From: Biju Das
> > Sent: 05 October 2021 18:03
> > To: 'Wolfram Sang' <wsa+renesas@sang-engineering.com>; linux-
> > mmc@vger.kernel.org
> > Cc: linux-renesas-soc@vger.kernel.org; Geert Uytterhoeven
> > <geert+renesas@glider.be>; Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com>; Geert Uytterhoeven
> > <geert+renesas@glider.be>
> > Subject: RE: [PATCH] mmc: renesas_sdhi: fix regression with hard reset
> > on old SDHIs
> >
> > Hi Wolfram,
> >
> > On my RZ/G2L board, if I configure card detection irq from SDHI,
> > instead of card detection using gpio interrupt, then it is missing
> > card detection interrupt after reset.
> >
> > Just wondering, does it work on R-Car with CD irq from SDHI instead of
> > card detection using gpio interrupt?
> >
> > With the below changes, I am getting cd interrupts from SDHI after
> reset.
> >
> > diff --git a/drivers/mmc/host/renesas_sdhi_core.c
> > b/drivers/mmc/host/renesas_sdhi_core.c
> > index a4407f391f66..32f34de1a2a6 100644
> > --- a/drivers/mmc/host/renesas_sdhi_core.c
> > +++ b/drivers/mmc/host/renesas_sdhi_core.c
> > @@ -561,6 +561,8 @@ static void renesas_sdhi_reset(struct
> > tmio_mmc_host
> > *host)
> >                 /* Unknown why but without polling reset status, it
> > will hang */
> >                 read_poll_timeout(reset_control_status, ret, ret =3D=3D=
 0,
> > 1, 100,
> >                                   false, priv->rstc);
> > +
> > +               tmio_mmc_enable_mmc_irqs(host, TMIO_MASK_CMD);
> >                 /* At least SDHI_VER_GEN2_SDR50 needs manual release
> > of reset */
> >
> >
> > Regards,
> > Biju
> >
> >
> > > -----Original Message-----
> > > From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > Sent: 26 August 2021 09:21
> > > To: linux-mmc@vger.kernel.org
> > > Cc: linux-renesas-soc@vger.kernel.org; Geert Uytterhoeven
> > > <geert+renesas@glider.be>; Yoshihiro Shimoda
> > > <yoshihiro.shimoda.uh@renesas.com>; Wolfram Sang <wsa+renesas@sang-
> > > engineering.com>
> > > Subject: [PATCH] mmc: renesas_sdhi: fix regression with hard reset
> > > on old SDHIs
> > >
> > > Old SDHI instances have a default value for the reset register which
> > > keeps it in reset state by default. So, when applying a hard reset
> > > we need to manually leave the soft reset state as well. Later SDHI
> > > instances have a different default value, the one we write manually
> now.
> > >
> > > Fixes: b4d86f37eacb ("mmc: renesas_sdhi: do hard reset if possible")
> > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > ---
> > >
> > > Geez, typical SDHI nastiness here...
> > >
> > > Geert: I think this fixes the issue you saw on Koelsch. It works
> > > fine on my Lager now at least. Can you please test and tag if all goe=
s
> well?
> > > It would be great to have this in 5.14 but it definately needs
> > > Geert's confirmation first.
> > >
> > >  drivers/mmc/host/renesas_sdhi_core.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/mmc/host/renesas_sdhi_core.c
> > > b/drivers/mmc/host/renesas_sdhi_core.c
> > > index 6fc4cf3c9dce..a4407f391f66 100644
> > > --- a/drivers/mmc/host/renesas_sdhi_core.c
> > > +++ b/drivers/mmc/host/renesas_sdhi_core.c
> > > @@ -561,6 +561,8 @@ static void renesas_sdhi_reset(struct
> > > tmio_mmc_host
> > > *host)
> > >  		/* Unknown why but without polling reset status, it will hang
> > */
> > >  		read_poll_timeout(reset_control_status, ret, ret =3D=3D 0, 1, 100,
> > >  				  false, priv->rstc);
> > > +		/* At least SDHI_VER_GEN2_SDR50 needs manual release of reset
> > > */
> > > +		sd_ctrl_write16(host, CTL_RESET_SD, 0x0001);
> > >  		priv->needs_adjust_hs400 =3D false;
> > >  		renesas_sdhi_set_clock(host, host->clk_cache);
> > >  	} else if (priv->scc_ctl) {
> > > --
> > > 2.30.2

