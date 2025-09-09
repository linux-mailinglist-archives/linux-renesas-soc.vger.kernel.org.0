Return-Path: <linux-renesas-soc+bounces-21679-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCB0B50955
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 01:40:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D072A188C14F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 23:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34C9828B4FE;
	Tue,  9 Sep 2025 23:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="H86A6I9/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010003.outbound.protection.outlook.com [52.101.229.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEAD28935C;
	Tue,  9 Sep 2025 23:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757461202; cv=fail; b=IERWRcoPHq+oQ8+DzllSvIXqCHiLvSjQ2xZauV6UqgTdMEIhE1kzjZ8/PhG9YyZJBoluzJpBBUGowBNaJBtXbbctsX5TmL71Qoi/s11DKrMN1ihuC2ST6pASD6gHHnh3DUC37S0VckN3di6PYObkrLjtV3Zx+5UQKeDy2aCWul8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757461202; c=relaxed/simple;
	bh=waUvmP44/StIEfXFrLwUah34lzGeyjOZ8ys6znE/gLM=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=kpBCKDT6qQpHCXNDOUe+GfSFzmH+Xted6/LTymSWAlzER4jzKt75umFIskl+tbzxAl588y2phdVvqvZwdmly4FhMs+Zs+MzSVEQVtoOJPya8YQOQC4VWJWXDf7RAHcbAosT8RXpnBwESXpXQr306r+ioerJvUOCUqV9cpuWtriE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=H86A6I9/; arc=fail smtp.client-ip=52.101.229.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dr5KyC2cc30t/EhbhAGHAzUph4UjThtYPPKVIl+GgEFOq6QlkExwerWjN4V2lI7+EN/Kz8pP2fXsuPY4YDS6vhyxE/X163o5gqmN1drH5fe8U23c7KHZbaO/j+w/QAZbG4/Esh8+xvp+eFNTjHrAiESm8YoLPcHzcdCX0PMgTphnc+38Izi9sFC+N5nTNziWki5IO8ocpZmkf/qPSj110z1S65drrruHtUelkxbrsdqIx2fLApnGmQXG7o0EztDh10Aw6U/VZwCwg+gYBovjf9Gb9ZBUpcFyCShAdKbQnckzFXuRrgadAm67O5h2NcBmCYdiERdp6r5eKWHkMS+0iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IT+l7g9MBnpdJuVQG6ecGqjT2H7XlG2DY8tUuK3yi4Q=;
 b=GOCS6JRJ1ngC3Ruso9FyRgbXToGUT7/sGjhgxItKuxnPQQAs9DMtM1ywLNWB2HUKNgjsfR3zivdvtrdjGmR8fcA8ozcQjhYB4xS+DD3iGtRRkiTuZn/8f6yx2UMbcm2nZBTv9JT4sRgBuubWU3u/lc8bklIeBtoLCcw2jQap9MTjICXdEF+VgKMr9jBsaHiHA9jKDKOYAqTVqTLpguiXeshIRDruMXwimBdB27SBSFu3SihN2V66ARQ488N3V4NoPGIBKf9Pi39a3sCa5xX3zr1m51ahkKpoIq8htEhU8Ft02e9OgQMx3j7MphESxAcvV/voMsz1/1r1s+xCQWj/9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IT+l7g9MBnpdJuVQG6ecGqjT2H7XlG2DY8tUuK3yi4Q=;
 b=H86A6I9/8i0y0AT0rd1GWYN1RoZQRpkkQVi+CWtjHne46B/6zp0YNmSQi3ulwy2sRs5xbPg/ZcUA7msAEq+b1Kv8JjwN+DFLkpDiODI+hvAPr2Cg6lbFqCx3RIyCNAFcgg938YYDOK6U7dxprUz9V8ZwbLHN35GZjwmHThltrCo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB12045.jpnprd01.prod.outlook.com
 (2603:1096:604:23f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 23:39:57 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 23:39:57 +0000
Message-ID: <87segvw5yr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: renesas: Add R8A78000 Ironhide board code
In-Reply-To: <20250909-witty-successful-toucan-beca41@kuoka>
References: <87tt1c9z7h.wl-kuninori.morimoto.gx@renesas.com>
	<87o6rk9z6c.wl-kuninori.morimoto.gx@renesas.com>
	<20250909-witty-successful-toucan-beca41@kuoka>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 9 Sep 2025 23:39:56 +0000
X-ClientProxiedBy: TYCP286CA0078.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB12045:EE_
X-MS-Office365-Filtering-Correlation-Id: 4721bd8d-f403-4587-f5f4-08ddeffa2f48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xsLekbxsVjusv+PQ9vkiLuocnV+/OwH4KosOc92ZKlBpc2yOTJF/WVGyyRu3?=
 =?us-ascii?Q?vMi9d0++mybxeEIjWSzYb6PCKicjClJ5GNmyQiOD45bRNt66yO4ork/OS43o?=
 =?us-ascii?Q?vpRtdzj51RDcPeAaWwob3JV1AVmBLrU4AbvyV0cRoIIfKLlAn1DokHdG0KvA?=
 =?us-ascii?Q?sdBBt9OVuAVhKOeVfPnOVBRisc2eu6LAJQDgZMHHM4lah9vLEjD5UlpBbRKi?=
 =?us-ascii?Q?tnRJtqZrMRPPqap/G+Czj8yYf9Zg2wAMWnMbh2yvWVZdZXms1AoKI2JXLE3e?=
 =?us-ascii?Q?vYuUQMV1IMY6wKCL/KNZOzl2a1sgPi8OlMFZmyH9qgX4BzHNId1wzN6UC9Td?=
 =?us-ascii?Q?TtGrhxpEjYaVe808gJ4sphVmbp3eDY4oSHasiHB+R46OOYegTYLHIoWSFn9Q?=
 =?us-ascii?Q?6yMe1eVr2YoVgxUWhfySvRoiSJk5To2uqoQx0midZFH0jECn7v2vP/OjakH0?=
 =?us-ascii?Q?72hx+wsld1qVhE6aCwLbPwnvvFf6q3h1xW9V8fO2ysrp/CL/R9pdEXRadYSv?=
 =?us-ascii?Q?dU+9OIzXQW/MVdK4nHA07QI6wyaUtS+y7VIZk7qeJfg3rjwpRuySGtIqb4Xg?=
 =?us-ascii?Q?eXHacwdhLR6OFhQ4bw0b+IrEViw9r2N9MDLCzexZakfVo6O+AXM7x2zUpfvl?=
 =?us-ascii?Q?1ar/D5Y51ZImv+iCtIzSbKNvn5ChMPJckoChZ3N3+xuPf3fvDjvIr+/TOXo5?=
 =?us-ascii?Q?q/2Ph2fb4UsrYsMu8+fL+Y39zHYeC4Y6YJGu58QiODZ8KUzfY4JK6s5g7PJO?=
 =?us-ascii?Q?SBxWXiR58NkMcpVW6HXPjd9pDlcV+fHXQ7wmXZlw0Q/mTtjWNo5Lf7FKYM2l?=
 =?us-ascii?Q?xG3swCqrHytx1q9/EVSQuFdodBcQDPGRigNoAPTG01uannVm986nWZMPNaeH?=
 =?us-ascii?Q?23nbI+KBljoDKE0xVirEkKW34wcxtXQ0K1z1p5TWpkzK2Njl5PyVNjlv6YvE?=
 =?us-ascii?Q?W5yPStG55myWuLK4cBBE0VjF8+74N+8RDaoljE9MEZpWoZlsQqYQkfcRonf7?=
 =?us-ascii?Q?EuUhVTs9YwCZNC221IAdiJNvr67YEyeXjyy3xS4Ea2vHf9E5R/tNwqo1wEkW?=
 =?us-ascii?Q?6Q36/yPaJqJ0A/Pcc/xqXs79jVdqRIBSCgZafTLxiw25hH5aVA4+KSRMnf5O?=
 =?us-ascii?Q?bLDgzJURsWfU/bC/qy5kRH2QNixsLk4+ja8Mh5JjsKHs7hRIjEMHjnDNPW72?=
 =?us-ascii?Q?IKWAUMPXp9ok4Mb1WDzFEd3v0t4Ro9utmnZxeRFCiJHS5Bx5Z+8lJ383YABP?=
 =?us-ascii?Q?HsayayiBjWAq7SwbBeHNIpbwSU/Zlf9tSCi/I+tVLBENh3L0Kc1Zdkla5dtu?=
 =?us-ascii?Q?WR2z6iu2OIK3RqRMyhLs36xZgbudBgZZ8UlnVZeC8vGtf9/trniAi6zay26l?=
 =?us-ascii?Q?oDbd0mdc25WgWIZDyp17FTb+fCn/ml/8t1jCEJxPsMLm8A6+1bkYOXjaIXGL?=
 =?us-ascii?Q?UT7Ehd1Y2wP5R5rP9uPbxrHyVz+xDN52q9ewvcs13zMFr1JSkwWbstpOowhv?=
 =?us-ascii?Q?bFNrAIXGe+Ga5JA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KgnliyfniyTbttuUSY5ypmOR9RLW9tWMguDOo+Y6NxvoVJstHUYXoRBrxNMB?=
 =?us-ascii?Q?wis4Rs6X7pGmc34uGqiYCU4pkR9QrLlMg3IEqlaIC1yMjvmbnJKBxhy1Er2e?=
 =?us-ascii?Q?WNM3mM8NK7rkN6jbwRLTa5LlSAQYqct5bJyJSgvEYp/1CjpIxq5/xjfdwvqS?=
 =?us-ascii?Q?+yVlUC9euQrzP16RW8fkuRP8wRmiuRfSiyZR35m/aCXDyiauEQFaDKJlelh+?=
 =?us-ascii?Q?X++5c1wCU6TWOBnRUzEGkBgPECzfIb8hTG2o6TvO55CBffPrTDsaO+Zodrva?=
 =?us-ascii?Q?k3ugCC52f+U0Zyksnzn2L2vlN9iM+rvyDhI/oBXeLqEqs33GAbi+BVSTNTh/?=
 =?us-ascii?Q?sz7Alh1/f90GtWEXiNtb5c7PiSXEilxgin+6Mlj+PIt3qKTiVOOb4EL8+oWT?=
 =?us-ascii?Q?1fW6kZh0q8y25o6BiGu4Arg/5UlyRfVR6k6DoOiVOdlesB9IlInpbdLApB73?=
 =?us-ascii?Q?+egZqir92XfuVOhHb/Hr8bxKOWa8wFmBJnsiU02AmSUjT6kNN5HvoDE4UGkW?=
 =?us-ascii?Q?kfcKrFis//3h29NAvMKQZFovWTpjJ5Kim1ltCYf0pDrY4F8eCkiL9jDYbBKh?=
 =?us-ascii?Q?PC+P9lMnBo8t1it8Jr8NQ9YqTPUOVG0vKiprbqFEH1JsSAWcxve1OVc7L4pP?=
 =?us-ascii?Q?TiZv/Nip3xQfotSYpZ2CPqM8FhgS6+N+SWgu9xt2zNQa1rXeWD9vGEIz/URO?=
 =?us-ascii?Q?gSYKnWBjyXcpQ15ktjU7lMzHtGf0sbZrr/kBgAN5djgam7WaeFVVKG++9snQ?=
 =?us-ascii?Q?AAnskSB/D04jcXFTpwYk3aVRAc9gNsvzdGza1fXsog3CaBAGlz8oFbYjMZf8?=
 =?us-ascii?Q?usPiQNImfWgMKpWLn/T9VpcvzZgRFqhft69PkC5iE7AH6iy23p8Z+jYNZbMb?=
 =?us-ascii?Q?m0kItvxRWfFusJD/3PrtSGZpiS2d8Jqxwn2ZfJ9X3N+8dZR3UzQnqPk+u7eS?=
 =?us-ascii?Q?TDDNqDvoYBjd/y4rkb/jkkwbJB4va1bCV4kE5bVucMilxALN00vl1/dL/iYN?=
 =?us-ascii?Q?DvRdDC+odZbjfgbqk9i00GZceN89rCMJtzlYMJ8xbM904DZ+VXeMrTh2zKap?=
 =?us-ascii?Q?ODl6PicL/NnmDnjKwoJuLMM+ZMQeYPI8HwBdP3mVmPLIb6cHGqMcQm79JqCO?=
 =?us-ascii?Q?pv+REu2H6NaFaoCcQdG+urIY6FCukVqMTE+miD/sUTdN/8McZ7+kt6T/qmwY?=
 =?us-ascii?Q?z+Jlg4LDWbIT62khJ0m4Nmfz/ZePiysGMDfiDN+nkHp9ZSuPuTR9tiYC47VM?=
 =?us-ascii?Q?qlZZV/j4z1xvW88TVZZLQ7lqXOqf8snuQfPHHkETzPWwMT8VKzwvla/qYBvT?=
 =?us-ascii?Q?hdpAZOBs7zgOvvjeuqmVD3fqeGGhDr3qDsGXoZIT3ZOjBD7ctjFuTc8Xtbd2?=
 =?us-ascii?Q?byCKmO1bGhLZq5IqSyLINAlHiS4ciDJq/yFugiIGYBGS14wvKum74Ispm7AV?=
 =?us-ascii?Q?LCgRgRjEhcOQjaxXJRCgcoMBy+59p76NPGMZWtzKpIJQEtf9pNX2IswzviKf?=
 =?us-ascii?Q?bkeUW6jDUDPnJqBtyq9ZWovlSQQjaKhrSgS1TvvYiwPPE3Hysbq1zAUIoT2I?=
 =?us-ascii?Q?7faQBNHmNVf73ex0+28jNVK5BvPI9zB88YKjDIS285CeXAMRHYbtsPJEcdiQ?=
 =?us-ascii?Q?T1ohsfJ5KOS+kCv5Uc9d3rw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4721bd8d-f403-4587-f5f4-08ddeffa2f48
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 23:39:57.2332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MwL6GCbyrc/m90JiPP2Coqdp9bjWK7chiEbsoIZG+/HrtcrUfMQDZ16tuZL2XCS4sGw7PRGIehZaABxJOKRtIGbnyDPwRwtdOEf+3j3oc2d/DoYX+NZSgZPLsI1fCJI8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB12045


Hi Krzysztof

> > +	chosen {
> > +		bootargs = "ignore_loglevel rw maxcpus=1";
> 
> Drop bootargs. Not suitable for mainline. I really do not understand why
> all users in mainline and other projects (not your development) must be
> limited to cpus=1.

This is initial patch, and only 1 CPU is available for now.
The limitaion will be removed in the future, but not yet for now.

Thank you for your help !!

Best regards
---
Kuninori Morimoto

