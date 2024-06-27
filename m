Return-Path: <linux-renesas-soc+bounces-6852-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0BD91B280
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 01:06:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB7C91F22970
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 23:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C28A1A2C33;
	Thu, 27 Jun 2024 23:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="aev0+erd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2046.outbound.protection.outlook.com [40.107.114.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A7D1CA9F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jun 2024 23:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719529549; cv=fail; b=sw7p1DYgVF42AZuKV1ltODNVlYrQGyqqW8VqBTGoUtHmUCD9yJ/DIB3Qv1ob1wrb7CifsWUQOeFyJX2xyLNp4jBEVbq/pjx0sXeBO9kLiIqu3SR8qGB23eW9/hkL7lMbEf/Yc0myeIYfiKeY2emXJUVIDlxoqBXXMWiWtqeoZH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719529549; c=relaxed/simple;
	bh=gfy9PYmi5fr5Nzdzi8T452kpg9NON5CTDY2VdyoWPJY=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=NfZ++S4UUkTCh9JYlE/A+L+izZnC7WjY5ZjVCdZcPcSXZoZUFBdoZwzsco3h8tTVx00RQjucyaSuqAgLPJn8Ckq2SjQ0edmeI5einpezqLT0ibDDHAwx2B+16UYRv1ROYURP1Huyz9RqURAhUx26Medr1y2LtIdjmx2Z4DOWcNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=aev0+erd; arc=fail smtp.client-ip=40.107.114.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lK1Ntuv71s+etLfl3+2iie3mxtf6upmNe7YF2ZFuTRQCvreSTyTrq/Rm2MrUMBKzExTrXqIE+9IiGAruJhpmduDa7Hg5geT9yMlHrpIeT8dgVMdWGCNH8BmvEvZKZy6irD0UK0zmj0pQpbc/BFH0NCcR8Y5keUfz6H/PS6jnd9WkrafQfoqhl3+tl+RLJVvTDDR4tL48QdUORYbzSgwiNxI9KfJHxFdm7d0c7Kz/zmUwdT7dhTROXX29Bzn+uMfKHPfkstdJiFi9oT5aak8PC4ZvMz6ixTKnlJyMn8w+W7sAf8KAJb7fkQKXLMq0rQCh6BT0cFUbDyVsqxWZsuC0Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XA6F1OQRpbC3bSgMpJ7XIkIcbp86YMnpYO/VSV/sPls=;
 b=heU1qJG4PU13ae0ZYedFMxIUr72l5qIsQfCVYbPBLne0MkEIR63vhCRg3ToIkUbeFNVYpYPkil4CfwluOzou6SaLiD5HHLoJPeeEy5jaxt0uyoPx5nlWArPHYhfNACfr7iUU0/IYbaaGF73ZgZnbkUqN2HcPmcVq9FiNgzoZd0+mhcsUXOXcS8US5Kh0ol3xFB5RQkVQ7CiTpsaXNcu03KqXGI+r98nv+/SL8iOMlC9+V1fo9R9AvxQi6H9DSm1z/TmR5iWPeSuGztuPhF/A0RCgYRYuHIeAT9O5RAqO4FZGtwAwIDBiIH/DiqaWBWPOiONT+edPtj7yR8xqUF5Lcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XA6F1OQRpbC3bSgMpJ7XIkIcbp86YMnpYO/VSV/sPls=;
 b=aev0+erdc6geZQgNW5AHTLPUyDkFI0c01mtSb1KGj8TehC2/bHyClXm74/MdGdc7U6Q8Own6DVA0GhPFTtyuI1CQmdQSaDvdFKmI9GCQSsUzlGQvoVCI/Lv7majL2cu907qQejupYeXddR/9a/IzeF4pNmNddhGdE/TpsBI/84c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7264.jpnprd01.prod.outlook.com
 (2603:1096:604:149::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Thu, 27 Jun
 2024 23:05:42 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7719.022; Thu, 27 Jun 2024
 23:05:35 +0000
Message-ID: <87v81u9ebu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Khanh Le <khanh.le.xr@renesas.com>
Subject: Re: [PATCH 4/6] arm64: dts: renesas: gray-hawk-single: Add Sound support
In-Reply-To: <CAMuHMdU4BpeoLeENaV8yK1G_MYmgHYx=tHoKeoYBAqL7FD+Kyg@mail.gmail.com>
References: <87jzifkxi4.wl-kuninori.morimoto.gx@renesas.com>
	<87cyo7kxek.wl-kuninori.morimoto.gx@renesas.com>
	<CAMuHMdVuXreoDxQHT9Yf88fhrCTnOwRJjWNVRoue=8DsbO0=4A@mail.gmail.com>
	<8734ozqm7q.wl-kuninori.morimoto.gx@renesas.com>
	<CAMuHMdU4BpeoLeENaV8yK1G_MYmgHYx=tHoKeoYBAqL7FD+Kyg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 27 Jun 2024 23:05:34 +0000
X-ClientProxiedBy: TYCP286CA0374.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7264:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cc3178c-a8d1-4978-84ec-08dc96fda6cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GoamqgXs2tQPC8NSkPmcOPkWY7mG9wxRo81LWJ1+g899VLhvdMIejaqAiJoL?=
 =?us-ascii?Q?GOiux8FWA1gy4Pp+2IG5w8Ai37KH3w+AFIAH2SXRc/ODY5PE7RtLiIFqR2H3?=
 =?us-ascii?Q?1bsuNOEb6gnnpY7Ew63e0wXoKfhMUzsCMjBW22oL3zoAtAgBbn07jyD4vE+t?=
 =?us-ascii?Q?BLORs63MzKX+DPemh8DE/ABqkqwl4CXhU7t/jD+DSHMPogJYntmHg4U6AeK1?=
 =?us-ascii?Q?OS0Etb35vkLcaEldVerhJr6OqiM9ba30/Zfbnmc3MhVKqpjSBs9iL5X2cEki?=
 =?us-ascii?Q?9ZXlZZ1TKu09wHGRPXrwslwcceKGM0yKYInxMfb0LRAI6BQiCTUISY+HMrL3?=
 =?us-ascii?Q?SVU8NIIRGHEaAsH+Q0zejxNlaMOWW21rr6HRu9Tposi/0sIf1sYehqaRCdCa?=
 =?us-ascii?Q?azuuO82/MSenmIoITqJA4rP2GpbADdvQoJzSifamzvwEyDRSAKLvf86BeJZO?=
 =?us-ascii?Q?P6HzoX2q0bl/CViCg223TMvav84+k/QMO+dF6E9szvLtbxVKcOYsOQB0FGya?=
 =?us-ascii?Q?k5+Ra3j3pRXoL433JkKe6kEq2/Ucvh5iRgxbhsxohhNxPN6nWfT4DE+DNMvs?=
 =?us-ascii?Q?olnDm0dNPJ8qYkFKMX19MTMYNoGLbthRazcGzOErzFeSrosuKWMdOrr8dgNT?=
 =?us-ascii?Q?d4xKxFj62A49UVdjlx6gne4B6f02tfIS/CZLd8uPMsfNReuRjJ+yq4LbYpM6?=
 =?us-ascii?Q?p+wym0jR2/mNvhMCA1RBRj36KmEtO0DLNvoSl9PzMIff/TRp+AvMsFIgBNWd?=
 =?us-ascii?Q?GHHT1kqRj7+VCI9uTuDXm3smGNSfPs0GL/1FJ9aJ/5nsiWFoeoWwZIAyQgrS?=
 =?us-ascii?Q?xKoyzNoIt6VBdMI7mtJSvB2gw0HbglsWMseTjSRFdhKwlZngI9+q6nVz2jtv?=
 =?us-ascii?Q?0foLB0iNpHzpYYfeWNAvyRKnWGXOIj7J/OTyPDiQ+60Ct9H0pyRWTsHuCa5Z?=
 =?us-ascii?Q?RwdzcttoEx9pzUWSJf5LA+FHMUf3vykhwhRCF1nCO8gB/hrh5a5M4z37h/Mg?=
 =?us-ascii?Q?qSKwTvIkUN/fjI8j6NPpdADzsVLsdUTfLXiXnL0Ll/xdd3s7x56w8oIG4Vxk?=
 =?us-ascii?Q?0LXEnPWOswoKtsjSi8mIWusDIDikUlziTXNLdhkRgX0c7hW6Wb8+rmhU7ZRN?=
 =?us-ascii?Q?0EASVkDs2Jbm5Ib6bAPNiN/vKdoQhYRPEDK9/Qaa33KCLM2lLid0tPcyHRkZ?=
 =?us-ascii?Q?ggqjGT2PMo403/r8A4x2MWhfE087BbQYiR+ihDQ99rnb89F3JapYDHJH4UCw?=
 =?us-ascii?Q?+51SVRr88bmvkwhUCDf3nJtW5Vpo/rZneAOoGVHGYgNG49lmv138bvTWZSfw?=
 =?us-ascii?Q?BSgJb+MTEvHehXTDpSpm4OhOF9F16klAar+yH18gbS+C7XuWFiFLArYDa17M?=
 =?us-ascii?Q?n9bW2OltiMravm2u0q9C8WFxXAnZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iuJ0+AwQdGFZ347ojRmuV6CwyyTtrZOH85cywpk/TVGrKGxGXa5tRYW0uj4N?=
 =?us-ascii?Q?koSaLz7qPytraySrJebB+uNXl9a9mFjhp81dyTM8BFHHylWGcvpa0CtUQc1B?=
 =?us-ascii?Q?sadPB7W/0duKhNOKwHb+AAORF0Wyp2kW8t2UEyQ9XKW5S/VDxIan9dDfIyKg?=
 =?us-ascii?Q?e87X7t2bNbrZ2DrQRS5ohq0wA98PJRL2uiGmf3LRbSRGNmRoKg/PINPwLjVk?=
 =?us-ascii?Q?Y8Y6xzbqC+Q09+DzTwV/O8K6gQ+yEsiPYut8soH9yKFjlEAI+cghk7LHalEF?=
 =?us-ascii?Q?/HL8/aYfNc85xSqF+07NZjEniCZubcNUAuD8Og4zYSvU7DbepST4Eh1lUAW+?=
 =?us-ascii?Q?Tak/mZrcEaiQrd085H32GAzUPAOSCSki5DS6jKbVAugSKz8xs4pr5gt9uBeT?=
 =?us-ascii?Q?z2Szn8UpC6EzJgw06Vc87LIHOmqnLA5n8SHxU+GalyiH8gzhdpq4IuNNfht0?=
 =?us-ascii?Q?Pc2DBisyXEPir1nsNMwpvUBBRdnlOtnqKJLsXs1wFfQG3mvh5mLg/mB4M/8k?=
 =?us-ascii?Q?R6n+QHqfXfMbDXMlvuBphNssUiSGWusdiCn/x1lBBMQY50JyRxLB1m0L1hQy?=
 =?us-ascii?Q?L+C4K548fZhBWLaelu/oiZ/fL4QtOZaYe6VmsQr2HgrjPpvmZubggXXMQwGh?=
 =?us-ascii?Q?4IHZhphG1GBLvHArs/MmGA7uj4R0yzi/YcKTZWh9nWRZEcVXojucWTC8JLDg?=
 =?us-ascii?Q?fns3ICBSyW8r+qKM+c1u8/yIdV/uSwGc1klgr43kfE/ektmTTx2TMeVPnTh6?=
 =?us-ascii?Q?l9SsopgjXlyVU3Ci1lhEuTMfmFGb2ttnIdZODHZ2P0aoO3A/lStjlMdAZ1Kc?=
 =?us-ascii?Q?GGDuohz7yhN+7HfgkGE/TFKeas6ude7cXLPnZ1p8mwllpSjYuyjd9k865Dsr?=
 =?us-ascii?Q?hc/bIYLj1CiYiHtA4szE+d2/KrENzovOelSXFOWc0J1OF/jQv4q4qRIRI4Tt?=
 =?us-ascii?Q?Nc4+fBFrDN/WhAXet8QWGaJypyWWNTuMtzi0chwuh0IW+tFSQQ+zSZL+vock?=
 =?us-ascii?Q?L84T30JPwLBZoYEE4VC4js8yGU96HhG1iDwmdJWIKx0oMkUaaETOrzHaSp8H?=
 =?us-ascii?Q?TKiwLKE6Q37Kc2LGApKck6RLzjYob3a8BAgOM+41T8XOzzs7gcYqHiMNtvW/?=
 =?us-ascii?Q?zJSBtCaThyT38tEI/c2WY8Asfz1VVLGXD7WQ/z6shXInMRT8GjylFpBtMqK/?=
 =?us-ascii?Q?KdBHd5nRM45cHa5GB6lMG6CNHi1wuNLeBHrstU1GLWdJg7Iw02IhhIaMbjp0?=
 =?us-ascii?Q?3pyoADqC9YQc4D6CH5PKc1gpvYeiOSXx4Si9xSSg+fKgHc3r1ERycuBL3uao?=
 =?us-ascii?Q?S8/nrUMIAy5I4SNGfWUuQLU87Nt4CxYTnGI2BS+4BwplGK9AuBvSLzQg1UkD?=
 =?us-ascii?Q?DrIibyjxSt3GmafnpQ21pcP7IjKlv1k5f6NsXhUr/SZ4ISWBION8w62cCSMl?=
 =?us-ascii?Q?Keq2x4OqAeXxE/g/fHV2p8mcPqApQlaES91XgHJgJON4k4Qzwrm3R59gxfV4?=
 =?us-ascii?Q?X7uHtna2QucPfnak+9ZzIUPEc9HO0dVI1T9MZn+iIRGWqi6aqydyKMmJpGp+?=
 =?us-ascii?Q?G/xbIK1hDnn4qSUsm99bDi6ETroYuIbh+lXGrmVicB5S4SKbzMmbnZvs13P5?=
 =?us-ascii?Q?6Oc+PcqqNzjDJ/Ye6a1Wgm0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cc3178c-a8d1-4978-84ec-08dc96fda6cf
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 23:05:35.0280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /pxHHB7Mekvq7YWILOtroc341fAv4sNJOh00TQL2rCVuLHCJk4WfUuH8pHAGTDb4efPS2A0MU4cGwdchTL+PHGWfnpiuDpzrQeUkM+W6tn6ip8y2Txyj/Tl+yE+EzaSZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7264


Hi Geert

>     struct snd_soc_dapm_route {
>             const char *sink;
>             const char *control;
>             const char *source;
>             ...
>     };
> 
>     static const struct snd_soc_dapm_route simple_mux_dapm_routes[] = {
>             { "OUT", NULL, "MUX" },
>             { "MUX", "Input 1", "IN1" },
>             { "MUX", "Input 2", "IN2" },
>     };
> 
> It looks like snd_soc_dapm_route does not support a node that can
> change roles between sink and source.

This part is independent from main Sound system (= R-Car - AK4619).
Indeed naming of "sink/source" text is not cinderella matching to
our board. It is re-using existing driver, because our case is not
general.

Thank you for your help !!

Best regards
---
Kuninori Morimoto

