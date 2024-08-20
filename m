Return-Path: <linux-renesas-soc+bounces-7934-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71016957CBB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2024 07:28:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 836EA1C22AF7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2024 05:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD516A33A;
	Tue, 20 Aug 2024 05:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="IuhMfpFJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2083.outbound.protection.outlook.com [40.107.103.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D3236B0D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Aug 2024 05:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724131726; cv=fail; b=Qbg/OnAifPMIe2PIVR3I7kC6vPI0vASVNR2L5+MqMngeh5CffBzTuOfdAbTyubAbuYdD80PEzwHpZqdxZ3Lbkqlw+3or/wra3kw+tF2u/SozRz3I2++jefJ+MmxGgxDlFH2GHL7ZzHZ+Nd5894PAVNIooxcrSt07M5Q5eCRKoEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724131726; c=relaxed/simple;
	bh=A7/cd7xF42YbeUEU3SSIfi8VouI7yggZqFGbW2EWNck=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=T7VmEuEvMJM3Ejiv6zMNbu9Tc0q6MBJZKZTC6orsBC4gaqbk8MTN7rr2ovocXQw5RsVS+7ibKxvBklzetxAJQud8mL7seFcsFBafXkkJ+jwUj3/NUCWnr9JiIqQLRz0iIcFWWMFGAfiYvP9EtdR7G2OsXPRWvEUtSs0wZP2BfXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=IuhMfpFJ; arc=fail smtp.client-ip=40.107.103.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A1H+R64PVZnOry/q3YsfxL/wLqysoecKDuDAJ8wm/hxFsQ/AXp1JWgozhW+vdOmsUMlO/tIW/eRHmS0b8PJjN59mKkLLszk09PjzB2o4Q6Qcq511Kxzx2/Jb8Qu7NKVlguh22RJwp9l9Q7dkQVLXguFPkZyCjQtvgBRLhnW30V5ww61GmSarZwebFM6ulPqeCT3o/JXn3l3Bl6y1hpQjebuFNA6FsQenCEx3CpjvvQKa++BZYwUoIPOntbyFs3NOpYIkBWwRfwMRPloEl/TELg9fTbViCxIhxFGZgrSNzJ2KCc0j6JvJcbg0PpsXC5ISuB3w3ONh8yNaaRxQu1CEKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7UH294YTHaXPN875qBh/s98FaveyB1pgH+x7IRb47IY=;
 b=qaBWAxU/Vin6x139i6795aRfhe2xUD8LBYS/FHZolraGWNBv+fd4eo/hrHXlu5YdKEVwshULsUjsTOi+dz3z/qFWIwkP59NXB4fu8O/LFOtjmktqFUThBFyCEhHkLOXhgKwlliFr/IAv7WDpq5ijRIHuxUZQxXe3bcKVSuvlaMNLxq6+zjcZj2jOfy44w1sOM+OhvP5G+Wh+2K4fymEh6k61rBc82ZrE7WhAvcsW0bDMniR/WIxIdJGzH00IqlSfu2loELpSW/+z3U5JTP9N2j0ukhsHOugcQJwPwAe/PS3f+QSCRkyjXs1/rIV60RFj/Uf2IeGMTbtulluoWb0nrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=linux-m68k.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7UH294YTHaXPN875qBh/s98FaveyB1pgH+x7IRb47IY=;
 b=IuhMfpFJ7ivkXVgfLKYt4dK5U8BQT+Gpdpw1x6yQqxoziDXj6tdpRCSskLs+4B43WftfHGFjesj3U86zGTPuFAloEeXVw8MJBC9yNtp4iXDOp0OCdsYcLoFVL+2loTeu/i68ITAu17xzxc+iLPyFobFZCOwLP9Whju61Ldityi6nJYiH676FqLN3Jokrl9o+HSQj7ntt39h5OOo5kcUGbRgkzWM6jb92/t7Q0rOCsyogul+7AaiNaZ4/gFx7qMpA6PXE+daDuQiJQjpPNW/4SDdO3Wf8IouW3K4HRZ70xc+8cyxlazhoqJPjlLPRYx/cjieAoOhEh2OFPzCy8F0iVQ==
Received: from DB9PR02CA0020.eurprd02.prod.outlook.com (2603:10a6:10:1d9::25)
 by AM7PR10MB3655.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:13a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Tue, 20 Aug
 2024 05:28:37 +0000
Received: from DU2PEPF00028D13.eurprd03.prod.outlook.com
 (2603:10a6:10:1d9:cafe::d1) by DB9PR02CA0020.outlook.office365.com
 (2603:10a6:10:1d9::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20 via Frontend
 Transport; Tue, 20 Aug 2024 05:28:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 DU2PEPF00028D13.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.11 via Frontend Transport; Tue, 20 Aug 2024 05:28:37 +0000
Received: from FE-EXCAS2000.de.bosch.com (10.139.217.199) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 20 Aug
 2024 07:28:31 +0200
Received: from [10.34.219.93] (10.139.217.196) by FE-EXCAS2000.de.bosch.com
 (10.139.217.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 20 Aug
 2024 07:28:30 +0200
Message-ID: <da37da1a-6f33-4820-b909-ee2a959326a6@de.bosch.com>
Date: Tue, 20 Aug 2024 07:28:18 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: serial: sh-sci: rx overrun errors and hrtimer rx_timeout?
To: Geert Uytterhoeven <geert@linux-m68k.org>, Linux-Renesas
	<linux-renesas-soc@vger.kernel.org>
References: <CAMuHMdWJT8-hUWrbQEWM4Dj_rJOxvCcUpksL_8EKn19MEstnmA () mail !
 gmail ! com>
Content-Language: en-US
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <CAMuHMdWJT8-hUWrbQEWM4Dj_rJOxvCcUpksL_8EKn19MEstnmA () mail !
 gmail ! com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D13:EE_|AM7PR10MB3655:EE_
X-MS-Office365-Filtering-Correlation-Id: 3017d226-0254-43dd-834b-08dcc0d8f15b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R2tsRHVpOVh2VGpiK3JoZGdyVlkvMllDUmhVUHFZU1NnNGs5WUswOVovVTdX?=
 =?utf-8?B?bVRXMUF3UlZxdm5ub1hNWGczbmJ5R0NiaUdNQTJ4Um9qSVRHMXdkelA0QU9m?=
 =?utf-8?B?Q1pMd3FQY1VOWVZNbU5OTC93TXd4Z0Z1UVJMdUxaamtKa1RDS21JbmpuQk9U?=
 =?utf-8?B?aUlKNkxVQnBHaTdFenRudTE1UU9hWEo0S1BIdGl1QlB0Y2FIakVBcE95Tkl6?=
 =?utf-8?B?emM5aUZkWDBlNnlTUnFTSWprK0M0WWVEbkczSitzc2orVnJrdC84RXZpcTV2?=
 =?utf-8?B?WWJIaTYvY2p2VW4reTFRcGRwSlNka3ZDOWpzRUFIWVQrRld5T3NJanZSdlA5?=
 =?utf-8?B?dmpNU2lKWit0NmkvbkM1UmJNejJuUWRwWWY5UzEwSnBkTURiZVNsdktwUzl1?=
 =?utf-8?B?NEVEUERwRDc2TjFIWGNOY0RHcE8ySjY3U1hsWW9nWC93bEh0ejJLTmovcHlx?=
 =?utf-8?B?TXFpa01uSWR5bGszcjBqWEVHWEw1SWZsZnZtcVh6QmxKdDdwR1ZGVCtrZ3Vx?=
 =?utf-8?B?RGtiNWNpOWdZTGg4eTVaYkJjSm5iN3hEeUl3Mng4TEp3RFZaYlJFU0JnSlpF?=
 =?utf-8?B?dkRHK2RoZEg1VmxPMDZTakNuZkJhVG0ycUQrc3RSZzY1UC83M1BUNng0S056?=
 =?utf-8?B?N0RYZjZRT2VVRU1IZjR5UHNEa0lEOUZmZUtFekZxTXR6WEtTZDE0a0VTUVI2?=
 =?utf-8?B?WEhJd0Z5SVU1YUlNajJaS04zbTQ3NVlZb1ZUOFlEb0kyVzFFN25CTlR0NnVJ?=
 =?utf-8?B?MzJlMXR5R0IzakJEbmdnZEQwdWozc0hTb3dzTVFQTGV2d0FKcHFGakkzS0Fw?=
 =?utf-8?B?alU3R1JhTnJRMnZJR2ZFU3dDcVBkdkh5K1NJRkswbVI5NURnUVFwMGFKaDYv?=
 =?utf-8?B?LzQxMTladk91bDY5bTBaSnU5QVp1eUZYU01nT3NQUzJHbEpHVVg1cnRURC9z?=
 =?utf-8?B?WFpCOWVweHVGdlBKcTdKT1dtUjVYUE5CM2lQRG9Mc2lEUllBK2JlT3BpbUFy?=
 =?utf-8?B?L0Y3OGVMRWduL0p1WkhJSGNPSlYzQ0I4eG1ZTFlkaFZycnhLeWxWdmJSWG9m?=
 =?utf-8?B?ZDE1Um04MWZkczZUUVh2YWVjeVIxL3ZjRDg3anJHOTdWaHhoVUU2WkVzN0R3?=
 =?utf-8?B?d05xMVplYnVQdnArbUJjK0JhaS9SRCtYNVVoVnhIQURpdFRZRkFOOWhoUDhJ?=
 =?utf-8?B?YVgyK0ZWRktFeEg2Zmp2MG4zNWFRWHc3S0o4K05yNmt4ejlxTW5WQXl4KzN2?=
 =?utf-8?B?bk1ITCtuNmRNZW1qZFUyUU1KZ0xZZUcxRyttWkpydGNocDhFRDNsYWFxZXRU?=
 =?utf-8?B?Rk1mdURTMGpkQmZWekQ4VFJVd3ZGK2hUYjlkay9kU1FaRGFSOUZ1QTBydlJn?=
 =?utf-8?B?UzhoMFA5NzFBK0FWZkZnUmRNQjlLMng3ZkdPQVZSQWhJbHRVcHJGMDh6THNt?=
 =?utf-8?B?aHFCS2dydEdqVkpnUUJWR0E4c3QyN0dJcFE0Vy81Y0ZDdUlXT0RKTjVFb04y?=
 =?utf-8?B?S0dibnp4NWh0cGtDSkZmaDJVUnRsMTdLMGJYUFkxOVRESTNqTE5HbmxXY3R6?=
 =?utf-8?B?djVjNUVJQVJJeVl5Y0xSckp6Qk5nZjBOYW9Od1BHSGY1djllOTNDaE9CTk9a?=
 =?utf-8?B?TGx6OGI2ZjgrZWd0RUlqY0svcHpIQTBHazBGV3NMM0syOWUzeXhwbm11dkZD?=
 =?utf-8?B?aHg3TER2VnlDK09XY3BpOFhpUHBnalRzb2c4T3ZsejRjWWtBZ2I2K2laZmVX?=
 =?utf-8?B?Q3hhS2RaU3llb2pMN0l0VmJmSmdROUVmbXRNZFRiQXBybUswTUhwZ2VDQmRw?=
 =?utf-8?B?bCtoOUo5R3Qwb3V2OGhYdWFiWUJUVzVDZDB2enRvdmJTL25xdCtZd0hTMU9R?=
 =?utf-8?B?eXRnNVMyWUM0ZldnOXdKbzdTbVAzWGNWc0syRFlBWDNrM3NCUVFYZnNiVFBK?=
 =?utf-8?Q?UiwYXX8S+2cjIxKGM6yBRjd8ZIHy5mTB?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 05:28:37.3605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3017d226-0254-43dd-834b-08dcc0d8f15b
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D13.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3655

On 19.08.2024 21:26, Geert Uytterhoeven wrote:
> Hi Dirk,
> 
> On Fri, Aug 9, 2024 at 9:27=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.com>=
>   wrote:
>> short: What is the sh-sci rx DMA hrtimer configured to rx_timeout good fo=
> r?
>>
>> Long story:
>>
>> Using drivers/tty/serial/sh-sci.c (on 4.14.x Renesas BSP) what is quite
>> similar to [1] we got reports about data loss on rx large files (test
>> case rx 1GB file):
> 
> [...]
> 
> I'll answer the short question ;-)
> 
> When RX DMA is enabled, data is received in the RX FIFO.  Only when
> the FIFO is full, an interrupt is raised, and the data is received by
> Linux, and passed to the next layer.
> 
> So what happens if less data is received than the FIFO size?
> In that case, the data would be stuck in the FIFO, as no interrupt
> is raised.  Hence a hrtimer is used to make sure Linux receives data
> from a partially-filled FIFO when no more data arrives soon (within
> rx_timeout =C2=B5s).
> 
> I hope this helps to understand the problem you are seeing.

Yes, many thanks! :)

Just fyi, we are currently investigating two issues we are unsure about:

* It looks like the hrtimer is set to *exactly* the time the data would 
need to fill the DMA buffer (?). So if the hrtimer is started *before* 
the DMA, does the DMA have a chance to finish successfully at all? Need 
to check that with some traces ...

* Due to high system load it seems the hrtimer handler and/or the DMA 
complete callback are delayed. What might explain the overrun errors. 
Need to check this as well ...

Again many thanks for helping,

Dirk


