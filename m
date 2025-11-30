Return-Path: <linux-renesas-soc+bounces-25413-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A72DFC95017
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Nov 2025 14:19:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 773EF3A530B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Nov 2025 13:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 819C5285CA3;
	Sun, 30 Nov 2025 13:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="l2yj/BNM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010044.outbound.protection.outlook.com [52.101.69.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9AB2848BE;
	Sun, 30 Nov 2025 13:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764508672; cv=fail; b=h82RXvScGdr23NNr3oCFvcdGjc6YamsiCrZDBaiSUAB51zFgnoAqLEcerbWF14LXpSWe9GApXSIioxmQA+NwvVIl4W19OFNUwCrI8RPjYRtI/2Pg2JEjcFILJie+M7whQtWcXQCHHQEDOJ+vGChNPW4scSVgkUrBgqhbbSwSFOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764508672; c=relaxed/simple;
	bh=qgNhWPbKeTYWZNoAtIYc3HOBcwFHNhaj0ibww7oHMH4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DvfsM42JPOWTbDv3gFW2/WBgSg37i3FPVgWeIMx9iCBlRhd5zT94t1YlNgCohHRAw4dyoefwzZBPxn9dfaDfNTQGRuv1XPkTQE5879r/uSo5ZN6rXbbOPqDPs8p4q03aPekXyITsD+jTxDsz4hie7HK3FF35c3nX5+YR8KSB5qY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=l2yj/BNM; arc=fail smtp.client-ip=52.101.69.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KY9Cn3H/pgOqXt+aVaiMxmaDbHrTNyZ9+Xa2zQEjbBbN6QkOF5LO7BZlvp772hu/sEfZ0/2w2PBQr+BeS7hJjno7g73qgrmjJb/7qx25vVYcUGwZnpgNjKEKQ68gO+mSG3YWlJlNGBSVxKTJ01gU0LwhFziD/YIQrkP+hw9X56C/44K0mL2CWeLz0ELYW0py7w3PieymkGBQ5jqfLaSSsHdOAp9rOwrmEIH2ylo+s227xEXXm1OLBvUa/PXzOWAQCJjSWaHVFdSRkoMkvhw5+/3bVzaYTWLi1bXCVKupBTmr3s/2sYarC8NWRnII1qe1DY2K2/B7BWzXcQbakLdVug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16PCQTRUrBKIUXdioEjX14P2iLg28CsBgIrrhAuHBmU=;
 b=YqNDH7N0jmkyiW5BBg9t18FSySJoE9gdQvTPBzcpm+m1HHDpMiivd/PL1QkR3GHxKQ373olWFzJ94yv9+xxFiN9xOZnArSO1/WK1djw4qgqmHBKrUYjNdjvLDDtVVpBqKvz6PurM63KbqawDuOrg/gd8nft2A4SEvtahUh1vFs7F8zc0UtqRUeTGIkS/CKLkPmFADc+8LevV1//vAhqrGus4eh0mx5i014fzUL08zCBHDcJ7J54c7RQ1TBRFM0Ksah6nkAMJN001RJNXJ/wpKPXyCT6tRjrlorAXhTW6MXNj78APRDRe70uhQjcuNC4vypxkUFBRD3ehcDhbh5PX5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16PCQTRUrBKIUXdioEjX14P2iLg28CsBgIrrhAuHBmU=;
 b=l2yj/BNMA9Ups5HFYT96OvYJz99hdR/hEu3lA4f9kqvsyzSmSUEBOsmnOV4fecULhlN7Me+9wL2yVwf88VyYmMTtXSLAEzChM7FmCjzi+pTTG1n8GvMxreDKO4ZX1J/8PmNXRPc12bm5MiLQIZBRaoxKEIXCSO0ENR1ntMueWPPpQP8IROOU1em1bqJ/NH72wAXysVU2cmbbhx6fop09T0BWS9E3+jsmy87OFDsnTGhtwqGWsTRx7Zrb2yBucYvO3WIMj8I5iviwMs3XOmMlO2hfVjD2jKMhQKTaqfj+R4W6aGPr1gLJOKINaCWBM09m7HEXkq9QfXfOrcSKqFtpkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by AM0PR04MB12034.eurprd04.prod.outlook.com (2603:10a6:20b:743::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Sun, 30 Nov
 2025 13:17:39 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::8063:666f:9a2e:1dab]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::8063:666f:9a2e:1dab%5]) with mapi id 15.20.9366.012; Sun, 30 Nov 2025
 13:17:39 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next 13/15] net: dsa: a5psw: use simple HSR offload helpers
Date: Sun, 30 Nov 2025 15:16:55 +0200
Message-Id: <20251130131657.65080-14-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251130131657.65080-1-vladimir.oltean@nxp.com>
References: <20251130131657.65080-1-vladimir.oltean@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 55ec2af4-4952-4a0e-841f-08de3012d63f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MGp1RFE0QTlhN201K2wwTDVTeDFCdGZFMXg5cWczckpaNEFBbThtYXpwOGJ0?=
 =?utf-8?B?NnZtczY1a01XN0JnbE1WS1FOU0E1cWZRKzVMQlVPMDB2MXI3clNtRjcyNFJS?=
 =?utf-8?B?ZUUwdENKanA2WlNSc25FeHVkeVdXRnEyUVpiMitCR2t6bkZyNVhyZ1hlakJy?=
 =?utf-8?B?RzE5c0J1dklhejBJR1FIazNyQU5lc3huTXV4djB5YW5DUmdQUmc4RHpsaGRl?=
 =?utf-8?B?ci9wa2tQWFZnQ0k5SzQydlFETHVmTDBjZDAvdHd0cS9QaURweDZqcVIycnRX?=
 =?utf-8?B?QnVDZHllKzU5dlkydk5MSVdUcHAzMmFxamhDbkJ0akE1b2gyTXVicVgxUmFl?=
 =?utf-8?B?c21VODRsQ2xWQlJQSndRQWRwR0NhU2twdmVvREZ6Qk1INDJRMFZiUWcvZUYy?=
 =?utf-8?B?TWFJbmhlN3loSkRYWGxzQ0twZTdNYnYrWHBBY3ViajMzZHU3Sjl1Tk9ndEcx?=
 =?utf-8?B?aG5hdUw3Y2lIamFESG9QWXVTOXhjMzFqcXhBV1p0YjloR0V5UGZYQkEyMU9X?=
 =?utf-8?B?dXFZWTFpb1N0aXJmUnRXdzZMS2t5bEdrYUN5TGJLQmpuZjZENURFb2RORDgr?=
 =?utf-8?B?Rkdzb3N3SjZaYWhBSElOOTB3cFFkQ2pVWjMrR1J5UVpROVZ6cEVHSDZ1TTB6?=
 =?utf-8?B?aVpRR2VVSlhmbTVkUnRBQnVoZkJra3BKTHZmcXNJYXhRcXBiYkd1bW16bXNm?=
 =?utf-8?B?WENMMXMxa25vQkJ2bkpRRUpDL3RvaEVnUm4wQTNaQkt6UlNlWEE5TjhkUnhY?=
 =?utf-8?B?eFEvSTQ5aUphUWd3eFNScGV6Y2NtTGtRYmQxQkFvL09ia1V0cWlNUWRUTENy?=
 =?utf-8?B?L3Z4VVB1NmZNQWNqTHF2YSswLzNZQVBub2lkOGVIYlZqVDVSckptRTQ3ays4?=
 =?utf-8?B?T3MxdmFRb0Z3T0g2MmEzcEpGdEhrU0hFdzVObTdrR1JkSU0raWxqVWJPalBG?=
 =?utf-8?B?cnY4ajRqdGV0dVhPUndkUE93R29USFNESzh6WE0yZXVwNjkrcUxib0Robkw3?=
 =?utf-8?B?R2thT3l2aUxGMFFmeFVVT1JlTHpsT29QZHdkYWI3OVlQdG05VUJkaGkxWFN2?=
 =?utf-8?B?b0RlZmtzWjRMTjVvNC9yM2JUS3NIeDdHa3RXU1g4YW9iQWlSTEQvR3F2K0ZZ?=
 =?utf-8?B?VVV1ZWl3bU1FaDI1WENpWU9wVFdrVXBjNHEwcCtqYjNiYUxKQVNZVEtwcUEw?=
 =?utf-8?B?TzZVbE82UzV0WU5FK3BCTU5qdXE2bmpITGtCTVdGd0JrS3VDRkNaaXpvVTZ1?=
 =?utf-8?B?cXQyb1V4ZUU1ZmpFNDlPbW9VUENjSHFQWWZIUUxpQkVqL0FzbW92YmZ4VkYw?=
 =?utf-8?B?NTJRWTY5aDhvMUR1MlZadkFDeHVWNm5LWjliSmVLM3RHZjhTc3BDN0FtU2t1?=
 =?utf-8?B?ajI1dDNxMWpKd1pwTmJMMnhiSUE1SkdWNnVENkprRE5ocG9XTU5CSFJOVUN5?=
 =?utf-8?B?TmNPTE52cG1renhrT000bVJISDR3MlNHSTAzM2xTZEdxMnNwSlErOVl0R1FJ?=
 =?utf-8?B?bnV3NzJxOEdJM2xDSXQ0YXNkUTRXKzJSeUhnL3RGK0RaamNNcEVEaWxaNitU?=
 =?utf-8?B?MkZ2TVZoUjA2T0U2Mkl3Y0NYOWxMa0puQ3NjSWdSb2h5SmVxQ3h3eTY1RjdP?=
 =?utf-8?B?SzN0VVJlUm43OHN2ekk3M1cvczFRVURiSDZYc2FUdXVPTld0L0NTcUJnWU1V?=
 =?utf-8?B?TThPWXdlb0J0endPVjBKcmFsMm5oZWJ4TzBvUGt1cjVLN1BLVE1oaEdIRzkz?=
 =?utf-8?B?WXZWNWpURUVua09LTmFQOUhqeEhZUVdYUGY2T2xucThhU0Fyejc3WGNFSDYv?=
 =?utf-8?B?OUNkRmtRTitack9TT0FVY3pDelRGSFB1NCt4SU5OcGtNY1ZzOGQycmY4ZkFl?=
 =?utf-8?B?aG9nTGpGT0NqVmQ4K0VVTm52ZkFnME1rdWNYSncva1B5SGVWa2U5SzBjQ0l2?=
 =?utf-8?B?ditkRGtDTFAzT09QMUJ6K0xXVW80OHkrNGdqQWVsTmJUdGFJMDdBYThpNUZh?=
 =?utf-8?B?SjlZZ3JYNU9Db3hHVTlDSXkySEM2LzZSTS91VHUvLzNoSHRjZmVXSzRCWmtu?=
 =?utf-8?Q?miwHuW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0FVdUtkWC9OZXZNMUM0VTRJMDBON0ZHL3h2WFV5MldoRXRBM3hMU2huVmRY?=
 =?utf-8?B?LzlCeDRONzdlbWpydVVxMTBEby9qMHlmN3F2QlAydkhocTFYeDhKZzZFR01s?=
 =?utf-8?B?TTlybmtQckgrWkFkQjducUM3Q0RJbmVuU2FPSlFNWmxERjVJbVpIN0tkYlVW?=
 =?utf-8?B?ajV2THcwSEQ3RWk1TjlMazczdk5PbXdac0U5L2ZydWFSUUVUdVk5N09velZY?=
 =?utf-8?B?eEhOZzhSUWpGWlRVZWJFOUt6bW84OTU1RDg1RUx4S3h0UUpKYmNlbmMwc3p5?=
 =?utf-8?B?WmxxUGZtSm9EMzQ3OUl4NFowSTFvWDdrOXRKd0JMbVFxZ2lBZ3V6ZFllTWtY?=
 =?utf-8?B?QWZJVWxSZXFUS2xmY2lFbkhjTjJyRzZEVDBGblJKMkpraUhRWkhXZEZaaFlM?=
 =?utf-8?B?bUdOb2wxSUY4dGhKTFY4U2JaNVJPUG9zeXpCeUU4MkJOME5tQ2V0cG5RaGFK?=
 =?utf-8?B?UjBONTdMc2hnTTlnSzB1M01KL1F5TXc3NXN3TlhyeEZkUDVRRitaT0dScVhp?=
 =?utf-8?B?Tzh6M2tBMkdvd3lrQitvU1pYb2xVcWJ5TVBlUWMwOHFieEd4QTN6UjdPeEdR?=
 =?utf-8?B?Z0wwa3Z3bjZteVphOEtEcWJBN2R0Y2c2RnJEWmFyTUxFSnBhVnd5eUhaTDZP?=
 =?utf-8?B?Qkt4OXFNMVl0RGFkMm8vRmRYbXlpZkRZTkRTK0Z1aGpGaERZdVJMUHBPSHhP?=
 =?utf-8?B?ZWhnSEJPYjBEYUw4RzA5aFRGNVpYV0QwMDZnMFV4QXJWZktzNDNYcEo4cHNL?=
 =?utf-8?B?TDMrQThudGNrUnFPWENGT2FIM1JjU1B0SUJXR1dzMDZtWFFZVVl1MVpXamFk?=
 =?utf-8?B?R3g3TzlIUlJvdzl4V2Rxd094SDhYUHlOV3hYZWxQMmRBa0xjQUFUd0JHVjVa?=
 =?utf-8?B?emxmUXJmMmM4UTFlVVNXL3lJUVkxNmQxSDJMNHVjU0lsdXhybS9FOU5yQ0d2?=
 =?utf-8?B?alBNQnJpVW9zcHQxaWdIQWtqS25mZVozWXIreVZlZzQrSXJyNGJBdU01TUtK?=
 =?utf-8?B?d3FwTnFGVDUvOXdoOVRHZDlqc0tMTTV5cEh4ZHlSNWNsTEdyZi9ibGlZRWQ5?=
 =?utf-8?B?K2UyMTFlakVLaGplY1gxYUE0ZEdHYVhBTW1MN2hhM0Z5YVdMcFNsZExrWTR0?=
 =?utf-8?B?QnlVRW80SjdFWlVHaWZVbEF0Z2pieURsZU9COTdLbUZtTDF0TVlockd5dGRH?=
 =?utf-8?B?dy9acHVneklpUytWb2V4N0hrOXdPZmhjVmFlZWJmZU10RnA2eWpnWldXWGx1?=
 =?utf-8?B?cXppZHFVbEVsdnNDejZwQ2dFQndWS1Y2Tzg3ZG1jaCtmWG8yQktiekFzTlQ5?=
 =?utf-8?B?Si9Pd3ZrajgvNFkzQVk0ZjNxNVNET2xIcEhkVTcyb0R5ZXFFaW5nUW04Rmtk?=
 =?utf-8?B?WVZodklxdHNiYXJaZzV1UHdzMDRDQ2c3R3VPQWlZSnJRbmVpS09QNXpuaG5X?=
 =?utf-8?B?OG91VHhXakhtTUhLclhNd2RONDBUdHlLMk1NTlBIN093enJoWU9waDM3TVcy?=
 =?utf-8?B?cnducXBhNThXcUhJV01nL0lzbmVZdXc4K3lVUUREaGE1bUpRekNoUlZEcEFt?=
 =?utf-8?B?L25LaUo1Z0c4ZkhyNGdacDMzNk80L2ZkTjAySDR6aysvUU02SkVXbnFOWGJx?=
 =?utf-8?B?NjI3TVpHY3NrbmNLdVozdUdiemNEdWNqR2JmS3FUayt1blE1K0Fubk5HSlhY?=
 =?utf-8?B?ZnpacjFpanR6RTc3TU1URVlVcFFEK3pCNXpOMVRHRXZrMlJtOUltbnNHRE9T?=
 =?utf-8?B?bkNPRFJYVy9peUZVVFJGRnFlRWs3OFh6Ky9UaTRmRXpvSFU3Ni9TY2ZJSFI2?=
 =?utf-8?B?azl2aHNZNGJHbkVTYmpFTUhsaUpRUFJTZ3ROSXhyZlJWamt1R05wY1MxL3U1?=
 =?utf-8?B?VlEvWHZQd2E4TzkvcCtwSGRLSjl5c0VoR2Q2OEhLeklRbDcyaUlhN0JIa2xk?=
 =?utf-8?B?YUVmR3pmTXZtbFYyb1AxODhQVCsrKzBVTW9qaXZPd0M3VzdGQ3hBbGs2R21o?=
 =?utf-8?B?SjF6TVZrUGE5MHBpYnViaCthR09JN0tNNGt2c2xaWXJDQzlldWJiSjk1Vk04?=
 =?utf-8?B?ZktXejB0RXZmMVZha2RBNlJHMzM1SkhsTnpHNUEvMXJZSHJSWlkvZHBwUnla?=
 =?utf-8?B?Rzk1a0t1Zk9vOXpXWFFVamJ1WUl1cmtlTHQwZ0JucDhrSlVZb0hZSmtBVlRJ?=
 =?utf-8?B?a0E9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55ec2af4-4952-4a0e-841f-08de3012d63f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2025 13:17:39.6805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i3LkGH3oM3M75W0wM6RdxYLyetNj+oS2QFm+SRIXDwQNqAEuz4P7DjD8D6gRPgPDJ7EPQT6QO3HVO/k4e0cNyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12034

The "a5psw" tagging protocol uses dsa_xmit_port_mask(), which means
we can offload HSR packet duplication on transmit. Enable that feature.

Cc: "Clément Léger" <clement.leger@bootlin.com>
Cc: linux-renesas-soc@vger.kernel.org
Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 drivers/net/dsa/rzn1_a5psw.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 1635255f58e4..4d857e3be10b 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -1035,6 +1035,8 @@ static const struct dsa_switch_ops a5psw_switch_ops = {
 	.port_fdb_add = a5psw_port_fdb_add,
 	.port_fdb_del = a5psw_port_fdb_del,
 	.port_fdb_dump = a5psw_port_fdb_dump,
+	.port_hsr_join = dsa_port_simple_hsr_join,
+	.port_hsr_leave = dsa_port_simple_hsr_leave,
 };
 
 static int a5psw_mdio_wait_busy(struct a5psw *a5psw)
-- 
2.34.1


