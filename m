Return-Path: <linux-renesas-soc+bounces-23861-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B66EFC1B949
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 16:15:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EAC685E1AF0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 14:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 002942E0B5D;
	Wed, 29 Oct 2025 14:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="aQ16SfH2";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="uzP2Thcj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D212BE035;
	Wed, 29 Oct 2025 14:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761748726; cv=fail; b=hRBdDgn/ovQbf/NxzDIDIUUnE5ncieeVjyAPvtPhnrYbKo8UoWbtf5YiGCPC50zhxmI9PuB6VqfKHL2FxwAppZmUFrC42RugR6NcbevOLFOan0qiCSrLWV53E5S/kQ8r2E/byGg+uO1Sfkw8M4M2jUIzRNtpHJynukRRBFVFG+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761748726; c=relaxed/simple;
	bh=BdC1EdWHzD9THnUqZ8xsFSksvjBYL6a5vtuLy93RieM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=krsPazIhzsRSK9na6MK5Ydfi9gejj8aTSSQW6mZdyllZ5OT05ZVEfpSx0r9eLAKQ0rSQgMFsY2SfSt1jYdr9r51rtKUZUGKk9xkijXhLSkujR1sydVPzEU9iU5We6B+IRI1LVdyNRu5a1PNyxkX9PQ5spzVWY38tEQWd7lVlTMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=aQ16SfH2; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=uzP2Thcj; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TDZVur143143;
	Wed, 29 Oct 2025 09:38:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=IQ+IxWhAWyRr1v9WNeCTStbd7Bfd5CSck/pPIZ36KSg=; b=
	aQ16SfH2CGYzPGr0YaBBsF/StcqcVTlnm670KQC8f5dMDA/Iu5omFX1W5PoUFO+M
	Ar+Li0EuZXHs5Ug7Aerst3/nLQdAkeI0PeOp3X9w3gEKSVrdqlXd6pn/wSr9XgyO
	4u3vrtJDprnpg9USE0DvtfmAwXN/+7mYrglSAz2UwLso4ddkynLlNnZFaX5FxU8K
	u7zEYlBR3covEOQJ+HDuqvZc9xVZcx5Xq5IyZk+4cTkVGpq7xD4BAEt82OeprJqQ
	EDii6dGKYmWQ9uPfo4GfkSEoz3pw7BhLu8jihk3Iml/kMUHYZxNYfs9JNs3BKqxJ
	hGTaHeDGEa1sBhz+jrEa+Q==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020087.outbound.protection.outlook.com [52.101.201.87])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4a34a6h5th-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Oct 2025 09:38:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mLEpi/hcb90AfV6Q8Zp0CRciMMrrSPDfme1aDtPcDu7vwygQIgfaaUfJ+r6bKHlZeIhDnnu6356H85nUaD7kIsKEAbrAwGq9KstDiET7NnzUSLrKZT2A1/p209l4jZqr6SW4zoSbmBx2ugTc5P0wnOI7qeGncglD+x8gTOZ8ru5xPGI8r1FWcAqsl7OdrCZ06MIw+BqP8oScIrVurZJuefOayD1GaW2rZRvDJd+LkYfwx1eX6uX4pzxBjzmgZWB2WS63jumAwdTE5mePyFILUv/xxQdZ2T91TiwxopZQ3EHwTVXLm+Cq2WcMoWKK6HOtAXeFCiFhNxh7f7Ac1+Fxkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQ+IxWhAWyRr1v9WNeCTStbd7Bfd5CSck/pPIZ36KSg=;
 b=Y5ZCPeekTC/bV2KwcwM9o71douF58sqzKzrVK4K/q4OdDb1UBG1ogbJ0aLxcRixFMWH490ovNOgwOE2xD/ZZOj6boSPlikS2++6Pqb8HdblG0IqSLxmwf14JcS06cs/9BBJbVbtfnBnHjbK17z32jax6swQS70eVeV8YctMcQ05488UPIRbSMRYXXonZ5pxIJQinH4maoheWFAvHCW2Khgu3xGtLCSK3vnNQ2MrMSNkbz5rqoDOlhwWGqjzHhXc3Wl3szQv1oivIFRHFne8r0oKSsf1aWgVwSz5zn1hxQPd/qooICn46zEbEnPgA5nlPOXE+VYVFM1m3iLUZ+ueFaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=bp.renesas.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQ+IxWhAWyRr1v9WNeCTStbd7Bfd5CSck/pPIZ36KSg=;
 b=uzP2Thcj86mggIcPjbK+n2WoDmoV8NU2zoo0vzmMOz/nslCVKle70sDsHtl+C2Wxo12IA7tFe0Dz4WX5s03BMwZsmI69N8QXU7hTYc6112jc9WxhyMWTUBMqHvZLewYJ9OQYpdWaDbLeGwieCWZCaIGhg0J6e36bSKCzkq5KcFc=
Received: from MW4PR04CA0344.namprd04.prod.outlook.com (2603:10b6:303:8a::19)
 by LV8PR19MB8250.namprd19.prod.outlook.com (2603:10b6:408:186::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 14:38:09 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:303:8a:cafe::66) by MW4PR04CA0344.outlook.office365.com
 (2603:10b6:303:8a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Wed,
 29 Oct 2025 14:38:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Wed, 29 Oct 2025 14:38:08 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 13F90406540;
	Wed, 29 Oct 2025 14:38:06 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B0160822546;
	Wed, 29 Oct 2025 14:38:05 +0000 (UTC)
Message-ID: <d461038d-67c6-428d-8a88-5bd249dc25b3@opensource.cirrus.com>
Date: Wed, 29 Oct 2025 14:38:05 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: codecs: Use component driver suspend/resume
To: Claudiu <claudiu.beznea@tuxon.dev>, support.opensource@diasemi.com,
        lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com, biju.das.jz@bp.renesas.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
        stable@vger.kernel.org
References: <20251029141134.2556926-1-claudiu.beznea.uj@bp.renesas.com>
 <20251029141134.2556926-2-claudiu.beznea.uj@bp.renesas.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20251029141134.2556926-2-claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|LV8PR19MB8250:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a37b826-af1e-4db3-7344-08de16f8c746
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VzlaZDZEQ0xGSU9vaGduMDNRTzJpR003Vmg1SEVYVlFkNDFHWG52a1N3T1Bs?=
 =?utf-8?B?cEthVkQ5ai9DcDZPZWxSeTMwTHVtazBGWm9HbElSNnhVYjNUelE0SHUyWHQw?=
 =?utf-8?B?ZThHY3pQL1dESDZIN3RSMk9zRDNVdXpjZTNFWXFJSWgrakNDOWkvVVlXTE11?=
 =?utf-8?B?K2VFenhnWWlicThJNyt5Mi9VMm9LOGtLVGJoejU2dTRxUXhTRnA3dFFZVHNW?=
 =?utf-8?B?WTNaSFJXU2tRdk44bk1lMlBpTVNoYXVKczU1a3hRVkFlczMzanFWTGpxdllG?=
 =?utf-8?B?YzlMb2MrYUpMSGZ6SE8wWE5oMHl0ZEI0SitqYVVHc29Db3oxaThxa3hReDVy?=
 =?utf-8?B?MFA5UEFqQWsrYzF4K3c2UmtvRXoyQWpsT1RrQkd2N2RMUS81R2JGbGkrbHFW?=
 =?utf-8?B?TmRxak1sVE1JeFpiSUJYN1BJamJRU2RqTW04T3NXYzZaMnlrWXNIb0NoZ1R0?=
 =?utf-8?B?ODB4Ykw4eUxMYVVjWFhVRjRDU1RXZGNaaHd6Ni9RbnhPQ3hIbWtTQmMwZDR1?=
 =?utf-8?B?dGJ5V3RtYWt3Rm1jRVRCdnowTG1wNXJhOG1UMmovZlZIaUsxZEVkZGxqUW84?=
 =?utf-8?B?ZE9aZDJ0SG5yeXBDMkVtK1U4eHdoa0Vnelo0a1pLaW9CWVh0Sm5CVHJHa3Zj?=
 =?utf-8?B?eC9lcTd5V2xmM25pS0ZiQUF3MENwTVREOEtOK01rbjNzN0lkOSs0cTZFQVZM?=
 =?utf-8?B?SU9ITDh2VUU2VDI3OGJiTjhLL1VTMjlnL05Gb0JscktQblRiZFBqTE9HSHJJ?=
 =?utf-8?B?TExFRGxPYkVMVjVPYitiQUNkbUlzYkczRUpINmpiNHZiSi9OSnZidmpGaHFX?=
 =?utf-8?B?dGpTWnNNa2RvaHhaakZFekphNnJkTjIxcytvVEhyZHZSRkMvcXJiZkFYUFRJ?=
 =?utf-8?B?QktPN3c5VlNzS2R4UWQxU1lmMmJDY2JIRVZRZEdtWFJNRDljMUJmSEhXdzFY?=
 =?utf-8?B?NllwenhZdHZRNnNNbUpMYnJ1U0xVRXdVYWhUdWVxb0JTQW5BbEtVRFJNS2ZE?=
 =?utf-8?B?bmltcEZiQmtKOWJXL3RQQ0VKdElVYjFDN2Rsbjl3ajdQL1RTRzNyRUt5S3pm?=
 =?utf-8?B?L3FQdFoyUjFqMTZCTlFyUTlOUnVyRnNJRllBbmVFTVUweUE0MkNyU2lEamRN?=
 =?utf-8?B?YytXODZ4WE5Jb1dCU0QvWFRka2lzdHFMd2lXS0tkRU5heC9rYXRLY2JqSlJI?=
 =?utf-8?B?c05GaXo1U1YzaDVFbmxqUDRIYm40WXVYUlJCVjJHY0ljL2kzYXlLNkdiTkdT?=
 =?utf-8?B?bGc4Q3FYZWd4bnVYVnpWVlBOQlozR0xTUUgrREFWYzFNQSt4M3FLRzRUdkln?=
 =?utf-8?B?aVB5YkhPclV2ejhyZGZuOG5ES3VkbGk0OFAra0RpQUk3c24vTDlKeTQxZXJK?=
 =?utf-8?B?N2hNOFZJYlV6NURSbVlCcy9OODlJSFpiYmdGSUl0azMzVEZkSStWRk9TNGl3?=
 =?utf-8?B?Z0EwaTI5NkRtUDRqTitWWGYyR2FHUGdMVGk5QUxiRlFWdDcwd2pza3JaYWhn?=
 =?utf-8?B?Ym5KZHo5aWF1ejRSL3Z5YzdtQVlmYW9PK3Rmam5SVCtISUhnR3RwSnBCZWRX?=
 =?utf-8?B?T1RzZmRQenk3bHNKMWt5cklTYjA4VlRWenNjNzcvQnlYVXhNK2RiaDRvcjl1?=
 =?utf-8?B?Q2xoMFoxNUlLTmduZ0FsWXRvc0h0ekNCSklSTzQvWE9POGExRTNiZXQ5WEZR?=
 =?utf-8?B?YW5tNjV5bmpqdWV2RzBvT1lsWWJXYmEwYWxvcDZLcjJ3RzVOUlZlTzJBcWtO?=
 =?utf-8?B?WEhmaU1MY0lLVDBRRi9SYTRHMHkweTV6UUpYVmxSeVU1SHJnSHd1YkZqSUtE?=
 =?utf-8?B?RUg4bldJTzFoTDNqTlJVWW9DMUNGbDFkakNpQ0djRFE4a05QM1MvdEtQSm5F?=
 =?utf-8?B?QXgwTUhDckZIVkYwWXFYU1hkZHBha1ZidUplcHM1ckVJbUIyNldJemV0WG9Q?=
 =?utf-8?B?QStiNURGa0xxVzBRMjV5czZ1K2ZGTzZWOXhHdEh3akhxcHFPeWtJM3N5dVdH?=
 =?utf-8?B?Y0FKWUdBaFNxMThBelFGalBpVEI2ZnBiL2RVdXJEZ3hCR2VkWE1kSW45M1lM?=
 =?utf-8?B?bXVONjBqeVk4Qm5WdDNFSGd1aEp4VHNvZ0JOaTVyZVNydWs5bDVjeWF6Slhy?=
 =?utf-8?Q?ZYe8=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 14:38:08.0901
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a37b826-af1e-4db3-7344-08de16f8c746
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR19MB8250
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDExMyBTYWx0ZWRfX09wH1kuCrzEN
 6dSw8kk+hhuJEU5nTcYZ9wSUTuZPTdaeNe7eSYWZiHpNXmuuBefUJtaMRJvYCpt8/u9bgu0SCRy
 B723OBZkAK/rVnK5W8HktPmZOHEV8he5++pvNPXafuN/cEkY6g3xq68Rw8ZJwZQKTrPpyDoaRfR
 3VBuEYR+joAQrqDsPQW/xqV6PWf2AUGS/OUKX2qzP9M2U+wgn50UYrUV/JqbsriR5ZrTsO9t2PO
 yiyVjmBtzw49EHiRXNojKN0dBVs+IwPBaPUY8Mvu3jS0mPOjqcsT5yt6FTSVCdhy2BPRBeOR8Lt
 lYgmJprM59q183vd5kngrLp+IAprJygNARtwfKcI9Mwa2NKE2zFzJOQMSQDjRMqdyxMb3GB3rC4
 HuNdu1BJiUlb19MRmq4bDOc1mEWrTA==
X-Authority-Analysis: v=2.4 cv=HLfO14tv c=1 sm=1 tr=0 ts=690226d6 cx=c_pps
 a=M3VJd0sitle1370pw5NXFA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=yC-0_ovQAAAA:8 a=VwQbUJbxAAAA:8
 a=iaZoAHOn-GXOTvXqDIgA:9 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: 04VEMriA8GIUy0zFz0MlSfE0zsRlrpYU
X-Proofpoint-GUID: 04VEMriA8GIUy0zFz0MlSfE0zsRlrpYU
X-Proofpoint-Spam-Reason: safe

On 29/10/2025 2:11 pm, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Since snd_soc_suspend() is invoked through snd_soc_pm_ops->suspend(),
> and snd_soc_pm_ops is associated with the soc_driver (defined in
> sound/soc/soc-core.c), and there is no parent-child relationship between
> the soc_driver and the DA7213 codec driver, the power management subsystem
> does not enforce a specific suspend/resume order between the DA7213 driver
> and the soc_driver.
> 
> Because of this, the different codec component functionalities, called from
> snd_soc_resume() to reconfigure various functions, can race with the
> DA7213 resume function, leading to misapplied configuration.
> This occasionally results in clipped sound.
> 
> Fix this by moving the regmap cache operations into
> struct snd_soc_component_driver::{suspend, resume}. This ensures the
> proper configuration sequence is handled by the ASoC subsystem.
> 
> Cc: stable@vger.kernel.org
> Fixes: 431e040065c8 ("ASoC: da7213: Add suspend to RAM support")
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>   sound/soc/codecs/da7213.c | 38 +++++++++++++++++++++++++-------------
>   1 file changed, 25 insertions(+), 13 deletions(-)
The commit title starts "ASoC: codecs:", which implies that this
patch affects multiple codecs. But it only changes one file.

The commit title prefix should be "ASoC: da7213:", same as the
commit you reference in the Fixes: tag.

