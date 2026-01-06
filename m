Return-Path: <linux-renesas-soc+bounces-26325-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD47CF91F2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 06 Jan 2026 16:41:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E44B0301936A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Jan 2026 15:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC28834403E;
	Tue,  6 Jan 2026 15:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="KFGKHvRi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011012.outbound.protection.outlook.com [52.101.125.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F9F280CE5;
	Tue,  6 Jan 2026 15:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767714079; cv=fail; b=HtqL2wLhmq9YgKyjmQYQUygkeslmMj7yXezUX9DzgI2ekH+2sZ4iDLdKpvXJLQCAZhcXXw9IJmfhw7IykJn0AjnvEl65Hmhg6DJv4vpbX8hw7BZ9MpTtmCwlqvIkIGX6D6TElqo3Ax5Nr+mNFxI5jZZLREQjkesku2XwVNLbOUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767714079; c=relaxed/simple;
	bh=mCWD2mJRNcZMM/ajs3WSY5g3SAN+n13JMKO4JEctjjo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ipbspKR3/PjKK3g3ngx/k4xHwdll4djpepRCVBGhT3V1TOhgoM3zbl9A7yYhQyNtVgCEBUBAd4eS+TtvKPSsro1PUH+q0hZFiafHdVjgYQtx1X8OcOWFXkMIWbC5Lv/tw4Nbf5oxIQlUazY4hSWfHrSV7btMRmC+Hh4In7JIoKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=KFGKHvRi; arc=fail smtp.client-ip=52.101.125.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JFljy9muCnc9gte6W2LeFJAw3jg+BxlbJY84moEmkEKLiDP+tQenLqFxslR5GQGsACJG3t0fUcMX7B4JGxbzV6RJtc2vSjUKXrrV08s8JMEy/C36iX0gWDXw5M+HjbLUgi293LBkSxyKBtOwgET6pbCpiie2NxgWF0yytmYEj8Ho3h4P7HX6yhGujPd9e0hKsLXXAqtd9DXXtAkVyNjvKZW6SwUoZ3IrPiXV78vyTTpWO6qy9gZ56NMCynenor4Xkv6Frlv3TCQBtyedMTCDiyxRLQHxNmTFPKq9HOlmWJcC0Lh+d5E3v67ceW0Keiq3Lbm75rYPNGHIO4Kx3+HK8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sEg4BUyEBL8tEHB0W9aB0pgR6exWbc/FnsULAiD8/es=;
 b=Cva9qO4gt4miEuawRhx+eFU8GLUrzshMIM0VlFDpwk6lCSrUDbFuVd6JakvptqrmL+hJGeZe60IFtwHW3W1CZ27XUXBR3xfFBY0H1JcaLka84JmtQsRwEXNmlZUj/93nsxWqjxi8nt/R6UDR8IwNy8Khvmz8fXUNTQFs5FLUEOMXNVXLKG7HjQjxBokda50Voaos741b0vjjf+P6hDAe147tHAHWY6u2o5O6wjndHF0p7bZFINEATayLcgL7wjyC4cAn2vdb/QUOCZysTqE+I3AoPvouF+98eOB8b7tTVpR/O2Bsu8zulRMoF2BMyc9wDBcfTFmrIir3GZqh0C+LeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sEg4BUyEBL8tEHB0W9aB0pgR6exWbc/FnsULAiD8/es=;
 b=KFGKHvRiXcGGCIG96dTUF9NCtq+BeiJ1aZo4nm6gn77Hs42+rulCBwHqfGEjXXhVKvH49OxOA92SWqv8jnLEcdV31bZMRTHwUMWfKBtchUNPT5dzJ2vHULZYt5mMUSUZ4OcNnpV8k6JsVzzUKVHWQEcwIPGF6fj0Elgl/EBUJaE=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by OS9PR01MB12574.jpnprd01.prod.outlook.com (2603:1096:604:2fe::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.1; Tue, 6 Jan
 2026 15:41:11 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%2]) with mapi id 15.20.9499.001; Tue, 6 Jan 2026
 15:41:10 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Frank Li <Frank.li@nxp.com>
CC: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Tommaso Merciai
	<tomm.merciai@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, wsa+renesas
	<wsa+renesas@sang-engineering.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>, magnus.damm
	<magnus.damm@gmail.com>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 1/4] i3c: renesas: Switch to clk_bulk API and store
 clocks in private data
Thread-Topic: [PATCH v4 1/4] i3c: renesas: Switch to clk_bulk API and store
 clocks in private data
Thread-Index:
 AQHcfjEd/HHAzFY+c0mlsn4qV6uoULVD0GoAgAAOSSCAAVwmAIAAAj4QgAAFmICAAANfQA==
Date: Tue, 6 Jan 2026 15:41:10 +0000
Message-ID:
 <TYCPR01MB11332395B91D672D6BD46CECD8687A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <cover.1767608450.git.tommaso.merciai.xr@bp.renesas.com>
 <94d378e99ded450ba118813b35239f9a10a73daa.1767608450.git.tommaso.merciai.xr@bp.renesas.com>
 <aVvw3pjhphnVv7g2@lizhi-Precision-Tower-5810>
 <TY3PR01MB113466E129D0970F0E2541F7B8686A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <aV0g5j01beuz5CO+@lizhi-Precision-Tower-5810>
 <TY3PR01MB113466AB09CC77C375492A0E28687A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <aV0neUGcqiGkE/Sv@lizhi-Precision-Tower-5810>
In-Reply-To: <aV0neUGcqiGkE/Sv@lizhi-Precision-Tower-5810>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|OS9PR01MB12574:EE_
x-ms-office365-filtering-correlation-id: 9a6a58b6-eee0-4b94-1866-08de4d3a0430
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?/NyYfUgv8RE+lfGn5x2RZJRRlx52bH+cH77kM3JBW2RCdx0erWM75mSla2JB?=
 =?us-ascii?Q?IrNajI6Kjr9XbsXriBE1lji0GMhMM/7kQigNL4j+EbgdKuBFKfsRLE90/q7C?=
 =?us-ascii?Q?R6HxzHPF+pRuVNfIhc6YaOODzKNWyIiFwsQve8z8vbsXPeFKc0G1IC5jnFic?=
 =?us-ascii?Q?PJ+vPem2fgOG6vHbgQMMDEPCHtTHXgLBScGF18uENR9mwo7gDmYm8DdKSW63?=
 =?us-ascii?Q?aOdYFUiAogN2i5djNAzcfs464pbiH2ujcPQRe429nU9BRIqbozku9yG98kSw?=
 =?us-ascii?Q?biydnXUiiPOs+ZESkTGjW71RR3yTBEtKIW3x016N7IktZyej1Un5PGlAOMlK?=
 =?us-ascii?Q?eLGpbDoeA9L7XpnBgbb6M/HUpdvytpTTjz2Oo0cgJRk1Oe1a0n5LPB4JLY8I?=
 =?us-ascii?Q?Ts+88jgVZIxpucWyQ2GptET8GiM6Ywvri/Z5G/UTTmvuCxZvDM9nxp7Fx6RG?=
 =?us-ascii?Q?VP+SR+rs5VxvuaDQ8r1jTPtCGa1i258Bo1yffaWTHA/IUfHVOiqBWKdtxUaD?=
 =?us-ascii?Q?sTEfZsvQkjkllnefIuAVNTPqnNu4VmjYj2IdQHw8mTwyLj6P4hz1Jf47+4FH?=
 =?us-ascii?Q?9sjwpvr5n/4PisVd3M5Ow0CbYVqMHp2AYWIgc+qH3ngMWY+jECnU/qh6a7TU?=
 =?us-ascii?Q?9+zOsjf5wXHZCD56iUbvO7Wp8nWh626b6mh4tWAcXvm/sGkgNX2KdfSfPqum?=
 =?us-ascii?Q?6M1x5a8Hl9mnrHGEEDl4I6QiPobpciqPFL5D+hDxQE6yGxXwBz9PSPd5slAK?=
 =?us-ascii?Q?q33Dp8r4cq4MYQADCvEyRIFoDJmtX5LysSCncZdXBiH8yMEUVYxpNvtIMssK?=
 =?us-ascii?Q?x6KjCRNPacxJqp5sIbF3poaSml3YJ0SPI68k1wPDgdGwEJ5Gp74fyjFX+LBs?=
 =?us-ascii?Q?P9dumKfRubQ9xLhqGmgLzkF55AZuVPmq/Oz1tfdANThE3imc1E7H7tIpSBaJ?=
 =?us-ascii?Q?JH7816NAv8NXgmWL4hquPlHyPIRMYW6KH48hjTWIOKxCCZcrRAGoeGhD9dnL?=
 =?us-ascii?Q?DQTft/20ntZy+a2zC7vxCZNKdHN6Kw/U80cHU8dVP6Zgkd9sD9CduEB0YwmQ?=
 =?us-ascii?Q?lfoW3/qHcEwW4Y1n4xYAUmr/Bs3B0wQhdBzUUoUXKvJgRJrQsWeY57JF8kMs?=
 =?us-ascii?Q?0A9qU6et91GDTaglTqz8N3+F3N0HBd1H6C0Ij3ai+h6Qz4WOq4LXr0jjJl1n?=
 =?us-ascii?Q?hS3UrQWPZGCRKZicavx8DLKuqsBh/B4juMIFCIegFcIr4cieFKeHSCmywjAL?=
 =?us-ascii?Q?erC3Ok24bdBwafNnd+V1kBkOqwGRUvECQvlF+N2fLe3nvDgH1YJNEOA+i/zR?=
 =?us-ascii?Q?1D+elFwQ4AAFMuTo2Q8g2K+wHB3az5sOU6jdHiB5l0EISE8868020CumT59p?=
 =?us-ascii?Q?jn1gBLVleGYbj/Z3nnSKHdxGrd5pQOw+ZeRCigX8UJxCnb/3Yf8dGmUecjlO?=
 =?us-ascii?Q?qEFdkt1u4h0dHfiqoJDqug1VljS76XwfFmup21XWBoiptMO0ZC/klP//Wo2+?=
 =?us-ascii?Q?Uc4x9eCLqAc49OPVEpnhXZ+BmVW9qbS0FiPD?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?oBG7bEeK0zqSm5+nD9+f2+rPxfXtVuMxVRhqvshSs4rAmfB/+t0+MuattZAk?=
 =?us-ascii?Q?NCorMEqpEcqMLYKoM79ey7dB4zvgdWsidqym6a1WDDsQPW3YMQ5VenhhDhig?=
 =?us-ascii?Q?5kG0MW6xt3e2yKGhH4NyhkjWdSGyWXpQAeOH0cYKxQvHaLokLnFMECnoBCHX?=
 =?us-ascii?Q?/QXExlB+bW/SgoBKuf434xTT6wp16PgS9rI1U13NIn0D7ezbqV/6nCkx6jd1?=
 =?us-ascii?Q?NTBnv9O/M0n3uGsJXDQApn+Q+uWlSZcl9AWK6vC5/3vWKtmeCiDPwLT5fYsV?=
 =?us-ascii?Q?R+D4EQm2l8zj5qFvc4jIfifoEYP0Ul93X3JK/J9zEGnDDLEQVFUIoAt5TTj8?=
 =?us-ascii?Q?tV1hA+Eqz0EzdEpzEc+3sONGYYcoVp1IWCFe2b/QiapEY/+9+8/Gdg3Uyemh?=
 =?us-ascii?Q?2L3KtASGfWOEdIUpL9SrKXqXEy55OTiigr5U3hTMMH25SP5IqgjAi9UH3zKG?=
 =?us-ascii?Q?mCTx1emy1f92CG3W3ulcHRIrwZVaDA1vRNEPFi8Qm4CuU74KRz9lJVGrBWGZ?=
 =?us-ascii?Q?lJz5L++SH2TZtzKKAQaAcFfA1gWltd5NvIupm5OMZzizPni5wDjwRJe81qSQ?=
 =?us-ascii?Q?8jmmZFGX2QHhRG/QAif9slyGLVgADBZrlN/tNUg+0eY7PRs1l1Q+SqBJN9Bp?=
 =?us-ascii?Q?3a0n0M5yX2VuZe0QVkE35BvA6qUmh79ejEkW8HAPiSWGULibrBsRbnBrLkSD?=
 =?us-ascii?Q?RuIZHnrKm4JTtF8Z8TvTPy16XkEGjSnHtW2lGFGtK5XuIjw3ELm06sbZ8zfL?=
 =?us-ascii?Q?j5P7Xf9EufwCSloAgXjZnznaNKAR9yiUTwGce/1uXHmVsjNL7oAxWOYSWVN2?=
 =?us-ascii?Q?NDjqraLXQ52w4/IPGTwS1Vs+cJRCXUc8oNU4Kot309l9AkdcrPR2t3dHcM/N?=
 =?us-ascii?Q?oGSMCjpBU3q+TUXOoPTmvQFMP9oAMfKYBd+dzBgFq/3b4wOIhvmQzRua/0wV?=
 =?us-ascii?Q?KzV2KLEMYgm0B4WDx4lPs9P6H1TP887lmSgh0iEmki/O8xhTgF4hCZuXIrZD?=
 =?us-ascii?Q?uGI/l7H4HIeeNMU7wgcM9shykgnHM0sKp5mYJ2nh+tMx95+sr1C4vJ5UJjPo?=
 =?us-ascii?Q?OxnxCBf60P5sHGcv/iDp48UlJJGZBFZUg+/irQMMuiiSFpTPHcuv3xtEFrcW?=
 =?us-ascii?Q?YMWhJYP+ZWP0qYfJkzQTAtHeGMzJCea6LaiMqRsHPXpeHAbONnGJmcRZJTwt?=
 =?us-ascii?Q?oJCfxq4Q6ysYljtXUsYhxXtjjxaqHrf6xIgZtX1wqSwQb5LvS/punhzjY9b2?=
 =?us-ascii?Q?xr6hgunhPXwbNXaOK1HUwarIJjQrCwPF1YNu+Mn66FS5nHH6VrTll9TygIY7?=
 =?us-ascii?Q?7gHEcYiSDTYga9Bh1BWFNEA1FHzZGC+ZB7p0OpBSxEfMzFL3uUbGyc/BoD+m?=
 =?us-ascii?Q?q376dnpKrbo79IdUCjgPXxGzz7INNjFVAR/2P1hBEmZMlj+5VbzfSZJdtEvP?=
 =?us-ascii?Q?Xwmw1EC9xpbY8B2o+hWN1wo0vxf18IkMl/cqqejbQWPu3v6DY47BpuKTKNnx?=
 =?us-ascii?Q?bi4PuKEVX2sARRmP21OjCK8T0Zp08giKckG3JgRl619dxgbKI22rcZJVnSf1?=
 =?us-ascii?Q?q/sKrFu2OVOH6caAEJOo+CLobM0Sw1xKSjHGcCMVOr6o6+b8tPOnFOm6izGC?=
 =?us-ascii?Q?pePHQqycFyYKm0W548XJlWCx32WFTGUbJu2mA5Nc/LTVfHoYfbCm+Jbzukae?=
 =?us-ascii?Q?T94Dw1NO70jZBjDbMrKFoTH7BRxgOg9brfiO6xd5HelfVyLXiqNceENqHHJU?=
 =?us-ascii?Q?0OuveOXcyA=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a6a58b6-eee0-4b94-1866-08de4d3a0430
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2026 15:41:10.6402
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e+5ibnhb9QJxDLgJOPgdG9eEw2Cdu5Td9qZS9NegGDa7XCc75ncbUcXgDVY6XXiat0lU35iPMxQxFbZlLmfLBmqoKqyTT5F1RgLVa+eIN8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12574

Hi Frank Li,

> -----Original Message-----
> From: Frank Li <Frank.li@nxp.com>
> Sent: 06 January 2026 15:17
> Subject: Re: [PATCH v4 1/4] i3c: renesas: Switch to clk_bulk API and stor=
e clocks in private data
>=20
> On Tue, Jan 06, 2026 at 03:01:49PM +0000, Biju Das wrote:
> > Hi Frank Li,
> >
> > Thanks for the feedback.
> >
> > > -----Original Message-----
> > > From: Frank Li <Frank.li@nxp.com>
> > > Sent: 06 January 2026 14:49
> > > Subject: Re: [PATCH v4 1/4] i3c: renesas: Switch to clk_bulk API and
> > > store clocks in private data
> > >
> > > On Mon, Jan 05, 2026 at 06:06:19PM +0000, Biju Das wrote:
> > > > Hi Frank Li,
> > > >
> > > > > -----Original Message-----
> > > > > From: Frank Li <Frank.li@nxp.com>
> > > > > Sent: 05 January 2026 17:12
> > > > > Subject: Re: [PATCH v4 1/4] i3c: renesas: Switch to clk_bulk API
> > > > > and store clocks in private data
> > > > >
> > > > > On Mon, Jan 05, 2026 at 11:49:59AM +0100, Tommaso Merciai wrote:
> > > > > > Replace individual devm_clk_get_enabled() calls with the
> > > > > > clk_bulk API and store the clock handles in the driver's privat=
e data structure.
> > > > > >
> > > > > > All clocks required by the controller are now acquired and
> > > > > > enabled using devm_clk_bulk_get_all_enabled(), removing the
> > > > > > need for per-SoC clock handling and the renesas_i3c_config data=
.
> > > > > > The TCLK is accessed via a fixed index in the bulk clock array.
> > > > > >
> > > > > > Simplify the code and prepare the driver for upcoming
> > > > > > suspend/resume support.
> > > > > >
> > > > > > No functional change intended.
> > > > > >
> > > > > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > > Signed-off-by: Tommaso Merciai
> > > > > > <tommaso.merciai.xr@bp.renesas.com>
> > > > > > ---
> > > > > > v3->v4:
> > > > > >  - Collected Biju Das tag.
> > > > > >
> > > > > > v2->v3:
> > > > > >  - Added define for TCLK index.
> > > > > >  - Use devm_clk_bulk_get_all_enabled() into renesas_i3c_probe()=
.
> > > > > >  - Improved commit body.
> > > > > >  - Dropped unnecessary static const char * const renesas_i3c_cl=
ks[].
> > > > > >  - Removed the need for per-SoC clock handling and the renesas_=
i3c_config data.
> > > > > >
> > > > > > v1->v2:
> > > > > >  - New patch.
> > > > > >
> > > > > >  drivers/i3c/master/renesas-i3c.c | 43
> > > > > > ++++++++------------------------
> > > > > >  1 file changed, 11 insertions(+), 32 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/i3c/master/renesas-i3c.c
> > > > > > b/drivers/i3c/master/renesas-i3c.c
> > > > > > index 426a418f29b6..1b8f4be9ad67 100644
> > > > > > --- a/drivers/i3c/master/renesas-i3c.c
> > > > > > +++ b/drivers/i3c/master/renesas-i3c.c
> > > > > > @@ -198,6 +198,8 @@
> > > > > >  #define RENESAS_I3C_MAX_DEVS	8
> > > > > >  #define I2C_INIT_MSG		-1
> > > > > >
> > > > > > +#define RENESAS_I3C_TCLK_IDX	1
> > > > > > +
> > > > > >  enum i3c_internal_state {
> > > > > >  	I3C_INTERNAL_STATE_DISABLED,
> > > > > >  	I3C_INTERNAL_STATE_CONTROLLER_IDLE,
> > > > > > @@ -259,7 +261,8 @@ struct renesas_i3c {
> > > > > >  	u8 addrs[RENESAS_I3C_MAX_DEVS];
> > > > > >  	struct renesas_i3c_xferqueue xferqueue;
> > > > > >  	void __iomem *regs;
> > > > > > -	struct clk *tclk;
> > > > > > +	struct clk_bulk_data *clks;
> > > > > > +	u8 num_clks;
> > > > > >  };
> > > > > >
> > > > > >  struct renesas_i3c_i2c_dev_data { @@ -272,10 +275,6 @@ struct
> > > > > > renesas_i3c_irq_desc {
> > > > > >  	const char *desc;
> > > > > >  };
> > > > > >
> > > > > > -struct renesas_i3c_config {
> > > > > > -	unsigned int has_pclkrw:1;
> > > > > > -};
> > > > > > -
> > > > > >  static inline void renesas_i3c_reg_update(void __iomem *reg,
> > > > > > u32 mask, u32 val)  {
> > > > > >  	u32 data =3D readl(reg);
> > > > > > @@ -489,7 +488,7 @@ static int renesas_i3c_bus_init(struct i3c_=
master_controller *m)
> > > > > >  	int od_high_ticks, od_low_ticks, i2c_total_ticks;
> > > > > >  	int ret;
> > > > > >
> > > > > > -	rate =3D clk_get_rate(i3c->tclk);
> > > > > > +	rate =3D clk_get_rate(i3c->clks[RENESAS_I3C_TCLK_IDX].clk);
> > > > > >  	if (!rate)
> > > > > >  		return -EINVAL;
> > > > > >
> > > > > > @@ -1302,13 +1301,8 @@ static int renesas_i3c_probe(struct
> > > > > > platform_device *pdev)  {
> > > > > >  	struct renesas_i3c *i3c;
> > > > > >  	struct reset_control *reset;
> > > > > > -	struct clk *clk;
> > > > > > -	const struct renesas_i3c_config *config =3D of_device_get_mat=
ch_data(&pdev->dev);
> > > > > >  	int ret, i;
> > > > > >
> > > > > > -	if (!config)
> > > > > > -		return -ENODATA;
> > > > > > -
> > > > > >  	i3c =3D devm_kzalloc(&pdev->dev, sizeof(*i3c), GFP_KERNEL);
> > > > > >  	if (!i3c)
> > > > > >  		return -ENOMEM;
> > > > > > @@ -1317,19 +1311,11 @@ static int renesas_i3c_probe(struct pla=
tform_device *pdev)
> > > > > >  	if (IS_ERR(i3c->regs))
> > > > > >  		return PTR_ERR(i3c->regs);
> > > > > >
> > > > > > -	clk =3D devm_clk_get_enabled(&pdev->dev, "pclk");
> > > > > > -	if (IS_ERR(clk))
> > > > > > -		return PTR_ERR(clk);
> > > > > > -
> > > > > > -	if (config->has_pclkrw) {
> > > > > > -		clk =3D devm_clk_get_enabled(&pdev->dev, "pclkrw");
> > > > > > -		if (IS_ERR(clk))
> > > > > > -			return PTR_ERR(clk);
> > > > > > -	}
> > > > > > +	ret =3D devm_clk_bulk_get_all_enabled(&pdev->dev, &i3c->clks)=
;
> > > > > > +	if (ret < 0)
> > > > > > +		return ret;
> > > > > >
> > > > > > -	i3c->tclk =3D devm_clk_get_enabled(&pdev->dev, "tclk");
> > > > > > -	if (IS_ERR(i3c->tclk))
> > > > > > -		return PTR_ERR(i3c->tclk);
> > > > > > +	i3c->num_clks =3D ret;
> > > > >
> > > > > Need check num_clks > RENESAS_I3C_TCLK_IDX to avoid outbound
> > > > > access at
> > > > > i3c->clks[RENESAS_I3C_TCLK_IDX].clk
> > > >
> > > > I guess dt binding check validate this as well. Eg: a single clk
> > > > defined in the DT instead of minimum 2, will give DT warnings.
> > > >
> > > > Do you expect additional check in C code as well?
> > >
> > > Yes, worry about a wrong dtb cause kernel crash. Direct access
> > > i3c->clks[RENESAS_I3C_TCLK_IDX] without check is risk.  if clock
> > > i3c->wrong in
> > > dtb,generally, it just impact function. but this may cause crash. So
> > > I suggest add addtional check here.
> >
> > OK, to avoid a crash num_clks > RENESAS_I3C_TCLK_IDX check is
> > sufficient
>=20
> Yes,
>=20
> > But it does not check whether tclk in 0th entry or first entry.
> >
> > >
> > > Or search 'tclk' in array i3c->clks.
> > > for (i =3D 0; i < i3c->num_clks; i++)
> > > 	if (!strcmp("tclk", i3c->clks[i]->id))
> > > 		break;
> >
> > But this returns correct index of the "tclk"
>=20
> This is just more flexiable for clk schema. If your schema is simple enou=
gh check num_clks >
> RENESAS_I3C_TCLK_IDX should be enough.

For avoiding crash that check is sufficient, but as you said wrong dtb like=
 crash
can also lead to non-functional i3c device

Eg:

From bindings, we expect the below entries in DTS for RZ/G3S

"pclk", "tclk" for RZ/G3S

But user mistakenly just added "pclk", that will lead to kernel crash

Or

Swap the clocks

"tclk", "pclk" this will lead to non-functional i3c device

On both cases, user ignored DT binding check warnings.

As you said crash is fatal, maybe stick with just num_clks > RENESAS_I3C_TC=
LK_IDX

Cheers,
Biju

