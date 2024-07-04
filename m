Return-Path: <linux-renesas-soc+bounces-7052-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E861926E8A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jul 2024 06:42:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25EC51F27089
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jul 2024 04:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C36A83BBE5;
	Thu,  4 Jul 2024 04:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="rM5lgkMc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2071.outbound.protection.outlook.com [40.107.20.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FB03C482
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Jul 2024 04:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720067847; cv=fail; b=ADGE1AIpoRjxBdOEC//UhdOmMyeN0S+8GfyZBCzpD9szdS0pRd4RElqPTuMR74cYTQGCmIwSdHCcjCaMD8BY9XiDyXz3nWt3vOulJCj2nCwQeQLPawTY7OSMe/93ih33KjUCPurnDqdowV41qWrdymbE6NDLtO7SAbh6TJheZjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720067847; c=relaxed/simple;
	bh=5Ce288dbdbJvOK3/lKaZDu8ROcT7XeF7elixG6kitXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bDchc6o25m9KuWTHlB2iTIBJrcJVEHYEmrQ0i4NrZwSPg2c1y6uFLRkWpUg8ZBzY6cRP+nOvLNOhhx3cGSNkHq6LGD390VvZUZcXbrjt5Yg5qAJf6knCmcn6KuVWXYQoFv3wQMvki8d81HR9ivg9jqV6q6n+UIx42+3wi84cj58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=rM5lgkMc; arc=fail smtp.client-ip=40.107.20.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AD7nuXAZ98J5izV1aLs4UNjbDibUlJaAmP9Nr+lyGeeirsQfpr0Zha6aQ7hJjn5aCAzDmGaKsOAXAt5dYFV1+zJ23ywQiwdaVGDonkbjhEZK57HQhS/gCP8w2ODXcBhcBx4C3ZKfng01IWD7NcazIX577yrZubwurcRTVxQyojvnmqEhO7HuiNWd8TILuVxl0JfSsLelGaJXY5BucNrgaQd+IFsRNKtL5OTfHaUuqJV5oqSBHTlAwMCShvhaDw+K4ttVWh1mXswMgypoO/mfuKAEVYgDhWNQD7e4KbVhw30qQxaYYBD8B8ZtyOBJ2LDXHl5IZGNh1QMjDueAUwt7BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uhbawmkmYgCZ1MzXqzftNKS8XPZr+cDo1uu7mUtodL4=;
 b=nDRaCwc4DOyO5ssup7VAAnw5npkK7i1QohUNPUDlIH1gHx9GaGvdfuRKvmrSAsxOKBebUVRYhlzlRJFcr9lfVOs8sagwbVUWRcofcEsdNLt88Y3RvTd8iAwc+bzxBqE0pY1tMTSqL6mFbvZQNbd3Uk21K0ik6JFR/IOReRRa/vUJ3bsqFVyGouF2VrpIy/CrG17yB6uG95zJwMuNlYi/Ybf75/e3hwCKjmSLf2hfrx34NcXiV9YwsCZwwu6J5JUbzG9U3Zzp5w7Nrz7801tuWOm2NQNps2q3DaZI7sYGanOu2RDKKM4hcaag+e3zbF+E1Xl8k4hRCYc3Heg2aT5JjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=sang-engineering.com
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uhbawmkmYgCZ1MzXqzftNKS8XPZr+cDo1uu7mUtodL4=;
 b=rM5lgkMcRxti72wcuusSQdYLK2/TNPVbN4k3FvtvP/2lLzcc68NLrke5MGJb/rvTM0dEWEhnnsXAY4K/+dCzks2UCzvJUs/eB/iKI7FKfn3RoTahzn60joOpS7M2qqfGAf+N8P/4e9VRti3HQLvezfxGW5hOp42ici3yH3XHFxZ9onPFBW+N2CX1yZsj3MLWonBtHPScx9iaXjGvXxlC22fAQ6JmeEBcRQ/2xBLQdKy5X+u/qYXKd8iTpsHLehJaju3F0SuP/jlYV0sokFBzpfpw2Tih5iB4ZeVoSLOhpX+lfZuNG4Ul1bLJiZs1ZkIfb3O2+nhNSSfKfIZA8ZofiA==
Received: from DU7P250CA0019.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::12)
 by PAVPR10MB7209.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:311::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.34; Thu, 4 Jul
 2024 04:37:21 +0000
Received: from DB5PEPF00014B9F.eurprd02.prod.outlook.com
 (2603:10a6:10:54f:cafe::82) by DU7P250CA0019.outlook.office365.com
 (2603:10a6:10:54f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.29 via Frontend
 Transport; Thu, 4 Jul 2024 04:37:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 DB5PEPF00014B9F.mail.protection.outlook.com (10.167.8.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.18 via Frontend Transport; Thu, 4 Jul 2024 04:37:21 +0000
Received: from SI-EXCAS2000.de.bosch.com (10.139.217.201) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 4 Jul
 2024 06:37:21 +0200
Received: from [10.34.222.178] (10.139.217.196) by SI-EXCAS2000.de.bosch.com
 (10.139.217.201) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 4 Jul
 2024 06:37:20 +0200
Message-ID: <06dfec0e-d388-4a86-9ab6-3bba402b877a@de.bosch.com>
Date: Thu, 4 Jul 2024 06:37:03 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [RFC] i2c: rcar: Clear interrupt registers in probe()
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Linux-Renesas
	<linux-renesas-soc@vger.kernel.org>
References: <ZoT7iM2DJG1p1GB1 () shikoro>
Content-Language: en-US
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <ZoT7iM2DJG1p1GB1 () shikoro>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9F:EE_|PAVPR10MB7209:EE_
X-MS-Office365-Filtering-Correlation-Id: 25e51d8f-188d-4cee-7bae-08dc9be2fe7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a2lRdjF6dkN5dGd6OXdCcStGZGp0Y3JvN3A5SkNxcElBSSs2Y2U5ZjhyRU9B?=
 =?utf-8?B?Tzg5ZUFDS0RlOGNSWk1la2drbjc5UTFjNzVEeGhJNGM2WGpwTGlYL3RMd2Zy?=
 =?utf-8?B?ZHN3MiswVjNnTGN3bVVVSzhWY2xXMXpkdkQxZVhveW80amVrWnhyNGJlVGRD?=
 =?utf-8?B?c3Q1VjM4S3RuRDJxU0xJZzlmNWIrS0NNWWlkTHdLMVRWQlZVU05LVnFMVFFt?=
 =?utf-8?B?cGEzNVNxaDNLWm8wVndHdm92eW1xaEs5NHpMSERtRjQyZGYxYnMvMEw1YkxM?=
 =?utf-8?B?S3MzY2E2T2ozTDdCOUx5ZlduOGJhelZiK1ZzbkJ5SDMvT3lvUlhPUXhUYzRJ?=
 =?utf-8?B?TG5EMHJ2dDdqMnVONUw5bU03Q2dOWWZGK3R2ZmNkd0FRVGxnOEdrd0NXZG5Q?=
 =?utf-8?B?dHQ3eE9ReHJMRXVIQ3B3TnNGVDRCMHVPMDB5UjllaDgwTll0WkxQcDNqMzlU?=
 =?utf-8?B?aHRmWjVEdEd1NGpLbzdtRWVTM1grZ1o5T3gwcis0ZGhDL1J1V2x5OEsrNUZ6?=
 =?utf-8?B?bEhoWG1jTEo5VUdBcjZESzI0anNQT1B0L1h6NzBlTXovS2pEekp2NDJYSExB?=
 =?utf-8?B?M0R0TFRYeTNlcVVlTzlWM0xKa2hSS2l3UFUwUEdVbU0yNEtEc3dqK1Y1cW90?=
 =?utf-8?B?SmRnNEVqZjhoNElNWmd4WUxEYkwyRVpDRXdDaTJMMW4rdW1RUXZZOFNzZENx?=
 =?utf-8?B?ajE5VTZUd0NkQU5CWmRUYktlZzh6d3ZubTY0aG5lYTE4UzRXVGF4bmZLZ3gz?=
 =?utf-8?B?SHJod2VZYUtCUE1iVVBOcUZRSzcrUGNNelB1dzN3c2g1ZFQ0S3YvRWRXbjBp?=
 =?utf-8?B?WHJtWjNWNS8vdWJqbk9hNm9tZkJ4WVZwOWg4ZGRxcnJCaVpSdmtGWEw4ZWhK?=
 =?utf-8?B?YnhvMldLdnk5Tkt6eEllWm5aTGl4TUU5Y0RXU2doVlBmajFRWFhMa1J3ZWFD?=
 =?utf-8?B?TWhaR3NpaFJOVGExeUQxM0RVOWc1MFFKNUprZTN3a2hYa0VSMTRPRGhpVzVi?=
 =?utf-8?B?ZzUrT2p4TTR5YldjZndseUdLZEVaNHVZOUFWa21uQ2FBbUJUNTJMRHNoM3Bj?=
 =?utf-8?B?MmRwL2ttVGJoTmpZUytyQlRVcldTNWVxampIak04S2QyQVpaMzJLU09sUDFL?=
 =?utf-8?B?R1QwcEYvU0lPNCttQjQwUm1jZGxWUlZQKzlETVFCQ0ZWcGFOMlpxcnVHTUNo?=
 =?utf-8?B?N3pJdGpoaitUVWtKWjM3aEliSzRXUDdGNzVRTEliUzRUZUdPdzc5Y0MvWGRZ?=
 =?utf-8?B?Y0lSeVN5WEoyWSt4NXRMbmhDME9DM3o5SEExZGg5RzAvSVBZYmZqZlEybVY2?=
 =?utf-8?B?R3ltMGJrWHZGUjZYeWtYalpRQjAxdDcrYWJmV00zczVEbXN2Nzg0QkV6dDdY?=
 =?utf-8?B?dEhXNitLVWNxTEczTG1lMmdHMzZ3M3IrUHJpRGRwM0hDanNlR0pDTFhEK2pI?=
 =?utf-8?B?cGFpd0JWSXc1TmNtcEpyUG1yV2RoVUVrM3pkMk1UVnJVUU9DN2VxN2J3TS93?=
 =?utf-8?B?alJtODBPcVdmRVRXZXNzWnZnTEkrUnJMUGZJaXR1S2JEM3hsdW5mL3pGS25U?=
 =?utf-8?B?dDRmYUZmV29oUEV2ZjVNU2NadEhaOExsSWhoRThFNDdwS0svSXpNNUh4V0Zw?=
 =?utf-8?B?Mlg5ZGdRR25nbjBZNTFIdDAzMkEyci9CVDdWakcvQ3lFckdOaUQxbllnc1ZM?=
 =?utf-8?B?QnJUK1JVYndWcnhNdkpmVmlueDdta1NBUHBNT2Z6ZkVBQzNNRVBxNzIwcUNi?=
 =?utf-8?B?NVFLNWM3WUNzeVNPdjAwS1FXdDkxZ2Z0SjFPYkE3YzllRHl3T1c2TUxXTmZv?=
 =?utf-8?B?KzBXOVVpcTNNbHIxRGR5RDJiMUJoY1d1SnovMzJ0bVdyQTQ1QnVSZktiNzBU?=
 =?utf-8?B?QW43UVYxYi9iQWV6TCtwejdPSWpDUm80eHJQd2c4Nzc4cWYzVEI4cXkwM0I4?=
 =?utf-8?Q?mcV7zw0KcMWMo9vsib1Fyg9uFDjKtzLJ?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 04:37:21.3093
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25e51d8f-188d-4cee-7bae-08dc9be2fe7b
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7209

Hi Wolfram,

On 03.07.2024 09:19, Wolfram Sang wrote:
>> I hope it is okay for you if I send a "counterpatch".

Yes, of course!

> Sent this now. Please try it if you have a chance.

Many thanks! Yes, I included it in our testing image, already. Due to 
vacation season might take some time, though ;)

> I think your patch here might not work because you write to registers
> when the module clock could be off in most cases. My patch should be
> good there. As I said, proper testing scheduled for tomorrow.

Best regards and thanks again!

Dirk


