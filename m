Return-Path: <linux-renesas-soc+bounces-21790-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE3EB53F86
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 02:39:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 745B368421C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 00:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D232B4C6E;
	Fri, 12 Sep 2025 00:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nWZjF2zl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2073.outbound.protection.outlook.com [40.107.113.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A24381749;
	Fri, 12 Sep 2025 00:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757637578; cv=fail; b=Svg6a7xiXoYZeUGCXORzIkU7hwapPojhcURcinMoq7IoSosXxFwaVu0R+asgSXzohAxi7fxXogqLvwkfLbk+HlA9AEok6L2yrmF5vikomEoiW/kw1TaAUDrNtzhCp0fAi3HPaUXeC1v7uqeZ/Uc+6tuI9o2L6vQ9Aqj+5Z6HCHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757637578; c=relaxed/simple;
	bh=FiXDEV4MX9UCiPDvJ/87YUf/rSD58eh6YpehMRxaQYY=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=MCkIvfZLGr+A0OF3ebJ5exacQ7HNQdrRAHXfIk9RHpaJsfas1PuprWtJXuCfFic34ME4A+gMvpSP2XyylL1fxRCrU1vQYAjBMjBCliXPUnEN4RZc6XXo1bev8TVk7zZyHFcbd06q1n09hxbNTa/385efOyXr7uuPh1nuyWsiSmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nWZjF2zl; arc=fail smtp.client-ip=40.107.113.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MWatuK7QW7DXN6wBl2wyd3yUgUluKe1+BP1AYLhiqTRovI+WoS6v8qnDnTwyBG2vZArEIGTRBp8iHWSrWpIBYiOqpKQQEvEjZNiZr2w7KzHjJhPQXW3FkRGhI1Wo4z4+A0G94B0EacsbrBTUERyILjKdDq3OtxW8PMpOzDq6TeV6oddTerD5iLR0mI4hTFOPRn256XnZQl4w+TryumsmWiE4gSbctpMcX2ZWD9lahIbNU34nusRjy77o5tQ8wz4vQAWtzXDgCUFyag7/h/X6QSTzBd0l2FghZWGPmuCgJnTVvGhPv3AgZJEsisqpr76ELbPe0ZX2elKSxlyqBbPRrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JM6pdDOydXiY9CBlbiBCWmD+cYAbKB1I28vnv3Gx1ic=;
 b=nh2Quy8iVdY0YC+/9PGHhMsw8E+Z6PH8yYEo+6pEvNGNN4Jsh6V7IWMjY1ht0MIufPzDf+pjCwwQQ6xQC+f9G/NKeyBUMXC4ztGB0JZO+IGXDrcGd8YBnDuvBfexw+g4b1svih6SEH1UJ6n0R7UA+M/OLryJYB4gDDpZLq5KzmPyKI2B+tzqt7QXzOWqmZV7DdYTuXfpZsi6aqfb6e+Z53ix71C06isyNRweNiJtJ5XCxUoXjRfO2xsg5+ZANbMak4j2YtBDXEO81TeaQARPOTqxcNSkrazLDArRakubtQVp4tBHgcW+NOaPvtLbxzhLrAL1iTd/PReSxErEjqzMkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JM6pdDOydXiY9CBlbiBCWmD+cYAbKB1I28vnv3Gx1ic=;
 b=nWZjF2zl6LYFS9PfNgibct0kuW9LpyAF2QuPJrWzeGqbmwB4EulzYOu7VR7GUSzvgReXxAA0TPTa1wk9nHBoq4sG/etrhvdLjBDDQzT83p5BJpSJz7wHbup65WwIkOrPpozKUDO1ySfg8/tqsy3cKFOCje4wkUb3Ba1OEANzuxk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB10216.jpnprd01.prod.outlook.com
 (2603:1096:604:1e5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 00:39:32 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 00:39:32 +0000
Message-ID: <87jz24fqrg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: renesas: Add R8A78000 X5H DTs
In-Reply-To: <CAMuHMdVVV5tY_iwb=Xn6XVY-Ai6spBY70yXhc5VRxwDva8BGng@mail.gmail.com>
References: <87o6rjvzf4.wl-kuninori.morimoto.gx@renesas.com>	<87jz27vzec.wl-kuninori.morimoto.gx@renesas.com>	<CAMuHMdVVV5tY_iwb=Xn6XVY-Ai6spBY70yXhc5VRxwDva8BGng@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 12 Sep 2025 00:39:32 +0000
X-ClientProxiedBy: TYCP286CA0196.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB10216:EE_
X-MS-Office365-Filtering-Correlation-Id: b968d79a-891c-47c6-9b93-08ddf194d6fb
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rkji53jiATHPsZHRz8CreF5phCRNU31N1LOwQfWy3yfv4072FLw4vqp10OvQ?=
 =?us-ascii?Q?KJxmxO6zo41BDCwQWuHoaazhG04ZnFsq4IMyEb94D80i8DtYvPIeer/TF2zR?=
 =?us-ascii?Q?pI8SROQfX0rYTTy2AnKoKtCFqdFqW1kjx/iSgiAwmwHBFrhdJ2gmdO9ThQ/O?=
 =?us-ascii?Q?mmY8ebZt+3aKcU7RFP31bTdUrodnOB8Jq04meQFtXXZh5fRw7uymPufP5FW9?=
 =?us-ascii?Q?LbRmkCa5sFgMZ7CrxEXZGW6Fsr4wpB7QCnJPQcV6RM4kzMaLwvcaXyA/av+C?=
 =?us-ascii?Q?8Pi3jhk7paeA5d7tHpQhM8VF9XnlV6cW9Vq1wzUpqW0LYL9Md7k483duPNXp?=
 =?us-ascii?Q?xgeysckOw3u2pitC6ZKhPc8iqhADhHo8znELyVRqTO5fcfSY7mgRAUEC+AQP?=
 =?us-ascii?Q?ba5WlZ0VVGbIrKDvEPIEVsoqIiWIGIoH6zepez9UAOb2K3OWrEjGmQKrXaHv?=
 =?us-ascii?Q?1m4/Qmvp3xRhCYBeWCpYn4odzV7UjXUUStNlPt+ts4k/Mt73tBHTlJVe1zTk?=
 =?us-ascii?Q?80+i3UvrtCmBOHRlOZqNQdc1Rz3LtCfljYGenEGF1q+z3f3/oldhpNFr1PX7?=
 =?us-ascii?Q?YOkm0BwXGhu/2e0p9bw4N/oN1UI6B+8dVMK8HoXh3X2ypEfXHkcIaWXqyKx1?=
 =?us-ascii?Q?dh/U6ByD7Am58FWrXUhQFlIBG7Sdo5ug8sJ4I68FH81s7i/sNUCoDYSJcL3o?=
 =?us-ascii?Q?c5NHj2f8c0NoiDTxK/iKzjD/XqH46WJx0wxMbJ2ZwIvqaTk1f6R7Yp6cyXpD?=
 =?us-ascii?Q?NMDr4HaiOzLFg6GxvtNP0UKmfatfZBY6dCA9r5ju20D7K3NWcF+wKKYcL4SL?=
 =?us-ascii?Q?vV8jXmlptO3/ue0Fa3eU4ecwSDnFMoro3wbV0qPFlcqKS2SKhdgyZyYPyEZy?=
 =?us-ascii?Q?GhXqNHX4D9BI1WT38CxuPwmLqoi2y2tRNl9SFfmaxXmWqc6Y1fLVs35jPtZc?=
 =?us-ascii?Q?HJeMr7UWvtjYqj5xtmRyJhEuozGzeTKhtfi4HpCKFPe0+LjhO3ybi8F32tW1?=
 =?us-ascii?Q?vDeAa9pUwnHFc/SDEiV9MiwAGDthC5fMUygZWQfjyyR4bGEdj4BgS9qgDX/1?=
 =?us-ascii?Q?VZwY53Hv9bbHKQ1R0/QgR1qaOauq6/laAaE8U3++jTWzFrydU2/d+NB+guut?=
 =?us-ascii?Q?ueqiExcuP/ignqw4SOMVwkMnjcMiaABJVQkpuXCn6SUY9Ngnid7cBMerCwnR?=
 =?us-ascii?Q?DIKPzr9y2eotUGB2m36VsilCgyBiONjY80FrMJzZKQdOLc7DT1dMWNxbQ8N5?=
 =?us-ascii?Q?mSlHXJt64pO4mzxhjOSG7kT0g3SBorH7OXLq7QCGCuKDGRUXwtTPCc4o//7p?=
 =?us-ascii?Q?04K+k13Nb7DzmtH6Bb4etlTTM4fDf6DavLRwk8N3+k0hFoLg7lrnsRkcDsmM?=
 =?us-ascii?Q?5L2sEDAKkosQCyoE9UgyXkzDnF/MuQcCJD812q9SxhPM/HpqfQ105SnWu6uW?=
 =?us-ascii?Q?6+Lj32TGiVAl6poYgKjIXt7WEbOD+Uzpi6uGC5j4ymjEKm/LTJabRw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I+p2F0639ZUaekC62fNnRrhKWBfRTsk5IgF+7DjZaeG1BOPbO2Qyqgy2M3eJ?=
 =?us-ascii?Q?LphF8YzQQ/o3VoZ4FCbnoaZSeAVIB/2THMBJY8B8uyggQOVUr+LCluMYoEsO?=
 =?us-ascii?Q?bzCwayK8Z+APhSsAy6WoQpZmmIgh3Ot8l2vpBTIRRqsTro9i0qT3vKuXRlV5?=
 =?us-ascii?Q?maGUoUpm24yUFfyPzWscCvZqSmFmLhPzPT+L0X1Ry37D9G4XxRloqqQcBzMq?=
 =?us-ascii?Q?JtZucF4FU4kVWrMETvhLsmpywxuMBJTim+VBGtfxax+1iAl9PDUN/y3WM5lm?=
 =?us-ascii?Q?pYJo5AobMt+ag9KrJPRw9iK1Gn45eEk15Xi3CqawmGr8Y9maB3aA729zw7ea?=
 =?us-ascii?Q?4N1PeQWq/HFb0DxJQmdYlKhkS5uZ/BEGU2pZItcOWXxyoak+44aLBuDnHfzy?=
 =?us-ascii?Q?g+0k+Qgd+RqBqSenikZMRIJKGneIOp8qtaIZzprS6HQf+DVf3Rb9MPjAi551?=
 =?us-ascii?Q?Dux3u4JG7Ll4xxmnheAzg/joBNT2nPFz7jaBGDkqtGVc4U/wXftlDLAgjBUN?=
 =?us-ascii?Q?J5vhDwDWdkAy7/tQq9e0PT8ucbjsWPQwhptNk9PUnsp2dmR6cTdyCMX/kQRx?=
 =?us-ascii?Q?armZUuRp0Qw56sahPJ2vwIeVRQsalobH+Cs/RI03v/IWn2NOL0Wi4qIugrcA?=
 =?us-ascii?Q?3krXoUmkGbABABlvJSvXMUJcr6OZrC8YNHrQf5p/CdPhZx1KwDV39L8OqXiV?=
 =?us-ascii?Q?1W6easdTjGrsS3l4t8HqIFVRZ+5n290zFCcWvlJPPP5YNn0aaH7xQUl6UcAN?=
 =?us-ascii?Q?Q2VVSh+IqCQdybn+eDFqGtFa7Nr1x7IY7UrNpCGulJPZK3bg45i9XvfmRUlN?=
 =?us-ascii?Q?ownfRTmLEGBYJTBzOjrms6mqZ0x/CngNVTYC/YkCuZ73dkxsZl8B0Ylm3nKe?=
 =?us-ascii?Q?Ow79uW6HYVykL6zPcT2eX6+l9rZYR5mHIYa5YEHcZ6ClWxt4JoozNUy/Md+C?=
 =?us-ascii?Q?0HhPuwQnfYgYAJVgqdcGd/GhBLWCIwb3W+Fbz31VKOtjs2p1yWIOZ73njhII?=
 =?us-ascii?Q?+rOvWz07UjUhGaYP97VbJ1i1YbA3yMcdGNAngISvJdzAb/dO/ncB3TKxdzEU?=
 =?us-ascii?Q?Unxz6eKeydKyyKPBigDXV8EDh/3q2FIAVXoFywRyqFDetdkBL6Pe+yJD6dtX?=
 =?us-ascii?Q?7RXKQR/N//bOnV/FExiIHZA70IgNM0pVk6JFTClUXivxtd1nYJkv7pAnkego?=
 =?us-ascii?Q?76XLYf9IdZWpyVyMXd/18cuttf93HJfNIBHVCB9NtJJzNIW17ksBG7qDZRMK?=
 =?us-ascii?Q?YRkGlO5RxrZcQGomsc3rtKaO5tO7ynYEB6YIgvBjHHCK+7QNvP08GxpXuCfq?=
 =?us-ascii?Q?1Otr2Um6mvgCdF/QhCmUqsaHbuGJPDovo14Fy8V3wF5N0a7FMXC+m04UH8CQ?=
 =?us-ascii?Q?avHabBuT4qCjKQZFCLqCtpYTSd3O+9iFKJQXVfYgDvlQKPmKPsW/ID54BeY4?=
 =?us-ascii?Q?rWadSWcW8QePeWNCyIXvffRuT+o7F0skR4i7sXQUKDevQan5Xv7VaxMuywgL?=
 =?us-ascii?Q?rFKxX6viEWV1REsqmzlVqMiDjSU3jVetpBrMkofcfq4Nq/sfMQEtgotfFONg?=
 =?us-ascii?Q?0SZHTdrdozde6Ud+eYNZpxA1Swx7KW3SuqsnjQ91AXitKQw9ZZqNvKL/UFok?=
 =?us-ascii?Q?77+eSEyzbJmaJVLvf9gmK7c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b968d79a-891c-47c6-9b93-08ddf194d6fb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 00:39:32.2478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AGEVN72SHKt9RWnj7esE578mtfNwxNaw+n5p2vmD9bO+2xJU/gHlDw5k2EmZ8UzBY6khBkU5whnL4BRG8OeUaXv6TalkOK74GvL0bt9S4/lI+UTkfxCs4bCihFBkS0S8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10216


Hi Geert

Thank you for your review

> > +               a720_0: cpu@0 {
> > +                       compatible = "arm,cortex-a720";
> 
> "arm,cortex-a720ae"?

OK, will add a720ae support. But I'm not 100% familiar with ARM Cortex,
I assumes A720AE feature itself is same as A720.

> > +                       reg = <0x0 0x0>;
> > +                       device_type = "cpu";
> > +                       next-level-cache = <&L1_CA720_0>;
> > +                       enable-method = "psci";
> 
> Please drop this line, as there is no psci node yet.

OK, will remove

> > +
> > +                       L1_CA720_0: controller-0 {
> 
> cache-controller (lots of places).

Oops, cpu0 part lost "cache-". Will add

> > +                               compatible = "cache";
> > +                               cache-unified;
> 
> The L1 cache is not unified, according to the documentation?
> 
> > +                               cache-level = <1>;
> 
> dtschema/schemas/cache-controller.yaml says valid values are 2..32,
> so I think you just have to ignore the L1 cache.
> I.e. drop it from DTS, and let the CPU's next-level-cache point to
> the L2 cache.

Thanks. Will fix

> > +                       L2_CA720_0: controller-1 {
> > +                               compatible = "cache";
> > +                               cache-unified;
> > +                               cache-level = <2>;
> > +                               next-level-cache = <&L3_CA720_0>;
> > +                       };
> 
> Shouldn't this node be located outside the cpu@0 node?

Sorry, this is my bad. L2 is per core.
I will remove cache-unified, and keep it on each CPU.

> > +       /*
> > +        * In the early phase, there is no clock control support,
> > +        * so assume that the clocks are enabled by default.
> > +        * Therefore, dummy clocks are used.
> > +        */
> > +       dummy_clk_sgasyncd4: dummy-clk-sgasyncd4 {
> 
> Perhaps use clock-*, for consistency with extal(r)?
> However, please note that so far no Renesas DTS files use "clock-*"
> as a node name, but "*-clk" is in active use. Krzysztof?

Yeah, "*-clk" is more used to see.

> > +       /* External SCIF clock - to be overridden by boards that provide it */
> > +       scif_clk: clock-scif {
> > +               compatible = "fixed-clock";
> > +               #clock-cells = <0>;
> > +               /* clock-frequency must be set on board */
> 
> This clock is optional, and thus may be left unpopulated on a board,
> so please (re-)add "clock-frequency = <0>;".

OK, will do

> > +               /* The Arm GIC-700AE - View 1 */
> 
> s/700/720/

Oops, thanks. Will fix

> > +               gic: interrupt-controller@39000000 {
> > +                       compatible = "arm,gic-v3";
> 
> The documentation states it is compliant with GICv4.1?

I'm not familiar with GIC. And I think there is no v4 support on Linux yet ?
If my understanding was correct, GICv4 have GICv3 compatible.
We can use v3 driver so far, and can be replaced to v4 driver if it was
supported in Linux?

> > +                       #interrupt-cells = <3>;
> > +                       #address-cells = <0>;
> > +                       interrupt-controller;
> > +                       redistributor-stride = <0x0 0x40000>;
> > +                       #redistributor-regions = <32>;
> > +                       reg = <0 0x39000000 0 0x20000>, // GICD
> 
> The base address is 0x38000000, according to the docs?

It is indicated in very deep place in datasheet. I will indicate
detail in v2.

> > +                             <0 0x397C0000 0 0x40000>, // GICR Core29
> > +                             <0 0x39800000 0 0x40000>, // GICR Core30
> > +                             <0 0x39840000 0 0x40000>; // GICR Core31
> 
> No GICC, GICH, and GICV?

will be added later ?

> > +               scif0: serial@c0700000 {
> > +                       compatible = "renesas,rcar-gen5-scif", "renesas,scif";
> 
> Missing "renesas,scif-r8a78000" (everywhere)
> ("make dtbs_check" would have told you).

Grr, thank you for pointing it. will fix

> > +                       reg = <0 0xc0700000 0 0x40>;
> > +                       interrupts = <GIC_SPI 4074 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
> > +                       clock-names = "fck", "brg_int", "scif_clk";
> 
> "fck" on SCIF should be (derived from) SGASYNCD16 (66.666 MHz).
(snip)
> "fck" on HSCIF should be (derived from) SGASYNCD8 (133.33 MHz).

In the early phase, there is no clock control support, so assume that
the clocks are enabled by default. Therefore, dummy clocks are used.
But indeed the naming seems strange. Will use just "dummy-clk".

> According to the DT bindings, "power-domains" and "resets" are missing.

Unfortunately, can't use for now. It needs SCP support but is under
development. How should I do in this case ? Maybe use dummy device,
but can we use it ??

> > +               hscif0: serial@c0710000 {
> > +                       compatible = "renesas,rcar-gen5-hscif", "renesas,hscif";
> 
> Missing "renesas,hscif-r8a78000".

Grr, thank you for pointing it. will fix


Thank you for your help !!

Best regards
---
Kuninori Morimoto

