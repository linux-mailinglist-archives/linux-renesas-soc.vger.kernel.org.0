Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6F3C374E1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 15:10:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726757AbfFFNKp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 09:10:45 -0400
Received: from mail-eopbgr1400124.outbound.protection.outlook.com ([40.107.140.124]:60382
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725782AbfFFNKp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 09:10:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M3VKj6yLgGnlf33BcaiIa9ZsrfEfozyFE8uw0i1nUhU=;
 b=DFGonNNXu58oDbWbSLuo9uAqU2zgxUu8+KmKgltanuCwdOqehuWUUhK0jAYH12MQYzqc1DpWLB7BGmPhQ4eQ3LsTLfRiz7Sa3W+vqwsnicci0p6VIFI/0yw/QVHMRxldzqbgFcVhceSjlhCLWZ410hVLJ7NW6mYE32QcRFu5aHE=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1835.jpnprd01.prod.outlook.com (52.133.163.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.14; Thu, 6 Jun 2019 13:10:42 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::8a0:4174:3c3f:f05b]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::8a0:4174:3c3f:f05b%7]) with mapi id 15.20.1965.011; Thu, 6 Jun 2019
 13:10:42 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>
Subject: RE: [PATCH v2 1/3] mmc: sdhi: disallow HS400 for M3-W ES1.2, RZ/G2M,
 and V3H
Thread-Topic: [PATCH v2 1/3] mmc: sdhi: disallow HS400 for M3-W ES1.2, RZ/G2M,
 and V3H
Thread-Index: AQHVHFv/teVuTaRz5U2lPOAfUP0mqKaOmV4Q
Date:   Thu, 6 Jun 2019 13:10:41 +0000
Message-ID: <TY1PR01MB1770774B57DB7853176B560EC0170@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <20190606113537.8869-1-wsa+renesas@sang-engineering.com>
 <20190606113537.8869-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190606113537.8869-2-wsa+renesas@sang-engineering.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69393b74-9133-4e12-6a08-08d6ea8060f3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1835;
x-ms-traffictypediagnostic: TY1PR01MB1835:
x-microsoft-antispam-prvs: <TY1PR01MB1835296205D4A261C7C2F9EAC0170@TY1PR01MB1835.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 00603B7EEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(346002)(136003)(39860400002)(366004)(376002)(199004)(189003)(5660300002)(66946007)(86362001)(66476007)(73956011)(478600001)(76116006)(66066001)(53936002)(81156014)(81166006)(7736002)(11346002)(66446008)(64756008)(66556008)(2906002)(3846002)(6246003)(110136005)(54906003)(6116002)(52536014)(2501003)(305945005)(8676002)(8936002)(71190400001)(71200400001)(6436002)(9686003)(14444005)(55016002)(186003)(256004)(26005)(14454004)(316002)(4326008)(74316002)(53546011)(102836004)(6506007)(486006)(76176011)(25786009)(229853002)(44832011)(446003)(68736007)(476003)(33656002)(7696005)(99286004);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1835;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dtkjnnVO9zODw31beh2MMCS9ZLuGzKPaCBN/dLWj4ellnm9zTM6R2BVa6zlga70CYLvInvlG7agmPLFGfO7RVGufMLY64jH2rBIJ/P73UQqVzQLxmz07gXzIe774QWZ/qd7LvNogh9UAkSS4OxrxY+ZGhSOS4JhhEplCBVS5uhuFSZy1C8K54WQc/PcGMYByWBb9Fl7sKoB0VXXIs2lEyz5BGpzaXOiLbOVv4dHE6OjnzbN/tSsHYNGIn82US5ttmw9PRr708J9VBtIJ1DBeq4lVde+ClERJaMVxOo0qLRkvYy7YDQ52330DUDxx0MHHoubGbTUtC20P+Imq231B/ooACf/WUdnXrezH+Xj4LVqgXKv303nUaLa6LiiHvJhG0gYxz/eiG299DKidonZ199Dmw4yBQAz017CKrXK++Vg=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69393b74-9133-4e12-6a08-08d6ea8060f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2019 13:10:42.0683
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fabrizio.castro@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1835
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Wolfram!

Thank you for adding the r8a774a1 to the list!

> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: 06 June 2019 12:36
> Subject: [PATCH v2 1/3] mmc: sdhi: disallow HS400 for M3-W ES1.2, RZ/G2M,=
 and V3H
>=20
> Our HW engineers informed us that HS400 is not working on these SoC
> revisions.
>=20
> Fixes: 0f4e2054c971 ("mmc: renesas_sdhi: disable HS400 on H3 ES1.x and M3=
-W ES1.[012]")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

> ---
>  drivers/mmc/host/renesas_sdhi_core.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/rene=
sas_sdhi_core.c
> index db73f9f1b186..683c449a2f94 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -620,11 +620,16 @@ static const struct renesas_sdhi_quirks sdhi_quirks=
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
> -	{ .soc_id =3D "r8a7796", .revision =3D "ES1.0", .data =3D &sdhi_quirks_=
h3_m3w_es1 },
> -	{ .soc_id =3D "r8a7796", .revision =3D "ES1.1", .data =3D &sdhi_quirks_=
h3_m3w_es1 },
> +	{ .soc_id =3D "r8a7796", .revision =3D "ES1.[012]", .data =3D &sdhi_qui=
rks_h3_m3w_es1 },
> +	{ .soc_id =3D "r8a774a1", .revision =3D "ES1.[012]", .data =3D &sdhi_qu=
irks_h3_m3w_es1 },
> +	{ .soc_id =3D "r8a77980", .data =3D &sdhi_quirks_nohs400 },
>  	{ /* Sentinel. */ },
>  };
>=20
> --
> 2.11.0

