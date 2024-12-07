Return-Path: <linux-renesas-soc+bounces-11046-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B13909E7F87
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Dec 2024 11:29:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 566C91884484
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Dec 2024 10:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C3F813AD22;
	Sat,  7 Dec 2024 10:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Lp7ex0Jn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011059.outbound.protection.outlook.com [40.107.74.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EBE45005;
	Sat,  7 Dec 2024 10:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733567384; cv=fail; b=Kq/XrFvl9OrNYHCzYItI7Ke7HMjh+ToUqF/krdsikPlB1/LjNl9j6Nyv5ZZvi0XPr6coQEHajLHX/JhPXwl5Fx7JZV7jXI2rIouVZSsWXVObD4YfZZ1dNZnsENPclwhPDQxQFCO0C5of1TTYJuM3ssXpLdiw01zo+dZTn6vT26k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733567384; c=relaxed/simple;
	bh=zPzCcqJqNjvcs1inYJpz2zAcZdPMxZdOPHTpNGon7VA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YexlC51URw2JMZcagUUTqqds5cRtBvVwRLPEl8joxBu661COjtmt1NYCwvv9Q0zbJjeAl0n2qI3clxv0aXfXjhwaK0uMcnDmt6AnXtrg/qwyK9qiKNE7SnYPOC1JNM0gpZmnfU4oD6hs2Pk4M01+T2ct6pVkP6yuhHxMSnha7pA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Lp7ex0Jn; arc=fail smtp.client-ip=40.107.74.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CVKmnzNtMzRV4GveHJhp7NfFHnG+0JYyu2SddMj7Qjc0YzzyALuENtROvGwVYuBGXvEIfH2L4reECG3PkW6Z17/C8WBfyhuHh+txezf6eDwtk5LwLg9zthU+HhrqjSfd/s1vRCeISNdiGfcBRfamjLgJT0p9D+T3Tln46TySzK+fLT66BV7/DzhgIObd6wDb3EAyVjHsvARBVUBdq41Kup3uGL3lygPquO/i6UzaOjSE9Ip+Mt6Nrq1CwfcPq0UDp7gGMbq5r7a1rZ/U0bWLJXXej4bOVpiZTTsoKhbIh9SHwt6TRbk5NvMTz47r3kW1dzKFC/5xSkZ7PpEM20pe7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tXPk8MG5wtlr5I8YTln/6rBg2zXw5ROgbVhh+61naso=;
 b=zInCyJshc9hBxMoxVnhe+bEStNOYXVYTY05yC68P3EGHLtAnoPlPQ48vQLug2tIDVOg47Zo+oHTyS0uCPgl/jScncuB5OAz23KYUnpQYqlbLdGxyFPNRE6KBAXdmwL1Zy9euvAJteN01/B5fya3TZ6C/byUE1vKNv1oiZ+41SNmwWOsY0kVcq87/dyIAPIBjpVPhy0BgzIsJa95PIxCSVXKbxEynJCoLHC7LsZDecwBvcYjc9HX8faJ89StJ7jjaZ7VzdXCEQfndzD2/pEVg4r5pKVyBIw97iIaVJtHCTlXlNF/Z33246XkVLHe1ySSt82kg86qyuzjeIwAJMTC9Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXPk8MG5wtlr5I8YTln/6rBg2zXw5ROgbVhh+61naso=;
 b=Lp7ex0JnE25YoEoBZMUte2cz6GcG3MHsOCgf+H7JMW7i6t/2b65SA063UStTKrSw4LVCSoMQVZpSgxlG4SE7xcAhPWFw9uU5cjQgQuAmFDFlFUPAdZJ7uRKtSh4ZIUC+fVGPCNvZ806isnMjrt5745/zHeePYYD7nsqZm7rTbnU=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB6770.jpnprd01.prod.outlook.com (2603:1096:400:b1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Sat, 7 Dec
 2024 10:29:36 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8207.014; Sat, 7 Dec 2024
 10:29:35 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
CC: "john.madieu@gmail.com" <john.madieu@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, John Madieu
	<john.madieu.xa@bp.renesas.com>
Subject: RE: [PATCH 3/5] soc: renesas: rz-sysc: Add support for RZ/G3E family
Thread-Topic: [PATCH 3/5] soc: renesas: rz-sysc: Add support for RZ/G3E family
Thread-Index: AQHbSCWIFHpIWC8dxUe/1MWPUYJtFrLalHig
Date: Sat, 7 Dec 2024 10:29:35 +0000
Message-ID:
 <TY3PR01MB1134653372B558619C7C5CBC986322@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241206212559.192705-1-john.madieu.xa@bp.renesas.com>
 <20241206212559.192705-4-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20241206212559.192705-4-john.madieu.xa@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB6770:EE_
x-ms-office365-filtering-correlation-id: ab077a51-2d01-4dd3-4f75-08dd16aa0be7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?GHHO1Uy08Noh0IzIcLd5qv66nk65/kq1SA2B53nbbNBDnaWQkzN8ODB1L/8p?=
 =?us-ascii?Q?sMNCLAPdbG3mo8Hk3dTB/6TH2dVM96o49F/BWo6SMR7n4nOZskmUg08pXCK/?=
 =?us-ascii?Q?ER2JV+10wlToJMj7vkKlf/T1a4OzK54SmBvcVJBVC3oXOxIeLvm0buhH9d1V?=
 =?us-ascii?Q?oxc4LGl/48AdKTsyASxxtNLGigDMED3vzedSA/ReWotoIrm0bioRc5gTkvbR?=
 =?us-ascii?Q?cuoB8vZTHDpW37BUKCdl3nkrOFDqHCwqFh8i5p6VUA8CHmbh8AEKwZrF0BoX?=
 =?us-ascii?Q?Jf3yJ+W2oimWP/BW2vdsJaQY652JWJt1FUvBlZxuyLn9TIOvcW0K1ojPgtuc?=
 =?us-ascii?Q?oUO931SOZM8Ib4SSJcD9Ak74aM2i1pChNIYUfnohYW5ujW0LQ22nSL1C6y1l?=
 =?us-ascii?Q?tj1NXGs4HzuC/ncjM9+dbM46WOwf8N7e2s0L9AZM3axK3KH8Eg2cGms7LSUn?=
 =?us-ascii?Q?+zssqczXexQapmX7iuR2cSmJzMgY4vzk7C8Hnqg6V7Kz5tIei4J3AR24FFtr?=
 =?us-ascii?Q?uBx53p0fNk+35yUB37PHorGi9UMvSSbeRpVFQnXtZQgxxawSc5NniSyTMKsc?=
 =?us-ascii?Q?L9uKzwk2GAapYM2N0jQl1g4e/PJPGEBJyVhodNKOm7a+RF9uH5TZPzdcTQMG?=
 =?us-ascii?Q?2jCZo5zDVJ/j98h/O+0Z0/WEoxqzwAZ5V7CstjA5LJmbLuj1yRogpZJPJ5NV?=
 =?us-ascii?Q?UFpkVHhCUFDrYOALf+RoZJbcy24F3T9BLS7ytE+guFztkb3N4L7qqwkHUFVp?=
 =?us-ascii?Q?6fhGv0zbbpS+LCTwCjmw8eX6Rbe99upFdnUNMs2viXySomo324BLLXHuHIYW?=
 =?us-ascii?Q?ADHkFYtzwI1kEnv4ZR3sQ3PHeiNhdbwN0DRbsGn/2Kf2Qr/xmv+3FQCZsa6a?=
 =?us-ascii?Q?nblc35btog1aM7D7zZpf9FiK0AJ2Z8KPzyrZB2/YwXeHhvn/j66/57dczOYK?=
 =?us-ascii?Q?GlpWRQLP9d8FhBnj8vMleV7zrwRShtWSXAZNdQH43hiMWSfdHCipOC9O7zy8?=
 =?us-ascii?Q?eXlfFMDpD0Ub/dS5hhNwi0wK6SEQzDZYqeFBJZlwYoWxU1rl5dfSzFUnp8/L?=
 =?us-ascii?Q?2IFjq5YiZfOBa1gTo3WqPsMYQ6Hn5kdeu6FgfDPfUJatZhbe4Q9Lf4aw6Jjk?=
 =?us-ascii?Q?ILqqgRtphalEQtuN+I8RrSv+n/IYVoegyIORngGG5kvISmAUsrc6togHtYxW?=
 =?us-ascii?Q?4H2v1I38r0oCksKmQ+3AOIIpI+yVgRc3tVTQGty+RejSyA85P2YaYHxMqj0e?=
 =?us-ascii?Q?Gcq7x6+byRTn5FZSK3YlB8XIiDLJgLqAuObV4llOVZCAuZdNV3PU/wIT9Irb?=
 =?us-ascii?Q?gMLkSpH0LGuDfxsar3daYLveqP8RBSOPITWZpzf2QN/bVoxFnGgicPIZ0/G4?=
 =?us-ascii?Q?WT4YJE2EOwitR8R1ny4lw6zjIqCI2mDMSRlX85WD36kCqAZHvw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?/z5SrYkMWoamZstiT1DDKQVRiUGENmpN90gUReCe1mC6S5LCDz+dexoPZAJ8?=
 =?us-ascii?Q?WevMeQDJkeUnwQ6QUMXtSlqQR1cyake3Cal/01SPnFFTO7KywAKruKuLo8GD?=
 =?us-ascii?Q?x+goLgHwaEmK8hPItXC5izGEP+MGcmt8sMKNWKOmrUbD3yv4xBma4aKvFZAk?=
 =?us-ascii?Q?NMuVuPVRyROSjm+zGgOueSpcvvl/nqj++HkXWZUqFsnSuHGoC9fjnDpbBG3H?=
 =?us-ascii?Q?l7T0BbmhtnUrPQPfWe1IZ66JkPQu1R6vqs5VhXRRoPaPZOoC3TDQK1+JhiVb?=
 =?us-ascii?Q?oAVDbtVzPusPYTH0pIBfMmZJxKiKThZjtkUQKvG+mEwB8+kQ415oJHWEuLRj?=
 =?us-ascii?Q?DEbENoIbGmACS9J/O3jU2kKwXRbzA55xywze1TeKJx1odUoek9huTA7oerBj?=
 =?us-ascii?Q?LIxrRWS1mAPgdu4ccDAGhKVSysY7jI4XyC/1DFdhS34sMl0VNHAUj18rZrv6?=
 =?us-ascii?Q?pOGNUOFtCi+D1GZXEclW7N8/qd6ia7M3DRWH85xpbeWeqEsKIlGTzFUJrezp?=
 =?us-ascii?Q?zJG9wqA+LKR3QSdleep0vhS9dyn0RnOLS3k9tYJCKZD4EQTj2nDrtGmNONDx?=
 =?us-ascii?Q?qCWOS1MrPT+6ETH/gfsYBvm6kLfk799aE9hmFiUwBmrfymCLdAu4te0txewK?=
 =?us-ascii?Q?UhkdQr57Mse9K/5HQ45P5M9r4OVC3n2dfuHdLkYFpo/12jZO4k9031beBfF2?=
 =?us-ascii?Q?wB9SHR45XNMKRW24mq/k/8xaM9z23TLkTEQMAl0AC4/q9XvMEfxt/uysBGJQ?=
 =?us-ascii?Q?ewjj3qj8kmE33a6d0LOIgWaRCBATQKUztWYe7mVvPoJsLG8A6CP5lPokluRU?=
 =?us-ascii?Q?RIaCyf9aCX1bGp+EBcH3rt8+eDtrwiAuoe82jktDwNrrPNqgLh9Jett9+XPP?=
 =?us-ascii?Q?PCeapIpUQfB59ys+5/MoUpEZ/EDKx9Fb/D+vpFZ2ZFekA6QZNaKd+qiJR4tt?=
 =?us-ascii?Q?RmdH45OGHULcbLwwx+a3QThRBLbFhiSZ8NGYX/ctM96bG6dvigQkS51tWUdW?=
 =?us-ascii?Q?AUt7kF8edfr/zH1DTeovIOzY2m0pCJr9/IKgTZUg67x9TjMrujIyG82QXxUV?=
 =?us-ascii?Q?azh4rycMDKJeXAGXIgom917PsD7Cqs5D7jBCCoeQnS3BNDlSV50huL7gOiKl?=
 =?us-ascii?Q?8DeF/zyFqCDdkkH8zDdRw2hgyk7+wYgvC6GGIwviSVE3WZivendzW5+no/LQ?=
 =?us-ascii?Q?A4qJZjvVBa9ckJzJBEyUfzDkmxmviWD8sgronhcOZOzoJaEKkIkGjokkTkxF?=
 =?us-ascii?Q?2X1rzleuitKIpGLWckIoTanlJ1pxXb1Eg2dc7LA39XU/Xk/9QycvhNXIWcf2?=
 =?us-ascii?Q?adpee9J+JhQ6esjtVDhQg1DNX5pIrE4oL8FkOyrN0xK6v6XkbnR+CnepFZ36?=
 =?us-ascii?Q?3A/DikIH5YwHai1byXdKCTqErWPRtFkDZ9duVhWsYEwrdtckoPnUKH05NCpT?=
 =?us-ascii?Q?TW6WJX09kUaLO7tg8vlMVp70Dh3/3XfrnLpXqVZ6K+YUxzUtOfPYDGvOWmsD?=
 =?us-ascii?Q?w3vSzGGlYo6S1zsV2obnTXZLDD/Lxgl07FZb14s2yHoQvuEtGmEhOy+FRd/S?=
 =?us-ascii?Q?1dqZhXzw1D00woHxUZkAFy+kOzGbwgXrIbAZBgR2hm+bWErNusMokaIVSLcP?=
 =?us-ascii?Q?Xg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ab077a51-2d01-4dd3-4f75-08dd16aa0be7
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2024 10:29:35.5803
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0M7uRuxIlTWqnCoSV7slaAo4YxA8L/an8QBIldiTeKKEiksSQ62xeceEvYqU+IL/yakUVaExUEevCc13ucSugmGsyD8mbm/YQgcFKRWR4zg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6770

Hi John,

Thanks for the patch.

> -----Original Message-----
> From: John Madieu <john.madieu.xa@bp.renesas.com>
> Sent: 06 December 2024 21:26
> Subject: [PATCH 3/5] soc: renesas: rz-sysc: Add support for RZ/G3E family
>=20
> Add SoC detection support for RZ/G3E SoC. Also add support for detecting =
the number of cores and
> ETHOS-U55 NPU and also detect PLL mismatch for SW settings other than 1.7=
GHz.
>=20
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>=20
>  	data =3D match->data;
> -	if (!data->max_register_offset)
> -		return -EINVAL;
> +	if (data->signals_init_data) {
> +		if (!data->max_register_offset)
> +			return -EINVAL;
>=20
> -	ret =3D rz_sysc_signals_init(sysc, data->signals_init_data, data->num_s=
ignals);
> -	if (ret)
> -		return ret;
> +		ret =3D rz_sysc_signals_init(sysc, data->signals_init_data, data->num_=
signals);
> +		if (ret)
> +			return ret;
> +
> +		rz_sysc_regmap.max_register =3D data->max_register_offset;
> +		dev_set_drvdata(dev, sysc);
>=20
> -	dev_set_drvdata(dev, sysc);
> -	rz_sysc_regmap.max_register =3D data->max_register_offset;
> -	regmap =3D devm_regmap_init(dev, NULL, sysc, &rz_sysc_regmap);
> -	if (IS_ERR(regmap))
> -		return PTR_ERR(regmap);
> +		regmap =3D devm_regmap_init(dev, NULL, sysc, &rz_sysc_regmap);
> +		if (IS_ERR(regmap))
> +			return PTR_ERR(regmap);
>=20
> -	return of_syscon_register_regmap(dev->of_node, regmap);
> +		return of_syscon_register_regmap(dev->of_node, regmap);

Basically if I understand correctly, you are going to use normal
Syscon call for register access in PCIe and TSU drivers. Is it correct?

For example,

priv->syscon =3D syscon_regmap_lookup_by_phandle(np, "syscon");


regmap_read(priv->syscon,xxx)


Cheers,
Biju


> +	}
> +
> +	return 0;
>  }
>=20
>  static struct platform_driver rz_sysc_driver =3D { diff --git a/drivers/=
soc/renesas/rz-sysc.h
> b/drivers/soc/renesas/rz-sysc.h index babca9c743c7..2b5ad41cef9e 100644
> --- a/drivers/soc/renesas/rz-sysc.h
> +++ b/drivers/soc/renesas/rz-sysc.h
> @@ -8,7 +8,9 @@
>  #ifndef __SOC_RENESAS_RZ_SYSC_H__
>  #define __SOC_RENESAS_RZ_SYSC_H__
>=20
> +#include <linux/device.h>
>  #include <linux/refcount.h>
> +#include <linux/sys_soc.h>
>  #include <linux/types.h>
>=20
>  /**
> @@ -42,6 +44,7 @@ struct rz_sysc_signal {
>   * @offset: SYSC SoC ID register offset
>   * @revision_mask: SYSC SoC ID revision mask
>   * @specific_id_mask: SYSC SoC ID specific ID mask
> + * @extended_device_identification: SoC-specific extended device
> + identification
>   */
>  struct rz_sysc_soc_id_init_data {
>  	const char * const family;
> @@ -49,6 +52,9 @@ struct rz_sysc_soc_id_init_data {
>  	u32 offset;
>  	u32 revision_mask;
>  	u32 specific_id_mask;
> +	void (*extended_device_identification)(struct device *dev,
> +		void __iomem *sysc_base,
> +		struct soc_device_attribute *soc_dev_attr);
>  };
>=20
>  /**
> @@ -65,6 +71,7 @@ struct rz_sysc_init_data {
>  	u32 max_register_offset;
>  };
>=20
> +extern const struct rz_sysc_init_data rzg3e_sysc_init_data;
>  extern const struct rz_sysc_init_data rzg3s_sysc_init_data;
>=20
>  #endif /* __SOC_RENESAS_RZ_SYSC_H__ */
> --
> 2.25.1


