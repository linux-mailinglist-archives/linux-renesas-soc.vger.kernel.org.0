Return-Path: <linux-renesas-soc+bounces-5146-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B386A8BC6C3
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 May 2024 07:27:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D712D1C209E8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 May 2024 05:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40EBC4594E;
	Mon,  6 May 2024 05:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="tRNQzRpS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2066.outbound.protection.outlook.com [40.107.6.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD53440847
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 May 2024 05:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.6.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714973267; cv=fail; b=flD68zzd5aNHRJWoyXYSEZaFeZdTPajhgNPo2MIV8GcSWM/qgKhRJW9RR3J+AkTkSbL+QStTzvRidrNYNiKYX8a5UCtqBPi3U4RJU2K+jyJyYUf85zCF4Jx2DQiuD4teM9pAUTQ6x317kHiUeEfy8/MFo3yLprNcifrKFU+qUkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714973267; c=relaxed/simple;
	bh=ce5fA4BU7P1V56D492KM8SwsD2ZFltq6Lc0Owl9lb2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VxqQkXtLrSAHCMjASOf8fnrbhDBRpuoguu1R3EHXqxDEOHyHm3LbflxLigu34KlQu+AOl75bT96h8nxXAajQBWq1FVZaeXUSWV532WqvaiEgV+97hcpyPhxKEz+jbBhCIltgGnJVNq3J2tiI0yGj0RxUPzNKykopCko0ZQbC0U0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=tRNQzRpS; arc=fail smtp.client-ip=40.107.6.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gaAaPEQiMr9GTjkkf9iTuKzA2Ho3oXgqx26E64h7HtFRqFnzKCKRLTN/eMsqqcaIJGR4wVCRuj4ghSe50w5CjL6YEMidewrtOPNgyCLe8jD+nfMMCUTOBasrAwGLnqqki+z5rPNnkxQAzXU8ejYN5sDX/P5J1us6wESwXiU6w7jCSU/dJL2a/NGWhr9QereinOXUOmCY8kskB/4WNmJiV+yrKtoI0Fe/wNcWUREATJXrI3D5TMdT2CdQQIQGVP7X8f/uEmclHd8GbfKjQU2LhUh8EepI8Gncf8OuRJsyIZ+v4BIbKuDvqkctu39rAIAv6Ei7wo6KAoUkyGbE+0w66Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=prIXyEaytFgE8j9sDG/F/fei+rH6WhAAuJZ43qvNC1E=;
 b=f7NLPaEU6aKLmJ0H3PYXskiUzt1A4SdSm5AjmdLfcwAvBHoEutXIcakChRR4ccsvjQjKS6Si3H+5JP/BY4+KsoFkdCxuGmfKXaVajXxp5mZwFLV8UwKWZZgZGPRWYVDRb4GmcgIWuTiSdDBPYgEIibvx1seXajlzPWfzEswfmNACVgYqytos5GO+uGeAqd1cdkwrcMg4m2pSarBT7RFhjhOaxmdq55ZuiUsRmiS21li5tpfZ5yJ7SThQwN5Wwkbb2alUbF+fVYr1dgtA4cNxwGAB+uRJ1Z4YUHN0jXsVJ/Y+CSXYfsYL2vmwaaJwHezaKLS/Cs1xoa94hmoOst3yCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=sang-engineering.com
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=prIXyEaytFgE8j9sDG/F/fei+rH6WhAAuJZ43qvNC1E=;
 b=tRNQzRpSc1lxwCNxaSBG8H79Km/u/zXbbWcNWj98OhP/QvouNOVxMvHrs2nZpVQMmzGnARkDdTwMSPN9Q5AMTNXVfksaivMM73090nkKu2mAkLAZF+HV7n+OdT2kOG0uMG3IWi07D7YE93Y4jzy8UCka5lTk1sFr78A822sjiLtm+PxmUHJayPL5o0Ru3oyrS8fGca/6nIDSmn31M1y4sr7qPAtBoR+U8fGzHbFF415ANW+q9I0njvgHqk/pYk34m4k8wF9hk2QjTUxf4QqU2YM4kLxLcoRYn53px6PNTfSjsJTsh3zQs38kMHZLNE4UAiqYHHnnBpSFFMJDkdYoHA==
Received: from DUZPR01CA0181.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::22) by AM0PR10MB3316.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:180::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 05:27:41 +0000
Received: from DU2PEPF00028CFE.eurprd03.prod.outlook.com
 (2603:10a6:10:4b3:cafe::e) by DUZPR01CA0181.outlook.office365.com
 (2603:10a6:10:4b3::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41 via Frontend
 Transport; Mon, 6 May 2024 05:27:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 DU2PEPF00028CFE.mail.protection.outlook.com (10.167.242.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.18 via Frontend Transport; Mon, 6 May 2024 05:27:41 +0000
Received: from SI-EXCAS2000.de.bosch.com (10.139.217.201) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 6 May 2024
 07:27:37 +0200
Received: from [10.34.222.178] (10.139.217.196) by SI-EXCAS2000.de.bosch.com
 (10.139.217.201) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.37; Mon, 6 May
 2024 07:27:37 +0200
Message-ID: <a2b7783a-d548-4a0b-ab2f-a1cd66af632e@de.bosch.com>
Date: Mon, 6 May 2024 07:27:25 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: tty: serial: sh-sci: hrtimer not properly canceled on chan_rx
 invalidation?
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Linux-Renesas
	<linux-renesas-soc@vger.kernel.org>
References: <20240502174257.gfmk7al3qkv7jiyj () ninjato>
Content-Language: en-US
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <20240502174257.gfmk7al3qkv7jiyj () ninjato>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFE:EE_|AM0PR10MB3316:EE_
X-MS-Office365-Filtering-Correlation-Id: fe40212d-562c-46e2-32df-08dc6d8d401c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|376005|36860700004|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ejJieDZ4S1N5UXpoczd4MTdMNk1TUHFUWnNZVmMyU0N4U0VyY2hvWmFxeFVK?=
 =?utf-8?B?NXpuQjUxK0hobUFzRStMZm02UjB6UFRqM2RWRjVSRlI1U3hrSHhhWDRQeW52?=
 =?utf-8?B?WVkrYTBZOXR3bWxyMENYdVNsaGFadG91eks3NHNweS9RbUxlVFVZTkZBQXQy?=
 =?utf-8?B?NGd1a2ZsZWQ1bXRwUFBoRGVlQlZaS1BsWmJJa1ZuZjR3QjR6d0JiRDhPQnFE?=
 =?utf-8?B?VzlqREFPSCt4OXdPcFdxb1R6U1lsaVVMRktKSyt5VHZnRXJ1YVEvc3dQT3lR?=
 =?utf-8?B?S0FGbkd2R05tUjRKOFZGcWp6Z25YNUl0c1k0c3d6VmExbkd5b0hNaXNSa1pm?=
 =?utf-8?B?MkhQcGRkbnVJcVBoeURPbUVZSHhadHhLVWZRSWw0Ti9HY3d4aXlUcThvY0k0?=
 =?utf-8?B?bm8vY1FSNlpHQ2pzSHBCc0hQdDlJWEd5aDAydHNMZWM4T0JwWHg1bTRTZDYx?=
 =?utf-8?B?ZVB5RW81RXZLRVJhNXlvUVFaN3pGSzRuT29zZGxOUEczbUtVbm5RakYzVE5w?=
 =?utf-8?B?N3gvTEFjNnRWSHBWN3Z3aDZVQ3VWb3BqUlc0MGt3WmdTY05DNnRySUhYaHVq?=
 =?utf-8?B?MnRqUndoeE5MME9neUZLUEpScHB2ZWpEN3FGVFpsK0JORWxlR0FsazBoZkt2?=
 =?utf-8?B?UXhQeDAzQlNlenRiL0tjN0Y4UnFGazhKa1dJaWV3YUc4VktsdVFXKzZIRzJn?=
 =?utf-8?B?Y0xUUkRlZFkxbUFkdGprS00vU3pkSmJpTm9kYy85eHpFa1JZYmlXRWRXM1d1?=
 =?utf-8?B?c3h2eDBBUEpDNHNxV2tPaUhzQXh0bUpvb1l2eUdJd2U5SU5EMm9rZXFhUGNG?=
 =?utf-8?B?M3BMaFdaQXBJb3Y5QytKenY2dE9VUGhVcHMyYkFMWW01QjV4OEtaT2tTbitM?=
 =?utf-8?B?MG5XOTFJNHF2cHZEYUxmbXRsRlo0a0E1Qi9OV3E0NisyUGFlQ2x6RnpDNEtY?=
 =?utf-8?B?Y3UyQmNHa1QrV3E4RTJCNGdyVGxTM1k2U3NpQ1lBL2wxR0QvQ0lUYVpKVFBT?=
 =?utf-8?B?dnZrTktYTlVWZ1lWOGdaZVYyeEZ5Rml0R2YvMkVnbDNIc2Niczd5QlladWtv?=
 =?utf-8?B?VWp1ZlNxcmZNcU45SFpoWFJHZkVCeUtVSnJsTG1QYWlINm0yNzYyY2w4dmd0?=
 =?utf-8?B?bjlPbEdSZmw1ZlQ3ekVJU2xDOHo3Sk1meEQ1RUJOZ29TTG9lQ0JCdzFiK0dV?=
 =?utf-8?B?aEczRnN0MWRVZ3lBSTA1aUxBZGtYRUhoQWlCcTdSVy9EQ1V5QVVFc3A0elB6?=
 =?utf-8?B?ZnNGcVA2Qkx5NzRxa241MGZBYStwbHI4ak45anpBRzlQcCs1L0RHUmhNTkdT?=
 =?utf-8?B?RUY3MExlNGYybUpEams0alBNWlplWnY3RUE3Mng4ZG9QSnlUYXJFaWM3V2tF?=
 =?utf-8?B?VC91RmkwQ2ZZUmpmcENLR2EwWm0wUHdlMTUzbklTODJGQUIwMkNtdEhCK0R2?=
 =?utf-8?B?S2pMalo1RUMzUCtOdFNCNlNRK1ZacUlsamF0aCtIMlorR1pJN1VaSjNZYXVt?=
 =?utf-8?B?OVZKbGUyN0pab29ialE4WWo0SjJheURrQncxQjVTZXhKN1g4dEsvOGdYL3Vw?=
 =?utf-8?B?cm9ZemVBMXE1b2xLekF0bVdzdjhSM1YxUk1ac3d4UFpOY3ZSV2lBdDFGaXRI?=
 =?utf-8?B?TDRyQ2ZacDZHR3ZBSmkvL0ZSN0JwajR5NkZvdzgzanpZSW96bzVKNEFJckdm?=
 =?utf-8?B?OVZRdi9ncFJvMWt6T20zL2FNSUVKajk5cUtmdGpHbW83NFNGTDhra1lmSDZM?=
 =?utf-8?B?S1JEMUo2YzcvZElJNVRsVkZUUHRiWVNBWTN6d0xJWnhCS2VIcVQ4c3UwRlNs?=
 =?utf-8?B?aFZRa0h1R1BQWHNKZjU0NzdyK3lncGJIR2dQZ0M3d3kzRU1oZjVqdDFacnRk?=
 =?utf-8?Q?giay49zHcFHl0?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(376005)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 05:27:41.2236
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe40212d-562c-46e2-32df-08dc6d8d401c
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028CFE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3316

Hi Wolfram,

On 02.05.2024 19:42, Wolfram Sang wrote:
>> using drivers/tty/serial/sh-sci.c (on 4.14.x Renesas BSP) what is quite
>> similar to [1] we got [2].
> 
> Do you know if the system was about to shutdown/reboot? 

Yes, that's at leat an option.

In the quite limited log we see "Interrupted shutdown" reported by a 
user space (!) application. Whatever that means, and whatever that means 
for the kernel. But yes, if you think shutdown/reboot is a reasonable 
path to look at, I won't exclude that ;)

Best regards

Dirk


