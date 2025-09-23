Return-Path: <linux-renesas-soc+bounces-22250-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8EAB97D51
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 01:56:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 311C519C6765
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 23:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 113DF2FB61F;
	Tue, 23 Sep 2025 23:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="j5G4SccF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011057.outbound.protection.outlook.com [40.107.74.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B51923E334;
	Tue, 23 Sep 2025 23:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758671796; cv=fail; b=Vrkn5Gmhb7WOCKe3P//CWwAaMgsey/IzJW8bcim9h0oDFRpXYKn4IaFdzulqUzSGRCOZEWknbBizzre+nVITSRKkobecRrHGyUTGH/QPUbdig2J57rGhI2QcSDTaFYBQWhKbFdQGT4AiT50Ix5X8GgzWIMr5DDANOTb+wf8CtCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758671796; c=relaxed/simple;
	bh=0tlWtBzx1rQnuj6R/zVJd6bA74Jhmi841SX4y8e1rbg=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=jNiYCW/ArZo3jeYJ/FoKQhM6izPSVy5DTFembyTivi/fFC9DNYUm1Nj7ycRriPj6J9DpMmcGYGFGagxseRKEEO/XE3Rhp1I69+JuYl17q43FPZTdV3wt5iUKS/UAZTjgBez3jujEiNkbrIJhTIJvMiCDIAeHaoQNdAbl4ufLBTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=j5G4SccF; arc=fail smtp.client-ip=40.107.74.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G76uTw+eVP2U6pcCYrIGOgRFAq0XAOmzuUriHL7Zga2RKq0ZyrzhL0ZcKAxq+XceQ+0wMOzcGJF/+7ZiSfSCTcm48w18+TrhWAhWAdUY9HBtuaoDhSNI23ImO1BERWt+dxiipvqtmCmR3w3qT9/HLkgJ7Ok2HHCzpHXj08NQtKxoOQ0a43QzH6b3lu+Ql8I7gJ3iawleEkY823qSRpLNGhYrqY5sEHVWi8LwLwX0P4qF4Ef12/qY0JNPi/L2hydqhwvCPcSJ/McM9Z7unEzuIKlEWGQCFDfQdHMSSh5cwdUilrdrTxNPbeDh9XcunPJrxCKJIMUaBYuMFch1JAf6RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Pte/u4jBlNf99BS28HsUmpaPxLUZQ6hUf3TrgVIDWI=;
 b=C8JqqOmK5lZ2x95x0Cl9w+tvPqYzxeqzUP/nG+RgDLO1Mmg9bS/YSK2HDgVlY8GlXwA5t92qn6sVYU647F12zHfJl9llakVag85KAxc2FkfGB51ayNScdIaJV2ie3lBelXWi518Kz/iiz6gA8KWau7O0byrmckILLH2RsTJyorFYyi3ff1TIx8/OuyX5R//xz1d4r5GiPVsCJiy/hum2VRSWXjB0iFYc4vQAEIrn24esYcMK1Fl4fEgGo7XCA5tyYaDtMB8CFKagmR2a39cdruKo9zhGcNd+wj+gvcMsXz32E61/YyT/8x56Drk1HR6YlAjFCEJcsXCky8418XQZxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Pte/u4jBlNf99BS28HsUmpaPxLUZQ6hUf3TrgVIDWI=;
 b=j5G4SccFxMzY6hmTR4KO+NBlT7Ftmt+Esf+vmbLtDyNza+8BUTYWxdwGqHNhgtNWCgYyO/kM7zRz/ObpuZTEGCUoETff8XmaxfM1SfuiGNkt0P9bafZkpYalGn/syFxr1zcksNvdG0Gv1iN0+c40sBfH5P7zKsyqQDYFnWw/0z0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB8183.jpnprd01.prod.outlook.com
 (2603:1096:400:fe::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 23:56:29 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 23:56:29 +0000
Message-ID: <87plbgafkj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ian Rogers <irogers@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@linaro.org>,
	Jiri Olsa <jolsa@kernel.org>,
	John Garry <john.g.garry@oracle.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Leo Yan <leo.yan@linux.dev>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Rob Herring <robh@kernel.org>,
	Will Deacon <will@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 6/7] arm64: dts: renesas: Add R8A78000 X5H DTs
In-Reply-To: <877bxuzvs6.wl-maz@kernel.org>
References: <87ms6snut0.wl-kuninori.morimoto.gx@renesas.com>
	<87ecs4nult.wl-kuninori.morimoto.gx@renesas.com>
	<86ikhg13m1.wl-maz@kernel.org>
	<CAMuHMdVezqWxbFp9dd0WPJnNM+MvmQ9F0UA2Ru_BSV6-6VgOyA@mail.gmail.com>
	<877bxuzvs6.wl-maz@kernel.org>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 23 Sep 2025 23:56:28 +0000
X-ClientProxiedBy: TYCP286CA0151.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB8183:EE_
X-MS-Office365-Filtering-Correlation-Id: ee8174b1-118d-43dd-84da-08ddfafcd047
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oXUFSbRSocZFpsCKkOZLVaYf3LR7iopWUgNUM/CIRbN+bYQM08eA5eHTPlzg?=
 =?us-ascii?Q?wIz0KLlxBrQIetDD0R8oypGHLhqxqbNT0ul+XvwHz6pUs/F4TT6YE247WTLR?=
 =?us-ascii?Q?ysHK+HzNNY0sjwTehwmqHM29W8L4v7efL6TYjyOoaxJD8FmdBs1x0BE6/iJO?=
 =?us-ascii?Q?e+4TJBMkytx+DZTEdGdj8lhPGRv1JC0JZ4StWhj7Dpq+oJfVHV90L2bUB1yR?=
 =?us-ascii?Q?sLinBnydlgbfFSoyaHN2VGXqt57lUWRR0j08H4hO7LSGZp5tk78LY9+tWAai?=
 =?us-ascii?Q?PKK66xdkMTSRHIZTT97UPQjDShB9VfuNvrpE/vnRKAnxaF07R9vZBqSYJauO?=
 =?us-ascii?Q?qT49oKINdnREM88ej9929fz0EPpl0RyWsRzTwcK1qg+LmctdCp/sw/FZ8BOy?=
 =?us-ascii?Q?NBskZCo6u3vSZKUOHK+DRU604Ka6jRyC/op28Hu4p6yL9LKwljPzxgB23Ggq?=
 =?us-ascii?Q?Nr/xO+QMAZMJiObxB8FtAWnkZQxKTrskrw3WcXSquOoq+RrSExDW8xe2EIkZ?=
 =?us-ascii?Q?BKqosYy9h3YH3YDVyYcNVG7J2Pqx5r1XGvMVU7F6u/G3KzamNABKSybwmxVi?=
 =?us-ascii?Q?kScxv38GX3lyfc0W2jXfcW5HIUposzeLup3qIQbdSuqWLmXqYSvzGrRsUT6E?=
 =?us-ascii?Q?Tu2gHrq7UBHreoJtvekRF8wQ2aS4lt0RImbX5szNKCnmBjt0LRAMOMOCAe/m?=
 =?us-ascii?Q?mLw7QuDl4ANN4UUfnMVONlEXKC+x+cuKzvGfgcBlDasRHMea5EI/NdtydssZ?=
 =?us-ascii?Q?d+qX0+3C17xFJn2zNjin3xs780bywri8M8lG+OVAjQbLgnrBKCTFOgGLWSii?=
 =?us-ascii?Q?OvOLRO3jakxHrIR2muFFlz/CYDgZkVw9Mn+rirr64XKQbIq6YOOb32Iz8nI9?=
 =?us-ascii?Q?o8PQ9s9uz9UiEl4HtMLL+EC0PaKB4CyleVnsUqp2NE4PtoUkekEZ3hXtzu/1?=
 =?us-ascii?Q?tQFuq7uYb53MZ6BLAFuDBfpLG7sL3Xp+0aeBqvRQ5VYrlT2n4Eex4gt2ghSM?=
 =?us-ascii?Q?7VMBXbbQjoqktMItNsZcO0oqJWEw2lGwX5DckKmP8T6ii7LkErJqnluxvQe5?=
 =?us-ascii?Q?D8Pxn0sfrbAf+Ft8FEbsydwEIIA4OxU+B9NsdLbD2wyzM8YQb//sa2e+aGgL?=
 =?us-ascii?Q?szlzWbWMCOwqUnlDjz2O+DuqHjMASXAtT4ZAjbZvw6MEz81oiYZg+YY3F64V?=
 =?us-ascii?Q?NkSHPzDWrTfBgjXP4OLkRCNKZ5MxQdSuu04Vx0Q5LtZmxl0PVVl9NdVq9Pe1?=
 =?us-ascii?Q?olPi47PAgUvWctkPDXlSN3vIuuCzIiXBf8+wIeqZq0mFeNQskNYhv+utrmN/?=
 =?us-ascii?Q?LWklJsywNIzEuwNfijrUzTXbyMCBqRQXNXrTpPlNC/LbIMLl9uR/9Ns+6/k3?=
 =?us-ascii?Q?T5EV7/YUFNBbIeuNl+hrIGPOcB/gZpInHs8jx81cIZRP64KhMwaWLbdxJDvB?=
 =?us-ascii?Q?7Qih27Y4vPEDBkJpvB3XGBAzJbNNfn+ap2X+3OFjPi4tmQ5ljeApolzGyt6D?=
 =?us-ascii?Q?LPdzYrRzl49RgBY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eXLJPoGE+YomcmT2waRrEkcx/RqCkKUKZiKZQtDO23y31DD/ht13l43Si53p?=
 =?us-ascii?Q?eT0FfJ6EiCAp9uPTHpOqD3wbI71Zk9siD6dIIaS4gs3o+CvIHR/Fj6qTvcg/?=
 =?us-ascii?Q?xf3G6tIQbdgivf7cXJ7prRPqufaAPxiQguVFiTQtRy1+jiVxNRnDNR31yx+d?=
 =?us-ascii?Q?5tqbbkOCEcSZ6GqfpoLYjB2GSJmkPz6t4jXKJ0bsJjI8mU/BYenqSpQYYx98?=
 =?us-ascii?Q?qQjo46VclszJAMCUsmRED7VrZOUx+oQJvTbKTGA1SqSPyR/4qxlpiH2kgAk1?=
 =?us-ascii?Q?PaHABUdMNkj1L22luhFm4Wny9WOCZcC6Zb4842v6rI+ZV9JazUq8aWsxxSli?=
 =?us-ascii?Q?HTho+fxqqYXT+RGOTRNFzUMn85v3h1GKhy4CZpmXtKBTiO0BasZjHNRekHbO?=
 =?us-ascii?Q?EKWKOp6wUIZEmZOpfjyuHDT6tm/knjTrlDqBKUV733JXHX8D1XrEJ35O2GSJ?=
 =?us-ascii?Q?+C5iEoKQ6KwhRZocN3qdnD673bmVlCFG5MUNb01EZVCShMTu+DffKdVeemBR?=
 =?us-ascii?Q?rteblFdRLPAfNltSipRe57TuMQ+O4a4Fm0DsCSbdOV7cX/xWTSnAtOLNERvy?=
 =?us-ascii?Q?z28WG81w5FOoOteW7eDdLYIBpiuxSyaVt9cV/y1MYpC9sERbTdTnZmUK+HM2?=
 =?us-ascii?Q?s2IEV4hQJpnFgnKPUqgljrBcYZYfTtVSSt+fpEQXdmxvJ/toQK7WzEVBEIF2?=
 =?us-ascii?Q?WhIlcr+8z1nPId7g+I9AxPXSR4zZmpIbHMjbIPQpnAMwAbQmVo1MJLUruoCt?=
 =?us-ascii?Q?HTUDvcmU9fHlTk2HGoneAy6CswNAj6Wv+ZQrZjIrwX4wYgYuUSRbsAQY3+GX?=
 =?us-ascii?Q?LNzGB/MRPwsGxO/dqEoB/gi+wVBkM+/f4apsfQKZ8/lhGE+ftXKmTjr95WRS?=
 =?us-ascii?Q?1pEID+LU7zRylh0k7be9p/9oGpenduZuKdQsQaMjJ7RRynPj3rf2iZj6bKjf?=
 =?us-ascii?Q?mMEOprUVEcHceRRvrRNYZ4HlDQmEDUhHPDi9zBTCfqSsqSvk+qvS/UinQ11n?=
 =?us-ascii?Q?oB9nt7/RyjH2eRvpvk1uEQlL4tQpZrWq9Eh5QhaoJVhAvlaVXP52tT9RyMDv?=
 =?us-ascii?Q?YF3sRtEQmMDR7b+Zu2o13DAnKRnGrrWhwAqptZVolRTl+74zgeQmp4W2mTs/?=
 =?us-ascii?Q?KOhMq2vVYZiR/nEzh/yUz/Xpia5B2tDgYRh0DJVE91NsRE1SNpLLT2+p+w0k?=
 =?us-ascii?Q?9FFdX6UHigbGOeon9iE9DuFtv2CF3gBllQftdcVAP8sJRAWmHahl0QvZ4aSJ?=
 =?us-ascii?Q?haHN0JwuhuAd0PqGw/GIXrRizpw1dnhcSal+JkWl7TCmgtR6Kg340HDErBgQ?=
 =?us-ascii?Q?94CP4bHHNtzmNdB7Mgkqe4T3cTPITsKxSNKrluazgjF1xlZOF5vbmepxYzO4?=
 =?us-ascii?Q?tYnmjB0bR4UnTePaOUjM3SM/Flvgn1srDbuvO1HMfNrQK3kjBO0pagGQcxDc?=
 =?us-ascii?Q?2FFO8CfEJJRQvi+QJgz7yuoHReyVqoZFeGyDwNJr25WEjPAn2GiTZ0V9yP5R?=
 =?us-ascii?Q?2VFVCLs6lepxm7VCqr2gxA/Zvn2RWzWdpenNpnXC9GUvOO87VgZ0BEVLSizR?=
 =?us-ascii?Q?fwpJS+/Gin/mFNPt4F3DUdsHAqQlbPrS1WkGZuNL6hnwtl936fSTQIjoGfsI?=
 =?us-ascii?Q?LNfxvkFplJXdzO4kQdWLE2U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee8174b1-118d-43dd-84da-08ddfafcd047
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 23:56:29.2567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8uMFJozWMAMPsvN2xBKxUZaBL4qKn1YWiMdPQeeLX5QIjnyi5+tw02kmwcu+pZMdN5TQEZUoAYOSjoVu0sf7iwA41Z8D0Cxu4KaIpqRuvHB4Ho70lVGfHsJ5D1M3JM07
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8183


Hi Marc

# sorry for late response. I had took day-off

> > > > +             /*
> > > > +              * The ARM GIC-720AE - View 1
> > > > +              *
> > > > +              * see
> > > > +              *      r19uh0244ej0052-r-carx5h.pdf
> > > > +              *      - attachments: 002_R-CarX5H_Address_Map_r0p51.xlsx
> > > > +              *       - sheet [RT]
> > > > +              *        - line 619
> > > > +              */
(snip)
> Something like:
> 
> 	/* Application Processors manage View-1 of a GIC-720AE */
> 
> and the mention of the TRM and other spreadsheets dropped.

OK, will do

> the ITS to be described. The HW has it, it has no dependency on
> anything else, so there is no reason to omit it.

I had asked HW team and PCI team, and there is a valid reason
why we would like to skip it. Because we had issues with using ITS on
previous SoCs. Hence we are reluctant to describe it until we can
actually test it.

So far, we never submitted a complete .dtsi in one go, but always enabled
more functionality in incremental steps, after verifying that it actually
works.

Thank you for your help !!

Best regards
---
Kuninori Morimoto

