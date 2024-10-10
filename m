Return-Path: <linux-renesas-soc+bounces-9655-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60ADF9988A0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Oct 2024 16:02:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80B771C2421C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Oct 2024 14:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A52121CB53B;
	Thu, 10 Oct 2024 14:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="boaD5Xko"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011063.outbound.protection.outlook.com [52.101.125.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591761BFDF7;
	Thu, 10 Oct 2024 14:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728568925; cv=fail; b=nRYaj/bIeKC0FY1N8abV+F90uruJQJRNQUFDqjIxBAWTj56zdbBpresJRmzL1ZNnofmvGmj3CkoGhQtTQoR3ng+4nwuUwbui17kKmMwAgLraCqQxOJtSb4f2hA6pXvnPoAC8NULeACxKHx73LzfbxgEKo3VcOAeJbInfl/WDowQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728568925; c=relaxed/simple;
	bh=qPjb/M1avsHt3LgBnGSFscAmUq2arX8n2y1Pv5cfc0Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZGTpdPbWMLhIEv12dwNqXulxUvMwwlEpGiZi27epqwX4CpbW3QWwH71wS+fb/Lmr2GroKdaEiEZo2gG5seP3ATOInRVsofBBoUQcIxFK3/zszCAekQxCp6+kH/tA3+R3y9k3tQrqBYNp00z/JALhpNYhdSFDI+Xk1Xpj222v9kw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=boaD5Xko; arc=fail smtp.client-ip=52.101.125.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hm5o3M0/TQGAzg19JKyPjJk+RGt4tXVVBAI/+HgdbGzf0kJa2dRRlYDEwQuQlU8tA6wQ4xIEfhtkgI1gRzMCfU7UJNuvX4zxZ72kYxxHI83tfw/ix7MDOmBJgbC0XoZjSlgn3dK1YwZhYpBlv0ABjEtwgf8IspohSbhy3S4KxgRpDaV7XmZSq8mq67pw5idGjfIew9hmJ97LP+s2eHChREo8Q+T6Q1Z23Mfopwlm7DQLYFmxwwiTNueLwC/LzpcnPJOLMBFdK6az5c37p0MQEuHN950bzbIa7xp7/esF1cZ2KAkZdj/cBJ/qn/JlOxHRUSzNrJjEXHgXddHMXdJiag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y6f7PNhmu20WZppGvUYBaZ8jzE6xq4oqqD5GmcJFnqo=;
 b=Raq+uwdBurB6lxhKZNmuBxRPRLBIUo+0EHURqG3ZAAdPXX+euTI2qIhhNIrtFpSCyg5MLV9oBEDdhlYTEi1BEeVUI7q+JIkHcQ7yTG0GLHGKa9/DUyJ+71s7mG9lGinuE4hQotmiLuv8zyQpQ+3QoA5EvMa23if0Z5kVe/i9g1ukMr8Xny98+hlI6Crn1xrIJYSexSOYRz7Ujuoggt+L7p1gmMIkbwKtf9jJGL86MLNKvK4KUFfU/iDIYZ0PmnsKex6sfhDDQf1iYeFFBCiJDRgyyMnXAgPyzruy3AfvVnQ9PYa3Z+BDrXrQJ6msnVp/Xi/YRohYSIhc+JdKWP86VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y6f7PNhmu20WZppGvUYBaZ8jzE6xq4oqqD5GmcJFnqo=;
 b=boaD5XkoTuwUZtx1koixNOMTGh1aYsYSm7I2bwKJwSPQ78stAFdwsOhnfkB0nVVNcIZTEB/0UnjUYavUlKxQeirHw63SWsHwUjhs0tAkwiGcXl3N+dl5tAdE/l4WVA39JzBBdplme6YJNQdYfDgTnpKAhyda8u7s0weyIJrRPWA=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by OSCPR01MB12588.jpnprd01.prod.outlook.com (2603:1096:604:33a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 14:02:00 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%4]) with mapi id 15.20.8048.017; Thu, 10 Oct 2024
 14:01:57 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Thomas Gleixner
	<tglx@linutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>
CC: Marc Zyngier <maz@kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2] irqchip/renesas-rzg2l: Fix missing put_device
Thread-Topic: [PATCH v2] irqchip/renesas-rzg2l: Fix missing put_device
Thread-Index: AQHbGpuiTlr+0/laOUK4Rq43ubhf3LKAA+dA
Date: Thu, 10 Oct 2024 14:01:57 +0000
Message-ID:
 <TYCPR01MB12093C8A46BE0F9B1A79C93ECC2782@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20241009223539.788638-1-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20241009223539.788638-1-fabrizio.castro.jz@renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|OSCPR01MB12588:EE_
x-ms-office365-filtering-correlation-id: 94b4861e-613d-4549-d1e8-08dce9341a8f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?a9s2iblL8fCxjXwJj7J18mvfNN2BP2f5lkYIEFedgGGmUN9t5DWLSW2uDsnJ?=
 =?us-ascii?Q?vgpOYGxsTYNfj4U7nwZc4yxjnVxNZYK6QZxH0ie9gCHxju70939euzkr3ZLG?=
 =?us-ascii?Q?dSMs3m7mPdy7/DK9rYp/NLrC4Bmn3x9Li6rt6niP0X1kqH7Lh2g4HxwPueZL?=
 =?us-ascii?Q?C63fC6P57ZinxXlaxEwVjzhwu6IkJQBfx7h1si+JC6/V+l6rE7HuXX3H85Gu?=
 =?us-ascii?Q?syH9FvTzLc7/IZYz/UfIlW3v1yEiHAz2m3rpracLqsvJD+twPeRtQSeobPJr?=
 =?us-ascii?Q?wXFKsidYrik2ri62AgVYRlNn+ik0LZtk5MGL6OutSmKqNQ1Oxc6fUAgyc9d3?=
 =?us-ascii?Q?Wh1Z73Ni2mQwR2N/LEuMwcrXy5XOyZfwevnj/BlCPuAOI046C96eYCQpTFlb?=
 =?us-ascii?Q?FN4loewRCUJZXdLYidwngG/+gZMpooVwZdBvh91mNChdjgFtacghvdum5Klz?=
 =?us-ascii?Q?c9Fw/WhLXKvFsr5DKohYlHQxPyluDjb/hgt+ly07S1jkRGR+M6Pu1jDPRQam?=
 =?us-ascii?Q?UB6bXSrwbIr3NkjckskTa5tfx/9YIavWZZhmduMwty+KOTTtOC6ZWoUdxSiu?=
 =?us-ascii?Q?G8Q3chtBODAInHnN7sc/dTlXp94kw/NcGUDULKqf/JV9Jps6Pq9x6Ruao/sp?=
 =?us-ascii?Q?C4NKDCriT2gCbXpx4Af2k4/Pl86SdfJ/JTgYeHbXxYZaX00EGQvZN+eA7qut?=
 =?us-ascii?Q?24yJj5PLN3ximw3bGxH4hwAVnMgBUQKH6mRYagvCVxvq/3bdLKPEwxw4cXE7?=
 =?us-ascii?Q?5YiB4bgbvqu4L2A/8GNdkdchQlyRYSwh00zfjr4wjeQe2elYsfFsrViIWB/R?=
 =?us-ascii?Q?IRab9eeF5Wc3k14HXrn5P2FXFxLax4Wfn6dB1pG0eMegjIz69KqM5Ts8iYP1?=
 =?us-ascii?Q?fc7rPvFWplSmZtQEOKSsPpy4uYJiRc91l4PA04GaabgK6x8L3+TBrpvQC0Ji?=
 =?us-ascii?Q?pDQunu45N1YjKcV7d4XYfqe6muHeryXTzB5t6hFcjJvE+3086u0Kd9oeZPOj?=
 =?us-ascii?Q?ubRxL1E1oU9yZAYKv1aJZ495KLMjpi5JZd8HN42pEG4MfqqW3fYD0581WiSB?=
 =?us-ascii?Q?p/c9tHt8d+FMXFUbYjliAzNRqf8dq+MJ8dfDbsescJbsLqduDCHFeXKy+q86?=
 =?us-ascii?Q?Chh5Giwbl8vdAHOF+H5DzNZ8cYSnO1PGlgMz0NKxDuV++kXSIhNukdRCPOVY?=
 =?us-ascii?Q?Nqzzb37abEduEPNozJVg9WWlavyBiuQr4GCVrwAYpvjAgIZN+m6ViQxSnBM1?=
 =?us-ascii?Q?gs7wo6CkpJNBhPv37EnJncMATk6Z3oQuI/A4b5vwrwRl9g0Zlfp5I6YhBBUa?=
 =?us-ascii?Q?SVSViSjWZ4ORCI/JlzLhKuq53gK61Pul4jQHGh3VuQj25w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Qe1mJ46Lkc6q+mJJPMzZnL84thUk4bENaU1ZZHxvwROB/RJlf5TVcXZMw2el?=
 =?us-ascii?Q?+mp7ijtvubAsztZE51+S7mFE6kvZWR0cgwrWRcLCoWpNHU4M/E0+5t6wNa1S?=
 =?us-ascii?Q?Ua0ng7oXh+xW2sOwIWW1Kjm7alaNY/AilC4ItxFEWdjdlWvtOjk/HEECnsdB?=
 =?us-ascii?Q?7CVegbwbbno2NCxHRco4l1uqHROOPVjSmHHuBNCA3mz8Kg7nDA6z3X/fRIUL?=
 =?us-ascii?Q?ZbSHXr0CctJtgrSZ3D0oWtvl502fAvQ9nEFNpkxorCE4xt4jbDD6SqTGRhFr?=
 =?us-ascii?Q?2qayPP73yg6FguIYWhnG9BzwDqK+YSG80D1zu8y1HMjE4MRZhUX1+AnLHobw?=
 =?us-ascii?Q?c4cpqiIBGdHUyJd9CNPVPW6o9siRfELmfRdr/0dYD8I19D9QWnhxx8S5VAOf?=
 =?us-ascii?Q?tpdkAdXG04oZpifNGt00BKEO0r+UnVvmM4f3gNZshrYGxIA6D3rjgk0y8M4h?=
 =?us-ascii?Q?bsrOE2q7eYXDMc1kyK6jezhc4CvEyV/CDO7fWmRa31hPJ9rAmU6k9FiAAAzd?=
 =?us-ascii?Q?fksDlUNXpQtqnyl9pU2Jf0nMLo4Lb8yMdZBtFTwNW88HO5UQTqi47ed4VzTS?=
 =?us-ascii?Q?kcXs3B5P4rWEe2nTyWBMDVAmxGF4IWGrNoLhhD9njzXpIddxq6Pv220E3ftJ?=
 =?us-ascii?Q?b2ZpwGLVlMjdkwYSF1n1b4jWUx6yfk2pQ27Zha+i90u53qgOGayfwj8/cxJ3?=
 =?us-ascii?Q?CDU1HSYg/Y/czSXhLDqXMVHBvbNn3CsYzJaHAzrrL7Jd8QUA65/fiALs0nLI?=
 =?us-ascii?Q?wFJaMj9je+nBweM0WsYxm6VyGQ0Z6dFls1fqnxW/rIQQTANnvTqu1cAMqaQu?=
 =?us-ascii?Q?mOTWZ8sXr6KqdPVcFgB43ZRhJI1hMnTEW2480pP2UXMrwN1YJJHwWXUhUF/+?=
 =?us-ascii?Q?eviVYThm4YFt0ETIDkpldcBUbwm+AA8CdFsI7whAWOydXwKnMids+VK1AYdQ?=
 =?us-ascii?Q?k8/su1wdglOJOV5MbfX90f6j5eBhnGU/ebwi1Oayv9j/24mP79bY4fxVYUNI?=
 =?us-ascii?Q?9OXDmmH3jDHcsEMU3rXVA2HMa6IbjjEpAui0HRU+T1iZrO53ocpu85nERh18?=
 =?us-ascii?Q?HHwYR5UktGYa+74t88aez6dvPp3wcGhluecmV0gRqWqJ7pfW+AL1RTP9EyDz?=
 =?us-ascii?Q?yGnAHtiQFtIJ/46A01vr2IN8j96+7y6bxWqC8CP6cUd/W230phH/RRD8lzPk?=
 =?us-ascii?Q?Fn1thez/1QZFy0gc85yhnmWkB+T7n5rYg7mNItPgY1qIpjcFwdpYqrD5uOes?=
 =?us-ascii?Q?5LBL5CYQCNtLvQ/Y2wKMPCaCd5hJ2WVhl9juRxoOxZ6eMWsplqzdGRAO3JT3?=
 =?us-ascii?Q?GdXt3N0+ikZZXxlK6j41rzqWIM1QbYDzhsdz9CfdTc2lDxKSS5kiwozeGDAh?=
 =?us-ascii?Q?nTT4gOICXZSoKLPlvDwXY6eRdvZXSaOy7epS3YE+khczuxOIDdTEqDbiJn10?=
 =?us-ascii?Q?8tM6sMkZ5BnGBpWKgjDI4K7KSULv87obucK7YKPZip35p5RO8mvOTuaoLZXY?=
 =?us-ascii?Q?q4N1O84ZNGFto/lGZbQ6yoPeDDk2RAHsS9l4R+XuaDBThYatMJ3E5fJebNFi?=
 =?us-ascii?Q?CQnToFLdOk6igLq954z25jhGn0bHNENK05ojO/b4ST70pwmxk1o2VUNtFjCH?=
 =?us-ascii?Q?aw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 94b4861e-613d-4549-d1e8-08dce9341a8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2024 14:01:57.2763
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: feiaElgMN41OO/Vcefk3m6d2pohU1cNfTQbwnImr6OjoWaLTe5MRmX0+wwhUdjKqIbw6V46sSfrUaJDhGDjlz4yQs6sy+V11VXXV9yVhLfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12588

> From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Sent: Wednesday, October 9, 2024 11:36 PM
> Subject: [PATCH v2] irqchip/renesas-rzg2l: Fix missing put_device
>=20
> rzg2l_irqc_common_init calls of_find_device_by_node, but the
> corresponding put_device call is missing.
>=20
> Make sure we call put_device when failing.
>=20
> "make coccicheck" will complain about a missing put_device before
> successfully returning from rzv2h_icu_init, however, that's a false

There is a typo in here that deserves a new version.
Instead of rzv2h_icu_init the message should say rzg2l_irqc_common_init.

I'll be sending a new version shortly to fix this issue.

Kind regards,
Fab

> positive.
>=20
> Fixes: 3fed09559cd8 ("irqchip: Add RZ/G2L IA55 Interrupt Controller drive=
r")
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
>=20
> v1->v2:
> * Drop put_device from the successful path, and add a comment to prevent
>   others from acting upon make coccicheck output.
>=20
>  drivers/irqchip/irq-renesas-rzg2l.c | 32 +++++++++++++++++++++--------
>  1 file changed, 23 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-re=
nesas-rzg2l.c
> index 693ff285ca2c..040463e3b39c 100644
> --- a/drivers/irqchip/irq-renesas-rzg2l.c
> +++ b/drivers/irqchip/irq-renesas-rzg2l.c
> @@ -542,33 +542,40 @@ static int rzg2l_irqc_common_init(struct device_nod=
e *node, struct device_node *
>  	parent_domain =3D irq_find_host(parent);
>  	if (!parent_domain) {
>  		dev_err(&pdev->dev, "cannot find parent domain\n");
> -		return -ENODEV;
> +		ret =3D -ENODEV;
> +		goto put_dev;
>  	}
>=20
>  	rzg2l_irqc_data =3D devm_kzalloc(&pdev->dev, sizeof(*rzg2l_irqc_data), =
GFP_KERNEL);
> -	if (!rzg2l_irqc_data)
> -		return -ENOMEM;
> +	if (!rzg2l_irqc_data) {
> +		ret =3D -ENOMEM;
> +		goto put_dev;
> +	}
>=20
>  	rzg2l_irqc_data->irqchip =3D irq_chip;
>=20
>  	rzg2l_irqc_data->base =3D devm_of_iomap(&pdev->dev, pdev->dev.of_node, =
0, NULL);
> -	if (IS_ERR(rzg2l_irqc_data->base))
> -		return PTR_ERR(rzg2l_irqc_data->base);
> +	if (IS_ERR(rzg2l_irqc_data->base)) {
> +		ret =3D PTR_ERR(rzg2l_irqc_data->base);
> +		goto put_dev;
> +	}
>=20
>  	ret =3D rzg2l_irqc_parse_interrupts(rzg2l_irqc_data, node);
>  	if (ret) {
>  		dev_err(&pdev->dev, "cannot parse interrupts: %d\n", ret);
> -		return ret;
> +		goto put_dev;
>  	}
>=20
>  	resetn =3D devm_reset_control_get_exclusive(&pdev->dev, NULL);
> -	if (IS_ERR(resetn))
> -		return PTR_ERR(resetn);
> +	if (IS_ERR(resetn)) {
> +		ret =3D PTR_ERR(resetn);
> +		goto put_dev;
> +	}
>=20
>  	ret =3D reset_control_deassert(resetn);
>  	if (ret) {
>  		dev_err(&pdev->dev, "failed to deassert resetn pin, %d\n", ret);
> -		return ret;
> +		goto put_dev;
>  	}
>=20
>  	pm_runtime_enable(&pdev->dev);
> @@ -591,6 +598,10 @@ static int rzg2l_irqc_common_init(struct device_node=
 *node, struct device_node *
>=20
>  	register_syscore_ops(&rzg2l_irqc_syscore_ops);
>=20
> +	/*
> +	 * coccicheck complains about a missing put_device call before returnin=
g, but it's a false
> +	 * positive. We still need &pdev->dev after successfully returning from=
 this function.
> +	 */
>  	return 0;
>=20
>  pm_put:
> @@ -598,6 +609,9 @@ static int rzg2l_irqc_common_init(struct device_node =
*node, struct device_node *
>  pm_disable:
>  	pm_runtime_disable(&pdev->dev);
>  	reset_control_assert(resetn);
> +put_dev:
> +	put_device(&pdev->dev);
> +
>  	return ret;
>  }
>=20
> --
> 2.34.1


