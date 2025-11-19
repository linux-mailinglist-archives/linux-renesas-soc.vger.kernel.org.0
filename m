Return-Path: <linux-renesas-soc+bounces-24765-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3E3C6D5AF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 09:15:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F0B393A1D39
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 08:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14578329E59;
	Wed, 19 Nov 2025 08:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="P0rQ/3D2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012013.outbound.protection.outlook.com [52.101.43.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431472C0298;
	Wed, 19 Nov 2025 08:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763539352; cv=fail; b=Z0Z9WcTIqKEErBkWAA8BzKpagg67z54g70N3D+stfVtibOvD8fRjiuJ83Lk6ug8K6Z92Zfv+sM/IG+oRZLdfFogd0NuJfZA6kxu+RGeCfiYdVYaWGq7KHCvfvYCqkX8USt6UlJkoeWfv3lGYAnMeSN1WbYb/PykK4PHUtLQBjiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763539352; c=relaxed/simple;
	bh=DzALetMYRuIFfi8+MRUnOTQOx0pH5gtfI0CWVACwcoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=m3CTycTPgPxNQjd4LR/8BEsW4h6gCzhOGaBck26YRUwGd+dEHpv7h0MdVE65PHsw/9ZioAvMGpieMXbW1DGydba46Bxszedfb8G4XLEeWU+4IkMqx/ivX8wZAgHovtcq0k+FJpF753TKQdng3jDdNgyzKitGoqXNzL8pKQFMx9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=P0rQ/3D2; arc=fail smtp.client-ip=52.101.43.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FPhiSLWDVpGtVJ5C8SEN3rCb92x4Afa++qHnckIZFKoEk76ZoOguKTjW0IKoy0++VYQ280JdYF9HPlhY4PmPZC474OgoiEXjs9OrmBwQWqn2yGq6lzsVNB/xDmBtFZkoHqGaEDJhOQ0l//PmArniMJABllvhUjfG/QrV1OVLa5rpx0zYG2RlGy/AFe1I81RiFo3EdjPhxyPgYqjp1ZDNuTSiD7b8dtRAh66YA0PzG16Bs0CkIgA6S5pTcSpRwR887sgIbf7pOQcntVnQEmGi7xTOQLoRh7vyCiafybpGEAlRRu50R2XEtMdLpMZ9SZ5+aP41Y7VsZZny6zDQ02anJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13mY2eR7qW6Vl38zuwkOzuD9Ee+NuteGwGb10JK1zbM=;
 b=LJIg0sX9sGmukAUxwYtddwrjg+EoaGM3gwFJ96s7ue8o4VJnYFvR6FY/s/nYZ3wq4r0jZ72lyiELcrJgmG/Ntag3GUslt/0pMybJJhSVoAuNPhYOfjrcBvA+k6ybht9MeS16DfnXkNl4nGxENARq8epgAvTkskYbpf0sGT2uUvLdH73MmjKVPxLcpc/iPBZ0X8OWDVLDTGxY6RjmEPGjh64t9yex6fCH5go3/eRQPKm3iOsz9r6+8y3NqoJ2KlJPwTPPar4woItdrk2tydfjPhrcvmcz1lYNToj7LEwA5f10PMMmYHkgAbO3bUkKo9059Ip2rKpC3ROq0ZKOtNEV6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=ti.com; dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=ti.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13mY2eR7qW6Vl38zuwkOzuD9Ee+NuteGwGb10JK1zbM=;
 b=P0rQ/3D2BSW9PHk2FN8fHrWgYq9mEqeeGLd/YGN+sxs3h4fJ+8aBqRe872W01bHXPy3jbmAOLhei1EaXhAA1rLYIZhqByW6U7IAbSIpr6zNNVpthXEfywYI02wRWncECEPlc3cqZFcXB6WGFva0w2tqwj8TuILD+p6uU3C8AmSc=
Received: from DS7PR03CA0018.namprd03.prod.outlook.com (2603:10b6:5:3b8::23)
 by BN0PR10MB5190.namprd10.prod.outlook.com (2603:10b6:408:12b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 08:02:26 +0000
Received: from CY4PEPF0000EE3B.namprd03.prod.outlook.com
 (2603:10b6:5:3b8:cafe::6d) by DS7PR03CA0018.outlook.office365.com
 (2603:10b6:5:3b8::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Wed,
 19 Nov 2025 08:02:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000EE3B.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 08:02:26 +0000
Received: from DLEE100.ent.ti.com (157.170.170.30) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.2.2562.20; Wed, 19 Nov
 2025 02:02:25 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 19
 Nov 2025 02:02:24 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 19 Nov 2025 02:02:24 -0600
Received: from [172.24.234.212] (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AJ82JXv1541040;
	Wed, 19 Nov 2025 02:02:20 -0600
Message-ID: <4c787312-2340-437d-9d52-9917d29e3eac@ti.com>
Date: Wed, 19 Nov 2025 13:32:18 +0530
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] remoteproc: Use of_reserved_mem_region_* functions for
 "memory-region"
To: "Rob Herring (Arm)" <robh@kernel.org>, Bjorn Andersson
	<andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, "Shawn
 Guo" <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	"Pengutronix Kernel Team" <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus
 Damm <magnus.damm@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Peng Fan
	<peng.fan@nxp.com>, <linux-remoteproc@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
References: <20251031175926.1465360-1-robh@kernel.org>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <20251031175926.1465360-1-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3B:EE_|BN0PR10MB5190:EE_
X-MS-Office365-Filtering-Correlation-Id: fd28589b-aac0-4d78-3f7a-08de2741fab5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MW1LK2J3MVJ3RDF1cm1qNndudnJSd3BaNDNzMnl1MjgvSzBZcE5TMGRKUUVM?=
 =?utf-8?B?V1hCMDlZT09ncHl3MDBReUdGVXlFQmdvOFhFUCs0dElhS2M4dHcyT1VSeGQy?=
 =?utf-8?B?T2pIRk1kN3hIR1BRcVVtbkNLbXFqdG9ISURhSVJ0TXNtSHM5bjZvNld4djVP?=
 =?utf-8?B?dXBkemdMc1p2eGRzNm5ta05hYWNwMDN6cjVwSUtwU01ZTEduODJMZ1Q5eUJJ?=
 =?utf-8?B?ME9CQ1UrMktrT2xvV085bGpJdG5ySVNHV0IvTWZOT2hFbVJ1UllqZ2VxVzBS?=
 =?utf-8?B?Z1ZzQytsUTdMa0VXRjNLUWR0c21CYVAyYWYyVGhUMUR0WGxCWnRNT3VmMVRE?=
 =?utf-8?B?UEwzN2lHZWtEYnpWOWY0ZjRLSWFHWnF0aFV2ZFJjSlRoVUxjY01hMkF5Yy9C?=
 =?utf-8?B?SGVpdlRmUVAvdmUzNHhiQUF1eWNwcndiT3B5Y3hCbFRmbHNVWGlNWTh4Zngw?=
 =?utf-8?B?NkdGdWtJM0VodXRvSWJCWWRPYm5ITFk2dkl1dlFOMlRIWFgvR1dYTUFtNGZo?=
 =?utf-8?B?K3c0OE9NWUw2V0VBY1FhTU5oUHB6d3VVS0RNTStjUE96MDFXMHR6OVdaT2xL?=
 =?utf-8?B?RjN0b3MxM3BpSVpIQXJnVXhqMkM4V3M4eit5dUVOSzBKRS94RGR6NzFnUy9w?=
 =?utf-8?B?S29hTzBkLzNXbUlwYU5ieTU5YnJOYzVKSkMrOUp5dUZyV2FLdVpqZmRKTm5X?=
 =?utf-8?B?Tkk4K2trendJN3FnamtQSEIrSXZaZHRZMFdWM0szZVIrUVQ0VUJqYjVNdE1U?=
 =?utf-8?B?REc5dDVaZnptd2c5YUZvY1UxYXFqUVpQZUhKOVUrTzAvVjhSbGNKcWZhK1J5?=
 =?utf-8?B?RkFBajlWaVg1M3ZubEJGaHd5MDFFVHNEOHJCTXk5WWZaTTM0UjFmazhoL0h4?=
 =?utf-8?B?a3orTXV6NmI3amF3amRud0E3c2drNFhvT3AxVzBMdE9rSUFTbGlzZG9Jd00r?=
 =?utf-8?B?ZmxlTm9aTUlEUmxMVDZVa0lZODZMQTllYmpyQStFNndrUEhudEpGcmZYZzZE?=
 =?utf-8?B?dytpcW1wd3JvbzdoZUYzaGhhZU40aFZhN2RVRmg3amxvLytwWXVoOGJjQk5G?=
 =?utf-8?B?QVdISVRNVmFaSVErWVRaZmIvMkVxaFJwbnJscUk5a3Y2dXBIUDdQcHFKbjcw?=
 =?utf-8?B?U0Mwb1ZxWk1rQlRNNFBLTzBzQzFmbjZXQ3VYRVpLWHVNdk41MkhhV2NjRXBO?=
 =?utf-8?B?dlJDUlcrSEtwRmV4aUYreExjSFZ4aVRmWXVkSS9WQjRqU3hUVVhiVmtvOXZP?=
 =?utf-8?B?dVNXMUdoTjh1bFFKUy9EbTZSVEx3MWlZVVUzMHM5aGdiMkE2bWcwZGh3cVQ5?=
 =?utf-8?B?R2ZVY3krUG1JN0pwQldVa0lGWE1aU1M4N21lRjhFdEFiRUhWOTNiaU1ZYXE2?=
 =?utf-8?B?ZVJySUFMdmJ3OEc0UWRWY21XNnNXZlh2ckF0Q24xNVFqa1BFRkFRZ0ZFS3BV?=
 =?utf-8?B?NVBsL0tHakJsbEZySVcvbkdmenZYNzZSa1dUWm5GRmlEblV5OEUxOCtxc2l2?=
 =?utf-8?B?dm9ldDg5ZnB4VnVHMVJ4MHZycVhaZjg4WGdzN3VNVFcrWFVqOUFYT2s4Zng0?=
 =?utf-8?B?ZmZTZGVON0ZkMFN2S0FvT1RJTzFlSDRjbW5BVEg0MU1xTnFQa1VmR0RMaEhY?=
 =?utf-8?B?VUoxWUk4RExlSUt5dXBTMXFtbzJVL3dYWTVpRFpzNnFGSGRyMEtpQnVnZVpK?=
 =?utf-8?B?MUxsSEc5T25jRmQvRVhrZUNXSGVoY1ppUU15N1N3bGhGYktiZ3Q4Qy8rK1NT?=
 =?utf-8?B?aTJzY0tnVHRLQytZM1hRL09WbS9wWkxqaFA1djMrNC92NnV4MUh2cm1ONy9J?=
 =?utf-8?B?a2Zpanl1SnJEMmRTLzRGN1RBalh6R2U3U3cyMldlejQvejFtMWN5UHg0RkZJ?=
 =?utf-8?B?aUVxdUtNQWxxckZOM2N6WFF0VEFNbTlpVjZhaHRLK215NE90VFQ3YWFzNXpT?=
 =?utf-8?B?WFFLOXJRWG5hTm8xTWNKL2l0czVLVU9rWWphVG04VEg4T1UzOUU4TEJCR1E1?=
 =?utf-8?B?U3ZGMG01MGRJQ3BERStBeFJZSVY5OWFrK3hpNHJMUFB3RDJXSHBUOEJRVVJs?=
 =?utf-8?B?L2dMNzU5Y25ja0NMOXpkLzkrRlhtZjhhNDFNdWIwT2w0VFptZnlVRGsyS0ZF?=
 =?utf-8?Q?Z3yX4Xjd9AmQRvgA79tiEGZxx?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 08:02:26.5173
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd28589b-aac0-4d78-3f7a-08de2741fab5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5190


On 31/10/25 23:29, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() and
> of_reserved_mem_region_count() functions to handle "memory-region"
> properties.
>
> The error handling is a bit different in some cases. Often
> "memory-region" is optional, so failed lookup is not an error. But then
> an error in of_reserved_mem_lookup() is treated as an error. However,
> that distinction is not really important. Either the region is available
> and usable or it is not. So now, it is just
> of_reserved_mem_region_to_resource() which is checked for an error.
>
> Acked-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Tested-by: Peng Fan <peng.fan@nxp.com> # i.MX93-11x11-EVK for imx_rproc.c
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # rcar
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>


All of the tests pass in our CI. Feel free to use:

Tested-by: Beleswar Padhi <b-padhi@ti.com> # TI

Thanks,
Beleswar


> ---
> v6:
>  - Rebase on v6.18-rc1
>  - The error in v5 was fixed in v6.17 commit aea70964b5a7
>    ("of: reserved_mem: Add missing IORESOURCE_MEM flag on resources")
>
> [...]

