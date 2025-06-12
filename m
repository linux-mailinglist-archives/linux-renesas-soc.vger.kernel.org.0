Return-Path: <linux-renesas-soc+bounces-18200-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD91AD74C8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 16:57:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE48818991C0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 14:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB29A26A0F5;
	Thu, 12 Jun 2025 14:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="JYm3tzM2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011054.outbound.protection.outlook.com [52.101.125.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FC12690EA;
	Thu, 12 Jun 2025 14:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749739917; cv=fail; b=q7EwVtrcF4g7c5y5OBWTQJTCMJ0c403sAAcy3dD5zV6ptwA5cHh2t1sIwTNipMxzVCGVWYoXAHjQjSNu+wrIMjsCQBeUaIpDBOghPTfViey6It/WDB7OC/FdRZ9JXepmpjJCDfEbAZEjJI+my4mcWe/tIS63VefBnAv7thOkCVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749739917; c=relaxed/simple;
	bh=liMcXrUYlThDJNFGikKpDbLx2rPcU3gytAd+AC0R4Gg=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BPxlyxK+xLJKTmtgM5vdxrS8iRLbe7SICmXikIbMqN/KNb5gKFM+PLSSny+9Nr4Jo0D1gQ74+S9FbrpM+x1sb/7uvYH6Vw7dJP+Qr9Jed4XkVfxdn4xP9XhjoOC6inEt9XQpbFxDysTi0CGydzYbhjfk2VKFodmGoL/KTVF2N1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=JYm3tzM2; arc=fail smtp.client-ip=52.101.125.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=msHe7ZeRct0BHdnPTpvk/ZFLAhLo3Vp1VLqaSMVJQ7vUCtkXAAPD4Ka1XUM7FT/5WynQIrzDWSKwU8/aCJfU/THhu8qsWXIxBoW3ZCFEYVR9D4mAFxLW1KcO1ZDnvN8cRVoRN4iiM0v464aDX5s56OotRqfp2SYWX6pLHWbFWsn7lrC4NYT0Cl8fPlKf7xvG6A+uiEuHeTrgTdjF1dk/vvmwtQ34CanH0ok3+94gILsIu5XzfiZHbBYDrVbT6jEqQXW+cjXIHWGf+3iyOdQBosa11sjDydMrJiaKtfZVJJ7aHT3ed9sRkOtYyKvafsU5J1pC3tqo8bDBDPCK8wa2tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l35XxlJyztQ9mowqY72emGDi10z2ulHr1eHfcLWAROM=;
 b=bXJHwRqo7vSBwSV5phs75tGAs21x+P5vbxjNUmIz72BYpIOnH/Ijoti6r/YcWmY4p8qZQqeVVCrhc/E4rKhTSVjdNssYpxByNstmXLD7cnfOMmcA7at6v58BaUqdUce5am1OxIXNEYXbYe9nrzGi8+aSROZgsqSl6bXRm+0YNWhnaJmj4MeMVGoY1ZoitmKTuOSXBxPnuCssG0f5mSofi9f444JvE7Ka5jBQm6BGy+hWPfsJIlmCeOIDOX2ML4fd5q/5YL6wLBK7kWXGicXnWLIlrL+QUZwirMr6ICTDhKJ5MdLu+hkbtJ2h4kNLH1dLNu8PyUb8cdCWeOA5RKQWpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l35XxlJyztQ9mowqY72emGDi10z2ulHr1eHfcLWAROM=;
 b=JYm3tzM2VOtV1dxSCAmA1WmhBvn9EKGhDwCBACljv3SdiKBhbyxMIeUJNlBPne79GzqPt7cOVWj7LGBvEDp7y3zQ2u6v1fcTJsRmOh0R7zGaJhcCFlX+BXk0dFE4uJBFQSH3GjyWqtSYkeF8cnbNRqi1jUqfOXrgQrBqTsDrMQI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS0PR01MB5619.jpnprd01.prod.outlook.com (2603:1096:604:bf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Thu, 12 Jun
 2025 14:51:52 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 14:51:52 +0000
Message-ID: <52401543-28df-4f13-8b7a-6463fe54cd5f@bp.renesas.com>
Date: Thu, 12 Jun 2025 16:51:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/7] dt-bindings: i3c: renesas,i3c: Add binding for
 Renesas I3C controller
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Frank Li <Frank.li@nxp.com>, linux-renesas-soc@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
 <20250611093934.4208-4-wsa+renesas@sang-engineering.com>
 <aEmjbY8ifoI5Cs5t@lizhi-Precision-Tower-5810> <aErkyDQvV3C0TZSu@shikoro>
Content-Language: en-US
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <aErkyDQvV3C0TZSu@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::14) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS0PR01MB5619:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b57e27d-4b7b-4c6a-c1b3-08dda9c0aa79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NDFTczVwRXJwUjNKeTZ1S01Wa2lkb0crTEZwa1ZZSk0rUnc3dHU1SXNQNERG?=
 =?utf-8?B?a0hIZkJYSTdjMWNablU5bWxxRWc4QzN5bStPcVdjb2c5Ym9sREx2U2diR2ZB?=
 =?utf-8?B?cThzZ3dDR0R6VDFRUnMyNHVwQXhEY2gwWU1iWHVhRDA5ckVtQ0M5QjByV1VB?=
 =?utf-8?B?K0VteGZiS1J6bmIwb0drU0x6MmVBaTEvWnVTazEybzcycUN0RnhyeGI4TUs4?=
 =?utf-8?B?NEhWRVpVY0FRL3MvdHNEZEllZ2dnR2t2TVQ0bEk3eVRGdTF3cU9UL0pyTHo3?=
 =?utf-8?B?WkZ2SVBoM3ZkSUhkZm4xSXNqU0FSSFVsN24wWExrUXZKRC9GeFVicWIzWmFK?=
 =?utf-8?B?b0RKMEZvZFFSSktiNzluU292K1RzQWlvbzNTeDExaVdCSE9qUTBrRXhwRXNx?=
 =?utf-8?B?S3hVbkc2SzY5SGZMZEZ4Z0l1dWRmb25WQnhpVHZ6NDE0TVVqMERZenQrTFR4?=
 =?utf-8?B?NXBJcE5xbjBlR1lhcWN2QWNyY25CZ0pRQlJDSGtuR3Z0L1piRkgvcVhUMUJ2?=
 =?utf-8?B?c1NDbzNWcUFoYzA4V2d5YTl4VWJFVVNpdlc0ZUFZZ1paMlBUQngvYWd4OFFO?=
 =?utf-8?B?Y3JOdytjRU52V0FuejhpbExPdis3cFdqbU93TndXU2ZEd2RROSsxMnoyNnZ0?=
 =?utf-8?B?dzR0UFZodyt2cXlmaU5xVVlxVWpMWWp6c09aRnBOOTdqMTNsUjR4UHBtRE5h?=
 =?utf-8?B?M3E1YXFpZzhCUmpQTVkzN2s4QmdLRVJVM21icnJzYmV1R2ZJZWlXTlJNN3Fi?=
 =?utf-8?B?ZUtTbk1uSDh5d3A3UkZQZDBuS1lPZUIwSWM1NlZtK0hwdFRMMkNSQkhEeTZD?=
 =?utf-8?B?OTMvNWxpZHFiLy95RGhEUlhicGV0ZVVEQ2JUK01PL2FYdVhhSS9zVFkwT1E0?=
 =?utf-8?B?Z21wcVQ4YWtnQnhkaEVib0ZVTTRQYnJ1dS9OWTIwaGtxSFFWdFJpbE9JODhH?=
 =?utf-8?B?ZW1ZTFdEeGc1amIxVmNEWCs5UkhiM3l1RDJkdlRCR3cyQTlhUFNDZFhnMjR6?=
 =?utf-8?B?ZzNmbUJ1d3ByYTZqQ0xRMTFCWEh6Vk9hdTdtREV5bjJ5MGxrQnY4L2ZMZ0hy?=
 =?utf-8?B?bmxkYmNpcVl2QTdHcktjTG1EQ1UzS2k4VUlOdEk2anVQc0lwa29Uc25HektD?=
 =?utf-8?B?SVdLLy94Wlo2T1JPaU91eXovM05OS2NFbTd3MkJibUZEVTlDT0pDeXE1Lzkv?=
 =?utf-8?B?WXZIRXA3cjhtcFhDZUc1RVorNjh4YTU0OER3ZjNQRzJsTVE5SU1vemFORGVP?=
 =?utf-8?B?ZGw0MXJNa3RDMVlCdVVYcnZEWHJ2QjlHZjl4RXhXTllRSXVaK3lSMER6TklP?=
 =?utf-8?B?bEpMSTliamY3MnN5cVZDcXBLNk5DczFWTUs2Sit5dFVsZnRRL2JvS2xCdk5t?=
 =?utf-8?B?M2hoTHhlSHUwSVk5cmYzUXE5L0Y0TDFEVmQxU1dIZkpuTTZJenVad0MrOVM5?=
 =?utf-8?B?VEloTm9sOThtZHpLTHg0TDFxcjcyZlkrS2VBTnBEbDZFSEcxTlk4UlFhcFlC?=
 =?utf-8?B?amxNTGk3QnZIb2ZpdjNRWmVESkxBTk51UXlNZ1JJSHo2c1c4YjRCZGJwUGkw?=
 =?utf-8?B?VFJXaFdVMnlvK25rV1hkcEY0bFBuVHhXWnVKYWx2V1FHaFZjeUZGU3VjMmlm?=
 =?utf-8?B?RVR5aUhrWWRENCs0MFpMK2d1WDFWRVNoazVPc3JmZ1N4eFFTM3ZSMWxHWjZx?=
 =?utf-8?B?UVh2eEhBZmhzOGtTNE45K2d5UDUzelo3WlEvU2VlWHRWakJNTlR6eVRyNHNC?=
 =?utf-8?B?UmxxNURTdmtZWXRGV3hWckVsM0lDUjBxV2xvOUgwMUJzVGh0MUFHVmxYUEdD?=
 =?utf-8?B?UUNKV3FsalkvMUJaVEFFdlUrQUZzc3lUckRiQVA2UWNWTmxEa0N2TUZMQ0lJ?=
 =?utf-8?B?UTZYbkF0QWlhZnV3K3dyQjNtcVdjYWlnaHJXM0YxdSsrcHlFM1RyU1RYSzBr?=
 =?utf-8?B?L3ZWbGVSS2t4MDBHRy9yS1VUS1g5N0lnK1FwUjlxRmlwWHR0VktrRVZHUVhh?=
 =?utf-8?B?ZWRLakR6bVlBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlUxdUJyUmV2OVFQUVJRbzZtSGQ4QUtSVjlabjRPbzNHMUUrbGQ2QzVvMWNa?=
 =?utf-8?B?TmtRbXEvbjlhYlQ4Qnh0bjdLem16NmFIdk5zNlJpOWo1b3d5VzV5RjdBRWwz?=
 =?utf-8?B?T1J4Wk53Q0d5VnN5bnViRlVnMUtDM25LNXExU09IMlVlNG5tVmZpOHIyQnBp?=
 =?utf-8?B?K2pEdGJqZmc3QnRWeTF2VUhJa2ZEclFuWjBUc3JYbERhWHJBQkNicHJBWGZX?=
 =?utf-8?B?Y1JXaTl5RVdkMy9lQWxMUHBZaXJ0cmxvZDJCbEhIdDZVc3cvaTA1eW1wUlRG?=
 =?utf-8?B?LzZTT2VVSzNBUTZGSTlRNlNjQTBLTHBPUk4rNWVtR2I4Zkl2SW0yVkI0UDhM?=
 =?utf-8?B?aTI0YWUyTWJGc0JVdW1MSWZac2VVYnpBWHBqLzhEdEpVd09McEZJZExaK3RZ?=
 =?utf-8?B?Q2tUWkRkaWttaHZsV3JQR1IvVTZqR21QTHFxUnE0U0hsVDlkdytsY28wWW5y?=
 =?utf-8?B?ZUsvMnc0Qi9sQXJjMnNydHpjYVBRN2NRbUxDbDlPWHprcGF5TVVqUTNKV3h4?=
 =?utf-8?B?NXFIUkJXZmRLT3VtU1VGb0xWR3EyUUJtOUtUaDIwallMQzJSWlQvSVN0SDRD?=
 =?utf-8?B?ekRUM0Fvc004K21hcHV3bWFXbHN3V0YyOWR1c0VCMzZMM0VKL3ZYNnRrbk1N?=
 =?utf-8?B?S0dzQjdjSnBIRWF5VFE5bHdidWlkUzh4SStwV1ZoVE9icDBoazRiNzY4YTNv?=
 =?utf-8?B?MnVjUlhzUWdWVG51UVR2VHNDR0lST2tjcWVIYUlqYVM1Qk1nLy9yQzlBRzhp?=
 =?utf-8?B?b2JuNEVVOUMzN0xhK2J4V1NneGhoRXdoVlVXUmh6WHJWMlFtRXFUN3ROajlH?=
 =?utf-8?B?cEtJcnRtZURWMlU1aUFEYTJtQ01EVWRlazBJSnZFOURHNmd3WHdJQkFoUlJs?=
 =?utf-8?B?SFAzMTh3RmZ4RHJQRUloUWhQVlZOYVhOckVKOUordE1IbUhOTlBoSFJvcy9U?=
 =?utf-8?B?RUVHbnlnSWdoV1BLWWJQRDcyRk54T0tZTE51eUI1Q2NPc1V3RW1zV0huM3hz?=
 =?utf-8?B?ZEhDRFdUQ1pkRHNSQW5rMjh2VlVJU3RVdWtxNGhzWlVZeWdjN3pOVDc0NnNB?=
 =?utf-8?B?UlhZYWY4RTh3bDVKNE5RZnRxRHlYNlI4MzlvSEVBUjZubXF2ZXRUQ1pkN3E2?=
 =?utf-8?B?RUFRV2cyRkpXTndRaG0wNHAxVlo0U0QzczR3M3ZkOEh3T1FKUG9Nb1pCU3FW?=
 =?utf-8?B?c1ViQ0l2Q1IxaVZMK2F0VVd3aWE1dDJ3NkpDUCtxRnRzRldiU2hUdGZ5Mkla?=
 =?utf-8?B?TTBLNHpsTS9vVnI2R3Q4dEhvbTlKOXlwRW0remFXYXdwVVJJQ3VvOTE5N2VF?=
 =?utf-8?B?WGlBODVIY1hxR1hLQzNWdldybGZ6MjRaUFJhWDM3cHQ0S21KV2Q1MlhES1Ev?=
 =?utf-8?B?bnFjbmFreU1xMGlMaHBLYS9tQjFrZEVucVM0Z2tXcWpZcVdsRjNySmRxOURz?=
 =?utf-8?B?VTNHbCs1cnlzNzFsbjhwNUFVSEZoN1hONXNGczhINis2QjBzVDF2YnRkek81?=
 =?utf-8?B?VE5ZWjlVTlRid0UyNURkYjk2U1JoVVFxeGZCSUV0cm5HbmxyRm8rUTduNldh?=
 =?utf-8?B?YmsxRWJ1L2crVUV1U2R2RnRCZG9aaVRsY3paSWpqYzlsWkt0Q2NNQ3FLYVFR?=
 =?utf-8?B?bmlrcElMWFI5Q3pldlozM3hVbUtmdmhFd3RJUHpiSE81b0FVQmRaZktJQnA0?=
 =?utf-8?B?UUtPRW5yNkdWTVNGcC9YRmVvSWRmRXRXaUtUMVQ4WFlNbUorN3VSc3hJcVRw?=
 =?utf-8?B?MEtQN0NOS1hNelA0b0xZTkp4WWY2dGttU2kvb1pFSUtaRmJiV1BlUGpoVkFF?=
 =?utf-8?B?WjEzejJUYmhURmEzWWdhcjAzRDM3c1ZwSk1FZWVaVXU3Q3ArRmxpVFBENTNJ?=
 =?utf-8?B?TW0rcTVMaWY1aklBblM3R1B5WnNsencvcVlhbHFtTlh4UHcwaFl6elEzVEpS?=
 =?utf-8?B?ZE1IcTErRUxTYWVubEhFdUo0eURORTZWRmxENE52SWlNZmxyMVhqREQzMzVX?=
 =?utf-8?B?N0lQQ2dTeHhvMGowZXpQTVQxbTRZUElyMGVlRUEveEZ3am9MUE9iUWdqbi8r?=
 =?utf-8?B?aURVUHZoaXVNZXlyam9hQUo2SklHOFcweTU5VU9YZFZ3V1JXUmdVM2JaZnBO?=
 =?utf-8?B?ZEw5U2l2V25zMy9ZZjIyYjhCcmErTGYzWGNQdkFVZW5mQVhPdjVHVnNhWmwz?=
 =?utf-8?Q?URuVjxAlx39lgmJWbxkfdEs=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b57e27d-4b7b-4c6a-c1b3-08dda9c0aa79
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 14:51:52.0179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kviqRbOVctV59COhG5iEBFSIEdRiUr8QhXejM9F3grnhtSRhBHmW/YD3WjSo05HgMkSI2kMcQXZqieHhN9rByoAtMRUueLHtIQg54S2mT4M06TmKA4e00GSZk6mTj92i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5619

Hi Frank, Wolfram,

Thanks both for your work.

On 12/06/25 16:31, Wolfram Sang wrote:
> Hi Frank,
> 
>>> +  clock-names:
>>> +    oneOf:
>>> +      - items:
>>> +          - const: pclk
>>> +          - const: tclk
>>> +      - items:
>>> +          - const: pclk
>>> +          - const: pclkrw
>>> +          - const: tclk
>>
>> Suggested clock name is, apb, trans, srfs.
>> Needn't clk surfix and provide meanful name.
> 
> ? Why can't we have the name from the datasheets? It will be
> unnecessarily hard for users to verify the correctness of the clock
> assignments if they need an artifical mapping of these names. If they
> are the same as in the datasheet, the same task becomes very easy.
> 

Agreed.
Since the name comes from the hw manual I think is better to leave it as is.

Thanks & Regards,
Tommaso

