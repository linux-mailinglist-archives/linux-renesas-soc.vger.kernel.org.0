Return-Path: <linux-renesas-soc+bounces-15543-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72462A7FAD9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 12:04:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94852440840
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 10:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E835267B1C;
	Tue,  8 Apr 2025 09:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="P7BJhtiP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011033.outbound.protection.outlook.com [52.101.125.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737D02641DA;
	Tue,  8 Apr 2025 09:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744106091; cv=fail; b=Yyt8JF6s8KVj4swWareb3hmzK4dVJkHwdZoiy8RutJMIGAk9pjNmroOh3Kx1c5mdmYGYbHRjra1CWrRWrCUAamxlsczV/SAEqsvkMJsVc3JXk0j1urYMRTC8wSEWRUNcrBO0R2PkWTXXZgvfYDhgihmbzikJPGx8nu+lT1kLKmk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744106091; c=relaxed/simple;
	bh=AoR0Dt3g55jhTmekuLCoVGH+lVas4M5HwvX0V0fFgRo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Koqlylv2/90o5LESsF1Fie7WrPv5BoDa5J6NXKLJYhApgehhAluTDnsX7FLRhyOtaMG0AnP5DwHlr/c48WphYIBH7heCtS0YixfEp1k7PMooE8koboMQTECguSKO2EaxnQg69bhwWrvPX+KA4GQimQS/ZNXRANw2JVZyRJcUrSU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=P7BJhtiP; arc=fail smtp.client-ip=52.101.125.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m4kUqWVQMefwEKkfbMZS+VSy7nqkx1v5xJ/PK6hSBO6XT2baxrI4f8RdDPblqWMRRaxEGgMIrsBQxcxDPUP1ELXs+aqZBx4880swhaeZ8id6L/dOCUvLjJUmh6m2ntDwVo5QFKZRcIVHK1sJTW7yVpy0UoM29M44pACt10+kQwCZH9L6oTWLjjqWJH2/qkqRynTI81gDvfhlb49hPUiuo9HEZEyXQd5ofizt1ZED8vO3nMBlVOwDvcsOelAFyVJ25YIHmofTc+mDin9xdJYdodzjXhagy/XQPO5TsO7gYW8pVqhG9J+VSkV3qHmv+3lSGtZePB3xwoRawzTu1MZbOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XFDYXMzevothnuxBhair142ky/WFc24l/BkPi5pPpd8=;
 b=MRekncOrSpSOJ9Z82x25znyXzejky6XN9NOM28Sj456bqEWC/eReHPczxqrV5+U/EFOBqdgFAGLQTubLbn3WT9A//MY7PSFEccCxZTXonIvyRcHSlfRDUXPsmY5ZPNnitUWipadzzTnYuHMiJmUHmWuMHA/1YQS7m9VXM+vBJKObWcn1OuAZBle/ZvjtAu7GWvcdV3WmLUS6/qckEJxwOI8Gm5TQxwSKVXWvwDGHFqtwdLEXy+KH7tGvDRHtZErcaIWVhkvPy5ds0b4xiQnMfmTtnBPR8JK9dRQeeGQ06LXfP5VnsTQq1Ev+PKHHzWVaua6FHtOZ9Mpcot75YLHIRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFDYXMzevothnuxBhair142ky/WFc24l/BkPi5pPpd8=;
 b=P7BJhtiP5xcYFrW+degETP+vvVfNrpXygxD9GDPTUVZzNRlUHujb5k3gU2pRVRVYgxQ+CFy7X6YbazuFRPw7aY/YcNa3rkwOpGalNoqRF2mqrijB/+NR7eu8jfoBuwhZkV5FgTK9XeVDRvD6T/DAu3Dia5uqNGI6aKrMvlbencs=
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com (2603:1096:400:3a7::6)
 by TY3PR01MB11347.jpnprd01.prod.outlook.com (2603:1096:400:36e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 09:54:41 +0000
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155]) by TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155%3]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 09:54:41 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Biju
 Das <biju.das.jz@bp.renesas.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 1/3] usb: renesas_usbhs: Correct function references in
 comment
Thread-Topic: [PATCH v2 1/3] usb: renesas_usbhs: Correct function references
 in comment
Thread-Index: AQHbp6rY7uIqPctk3UOogtpTBoiIgLOZiM2A
Date: Tue, 8 Apr 2025 09:54:41 +0000
Message-ID:
 <TYCPR01MB11040F988A4F7040D4FB70746D8B52@TYCPR01MB11040.jpnprd01.prod.outlook.com>
References: <20250407105002.107181-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407105002.107181-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250407105002.107181-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11040:EE_|TY3PR01MB11347:EE_
x-ms-office365-filtering-correlation-id: c5ef6852-ee88-41a0-7064-08dd768361eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?SHi0a57MS+FWNPJkc/GGrmz4QW2ujVHih2Sxt/lbbnr/tIL8zeG8onr7q6me?=
 =?us-ascii?Q?CEJKaNrqBcpAtvFuNRRVqBf77NV3Fwv46u/6XZqd5ElSsak7Q9N0u43fbW0G?=
 =?us-ascii?Q?RvQz6xwkIh2cqpAMkhjMU4MCwdQ8pBIXJIeOoeiw9E/mlDd/rKuomJrIKeCF?=
 =?us-ascii?Q?Jd8FitlsT2qlJF2k4GPgw4SI4zqbQKmcWWwT6Xasr/6LBstzt2Ljb+atqmME?=
 =?us-ascii?Q?VVkLwvG8bps/e0CdZmn56VTxfA5mDD6NWdJ+3GLKwAH72QgdYZyavL3hDwnq?=
 =?us-ascii?Q?2fAKSnbIq9VWy51f80HrCfXKf4TIUCzURJpqolsadKFZMvp1KIOSeAEX8JiP?=
 =?us-ascii?Q?pz1LAURSJ28Zh896909t06qkf+M0E73DSdNaJWnZRabP9CGKEWHEdkZgXWk9?=
 =?us-ascii?Q?w3pz74nqJuLFwhztkmCpOE7x4WZtBPqsy+geGHG7E+gTdAfnpGipeTvncC9N?=
 =?us-ascii?Q?8H4w9VpRikbyMpe/vVomct3Vv90rw0xfzGuVviQgRRDgo5iOCaVk4mcG+pSM?=
 =?us-ascii?Q?sRXKdwQfO8/PrU1dtiPjbnkKNH/MaHVyWqVO74pSMoh9XlW2t2q/P62xpRYz?=
 =?us-ascii?Q?o1eQ18jCvd6DCTXafWwB8MY7KWkEZDtrAGWpDp5kNuBXtuQsiWw0xHA8MndV?=
 =?us-ascii?Q?O6Fyp5xOyNLYd4sWvJkbnqsNzGohpPaaHkR3jpYM6LjHWf9ccL7q6oO0DOe2?=
 =?us-ascii?Q?Y8KJA26g79VQpfX3Q1H6RDxw/ywGwFX7zs7Bwd176wnSTro9rVeUZ8PPMTt5?=
 =?us-ascii?Q?N7SoaknYVEvjAF1ksZsJ2SZfHNnLH1kIBJSFtslfKzB1dVT6q8OY83/UEqbt?=
 =?us-ascii?Q?lGcdezyCmmVbI0pdP2ty9L8J/lxMuC4cULEo956i+FI4tAhzRruoxZz62N2U?=
 =?us-ascii?Q?lcWk6MZTACvjCiQ+qB0d5ZT8DqFDIPouXFwn2ZYajB6ZMS2Zw3VB7RcJwTr5?=
 =?us-ascii?Q?FFrQlZ4JHQZhjeJCJkRla3XaUnIVOeQZoQaZ2LlCdyuOQYzXLOvZPDydtfsk?=
 =?us-ascii?Q?LiEtFI2qdnYbba0ne2KExYNLSFoPRqm4kzMmi1x+AnjFlfVBCRcKsJpeyL6j?=
 =?us-ascii?Q?S96lkx5voRjg4Ub9YrCfGnXL3MwBoU2T4Zoj+eyokMWYWGGCqp4OtkKQoJyu?=
 =?us-ascii?Q?V1EzehdcSbga+md6y56LHirq4wgn5E1Yfk22LZLGeaORiNRB/Ffc3lWayWbB?=
 =?us-ascii?Q?aTGyLzQFTzFUqaMYuhZ9wyJXxbjJACdUVlt3/EDWW0de1/8cTqH8SPZw/jd7?=
 =?us-ascii?Q?KesVvUGb7M+Pu0grLgiCHIVdZyQvulrhT2CqsONkgQV8qizIuiCn2bebL3GQ?=
 =?us-ascii?Q?TVfh3aVwRW36fX8Ocg8yNGLtrqr+eI1wFxXYO2XnElXB+cMLmh6UBo0Q6P1e?=
 =?us-ascii?Q?DFJ6ZDkzGE76n52CrxaGeDw3TjT5HDn7reOWPgvtDCVWug3lsrIDPZqcaoz4?=
 =?us-ascii?Q?ohbcxdT1Y5fmsJZi6WvV/yRhI7xTS6+q?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11040.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?5jXsaJGWHM3effCQs69Y7HOetOJU/TO5yKmMeozTY4LmyX65sJy9ZxpaVzYf?=
 =?us-ascii?Q?ejd6g9xOiuKU9cnHl3E2yQebp1jx8J4I8CV7jg8uFlwscrIPOiJ1DwVSGEOg?=
 =?us-ascii?Q?i/JtHqfbh3luywwGJbbtbZEvAGkjMfswFmr5WY/0ATyoSYBMpwqukhwRlQXX?=
 =?us-ascii?Q?B+FS/YZXkf/RaLQvjml2qdY7GX3ZidfbVrJheAl3kMaHVYyN9XeMAT6Jar0g?=
 =?us-ascii?Q?91zOd1GvKL0loTqlf+S6u11Lxe9BpwdelIlbzqlGRAnf+/KEXWwM0IO8fKW6?=
 =?us-ascii?Q?u9p+BrD0Xvn/EwNaHXN7C8gumfLLb/HqO/vx+Jcyu33/yk59783GO0WUqmaw?=
 =?us-ascii?Q?9EgsTjKBILRgq9MjyHKcsahpLUpmA+pm2E159d0xB8AtFckaJtGI7WYaM4yT?=
 =?us-ascii?Q?w1UpVfvn6k2PN6V9uckRc0RpHLXnzScJrGePLIBvkwhQz6OeNo7BDKlwhqko?=
 =?us-ascii?Q?fo/0k1qLKxBHLwZAxwOfn7wBoXQVIFpRMQUOPGfuyomDKCoFJpQIrQg5hbFH?=
 =?us-ascii?Q?kiF8inhPCLkle5jpAJOMrDSwnQIPXQ9GfmPL1F5l7BWpEo+vutWkvQnSbY2r?=
 =?us-ascii?Q?OnBVYDlpUmgyywpiDvwbzwpYM9AAiLDuI1iex/VU+uX9bt3ko3mJOZ6A8fre?=
 =?us-ascii?Q?aNOz4naV0XsPJ/yrnvBZGgNqmI/MjZSarz9QxBusCXD8jXvJsA9PDBJpFx8n?=
 =?us-ascii?Q?h3dOcAPrZY8FYQNmHaiDhqXa8pXH3h4nkWJdYf9Egf0KugPHdObqqouTl8hY?=
 =?us-ascii?Q?b/FvNFch5hdRGSg+cEbI3pD8dkKldPEacVnXZKHqMcxEIIZBZyIxIl55g5xy?=
 =?us-ascii?Q?J5tMJcrY0xwVjRJESfPMrCeit1U6RPMXIfH+RoyxeWMYT3SJe7zU16XAo1t6?=
 =?us-ascii?Q?pIfmLIWKN1peBDPc5z7O4hnmxasIBfrrZVB7d1+Sg3klkCATZbeek2G4zEws?=
 =?us-ascii?Q?zvV4NVSvx/ql59g/7Guz+0ICFtkEmDwAcJLmOJ2TiWRgNFjJ0IR1jX+mlQU1?=
 =?us-ascii?Q?3y0dzFIBQPJE+p0SiUpSejGISE3zslhXFWYaAMeJtkpODQz96tVXVxsbvBs/?=
 =?us-ascii?Q?egU/rmeD8RF2yA0BSrKcO/wJIUEnlrQfeoUdU4NCVcb5VAhwOlozs1gS20H1?=
 =?us-ascii?Q?Utt5OiTp7Aguv4nipu6x+1JvCYqrZbjS15XX/GSSjPamikDtljk1JfejckhY?=
 =?us-ascii?Q?qbKZNFia14PV5Eh6WJkSUO6NTm94BkWuBIMZdwRsIpi0fXSkYCoOPxUQ5cJQ?=
 =?us-ascii?Q?whKgl+CjmE1k8vHErW3WdOPQ6glc3mAIuDyWg05/jK3H5SSBv7shYzrKFt9T?=
 =?us-ascii?Q?wUQUQiPjXNXU42J+hu+DY7tXwV/w9IlPfZUIgHJol6Y7JvJXuXi5VEYUIjeI?=
 =?us-ascii?Q?lVkiJM5vtT6YZDjXKuUhqWKGRCqlRd5oECxKcIlzs9u3JlVoCPtBfV/444nJ?=
 =?us-ascii?Q?btbsNERem/zcxmueKzczN1Zoc+A5IWz1bz0kCVbWpanVgoeM3WMTMh2QFuhx?=
 =?us-ascii?Q?MMkMqSf9jfGv5tGwRGNH9HDMbLjWWoE7/MZyJz2DKgrftt26Jcq29C3FOcdt?=
 =?us-ascii?Q?KTlr6wtLRtlKU2u+XxqRls8ItYjrsIt2B8qzVW64fuAvk5HGXPFRshnBXZow?=
 =?us-ascii?Q?EKxKGl7LyurlwhOtOHPLB5ICq+gf16N5m8sD8z2DVD7nWEF9rSl5qT1O4lhe?=
 =?us-ascii?Q?z8LRjw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11040.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5ef6852-ee88-41a0-7064-08dd768361eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2025 09:54:41.1981
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6zT8syWMxXjESTMK/logYa61dldrj5BkG+oevfIjgh2J30vlmwoEaePhHvOekUPIzIMC9mF926DYYZ+nTFJ8QDDCCKKoHJUQp9qIDxLRuSUiX9opZEtp6SaQsCffcekY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11347

Hello Prabhakar-san,

> From: Prabhakar, Sent: Monday, April 7, 2025 7:50 PM
>=20
> Update the comment to reference `usbhs_mod_probe()` instead of
> `usbhs_mod_init()`, and replace `dev_set_drvdata()` with
> `platform_set_drvdata()`, as these are the correct functions used
> in this context.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

> ---
>  drivers/usb/renesas_usbhs/common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usb=
hs/common.c
> index 4b35ef216125..03d4d40c90b3 100644
> --- a/drivers/usb/renesas_usbhs/common.c
> +++ b/drivers/usb/renesas_usbhs/common.c
> @@ -698,7 +698,7 @@ static int usbhs_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		goto probe_end_fifo_exit;
>=20
> -	/* dev_set_drvdata should be called after usbhs_mod_init */
> +	/* platform_set_drvdata() should be called after usbhs_mod_probe() */
>  	platform_set_drvdata(pdev, priv);
>=20
>  	ret =3D reset_control_deassert(priv->rsts);
> --
> 2.49.0


