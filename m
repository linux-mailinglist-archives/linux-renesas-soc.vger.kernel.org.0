Return-Path: <linux-renesas-soc+bounces-25411-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F0DC94FE4
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Nov 2025 14:17:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EF8B74E1019
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Nov 2025 13:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8580188A3A;
	Sun, 30 Nov 2025 13:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RA0/BvUv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010044.outbound.protection.outlook.com [52.101.69.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1461A267;
	Sun, 30 Nov 2025 13:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764508654; cv=fail; b=LsE0mpA/ViQD9naMm33ULyoUWLLZaEe/RwG+OoldrNaEN2c5Uo2DVUxZKdwGFPdg8SkPDrM0MFZgABrOnNBkNVkM1jkEnMIn01BIwtkFWEf28TMOWxGZU109JKRMFfdO4lzLwlRnTDr9V9/bKiBTqN9Xu402QZoxGKZIZfZlP64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764508654; c=relaxed/simple;
	bh=Y18b6FYuXizCL4Mm2tzOVeTA1IFe+cvB5dviBmRv+UQ=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=a1qmIQ/LPepJAmZhY1XNWrGtuprZV2ucIp5V5bKv2WFvUB6rnmkvJNslU/7Z0sD2ZzPj/bvpu6TBi4RtpeU+zMKNteBzhgxL2WLvbZMc1tFt1V+WVfVY88ZXkR1BFaAyFLCUeJu7lIhIrI/HfF+HzNn31G1Dygivf9x2Lw8v59E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RA0/BvUv; arc=fail smtp.client-ip=52.101.69.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hztsunD5o110dP9hGTWbt7dP+RBip1YgHzC4ACdS+3HCFlhS3QZ5pWHrlxQ2OQjdLLAtZybAZBYPURg2Y65bt4U3qR222GL2TSrwMVY+2KagfZXqFyzK0IOX2j6DVx3LLp2tFuqlt7GlvjIQMONGReQfiKF/mfyGTNS0bSwo1jJ6hBPH/Tj97722Wrh9EswICe6Rl7MkdOrDjuoQoGOfKtPVKyFdUlSCPHyy7AyQuLLOHti40vEm6/mJSVywx90TQ/sS4M7HL050HxKONMrcooo5mtp7gae4yjOpxYkh2k12zip7JnUoKKP9QvvZGinwK9qrPkAZS5cLncgapLqB0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OVlWKWYEANU540XBYjASDefC5R5fe+FBBMIFl0wdvNY=;
 b=A+ttP9VhaDBFMrwvDgJ3w0VZQcZURu/ke/iRsuY5HsMbP/2xhwPR7yZdNquSLUc66hg00S8Dv1eAElWxIXahg5yMJJc17EQC0ay7S1uWJFz+drkkOmONqqBc9l0hVJTe7JI3YKAxYLyj4fnNC1gZwyGpzkeLpa7QMxt4YNHb6X+hNDLI6OUdLhwYA6hnNnpu+sn7Wiq0S4LYgsHOrgwkuZsaST1oTyUkdNRspZwQgtwvGruzzxJ8EUo0swkB09ZGcRmx4kVEZIqmYsp772RLiansrrpZ342O2FAiYfDqqokxQv9B8706dXpDXMT8ZoHT++ZrgoCln4RKmTnLxRqCKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVlWKWYEANU540XBYjASDefC5R5fe+FBBMIFl0wdvNY=;
 b=RA0/BvUvhhgbRAOPCdfe8PJx5qReh4Erg76UuW7S27MDbJYlBhq4x/KSgEaCMBv4o1Fjhz5h6321l08amDFVjanGebyTO6S7BSYs0ZSXdPjJ8bvGGvcZefTM1h7zeAJ8Jy/LOvOllTz325b5NRir2Wkv62QrmZPoWKjLoxyr6N5VLVPNwMcvBT4/xjv9B7ip21EskCkvjl06492coSiVvrRGAJpb5Lplx/uv7YpnUGMq9YG/H7MMonstsL7/KzrAtabIEiidFK5KmfXugbmZSsd4zCU62RNxvp65sw/a/Zo8AskkKkHWSZOJijy5jDj8K4HWnuBP61APt9NVLfEGyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by AM0PR04MB12034.eurprd04.prod.outlook.com (2603:10a6:20b:743::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Sun, 30 Nov
 2025 13:17:29 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::8063:666f:9a2e:1dab]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::8063:666f:9a2e:1dab%5]) with mapi id 15.20.9366.012; Sun, 30 Nov 2025
 13:17:29 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	David Yang <mmyangfl@gmail.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	George McCollister <george.mccollister@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Lukasz Majewski <lukma@denx.de>,
	Sean Wang <sean.wang@mediatek.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Woojung Huh <woojung.huh@microchip.com>,
	Xiaoliang Yang <xiaoliang.yang_1@nxp.com>,
	linux-renesas-soc@vger.kernel.org,
	UNGLinuxDriver@microchip.com
Subject: [PATCH net-next 00/15] DSA simple HSR offload
Date: Sun, 30 Nov 2025 15:16:42 +0200
Message-Id: <20251130131657.65080-1-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0128.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::21) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|AM0PR04MB12034:EE_
X-MS-Office365-Filtering-Correlation-Id: dea54a68-6f98-4784-a61d-08de3012cfb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MFhzYkdKTndnbVFvZVl4YWVUQkRpWUphVkRjNW9vTkMyOHcvOFlxMXZYTTVI?=
 =?utf-8?B?bzc4U0ROaU5QZWZlQmtGRTdkNlhDL2Fyek9hZkpObUh2UkoxTGsvZ3lSZFJn?=
 =?utf-8?B?djVndlN3bklSeUM1bjdkeTVtQndKZXN4am51VlVLSHhKTGYwYWFmVEJDck1z?=
 =?utf-8?B?dGtQcSt0bFZSZnMyNkIrSDRPOHUrM3BMeGRBbEkwWXlsSGtkQjlwK3U5Uk5C?=
 =?utf-8?B?YWJTdzI4TFhKMG5Ea1ZTMVo5dnpsTkZKLzlnUHlSNk14OE01NEZiM1FjOUl4?=
 =?utf-8?B?WVlTcmdFbXgxbU40VERCaWQvbWtrcVhrOGloRVlVOXpxNWZJMGtSOEx4b0RN?=
 =?utf-8?B?cDJJdVBBZnk3VEFZT1lnYTlxejhOU3R3WUdLWGtBV0loTjRQdVFYNS8rL3Jn?=
 =?utf-8?B?Z0xIMUFabDQzZldlaEFoQkx0VzE0MFc0d1BhbXJnR3ZLSCtyd1pQUElsbm41?=
 =?utf-8?B?ZHZ6cDNEbWVWTC81bXVIR1lBQm5nUWRVM3pQOVdYN2dHN3cybTdYejZ3ZWdS?=
 =?utf-8?B?TGFMdUNTZllySldrQkd3Wlo4cTQ3R01RdlNDaVJqMFBSSXE0VkhpKzN3U1Fy?=
 =?utf-8?B?N1U5MW1INE9oUkk3Y0YxMmU4Z3RBbW9XU1ZJZEJlSFIyYzBDNzNhMXV2aGNL?=
 =?utf-8?B?MWQwNjBiZTJIaXV5Y2U3a1A1bHlOaWh1Tko4VnhzOEw5Y0xRc3dZWmNBaVFu?=
 =?utf-8?B?eEdRTXJDOEI4aU15SjQyMTRNN2lrdDJiZ3FtY1VEOG5BbG9SVzZVdFdIK3BW?=
 =?utf-8?B?Nm5nYTBUaWk5Q3VOMWp1bXJJODdkZWpLVnAyUEJyWi9mSkV2TVlTVTRkT2Qr?=
 =?utf-8?B?bjAyM0pPaWhSQjBabnRlR1hETVdMeU1ZNjNWdlZYc0pjbmxFSFhpVlo4OW81?=
 =?utf-8?B?UlRncXpxMjB1YVRqeEN1Y0sreGpUTlhpdWZrNmt0WG1pNUtyc0I3emdmUHRz?=
 =?utf-8?B?YWJvQzk2Q3Zra29sUk1JRUZmM3NCZHRSTWRrWW5jR3FiRmdlWVdoSFlseWxH?=
 =?utf-8?B?ZmtWNXJQQjVUeERuUG5FRUpQNlNDcjlsY29KWEZKOXVKMFlIejBaeXFnTXJD?=
 =?utf-8?B?NkdwMkVGWDVORUg5b0cyODdGb0FUVFRSR0d0Y3JlRlpSRi9xcjE4NmlEZUNV?=
 =?utf-8?B?dlhFWTdzZC9RdmRSOTdPaUlnU0MrWmJpVit5VkxubE5DOTdDMExzUjlYUnVu?=
 =?utf-8?B?QUJseFo4aUVWdEs1akZjZ1NobXIwcmFKS0Frc3lwYTFGVFN3dnNudjZzTmJa?=
 =?utf-8?B?TGowb25RZnpwS0Q5R3VIVE9mSDVKRXRtSnBPMGo3NFBJTnRRTjYvUlRzcU8z?=
 =?utf-8?B?THl6WE9zbUQzeHo0aVNuYXI4NXVqNTBsWlBjbWxUNWV4Q1drN1E4TUJGVHZ4?=
 =?utf-8?B?a2RDeElhbkNxMmpHTjRzYVFDSnpxeFQ4VVB5cUI5YWlLaWNNVnpYWFB4SzIz?=
 =?utf-8?B?NWZhZkY0cjIrZnNVMk1Iak1xU3kzQmt1ZGJib1dkVFc1MDljNU9YcHZhWWJI?=
 =?utf-8?B?NEg1SlhlQzlHQ1hrV0liU2pFMlZIa0hRbGhVaklQSVNTNk1HU0dHdGg2QVNs?=
 =?utf-8?B?S3c1YXk5UUh2ekl0cVlVc2pPVXRDd0ljVTU3NzBzSVBNdW8vaitYdm1pWHBv?=
 =?utf-8?B?QW0zUm8yYmV6TzB3TWNwUStvNVdVaktMQkdsQVp4M3FpaTc1VS84OUsvbzNI?=
 =?utf-8?B?Y2I5RkY2V1F3YSsxTlRrenU1WVFJellPV2tLM2tnS3ozeWNpa2ZQa2FaR2tm?=
 =?utf-8?B?WUloblhmZGw0SjF1RkJjNmRWeUluZVlRS0hFdXd2NjVUMGZURDRBQS8zRzF1?=
 =?utf-8?B?RGNuaExyYjl6SU4wWmJhRDRiT1BhYkNvU0xDcG5DQUJ1OENGeEU3Y0QvZlhN?=
 =?utf-8?B?dVovSHF4MzM0QUtnNVpGSHpWWCtJSDVSRk1DdUVSMlZUKzdZclpuTjc0S3dF?=
 =?utf-8?B?NDJEYjhhTHBnYTQ5VFJsRjlUSXYzWm9JLzg2NDI2WU9NdFZPTnMvZWVxMnR6?=
 =?utf-8?B?WmF2bzl0bzBaQzJVWHArTHlsOUZkWWpNMFpKU1N6M3JSR0k2V3pkU0hYZTZn?=
 =?utf-8?Q?VXQafn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHNIV2xXUTlZd0lNdThScEdyYzN5Z25pSExBTXd1UEtHcVplYnczSWtlWWty?=
 =?utf-8?B?T2p4VnpHMy9nS1ZnREtJalZFa2laalJqbVJPNjZtS2FzazRZNVhGaGdWbXdJ?=
 =?utf-8?B?cU5zQThBLzZaclFRM3VLU2Q1NGhRVU5HSENsY2NoRmJrV0ppZ1BqeVQ4NVRo?=
 =?utf-8?B?dEZab2o3d3p4d0lpLzRiL08rSUZVamFRazVuVEI2QXlhTnByNHd5QlRmT1Bz?=
 =?utf-8?B?OHFoSVVtejVJNHNMWHNVN1Q3ZDlYWU9vd0pFWWhBOCtldzdQS3luVHppVVEz?=
 =?utf-8?B?czhBZW9RL0FFUFhROXdTQmxxeUR1YUdHVGZGdzZZTUNSOHd2TkxIRURWc1pm?=
 =?utf-8?B?NHpwZU54TW9kNzAxb200UUdPV0FsZEVENGw0TWtuMzJ6V0hoYkZqbnllb3JD?=
 =?utf-8?B?M3lpL01qQURiY2dCSWpXRi95SHhLSUJ5UG9qOFRubCs3cnM2VTlhMzJMM2Rr?=
 =?utf-8?B?NWJLM3B6U1Vja2tSVHdCeWVtejJPb1pnck5PUVJQQkF6VXk2OWRVQUJsRFRx?=
 =?utf-8?B?dlAyeWVDekwxYXFUa2pwMktxaUpEbkh6cUg5dVVmYmtZZWZSNm55WTZmeEp0?=
 =?utf-8?B?dGFJdzZBSFh3QktONlFoMjkvR3ZzcW83dkVORGR0MmcwaXJKL21TQ1p4VGVC?=
 =?utf-8?B?c3hPYit4QVRTSzhsVHhqbUtYMHZhODRGN2dMdmNUcElyaVFPWDF3Q1l5UWw1?=
 =?utf-8?B?eXU0WDY5ZlhZQXRjRGlBVDhQWmtKeWlKb2ZvZEloRDNmN1AxdTdFWWpaLyt1?=
 =?utf-8?B?UTB4R3pVNHRvajdRaVFsN0ZPSE9haWNkc1FHazYyYy9haXJnbWdwWFBleUJv?=
 =?utf-8?B?cU95cHlrZ2F3TlhWeEtDTnJBWXFlSGtETEVYMlYxTVNYZGlFSmxoZ20rRjZt?=
 =?utf-8?B?dzFXcFpTRFFteDI0cWFJWEJzWWpOL05LMm1RVEk0N0NjczQvdmZSbHo2WUZV?=
 =?utf-8?B?RjBFVVFUajBvYUFNM25kcTJTOHV0L0xMVUM5bE5KeWNzb2VlRDlXYTZ3ODQ1?=
 =?utf-8?B?ajdPS1FQUW9JVDJvWS83TDkzNGZneDAzQTZxVVNiek5GR2FRWUJvQ1g1bHVr?=
 =?utf-8?B?b0plTzlpT1czMGlVYlg1WGhIR1BtL2d6TTdwZmFTbjRhcy85bVBmMTByazdC?=
 =?utf-8?B?eGM5N0xwRWlyT29lM2ZiZXNVTVVwMUNaMkRIVm00S29vOC9xUEFNRmVtK0JO?=
 =?utf-8?B?VUZYbU5sdzlQajZIbXEza0VyUi9mL2xaTHN0UG9kQU0zbmRBODhZNzI1UE9C?=
 =?utf-8?B?d2VPdUpHNTFRWFFQSEtZemFCczBSR0hsZE9CelRvdm5GOEEyOGtOTk9FYlJo?=
 =?utf-8?B?Nlo5cE1ZRkwwVTNGaWt4WWc0WGtJK2xFRGswdDE5QmFuN0FuMlFxWG91NlY5?=
 =?utf-8?B?ZUYxTnVCTXNtYVpBTDR6R3ZGSkNjTkl1Zi9BamxOYnRtdGNTNmN2M0hWUUdh?=
 =?utf-8?B?aklkZDJ1THgyemY4Z1pVUDJ3NGNHTVk2R3NHVk1KV0luT3cyTGtnQ0g1RXF3?=
 =?utf-8?B?V0lPRlhRWVdaK0gwTk45ek5XMkV3d2wwVG9SM1BScE1Lbk5zM29GNWJKaU0v?=
 =?utf-8?B?MVNzUUoyalg0N2IwaXRDbDh0Z0VSTFhUcTI0TVZSR1FSS0lUeWRxTlBkZkYw?=
 =?utf-8?B?SVBDMmJFb1RNTHVUS0dXUXJ2c2hSa3I0QzRTZ2tYNUVGc2VVWGtUdU9Nb09M?=
 =?utf-8?B?TVhmV29iZndHeEkxSlpGYmNBR25JRTBNV04wSTJSaE9kN0lOTnp0c1RvS0xB?=
 =?utf-8?B?aklwejRCbXhnRGppS016VitkMUJjQWVNZVQ5WlFmRXZVTjNLUU14a0hsVDlN?=
 =?utf-8?B?WUtSeG1hL3o1N2pwVTdKUDExMG9ncWtaaG00UkZCRVhaUnhkZFBvcTcxMEh0?=
 =?utf-8?B?eHMyTkNMOGxiVjVJRmMxeDhmRnBCbzUzbjF2aXc2TEdTTlhLcDUzLzlwK1F6?=
 =?utf-8?B?eUFxZUVmTVdFWXNzN2trVVM5YjJ3RVhzVFJmNEdJeUxRRlhjcDkwdloxcE5V?=
 =?utf-8?B?KzU5SHl2QXJiSEViRyt4K3hqci9DZ0xNZldGaXVLWHpvbDhCVk40YWpWTUlL?=
 =?utf-8?B?Z3pTblBXSDNGVElhbkJGM1FzYXk3YnhZZDdQWVFTTWtyeE5wRGZNZ3JtZERj?=
 =?utf-8?B?TDJIRzJiRVdiSG9XY21JL0hGTjlESTkzK1l2cW9JVWRLekRqQjJvdmplSHdB?=
 =?utf-8?B?ekE9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dea54a68-6f98-4784-a61d-08de3012cfb7
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2025 13:17:28.9708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1lkYIYnFnmrMjKwRzAgQeWJvv5mJ1/tJdP5O7CctWq2qF+X9kMDMlY91IbGAjgOymKuXGIG4rBoX30oVq/pIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12034

Provide a "simple" form of HSR offload for 8 DSA drivers (just the
NETIF_F_HW_HSR_DUP feature) based on the fact that their taggers use the
dsa_xmit_port_mask() function. This is in patches 6-13/15.

The helpers per se are introduced in patch 5/15, and documented in patch
15/15. Patch 14/15 is another small (and related) documentation update.

For HSR interlink ports the offloading rules are not quite so clear, and
for now we completely reject the offload. We can revise that once we see
a full offload implementation and understand what is needed.

To reject the offload, we need to know the port type, and patch 2/15
helps with that.

xrs700x is another driver which should have rejected offload based on
port type (patch 4/15). This is a bug fix submitted through net-next due
to the extra API required to fix it. If necessary, it could also be
picked up separately for backporting.

There is also patch 3/15, which makes the HSR offload like the others
supported by DSA: if we fall back to the software implementation, don't
call port_hsr_leave(), because by definition there won't be anything to
do.

A slightly unrelated change is patch 1/15, but I noticed this along the
way, and if I were to submit it separately, it would conflict with this
work (it would appear in patch 12/15's context).

Most of the driver additions are trivial. By far the most complex was
ocelot (which I could test). Microchip ksz (which I cannot test, and did
not patch) would also have some complexity. Essentially, ksz_hsr_join()
could fall back to a partial offload through the simple helpers, if the
full offload is not possible. But keeping track of which offload kind
was used is necessary later in ksz_hsr_leave(). This is left as homework
for interested developers.

With this patch set, one can observe a 50% reduction in transmitted
traffic over HSR interfaces.

Cc: "Alvin Šipraga" <alsi@bang-olufsen.dk>
Cc: "Clément Léger" <clement.leger@bootlin.com>
Cc: "Chester A. Unal" <chester.a.unal@arinc9.com>
Cc: Daniel Golle <daniel@makrotopia.org>
Cc: David Yang <mmyangfl@gmail.com>
Cc: DENG Qingfang <dqfext@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: George McCollister <george.mccollister@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>
Cc: Jonas Gorski <jonas.gorski@gmail.com>
Cc: Kurt Kanzenbach <kurt@linutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Lukasz Majewski <lukma@denx.de>
Cc: Sean Wang <sean.wang@mediatek.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Woojung Huh <woojung.huh@microchip.com>
Cc: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
Cc: linux-renesas-soc@vger.kernel.org
Cc: UNGLinuxDriver@microchip.com

Vladimir Oltean (14):
  net: dsa: mt7530: unexport mt7530_switch_ops
  net: dsa: avoid calling ds->ops->port_hsr_leave() when unoffloaded
  net: dsa: xrs700x: reject unsupported HSR configurations
  net: dsa: add simple HSR offload helpers
  net: dsa: yt921x: use simple HSR offloading helpers
  net: dsa: ocelot: use simple HSR offload helpers
  net: dsa: realtek: use simple HSR offload helpers
  net: dsa: lantiq_gswip: use simple HSR offload helpers
  net: dsa: mv88e6060: use simple HSR offload helpers
  net: dsa: hellcreek: use simple HSR offload helpers
  net: dsa: mt7530: use simple HSR offload helpers
  net: dsa: a5psw: use simple HSR offload helpers
  Documentation: net: dsa: mention availability of RedBox
  Documentation: net: dsa: mention simple HSR offload helpers

Xiaoliang Yang (1):
  net: hsr: create an API to get hsr port type

 Documentation/networking/dsa/dsa.rst         | 17 +++--
 drivers/net/dsa/hirschmann/hellcreek.c       |  2 +
 drivers/net/dsa/lantiq/lantiq_gswip_common.c |  2 +
 drivers/net/dsa/mt7530.c                     |  5 +-
 drivers/net/dsa/mt7530.h                     |  1 -
 drivers/net/dsa/mv88e6060.c                  |  2 +
 drivers/net/dsa/ocelot/felix.c               | 70 +++++++++++++++++++-
 drivers/net/dsa/realtek/rtl8365mb.c          |  2 +
 drivers/net/dsa/realtek/rtl8366rb.c          |  2 +
 drivers/net/dsa/rzn1_a5psw.c                 |  2 +
 drivers/net/dsa/xrs700x/xrs700x.c            | 11 +++
 drivers/net/dsa/yt921x.c                     |  3 +
 include/linux/if_hsr.h                       |  9 +++
 include/net/dsa.h                            |  9 +++
 net/dsa/dsa.c                                | 65 ++++++++++++++++++
 net/dsa/port.c                               |  3 +
 net/hsr/hsr_device.c                         | 20 ++++++
 net/hsr/hsr_slave.c                          |  7 +-
 18 files changed, 220 insertions(+), 12 deletions(-)

-- 
2.34.1


