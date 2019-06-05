Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0783A3588A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2019 10:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbfFEIbj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jun 2019 04:31:39 -0400
Received: from mail-eopbgr1410107.outbound.protection.outlook.com ([40.107.141.107]:1376
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726554AbfFEIbj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jun 2019 04:31:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wfmGfw5OeGTfGivzy1BdLDkDn6sQOSzFfcnyXlN0g4=;
 b=pGvYo57P0AhzfnwaulJyAdSoBTIhj54HLodoW7RJed/hA8+YcEkgAMTPkZN4SBt7AsgYDrFln/uUaZX2Wax2rJ0A5JPe+52ZXUDu1HzRw7LLH/Iam/2ghh8jo4XCB6o66jQNFPN6TY0HZXQyIszZaVsGConDOUQeGN6+WwDOtHQ=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1580.jpnprd01.prod.outlook.com (52.133.162.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Wed, 5 Jun 2019 08:31:35 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::8a0:4174:3c3f:f05b]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::8a0:4174:3c3f:f05b%7]) with mapi id 15.20.1965.011; Wed, 5 Jun 2019
 08:31:35 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>
Subject: RE: [PATCH 1/3] mmc: sdhi: disallow HS400 for M3-W ES1.2 and V3H
Thread-Topic: [PATCH 1/3] mmc: sdhi: disallow HS400 for M3-W ES1.2 and V3H
Thread-Index: AQHVGuhhkZx8vUr4TEOB9YONHKQ2K6aMuj8Q
Date:   Wed, 5 Jun 2019 08:31:35 +0000
Message-ID: <TY1PR01MB17702AF5B88A8EC863EA54BAC0160@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <20190604151530.7023-1-wsa+renesas@sang-engineering.com>
 <20190604151530.7023-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190604151530.7023-2-wsa+renesas@sang-engineering.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d6f6490e-544d-4d8a-9278-08d6e990389f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1580;
x-ms-traffictypediagnostic: TY1PR01MB1580:
x-microsoft-antispam-prvs: <TY1PR01MB1580D9E54348BF8FC8202F48C0160@TY1PR01MB1580.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(136003)(39860400002)(396003)(376002)(346002)(199004)(189003)(2906002)(446003)(81166006)(81156014)(74316002)(5660300002)(11346002)(52536014)(478600001)(476003)(3846002)(44832011)(6116002)(53936002)(186003)(8936002)(14454004)(25786009)(2501003)(486006)(7696005)(6436002)(102836004)(8676002)(55016002)(26005)(71200400001)(9686003)(71190400001)(99286004)(76176011)(305945005)(68736007)(256004)(66066001)(316002)(110136005)(6506007)(53546011)(229853002)(54906003)(6246003)(33656002)(4326008)(66446008)(73956011)(64756008)(86362001)(66476007)(66556008)(76116006)(66946007)(7736002)(14444005);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1580;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: L3aXIcbjFujwE3EmD+xHMWDVT5QvSAnOySU8yWd5uGDBVb7se1SsnWn1iHsAytw4qH7Nscftb8lp9lHOyveCCX5Vc9mckWkDRQjYFLopkK334SDIVFESJGUqkjIjqjrAsGfC2cxMiNCOiniaQlsaPWpWJeoPfmpD/uDXQWwfWBkdWMllYe9sBVYIag1jAub9XwEjPT1PpcATcR2MY+k7ODAC2Aq+mSD6MA0QVN60rdUO2ai3Dw11ZVuj9ntlNS4tsPLf2Fysx8RcdRtg0gToNakAtR87Pn8P4EIOS13cdW+t89qb3vZV8iaZKyvWWSUggNmCJbINrOmQdzer66kxOtX7FGCFABzuoirnjiihcutyFB1r8OrweksSNmvmpxIV9yK0DcdE8abavhiUVAVtQwrcKxHkb05pjxE26LDZudk=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6f6490e-544d-4d8a-9278-08d6e990389f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 08:31:35.1419
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fabrizio.castro@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1580
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Wolfram,

Thank you for your patch!

> From: linux-renesas-soc-owner@vger.kernel.org <linux-renesas-soc-owner@vg=
er.kernel.org> On Behalf Of Wolfram Sang
> Sent: 04 June 2019 16:15
> Subject: [PATCH 1/3] mmc: sdhi: disallow HS400 for M3-W ES1.2 and V3H
>=20
> Our HW engineers informed us that HS400 is not working on these SoC
> revisions.
>=20
> Fixes: 0f4e2054c971 ("mmc: renesas_sdhi: disable HS400 on H3 ES1.x and M3=
-W ES1.[012]")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>=20
> This one should go back to stable.
>=20
>  drivers/mmc/host/renesas_sdhi_core.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/rene=
sas_sdhi_core.c
> index db73f9f1b186..e98ba6cf6c13 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -620,11 +620,17 @@ static const struct renesas_sdhi_quirks sdhi_quirks=
_h3_es2 =3D {
>  	.hs400_4taps =3D true,
>  };
>=20
> +static const struct renesas_sdhi_quirks sdhi_quirks_nohs400 =3D {
> +	.hs400_disabled =3D true,
> +};
> +
>  static const struct soc_device_attribute sdhi_quirks_match[]  =3D {
>  	{ .soc_id =3D "r8a7795", .revision =3D "ES1.*", .data =3D &sdhi_quirks_=
h3_m3w_es1 },
>  	{ .soc_id =3D "r8a7795", .revision =3D "ES2.0", .data =3D &sdhi_quirks_=
h3_es2 },
>  	{ .soc_id =3D "r8a7796", .revision =3D "ES1.0", .data =3D &sdhi_quirks_=
h3_m3w_es1 },
>  	{ .soc_id =3D "r8a7796", .revision =3D "ES1.1", .data =3D &sdhi_quirks_=
h3_m3w_es1 },
> +	{ .soc_id =3D "r8a7796", .revision =3D "ES1.2", .data =3D &sdhi_quirks_=
h3_m3w_es1 },

Can we actually detect E1.2 on the M3-W? My understanding is that the conte=
nt of the
PRR is the same for 1.1 and 1.2 (Geert, could you please jump in?).
I am saying this because I am using an RZ/G2M (r8a774a1), revision 1.2, tha=
t it's reporting
itself as 1.1.
Also, the r8a774a1 and r8a7796 are identical (even revision-wise), so I gue=
ss we could
add r8a774a1 to the pile while at it?

Thanks,
Fab

> +	{ .soc_id =3D "r8a77980", .data =3D &sdhi_quirks_nohs400 },
>  	{ /* Sentinel. */ },
>  };
>=20
> --
> 2.11.0

