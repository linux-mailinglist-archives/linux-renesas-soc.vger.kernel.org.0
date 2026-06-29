Return-Path: <linux-renesas-soc+bounces-34535-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N78XMy7UQmpwDwoAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34535-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 22:23:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C136DE9D5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 22:23:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=HUL5MaK4;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34535-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34535-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 892B83008A7E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 20:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5104137FF6D;
	Mon, 29 Jun 2026 20:21:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013003.outbound.protection.outlook.com [52.101.83.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F7437D133;
	Mon, 29 Jun 2026 20:21:55 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782764517; cv=fail; b=lI1E1dITwqn2SPzNVFu3fOyE7fWdwlFFAmMEcWYBknqGgwuhYqdHXGoJYgwnIJNp9/4XuBagm/lBqBXcqfbbLG0cJ5a6//Y+Dbo+4rLd+iaYI8KNyBvnZ0jHRbRk3sAWgPXsu/Kg2wBvf2c54NWo2H4o9qZF7DHnvWu7Q3S8pQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782764517; c=relaxed/simple;
	bh=tyHm6Ii5Vq86zaF0gTZ1DD5EFS9oW+9rMIageBZ9vx0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZEax5hs4ZPp/iAgN5aV03chKsjo4OD6GQqJvItnnXmgR7ijnMGt42L6/UM1OORVBxzjk76W2lIpZ9PxPkkzZQVD8p6Jm7onDZ4cQr0IFFXkqD3cRPvwOQPQHnsJa/AGK8NBGwLLDEvR06LeYZZsZUL+ocqjVNXyF885n7Pni1U8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HUL5MaK4; arc=fail smtp.client-ip=52.101.83.3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WZXC/aknmAaUp4dqu4kjWAhv3z51lbNUQmQQZ4JpzkvyRuAV4uHkgOFSeSPxLlzrF4Y7o2oemzOxwtvVzbamsBPXuJgUaPDuaIRBrNFRFkEN/9zienjQwfMSH9MwKfM84yI3zqRn9wazhv+XyTYBWKTv8B8nJ1nWt9Q82gQTFszayKI53J1eTmU2TbsTBRJS9vpvuTevwVbw6HABZj/lFh/0vRuQf9pb+F07JuMOIi+VtRc56O0eeCpl1nJ+w1YXrysUd3XJ+9yz7uuDdW0LS7BMiw5RqOkdjtLdjp5Xac4tdJdBPWiTX7t5eOGfQN2pPmWajK12WCjNzOG3YeVw7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eyZ7lDk2G0doIMRxoWahnleoJZe8K5qqSgfrQhJPznI=;
 b=s4ip7RgTfiO6IMdu0WnQ5wrSVvTWxIt3/5s3S/q9pNSXoJrL0dQDLZ4RezYtGPBPm+kY4BEUWQxg4zB3q8+AcZFqi2H4XYH/FiZFyYD5Ama6PPZJVGZar4Tw03+/jUX8/KUtPVj3/zHlt7IB4C6n8IG95iHhDmGQd/dIZ3aOTxCfcs1q1N7brFM9IE3HTeLyxjBJI8Dr61bn7VfBaw30uu1fmfvCrkn2Tp290SANM9psoYJA3kes9onmhGfLrGdfNQlNZ89CFGdPUkgE4stkAL79F+69JmffnwwqshRTn2EBNERAs4GcXqLsBQuiwRIEqvgFjndFekO2FURJNR38gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eyZ7lDk2G0doIMRxoWahnleoJZe8K5qqSgfrQhJPznI=;
 b=HUL5MaK42LlBB/KZx5rWq1z4+A7REeAHxSTJiujKrK0jnTzlhPojRSffCsPavSaPyJ4jXEl7bK93t5anBc0W5I8FFUXs2VRC94UMqIG+5pSKXlRTkZM7OS2FbvzeGuo3B0Xsb63fgMDSOg0m7q37tXBt9LNXHh3M09d1U0yK4f9TWANhsUgeCUOz76/G3fHmBE/CygB4Utb3bTAPmDxLkTsHLBomuNerATlcD0uo3iJNinC9VuUmccL5HtyKDMigRpvNwhiNdXMjHB0QyqITEPSZX3Cf0JaF304ecKMrxYgwnl/1oemcBy5Ota1iFfkRagr7CSLnY8DhTMG2i/vTjw==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8970.eurprd04.prod.outlook.com (2603:10a6:20b:409::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 20:21:51 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 20:21:51 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Paul Gerber <paul.gerber@tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: add TQMa8MPxS board
Date: Mon, 29 Jun 2026 16:21:40 -0400
Message-ID: <178276437490.2460000.14233360230695048604.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505063346.1799500-1-alexander.stein@ew.tq-group.com>
References: <20260505063346.1799500-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH5P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8970:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b10958f-7c6e-43ad-a473-08ded61c0da4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|19092799006|23010399003|22082099003|11063799006|56012099006|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	y2VrbCIv2cPqgzQAtcrWh6Q9UtM0/cWutCE+BxKw4LNj3sxyxgHWritpLqcfPaw6rS8lPbPi8DT9mePnorBBK4SczAMwecZwn+oHF9qT/jJKHzUPk9TUjWc1TJ6Yf2qqy+boGnWLEb2wIp1QXsERyfmF+IZGP1Tzbzu2lXa/HRF/qX4A6qzvdR50xe4b3MGMr6ryGvzNyvUaIMCO/GR4dCruotY/PSjDsTUExpD4CpDS+W5iEMccbDmhrslC7GvscUb14aNImzQtePSYebLYyyooWp7V7et3gdcVy8d2NjF2UjZ474yhvbytzW6OhE3b05ugfqYxfjzgPjQ1HaP+INfqlhheWAKvvwcple18yrmr0F4kajb7W0UNYpn/KGtTHwbmy9+fkAq9h1g58POhlQ4DZdwxxW1J5v2PLa1KEKTCGdRl9wUhY9LYZMaw7frircDxEG6zuNdx1xXi4beiovOcfxXQeyxaSUafmlcPjVi1eQuhG8VqNaraGsFErjdNLT5cJZMXzeUVaMm15bc3s24k19i1/qboN56+5UAiceb/glUPUn3mKU0LmbLYoWuADqjrMLET3lCTEVULy41w+5CnVRtSblS7l9S85PJA5cQLms0LsskwZjq+YqgAZ7wtjIjTL+bKGM1xNHxHnXb3PYhXuiIrbFpeaGvBcCy2xP5hEES5BotTJjT/H6YXHTKlFikd1Afz/OgFF8mkYM6/IQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(19092799006)(23010399003)(22082099003)(11063799006)(56012099006)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTgxV2JKK080VW1lK2U3cUVpclpiZzZyN28zN1JpdEhlNkc3OTFkK0szVyt4?=
 =?utf-8?B?YlZEdnV0U0k0MUJvM2ZKVW9sU05wOGxPZ1o4SDFTUE1qbnBUZkNVUU9mMzlw?=
 =?utf-8?B?aVBKL1RJS1pvZVVlTG1IaFdHOW9GSkxPRk1GMThiUGpmNlBLWHhOdXBQOEVD?=
 =?utf-8?B?MVlBT1Z3dG1yWUMwUE1oZUllV01WNzY5UGFaNFRvZzZDQW9BSjBlb05JdGYv?=
 =?utf-8?B?Tkx6a2UwMUtNSEYzUzh4OFVBRXpLOS9tN0MzTHB6MFdLUnlTZUpMeEtBb3pu?=
 =?utf-8?B?cEM5QkRqZ2c0YUZRWGV1dVd6S2ZkUVlXZzU3M3A2WFFIWDN0SWcrbUF5L0hk?=
 =?utf-8?B?OFp5R0hxZlZiSS9CVlFWeXFJb2psWGU0WGVRMGl2NklhQmdRTmJwNzIxVHhU?=
 =?utf-8?B?ZUNjNk03RGVaMVJhVi9tenkwWWsraGJreUJBb3dRVEdoQzJpMWNRTnBoa3RI?=
 =?utf-8?B?bEUxTXNXdkNZY2k4N0wyMGVQS09NY3hISVRIRDdweEEyUmRhcXlsUSt3enBj?=
 =?utf-8?B?Y25rb0xxWHFobUZ5ZkhCTVRwS0VKLzZITGxJWURqSkkrRTNlNUpwZzBIS2gx?=
 =?utf-8?B?VlJvNWJMQkZYMDB2S3J4Zlo4aXlBTUp5UGlIMVgremNCeFl4ZU4xdVk1VWlY?=
 =?utf-8?B?aE9xblBpcmwwMlZtck5mbjJ5bW1rdDdKWUVBTlBTaTZnTDlPQmVlak1QV0RL?=
 =?utf-8?B?NjlBY2xKdEJ3VDBwT2E5OStEL1NmL2hJRjdIV20xcGlBek5TempSWmVlek1F?=
 =?utf-8?B?QmMrd0NsOUJITkFwNUk3dE5pNytDUm9ueHZna2RROE1LWkhrdHU2T1lQUWlw?=
 =?utf-8?B?Y095Zng1MndkSFRvTWU2TnI1NEtFTm9ON3B3Q1VjODgyN0NqdjVQYVU5NHBx?=
 =?utf-8?B?ZUQvc3FvcDZ4WC80cWVkTldGWWIxNWdjRW9hYis2TlBHbTcxZW1IWjhtZ0hy?=
 =?utf-8?B?VjVPWlExRHNuSzc0WC9PN1JNdVFxaStxMTNuSmhnWnJKRnBGUFpYVTRNVHJO?=
 =?utf-8?B?amVpRnBpTlN0dmVjNDgvTllwNGJ3cytBaVlwb1lJQXhJbThndmtxL2w3d1lq?=
 =?utf-8?B?d005bEtRWlVQTGNNbUR3Q1U4ODl1VzlhSXljU1dUVjA4blFwVzh3QUNDUk5o?=
 =?utf-8?B?MFNvdGJBazF5eFJENmZyYnJyb1VUSVFFR2xPcXdjVzRrd3JZV0xpN1NuaVZJ?=
 =?utf-8?B?Z0g0MVBvMVNGY1FaNlRHd1RrVW01MndaRGdlQkZ2cmFwZE02dEVVN21vZHA1?=
 =?utf-8?B?V2l6M0RNek1PbzBEVmljcFFSb0lZNXcyRi9ydWY5ZkNSUzhlRGdna1R2M3Bv?=
 =?utf-8?B?NFZ6T25wTzNITjdsWTBvQlFLckpnN1dkd2NXZFlHNHFPb2s3U3E3c1dZNlNo?=
 =?utf-8?B?YSs0QytTUWJsbktnVU11cXhwUHlmWU55cEMydG9ER250MnFrMDBVcWRma0JC?=
 =?utf-8?B?RXdBM2RJTHFJU0dSNUNheU9hNVBvY2VwQ0pPZFNmUWlxWGpnaDF2Q1BwUXA3?=
 =?utf-8?B?YnRESjZ1Qld4VUNzRlBORlA4SHM3akN2cnM0UThic3AybDZNcG1LZ1lpL3lp?=
 =?utf-8?B?RVBoSy9PUE5iZzRzcUFDbFhPV1hETTZIOFdoT1JZdGphVlp3NnFGa1NZVU4r?=
 =?utf-8?B?YmVqa2JEMEJSelBUVUc2YWd1Y2NIU2htd2NZUzRQdUVKekEycnQyNGYrbENo?=
 =?utf-8?B?aFhjdlpsUFlFWjFWd2tpSENubVFSQjZVcGdHSzdBUzlhbEFWdXZBaUFZVWFv?=
 =?utf-8?B?dlY2STh6RG4xcEQzUXRheXhaOEpJUUx6V0orWGNvcFZMK1NvZExmSHltbTFw?=
 =?utf-8?B?MFJwMzhtM0NSTUt1Rk1ZNFluTjY3Q2prTXBCTXdEQzRyeStuOTNtZVRMc0xk?=
 =?utf-8?B?clllb2wvVzFwNFIzS3BlVVpadEY5cHdHZkdsNzZjZHZhZERENE9EUDNNT2g3?=
 =?utf-8?B?QlBGNExYSjFLak8vTWNPN2Q0Yit3eTR5UWQ2TUdvcjVOUVBkM0RpdkdSYWw3?=
 =?utf-8?B?NFZ2RHBIdnJNRlVnTVpYSHlMSS9qeDQzVmRMZlR2aTF6eTJNVGFoeFoyWmMy?=
 =?utf-8?B?YXUwMnVmQmRjWnFDL1BJOU50QzQ2bFFHWDF6L01ESG5DWlg1bFgrT2dzWEI3?=
 =?utf-8?B?M0p1YmRwS1ZvckxMY0Z6TFpOcVBzc1I5dWI2eTN6SGVQaUJjUmMycHdxZ2d6?=
 =?utf-8?B?Q1BHaGlybnBGbVlZUzdnRFpnWlBkMkJKNlhvNUR1aEpnUERtdUo2ZXV4bWRp?=
 =?utf-8?B?NkJ0T1ZhOXZLWjJyWERsZU00bG1LYTUwQThUdGhuMERidGpWMGw4RGdiblky?=
 =?utf-8?B?L1ZLTXBLZ2RaRGhwY3duODlORmFKZDdIWk83a2VEODdVSG02SUNUMWp4bkg0?=
 =?utf-8?Q?gT6YBuNoXobgIn/a8SEcQrSFSIX3Z7NcEnd2Y?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b10958f-7c6e-43ad-a473-08ded61c0da4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 20:21:51.1577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AOvj5wjmdxtgmsi3QraOdRCAkK91WV1FsaJKGft8z+3KqdLh6o6+6MGLQdEbXa1g+uP8R57wMEASo8/cf1EQr6G1pUkaSyIKckxlRx7FmWnH71g7DFTvmdWvK80LE0Rn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8970
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:shawnguo@kernel.org,m:alexander.stein@ew.tq-group.com,m:Frank.Li@nxp.com,m:paul.gerber@tq-group.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux@ew.tq-group.com,m:linux-renesas-soc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,glider.be,ew.tq-group.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-34535-lists,linux-renesas-soc=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.nxp.com:from_mime,vger.kernel.org:from_smtp,nxp.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E0C136DE9D5

From: Frank Li <Frank.Li@nxp.com>


On Tue, 05 May 2026 08:33:43 +0200, Alexander Stein wrote:
> TQMa8MPxS is a SOM family using NXP i.MX8MP CPU family.
> MB-SMARC-2 is an evaluation mainbord for this SOM
> 
> The SOM needs a mainboard, therefore we provide two compatibles here:
> 
> "tq,imx8mp-<SOM>" for the module and
> "tq,imx8mp-<SOM>-<SBC>"
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: fsl: add TQMa8MPxS board
      commit: 4596f1624bf3abdc7782fbca0385bc0a8afb3d51
[2/2] arm64: dts: freescale: add initial device tree for TQMa8MPQS with i.MX8MP
      commit: 6f0c003f0ddbfde3a311d350d2b3c1c38ac95dd4

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

