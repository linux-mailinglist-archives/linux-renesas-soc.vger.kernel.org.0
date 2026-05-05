Return-Path: <linux-renesas-soc+bounces-32000-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BZpN26I+WmC9gIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32000-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 08:04:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E994C714B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 08:04:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D38273007219
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 06:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A563A3B3BF5;
	Tue,  5 May 2026 06:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="OA43M55l"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010018.outbound.protection.outlook.com [52.101.228.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41DD1DE8BE;
	Tue,  5 May 2026 06:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777961063; cv=fail; b=SDcv9Pu08ZCBFrH5l5P4zpuwFF2S+owzrjhB9pJH9nZfVjbD56HRFfTK2w4K23Gjoqmz2VTkyee4Raj/RSrHcxqC9eJjG564LvwspJ2m3zv7WmWBWC/AO/SFk3TPpS/4ApbYWqY5freia9xZwobD5mq9nJ952aEmLUNDQhfuavI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777961063; c=relaxed/simple;
	bh=fp013CBP898cx9aKBRsEZ34xjkUtFHAGDuLrtOaBNew=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jkCpdSLFOXJ1cL9KCeCEKLgBLmsspuv/aY6DQzPl+nlDoBQiPRQr25HTn2xvNIkgvVzjFtK7ZqmQpfFU7j9Ffmn654z3N6dgVoojsvLJ8IEMJaW++QpDvAn4HO/y7hOEuW/4lYkeezFF1At+2NYICyHA2kJlelPj8mjWyuVSqos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=OA43M55l; arc=fail smtp.client-ip=52.101.228.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=osn1TlPDJhQ6flxXhkpJFdO9h4yJJ/+6zFdC8IBdNVGzBxwVDf6LZoewvv2mxz96NyPBkrYKKRVjfNAkh3fbzJ94ShlUvM5EPQjr/csJ2qrFLHF8db/NBKRGYTorDbF/iu3MNPhPFR/8SchPJaC21N0/CTesGQLLdgtNoskRZWJs0K38Hk35xdRgPrCyHqKR8eFMHET3OJsAV6Rqve3KhMNoACGx7isPemwQeLyCimMfRyCtHhnZTfd3lqgoCF3v6KRZnQjmr8MCrOPozxbuCMNeSYKMUxfgeHx9BQF8ql7Bc91HmNAwqn5LSx2wxzGi8c2QxY4B7TISxin5XKAlow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5C5I1OGqL1i1JAyeNnUYF6yV6/g4wujULGKDUYBshI=;
 b=G27x2p0JYHXkgX1QpdwhA0pP6HuYX/bcfTmzcAtZ89yJjR5g5UCAd0lz9Wwznf/hekJpV0MZR58gZqRauY3sSLAg1rc/q/BN6PqIb/0vIdSkhtAdoS5uWjdFJvmQstAQHCfFdy3eFp3xuHLpAYHFKMavr5hatTDJYviDd2lg/r+CL0c8QDFahUmX0vG+SfXNb45XheDGm0erXDCooY++2MwxlFaAnpMV4Q31EQkT+2OELZ9IV1pEfS/AKdhPBpkqWyxVCtjNo9UdaY/UtcOIdkX0bYLQjmW7Wd9Ux0p9ycqE/4enpPzKRTfe9leFsU1tXVuLuJtg0RQK7JH3Kleprg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5C5I1OGqL1i1JAyeNnUYF6yV6/g4wujULGKDUYBshI=;
 b=OA43M55lqNARbyHOiPXRKmBvmxmGvmDF6IwLyYIOWM/9INtO/6foAMO6u02UKvVIDg+s4UdiNJDGqD3g5EJ/SNr5QjI2cd6JCt4ITLHM6PRme9aB5HugQKVBVj9C4WUdRRatMVaTIV+2GV9Pfl5noqc+27i6xzCoZEEe9FhKsiw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB10284.jpnprd01.prod.outlook.com (2603:1096:400:1ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 06:04:19 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 06:04:19 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Geert Uytterhoeven <geert+renesas@glider.be>
CC: "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, magnus.damm
	<magnus.damm@gmail.com>, biju.das.au <biju.das.au@gmail.com>
Subject: RE: [PATCH] dt-bindings: watchdog: renesas,wdt: Document RZ/G3L
 support
Thread-Topic: [PATCH] dt-bindings: watchdog: renesas,wdt: Document RZ/G3L
 support
Thread-Index: AQHcl1rksZlmKBi7w02Zq6hIncuAibX4I3mw
Date: Tue, 5 May 2026 06:04:19 +0000
Message-ID:
 <TY3PR01MB113460F42089A5AFF6F7EF9E7863E2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260206112227.233229-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260206112227.233229-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB10284:EE_
x-ms-office365-filtering-correlation-id: c1f9de70-7222-4ad8-16f0-08deaa6c254c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|18002099003|22082099003|56012099003|38070700021;
x-microsoft-antispam-message-info:
 6cgAsEIWZ3S5OIZmwiERYWb4J/geECrzru8oOOobeSj2QOyXBLoeMm9iz3iX4JGfm6k2X5HPdIxOGoF6B84ZMqs+6FNkpDyGRgpGOOiYrJi82h86XVz19lHUj0wFmj/y5/sq2O6s08kp4uzPEFZDwjuKgdDwj+5vNOEetTOLBCfTdE2xH+PDz6NuqqdvZFxLHsibgWJ2sPW/wfzhxWXD9uayPuTihgrWitWbttU2DzRtJGY60oHqecMLEukHxb2YRTJGQN3SuClU3XrP0grbPbyR23WygQs84GS/edTd5McVyV0pSLb/IqUmFQO0xMPFE4C2wqwuzx1YGfJ4lm122CUu9O3wKNQjzjqhfQ1+g+7F9udM5m3nFfEvYOYMohh6TB9H9y6JuLkPR7B1dv4qrCJLk5uj5VbQJ38Tahzh+Q+8OH80gGXR8J2lSj6BZaT5o5XGTSt+Nw6KuY0GcBLL+dDxX/kAzz1UkkU2ApJLjR+NBOW6AOAHyn4MSp2I4LC69ZXRF2A4xOo3EvSr+CRJCS/EQetDYeYpFOWYo7f0+h0Mxj5m6QpCAiU2paCy9FD2eAk/H93PysH+E5vmhE0y9uc9YiPhg7NNnk0/Xf6S3Wvhgmh8jXWl/WS0NBbUQqoHpeRZP1W557YCXhb6tg+UPcpMoSQBqesX+BtOJy2HgjBKEuO25B8XDP9GGQX+ILsd6w8eg2e2OTwriWMeemQM9gpf/WEu4qbM63O2JMZoRzPPKAKTOcG44iusR41s/QIa
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(18002099003)(22082099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?PU2G+RpLQKFX1NDRSLzy8L1kkPvu/AXH5capodruKPF/+2a7LsMRQsm+eSZ0?=
 =?us-ascii?Q?5aT0+gXbNqVZieXKK9KujMd9mdym2ogwv9li4oL5D/2iXp5uZnGXRMdgbMRE?=
 =?us-ascii?Q?ZukIasBboWghj4dlhdkbR2G3ll8XMe/OeowHYImf0teEbtcYlsxeh4CutGdp?=
 =?us-ascii?Q?aq6hlbkXCQS1yXdiwDbHjFu4ueoJqbbOKD3RW+9I69gG8a5/CsOR/Gn/Yptl?=
 =?us-ascii?Q?b74qHwy5blvyPqixT0ea/PxnupP4xzDSJHygZ9MbZY/Xte7ZEB6WebzVOuYF?=
 =?us-ascii?Q?50T3nciFknYdhaJYRZ3EbkQUyXlCPBlYM+OVF7GdaeVyBhcfu1VYc8shzAdJ?=
 =?us-ascii?Q?yTvlJ7THl/vNUeVd9iNbLYZro5U+HeTlVxtd9XPodNJfF5njODRl7I5Ozh7S?=
 =?us-ascii?Q?TUXhrqd8QpajUpqtFVc1mZmbTnI7GOKCpLh7LWfA3tmuopBJYx5/58ZVBtam?=
 =?us-ascii?Q?iIXdJp+/TNJQPzlbA77pzgf+P3rzKfI5YjPg1EBsgnaCZUGlJZ8mkHpxgFiX?=
 =?us-ascii?Q?VZEvkLcll4zACXe+zry4YUnl5P1x5SWAajuzKbhdHS/Kc7yDzpBZNPCQB2mZ?=
 =?us-ascii?Q?sUfA6drLAJQK6w1vzZe0samLSc9UkUanvBljZG77R856L1v/vLBVQi+ojwRV?=
 =?us-ascii?Q?oKUD7v/pSc4Xkhz4+iJ4p13Di3hgpTyYS2uKnn9oWuqdX3tpUsmjbzB5pdNE?=
 =?us-ascii?Q?Go2IGco0DmY+WrFWmb4bbXofSq0TXsPu7d+trO9J9YOBD5MKLUrzcblFfKFW?=
 =?us-ascii?Q?8wdgEucdOgaX6w6Fv2AVz2pDSh30okL4DQOARPxkW0sjgnkV5Il/lnSRC/PM?=
 =?us-ascii?Q?Ksvh0PtHvc097wBay/gPtnWFi27Y+3GcKUc+hMHktvnFVOgI6oKzQJFYrrVL?=
 =?us-ascii?Q?wY7kdBBZPKCDNohzucJOZ07dwXYmj8C+w+xeLisNXGbidLGEQlameRPXc8Wt?=
 =?us-ascii?Q?+UEFvtjJfTTPGIqbEC95Zq7M58nzH1lQcBl11+G6VPgOePY9+YyxTkd0Le/i?=
 =?us-ascii?Q?KJdpvNUcVyVXRdpVesioZkvZ4+HtBFYSQwT9dJ4Z3++dl1GVyxYC6UFhbwwj?=
 =?us-ascii?Q?lLge7kTC+ji+QkNxfKBFuGL7Ctl7pjtiux+Gs/dl8pLdcmpQaUAiuntRjPaO?=
 =?us-ascii?Q?i0WhqMqw49KIghHNhL2v4x4DoPmwsdWPOQb1tAp5uKM2uxPv7S76JtX2Ap2x?=
 =?us-ascii?Q?Lc00dXfzNqECq9yGE/O5hu5A5n/VFmANCWRPAB4Rw6AeOE25oH7uu+gdrZlp?=
 =?us-ascii?Q?fUvrQp/mNrwadXlzkkAAbZ6Bb9SWj+O9Z2s1BvVrZTl3bQmyTknwZj8S5yhi?=
 =?us-ascii?Q?hz1lPEQCqfK6Mold/53MO2qP8Ca+3t99QqBysKRqwDPjcCJhnFJNU/yYlGip?=
 =?us-ascii?Q?ZUy5G7wyTMasTPnTnwzEkYJ4V98kRNM4HoUFRQz801GEbggS+CVBuMDSBuib?=
 =?us-ascii?Q?tVQhZTbxaT0JyJ2RmZ7QCBpzopQGz2TVSVVxl6FcsbxnKA9s/jlebpbgLv1u?=
 =?us-ascii?Q?VE2hGZ2/3cUUwq2zjlQpr4vf7/7Jn94nf9s8zCb/fucukN6LHjOVAfR9Pi/+?=
 =?us-ascii?Q?IkpgSUW64vYF1YqYjWvmvTdZkkHdE4hOVS9WNEcgHrWMMuCFWrGghaDObP9o?=
 =?us-ascii?Q?CUyHhc0hQyW7SuO4RvFV0JELg1Sbp7c5DU4Ern/rKcjOS68afVGQL/zmaLxI?=
 =?us-ascii?Q?A2TrpsejqOFztK1agzQ4Xh/Hl1Flar0OPM9nuaDWADpQ8TlaB39eDEibwuCg?=
 =?us-ascii?Q?XTn2zILoFA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c1f9de70-7222-4ad8-16f0-08deaa6c254c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2026 06:04:19.1963
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nuJaMs1fUIy7vkRIFme0/753DyVDTSFrmXh7aBqbmSJkyGHhB5m/ybxU8zrAwYNsrPFxlrp82o1UGHROh1BifA7wqnzo01wQBFzlIKQChK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10284
X-Rspamd-Queue-Id: 03E994C714B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32000-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

Hi Wim/Guenter/Geert,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 06 February 2026 11:22
> Subject: [PATCH] dt-bindings: watchdog: renesas,wdt: Document RZ/G3L supp=
ort
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Document the support for the watchdog IP available on RZ/G3L SoC. The wat=
chdog IP available on RZ/G3L
> SoC is identical to the one found on RZ/G2L SoC.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../devicetree/bindings/watchdog/renesas,rzg2l-wdt.yaml          | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt=
.yaml
> b/Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt.yaml
> index a4d06c9c8b86..40b4fb26d9c5 100644
> --- a/Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt.yaml
> @@ -18,6 +18,7 @@ properties:
>                - renesas,r9a07g044-wdt    # RZ/G2{L,LC}
>                - renesas,r9a07g054-wdt    # RZ/V2L
>                - renesas,r9a08g045-wdt    # RZ/G3S
> +              - renesas,r9a08g046-wdt    # RZ/G3L
>            - const: renesas,rzg2l-wdt
>=20
>        - items:
> --
> 2.43.0

Gentle ping.

Cheers,
Biju


