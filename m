Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AB2E32765D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Mar 2021 04:14:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230521AbhCADOm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 28 Feb 2021 22:14:42 -0500
Received: from mail-eopbgr1410108.outbound.protection.outlook.com ([40.107.141.108]:3863
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230222AbhCADOl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 28 Feb 2021 22:14:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XO7I95OrEcGiy2AAt1D9mzqt/+OeIeiN9qOjuvTt6LR8ClrJ0cfEzHZZtIRewJvz2+vF296LZ8mjYHs/2WsvzkHkuYCLntcQXN0iKJ1YgDGaMCKq54VDakhEcdZRp+FUqFfARZSmh9H8VP4j3J+pvebijynN5AaVt3uJttL3aFX/9bnO9WeZ1pRaao3UIa6hVE/aMI89/i6/soRKghmoKa9foaErPlIIoPHTvCihv/VQAN+o4AsCFYNnatgA4tyW+biSTwY1VBw+Jlsosf+EyBWJls0PcpND5FVJcj28NFLAF2E3kzFn/zSZ8BVSguOt5neTsPdl7rNIgwfDwMIiRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sEDH6bq/6Q4A/BpGWxV6VqOSDcxytnI9tQHmJIMUtsg=;
 b=ToSFLh9WPmWEY+ANyxfSDNoUzAJLf8QZ4n+KHHh3kj+lXjk/nUfhKC72EDC5oaiZ/Rz0wWp9/K4JfaCxFHbIXDI7GNA5lEEMdI/RM6qj5rE13rByDlwLXSzspvpYI2oW8mhxGTETqDzNlSKl/mWKNp3e1JMSHe4YRYh8LvxlleEuUydxRF4B/D0YUs3pXVnxyI8pwNpdjmz6w0Gp3lumIEdcJSzXu4NrykMc5RQbDQQkIgo91Q3ZahHa4skBlp+OWq2Pd34Nh3acYSEkqIoZz4XwCVwBT7Q6dOgDHLVdFyN6X0Vp7I4Gvx41y8u0NhlS4U0F7EZcUNGXlLsNnHNJHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sEDH6bq/6Q4A/BpGWxV6VqOSDcxytnI9tQHmJIMUtsg=;
 b=Mw4sPfGQGPO9lAQZfau1VU1F4gBFkVt8BVZTVhICGpcLHlaFCdqaPYuMWVxR3BdlIh6TeVZWEWk1IJ48U5yl7HFzzvXv+CFKMoQ5jMHTaiU1mIERyfFlWiDd2L2HhM/pc3YkHl7/xYeUMHdmcRtPpy0ILYDBVrovFglOhygNwfM=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB5356.jpnprd01.prod.outlook.com (2603:1096:404:8031::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Mon, 1 Mar
 2021 03:13:52 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::cb4:9680:bb26:8f3f]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::cb4:9680:bb26:8f3f%4]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 03:13:52 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: RE: [PATCH v3] arm64: dts: renesas: Add mmc aliases into board dts
 files
Thread-Topic: [PATCH v3] arm64: dts: renesas: Add mmc aliases into board dts
 files
Thread-Index: AQHXC3AOJmo/i2fQRkqPbIkfTls2dapo0auAgADIL8CABN4IMA==
Date:   Mon, 1 Mar 2021 03:13:52 +0000
Message-ID: <TY2PR01MB3692F86C982DAA22761A3DDBD89A9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1614255382-6377-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdWLBX89R+jZSZSofgL-ONhjFBBdMDwd44Tuu8BY46+GjA@mail.gmail.com>
 <TY2PR01MB369202DF4D3EEC1085F6B00CD89D9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB369202DF4D3EEC1085F6B00CD89D9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f0f8ce50-a812-461d-c021-08d8dc600a73
x-ms-traffictypediagnostic: TYAPR01MB5356:
x-microsoft-antispam-prvs: <TYAPR01MB53564288FF68E94C3BCCD105D89A9@TYAPR01MB5356.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uMq9IZ2ib6CK6GJA3eVfzuby1mcTNAcn3baC73thCyn5Iy8MyVcWgTOqZu9e7C9yIyPOMQL3dAXqempXScTTc/uPT8Xkor8e0u4LAm4Tf5We0KUHxvjaex49ywit5XUDACGbgkQKRh8SuA9hhvwG0jENbuo/Djuv073XZeywl3HHPpqNaAH4xws8odViPNbm0SNi1H4Jl7JaB35UGTkeT+/1JxiAhnabUwILsuVAtdXlISmOyy95nIhUOFjoDeaVO30g1MoknBcVj/V+Wf9BGE05Tx8LgNTsbZfTyF6TpyMNvf505GqAsM+y/6NXdiDrSoEMChQmIMF8Cq/IpIFuQIhPFGKlnk2/cCPZEu4Rpk5tKb2Yp+dcd0H0fZ06d46N8fUxQyq3hcvVciEWf6/v92A6CNyEYx8n/6ujxr0IMj4053Trmm2z8BJuQnKYEtxNui8MXlxJsApO0laTo/NTO2saj2OW4hHaUysgQom11Ni05EpCfGrSsf7XiFaUs9iepy+6lPUAsQcq/wcCAgaVqw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39860400002)(346002)(136003)(376002)(55016002)(52536014)(66446008)(66476007)(6916009)(8676002)(66946007)(66556008)(5660300002)(64756008)(53546011)(6506007)(9686003)(86362001)(26005)(2906002)(55236004)(7696005)(71200400001)(8936002)(4326008)(76116006)(186003)(478600001)(54906003)(316002)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?vj8PMU5O/qPNfUBce1GufugW/8IP6lbjrmtTYetC/fE56UU3uIDx0oNJf+SD?=
 =?us-ascii?Q?E2YCbg8hyt8nlzWyy9dOWkgLNmDlQcYJrnm5MOVw5BSEepEFNU6fnga0c9Qz?=
 =?us-ascii?Q?jZ2eOqOS4je75Kddntfi1Oszvm0VTCtwRoKFtKLsNDJdx8fxgJdLRmto68Md?=
 =?us-ascii?Q?MGcDN9PpC5v0bCgxMw4PWq1czRglGpDBhIC+BTpHROtKNDi/Vw5MQ4MC4Nk5?=
 =?us-ascii?Q?sLjaoimf85C4h2Nbf8ikN131ct2WaENf6HIE8EUijHgQBundZWy+U7KfJtY+?=
 =?us-ascii?Q?NS2sjWI6IinovRuGl4RmXlVbuladS5Jpv+deyo8zLOZ/5YXtemVFDASSRfWB?=
 =?us-ascii?Q?ERpYYFrWbJrtVf7bStOVFGa0EygZJzVGgCFMjiL9+yiSm76eA8U46W8dpai/?=
 =?us-ascii?Q?mPq1U1MtALN3jnOSloVoDUMx3Cvs5DN0aco25ctbd/nKCb62hCg0DhSGEv0L?=
 =?us-ascii?Q?mTxn86Q8v03++UXzZS4gYsb/avQ6T1ikmwmNSPELgr/Q4WGyVdnDGUrvQdst?=
 =?us-ascii?Q?7r6lI+jwb0nPSg2vGax9nFBS/AWVvwHoufXq2jkuifDA0JFUOO1nhWLGdqnV?=
 =?us-ascii?Q?hMeUvWD3IxLY5uchDqc6p/jhivdnRSqbH0fUiaLF1szW53pQtAW2F/EXSdoY?=
 =?us-ascii?Q?wZgVyjeHhJaatGNm9EykI7d1Y/9xO1TTnQlzo+BkfwjUUC1dqPGloFe4oTg+?=
 =?us-ascii?Q?trkyqHtjrEUBmygK+pj7PWC4Hoc8GN5w6QlIHTXI3FQ2U3V/nzGWuJLrG/Oo?=
 =?us-ascii?Q?dRlXRmPr5LFVww/rfKce7hUeZw7Ec78qIf8TK+geLUtgH4SsuX4fLPF2Clbd?=
 =?us-ascii?Q?xXMzqiT8GOSj53kUExmpo+g3NAtqtNm2tRP4O6RXFVq10a0w878OdDJZbBbT?=
 =?us-ascii?Q?r0Gt6EYKqQPMSSzzd9VnjHG2jo4PD5pVpc1el/pQtGp/oXVqeZTtzZhSDYT5?=
 =?us-ascii?Q?cR8v4a1xfaqF8v3LUNVnj2iZlMyQxdzDVc6WJ6Wx3+V4rlXJuTmyUSUmC63H?=
 =?us-ascii?Q?hUV+TRyRnFW3O+BfvwLZ/TAWbSpFloK9TuxdrwAY6d0chDZ+eZUMH1Am/h0U?=
 =?us-ascii?Q?MMoyMVcx7aiZtPvAK+PAmwZK4K+HbypnOHVqLhbeXS2rjlQlP7q+6i7FO980?=
 =?us-ascii?Q?9kgDG7+R1O0fJm/dNU204+vFSh7aM68P6iJh0IfU0VXso8JU0/o6d2TyDD0L?=
 =?us-ascii?Q?3Fqh0ysaRNM/4vVHuP7rz+dhs4ClrnXIuxhmvQ0ueoqZMXLcHFwS9dcSPO3w?=
 =?us-ascii?Q?euvSTMYPBfo5imKbOHQjVWJg2evnnVkmrVDan+32TpDiyvz6yO+s0412Jj9t?=
 =?us-ascii?Q?eMydOzhkcw5791oPQPXTqZrL?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0f8ce50-a812-461d-c021-08d8dc600a73
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2021 03:13:52.1855
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M29h8mTVAe2Pd+wYHoHEncHq9zhXkaOFQnKGaGFGp8sNb5oAu9oln1mbrZZ7CbrO18thi1b9RC5GYsO2GaUWGcmMdVVBZlSn2NhmPoUjJsuMmflwiBQWsxHdYU4v3edR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5356
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Yoshihiro Shimoda, Sent: Friday, February 26, 2021 10:02 AM
> > From: Geert Uytterhoeven, Sent: Thursday, February 25, 2021 9:47 PM
> > On Thu, Feb 25, 2021 at 1:16 PM Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> > > @@ -36,6 +36,9 @@
> > >                 serial0 =3D &scif2;
> > >                 serial1 =3D &hscif1;
> > >                 ethernet0 =3D &avb;
> > > +               mmc0 =3D &sdhi0;
> > > +               mmc1 =3D &sdhi2;
> > > +               mmc2 =3D &sdhi3;
> > >         };
> >
> > Looks like on Salvator-X(S) the two SD card slots are labeled
> > SD0 and SD3, so the last one should be mmc3?
> >
> > What's most important? Getting the naming right, or matching the
> > traditional naming?
>=20
> Most important is stable these mmcblkN naming for using it on
> the "root=3D" parameter :)
>=20
> I don't have a strong opinion though, IMO, matching the traditional namin=
g
> is better than board labeled because:
> - we don't need to add any alias into a board dts if the board is using o=
ne
>   sdhi/eMMC only like r8a77995-draak.dts.
> - also, the traditional naming is familiar to us.

I'm afraid about changing my mind. But, may I use eMMC channel as mmc0?
This mean that I'd like to change the aliases as below.

+               mmc0 =3D &sdhi2;
+               mmc1 =3D &sdhi0;
+               mmc2 =3D &sdhi3;

This is because it's easy to imagine mmcblk0 as eMMC
and super old kernels (v5.4 or or earlier) were probed as mmcblk0
so that we can use "root=3D/dev/mmcblk0pN" on the kernel parameter.

Best regards,
Yoshihiro Shimoda

