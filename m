Return-Path: <linux-renesas-soc+bounces-21470-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD671B4562D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 13:20:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4137B3A6050
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 11:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0ABF3148B2;
	Fri,  5 Sep 2025 11:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="L2tcAby9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011052.outbound.protection.outlook.com [52.101.125.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFE62EC09D;
	Fri,  5 Sep 2025 11:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757071203; cv=fail; b=sVu+gS/Y+NY4YXt9+dpUcrXDdAbY3/1IYd92JOGgmBiAwx8T2ySLaQ17K3kbmpWMcQx/WioyJbsu1dKOrBq1mr8Jp02PUVcTHqxKr8sAfiQAJMhpDRlu3+hem4L3ZmzUXOmMONUAu23YhZgxPkWBh+CYX3uLZv2ax/G03/IIFbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757071203; c=relaxed/simple;
	bh=LF3bTm/lw/jnQQvu7ceB67RH/AphoVerpOyMg+wzEAg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fo6ihXMCi3qiAOkEhA6t/pgDDHtlT0VbBmiIgwX4QSh5Uuh6JRjINh1Z2R5y9wduyptb695TzjAIKI5UNFDr4APtNBxjcQ3aGAhPSvGfllKMU+0fZFvOFm/ZV/jg46iZ2zg4C57EyjRo0loi3p2LDQckhypSc7KZ74MpK+hugAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=L2tcAby9; arc=fail smtp.client-ip=52.101.125.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aP8rv4/+UIPdJ76DrWaMMBPymmlW1RekI4zM4486rhEYspHIhQFzLWF11SkZJRf9WvPok9n1ZeqOB5hFiBpuKfDlZ9tSeWb5oSaIAWH5mCDyPlCA+m81f5QA1pQb79FJXWMr1c0043id3WJQzssq9qYZ5t0rvpj/gaOa9oHL+aYSTHoJH3LoFrjGx/7+TgNvD1t9uNI5f3ULM3y0t4BrSogfDoXj4dmqmU43WqLpPApWuihmCc3VRLvpsrZioQ6wBeZTtdORaOXdI0BtfnP4hRWgKGxL2Imjh0W5nhCM86We/FVNwfx57qClESOTd7S7T1dl2UdG4TGGa7R/pJ3JFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0QJVTYeW4+/Wik9l0KLIFi8Ga9pgn04cu+Id6xbR4E0=;
 b=vPWZP2jv8py/WsyXkB7k+bxO6j8wS3BV+Vh8TepDwiWGlAQYEt/uyhh7SaS+z25lNl9hM4RSO/7aMqXvzF7xdG67xTxRgDAwiVvrrK9B1lkKzlAumKMmHCt0W9KcuPEP2j3fgwrw39wM/s2ySE98SgD6tebAFN20DeutfJwT7jGC0tzGq44e/7C0hQyPMGDdApB76TkU+/0Xi8xQZqSDSdVDIhEaheVGUFuCqQoR5jEgE1yK9SRCZrwrKCy4CxEL3GGdm5IttqnyOQZ6/utcn8yjmknYU786tSIkFW2eDtoC0P4qs0RWORu5Klh+8ZELeTFl89GW/XZpAe8TC7XAMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0QJVTYeW4+/Wik9l0KLIFi8Ga9pgn04cu+Id6xbR4E0=;
 b=L2tcAby9dnGB+gXcv0jXdoqCm9D0qFjjgiiPeuBHHsSPT4QwQQoahaX361fLt4Gfoovk2ZyWd421293M4w6jTo841Uz4N2Za2uNPMZzj4kZXAnAZKUMIc5c7WzC+thWgABuY5QigeDsV+l9aJArVVR1KvFk2NwOCVu814aHDN3Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS3PR01MB6773.jpnprd01.prod.outlook.com (2603:1096:604:122::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Fri, 5 Sep
 2025 11:19:58 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%5]) with mapi id 15.20.9073.026; Fri, 5 Sep 2025
 11:19:58 +0000
Message-ID: <d1b9fd28-e1c7-450c-a03f-e10438badc70@bp.renesas.com>
Date: Fri, 5 Sep 2025 13:19:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: i3c: renesas,i3c: Add RZ/V2H(P) and RZ/V2N
 support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250904160305.247618-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aLm5kbgRIcomBo6a@ninjato> <aLrF1OnctYZwy15y@tom-desktop>
 <aLrGehz-3FA4qO3C@shikoro>
Content-Language: en-US
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <aLrGehz-3FA4qO3C@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::9) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS3PR01MB6773:EE_
X-MS-Office365-Filtering-Correlation-Id: fdd40e88-0858-45f3-304d-08ddec6e25a4
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MUduVGNwR1ZtcEY2OWJobll0QlVOSFI1TUFkZGxUMUpma093Sm1CbGpBODIw?=
 =?utf-8?B?amRqTDlGMVUyLzVWQTNtZlhHTkk1L3pkTHNZQmZLYSt0cjVuZWF3QUF2SnhD?=
 =?utf-8?B?dTRiY05RTnh5RmZ1enBab21vdEwwMklVa3VtUlRHc2p0RU81cVZhR1cxMHl3?=
 =?utf-8?B?S3ZwaDR3M2UrRTdQSk43dUpBUXVVNVB0MkNuRlVocm4xUEtoc0FRSDlEWjdP?=
 =?utf-8?B?enNkL0ZHR1JlWkhQNCtBUFprTXZJWWUwOTgrTXJmNnFiS1E2K1RpVERub3NM?=
 =?utf-8?B?YWMvcGU2RGY5MG03b1hoT25GR0pYR1F3RWp3WHVnSGhiTXc2elBUdWxlRHpi?=
 =?utf-8?B?eXZ3SkxUYmZXdlRnTEFMZ3ZYNmFPUURyZGd6T1Mrb2pKUmF1MWFTWGs0Uzg3?=
 =?utf-8?B?dlNmSzY1NU5xWFBHeXVkbE4xY2pGV1FMb2JDcHJzVXpGUVN5cGlVSm5jMmFL?=
 =?utf-8?B?TVJvelJSQXpoNnhrdE9XMTdWMnY5bGhYa01MSGVydW9DTTFqYzM2S0FiWTFI?=
 =?utf-8?B?cEhJWDgwMS9qSDEwWFBvaVhwdE1IMXp3YzA2OVhPcjMvdlp2bG53Z3ZaN0lW?=
 =?utf-8?B?L0ZrOVBUK29NdUF5ZVFUUWFvWjFZaUU4V0dBYUt6cmVPYXovSGVvM3YvV3E3?=
 =?utf-8?B?THlJaDNGQ0hnVU9hSXVGVGJJVkgrdUVJNDlRNXB6ME44NVZ0YSszUy9YRDBo?=
 =?utf-8?B?QWZGejc5bTF1YSt5R1Z4bEVHZEM0VUNpTjlSZ0NPUnNjZ3BVWlJtdHBVVUhB?=
 =?utf-8?B?KzRTaWFPa21SR2VHSjl1N1BXcmRrdTZFNnRxU1lvM3NNV09xc29VZlduMmIz?=
 =?utf-8?B?TnZWRnVoRVFtN0VBT1RITlE5STd3cnlwWUl4RXB0anVOaHczbmRnMU9WZjhF?=
 =?utf-8?B?UHNWak5VM3dNOGRRdnZIL203b3lFTWMzb3A5RFhTL0FkeEI4U2V3M0l1SkxX?=
 =?utf-8?B?R1M0MkpxODlmaVp4RENQL09QcmkvSmt1RVBDeU5tbEhFSmRCYzRHdnpZSG81?=
 =?utf-8?B?VWRreXpsNTRUOE9hOU5CTFFqNHFLWDluK2RNd1VGNkltVmMxbVltRFJpZHBO?=
 =?utf-8?B?MERzRUJNWmgzbHVEZ05LU3MzVUhDS0JhaHdaa003RmdJWS9STWM0SHJ0ZUtU?=
 =?utf-8?B?RmJEYnJTMWV4OURHWExQTTJHZHNTVkpwSnNTUHhYK0tnakNNdFozRlVsY0Zo?=
 =?utf-8?B?dUdiSVVyU0xhdWZrSE9OdU9BVGJlUm5DdTFOdzJFSE5sa1JqUmduVDhkZVRq?=
 =?utf-8?B?Wlo4dnBBUzZKRVRjMjZOUkVpNnJtenVzdFRNN2V2MURWWkZjdUJXbytxQndE?=
 =?utf-8?B?R1M3bjN4THlIZEg5NGpDU0UvWDFOS3Zuc2pyNzh2YkdwT3ZlOFFxclRWMDla?=
 =?utf-8?B?NHpqYjFkdWJSTFFwUnR1SlI3RmdDV0ZuUyttS09aeWtPdjQ2VE51MzlvQ2pq?=
 =?utf-8?B?Q1hzaVM3OUZrQU1yM3JEOVJLSlNmRnVNTWhMOWp6UVp2YVozTTlRVDFLMHdE?=
 =?utf-8?B?bE5kOHZqeUw5R1JNSlJmKzI4b1BXVG1xUDZ5YlJ3Mm1FVjMwZGFrM29rdFRs?=
 =?utf-8?B?SVlhMmp1c3NmaW5tTFV0MTVNUCtjYW9LVnFkYnNGVVQ3RmpOTFJOWlQ0QmlP?=
 =?utf-8?B?VjFxajNNSHZVS0wraURFWlJWQmFKcXMrWGFGeFJ3QnRGeGJSVjZGb1Z6cHpQ?=
 =?utf-8?B?OHc4K2VITDNpNElEL21aSWRkYkVteWdKZGZVblA5Ti9yODF5TmRpc0lIN3lI?=
 =?utf-8?B?ZzBPNzNNdnQyVlpBQVB3cVJRMXc1cE1Dc25LZ2dDemhUWWM4MFRndjlIaU9L?=
 =?utf-8?B?Q3c4cmNJUU9WSzhybUcrRVB2cmFVcmdibnM1MlpSWTdOZXFOdWFmdUduL1NT?=
 =?utf-8?B?T1dnL3dNcHRxdVBCNkozaEZIUFk5dXVMcllSeGY1Q3ZvTTQySFQ0cUwrVlNQ?=
 =?utf-8?Q?IY68dZeT+Wg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjRRUzJ4L00xMDNOY1BWVERWbTdsRWlEZG41NE1iQTJmRHAwdGtsQUVSWVNN?=
 =?utf-8?B?cWFTS1EwcWlhK2owTVRPczArL0tWNzhoYXh0d3Nwb0pmcUNhNitYL2luVVJM?=
 =?utf-8?B?K1ZSK3h3TUp4ZmRob1VPamhIYkFoZHVLQ2gwNzd5YWpTdGtKeWtMbzNwSVAr?=
 =?utf-8?B?ZnVsYkJSVldxSms2REQxVmdxb3BHQ3MzdDZrZVhPZnVnOE5xTnN4TmJiZUZL?=
 =?utf-8?B?bndxbk9LRldWc3VDdWF1dEpFeXlsTG80c2NRL0JPTWVORk1PMlo4aktiRWsz?=
 =?utf-8?B?Q3VHZjIvemlpSndrb3BZRnhlTnBSd2dUUnB6akZQWFFjZjhlcXoybG5PblpK?=
 =?utf-8?B?RXNlQUpkNzNTdENBc0ptSTRra0hNaStienRhRXF4QklHeTNCS0gwK2R6elpq?=
 =?utf-8?B?SzJRajNCUG04YkRDNkQ2YS82M3RsQ2NrNWdoOXpQNkN0bkR6d21hTjY0R3lM?=
 =?utf-8?B?TGF4akxVUHM1NHUvK1FMVkovNVlvZjd1ZVBGVjJCcEwvR21TM2pES2F1YlND?=
 =?utf-8?B?TCsxM0xmZmFWdmxBNk5JK24xMVRGeXdJbEl2eUJ2Nmg1a1hEekhqNmUvbDdk?=
 =?utf-8?B?N01LczJPUHB5MVhvTThtdHJyTk5vME91MVRDcmwyUkJHWlBRejc5NmRJMnQ2?=
 =?utf-8?B?eDdGc3pTSzR4Mzc4N3JPZEdlOVE3Y2RBcmZFR1l0NTc1U0xyNzI2c0syL2Rx?=
 =?utf-8?B?YkVobnI2Tm9ZQUVmRDkwd1hUbDd5dytrOXZ6eHgxZzJQUUVlTnZURGgvbFB2?=
 =?utf-8?B?NnZobDdvTDFYSlM1TGtHcmJWZ0UxV3ovYi9HalpEZ2dueERzNkt0aXFkeCt4?=
 =?utf-8?B?aG9wMk0waDAraVRFRUJ1ZzAvcURQMVEvREZoK3E4VEpBbDFTU2ZGR3JkZHha?=
 =?utf-8?B?a2M0cE1hWUpjVkIzZXRXYnFEdXVMY3ZmN1ZuTkpsRU15ckpadDdaQ1dLclMv?=
 =?utf-8?B?cjFtOTdmd1RtcjEwQTVETVkvRFdGckJTRHZkWk1WS0JNS0NOZDc5ckpjUlQv?=
 =?utf-8?B?RU5yb1ZETkMrUFoycGdpVG53bmVab29OMEg1b3Rqc3RkdDVhT0laVnZCQUw0?=
 =?utf-8?B?b0wxWkhTVzFadStDOUtpdE5tNGVHOTlkeE1IWjZLVVhTQ3IrMHJxUGVELyt0?=
 =?utf-8?B?bDNBRFNUL0V1SnNTK2I1MDAxSzNybzBjZmVzbDR1dkN5Y0N5ekVEb3FMeHBH?=
 =?utf-8?B?QWV0azNwT2JXQk1MbDNvdHJhSTRsbWtrdDFjclhMMG9KRjdmS3E3V3hPaUFE?=
 =?utf-8?B?WWxCRjJSMFlnMmlMb0hpRXVaTk9VUkdERURXdmxIMHk2cm85YkQxeXliZEZz?=
 =?utf-8?B?Z05EaFlQYXc1dW13R3RPSmZNdjFLOENvRDdWZXZkb2FWNlpUYTRZZ0p3dHk3?=
 =?utf-8?B?a2Joc3I0Y0ttNkhFKy9qQTRmYVlxNERXMlp3eG9PMHBsZnMzUC9GYk5Ub2hi?=
 =?utf-8?B?enlsVVhZd1NiSnJ2bHYvMHhLSzJwMVZ4dzFIeklBRWlkTVlqbmlXN3FFUG94?=
 =?utf-8?B?UktSVmtCVWZRWDlmVFlPVXRQZDg4bTBVWFFpaE1MY0M1T0c5T1hUSjBDNTg4?=
 =?utf-8?B?U3dVYmRLWmtVS3hqMWU1bGJhUXh3WmtYSnFZUHVoTjVDc0lzQ1VLSXcwVGdP?=
 =?utf-8?B?eFdHV2hROGRVUWcyd1ppaENjdGJEUlYzU3RzeVJzSDQzMG1NSi9RMW5sMGFR?=
 =?utf-8?B?aUY5VzE5eFEvOGFwWTNZc1hRaEw2T3VOQnZrNm1kYjZVckVadldVb3pOSzN0?=
 =?utf-8?B?c1Z0QWZkcVQxMmJKOWNnQnFXWm1ocmU1V1ZudHN3TmxOUUJsblpJbDY0bGNx?=
 =?utf-8?B?OVpSMGM3MWI5ZjZzME1JNmo1YkQyWHlobnl5YlJPajNRcWE1RktFL3B0M00x?=
 =?utf-8?B?WnJpZG91T2JpU3dvT0xGKytETi84VTZNa1ZaWkJHRWx4eDJ1QUlkckJBY29q?=
 =?utf-8?B?b1VIZTVDYkZsaksyVTFqSWVMRzhVUzVUWm9yeklxaGU4a2ZDQjkzcEVrUzVP?=
 =?utf-8?B?QWtkVS9WSWRYdGFvNnkzUHM2REM5VkRvV2tWL0xqL20xSEVzeUVudWUybC90?=
 =?utf-8?B?cVVJN09QMS9kOGQ5dDYwVVdhSFpWbUtzL3VvZnl4cmZwa0hLM1JqV1lOZXh6?=
 =?utf-8?B?S21qQWxpK2krTVJQUHlqenFMS2hEVE03T2RzWSs2WUdUM1d6MzdKSkxRTFhy?=
 =?utf-8?Q?h99RPew0zyW3NWgzT6bE5TM=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdd40e88-0858-45f3-304d-08ddec6e25a4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 11:19:58.0032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WklX1rAydsjMWDKG2+BfNQvhpOOINPoV3buc4fcY2YKq2gZGL7Xj8vlqipmQci/1fM8YMMgV7zBjBiGvW8e9PA02Sig7VChNhb/P+ZCwlyABU5IJoIeaiZ21ayvpmUAa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6773



On 9/5/25 13:16, Wolfram Sang wrote:
> 
>> Maybe "Renesas RZ I3C Bus Interface"
>>
>> ?
> 
> It is on R-Car Gen5 as well, so... no :)
> 
Ouch I miss that :'(
Please kindly ignore my comment :)

Kind Regards,
Tommaso

