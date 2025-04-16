Return-Path: <linux-renesas-soc+bounces-16046-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 444CBA8B454
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 10:50:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CB9A172041
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 08:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DF04232367;
	Wed, 16 Apr 2025 08:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="K3Oi50nc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010061.outbound.protection.outlook.com [52.101.228.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A8C230BD8;
	Wed, 16 Apr 2025 08:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744793409; cv=fail; b=EuBA1y8P2IbYp3D023QkeJJej00BgTCkKG4SH7rjs8EENWakkSyrH1bswHWwkGjaQ6UoZlg95cpTm9JrCfuQFmVhvMIRQBvVE3R6B+m/C+cj5Onmx3mWNdo9LIsVye9DFlqiYvdxzjAH7z7G6rxOXj2+qdkZX2Q5ax28Hy9GQi8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744793409; c=relaxed/simple;
	bh=8bONC8FdoPLcFtGmAhSvvXmEghxfhbD2bR21TFiBEQQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=e0OViXPNJmvfaDL06QhKV8JC/p1VxNde0GkeBIUAoZraCsMxFbmd7Sbo17uv845lOOI0Z5oiXMhQlX3UTHmi4Dz8p5cp5dNC8sLUc6FdwuvOrEPHdjPVlU4TZc9+pCOOv6mzRnPRWlVLAKDg79nbAkvG0Tv8WoV8oIiD4UniDJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=K3Oi50nc; arc=fail smtp.client-ip=52.101.228.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EQu20K3EVV5rCsBQi8RR3YNL3kii82NQckEQxw8Vc+5jcBj/nUrUnKyCSeXm6E9X6TjAqzdwDnlnPrnMqBsVDcNdQ7j997RnT8yLtdj5PxCX/C/liMLYqRrzI0w/sYKuizGpB2s8ad+EIMk8n1/KG0c8ec+WDGR0qfMOxZkKwzf388lJNRxUoDf3m5gfZPs3zgoQeFGRAT0y1Ev7+ITsj7mxpqeLm/GS/0bND2FG5gLGiPNicxz88nnD4xOtpqxRr5AOQT7UNgu7ERCCYpldac45oJTPcOPAsh9rPpUz1OA1ophUjzHeCkrZ38QCNOWkFzaIAwF6jTcUdMub8CZAyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vlAxaIc3fBm1U7U7qKC+bV6//DpL4DAY92Y6xa2r4Cw=;
 b=nEYQMbEBQBfPNQe4U8gS1PHPuzbeO4Ds5iQ6WtrXm8YDb7uvUMAIuUHst95zOdXtitwTjinTiO7eEHYKt2BE8Yxzd2VYPJ+W4tpou3YukLxtZpFIMwSFZyY8ZbMLNnVPdlihDSLd4v1fTO6OrAHgD2epZ0n9gwisis5epjTi43tEUErmYTVvB3vpzU7eB8Hjhzpbt40DFrKXb5vp7GJW5aITW2RWRKmNLyn7M7xc+KvvL9AdMJVq7s2htgEGouwhMfOMNm4esDpmXJaXeVnG4YOIgCKadajFy+hVtC/RnT+bOeTfO2Jyf0ZiqEJNtX4JwxcAofmKwVJk4SdJJgXLQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlAxaIc3fBm1U7U7qKC+bV6//DpL4DAY92Y6xa2r4Cw=;
 b=K3Oi50ncbi8ljRU+LhuQCOqNBLsz1HkcTTtGQOyVa7aV52sWKbNfMyIRPKKPRnClrQyD+7xXRYJjlxVV4Tw29OLW839mCbFxJga58++In+kASa2OReqCYoc1GDWDm2D1/ZGKuKMHSBFE+8x1F/UUmpM/6a2rZCvArf1HRnO1eFw=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by TYYPR01MB10545.jpnprd01.prod.outlook.com (2603:1096:400:30e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Wed, 16 Apr
 2025 08:49:58 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%4]) with mapi id 15.20.8655.022; Wed, 16 Apr 2025
 08:49:58 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Biju Das
	<biju.das.jz@bp.renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH v5 1/3] dt-bindings: reset: Document RZ/V2H(P) USB2PHY
 reset
Thread-Topic: [PATCH v5 1/3] dt-bindings: reset: Document RZ/V2H(P) USB2PHY
 reset
Thread-Index: AQHbrj/PkWRon2DrpUOr1rcqOAtvzLOl/Fzw
Date: Wed, 16 Apr 2025 08:49:58 +0000
Message-ID:
 <TYCPR01MB120933D9A33D2583E8E842D4DC2BD2@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20250415195131.281060-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250415195131.281060-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250415195131.281060-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|TYYPR01MB10545:EE_
x-ms-office365-filtering-correlation-id: 9c9b32ac-78b5-438f-926e-08dd7cc3ab0e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Ij3LxcVc/Ns2J/SktpfOJemftS0689TOiANSBnqIA2RZ9hYNQyGNedoD+M33?=
 =?us-ascii?Q?8pYSNp1sQyaPEuSqfA+vhSrOa9AxHExPPDWPsU8GCstdeg7W8fzc0gleckNj?=
 =?us-ascii?Q?faryEdPdPDqDRwXKzxWRGOmZwGLO9xhVxDHHHZcl98LLgW/JM2vmXi6P6q/x?=
 =?us-ascii?Q?D7LQnFFZlUCkacdEl0TUfJUhsPX5tJf/KiMmMepE7tz8KbwGnPZkw3Jt0WzY?=
 =?us-ascii?Q?zJA3pdWD/MEkbvJzaHAOljmbEqyMx+8kcUsAf6cXCYZMMv39t0/GP2vyvykg?=
 =?us-ascii?Q?VlcxFDxlSPyKwgCEUQmI8/SV9xhkd5xqcZYQcnFRlWm9uycMIKEobEiHBvZP?=
 =?us-ascii?Q?hQ1EsEX5vTSBy0v/e83J+LVXWjEVyMdREx9CCAg7Lu14bzSACt6LvZ8hvyl9?=
 =?us-ascii?Q?7/Su2ghbwSg/MFO3hYt7glpCPWT+QbbawQOWs1ta7Ag925ch5Q+L3HPydnTl?=
 =?us-ascii?Q?iBUh/GwIW1WF/8xaUCrmafl3CVU2uCrrbvRguWJcCFRmWilf8Bx6wiOS/nQT?=
 =?us-ascii?Q?DFUGO78aOUUty2tGyy3OLnVxdOXfmVVyOFamgPk43DrPJHXolPABlIGsp5Gb?=
 =?us-ascii?Q?cazyVWnc/ZoRhwgn9O51qTGJ/9FeHiOLDNMPNw2z43EAntBCwIqVH1iAoKeD?=
 =?us-ascii?Q?tumPD+W1DGSlCzj3pTyyTUKsf8DbmslOONQiSF37Iig5pnOQniqe4W1WaHL1?=
 =?us-ascii?Q?A74o4cFija6B+NO1PpMhXLhKqgku107YL+ltIOpWCFhUnUMhzGgLnMWp3dfA?=
 =?us-ascii?Q?FS8zDO5XbtZn9XfnnPH6ZlYWIFIkQxpMC/dx2nPwb05eU4DR5dB3BPFwEndF?=
 =?us-ascii?Q?sxmgzWkPNaEMK6orrg6veXY4Di3tjM56+9dbHBtD9eSQSW6GyAhgcs4Yuskl?=
 =?us-ascii?Q?r7yrgg9NfWn+Y4FM6ZcWum/0j6C1qbB6qPJe+Fo1Xq6UJWfe01Tm9Tml3cNY?=
 =?us-ascii?Q?BaSqnG7p18KB9x65Cemg5Tgqp1P5TrP5ikhgdxKvV2WVRCAId0E35QFMkDNC?=
 =?us-ascii?Q?JkSL8/GX1mHarXEIVwWWmsAakCLL+JyZX1er2E55htOiroWwTCAqoAyfTBwM?=
 =?us-ascii?Q?cEthxqu4c8HUg1pl0mh4XjiPTl5Qibk4QNJa7l4uhxJhxrUuzXcJNSo1B3Gq?=
 =?us-ascii?Q?AdqeSALvmCuvA3WBBzLtWF6jPuEdmoelrO7acXN5HdV81DpVjGuE7JxTfG1Z?=
 =?us-ascii?Q?BzXVA5kycQyma+qjBlxYwGhhXT4bsHY9HAU4EslrJVkzZtLN3qPMc+PFBh/L?=
 =?us-ascii?Q?G1SCoC6q2LU1w6KKkRuRoA+KoxlanIXCoFoQcUwhvx/fun6uLPQT7e1b7cFZ?=
 =?us-ascii?Q?dGLMR7ule68um+VjODb2xZKZk1EyeJmbTb1tNgFGFKM3cU7zD+Ot6MpuyU1/?=
 =?us-ascii?Q?IMYfDF74Tat7YAORrAy4U7K/llv4Ma77v6N1Wjwv5EsBTvyDQl+bB8XMXXpG?=
 =?us-ascii?Q?uHlhA7VqCXk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?KIH+tFUus930dWCZ9OJcmeavfn/CSv9bXMU/0ssLitQd8RvZ9IITyCbkQEup?=
 =?us-ascii?Q?krl1yx7psnMkm0ZnsbWcRDZrwkjAcWbNT5RG+qk+ajCoGZ7qDqhQztI8Hf9+?=
 =?us-ascii?Q?zIsU9vG95LIROdvD08Ce/j5qCdRQk8+tPaSKukw817Zp5fjZD3l0+bp2nvn6?=
 =?us-ascii?Q?vLWJVcAtL0D6HPUFEki5rbZCfoWOIhHHx3WhC2wEezaI2tBh6jiItNEbWNtw?=
 =?us-ascii?Q?Cfd/gIJNECI8j/klLu2vVSO/2ZqfLNpmZUNpFByC8qFZcW3BcdCsfyvFP78u?=
 =?us-ascii?Q?RUsqvRPzJWVzdg066YhOqE+DfE+p+TljpcimLQPX97EsdJ8UCsaoL6VQB0XJ?=
 =?us-ascii?Q?/sFNiOyy5xWZLHiXkBdgznj/L6aPntT1JXV/TdFOEkO3InFzmsuCQ6+Btv98?=
 =?us-ascii?Q?zS/trJBYg0CZ1dFAoHhYvfL7pxnzCraooQaDuxxjY3xyhouuIAyWBPdy/G0b?=
 =?us-ascii?Q?MEvbg89+OnANMJnoSjqWwRykqPSgdMdozRzKifZNBDsSfZ/3YnJq8yqUVDJY?=
 =?us-ascii?Q?mLfNOJnSwfKAW8ujcNNOWiTJYCSnndrrWdIqi1hDGVvh4U7cZVOcxMlwqnnG?=
 =?us-ascii?Q?THkvX53vraRO86ssH2N35kSPc8JrDl8fbE+c3lpPxS/gE4jBG8djK4djbFbr?=
 =?us-ascii?Q?0x29j3DtksGsbtfjCEWBVfRAfrpWGdg7fEoMuSLv0vLv+3nb0xj/65QH5DN8?=
 =?us-ascii?Q?66ghXvNY6ehrzSvOagN1rIPm3Q3hIIGiwCp49cKwFjV7sqbWkezqKM7iKqRF?=
 =?us-ascii?Q?epAzSuYcOsc3uS7rCYb7NNLL57DuDTY7oMGR6+RmXW3hY7H4faXGm7NvIuyN?=
 =?us-ascii?Q?nWIcRgdaky4rgWTBAWK2GgSudPfpcv/aG9kdCNQUdCo0vlZGp2B5monwErpd?=
 =?us-ascii?Q?MBGy66a5jsaF4jwr1dmzdALhATKT2JmiExBtqJX0lqjkb/eTGK0FEnYCOE7O?=
 =?us-ascii?Q?rFpiKYoc8JdhVaq7vM71fut3qOKDF7oKo7OL+I7jbWp2X17WYcMDiuzkgT2t?=
 =?us-ascii?Q?lUleBV61eBaoB7R49pYpyxNXEVHa+0+/gnKyMC2X+8m90ksaWIX5JxAt1o/D?=
 =?us-ascii?Q?KBDZA//aKwdYQzZ85xs5kDOjPmwXZTkf2MNDevOAmYEps10RJPueMOtgFplW?=
 =?us-ascii?Q?boTwDl1szlzGCeUUY3YITqRKJhkpGux8TpBYeg2Y49wHyTyvDAbngMJ966PT?=
 =?us-ascii?Q?gpPJKTa1dv++AsVp6NlM9PZNt8e1x7RHPJNf5UqAz4d8cpQC7KTP8glwYozk?=
 =?us-ascii?Q?2ECYkh8u6qPBGhMk90s1EWUHZGjdmuAv/3KXteo301BZZL7yrG5kWWXHpxQY?=
 =?us-ascii?Q?3A9jGSTeGrkDAVy3DEzD4PTL/Sse2VcCjrIyke91v7XquV7Y+lc8DOzOOpg6?=
 =?us-ascii?Q?lA8rMuiCIMj3OZT7YbHrwKtwXJuLvZHthtl6JX2Hosq/6Lv6S99WwaBnx1sf?=
 =?us-ascii?Q?CNy+VIFb3UgCh4+Yp8hdmIVyr6aF641bGxjUjvohm3JRNXK9nBlUwbwtMMLC?=
 =?us-ascii?Q?zZYRRZxPtpMY2Tx0CxEi3L57Ep2ZGvuQT7iwtFmPZNu9TFbZuX0ttnkSeZjh?=
 =?us-ascii?Q?czrBGhXwXhz72YWakwsVvEW+nkAy4V/0C4TWJ1YWUrOo63iXB1KyWXZY2b5s?=
 =?us-ascii?Q?MQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB12093.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c9b32ac-78b5-438f-926e-08dd7cc3ab0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2025 08:49:58.6425
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9pbORoJEXNceiurUD4JsX5WFO3X4FXxLLxtbkDipQEZuV7GYJvFDYBBxvTBln4im9jR3QDQRCv2Po5AgCcF4YKbREp9CaLYoZ/SkIwHWw8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB10545

> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: 15 April 2025 20:51
> Subject: [PATCH v5 1/3] dt-bindings: reset: Document RZ/V2H(P) USB2PHY re=
set
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Add a device tree binding document for the Renesas RZ/V2H(P) USB2PHY rese=
t
> controller. This block manages the reset and power-down of the USB 2.0 PH=
Y,
> which is used in both host and function modes.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

> ---
>  .../reset/renesas,rzv2h-usb2phy-reset.yaml    | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/renesas,rzv2h=
-usb2phy-reset.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2ph=
y-reset.yaml
> b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yam=
l
> new file mode 100644
> index 000000000000..c79f61c2373b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset=
.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/renesas,rzv2h-usb2phy-reset.yam=
l#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/V2H(P) USB2PHY Port reset Control
> +
> +maintainers:
> +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> +
> +description:
> +  The RZ/V2H(P) USB2PHY Control mainly controls Port reset and power dow=
n of the
> +  USB2.0 PHY.
> +
> +properties:
> +  compatible:
> +    const: renesas,r9a09g057-usb2phy-reset     # RZ/V2H(P)
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  '#reset-cells':
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - resets
> +  - power-domains
> +  - '#reset-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/renesas,r9a09g057-cpg.h>
> +
> +    reset-controller@15830000 {
> +        compatible =3D "renesas,r9a09g057-usb2phy-reset";
> +        reg =3D <0x15830000 0x10000>;
> +        clocks =3D <&cpg CPG_MOD 0xb6>;
> +        resets =3D <&cpg 0xaf>;
> +        power-domains =3D <&cpg>;
> +        #reset-cells =3D <0>;
> +    };
> --
> 2.49.0


