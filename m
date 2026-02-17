Return-Path: <linux-renesas-soc+bounces-28274-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KhaYFGtNlGkqCQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28274-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Feb 2026 12:13:47 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C8C14B385
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Feb 2026 12:13:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 85C32302834A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Feb 2026 11:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FA6E33033B;
	Tue, 17 Feb 2026 11:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="HOUQrpYn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010037.outbound.protection.outlook.com [52.101.229.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1909832F763;
	Tue, 17 Feb 2026 11:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771326815; cv=fail; b=JeB8YJxCeATtN8JUN8G/4+xHXBWbHygB7PmmAh7NLJuAfSsY8ZMa79oxhjJk+hOJ9+YEpQclNreZcRHY/zYMNk68aum/qxqvEtYNcBxdjca12PbkQHynyjOjCBHhnRL+50Ybef9tSh/muIvrKlmP1u8rAtJtpF0xcIiVfA+G5/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771326815; c=relaxed/simple;
	bh=81ahvASA1/OA63N90IXFNKbgMFGEgg5+myIyksDFphU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=r6Fof/9moTlAKuH7cGoIftKYFbTQn/w1+wPxdUqkYlPKXYDLIQHvzNDMKGUyE5GYDtyhTyMvuSvd5/E/4bo7OJnob/B5nKG6FUDzxFkLXd8LDtY0Yb/ZbxmavnpkDzoCnIS/wtKOqApDeq87z/x6tW4/Avn6x0QvfSKGbOVtz0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=HOUQrpYn; arc=fail smtp.client-ip=52.101.229.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HGNSiL+lopAwesR6TZPHX2X4viAT4XRbv5VVu2mbAEmMg1kJjZ8/PyW3vkqkIyF95pvv2KJA9451GH2fC6ZeRJn+lEhhD2GHQhgSSqaNtQ3zli+wu5O5cXUkXtj5LLBa7Yj42U2k8bhKmImxQt6iFP9Ui0qu77I0/3oa/K3KaNB8v9vyXhwvw5NHrTsquPcY57eH13xpGRm1ziyIOBSH7VunhqR2Bo+caNO8Zegd4EBKJtPCZA4WM9YgVMfB9Fl8YzxRsG3Duv0EwS8pXfUTMinQ+0ns8D8baO1vGYa678G63ODbNP+40wNkZw8wQ/r7RsljA4kCE+OorGclTVqWlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=alhVwatuvQsoiT8Wfk7I6TIiF944NLgwHnjhaIzce2A=;
 b=A8o+KxRn4soFl2K60gtfVeTBn3d1e+GhrsyqNQtdYdPt4FHVPcO2/ghbitvL+pTLXmCiAB4LIYpO7XvQjERs6pUwtCNH0wR0vwJO/P0ZVjWZrCZqZl6ORlzDljgbxE9HXal6TmAlbnJCM7iLvMcORmMro5uQZEZ8c3zY1z43b54mtlokCLP76JsW+zK1Jl6ka5m4vp+Dx7pukGwZK5/LPwrhrBJ01qiB3jiH2u3KqcKyNStF7j4y//+LNt6zejIYgj5j3rBESWgDc6RE1HqWHfA1yns6fwN8G9yVceqIL0CJUrgi67Yk6ds2Ud4AV6wHj6m7OtPWSiBptQILSlkz5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=alhVwatuvQsoiT8Wfk7I6TIiF944NLgwHnjhaIzce2A=;
 b=HOUQrpYnkZBMl2OGhuTaYR9ob4o0bqQmFBl+i91DI73xeNl0mPTH/v2C2MUCkQgrGa/G6DOZGh85Wuc2ambr1Q/jHYssDkTD2Iwu8X5Upr9/ijNvEpZtPO1G1UhhHcvwjQrL3/vBShfcBXokXysGbofGbC4g1ZqloMYhDyBWmbQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB16155.jpnprd01.prod.outlook.com (2603:1096:405:2e3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 11:13:28 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 11:13:28 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, magnus.damm <magnus.damm@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v3 06/10] clk: renesas: Add support for RZ/G3L SoC
Thread-Topic: [PATCH v3 06/10] clk: renesas: Add support for RZ/G3L SoC
Thread-Index: AQHclPgmTX9sxTneu0urhqSPMKwop7WG0pCw
Date: Tue, 17 Feb 2026 11:13:27 +0000
Message-ID:
 <TY3PR01MB11346C1B39DEE4A11270FFAE4866DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260203103031.247435-1-biju.das.jz@bp.renesas.com>
 <20260203103031.247435-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260203103031.247435-7-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB16155:EE_
x-ms-office365-filtering-correlation-id: e3cf6bca-5535-45a7-167b-08de6e159373
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?hBD8x2eHnh368+cMyF5StpKlvBP1f5CQmDNqlZ42TXUPKRZKgd0q4ubtrQd2?=
 =?us-ascii?Q?E0VNk3Z0d033gV2IpArFW4X66oFQLNH3gdCzHbhlpX1cNgs9rSAHz9R2wdzG?=
 =?us-ascii?Q?cvbUioVJs6c5TYLw2Juej2lf1ZmL22LRSBpiCWMpa4qO+SXJ6QZBV3UZmQDP?=
 =?us-ascii?Q?i2R1gq7uj6C7TUhJtgeSgOjNIywbvu97PYdQi3cpSNd+PncU1MSDEpMsG7s0?=
 =?us-ascii?Q?w1tDAOkW0LMQE0idC3dZMbeq2wNkLi4S0Snkqsgkkz4KWhwD/lmX7MBWktd5?=
 =?us-ascii?Q?QSsGLSlLnFmKFbyBH2kYrXvf+hP2/GU1Sdpw6qMmGvI7kpCyhvp9Vxf0HX+M?=
 =?us-ascii?Q?4FUpw+/bliEvPyomw77RANrCqgmDuIb2qKjCEys/YTXeks2+yY8SmppZqMVQ?=
 =?us-ascii?Q?7ONe1Gj06LhROGyN5W+29Az3o62CRS+4TxlcAipyF2DlAuDJ7rvvxLs9+aqo?=
 =?us-ascii?Q?GDlyNz7SKY6Xb0MS97LJfvqoxlSkop2wtgUlIToTwJBAESCP64BvbTcPT5cw?=
 =?us-ascii?Q?YVJMto5GBj1HEdz3kPD1Ht6n5SBwKcf0CkUqdMxVUySjTm45aYgNmZXA54Ww?=
 =?us-ascii?Q?fIeITuIJAakhH4DaEGetP198SnZwJ/BG6Q9sniLf91nn+58T+sALri7BgqVa?=
 =?us-ascii?Q?uLp+UwspF9kXSWMBgLoXxNjXS3oPZxKJPv43x2N+YGw4tfuworulPmBTJebU?=
 =?us-ascii?Q?4ITiUhfcdeLA/10pwtX0x7dyM4MCF7/onRAtThmfVD+v8vMurlUEUVRzXKM9?=
 =?us-ascii?Q?ElKyaU9H4ViKGnQ3s8/qTCYOIiXs2vMqpNtJjB+w++R0fNmO9ry9r4epecBh?=
 =?us-ascii?Q?CfdOyZro0sG4ZrT0arxQQOpQhlvVVisxWgwkn6yQM/qA5K8PdIZ8xQWzjbI8?=
 =?us-ascii?Q?FhaTBzPi5eCNzug75dzdDkGfe8VOocKOW1e0ytMibDPz6s7i5DeIl/TdmqMe?=
 =?us-ascii?Q?ZB5Xyok8Vxys+qagnCXfWzSOxaBRIFY+1PfYdvcZvI+TWlbET1eEHXfmsHRw?=
 =?us-ascii?Q?hdpr7d0dBhibH0GdUTdTaDpOpkdFf0zkIEfJWh56W6TVT/k1/6vdRx8+vzaq?=
 =?us-ascii?Q?u+eU2Vx96aa9snG+wkWGrOjIvHyhefjTK1lo3z6vcyom3R4ZBpLGFhQxQ+WG?=
 =?us-ascii?Q?uP7bkVJJ+cOsujh8I4xA7s2UJnCOGmKwCrocw2bXK70gmrhbmzVZhE3nwnfF?=
 =?us-ascii?Q?izDmyZMIqJDa+Wj2F0Fj7tzI3xd4NrjsfrA94QN0L4UzbBwsG/+66zMsk8GX?=
 =?us-ascii?Q?Ek4ZILhmVJUHWA2de4BAKcBciIP7Pu6EHOGHnuMyWeZdPKBSiv4Je4s1zwHG?=
 =?us-ascii?Q?iy0d4iM9B0KNmCJNTQJ+6z0vCaWL/sEGN6C4X7avL71qmoAOFqOmCLr6ugke?=
 =?us-ascii?Q?Zc/aHerBsqqRa4opZhJJ53RmJmzAALgb/n3cNI/eMZ6T8rg2H+39uLfvDAek?=
 =?us-ascii?Q?nhplcrrayt0cB0//E98PQjrY5EBG/EQBR7cQa7T/qdd5ZZ3C+hZum2hyzLo/?=
 =?us-ascii?Q?f8czmZSV5KyUTC4NU2Mf0j9ZOxgswNAjiDfMZYRJfaqXAgzdK7w45mIinDEJ?=
 =?us-ascii?Q?a+yLt2/G0DcU/rGF1/WcPsM2/lZ5Zsi+cBvlYN/UakFZcGyW/FLpAJZez7f3?=
 =?us-ascii?Q?dTYqdmwTI9TSDABhwOiWL3o=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?AA2NVL8K9cYmI6xzODjLYReW4f7W9FNDCJPNxcQrErNPC6DAV3JX4N1f1e/j?=
 =?us-ascii?Q?n9LWBvGwHr2zCoGAbarSCqJpMlRzfBGL7+eonf8dumc41piYpzfusKXueZ9x?=
 =?us-ascii?Q?EM0XvSjk0Fr38FLI1eFxTADY+KYySHX4FVjIsuCaoV8k6Rjsnm8YXGCw7Xd0?=
 =?us-ascii?Q?VSgKAt72pSb0GadvRd+tcqpvcrW3NLRKK3mFVt3XsZSdH105xhgog6L8DsOs?=
 =?us-ascii?Q?a30Pd5KTelnTD3SumUcpPHN+/GvI35OY9okOilrKkXsDIxBGDp8IgSWv5E6N?=
 =?us-ascii?Q?TxxFDpdaOJa5n2B9zL8d0w4GhM5VpJFrcwsiML1yzuE1/QXdJ1xTmqvoXH/L?=
 =?us-ascii?Q?oeG/MkwfoCf7jBZSzjZgTfsVFU42aQLoIpJazWPK1HySgLU6fplF/rDy1rlH?=
 =?us-ascii?Q?zCuQetToZUUz9XmOqAPY5jozpRnVP2DXVko2f9u2QJPA4Oc3vWc9+fSe0P9/?=
 =?us-ascii?Q?xAyubKYe5x61CoVYRnhj8dzi+6vcjn/E9QbYLDwmI5a0eWESf5q4eVhUUPXo?=
 =?us-ascii?Q?6dfd8ObCF6Hhdo6Mk37xNACffQSQMGvwzlsV88keEjJJU5Zo6hDE64u1AJ0K?=
 =?us-ascii?Q?JZGOkjww9PdLbvLi9Byz2RORLX9W80vspPfkDz27pXgBHx2qnh0rEJCNrW/l?=
 =?us-ascii?Q?VWuiW82jL3gGEaOPg77OyemoTeWjzeymb0QpI657IExMN6wawNKITh4Fqf8j?=
 =?us-ascii?Q?DEO0+bqNFxeH6z77h4KBTU88tP4JaOTGRZuuVGe9sdznNGaC8a5wEHs+i4yh?=
 =?us-ascii?Q?R7/NY4/XHQ30+aSFaBsdmP1MTp4jlbLrFRiXcixUm7CeUdGZnp5/EIviGpEI?=
 =?us-ascii?Q?BnS1/gLk41VSobZXZYTy0sWG236IJQutM4ox1/n2Fmtm0yRboqhBBEnKtUIg?=
 =?us-ascii?Q?5Z+wpuTwm98r4SHsCphFXcUFtadzpnNHWM0JJD+ItW1fzVLlxtRSK7du3JM4?=
 =?us-ascii?Q?te7clXtGQ28Mx6S/UpVAOtKjPvSfCEdx6dl86CQKbWgke12oVBjgZ7lda1OZ?=
 =?us-ascii?Q?OqQGYCHs31d4ibtZtfZOKzit+inAcsQLtQudyeyMW6zub0SzkGb+gRpjbCuL?=
 =?us-ascii?Q?1tXKo3AZl9I4kDXal50/a7PhJeHW2JYLDSVYO6erspJHUdfqvaClLiDGNxL3?=
 =?us-ascii?Q?5I/KRGvScDfFBDOYumcUgLnnQcJgCrtemG9NQIggTnBOzhcEU5RoL7kX4yFs?=
 =?us-ascii?Q?ssZB3LHj6YUpPxSTndzm2RM77S986s+GD3rBPBdJrKHnaqwpOS4QiGrht1V3?=
 =?us-ascii?Q?3VBThb+Jz6d6VLlRD/9Rtg3tcqH80dX6p3AD6hVuWx3l529dACfjrdUxeNpJ?=
 =?us-ascii?Q?P6Day8rhYqi8LX2w2tO/M2Yy/fWtCQTrShEqvVZ+CYzZvwskoU4CAe1vX0aD?=
 =?us-ascii?Q?RrPE3plG+14o49gGHe+Ol13tDPd6dmoGB3HI9vxE4x8JByWTR9rWFhkgiqax?=
 =?us-ascii?Q?5TA/Rzuj1M7S+wPt/GvjqKSSBk8sLI576wz4Iocqcd2ISwcr4r5AwvehHNUp?=
 =?us-ascii?Q?2y7sawve+lkLF1c56VvphDxBQ629RAbP3fQtQGo+bYHje4HqXGMY2tnajBIJ?=
 =?us-ascii?Q?XD0MQc6wep1FMnPJL3/M99iLXC2bGG/ko/WfJEty4JPfmqhiuF5HPiBk7Knm?=
 =?us-ascii?Q?O8oV97B1vwcuOmGCDSTuUm3SeNZcLX8iNaTePrQY67UbpjolX2URtjJRxS18?=
 =?us-ascii?Q?lVg+v18V2/NIKvs0rrSrXdJ/b5z6ZQVhxtZHL4MzvbCqFMnkW7U+opfR8pAz?=
 =?us-ascii?Q?4/gYqA2jQA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e3cf6bca-5535-45a7-167b-08de6e159373
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2026 11:13:28.0142
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /AgmorX3tVAXAGqEDxwtNzbdOeZYAyzTqLvktsrA682AQtKRWkvghZ8tJsVxxk+GhHSlunvu2wEcXxT6f+WByJKfrBVPWLXjbl8Fxde2loI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB16155
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-28274-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,glider.be,baylibre.com,kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 20C8C14B385
X-Rspamd-Action: no action

Hi All,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 03 February 2026 10:30
> Subject: [PATCH v3 06/10] clk: renesas: Add support for RZ/G3L SoC
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> The clock structure for RZ/G3L is almost identical to RZ/G3S SoC with mor=
e IP blocks such as LCDC,
> CRU, LVDS and GPU.
>=20
> Add minimal clock and reset entries required to boot the system on Renesa=
s RZ/G3L SMARC EVK and binds
> it with the RZ/G2L CPG core driver.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * No change.
> v1->v2:
>  * Added CLK_ETH{0,1}_TXC_TX_CLK_IN and CLK_ETH{0,1}_RXC_RX_CLK_IN clocks=
.
>  * Dropped R9A08G046_IA55_PCLK from critical clock list.
> ---
>  drivers/clk/renesas/Kconfig         |   7 +-
>  drivers/clk/renesas/Makefile        |   1 +
>  drivers/clk/renesas/r9a08g046-cpg.c | 144 ++++++++++++++++++++++++++++
>  drivers/clk/renesas/rzg2l-cpg.c     |   6 ++
>  drivers/clk/renesas/rzg2l-cpg.h     |   1 +
>  5 files changed, 158 insertions(+), 1 deletion(-)  create mode 100644 dr=
ivers/clk/renesas/r9a08g046-
> cpg.c
>=20
> diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig in=
dex
> 6a5a04664990..0203ecbb3882 100644
> --- a/drivers/clk/renesas/Kconfig
> +++ b/drivers/clk/renesas/Kconfig
> @@ -39,6 +39,7 @@ config CLK_RENESAS
>  	select CLK_R9A07G044 if ARCH_R9A07G044
>  	select CLK_R9A07G054 if ARCH_R9A07G054
>  	select CLK_R9A08G045 if ARCH_R9A08G045
> +	select CLK_R9A08G046 if ARCH_R9A08G046
>  	select CLK_R9A09G011 if ARCH_R9A09G011
>  	select CLK_R9A09G047 if ARCH_R9A09G047
>  	select CLK_R9A09G056 if ARCH_R9A09G056 @@ -194,6 +195,10 @@ config CLK_=
R9A08G045
>  	bool "RZ/G3S clock support" if COMPILE_TEST
>  	select CLK_RZG2L
>=20
> +config CLK_R9A08G046
> +	bool "RZ/G3L clock support" if COMPILE_TEST
> +	select CLK_RZG2L
> +
>  config CLK_R9A09G011
>  	bool "RZ/V2M clock support" if COMPILE_TEST
>  	select CLK_RZG2L
> @@ -250,7 +255,7 @@ config CLK_RCAR_USB2_CLOCK_SEL
>  	  This is a driver for R-Car USB2 clock selector
>=20
>  config CLK_RZG2L
> -	bool "RZ/{G2L,G2UL,G3S,V2L} family clock support" if COMPILE_TEST
> +	bool "RZ/{G2{L,UL},G3{S,L},V2L} family clock support" if COMPILE_TEST
>  	select RESET_CONTROLLER
>=20
>  config CLK_RZV2H
> diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile =
index
> d28eb276a153..bd2bed91ab29 100644
> --- a/drivers/clk/renesas/Makefile
> +++ b/drivers/clk/renesas/Makefile
> @@ -36,6 +36,7 @@ obj-$(CONFIG_CLK_R9A07G043)		+=3D r9a07g043-cpg.o
>  obj-$(CONFIG_CLK_R9A07G044)		+=3D r9a07g044-cpg.o
>  obj-$(CONFIG_CLK_R9A07G054)		+=3D r9a07g044-cpg.o
>  obj-$(CONFIG_CLK_R9A08G045)		+=3D r9a08g045-cpg.o
> +obj-$(CONFIG_CLK_R9A08G046)		+=3D r9a08g046-cpg.o
>  obj-$(CONFIG_CLK_R9A09G011)		+=3D r9a09g011-cpg.o
>  obj-$(CONFIG_CLK_R9A09G047)		+=3D r9a09g047-cpg.o
>  obj-$(CONFIG_CLK_R9A09G056)		+=3D r9a09g056-cpg.o
> diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9=
a08g046-cpg.c
> new file mode 100644
> index 000000000000..d77934872cf4
> --- /dev/null
> +++ b/drivers/clk/renesas/r9a08g046-cpg.c
> @@ -0,0 +1,144 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * RZ/G3L CPG driver
> + *
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/device.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +
> +#include <dt-bindings/clock/r9a08g046-cpg.h>
> +
> +#include "rzg2l-cpg.h"
> +
> +/* RZ/G3L Specific registers. */
> +#define G3L_CPG_PL2_DDIV		(0x204)
> +#define G3L_CPG_PL3_DDIV		(0x208)
> +#define G3L_CLKDIVSTATUS		(0x280)
> +
> +/* RZ/G3L Specific division configuration.  */
> +#define G3L_DIVPL2A		DDIV_PACK(G3L_CPG_PL2_DDIV, 0, 2)
> +#define G3L_DIVPL2B		DDIV_PACK(G3L_CPG_PL2_DDIV, 4, 2)
> +#define G3L_DIVPL3A		DDIV_PACK(G3L_CPG_PL3_DDIV, 0, 2)
> +
> +/* RZ/G3L Clock status configuration. */
> +#define G3L_DIVPL2A_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 4, 1)
> +#define G3L_DIVPL2B_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 5, 1)
> +#define G3L_DIVPL3A_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 8, 1)
> +
> +enum clk_ids {
> +	/* Core Clock Outputs exported to DT */
> +	LAST_DT_CORE_CLK =3D R9A08G046_CLK_P4_DIV2,
> +
> +	/* External Input Clocks */
> +	CLK_EXTAL,
> +	CLK_ETH0_TXC_TX_CLK_IN,
> +	CLK_ETH0_RXC_RX_CLK_IN,
> +	CLK_ETH1_TXC_TX_CLK_IN,
> +	CLK_ETH1_RXC_RX_CLK_IN,
> +
> +	/* Internal Core Clocks */
> +	CLK_PLL2,
> +	CLK_PLL2_DIV2,
> +	CLK_PLL3,
> +	CLK_PLL3_DIV2,
> +
> +	/* Module Clocks */
> +	MOD_CLK_BASE,
> +};
> +
> +/* Divider tables */
> +static const struct clk_div_table dtable_4_128[] =3D {
> +	{ 0, 4 },
> +	{ 1, 2 },

Typo 2->8

Cheers,
Biju



