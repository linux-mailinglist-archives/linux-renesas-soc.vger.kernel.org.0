Return-Path: <linux-renesas-soc+bounces-11272-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3109EF18E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 17:39:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 243F41892ECB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 16:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 736F322C372;
	Thu, 12 Dec 2024 16:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="g04eQcSI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010026.outbound.protection.outlook.com [52.101.229.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B34B211A34;
	Thu, 12 Dec 2024 16:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734020211; cv=fail; b=dBfvqtzO3GFq3Gp6/ypvQLX2kojF2JyUxUV7lWGJMDLRUAhmv6VYnbEdsu8jW/fzBlh3UaWXzPQ9vb0k8aoTIMwrZcOYULjQPu2pWhgq/5naCKxdKqgXg81RS2z06j5QhgyDpEOg9XicVmkdXOwKtEJqRmNNbuW/IibdXqvsgSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734020211; c=relaxed/simple;
	bh=faWYMdTgMTEU18UHnHeyZGKdh/PVNbBCgxN7UqCEwds=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AoG8PGTqklr2QsY2XCuxUeDO+DpnHtj6epM4wwa4o+QRHpeVM8YjgnhLkJXWsxNYQfJJ4JTiqPgbly2g6jbWa/P71IknmF7RsVQdeH1sFoNbckZAmNA4YrpKZ7iJRr21CG4RZDVn0JecFL3GdPhdUKLdzdXfwiPruYwQ9BLbSSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=g04eQcSI; arc=fail smtp.client-ip=52.101.229.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jRZe3qaeIUZi7AztKvScHz1cP4xMfpmPT4U92F6pQCIokhGwmrpnRmQcrE/KSVFXN9imWn+tA6N3QZJQeKVQG4YakfCIbJM03nB54j77lksWuts0kSP7mK3BrFmqa6WEYKkFYly+2+nsviyPnjPg2XQpocYrbU3VfUmQrqZPkA19lMaB4HD/r47ued77KQS+z834GrlLtmCBDMpNynsawXCNZ4npOABTAS6aKL6XOuDEIv6WZ8XHejZ9a5BCbTytUq4/BhnWqa/lVR2EnWHMqps6tCJKaURMip826nYQIp9IHhXxFTQw5+GxylHbcf5CjIGjKvPsoO28xrdxrOvtnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=faWYMdTgMTEU18UHnHeyZGKdh/PVNbBCgxN7UqCEwds=;
 b=rIEFl4osRYSNCINs9jlB2T+41D+lm5uq59Pmu58zbrFlXXRekJfjpqKNvCjjqnuB+AzHLVVh8qWL/awJajkMIt/afsz849f4W5Rkgi2uUJFSqfZvbSgW5LiunFzJlhB8ByHwFTliLLXUA04tDXUsgM3Zhi/po2JTaEbjGqwyr7pnTk3rFc/XPYPuAYYO9gGdwm1hnzKONRNQW4I8Oa7+KIkNG+v28OGZFHD1U2NZSjZIXMAQn9ozhlbHg9zJrIVHZnFLM3IQxzb0HvRz0fkZmENgt+GZcuvy+Ts7vX7JBdM4CNMVLmTEZDMKGpOpiGJNwozzp34GTxqCpTeugR232A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=faWYMdTgMTEU18UHnHeyZGKdh/PVNbBCgxN7UqCEwds=;
 b=g04eQcSIdmivJtsxlUkuBE41LmdKHZqhQdnTiZwljXXtiO38IAESM8oAAy2cdsgoMEQuPliRolf9aZlPjUXllzbXLivUESqxBjLjAjHDVE01YNcqsBGSLQs6jat01AabRMsHvtOsgpa5TNhuPidP5xUn5D3xH9tRjuo9jxiPHso=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB7331.jpnprd01.prod.outlook.com (2603:1096:400:ea::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 16:16:45 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8251.015; Thu, 12 Dec 2024
 16:16:37 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: RE: [PATCH v2 02/13] dt-bindings: soc: renesas: Document Renesas
 RZ/G3E SoC variants
Thread-Topic: [PATCH v2 02/13] dt-bindings: soc: renesas: Document Renesas
 RZ/G3E SoC variants
Thread-Index: AQHbRXEtWdharNpQ0UycfIQ1fU4bFbLiygEAgAANTmA=
Date: Thu, 12 Dec 2024 16:16:37 +0000
Message-ID:
 <TY3PR01MB113469EA2503757EEA7FB6094863F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241203105005.103927-1-biju.das.jz@bp.renesas.com>
 <20241203105005.103927-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdUEobZDBuG1FJCxMheXg42KFwYrKeMoR6FegE0-Gihs8g@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUEobZDBuG1FJCxMheXg42KFwYrKeMoR6FegE0-Gihs8g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB7331:EE_
x-ms-office365-filtering-correlation-id: 9565dedb-bcdd-461a-46ce-08dd1ac85aa3
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SlQyS1kwVENieS9IZ3VmUzMzRS9hRTFRMDR4dkhVZFhYemhHZmU5T1BnSkV3?=
 =?utf-8?B?WGtzeEtiQWZqZUdQcE9SMlkyUUZ1a3Q4YlhtZ2RvVzUycWpBbC9SUFp0NkEy?=
 =?utf-8?B?Z0ZuaFFLVHM2b0dkN2lSbXZwUTZzV05XR2RWbnBFYU5COVVpeEVUWTFiSlVo?=
 =?utf-8?B?OGlMc09ybnRQc3dYWGFIQW42UVczeTI5c0d1a3prQTZ4VmR2U1JFU0pwbzdh?=
 =?utf-8?B?ZUcrTC9zUDRjK0pjcVppOUJWZFRSd2N6RGZ3SFlHbE16Y04rL2hmT1oxQjhn?=
 =?utf-8?B?REw2QVFrMW9jOG1UOGxmNnRIVEdiNmJhNFgraGxNY2NjUWJuK3F1Tm02U0t4?=
 =?utf-8?B?bUQxeFpIVTlmekRhak1KU3Z6Ni9ISkdEQkdXSWd4ZmFWTUpkZXBkV1UvUGFw?=
 =?utf-8?B?ZlVUcGdFQVpiSTFnbzU5R2lxQkhTdXVJTERreXdaR1NnZE5pKzd5b0FPWElz?=
 =?utf-8?B?Y05EdndvZGdPQkJScHJ5enJyNEdoRG5Lc0Q1NWNRbmtCeVRxcVZadDM0VFNq?=
 =?utf-8?B?VFhrTUxOU2ZUa0g5V3h3R0JLTDNEY3Qxb2twdU1BaXNEQUYzZ3RyZjFreTRl?=
 =?utf-8?B?WXU0SnpOQVp2L3kycWJyL1A5RnZTckZsenlSYjI1Tjd6VHJFcEx3WFl5MURW?=
 =?utf-8?B?V0R3OW9jdWtLdmZnbk8zQTRkbXhoSjB4WldCMFV2Slp5S3RsaTVCVXh0WERv?=
 =?utf-8?B?aWh0aTBGZUxIVmJpRG1UeVQyYjZPdEQ5M3FzS3RheWZCTnlPQ2ZTaTBGaXFS?=
 =?utf-8?B?eENCNHZBZWM0bG1hV3lobVdmQ0dGZkxWcGtvemFJcTM2U1JuWHZEWUVRb3Ez?=
 =?utf-8?B?dmZGczBUdUgrWVhIcUxsbDBuUkVLUUlmZ1NwYzlEQ2ZkYVR4NXlkbzVxcEhk?=
 =?utf-8?B?NUhkM25iSDJ2ZEZvNElQcDRVK1pJbldrVndxaVRqMGw1S1U0WFpGWjhQSjF5?=
 =?utf-8?B?ZDlmS00rQmhPVmNtemw0Q2N5Y3U0blJUckFPWjBvY0xVVWdUOVpkZ0dlbVky?=
 =?utf-8?B?Y25ieVpSVlYyNHJIWCsxZU5wKytJUnFmTnlCVlNMOVlzQWdkSGdUbE16bkpO?=
 =?utf-8?B?MTFMWHZwM2RCQlhSLzAxMllRcFVkakF5VjFleDJWYzNsTjhZdDRXMjd0NW5V?=
 =?utf-8?B?L1VKYWNhZ1gwTDlZb0t1YTl3ejBoSUNqMWZSTjVjc1NnUDh1Vlc3T3lMdlBV?=
 =?utf-8?B?VzZyU3RETmhWL1J4aDNLc1Q5Rzhsbi9lekF0WWpOSW5VSnBrNUsvL29YZ2Fi?=
 =?utf-8?B?N1I5akxONnZUVVAwL050MGcySXdGUGRyay9SL0ZQQWNpR0VhQitGYmZ2ZE4x?=
 =?utf-8?B?YS9sOWdhbTZrS1UxYm9kby82OEJSdjRiM0dacjJkYmNxKy8vL3VKdUJ6YlI0?=
 =?utf-8?B?RlJjQkx3Y245dFI5cFJwSHUwZ3B4WmFQeXBjOUFFMFc0anVYQnJDRDlzQjFq?=
 =?utf-8?B?U1VRalp5STF4b1FwVVV4NTA2MVVMNmFQNTVxUm55MGlJS09GVWV1aURxL05U?=
 =?utf-8?B?aU5DNE1tU2xaZDA5OW16c3VuYlRnNlBVb3BPRytpUU51L2F4Z05oRm1veEdq?=
 =?utf-8?B?dFE4N3dRNm40NDVkSzJWNTN6UFhDSGc5SGhvRjJZTFpDUldOaGJnNlZWYzVv?=
 =?utf-8?B?M0FZaEJWeUM0SVczakNWTm1tZ1BoNlFJQzlHYkNIdzN3bW4vVEFlaWg2dGIx?=
 =?utf-8?B?THRzdGdMaW4rR2E2MTdRT2ExYmJManJIWmVpZ09DWWRIemxWTWZOYjdONGF2?=
 =?utf-8?B?aEhLTCtER0ZFbHlPZ3NRZnM5K0RVVGlqcjd2N2VhajF3cVdLT3RTcDF3L1hw?=
 =?utf-8?B?Z3loTTkzcDVnQjdraUhYV3FlUStlbXNoZ3ZnWkEvYytJRDNDckllTzlOcDhn?=
 =?utf-8?B?ZVRxV3ZpdVJhSENyOTBOSmJud3R6a05VZDFsblRxQldnS3c9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?djdvMFV0QzcvaDBya0V5bTZxRjlnOTZxMmFHK2JQSU9ZOUsyRmN1aCtmUEhE?=
 =?utf-8?B?cTEyUXVKSWJmSk83WnRPQkE0SEJwN2tCOXk4SDhCTGR2aTJRb3Q3bEU4aXU1?=
 =?utf-8?B?OVNpYXZqMER2bFNMcXNIeHZDUlROSkI1UnpDSVR3WHJuc1NMS0IvSzU3bzZk?=
 =?utf-8?B?dW1oK2xlckg0Q1RMMWVHWWFENWhDbUxHRGZ3VGw0VHVVQzdsbVJzZUZ2QzdJ?=
 =?utf-8?B?MDQyaEdFVjlSNHlsZlZEQ1dtTmlMYlFoUjJ1WnpUVTVPNCtYTXZqNXlCbmN4?=
 =?utf-8?B?WmVSSkJZRVB2MW5XRUdCWUxwODFUZjB1emgvRWpMelJUd2dHR3M5STBVcDR1?=
 =?utf-8?B?OEhXYWMza050NzlSd3RmR0Fobi93cUgvUXBzU1k2SXNaN0hxWE8yUGZXR1JQ?=
 =?utf-8?B?MlA2eVRBcjI1WHN1K083Z0pucDBhcUlTM2JjbHBDcWJoWnM5YjV5UzRydE15?=
 =?utf-8?B?bVVsbjZ0cTIwWWxxdE04TWx0U0NUSW9ady9hZm5Kc3oxQ2czWENVREVKMXU3?=
 =?utf-8?B?Mjc1V1NsSmYxWGtXczBDMFV1Wm5kOEFHQW51a1VCcHorMS9lRTBvZGRsUlZo?=
 =?utf-8?B?UTcrYVQrUktQTUtLQ1BVSTRranpnSHpURlgxZTl1M29zQjlGQy9Lek1vRzdh?=
 =?utf-8?B?cEg4Zlh5dkYrNFBEYzYrWDRtMTh6clVwcXZMckVLN1Jlek84T0JONmZwbFFl?=
 =?utf-8?B?RWZXZHFZMDBLVFdraHdWMjJXaHhqei9PWnZNeERLbk14dnlhWDllaHp5WkdE?=
 =?utf-8?B?TzhkeTl1OE03UWFsN1pnSEtlYlpINTJLVklqWEJwRlg4blh5WVNOY1NxdFNV?=
 =?utf-8?B?V2hOa2k0SzNhbWkvblMxb3E1RWlaeXV5OVRFb2gyQmlLTVd5RHJzaUc4eVgy?=
 =?utf-8?B?QytvTzdFai9PS1dOaWxJdHN0VW9rQm9FZFVOekxBdnE0bDM1T2ZTRnhsSHMv?=
 =?utf-8?B?Tmdwdy8rNE0vZmpoRk5jUlRTcFNxT2ZSbGVVdEVYaG83aUh5eFVxOEMwY1A5?=
 =?utf-8?B?TEQzL0NHNnpheThZVmFTZjNmSkI4eHR3aHBvM0pVdnRLT1FiRFJaeExaUENt?=
 =?utf-8?B?ajhlVFpMSVoxNmlEZnZkUEs0UEpHQjZ2S0dRN0xFb3czOFZ4YjVLT1JXRlp4?=
 =?utf-8?B?bUljQmlGVGFzakdzL2FHZlVHODJObWtQeEJnMThXVnBRZHlKdlRiVWJ6SUFT?=
 =?utf-8?B?bWMzaG1BdlhHUjRmWmNvZU5YNDNVZGNObFZFQXZRMzdZTVloeEUxYnQzRlRT?=
 =?utf-8?B?RDFvcGhTZThXT0xhdmxBU1I0OVJhWk50bXdTWTlNTnF4V1RVMTJ4UDdNL2gz?=
 =?utf-8?B?THloMGoyUGh0WkUzWExTd3FRaEdBdmhURnpyNVdBQlhWbXFlTHg0cWlyTHpH?=
 =?utf-8?B?M3Y5ODFBdks2MXVjb1NxME50SlFvR0wrMWZDOFlYN05JdVJHK0M4N1ZxUi9H?=
 =?utf-8?B?dlBGZW8yTFI1eWdxZjZmcFpGdjFQSGFNbWtiU0hWZzNMcmtXbG5lTTdYT1VM?=
 =?utf-8?B?ck85ZHVFVk9JZ0htZ2lPVm8ramg1dlF6SklXZGxBeHlzM3lCcGdEUkZoRExj?=
 =?utf-8?B?RmVLZWNGZk1kVXdJeTM2eDV4b0hheTl3RHg5SEtSOTllaVZpYktIZWcyN3pi?=
 =?utf-8?B?UTJOcVUybnJhc05RN0UwYzJGYU54OVYyVnFSM1ZjSSs1Q1RYS1BHQnVHQ3FB?=
 =?utf-8?B?YU5BRnUwZjNZdnJndFlwSEJvOWVqd1RCanNQSlZuZ3RpOUo2NGhyZE9WbUYy?=
 =?utf-8?B?dFdtN2xuSnkxa0NvRUhETTlxbkVyVU0rbk0vcDRZZlJJQWlYYitLTFB2QzdW?=
 =?utf-8?B?aEwzeER5MlNQTkhlYXNtZTYxNlRuSDh4RkszUTBML1dDUmhPU3NUUVJEYTMx?=
 =?utf-8?B?NmRJR1h2MXpaWDZCSy9QZitBb0FXTUkxTWZ5UVpuSmk4T2dZVzM4elF0UER3?=
 =?utf-8?B?emUxNWZGUXFRbHEvR09sdHhxZEhKZEdkUFdyak1MUW1SQytoQ0hPb2NZbFBl?=
 =?utf-8?B?T1J3RkdSVm5MRVRpVXNIK1JuQ2hWWUUrSkg5WEpuM25EcjJiVW1SaUZLeWE2?=
 =?utf-8?B?K3RBVTlqUjJSTit0NGI2OUlTVVRPdjBHMjFlSWF0QjB1SXJXSDNQb0g1WlVF?=
 =?utf-8?B?citFVWdQbGs5SzNvYXN1bDllZXAzZjdDaGhMVE9qZnpRYmxIOW02QU5aSTJn?=
 =?utf-8?B?V2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9565dedb-bcdd-461a-46ce-08dd1ac85aa3
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2024 16:16:37.2889
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2ccNG+Hd8JdS9GYEtSY4I+b+BCIwk62pbn8/b52X+ar7/CwIIIsobW5u4RxDXNwi+PmF4hig81Y0ruowub1ZEr/aJxKeJFPAEcHyTxjFOEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7331

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMTIgRGVjZW1iZXIg
MjAyNCAxNToyOA0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDAyLzEzXSBkdC1iaW5kaW5nczog
c29jOiByZW5lc2FzOiBEb2N1bWVudCBSZW5lc2FzIFJaL0czRSBTb0MgdmFyaWFudHMNCj4gDQo+
IEhpIEJpanUsDQo+IA0KPiBPbiBUdWUsIERlYyAzLCAyMDI0IGF0IDExOjUw4oCvQU0gQmlqdSBE
YXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBEb2N1bWVudCBSZW5l
c2FzIFJaL0czRSAoUjlBMDlHMDQ3KSBTb0MgdmFyaWFudHMuDQo+ID4NCj4gPiBBY2tlZC1ieTog
Q29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3Mg
Zm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9zb2MvcmVuZXNhcy9yZW5lc2FzLnlhbWwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3Mvc29jL3JlbmVzYXMvcmVuZXNhcy55YW1sDQo+ID4gQEAgLTUy
NSw2ICs1MjUsMTkgQEAgcHJvcGVydGllczoNCj4gPiAgICAgICAgICAgICAgICAtIHJlbmVzYXMs
cnp2Mm1ldmsyICAgIyBSWi9WMk0gRXZhbCBCb2FyZCB2Mi4wDQo+ID4gICAgICAgICAgICAtIGNv
bnN0OiByZW5lc2FzLHI5YTA5ZzAxMQ0KPiA+DQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IFJa
L0czRSAoUjlBMDlHMDQ3KQ0KPiA+ICsgICAgICAgIGl0ZW1zOg0KPiA+ICsgICAgICAgICAgLSBl
bnVtOg0KPiA+ICsgICAgICAgICAgICAgIC0gcmVuZXNhcyxyOWEwOWcwNDdlNTggIyBRdWFkIENv
cnRleC1BNTUgKyBDb3J0ZXgtTTMzICsgRXRob3MtVTU1ICgyMW1tIEJHQSkNCj4gPiArICAgICAg
ICAgICAgICAtIHJlbmVzYXMscjlhMDlnMDQ3ZTU3ICMgUXVhZCBDb3J0ZXgtQTU1ICsgQ29ydGV4
LU0zMyArIEV0aG9zLVU1NSAoMTVtbSBCR0EpDQo+ID4gKyAgICAgICAgICAgICAgLSByZW5lc2Fz
LHI5YTA5ZzA0N2U0OCAjIFF1YWQgQ29ydGV4LUE1NSArIENvcnRleC1NMzMgKDIxbW0gQkdBKQ0K
PiA+ICsgICAgICAgICAgICAgIC0gcmVuZXNhcyxyOWEwOWcwNDdlNDcgIyBRdWFkIENvcnRleC1B
NTUgKyBDb3J0ZXgtTTMzICgxNW1tIEJHQSkNCj4gPiArICAgICAgICAgICAgICAtIHJlbmVzYXMs
cjlhMDlnMDQ3ZTM4ICMgRHVhbCBDb3J0ZXgtQTU1ICsgQ29ydGV4LU0zMyArIEV0aG9zLVU1NSAo
MjFtbSBCR0EpDQo+ID4gKyAgICAgICAgICAgICAgLSByZW5lc2FzLHI5YTA5ZzA0N2UzNyAjIER1
YWwgQ29ydGV4LUE1NSArIENvcnRleC1NMzMgKyBFdGhvcy1VNTUgKDE1bW0gQkdBKQ0KPiA+ICsg
ICAgICAgICAgICAgIC0gcmVuZXNhcyxyOWEwOWcwNDdlMjggIyBEdWFsIENvcnRleC1BNTUgKyBD
b3J0ZXgtTTMzICgyMW1tIEJHQSkNCj4gPiArICAgICAgICAgICAgICAtIHJlbmVzYXMscjlhMDln
MDQ3ZTI3ICMgRHVhbCBDb3J0ZXgtQTU1ICsgQ29ydGV4LU0zMw0KPiA+ICsgKDE1bW0gQkdBKQ0K
PiANCj4gSSdkIHJhdGhlciBzb3J0IHRoZXNlIGJ5IHBhcnQgbnVtYmVyIChpLmUuIHRoZSByZXZl
cnNlIG9yZGVyKS4NCk9rLg0KDQo+IA0KPiA+ICsgICAgICAgICAgLSBjb25zdDogcmVuZXNhcyxy
OWEwOWcwNDcNCj4gPiArDQo+ID4gICAgICAgIC0gZGVzY3JpcHRpb246IFJaL1YySChQKSAoUjlB
MDlHMDU3KQ0KPiA+ICAgICAgICAgIGl0ZW1zOg0KPiA+ICAgICAgICAgICAgLSBlbnVtOg0KPiAN
Cj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIu
YmU+IGkuZS4gd2lsbCBxdWV1ZSBpbiBhIHNoYXJlZCByZW5lc2FzLQ0KPiByOWEwOWcwNDctZHQt
YmluZGluZy1kZWZzIGJyYW5jaCwgd2l0aCB0aGUgc29ydCBvcmRlciBmaXhlZC4NCg0KVGhhbmsg
eW91LA0KQmlqdQ0K

