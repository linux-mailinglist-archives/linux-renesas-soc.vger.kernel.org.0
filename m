Return-Path: <linux-renesas-soc+bounces-10707-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F386B9D947F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Nov 2024 10:30:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E09C161598
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Nov 2024 09:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F9921BB6B3;
	Tue, 26 Nov 2024 09:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="smeLuzdV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010067.outbound.protection.outlook.com [52.101.228.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0A71BCA0D;
	Tue, 26 Nov 2024 09:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732613417; cv=fail; b=IvcyFViw9DuxoJxkwO+7XSuAs4SbzdbVlAPjw6lb7zvdIdESN6DNJ4/1hQcFVh1ZsG4ZrjuUra2TCv8+JP/GpCrSD8+OnVN3J2V+hgOw5lQgZEZNBPixXck9mq471haoKsYCkNdhgEmApOkb0p1lptJIw1AMrJL/yC2FO8zWmFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732613417; c=relaxed/simple;
	bh=+eNlNQ7PqbpliSBqxsQZHqzc5OBFbf2RvVmNTwctk8M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hlcE9bfeTgtnmJXYiYtQ9tKQQla4A33lTiT1vSWljo4J52bRry1teGcPBEtVLLKQ9X3QUkA3gutOAnF22+qVc9myd5YrU3Wh5kAVuzCHKBr7Bju9a6hGO16VYfNQalADT06CNP32UCbVmdCpQyTTYC1WULH5HJfxirm6DHWRboE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=smeLuzdV; arc=fail smtp.client-ip=52.101.228.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cBbcKtQhRacsItp8RcQIrKqNRY4+lAeenP8QC8W0asN4DZBd+TGSpmOhl/iFDbgmRPULLfRLP8CWz5H7TkQTPjCAH0Dahc+wiKuEse6q05g4pThj/fCqv7nr+HlP2EOEaNEKUb+ud37/Y/cy9CtsYR2Jm8B/wKJCsPrZKfB7p15H5f+6H5TUHTLtYMN2lc7uMhYDyJU11UkqiRpj/mOm4xICd0hhq4WzKI1ApFbjntYsNoX6tIvT6pTgkrXvpjBf57TPL1UDJMiUvhaGhuD9FUxdAw91pfqsrZxV+6SbHKMybZk7mHvdN8fahUtlC/jPBLJQzuqAJCNDGqEqTtj0HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3YKmFQvndwZhkwK2B1ef9XeMeguPAX/yFv4c8ooTt6c=;
 b=SDng4j9A/pbL2IfIEjjLM8TvURXA8TqMVFV1sMy+R9GgHrO9ZarcZzzdOnnyxNdD4qoOfVTAXnrAu9EdnLeIPCqx6IwlP9rnaXYQEatKE9tj8iaOvjgbsvu4+SaN/UQE3moHnyGp94sigTzNRp4OzBuGkkZshu2JwwDDd9hrY5VDHqKyGzbNTjBT97SGIDV/IKGmPcSjlfr+OtFzazPOF2XTQXQIAWaAvo31bXCLjeZRm9CaW/i7aKuEcG8O2Z0NbBU3WaDwPGt3ORzWByeI16IqIi+PXXYWQ76e3o7rJEvaz0QGUDejFc2uSloi3jAeAFVhUkd51PZXUOZQ2yC3gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3YKmFQvndwZhkwK2B1ef9XeMeguPAX/yFv4c8ooTt6c=;
 b=smeLuzdV9+C3+A0P4Gs86tzi64qgTJ2strZgRwQb4zy/+WzNb19qscUC5w3gqDKRSAEOPMwrUIJdDen1pHH7h0iuIAHikyT2sb3HMloPrI4Fnby4sq+7Vqo2hRYWvIbbLp96BqrxJ/Kjjd8XGInOqT9nkHAXRyaY0UvecKTSgh0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYAPR01MB5804.jpnprd01.prod.outlook.com (2603:1096:404:8059::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Tue, 26 Nov
 2024 09:30:10 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 09:30:10 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, "vkoul@kernel.org"
	<vkoul@kernel.org>, "kishon@kernel.org" <kishon@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, "christophe.jaillet@wanadoo.fr"
	<christophe.jaillet@wanadoo.fr>
CC: "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Claudiu.Beznea
	<claudiu.beznea@tuxon.dev>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH v2 04/15] soc: renesas: rz-sysc: Add SoC detection support
Thread-Topic: [PATCH v2 04/15] soc: renesas: rz-sysc: Add SoC detection
 support
Thread-Index: AQHbP+SnlSc2Dd2xWkefoVnBXnqXF7LJS6rg
Date: Tue, 26 Nov 2024 09:30:10 +0000
Message-ID:
 <TY3PR01MB113465C1C90AC41B281208B30862F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com>
 <20241126092050.1825607-5-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241126092050.1825607-5-claudiu.beznea.uj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYAPR01MB5804:EE_
x-ms-office365-filtering-correlation-id: 863887c5-2845-46ad-651b-08dd0dfcec33
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?uRi+QWycfMxWSoip1JbLSX7u3jFFwq6V/KugjZhkOswtZUlmhi7/unePOCSF?=
 =?us-ascii?Q?/vMxpz0wnarjidGCLjJ1YRowMYdDrvhwHAoWx6VLLiMwHQuATdxELUIkO6Uj?=
 =?us-ascii?Q?QXSsF0lqxzaQFDylybSS3+Z1YXYLVUGzZSxkqvL8jH7QqwyF0SsveIT0oTRu?=
 =?us-ascii?Q?r9SQLJ4VH6GrO2IUQUjQRFe61OascHWyUI6rDgozAImrziWHx6eO99/l+dq6?=
 =?us-ascii?Q?K7Pbj6cGssopoYZdkdrxNW6jkWRFnGnn5AwVkrAjUeibpQXpRzFQUJoa3Id2?=
 =?us-ascii?Q?b6DIlhILud2DVfzm7lFwkn153sTO/pX1VSLf8+LWUFb4gNAU7CbWgFMyRrZH?=
 =?us-ascii?Q?vBz4mKpNDpwrIpYdqYy/m99PZ+824qLREfl1vZZgJ/kitQoaR5xt1jkK58du?=
 =?us-ascii?Q?j5c11gQpjINspITnwTtvLAnNzAoOv2cN+cl6t6oa8L+qV/pryBPhoplywJbX?=
 =?us-ascii?Q?cAGoWe5BvKmvZ2ZqvRvHA84n+WhECxEyOrjJ/C5/aLX1vnYQkxp/hq6XdBcT?=
 =?us-ascii?Q?LsDIb06/gmj/i8eZj3ZY4YI0Vg8+V6LIoVBEQwOew3HFzZwTypN5HUbACwJe?=
 =?us-ascii?Q?yAvtK5HBNFg61f/2H5VocoNryxVWFCINa8MZKUPcYE1L0t3t84URwqo2z1pi?=
 =?us-ascii?Q?I8CowSzE6HnfjM52FSnfSCOs28PcdhPuK3FxPj1cP7CTMzq0oc+1qMmeEN4X?=
 =?us-ascii?Q?CPFWqocKBWATzHrdBbUFuxBbpPT9258/r9SQPvb/8TqJqijtB4+zsrVWInHR?=
 =?us-ascii?Q?Zi+baVZtKCEAZZ+rNAQ70girBb4kEI3qmgLkMiboGzt81ZPR7PgIVkmEGa3K?=
 =?us-ascii?Q?SF6ttjFMe5Rh7JZYvN++tyL9ksGrbJY2N2Gu+ZRimNYv9zWTSMsa/ZgF/nB4?=
 =?us-ascii?Q?yQQ5jboMLB5b6L2RXcOltrCplhahmRhvKAAYBlVrR/pkflPMvwWjoZ2S0QdK?=
 =?us-ascii?Q?Zb/DYS1VC2Tl8uomxQF34jg+31DF4cyWZAQGLfhw6UeBW0NAcvUQY6VkwNAU?=
 =?us-ascii?Q?BdixCU3D8nWMtsoqUvSP8rFJELWyZeXxgrAZ9QVnmbFt2s5xS2pGl4FtHiDz?=
 =?us-ascii?Q?0RkgvT2pduWgoq6HkepcJRd3ekk4JXNtAgNZNzG2oABRecR6+bWQu3MSHmPm?=
 =?us-ascii?Q?artLcko28whXBGvSnYFejDPWZAjwBZrfBnePPwKZ6yHVcncGQwBJGa4qHpNq?=
 =?us-ascii?Q?QRorq6UzTWPN+bV04df372phfozTXK6dN4k6JyntVz5DVEdSsIIkg9cdHIsz?=
 =?us-ascii?Q?LwBt3ZfxlpHeRtPLVchpSnVPJtxBn01yv2ntLHvahKqrE3x+DFhBp2K/W9c+?=
 =?us-ascii?Q?LldlD78L0wnsseDUmbspMcAX5T723Xm0x0wkZy0Z2I80zLg96gTdWk/UiSso?=
 =?us-ascii?Q?SD1T+T2dnjMLIGdPArPtZAGEZIWCi5sdWQ59lenSslH4TOulurw6AR9rMTNC?=
 =?us-ascii?Q?3aci0QYXj0Y=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?0M5hLZ+zcgsVxf9g36vHo0qynQeU91B+FMUD7VY4I0u59pO9DLjiBloTplsz?=
 =?us-ascii?Q?fAuHMfLLAe3gnnHNdS49yu7gKXBmAKuzufiNBk8iaVg/sSQckrjsDZVJiqHo?=
 =?us-ascii?Q?rwTmPK9iT1ZjdurWt5o6vQVIwuW1idqYRd4ttYiB/2eWJrnkrjKga5dZtTqH?=
 =?us-ascii?Q?vCfpl48gXFJbezWSqo9LhS7htIq1ahvZ3qDgLOeRwTFHwlxjmA7/EJPatLiv?=
 =?us-ascii?Q?v0KL6XQE3K1hslgTlcFzNYrr4YbT7PM73ejFQBwi7y1IYQQdmE/1SG0Tk9U5?=
 =?us-ascii?Q?uNoXin2rm+FF/PTZfmCGxONIKKCkmn8q0Qfn69Yd/1dCurpC1NJ5yIbyQTIr?=
 =?us-ascii?Q?kIyOCap/N23UbuMG7Bd/z8+mpXx8VrCDNqy9/Gd3GzuFpEjn6Jf1TTnzePKp?=
 =?us-ascii?Q?KNeLYjE03vKfKKeLaPzmglYgLhR7tR2f8UC8UW8+0IH/SrCvg5xeawBzkbLj?=
 =?us-ascii?Q?EIPQXqZwzPUQuUBCTgUniYsm9VABc2dXJCAUXg/kz7zPRfrgCL4nHhADW2H/?=
 =?us-ascii?Q?j9fHqnp4JhnEKADzl9ygrNiIYDN1PZ56uP6H7bIJ60iKD+UIavKwY9vIRBut?=
 =?us-ascii?Q?HGKuLVqYv3IgE0kRFDzhlcgC67Vn77haojKjkiSourP2yx34WUgtcrSUui0o?=
 =?us-ascii?Q?RSkjwv4xu9PyJsB16ReYt0LL3ZJtpVeZaTKUdj8M0lv0wf+MJT2Bkvz+/AFv?=
 =?us-ascii?Q?iUUgIyFkhCeexQmj1js4i2AxEmwMq9TEHKGKxWn/7IKpCYgqVcIaOgiG3RB/?=
 =?us-ascii?Q?rsizK/z4CQUxZOQlKjkO+omZ6cMIf6MF55Kovf+bujdv9wG+druhfMrLdtc+?=
 =?us-ascii?Q?btE6di/W6ah83TqIEVZtGr5zob4TTgqseFzvM/eIfciTZ7MTnEjdWqGucKnB?=
 =?us-ascii?Q?gwMQhH4CRTaH1rvxVay0nIftUjZczfc20/Hqyh4uQ92D1Vz8k6JpLMJFXn7y?=
 =?us-ascii?Q?HWbFJPdyvA8zc8UT8Gt3LRuBf5xXfItvJlnhyGXjX827Nzu3xG/HUabot1x+?=
 =?us-ascii?Q?2477gODbpLp9Zhjta9Jb23bTcRJiKeZ9OITZKjiCvEgubfWMTxxSGMXuPUEJ?=
 =?us-ascii?Q?cHKFQ9d7GRuAwDlf/bOnJ3lxL6aKJB4SSYKI4PHjekoYW0DjyHJ9y7oKDRlu?=
 =?us-ascii?Q?kBGL9+kGGvniwuXeldEElIdhDksToGcO77Jik4SugAcAzNXWQmz5ZFzMTeek?=
 =?us-ascii?Q?OkdnophaThJvKaPW3398aQwPFVCDQ+dUNtnPEwlJSh/LMWG4yZznL/QoaJO+?=
 =?us-ascii?Q?5V9aPMLUnPGFZgCFBymhAIePtqpg9r6YUQHyce209e/48Lvd0OMYbmjw9RZw?=
 =?us-ascii?Q?tb/UbGrFMbvuWdNps/Y3mTJsCEa4nP8kTvZOh9iAxUO82POjlI53XiCW9yuS?=
 =?us-ascii?Q?pnTIoMo95urkEgJEtQXhNlVO7iEcpImxhT0FUIHKWUzKyXUnNhuIKMfMxj26?=
 =?us-ascii?Q?tK28hV26m098UJeoq4RbF13+fOMVSqeEDV9vzlfU6R6T9cadgW/DfLOlFn1g?=
 =?us-ascii?Q?sZr/B9IGitEL5E/iQU3jyGnwVGhdYprIEYGYF2FHCT3g2PJryEjZcJaSjiRW?=
 =?us-ascii?Q?DnYUD04fFtAVYriJUlXCF2W7LyjmxUZBd2mEaT5kVweBPhIaN64n+aAhV9Wk?=
 =?us-ascii?Q?6Q=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 863887c5-2845-46ad-651b-08dd0dfcec33
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2024 09:30:10.1845
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hi72uJKBSs8mZn1St4BH9sReOBrqA6GsP5u6fRZyx4fyY9j/UXZwGHq0clOU8tXxhj//XK+dkChXy5p6/VTfzFehjRwDdlbm0tdQhvbxkZc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5804

Hi Claudiu,

Thanks for the patch.

> -----Original Message-----
> From: Claudiu <claudiu.beznea@tuxon.dev>
> Sent: 26 November 2024 09:21
> Subject: [PATCH v2 04/15] soc: renesas: rz-sysc: Add SoC detection suppor=
t
>=20
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> The RZ SYSC controller has registers that keep the SoC ID data. Add drive=
r support to retrieve the SoC
> ID and register a SoC driver.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
>=20
> Changes in v2:
> - this was patch 05/16 in v1
> - changed patch title and description
> - added SoC initialization code in its own function
> - addressed the review comments
> - introduced struct rz_sysc_soc_id_init_data and adjusted the code
>   accordingly
> - dropped the RZ/G3S SoC detection code (it will be introduced in
>   a separate patch)
>=20
>  drivers/soc/renesas/rz-sysc.c | 72 +++++++++++++++++++++++++++++++++--
>  drivers/soc/renesas/rz-sysc.h | 18 +++++++++
>  2 files changed, 86 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/soc/renesas/rz-sysc.c b/drivers/soc/renesas/rz-sysc.=
c index
> dc0edacd7170..d34d295831b8 100644
> --- a/drivers/soc/renesas/rz-sysc.c
> +++ b/drivers/soc/renesas/rz-sysc.c
> @@ -14,9 +14,12 @@
>  #include <linux/refcount.h>
>  #include <linux/regmap.h>
>  #include <linux/seq_file.h>
> +#include <linux/sys_soc.h>
>=20
>  #include "rz-sysc.h"
>=20
> +#define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
> +
>  /**
>   * struct rz_sysc - RZ SYSC private data structure
>   * @base: SYSC base address
> @@ -211,6 +214,59 @@ static int rz_sysc_signals_init(struct rz_sysc *sysc=
,
>  	return 0;
>  }
>=20
> +static int rz_sysc_soc_init(struct rz_sysc *sysc, const struct
> +of_device_id *match) {
> +	const struct rz_sysc_init_data *sysc_data =3D match->data;
> +	const struct rz_sysc_soc_id_init_data *soc_data =3D sysc_data->soc_id_i=
nit_data;
> +	struct soc_device_attribute *soc_dev_attr;
> +	const char *soc_id_start, *soc_id_end;
> +	u32 val, revision, specific_id;
> +	struct soc_device *soc_dev;
> +	char soc_id[32] =3D {0};
> +	u8 size;
> +
> +	if (!soc_data || !soc_data->family || !soc_data->offset ||
> +	    !soc_data->revision_mask)
> +		return -EINVAL;
> +
> +	soc_id_start =3D strchr(match->compatible, ',') + 1;
> +	soc_id_end =3D strchr(match->compatible, '-');
> +	size =3D soc_id_end - soc_id_start;
> +	if (size > 32)
> +		size =3D 32;
> +	strscpy(soc_id, soc_id_start, size);
> +
> +	soc_dev_attr =3D devm_kzalloc(sysc->dev, sizeof(*soc_dev_attr), GFP_KER=
NEL);
> +	if (!soc_dev_attr)
> +		return -ENOMEM;
> +
> +	soc_dev_attr->family =3D soc_data->family;
> +	soc_dev_attr->soc_id =3D devm_kstrdup(sysc->dev, soc_id, GFP_KERNEL);
> +	if (!soc_dev_attr->soc_id)
> +		return -ENOMEM;
> +
> +	val =3D readl(sysc->base + soc_data->offset);
> +	revision =3D field_get(soc_data->revision_mask, val);
> +	specific_id =3D field_get(soc_data->specific_id_mask, val);
> +	soc_dev_attr->revision =3D devm_kasprintf(sysc->dev, GFP_KERNEL, "%u", =
revision);
> +	if (!soc_dev_attr->revision)
> +		return -ENOMEM;
> +
> +	if (soc_data->id && specific_id !=3D soc_data->id) {
> +		dev_warn(sysc->dev, "SoC mismatch (product =3D 0x%x)\n", specific_id);
> +		return -ENODEV;
> +	}
> +
> +	dev_info(sysc->dev, "Detected Renesas %s %s Rev %s\n", soc_dev_attr->fa=
mily,
> +		 soc_dev_attr->soc_id, soc_dev_attr->revision);
> +
> +	soc_dev =3D soc_device_register(soc_dev_attr);
> +	if (IS_ERR(soc_dev))
> +		return PTR_ERR(soc_dev);
> +
> +	return 0;
> +}
> +
>  static struct regmap_config rz_sysc_regmap =3D {
>  	.name =3D "rz_sysc_regs",
>  	.reg_bits =3D 32,
> @@ -235,14 +291,15 @@ MODULE_DEVICE_TABLE(of, rz_sysc_match);  static int=
 rz_sysc_probe(struct
> platform_device *pdev)  {
>  	const struct rz_sysc_init_data *data;
> +	const struct of_device_id *match;
>  	struct device *dev =3D &pdev->dev;
> -	struct rz_sysc *sysc;
>  	struct regmap *regmap;
> +	struct rz_sysc *sysc;
>  	int ret;
>=20
> -	data =3D device_get_match_data(dev);
> -	if (!data || !data->max_register_offset)
> -		return -EINVAL;
> +	match =3D of_match_node(rz_sysc_match, dev->of_node);
> +	if (!match || !match->data)
> +		return -ENODEV;
>=20
>  	sysc =3D devm_kzalloc(dev, sizeof(*sysc), GFP_KERNEL);
>  	if (!sysc)
> @@ -253,6 +310,13 @@ static int rz_sysc_probe(struct platform_device *pde=
v)
>  		return PTR_ERR(sysc->base);
>=20
>  	sysc->dev =3D dev;
> +	ret =3D rz_sysc_soc_init(sysc, match);
> +	if (ret)
> +		return ret;
> +
> +	data =3D match->data;
> +	if (!data->max_register_offset)
> +		return -EINVAL;
>=20
>  	ret =3D rz_sysc_signals_init(sysc, data->signals_init_data, data->num_s=
ignals);
>  	if (ret)
> diff --git a/drivers/soc/renesas/rz-sysc.h b/drivers/soc/renesas/rz-sysc.=
h index
> bb850310c931..babca9c743c7 100644
> --- a/drivers/soc/renesas/rz-sysc.h
> +++ b/drivers/soc/renesas/rz-sysc.h
> @@ -35,13 +35,31 @@ struct rz_sysc_signal {
>  	refcount_t refcnt;
>  };
>=20
> +/**
> + * struct rz_syc_soc_id_init_data - RZ SYSC SoC identification
> +initialization data
> + * @family: RZ SoC family
> + * @id: RZ SoC expected ID
> + * @offset: SYSC SoC ID register offset
> + * @revision_mask: SYSC SoC ID revision mask
> + * @specific_id_mask: SYSC SoC ID specific ID mask  */ struct
> +rz_sysc_soc_id_init_data {
> +	const char * const family;
> +	u32 id;
> +	u32 offset;
> +	u32 revision_mask;
> +	u32 specific_id_mask;
> +};
> +
>  /**
>   * struct rz_sysc_init_data - RZ SYSC initialization data
> + * @soc_id_init_data: RZ SYSC SoC ID initialization data
>   * @signals_init_data: RZ SYSC signals initialization data
>   * @num_signals: number of SYSC signals
>   * @max_register_offset: Maximum SYSC register offset to be used by the =
regmap config
>   */
>  struct rz_sysc_init_data {
> +	const struct rz_sysc_soc_id_init_data *soc_id_init_data;
>  	const struct rz_sysc_signal_init_data *signals_init_data;
>  	u32 num_signals;
>  	u32 max_register_offset;
> --
> 2.39.2
>=20


