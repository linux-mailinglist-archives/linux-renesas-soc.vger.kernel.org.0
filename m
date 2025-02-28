Return-Path: <linux-renesas-soc+bounces-13792-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 465E4A4921B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2025 08:24:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5340116C3BA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2025 07:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881201CAA65;
	Fri, 28 Feb 2025 07:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="cnsAnrKz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011067.outbound.protection.outlook.com [40.107.74.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE231C760D;
	Fri, 28 Feb 2025 07:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740727427; cv=fail; b=a1xBcmASvCPNXuw03qbpc01CGJ4fLxQVj0jKtoXk/daiY+oOJvTdk7kEYoDi4wHmYV/lhOdK79uOXC26NKAGJoN48Cs9TjqP+qq3brT0E6Lm6DlxdEi14kfaKl14zfW1AT0vWbCH5EfrbXsSJVv3pYLdibjCylHYsRnmkgSU/2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740727427; c=relaxed/simple;
	bh=kXshaQSaleulXsFSCy4hQ07HGokz+NtJGSTahlyG+pk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=igjd1b4i5yhN1TxWaGSTqvOGHOLOvZMoV3g4uU05HCrA4NrDJbVvp7RpH4bAg+jMmMjXpmBEzwM8oCs0eZQHlKf0YTgJvZw52IkugQxFsGAHPa+Bziw8ENtGH0O+PjVDNhXabmjEjs5c2a1sykR7m4Fy5wCIBP3Y4b3osG26lqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=cnsAnrKz; arc=fail smtp.client-ip=40.107.74.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x2sltRCAQ1LNRsy5Q7DU5wjENp8PVDABHr/Ht47iy3IIsaP8iEUaP/8CtdQ+BFGBAiRB6S2bV6w+MHzYerluprjUJCO6GsImrvTiWWtUS7ma1qSwnsBhzmxsUtW8JoapoZHsi+uWfIfC5CDqPuEFhVYR7ph48ZGPbllHjcTeMMIFrHcxJOTqF9rkqO6lQ3b/xhDKam6vzoYGh8GN4KNvuNcGqADJK8WUGCSMyVmD1kd6gjWSNA8yccZ6PcEluiDxCEhCL/7vX94FeOno+f+cNIqLlAO8BaSyapzW5OrYCv3ZJ4zQQYEIOCAyhdXeGZ+z7xSDq7tozH63hmLqco3ynw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qFs8cfeB4WEtSxXsuZDSjee0jZnhaDi57uuyp/zzGDc=;
 b=QrcNQ+6UI1cs2dujN7iAaCManhkHvE+G2SJhN2ieOxowsRsB3j2nmRlkxFdaZYA8zw71ZAX4aD8QKpBh79IbTvH5VLIiFViRGW9Q7QA2Hdnpx5LGa0joqcvxiOemNuCu4M6sLg+UXuhU3eXofaepYKZGVs+JTWY/0khVX60MbxlWhY68/X9L7EGYJzwke4QkBzmSJFlHEGWp8Vh8dqCBuiTHcUSX2TvSXnvsfDC6J+nB8kbBDuG1b/ZbBqQ31HPYU80SZ3gQRBIKHYMK0X1RXWthBlZ/R4H8zOmgN1qIkjRWhq6NpguxfPIxR3F8l7WzJ07ug848Rw/qtyOeCVZY2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qFs8cfeB4WEtSxXsuZDSjee0jZnhaDi57uuyp/zzGDc=;
 b=cnsAnrKznLgaBHyKOfifbxKvoSCK92it4UOZwCtSEGv2lHAW2u3yXQtSPtF3OZnuFcSX/n9QMiP+mYHOStvzfHl1DSEQkuhISL6Q30f30JjG7WAz1l79WjVL/0AXXuHcQyxHcqKd580+Q6Sv1DICzGEuxDx+lxwoBi311ZVTwOc=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB9888.jpnprd01.prod.outlook.com (2603:1096:400:22a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Fri, 28 Feb
 2025 07:23:32 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 07:23:32 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v3 3/8] mmc: renesas_sdhi: Add support for RZ/G3E SoC
Thread-Topic: [PATCH v3 3/8] mmc: renesas_sdhi: Add support for RZ/G3E SoC
Thread-Index: AQHbeJzJXGThVn8cpEWsdB3fagweKLNbY8wAgAEMgjA=
Date: Fri, 28 Feb 2025 07:23:32 +0000
Message-ID:
 <TY3PR01MB113460F7C9EB632B347F6C0EE86CC2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250206134047.67866-1-biju.das.jz@bp.renesas.com>
 <20250206134047.67866-4-biju.das.jz@bp.renesas.com>
 <Z8CBsrD2gKL-V-UG@shikoro>
In-Reply-To: <Z8CBsrD2gKL-V-UG@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB9888:EE_
x-ms-office365-filtering-correlation-id: d8b6f904-7b0c-4910-6ddd-08dd57c8ce32
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?WwHAmwkj1PypDe9yJWlrP+yBpuDpZuhkwD022Ogj1D3WiB/BieqFu4Vggksq?=
 =?us-ascii?Q?tww5N5yq6KH0IKmbw6c4WrhzejF8l2Xlvy9WnmdrT3KIsVtHEmk3UzWbh8v2?=
 =?us-ascii?Q?VwPzEjATeX6jtx6vnxGKt7eaZu/L8wgLXXHUL3KwnGHOx86sLQtOhaC+9Va0?=
 =?us-ascii?Q?aUMlNRg8mFpq3NlFjEgaKfh+9g1H2Fo+QEXMlSr1er0EouwDGZNd4Mdxa84j?=
 =?us-ascii?Q?3m6QxjOuoF9TNeF2CrP6MXzM6uwYtZr/0APonDWkQZwIzs0uCY7VvKazEf6d?=
 =?us-ascii?Q?/RlLVG4zSUXyvR4x54pN912ZBEYUgXc/YaucfDhjft4fSTzFD4rroocYFGXd?=
 =?us-ascii?Q?vzKwVZEwGKhQ6xNXEKrUktTbGViwxSDNO9/msVX851Keze36MqnFlq/3TN7S?=
 =?us-ascii?Q?IC7LrdnirTDoEl5LJOfuC7udoOlXRbvhu7ESoYl0bzmSaX3ReV4GYJihPihE?=
 =?us-ascii?Q?vhqTTkPj4LR403cTil6FEMIknLU3VQzFwW33lymoXuDY9/7wPpu/3CJ/B8xA?=
 =?us-ascii?Q?XgMf9bWZrBzuyVXbUxXfi+53zdWljd5JOs5fofbWYVSKjewPcS8aoWrDPJeJ?=
 =?us-ascii?Q?8u6K4p0jMwtKoGHQox4xHR9zyBt1/hCg7k+lU8Hmj/OiaGz1btoZTDCerJ94?=
 =?us-ascii?Q?s/zQOU8KROJLYb+7+UDg7sQ3WFFA0ORzFp5NfsG9AeA6Glz3dvyg9ImkfigX?=
 =?us-ascii?Q?f7tTYTxTgAiLPjTjsxDRyKsHkRpL/8VmUJy5M/vO2b8c4wmV5b5gIm5F194w?=
 =?us-ascii?Q?88+PQt94wQzZL2b1JffrDOOZlWDAojRUpQJWir89W/DTv4nS1ZnteXHiaYG2?=
 =?us-ascii?Q?CP9W36cL3CdaX8rK8D1rIQblqj2Kken/2pTGMb5H+T4Psb77REF8nKaDTh6i?=
 =?us-ascii?Q?d9awyFwFav5KKtDlBQxDsI9e5wZfLhc64IrG1Oj8W1ragby9ZZqH0FYRXAR5?=
 =?us-ascii?Q?H0xlj0xNL7UF7VTwaVizhM4x07BLtfqgU8V49w/ljYpY75fDqn4oAocdLAXB?=
 =?us-ascii?Q?4PJNydEs3f9DvwiwASrT0jeDQynvYZ8SJvUlnLE+IwpSDLvWNl3UpOzshv1q?=
 =?us-ascii?Q?Z75UuzoAKgfv6CHgFSc1tt+0r6m3ZRxSaTNbYJgUwX5caZkJitfi7nTOHmp2?=
 =?us-ascii?Q?8ctpeSS1F72gRUKcc4cCjfGjoUSNKJ9BdhQWGCy4y52OS47PxSZi5dolNAIQ?=
 =?us-ascii?Q?wdLN45J2qbRQWYaXbp+9/fXd6dJJOnwnaMZgfoy7NIAXe0Va5+oefYzIDemN?=
 =?us-ascii?Q?os64PATb4VkIb8IqyxFBtSyGRl5U5Tcy5N4UEiLmzemUAszLv1dVKsQkIXWD?=
 =?us-ascii?Q?rtFk7LmH8wsocDjCiAxRKiblM1yFAlQPkYgQhBz5eW3APNUK//lyxG47PZHK?=
 =?us-ascii?Q?FRUgFk4lVDvOWd6JefuACw8PtuCO+uHNFVKOonKrILjn/Y0XzKsb0at1qbVd?=
 =?us-ascii?Q?5DWyt1fLP2i9X5J3EsfXr2QB15mq1VH8?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?VoBM8ShWZiQFS2Knw2EihLMjb4TNk2h/ZI65WVTfSiy6iUZW17WOmDH7Cjb5?=
 =?us-ascii?Q?xpz+oofvVdU5vd32SEPfBC0nxMBUG1FRgmf0E3yyTXmNHHQBu818L+tpo+rV?=
 =?us-ascii?Q?x3wyJHTFJIsnInZn0RpXFKULzr3jFsSbSshW9SZuEi3WBKDtSjn9B0ccsUCK?=
 =?us-ascii?Q?7Lo5jGKyw5kJ6Kyoj3PKgZL5tXoASIqktCtPb894RhDZUMDRjcXgrWvx9Vjz?=
 =?us-ascii?Q?1e6xn8eCdF0So5uIrJPD3Ig+3Lxrg5GnYf4yOy3vdbIyiY6FWYzJXvB2C+86?=
 =?us-ascii?Q?qeRJ0DnrnALQqUcT33IUkhTw5iuHMPDt9UKEMfKPhef475Kx5ShbdjNLm8Y4?=
 =?us-ascii?Q?gEUJjgRFDag6eefuxK4tGcTsLDjVvcMTNrAZX3JilpRZkM4Q/EmzYuCsNzR0?=
 =?us-ascii?Q?Iiq6MbjrZv3olPTqbuESFf7m8YXOsyYup2WsaGcvFRWxRgE4CacmZdObabKF?=
 =?us-ascii?Q?6UFAIHBJP8Nh+q37gpInOxbtqNKwYU3+zrvd/5HNWiM+xl3qFnCUikkGi7pg?=
 =?us-ascii?Q?jVWxeW5wJcTr/6RFxlm21PLd1GYg0p1e18e/9jjlvYaSkzVbRVEMI1E5bH4C?=
 =?us-ascii?Q?TXati1VYOQPaoQKW+9EUZvvKf0i4rFAc3r+uG0U9+ae0sCYm/KnhcWjoifDN?=
 =?us-ascii?Q?Nldpzurb7KtOmwWcE3IT5XFcbsvrZrWWaL1bjMB1Kfvv4Fy2IND8V+UbHBY0?=
 =?us-ascii?Q?fgjgnINw3SkblTkqHCmS8yDL/pcvqcqC0lyfjfAeY0RgP8Q10zrLk930AcuU?=
 =?us-ascii?Q?yCmdNP4IPbocq95tM6xfzbcT/KfajVsKbA0T87ZP1ZoFZ/PSbTdUyg13qQ8G?=
 =?us-ascii?Q?uGVYS86aVRek4ERWFd/vQ1BTYJHV3Z9XdZgOk+2VNyJ4moGLrlwSqa7ZB1uA?=
 =?us-ascii?Q?W4T04mJhNFxh9VVpPRGUG87PasQ+O776Xid6oSB+uiMMTB21Wg7K5r/tGwby?=
 =?us-ascii?Q?gAeyV+KYDOLf9BQCBrrHgzKXESlaIjSaZwLrwYrJxjjkj6/6jV6lUBKM04gH?=
 =?us-ascii?Q?B+O7qSRVXtF5Cp0EDy1RVm7Po621u8kCUAEUj+F5Y+lsvSpiTG7n46xw2wjl?=
 =?us-ascii?Q?xZ8P1lF6MWGGsLV1RTd/L12/LZUf8pY7Jr7+mw9z1SvIV3N+XBsG/W2COtkD?=
 =?us-ascii?Q?Yu9KO+sd2CneF15DtNDdnlRi4pSuQ0k+XSb9hvBkofJ6le08IRSYObA8bbjJ?=
 =?us-ascii?Q?8IadAZEQiUKylcoTQ0GPcSgEUJ0UPMaX+j/7mwPZlMZeK+kXpF6gvhA1/1SR?=
 =?us-ascii?Q?fm6wJHn6k0xvhxeM5f3YEo3eOcD9dOkrEmWKdSsHOqaIPwS3I+RU4zaiToSa?=
 =?us-ascii?Q?GmPg5weIod4bZmMALoebDsNsDVu22xyw0q2IPU9yoRKn/Oo9QHVAlaGSoTu+?=
 =?us-ascii?Q?pycn864AZBi4Dh3+vP2P0D45UezLW6CYz6rt28HdXUdi2MgZl9SY/zg5tX+p?=
 =?us-ascii?Q?tBmdYwJrgQHuzR/6TvS6kcMjO+4z+LwEpYxb6XrCiJi7KEhlcKgQyCw3FFD/?=
 =?us-ascii?Q?UQEryQQLIj/mJoh4sML2bL8u25ih/ts0DICcvRz4ZtXyqC95n+ksQGR7DzQi?=
 =?us-ascii?Q?w6HdbsypDtR4RLn3hqanrYwVHVu5YbdtB8B4/nNuTuZmPLIhXHDyU9LkbELR?=
 =?us-ascii?Q?og=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b6f904-7b0c-4910-6ddd-08dd57c8ce32
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2025 07:23:32.0699
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K9WDQqk5b9cbMvoBWX8p0KqTeERB73if9d8SiNHS38V6/ZaYnPa1kQA41rdFFmwQlz/CZ39jueNu5IngTOjyYt98DWHLa/2wEuG07XJz158=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9888


Hi Wolfram,

> -----Original Message-----
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: 27 February 2025 15:16
> Subject: Re: [PATCH v3 3/8] mmc: renesas_sdhi: Add support for RZ/G3E SoC
>=20
>=20
> > +			/*
> > +			 * HW reset might have toggled the regulator state in
> > +			 * HW which regulator core might be unaware of so save
> > +			 * and restore the regulator state during HW reset.
> > +			 */
>=20
> Since this is a hard reset, can't we just reset the regulator to an initi=
al state? It seems strange to
> preserve a value when the 'preserve' flag is explicitly not set.

For internal regulator case this also works OK. In this case, we don't need=
 to preserve the value.

This avoids changing internal vqmmc regulator from 1.8V to 3.3V during UHS =
state.
Currently hardware reset causes vqmmc regulator to change from 1.8V to 3.3V=
.

-       if (!preserve) {
+       if (!preserve && !priv->rdev) {

Please share your thoughts.

Cheers,
Biju


