Return-Path: <linux-renesas-soc+bounces-16207-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 375D8A956BD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Apr 2025 21:24:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 253FC1896426
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Apr 2025 19:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B90B11EF0A6;
	Mon, 21 Apr 2025 19:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="aI/DjWuK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010066.outbound.protection.outlook.com [52.101.229.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614821A3166;
	Mon, 21 Apr 2025 19:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745263443; cv=fail; b=qor/mHKR6Bb83o2Mq6COVBeod1/JOmbwgDQZQtWl0tOQ0k4er7+0qvfm6u2kQIbFg3gPfoVK+G01e32jAv2FHrLWPkZrZinefHCgnDNIrV25l2LGq8ZH+F/dgRd8pbl1MKdN9l/zjasC9U2gRxxv9grySzIwB521jwz27FETBSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745263443; c=relaxed/simple;
	bh=l0n9kTX63HlN0XwiZBeK+ZNhNSUdRIzyKL/xJdXTniU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SCzdxbQnCPErxMbCmDmBadDjF+YhlZwKQ1/E2XDMV995kY2iNUhfdTIY6gJcX3Txh4eUpEdwgLi2OuaFGE0FnIT/CTmv6GVjG2rNP8etpEyqeI8UoaJSYbNS6aOKxu85W1o+vgJX1w/z1s/XpxTBZZLtzyWUpM5UzRGG7pMCON4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=aI/DjWuK; arc=fail smtp.client-ip=52.101.229.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yD7ld66dpoKzMNFQ3jdskQF2RveuRPiAPssGxs5SvRLjbnBUo19ZZ7Mg2uRWJxENBrTZe/5BCqB63n/EvMyQ7/N8vBkFJdCIEjPQP9ZFP0e2XWOj1MJoIYpXGhNTa71C8y0l5C5Bq4jQdqDjXD4p4DTn3kPHHn6Cc+hwTHdPkAYnEyrCY4hQD5s+xPXO5m6CT7ehCAPysLjsmnECJ0qEz0pTAqbYuFaabxXQIpD0nu0/DYRUkGDsMyrIRLNCcABpsfp/khQZuqiMevgkGIQf4UdkRsJgdwOHGO48UTKnykc853ZE4Vn+qiJD5ZVPvzloYGBI5LC1UeYGoUlp05b1mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l0n9kTX63HlN0XwiZBeK+ZNhNSUdRIzyKL/xJdXTniU=;
 b=sjQ7xsqqn+BU5CF/NYEE1LsZDH6WwY6BxYTWwz32EvDlI+tMlLjwl9Gg4/oPfb9PjVDq3IgR8+2bmvOVW/blJJnyqYY7Tpip8VgPGsDF0yCpsE7/XpZbAi24GLl/Oz4VYxZ1U8nXcfotErgUjjJJbWoYkhB6DiP0ATcGEGxK/yk0Kw9J3BPr/eahqY3C0RxnRhaXrL+9vaWPxw0W+Aox5PmFbyQ+Rt4+2bH1wf6EglbBmwavpbd4CFtzK9SuRSBt4ljZC2avZt+8/ohaO8vQT9U0csY0QZHd656Dla3ZPk/9+ZX18tSRzAxlNc8gtn3H2dm6J1LWi7pkwQWrjAZCVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l0n9kTX63HlN0XwiZBeK+ZNhNSUdRIzyKL/xJdXTniU=;
 b=aI/DjWuKGxoujzR3jKz6gbQG2/6sniM14XH5tFgPtbrztrqpXQH+Ndh8FIY7soqhv81RUjQh7LVowE/w6AB0rTjBGHAk1ZYR4mtuVirzVtzGu/ELeoYARKnaxvBXw8egeWEg4cibwm5tBchkL0AR66ruJOrwxc36ZbFUmjheEBo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB13418.jpnprd01.prod.outlook.com (2603:1096:405:1bf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Mon, 21 Apr
 2025 19:23:52 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 19:23:52 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Russell King <linux@armlinux.org.uk>
CC: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Giuseppe Cavallaro
	<peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
Thread-Topic: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
Thread-Index:
 AQHbp7UXRdTsn2oCYUWD5qYhUQGHu7OjbUQAgAAVgQCAATLSgIAJgP8QgABZJYCAAAD3cIAABFQA
Date: Mon, 21 Apr 2025 19:23:52 +0000
Message-ID:
 <TY3PR01MB11346DD3E3AEB0CCEAB57AE9C86B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407120317.127056-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z_0-iH91A4Sexlzj@shell.armlinux.org.uk>
 <CA+V-a8sS0TtS-TEdkQ8MB5F4JtzV9358Y9fmKe5MggGU+wP=4Q@mail.gmail.com>
 <CA+V-a8tbW2Zs6op20yRTcihSm1bcMC2dYnRXVCKRf=q4fymZyg@mail.gmail.com>
 <TY3PR01MB1134633A8CB82788BB98C6E6286B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <aAaVrVFql3vSktrT@shell.armlinux.org.uk>
 <TY3PR01MB113461CDEA58CB260ADB9FB9286B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB113461CDEA58CB260ADB9FB9286B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB13418:EE_
x-ms-office365-filtering-correlation-id: fa0b57b9-94ee-4032-860b-08dd810a0d1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?J0Nee4fhCYzYX6NfWuYPNrO1/1fQKrUTU/GxeKZGmvaRVeDMjsGTMwx1xRYI?=
 =?us-ascii?Q?XQiaFzyog65+YM3y/+mpmV3Jzr0GETVbLxWKMFPaxplOV+l/F/DuHQ/8qJEZ?=
 =?us-ascii?Q?X/ryEZsr7rAqY+tmxw4VOxu67sji0rpZeXm6rbOasOIhk/SBHxKN4QyampwL?=
 =?us-ascii?Q?VpOJEwAb3VIUgLPdxw4Sw5QgCpCxTUb2wv17goYCUTTwrD2dz4Ycva38iwaB?=
 =?us-ascii?Q?tAhMVi8F/Loh+ndV1EbceFnPFp/dCCTwOfoyaVXE4K/WJQN2orbJ6cP8HKO0?=
 =?us-ascii?Q?Vu2hspbA09QX5j90wNUN4otEJlJAlC0TVY+vo6gemy8G4OEgEy1bqptzBzF+?=
 =?us-ascii?Q?h0aATpaCYbPn3tQ/HD3TmRpchfcExGH3a2jkfjGxZnjQfybRpinqzdmaqUHS?=
 =?us-ascii?Q?57gc7AwwQUqcWJZx1PZRdreEbljmp0Y1mqeJywLGBdj6g7g9s3FzDjl+uK7C?=
 =?us-ascii?Q?5LdnwUK9jjV+ChXlBjjpCoRpwqGTgRt89hqVGUc3mJlcbnXHRSPFnI9vLhXR?=
 =?us-ascii?Q?dU4Im3Om8W9EAM3G/hnlheCR+hdefFPLJAgtw4rsIImkUzvGC9jNsMWSXMiq?=
 =?us-ascii?Q?bCupTdLeYiV+VXSlKR8tKRq4l+4B81BUZ98sIX1Vsz6E0hXywTkFSimYbClw?=
 =?us-ascii?Q?OMVd5AjdgUnCUBZDLTKY4sgtGQUGviDntukzXbIbY0pR0mEjYGACiqbX/1g6?=
 =?us-ascii?Q?+hQZzs5HzK/D25DEQTS8KPPC/zSHrtwQLrmlhFy2urBRwyVJqOHcLd+Mtnsp?=
 =?us-ascii?Q?STVmBFwXPLfajcf3xCeYZrEJv6g9uPdcsSc7TLtCTw7MxhSFZcRqM6mn36CN?=
 =?us-ascii?Q?l/CzrEkKVNMqd5x0mhiKhA8duCPWSUGfq0awCYgtwGtPrN06cPlyD322kt1K?=
 =?us-ascii?Q?C6Drl54ghQ+zzGV2cQhGjy5gnFM5CrPbl0nZnrhRCKMoN2WU3ct7Q6OO4XNX?=
 =?us-ascii?Q?T56IkD+bZIAR4dMWIcE+s96Q2EG9xXjCMpkkjnkrkmq0OlVdNxqcHT1Y7gAX?=
 =?us-ascii?Q?XN7XBLgtlKn8HXO+Vmo/SfZII1ykIUcuXfyqgwkPegukKishlxPCU/4EB+0X?=
 =?us-ascii?Q?o9FZs2cRd+0e2zpI8ApKYRikMDVG/jF5XkILzbiEEjZARybj1PaBEj2L1TMW?=
 =?us-ascii?Q?0pVr8M08Z1mbdEEDNDZqkRaFDEXmJyhakr+pL7KpwIEIOCcBLG56fevrhuN6?=
 =?us-ascii?Q?wip40oQ8ciTgDNmS23UHdQoaYaGPsMMYVc9KwdQjNGMpnUjutRQca5lyuitR?=
 =?us-ascii?Q?zq0Azl5wjnUnkfvY7E7/gSqz8Fa4M/RsynmH4UfH6i8b/6ZPWBw4K0MVxhyo?=
 =?us-ascii?Q?r+j3/AXWugOYg/XoQRqR/rUm9ctGzbdobpJZZs/QDI6PZk3JbifLfh3Ti3St?=
 =?us-ascii?Q?3cnZg9raTw60fqIALcTppKuj39yKYksrul1qPyo2U9ZiY7dUwhRRqfX1wHNo?=
 =?us-ascii?Q?XT/qRGkFVDpRhE243WUXqyelmdc142Tn3Q1fwEp0EcTWQFaf3bkILhmtiv+A?=
 =?us-ascii?Q?Lw6wsZXGPW7wGiY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ow8rGzhoXrFIWiFKz3Q1aqFnHVMW5ZRh7CO4NFENt4Lp3XOVDf94PqFpXGjF?=
 =?us-ascii?Q?t70V8ElRHZcx1oZ7HSP/P3PcWujK9fOfw0AJCNmvC8dAV4gUAN86jD5vF+3H?=
 =?us-ascii?Q?FWQcPUD09yXLlo+qP6BS7VxHhCfQW0VOHox7KQXuOwGsJ8scBU4eXsbrxaOr?=
 =?us-ascii?Q?6wkxtz4NzLmqaNqNbpgWEOFfWODshZA1ODsPdg//LQCCFnlicVWLTAXCj14m?=
 =?us-ascii?Q?7h3gCN6UUuJYZHmal5okUcqsiwaGoL2/bYzyrxNRMVQyfXfZaY3pHVqtjgfT?=
 =?us-ascii?Q?Di5/Gn2M/EyHnnGAglglytNzb9fxIcuEbyN0XN1RW6FKaSoQWVVOreyvIYMs?=
 =?us-ascii?Q?1VrZvl+3D8GAR4b01QvMvQEHls3AqUWsJeNFO4+RZX22ki0ZGOJ0h+do7iH5?=
 =?us-ascii?Q?4pULmyXNOPwtsKL3lh6M6dSfrvOc7QRi513bZ1zXE7Nw17kOuNwVHUviCNcQ?=
 =?us-ascii?Q?YRrEetPl4H/uZ3opDN3gLLWhlaJOKRW0nT84xd4Cd5Hh8NgjS92+8LeuIr1e?=
 =?us-ascii?Q?ix8FFal9hn5H3V4db1lWbu+OLXVfYB3hYp525dQzsds8ArEVOQvIG71FCTVa?=
 =?us-ascii?Q?NFz+r1vlMtdar8IIMeamt2Z6JtXBubaS2x0YezcJfZd83cxbLbSJcI3rgDmL?=
 =?us-ascii?Q?EAxW0GkW3CocpbAKWduGKQhTUo0Q8mQHdj/GG+mQ0HLEGSOA5oufPGUw1kX9?=
 =?us-ascii?Q?OAFy2Xs5fXW/JFDcRvj0RVh2S/N22kB5/vSnywan++Tb4hCE8bs274NphVbd?=
 =?us-ascii?Q?fbLC+x1JxqhxVOL3jyLLEvQMWEzA2Uh75rF0U79O91ua+kl84wldFsPpo+pL?=
 =?us-ascii?Q?GNisAOvbe6XZApobRyZcMZOjCXVbbGge6oXwjAGfKLgLX3uzgsXkHtfmAvs3?=
 =?us-ascii?Q?KrizpOlEP6ShKTqd3wu9CgKT4t545i7YSB9mgR0HSmfZB7BhdNPUZ4IaCb45?=
 =?us-ascii?Q?u5WBuPwcuiI/sgtuGgol92VFm/uzMLMWHdAyWQFhZmJK7IQKVGmorRxA8I6i?=
 =?us-ascii?Q?a4JbftFAnDei8vKzYML7wP6JSjbDU7ijRXeIYGF68GODL09ls5vDrIR6wpnE?=
 =?us-ascii?Q?pK7U2R6ze576c6IWzqgpfQxjZCKPNeZayF72Mr7gSKsi8q6ygoeBrV9wTKAe?=
 =?us-ascii?Q?bWdIt0YiFs7Qg/eFXr1gXeJ9cxaD7nrzYbvOhX2u/kurG2kTBy2qLNuemGY4?=
 =?us-ascii?Q?DLT9Qxv5T2EaqQTk8gsaLR865bJD5foB2tsRGfkXJymQrTPUW2IriRUWnabL?=
 =?us-ascii?Q?u2h53/0+sZ2qm9O2z1odX/pHpGgWtezvpozL5yOPYBftUmwvaubbnjRvyM6y?=
 =?us-ascii?Q?DC91PE9WGrNt2gc/IpzmQxuZRez+V5dHfwQheN1C/ImElFIM0XZLM0AdOLYM?=
 =?us-ascii?Q?oEoOXtfuBZY3OvEhP+d/b64Jq0efDJAfH9eVTEn7aRTnnXiYkydaBL/xIFTE?=
 =?us-ascii?Q?2jxQp7MAL3F8VYwfASaN/sZfIVQgr/riQhxhbrtNKHHruIgl6tO3h7RYPWhx?=
 =?us-ascii?Q?c92VisAUG8p0FcMsAU8gLoGbBR5B1Duh4LGE8Yd+EEk67up6XF2EUk3IUcXq?=
 =?us-ascii?Q?G6FwZgKbPCR60Vg917YycWOq/DpyOpp+F2gKUyjccaFe3aVPFmot1Iswowae?=
 =?us-ascii?Q?sw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fa0b57b9-94ee-4032-860b-08dd810a0d1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2025 19:23:52.5836
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XxtbvHwvHf/2N/Bdx+xI2y5733kcHNeQ4HS8tiQQLFDdtqjxNcU0BWozfYDWchIvS6r6twaTEtKxVabEfi2DOsebP/NuBIXqLX7h7xAjeSI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13418

Hi Russell,

> -----Original Message-----
> From: Biju Das
> Sent: 21 April 2025 20:06
> Subject: RE: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer fo=
r Renesas GBETH
>=20
> Hi Russell,
>=20
> > -----Original Message-----
> > From: Russell King <linux@armlinux.org.uk>
> > Sent: 21 April 2025 20:00
> > Subject: Re: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer
> > for Renesas GBETH
> >
> > On Mon, Apr 21, 2025 at 01:45:50PM +0000, Biju Das wrote:
> > > Hi All,
> > > FYI, On RZ/G3E, for STR to work with mainline, we need to reinitializ=
e the PHY.
> >
> > Which "mainline" are you using?
> >
> > Reading your emails, I suspect v6.14 rather than something post-dating
> > v6.15-rc1, since your latest email suggests that the PHY driver's
> > ->resume method is not being called early in stmmac's resume. However,
> > commits 367f1854d442 and ef43e5132895 made this happen, which were
> > merged during the merge window, and are thus in v6.15-rc1.
>=20
> I am using Linux version 6.15.0-rc2-next-20250417 + renesas_defconfig wit=
h CONFIG_PROVE_LOCKING
> enabled.

For me, it looks like issue related to timing, see[1] for details

[1] https://lore.kernel.org/all/TY3PR01MB1134690619EC6CADD07CD2DE186B82@TY3=
PR01MB11346.jpnprd01.prod.outlook.com/

Please let me know, if you have any patch that I can try out to fix the ran=
dom timing issue.

Cheers,
Biju

