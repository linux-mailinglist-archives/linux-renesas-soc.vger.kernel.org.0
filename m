Return-Path: <linux-renesas-soc+bounces-27794-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBb7Nry2gWkrJAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27794-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 09:50:04 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 557CED65E2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 09:50:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 40779301AEDF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 08:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36BC8392C4C;
	Tue,  3 Feb 2026 08:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="qRe1LNZP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010062.outbound.protection.outlook.com [52.101.229.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F8834D93E;
	Tue,  3 Feb 2026 08:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770108601; cv=fail; b=im9U+6efmhhPDTLZr5r1lpyv4GNrTpPaJXNXDVX46+wPUdRlOz2kw2LTbv0URqEb41EvDGjqOnmmOSTTzVZ13OHGWw+wnfQmE2f6dM6vhT9gvc9heau/+QMH7rsF05KPH7+BKMFKl9QhVBEbMC2QxC/Xv0U+Nb+vuBMMWJfM3eU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770108601; c=relaxed/simple;
	bh=s7d8TBip4b0up7tDmrUceMta/+vpMXKW4BHlHoKP1sA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RFWtI38o2ctFuteqYqcWq2A3+/Rb0Ea7I8NOEWQQVq9h/fisIauv74VXxA+GL+CcXzJWyn7MUa55YT2V35HfDaYvaADX/qz6vXo8a+PCtdDlXwI+AI/KaRfOmWHffP4tkx6dTQ/vO0HNfoi2cSujq+ENfwCkj3rR0dHfcdMbo18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=qRe1LNZP; arc=fail smtp.client-ip=52.101.229.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w+6h6GSHc2W8Ryk+geogHp661lp+zT2rL2zKNkIdvJjEkpnwD1CfN1cNwMoKW/+9L3GsPBUdy7r6oxPhTrpHC6e0yHQXVo/RQJBpAXeQUivI0zHI4dQK2YDSNFOnowDIckZBiNxMhJ5iOpdoiS2tEFF/mzyMdwRW+vy1c9faV3+w7ufbrzix73+OLWqjJCac2o+svVwqtlGL0AtbpjtLKOaeIlvVeD+pWuvShzAHoQOAbCCE4VJHvBozqLuBvPIf6xdFpoSibSIZt7tNsHUMDrTaI7Ie/IxixYttUOZdtNUPuCT/gnq7Adr3EuBZRYQdwouGd0wBk4K8ZoxalFUEYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y21wLPihElCdoS5rShHhWYLPyilkdMXrs52J+mQpYbU=;
 b=gXHYA7gRzrFQgrSNcky2QHpIV3mkkyS55EG+FqvacVr8KGomTgVzshuXK2AVM5suWAprjPSul8JV9YHCLLtR70mCoRpFe24yfe5TOmZm7zgDDnT4gH9AdbaWoJxGtCCEgfRecfYC9rrF3GyTfX+OO44jg8fXNgYEqSFXQUa7kSP2+WevFYnVrIzt+OtXzYJQUS5MFkI6UMGA8XcOd/sSrMGwDoIv4nHgy7pKk8aWHxj3slduNjWag27fVEn92c5pp7pI7Worv4oCfKiJwC8pqfHLomgEAD79gWA5ln30PnPnNJk/GvZ1BV09DyQif2Eats8TJdyNw9meCfJ6tsWMRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y21wLPihElCdoS5rShHhWYLPyilkdMXrs52J+mQpYbU=;
 b=qRe1LNZPPiERYo1hDDuEmwOemkEAG65nKdMrrIboa3xJL90zr3eakNvp0/Fc69uHa5gRV32otdYdpMkXK0DK24DMgton/kh/Qr2HX0ApmCdHx5Hxcg+p2StuS05tzLdV1LUMbGvqFZW6gy5Yl+biNhTFZzCHEHGf3VkeXuS2XFM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYWPR01MB11940.jpnprd01.prod.outlook.com (2603:1096:400:3fd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 08:49:55 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 08:49:55 +0000
Date: Tue, 3 Feb 2026 09:49:38 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, biju.das.jz@bp.renesas.com,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, tomm.merciai@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v7 1/4] dt-bindings: reset: renesas,rzv2h-usb2phy: Add
 '#mux-state-cells' property
Message-ID: <aYG2ostrecBVuMPs@tom-desktop>
References: <cover.1769704000.git.tommaso.merciai.xr@bp.renesas.com>
 <af75145b08e24034dcf367932002079363e5dd81.1769704000.git.tommaso.merciai.xr@bp.renesas.com>
 <176971213156.1637421.14962977334514056951.robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176971213156.1637421.14962977334514056951.robh@kernel.org>
X-ClientProxiedBy: FR4P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::9) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYWPR01MB11940:EE_
X-MS-Office365-Filtering-Correlation-Id: 630cb556-0230-424c-25bb-08de630133b7
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dUumBPpHnNOAghiAmQpCTRFkMF9T0cY8PzqNg2FQG1njWc3DCLfi/K5mtFVC?=
 =?us-ascii?Q?xhAsPNlLJdIewbkz7k5ww1dgG96/kacJ3+CdFftp06wpujbDmUshg4zBEYyI?=
 =?us-ascii?Q?mPVuLfMewKV2x3yypOlIJC2eWZ5Uea5Amwo1vr1VVotan7IjxISLo5lxhUGY?=
 =?us-ascii?Q?A0V5IPM0DcRrptLG5vldXdQF3cwQnLq5P6OEDsthGTlGHsLRLhdIQpfuMOcW?=
 =?us-ascii?Q?BkH4Aou//9Ftu3+MW1lHC4zp8/1PVjEtwjPbsGd9UBQgfIVBRk7029GB3C0V?=
 =?us-ascii?Q?1pWHzj7FvbfXzuA/S5IxcE97pCph7rEAk11NKqRLDNaQEHULbmdOO7QgxFv5?=
 =?us-ascii?Q?kB6dacWDV8Y3DhvuYCyWJx7y8sDEopSKjPAUruDD/y6JzMQO8Xob+H2XxQCj?=
 =?us-ascii?Q?fWcAJ46+toDzQLIiXQ4dnobFquvrGgALpXV7XfoFW3m1LHd1ckw90lTGui9g?=
 =?us-ascii?Q?J3hCaKPgH4YGHHTUOrRd2VIiwkiv1L53awSpWtx5BPub/oFHRKlcEgm9QE2P?=
 =?us-ascii?Q?Pj9DnHGiYq85f01eG2s8gb59fRqYDyvVfeUYcHnGUt24sG0ncJ8CcjL9UjO6?=
 =?us-ascii?Q?/jTSvTywMIjkmtFVY118TLCy8sc5oFs8TPWQlvtgNzpfDeqHerSUF/AWOyOo?=
 =?us-ascii?Q?q2OJNtS5SdbYREYU+H7S/Aof2Dqk3fCx964D9lqsF6HUvACTmLYfA2zgOqrr?=
 =?us-ascii?Q?ZQeTaACvkNzyF87NH7/rsxpJckEd80E3mgEnYSnnLbBUcH9exJfy4cdMXYvg?=
 =?us-ascii?Q?zUxPtTo2l9gB6JfSlFGAkdvtQiJnTF8FxoVmpShNnzCQXetwhp17WjrHnh5r?=
 =?us-ascii?Q?SZdmUWTiKML/yRGvguxI0LB/6i3g1xiL3D2iNXejhEVAdKc83uYtfoyTtKy5?=
 =?us-ascii?Q?f2BdPhhyUbsUL2dA/14lL3QtZzVfDcLmIOm45zi6KuC+6VlEQINYYXvStkLD?=
 =?us-ascii?Q?/NeHy4UaYV4pD4SlhhOjeOioU//wZ82qMZLZptz3GN5FbZooO8d2QntHJSa1?=
 =?us-ascii?Q?GcHB0Jrgxh50oDWdFd//P8z3AlzTUXjxnHyjKBLwj+bK86wcT47cWmSpdm8E?=
 =?us-ascii?Q?5uQq/5D5yk2aO8vmSn0OdmvhsdysdFDW8JIHpDQjgnNOGX74UTklVBrqoaLg?=
 =?us-ascii?Q?m+gxb96FeC5qH/g3lUHCEA+YI41e50xkNggWk/JeA7ZEyzh8VrcLsFsXPvY0?=
 =?us-ascii?Q?cDbiwqgU0/CMZs9q9KLbvLMlCnv+z/6Aw0JNz5wYi6P9D47pRXv0LoJRJQ6x?=
 =?us-ascii?Q?wXbg5FcnDAhSP5yHv0EZ32zkHo9cQoDhNIqe8sc9JN2jovdUszGvSZnHLA+h?=
 =?us-ascii?Q?Nd1xYgtHoPhiXNJcJLbRKp8zsTrEWWZ/1nZwiBOjiddNZvzXO2kYGt/u2mXB?=
 =?us-ascii?Q?P7wl+37VNFHQSYFQQapRv8iHmK+3U5U1ghR7lynNIKnAEbIXx/v0SjAM+1uQ?=
 =?us-ascii?Q?A1mrfq+mVUS5g7ibZW0ISOfhKnH9sTvDJCUsF9S/9F2HIZ8dKrqNDzNaBByI?=
 =?us-ascii?Q?NAntxQgtKjl7Bpun1mGhrzBqA6JN/TGVbv4Rm5a3IB3WbqQ3/gNpJpSD9lGM?=
 =?us-ascii?Q?x0YkK1qiwcPx1lu/y+JqmApwNgPjD6MDszeA8Fa1MdhP5Cb5Y6Tq+EgB+kDA?=
 =?us-ascii?Q?xlQgAF4cuANIZB2zh9hjxMM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QMnLehehZ43ChCkwccyTzdtvvVIbt3R5jd6nbeyRiAZrCEowrMpEfpLpdK67?=
 =?us-ascii?Q?evBwg24kPtSfKkRMAy5ItB+9LW99yen86t7jJgYJhtFkBVyU7JTVQ4Cn2xNr?=
 =?us-ascii?Q?RkTh1A8EinQKyH/VJNp82DzdH/uz8BAWgqaKl/kTNsByyDINp042PyWjvYMb?=
 =?us-ascii?Q?xESR5pu5mbyQEHnO7lVN2eYVebe3LjoFyWXMR8Zg626lM2WV5MUjvlPl7ELt?=
 =?us-ascii?Q?vbs4RWwxI3OSojPBeCpiXLJfHk9Xn95RlSXkCg0QrB6Lh/ykzGxInd6Q2FPb?=
 =?us-ascii?Q?rZz/7i3JRGUNiaIiKTm3CS5UdXhPOPLuO9Ccb1zJ1yn8zxmuMumJGSmMmwiH?=
 =?us-ascii?Q?i1n6b1VousYvFE2MDZT/cWdFTN2UneK7RuT0VtGnQf+E2IrXC5WXQf5RVZ01?=
 =?us-ascii?Q?ew1BLzJNRow+Nro37C7wNyiexg80O239MgRYhbGL/t8Yg89uQJZoIHlUjYRe?=
 =?us-ascii?Q?JfNg1bGrjKarjsRgB8pqHADel1q+4NdPXjmiN6epPZ8065VGcfEIQpLuoxHw?=
 =?us-ascii?Q?INdpFT4uxhmYnxSX4R5yCjou/oE8UlrVgg/MmOXUCxAEA+3bN3HxS+Ih+MBh?=
 =?us-ascii?Q?29DE28dLaGqI3FdaqUW+EHrt9MwxVh24X8SPjy+W1GTiQHRJj2uWekTWuCO5?=
 =?us-ascii?Q?WeAIMuXrhJaXiZk4+JMilckcYCsp/YHf1HTwXg82qSWQL4aFkY5NKGpl4/K6?=
 =?us-ascii?Q?me/uRrikrSX1ZcCAmjhDSQ6MiuseIdxu0W+gtj1zF7e8SKKoicEKDGI02RkB?=
 =?us-ascii?Q?wqsnahVORuOC0Jj7IeIXr4JH/iTReOsckzKZyTCtHRldscDBSp0teHpbIFNB?=
 =?us-ascii?Q?42sD1d3cBCr4dxJfsq+hhu7keVbha8E3xvD+uSou1DfrvjAnwsN5uPICVJzL?=
 =?us-ascii?Q?iUwD007o3Wj9orO57rMg8bqp4FhrFUkF/ff3CCOnPGWnAZhu8cjZ7uT85W8G?=
 =?us-ascii?Q?BBHkrCjynrtjcbDTUePUeuaZhLn0rorWZ0jW4HMeG3yNXhZWrVTCaaUDK2ER?=
 =?us-ascii?Q?S2FsnEu6+jRK8u2sC+WO+5l4LvndbG5ojVw9rAL6otdlTQc0a6ITj1qlCFoJ?=
 =?us-ascii?Q?OnvyM9SmElWDnKZVw+3toqZCEScHuWM6FkCDzDer4j8oR/PbpWkvcHfxOWLD?=
 =?us-ascii?Q?cnqYnTFikjXAfGRLL1zu6YIhxiHoSLHT7sGX4Id9OPJ5j8D91ma7TGllv9Qw?=
 =?us-ascii?Q?a26YmGbY5t8YPgGLRIeGcQeV5mZSiSklv6keE3OZHzJZqKFe0topf/VCWHXN?=
 =?us-ascii?Q?QkeJkYpQJ/etGTuTS1/Rdj7Toeg8OrPgQ2UQ/XwRU6WvYuKwCulYAGfZzw/H?=
 =?us-ascii?Q?mh2ETC/nZtX+6QxN+fG9R7XkfpoRy4Xu+0OqsjpJFhW9j3c0gvJg4rFaQcxm?=
 =?us-ascii?Q?SVxSEwpoRUzG8rhlE4hOeHMogkuHoUSmaHXOW7XOyKwbWOfcOnWt5opdIpug?=
 =?us-ascii?Q?Hw7BfJi8CtxHjP0ObW5yJxbQFQtoyoWl30YJ1cIxHZav2dcEv18ykT4k2MVW?=
 =?us-ascii?Q?LNPbw+MdF0OQa0kZdzdSF26SEZbCSUQBjmHqIGiswfGhCulRIpia6JFKLxYr?=
 =?us-ascii?Q?ZGPGak1Q5yj2nF/2Jpio8Gee0JpKvvCgzAv80IM86n+TVUEYwR1z9mEIQE77?=
 =?us-ascii?Q?enaG+Gg87NH3fBkvBhq7SngCRCMDPZV4FpKaLiMyOD0Z6h8U3jqhD3uDuUSK?=
 =?us-ascii?Q?j/c8lyq9KqbkYH/Zr+Tdyz160Um/gBD1H3wcrpm2gjCwU/ZWmCBMfyGe08L1?=
 =?us-ascii?Q?D+7Osqr6rTvzxG3JqdTo1BZ3+AR3n3FFw6+FtMrpfQIZ2/2uGL5I?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 630cb556-0230-424c-25bb-08de630133b7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 08:49:55.2389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gqAMIVFGzR+FeR0Fhbs9LxJK+ljgPDbunPxwrlqOIGFagJXlayJ9+rX5l7lsCYBJ4Xk5TFblOa3xyStkGQdV73WHPQ8CvlsHil+RZ0BfJ73VfXiH0PL05N1rSLZssh56
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11940
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,renesas.com,pengutronix.de,gmail.com,kernel.org,oss.qualcomm.com,glider.be];
	TAGGED_FROM(0.00)[bounces-27794-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	DBL_PROHIBIT(0.00)[0.241.139.240:email];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,qualcomm.com:email,bp.renesas.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Queue-Id: 557CED65E2
X-Rspamd-Action: no action

Hi Rob,

On Thu, Jan 29, 2026 at 12:42:11PM -0600, Rob Herring (Arm) wrote:
> 
> On Thu, 29 Jan 2026 17:52:55 +0100, Tommaso Merciai wrote:
> > Add the '#mux-state-cells' property to support describing the USB VBUS_SEL
> > multiplexer as a mux-controller in the Renesas RZ/V2H(P) USB2PHY binding.
> > 
> > The mux-controller cannot be integrated into the parent USB2PHY node
> > because the VBUS source selector is part of a separate hardware block,
> > not the USB2PHY block itself.
> > 
> > This is required to properly configure USB PHY power selection on
> > RZ/V2H(P) and RZ/G3E SoCs.
> > 
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> > v6->v7:
> >  - No changes
> > 
> > v5->v6:
> >  - Collected KKrzysztof tag
> > 
> > v4->v5:
> >  - No changes
> > 
> > v3->v4:
> >  - Switch back to v2 implementation.
> >  - Improve commit body.
> > 
> > v2->v3:
> >  - Manipulate mux-controller as an internal node.
> >  - Improved commit body.
> > 
> > v1->v2:
> >  - New patch
> > 
> >  .../bindings/reset/renesas,rzv2h-usb2phy-reset.yaml          | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.example.dtb: reset-controller@15830000 (renesas,r9a09g057-usb2phy-reset): $nodename:0: 'reset-controller@15830000' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
> 	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.kernel.org/project/devicetree/patch/af75145b08e24034dcf367932002079363e5dd81.1769704000.git.tommaso.merciai.xr@bp.renesas.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

This series depends on related mux series [0].
Was splitted the series into per subsystem series for easy merging.

[0] https://lore.kernel.org/all/cover.1769703480.git.tommaso.merciai.xr@bp.renesas.com/

Thanks & Regards,
Tommaso


