Return-Path: <linux-renesas-soc+bounces-29637-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wD0XBBmXuWkJKwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29637-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 19:02:01 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C54AF2B081A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 19:01:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 395A33031360
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 18:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6799137B01C;
	Tue, 17 Mar 2026 18:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="wgdXPT/l"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010034.outbound.protection.outlook.com [52.101.229.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622B830C63B;
	Tue, 17 Mar 2026 18:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773770515; cv=fail; b=LoZdYSoepEo3M9iI1bPmFrhW9cusa/ZLt/t+GG/c9yDlmTDN9bay4M8+Z4l1VCr6tt16MQPmBYMR8kbpzICkTzs8aD2GplllDpEFq2EvY37hOKPiXTgpxSCo70MLfCXRcZCwOCgYy3eBFTvJhgIEBfUeTofP7pF+FJkZhL+piO4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773770515; c=relaxed/simple;
	bh=IT/fNqkIxOieeM4WXUh+KgXzkeLDCdazbG+q+1LpW9c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Us/PLN9QasTTGn0GNSRUKwQZ+J/Jbuz1SaOe+jQBtxih3WUweeLvOHLMQ/bUEEndqcxhhYxupDWZ7CXXJuxK5zCk36kwEX7MmjwGDCdOYzm4HvBoEcU/Z1zMmAeBCOPkU1EeTHW90Wq+H6yl0D+N1l1piXJx8LuTiu60pd5cJe0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=wgdXPT/l; arc=fail smtp.client-ip=52.101.229.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wN+Tu4YB5TfZCIek/lyRH3uAnzsE3SN0hV87ChAnHTCWUWkIjADVMUbGIhtqjw8OcVayd4Vd+HE9PLJ6blJh1/dC7EEiVLONoYvvIvZl4yQSVffK1IHGirl1LyHZJ6W3Nb8U606cH3OHel5VhOE2eUwMRwGvZlC/1SWozqf2bPbeaSFWSkgv0Cf0g5hZuGG5zIdaozgzzqScajYNS1ImPE3JeABCnVh0Y8bnx8snWP1irsvh2eggvkgiKDiAsn3fiCT+t76/vtAKjkSW5/fzjv7I8N53DPjyqJhyvUzpX/aMbmcQ6dAbxleOwvQTH/RlAkfWjTD372XuhXy86B7F9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=129xc3EnyzW74bfbzzhtDctnxvee/06sCU8s2Hqnhz4=;
 b=gYImkJwcID66IVIysuXNFbJDcfjd/p35fwqX+5nUw6Wfa4gAP+nQ9TCKQll5uQBsWuYMzG0pL+ndb5JDZtor5soDUFzwBGYVp+kj+7STVkuubloZTsWXeB4jd7cUar+mikPmyx7+QTYD1y0fH0pOyH9RWEQz9Yh6MMObWAoKhD6fTgMjEU7os3sfd0ddfbNJQbS8rHZ/t/HlyP3nzwGEd7ze7LLjK+FX+JWQbJZaCfFJ89oborHl/kTSDxTMPirsOzq/15vW52SvxBH+44o/Q0xSnKYkvZiXEXluOK1wDBX69L4DnbXR2gTFvizl0OAecG/AjJGvjSYdoskSgEuBcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=129xc3EnyzW74bfbzzhtDctnxvee/06sCU8s2Hqnhz4=;
 b=wgdXPT/lrPtPp4X8l01LtlHZL/uKFoHl55aCEpj1lqkpYyMjcNuWGDLJoRFUce9dzoUqNzbccP81wQ0z5bWsJT7zixprjmay5COdwCMbHuoMUn7iJB8JjrsmAOfALGEyQ9AJuB8Y/5r7rNPutGq156Q9ygNVJfASQ0IqdKNBTVI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY3PR01MB11948.jpnprd01.prod.outlook.com (2603:1096:400:409::5)
 by OS9PR01MB14066.jpnprd01.prod.outlook.com (2603:1096:604:35e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.19; Tue, 17 Mar
 2026 18:01:46 +0000
Received: from TY3PR01MB11948.jpnprd01.prod.outlook.com
 ([fe80::b718:17d0:6c0f:1495]) by TY3PR01MB11948.jpnprd01.prod.outlook.com
 ([fe80::b718:17d0:6c0f:1495%6]) with mapi id 15.20.9700.025; Tue, 17 Mar 2026
 18:01:46 +0000
Message-ID: <ddad817b-6c20-42fc-90ed-3b841b3e8ce7@bp.renesas.com>
Date: Tue, 17 Mar 2026 19:01:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/20] drm: renesas: rz-du: mipi_dsi: Add
 RZ_MIPI_DSI_FEATURE_GPO0R feature
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>, geert <geert@linux-m68k.org>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, "magnus.damm" <magnus.damm@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
References: <cover.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
 <d1f47b9719edab4e85a8971020c7d7f51fff39e3.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
 <TY3PR01MB113466CEA27DC0486501E89C38641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <TY3PR01MB113466CEA27DC0486501E89C38641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::17) To TY3PR01MB11948.jpnprd01.prod.outlook.com
 (2603:1096:400:409::5)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11948:EE_|OS9PR01MB14066:EE_
X-MS-Office365-Filtering-Correlation-Id: d945f150-ca27-4067-27f8-08de844f40d9
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 z91HyX15ptJW+GtDnCfvhXPKx+9vbnmRhFksel9A4LVslrnYi57G2hGGsAqlFK4Zx2DAfEvWP+h0CpodZBY/3OC322AIot4gW94duM6+5+g4F2CrqOo29UPxlF9DM6rriCk+ZUb+pCwnG1tPPDn+P+EdXO4R0x8BKLPs0K8Th8mMukXIZWAFYcn3m7s/YKDWz7tXaA23U3pmzKheZDpX/9bCVd6w6Gi5mp7yHXZSIylrcC+gl5n7AJVFKCio8jTfCa8Pal6qMH2zOEVJAheaBkrlJIXXSE3502prazSMOCuTsLS9NejquhukHmSs3Q7sMrbSukwVfNeorRWgZkCvgWzcW9us6rdfYjMJpyUiL6hUswkS8cSpDO4eJ/NlQsrVzK+ZYqWZ7w7C2K7eYaEPWARHY4KNJfzSK0ldIMi5ZLEA/pPCm+T38cwI4qDEiCYBaC4//sqxqyC8Lr3LIBzWzjR246vu5pcniUTnlalzncAi4PoT6yyFKd84x5LZVeY9zDv/tcGKeQID5fzUhw2qgfg3CPCfYZ3ftHWHDqcJuT8cf0xYtENKfbg7EaVw9lGbl48YXggQF80eZIsJNGe1hiHbIBuFvEfwqWiG2r9z5BSFrBlaMcvW8gwfkxP40jNNFgqnfpZOOSg75Eg0B/JsuT0THE/6bbNfMQkbgZ9vW/8Ss/RmdYr4TT9muR5zBObp1RXasIiUmrYoDNcTIrg/zNtSkGX/RGL/lPcHeukJ/G4=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11948.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TUtXVWRNUU56Q3EwcmVLeTV1K1ZFSmFZYWIwcmNWYXhFNmpYcW0rdlBpMzRR?=
 =?utf-8?B?djN5cTl0RDJmVlZ6cmhnbHZ1RnVnMkh3eWJkSzVNeWQreVRVVzhMS3hIRXow?=
 =?utf-8?B?UXVIa2s1TkNGcXFIVW9PUDhNN1NNd1hYYVlHWkdDZzdvdk9YcVlESWtsejVi?=
 =?utf-8?B?ZXVEOERYaEVoTzVHa0FpRkpBYWVYcVlBUndPZjlYSUEwQU1wclF1M1BQSit6?=
 =?utf-8?B?d0lwUjRQajk3QkZOdm4yK0NVdktqSWRhYTVNakNsNG55TFlHOUhZZmt0UlVn?=
 =?utf-8?B?cE5QYUI4dGxGbXVhV2U4Z25PUjRIQTZFK3picU96bkZmbFhTVVRFWVZFUmxG?=
 =?utf-8?B?TThuME5BRk4xMFNzSnRSOThZN21OWkFLRmhGM3hRWmZlMCsrSTZtTTZQOTJ0?=
 =?utf-8?B?M3I0WkNMaGlBcm0ySHdua3dBeXRXMXdPOTVHMEg3YWErL3VSeEd0Y3RFNEVm?=
 =?utf-8?B?N0hlMFJwTWtibk5peVBtWU1TR3lHbXZLZWxsK2VCRnQwUXdhL0NwazdWRHl1?=
 =?utf-8?B?bVlaSlo2KzdXQ0t4bFdJVUZCRHRPNTJ1Z0srTGFYOWVmYzd6eDVSQ3l3Z3J5?=
 =?utf-8?B?Mm1Ya3RhajN2TlcxSWx4K1ZCbzlxQnJnaFMxcjdtYUxIRjYyWkR2ZzRIN2ov?=
 =?utf-8?B?UkVreGhaNFhhM1YxQlhIL2tjelAyY3ZQRzJPWC9xTkhCR2lKc3g3LzFrbzBt?=
 =?utf-8?B?OXp1YlNMU1pNZExYMDJlT2hrTHpHRHh5aG5LRlBjcnQ0WDBnTnNoaTJ5TU8v?=
 =?utf-8?B?VDAzOG5VUHlIb20vYWgwK21SaHJRYzNZdUJPc0tiN3craEh1RHZTL2ltZHZQ?=
 =?utf-8?B?c2xlTjVrc3JubklRMU5vbTl2d2xtdlYzOTZjaTlmQWhvejJSZjZlcVVsdDVx?=
 =?utf-8?B?WFF5UVA3andKWHhuQUd3SEhlU3c3eWRIZ0Y0c2xVaXNyMzRoVGlPcTBKNHZl?=
 =?utf-8?B?azJkV3pXRGVsd3Vnb0dUb2xldVJnRnRxRDM2eldSMGRXZWR3dTc0aElBbFkz?=
 =?utf-8?B?NDVWYzA0MFhGNmxQTmpjbTVRMTMwOXJxZ1Iyd3hpbnprazhFZTMvekVRRS9v?=
 =?utf-8?B?aUltbnVLMVVIUk1iZTlrZ2gzeDNtSjg5MDhMQTRVMDFVc3lLdllzRE9hcWc2?=
 =?utf-8?B?a2g5cFQvMlZmZUJ6eTZoRTFITG9HZG5Zc01HNzF2WVBWTWl6VXkxR3FVc3FI?=
 =?utf-8?B?VkNDaUhFK1k4Y2V1SE9mNzlPRWJxNmppdGlaQktoaEVEd05aQlJBZHBuS1hm?=
 =?utf-8?B?cFlXSjdvUXBkQzNPbXZEUFJlL0FpelNQdkhYMHNMSk9icENINUpkNmFtNXJK?=
 =?utf-8?B?NnRnemVab1BldGVJbFJOQyt0UzNPYWJZWVhtdUtxRTd1TUtQbDlweVo4a3pY?=
 =?utf-8?B?SS9JSXpGUEJDcUsybmFMNlQ5Mzc2a2NPVkc1eE03bE80ZnUwelY5aDh5L3cv?=
 =?utf-8?B?Z3ozS3lya1ZtNk1SdFB0empYUGd1WCsyQnp6L25zdHJPZVVOVFhOdlViVGpm?=
 =?utf-8?B?NFNjNHNJbEJxZXg1TlpXSHdvcGZxMGhXbXUxT2tyY245ems5SUwrRVJjUFFl?=
 =?utf-8?B?ZENQQWNSbDJkbjNweHJ3SWk1MFFHU3BFdEFUNHp5VFBWUUxBSWVLZkROMlJX?=
 =?utf-8?B?MTByS3M2LzRYSFdzK1d3ckM4MkZnNThRMmZSWGdCeVZKcUFDN1JrV3dheU9z?=
 =?utf-8?B?L2pPWDV5Y3RKS05VUFVxSGp6R3FRUFFZV0RBazJHVVBLbHpjUUYyZU10MFZu?=
 =?utf-8?B?MVRMQytZY3lnclVHQzFnT3dBMFltT3VCeEFheG9pQ0h5NTh3d0s1NUZ3bFJo?=
 =?utf-8?B?RzdHUkNUZFVabHJyRkxhTDErYUZyR3RidGlGSDYxblZwRldTYmI5Y2VQU3U0?=
 =?utf-8?B?dElLN2RSdmV2TGtURlA1bEkrdHY1YWx1Z09SL0d0eVhyZXM2RHZuQi9RZ2d2?=
 =?utf-8?B?NHBzSTRNcDdwc05nM2MwNk5ra3hKdlRiM1JHaHBmYU9XckEwR2F6ZTE0VVF0?=
 =?utf-8?B?eUFqZlhraWp2ZkJMTkl0YlNEbUN1NGNUaWxNUnFWTDBKd2hNWitvMTd0ZEpP?=
 =?utf-8?B?Z3ViTnVTTkR5ajQ3NXpnVXR6VWo1OXJRWTVmclZ4MU9jZEVuaDgxYWFGUEVk?=
 =?utf-8?B?NStJbUw0U0NjcVBpbTZQaFAvcEhDRDlXaHJSaWJZNjUyS25BZDd4aE5GbVBz?=
 =?utf-8?B?eVh5MHZBdFJPeGVKU3FWZnpZbTZkTWNTLzVzOHdYL3NGeWJBcTBaVkVLOTdp?=
 =?utf-8?B?WHdVY1hWcXpRc3kzNjdzNWk1NGVRR01sVjdPZUtTTHowdFpWeUhzd2tpeWRL?=
 =?utf-8?B?Y3hIOERCRENtU3hGbnBBZVF6Zm9QbXZsRjZuZ3NBWjRRTHRmaFBZaXVrWXRT?=
 =?utf-8?Q?fP6avAD9cPldhqXZjsTnwjjBf/aNJnaqYhx8Y?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d945f150-ca27-4067-27f8-08de844f40d9
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11948.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 18:01:45.9919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7zOpIjWXjGqg7mOi5RfZLmZxb2VRteZ8K/8zqHSGAfMZyF/G2PbgN3uzDjoKyfnozR458BM14ADc7D0+vV/V13s4So9a7JZovhqzT/qB4XclkCqYdbTG8Z1PVBHfJJoJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB14066
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-29637-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[bp.renesas.com,gmail.com,linux-m68k.org,ideasonboard.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:dkim,bp.renesas.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C54AF2B081A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,
Thanks for your review.

On 3/17/26 14:03, Biju Das wrote:
> Hi Tommaso,
> 
> Thanks for the patch.
> 
>> -----Original Message-----
>> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>> Sent: 13 February 2026 16:28
>> Subject: [PATCH v5 12/20] drm: renesas: rz-du: mipi_dsi: Add RZ_MIPI_DSI_FEATURE_GPO0R feature
>>
>> The MIPI DSI ip found in the RZ/G3E SoC select the video input clock based on the DU instance actually
>> connected using the GPO0R register.
>>
>> Add this feature to the driver using `RZ_MIPI_DSI_FEATURE_GPO0R`, update the code accordingly to
>> manage the vclk selection with the introduction of `rzg2l_mipi_dsi_get_input_port()`.
>>
>> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>> ---
>> v4->v5:
>>   - No changes.
>>
>> v3->v4:
>>   - No changes.
>>
>> v2->v3:
>>   - No changes.
>>
>> v1->v2:
>>   - No changes.
>>
>>   .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 63 +++++++++++++++++--
>>   .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  3 +
>>   2 files changed, 60 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-
>> du/rzg2l_mipi_dsi.c
>> index 8ea8594afee8..35de1a964dc0 100644
>> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
>> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
>> @@ -37,7 +37,9 @@ MODULE_IMPORT_NS("RZV2H_CPG");
>>
>>   #define RZG2L_DCS_BUF_SIZE	128 /* Maximum DCS buffer size in external memory. */
>>
>> +#define RZ_MIPI_DSI_MAX_INPUT	2
>>   #define RZ_MIPI_DSI_FEATURE_16BPP	BIT(0)
>> +#define RZ_MIPI_DSI_FEATURE_GPO0R	BIT(1)
>>
>>   struct rzg2l_mipi_dsi;
>>
>> @@ -81,13 +83,14 @@ struct rzg2l_mipi_dsi {
>>   	struct drm_bridge bridge;
>>   	struct drm_bridge *next_bridge;
>>
>> -	struct clk *vclk;
>> +	struct clk *vclk[RZ_MIPI_DSI_MAX_INPUT];
>>   	struct clk *lpclk;
>>
>>   	enum mipi_dsi_pixel_format format;
>>   	unsigned int num_data_lanes;
>>   	unsigned int lanes;
>>   	unsigned long mode_flags;
>> +	u8 vclk_idx;
>>
>>   	struct rzv2h_dsi_mode_calc mode_calc;
>>
>> @@ -552,8 +555,8 @@ static int rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_f
>>   	unsigned long vclk_rate;
>>   	unsigned int bpp;
>>
>> -	clk_set_rate(dsi->vclk, mode_freq * KILO);
>> -	vclk_rate = clk_get_rate(dsi->vclk);
>> +	clk_set_rate(dsi->vclk[dsi->vclk_idx], mode_freq * KILO);
>> +	vclk_rate = clk_get_rate(dsi->vclk[dsi->vclk_idx]);
>>   	if (vclk_rate != mode_freq * KILO)
>>   		dev_dbg(dsi->dev, "Requested vclk rate %lu, actual %lu mismatch\n",
>>   			mode_freq * KILO, vclk_rate);
>> @@ -764,6 +767,11 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>>   	if (ret < 0)
>>   		goto err_phy;
>>
>> +	if (dsi->info->features & RZ_MIPI_DSI_FEATURE_GPO0R)
>> +		rzg2l_mipi_dsi_link_write(dsi, GPO0R, dsi->vclk_idx);
> 
> As per "9.5.3.1 Power on Reset and Initial Settings for All Operations"
> This needs to be set before PLLENR.PLLEN.

Good catch! Thanks.
I think I can move that into rzv2h_mipi_dsi_dphy_init() before the
	
	ndelay(200)

In this way the call will reflect the power on sequence diagram.
Also I think we can drop the dbg print.

What do you think?

Kind Regards,
Tommaso

> 
> Cheers,
> Biju
> 
> 
>> +
>> +	dev_dbg(dsi->dev, "selected du%d input channel\n", dsi->vclk_idx);
>> +
>>   	/* Enable Data lanes and Clock lanes */
>>   	txsetr = TXSETR_DLEN | TXSETR_NUMLANEUSE(dsi->lanes - 1) | TXSETR_CLEN;
>>   	rzg2l_mipi_dsi_link_write(dsi, TXSETR, txsetr); @@ -1006,6 +1014,37 @@ static int
>> rzg2l_mipi_dsi_stop_video(struct rzg2l_mipi_dsi *dsi)
>>   	return ret;
>>   }
>>
>> +static int rzg2l_mipi_dsi_get_input_port(struct rzg2l_mipi_dsi *dsi) {
>> +	struct device_node *np = dsi->dev->of_node;
>> +	struct device_node *remote_ep, *ep_node;
>> +	struct of_endpoint ep;
>> +	bool ep_enabled;
>> +	int in_port;
>> +
>> +	/* DSI can have only one port enabled */
>> +	for_each_endpoint_of_node(np, ep_node) {
>> +		of_graph_parse_endpoint(ep_node, &ep);
>> +		if (ep.port >= RZ_MIPI_DSI_MAX_INPUT)
>> +			break;
>> +
>> +		remote_ep = of_graph_get_remote_endpoint(ep_node);
>> +		ep_enabled = of_device_is_available(remote_ep);
>> +		of_node_put(remote_ep);
>> +
>> +		if (ep_enabled) {
>> +			in_port = ep.port;
>> +			break;
>> +		}
>> +	}
>> +
>> +	if (!ep_enabled)
>> +		return -EINVAL;
>> +
>> +	dev_dbg(dsi->dev, "input port@%d\n", in_port);
>> +	return in_port;
>> +}
>> +
>>   /* -----------------------------------------------------------------------------
>>    * Bridge
>>    */
>> @@ -1408,9 +1447,21 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
>>   	if (IS_ERR(dsi->mmio))
>>   		return PTR_ERR(dsi->mmio);
>>
>> -	dsi->vclk = devm_clk_get(dsi->dev, "vclk");
>> -	if (IS_ERR(dsi->vclk))
>> -		return PTR_ERR(dsi->vclk);
>> +	dsi->vclk[0] = devm_clk_get(dsi->dev, "vclk");
>> +		if (IS_ERR(dsi->vclk[0]))
>> +			return PTR_ERR(dsi->vclk[0]);
>> +
>> +	if (dsi->info->features & RZ_MIPI_DSI_FEATURE_GPO0R) {
>> +		dsi->vclk[1] = devm_clk_get(dsi->dev, "vclk2");
>> +		if (IS_ERR(dsi->vclk[1]))
>> +			return PTR_ERR(dsi->vclk[1]);
>> +
>> +		ret = rzg2l_mipi_dsi_get_input_port(dsi);
>> +		if (ret < 0)
>> +			return dev_err_probe(dsi->dev, -EINVAL,
>> +					     "No available input port\n");
>> +		dsi->vclk_idx = ret;
>> +	}
>>
>>   	dsi->lpclk = devm_clk_get(dsi->dev, "lpclk");
>>   	if (IS_ERR(dsi->lpclk))
>> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rz-
>> du/rzg2l_mipi_dsi_regs.h
>> index 2bef20566648..cee2e0bc5dc5 100644
>> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
>> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
>> @@ -83,6 +83,9 @@
>>   #define LINKSR_SQCHRUN1			BIT(4)
>>   #define LINKSR_SQCHRUN0			BIT(0)
>>
>> +/* RZ/G3E General Purpose Output 0 Register */
>> +#define GPO0R				0xc0
>> +
>>   /* Tx Set Register */
>>   #define TXSETR				0x100
>>   #define TXSETR_NUMLANECAP		(0x3 << 16)
>> --
>> 2.43.0
> 


