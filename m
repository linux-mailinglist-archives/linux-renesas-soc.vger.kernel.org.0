Return-Path: <linux-renesas-soc+bounces-25412-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB8CC94FF9
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Nov 2025 14:18:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B0453A423C
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Nov 2025 13:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2321F27E7F0;
	Sun, 30 Nov 2025 13:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RkVCUV2g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010044.outbound.protection.outlook.com [52.101.69.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA09827703A;
	Sun, 30 Nov 2025 13:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764508664; cv=fail; b=d5fXIQfVkU9xaA16r1kmQwRJgzxeMj1lY9ukCvjSARcL4+EGcbxMgupJfXCuQgN7ApPKoR1qDpQMJKGOJ3ptj5Iybd3RvgYfRNFMqJP4Gi1cuJrdGk1pIsCW7mAbBz9se9B3r3/g+xG2+0UYWs3kDzp3G6+zlKmhw6RkG8f9+kg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764508664; c=relaxed/simple;
	bh=fTIDU7IW5hE1NW34a/NS+asNToG097IG4EMFadGGvVM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cHsffQcf0k1Jn3ogyc6Jt+/VNAJcQrY81SMhKfMoZjI/y6aalt9Dd2gnxGitzXV8yBRvWMmRtbnBsw9eS6rZzIf4lSJNEiEOBXpXpeOo32fyc5QM3rA1WSVG8FPYt1vcmLERRruoYuxcuHmbntcBeekfIYpNjyyhYOwmcm8Vndc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RkVCUV2g; arc=fail smtp.client-ip=52.101.69.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mzopGN+wPCcSG0Subbpq1QTExC1ddDMy54gEdQhWiabpamD10qdeE7Z54/r4TaW4MBJnYfE3kT9aQ2UEsO/lGDNIEd2Ia3dwjpts8bJlbdBRM9zaiZK6qUlWljUpHjuNBmKGHYFfOGgp4MxH2mz1puUgyV0nwIJHQGRuHMBan3ilPOxR3dBkreZnF++aiyRip79vXz4nV3Io3zf4d2Ss+ikzuYOrtCseqjUxjCXAcUn63Ygbe9sYii+qmLKhPrdYzHqJQRUNcQjDR019AZZb7h7zMPFGhHHFrdAgmZMtf4ES1XNh87zOZCdp8ukOpeytTk9fQsPQOqi6He246ctGiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EWK1jtfjAWwY9fPDJoHcrWNKI+CKl32VxNr1jtJk6C8=;
 b=e8LISKWfPU0kSd/+srlKBfwnrkirKNEIgk71AczrX7VmiojF6Ysj8TZGUK3IL5Zqf5SoYbPFqMpbb+RmgY4Elo5ioxfi52MVNTRze0jl2KJ/BvUtTIFDwWMTrQW3NqxS4nul9I94ykUEK3vV+pdAYhOe1GNTEbSCHFlk4+NhCfk9nWov+UjTJji+TtH9X9UNpqr5GOskTNof9oZc19eL4h0izQOa+BsgXU17XWCbBMRxxlFCfa+RXMNyuboKsqREzdO1zvJUXtPjXbvd9YAd8OR8JTC5xyrOWodDMoz6GEygdflm92OpPocc8NT2/wgLPtTUOMeliLhThRpxJK/kLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EWK1jtfjAWwY9fPDJoHcrWNKI+CKl32VxNr1jtJk6C8=;
 b=RkVCUV2gufHq770fviD9R02PUtL/3z1F3uoaEjDQwEk0pMUvaW386rnwQ5jBBCSygEOy4BhnKxinCn47gXHneCmMRRC0TquTJhGo4lPPcq3MJPFi7CF0bl8FiLPovuChtQ+BZ+VaFdoByhWkEXA8jN37Qe26mfNe3QxEOT2FAd2qYAD+opCfKQvMwe2Y7sgZoomNdduVFUTsFfGcFoztZlpS1tRcVugqYyDFA7nT6zPBfjedlOIYY7RX9VKGDjpOhmq0Y9VXVmSAE7bWsHuNMY89NtObuuy0LuyYDQg66Ak2a4wb9e0gCsFtsWGQnIJxHmic51xhGJfs/mtKSIgaLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by AM0PR04MB12034.eurprd04.prod.outlook.com (2603:10a6:20b:743::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Sun, 30 Nov
 2025 13:17:34 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::8063:666f:9a2e:1dab]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::8063:666f:9a2e:1dab%5]) with mapi id 15.20.9366.012; Sun, 30 Nov 2025
 13:17:34 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	David Yang <mmyangfl@gmail.com>,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	George McCollister <george.mccollister@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>,
	UNGLinuxDriver@microchip.com,
	Woojung Huh <woojung.huh@microchip.com>
Subject: [PATCH net-next 05/15] net: dsa: add simple HSR offload helpers
Date: Sun, 30 Nov 2025 15:16:47 +0200
Message-Id: <20251130131657.65080-6-vladimir.oltean@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 861a75f3-584c-475b-dd56-08de3012d313
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OHJTc3ZtemVKOERNRDVDdXdrVmVyTnJEUE5GelNiSHdhQWdHWndZMERFZncv?=
 =?utf-8?B?M2JGTDJ5cmdrTjUzWGtvSVoydDhXdDJIam1DdTZreG5XSVk0U1k2NERZdnJV?=
 =?utf-8?B?MXl5K0Fab2R2MWJwTVA1R1FQUlB2Q0ZTUmlPZ3Nua1M2bS9RZnFnd2dlb1I4?=
 =?utf-8?B?ajhOVHl4bGJUWTlRWkE5VjFpOTdsTHZ4d0E5VVhDWjVJcVB1akNMaUdnb0hY?=
 =?utf-8?B?TEJiaHZ2bStzNlhSSG9IMkRPMUc3M2lLSFk1V2RrZkRrNXdNWGFWdlBKNXBJ?=
 =?utf-8?B?NVJNUFZ0a3JubDZRYmZtdUUrSW1Sbi9nQ0RTY2tVN0Y2NnUyRU43V3pTbURu?=
 =?utf-8?B?U0YxSHBMK2IyUWpIQm94TEZVYlhOa0E2U2FLRitHNTd2NlNWRjhlNW01SUFt?=
 =?utf-8?B?a3VwS1p6bmJ2ZUlBTmZQRFowRzd4aFVSWStNVC9oL2hxQ1JRa1dPQ0UvRGRn?=
 =?utf-8?B?eUw4OVlkbHk3eXd3ZmtEd2ZQUEx1YmtIVUZ2YjlsWHAwN0o2T04vZ1BWWDNx?=
 =?utf-8?B?SjlaK3dINUhkcXQvOFEyQnZaRmNGVFRlWkk4OStVY3F1NkRsWlVaQnFmT1Ir?=
 =?utf-8?B?K2lZTXNQUXAyN3ZFcFZaWUZrNnJYM2FSR1lWak1NMnNST2dMK1ozbGJDY2Rl?=
 =?utf-8?B?WHpzSkNLWGR6WkE2Y3YrRiswaDVUbWJYN2l3bWIyQ3dpWmtYNDhsN2tJcFdI?=
 =?utf-8?B?cEFQTDJvMnNjZ0lZUUxIWllrcEVKcWgrWU9xWXNjWHhHc1ZTb1FoMEZFdUhO?=
 =?utf-8?B?SVpuSlk0Y20ybWVPNlRRN0d2Y2FudktTbzZVZGMreHdpMlpZd1hjY2J5MU1G?=
 =?utf-8?B?MHVIWGVKL3Z0RXFzSnp1UmZkaktERDBiMGd1Rm5Jc2Jnc1JDd0xibjJ6L0hu?=
 =?utf-8?B?K1VQeG5GRzNFUFM0Sm9SK2FObVAwR2VuRmNNRnRYMVZITUh2M1FCb3MyVHhl?=
 =?utf-8?B?MnFvME82WVdQd1htNVlWRisraXo0UHg3Q05EVStqck1EVVBsVkp3dFo2d3Rs?=
 =?utf-8?B?NGVKVHFtNHEzM3Mvd1pEQnV6N3JoSmdmT1BxVDBsQ2lNVnZQQjJKSmxWVUJq?=
 =?utf-8?B?UEhqSUkvT1BhaHM5cWFhUld4bnVuK3UyUFAzTmJzN29nS2lFRkJTMW5vanZ2?=
 =?utf-8?B?K0FVbDg5Tjg4Q2lwOVJKSnlpL0xwNzBiVEl1ZUtyOTh0SWdHcXBxN0dGRkdB?=
 =?utf-8?B?SlBLSlYwdCtySmNsdFdvdlVwWXUweWsrVVBBZ1AyUjQxc3FHbVZnWTNZMWs0?=
 =?utf-8?B?ODgyM2hhMnpqa0cvSmpabTgxUVFEL1lFRmQvTGt2VHlOVFIwTU0zaldMRDR4?=
 =?utf-8?B?V1VvSDVFTm5ESDFIajh4R0tneXRpdTNXSHZCSG1iWVd6dnZFZUJqWElOOXRz?=
 =?utf-8?B?ZS9WOEpaT2MrQjJpYTRsbjIrSjZKYUw2cEtyb0EyUEs4NWNNcFdTUnFTbWhr?=
 =?utf-8?B?TDNweGU1TTR6TzdzQ2xpVEY5L2pJYWh4Qnk0TmpCc2xTKytzQi8xRVdXUnVV?=
 =?utf-8?B?TW8weXZOL2E4eXNLT0VIY1NvSTYwZm9mV2ZacklhZ0dtQ2k0Y1BLcGttTDUx?=
 =?utf-8?B?cE5GbkFuWVhCMVozZERYejdRYnJvVUE4Z2w5M3FZWE1JN3BxVmwyT1pUQkgz?=
 =?utf-8?B?OTRYYWdwTGNIdmUyblNrNVpKVGFVYkZIL1A5d2hZQm1iVVRNVGRuSGQ3WitI?=
 =?utf-8?B?anNaUzRuSWFrQzNQM05FdFZlU05nT2tmdm9FSjIwNVJsVEhza1IybmhaRlZ4?=
 =?utf-8?B?dlpPL1JpRUtpOVlCZmhFMldQTW9RQzJJeVBtVW9RQjN4Ui9HR05saXREaEVM?=
 =?utf-8?B?VE9OYzdYdVBkUzBYanNQU09QeVdOcWVWako5VzFqRFhoZ3A4T3ZneWhCWGVp?=
 =?utf-8?B?NUpHQWRETXM4enE4U1FjemQ3Z1NkTnFEU3ZHZEliM1V3bGFST1Z1WlJYdHh1?=
 =?utf-8?B?MzF6dFJOZ3c3aGxmZFB5dUxaemxXMmtFR2ZUemVLNHVycmt5bWN0WkJVbXJV?=
 =?utf-8?B?MURvQWNvUGVQZ1N5eUpNY3FvRHM3cTJ1eHRIU2QwL0VYbUNTZTkxcFloeVhz?=
 =?utf-8?Q?n09AcF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2UxQ0YvRkoxNkd3K001TWdwbWNiTC90QWprWmw5RDN1RDlUQ2pDN1NobGVL?=
 =?utf-8?B?U1hqcjkwWmxpRmlaeEtpcXVZN0twYkZpeWdqMGFCVkU1a3ZHaW9qYVAzN04w?=
 =?utf-8?B?TWV4eWppdlpnVjVObFFqcE1RZE9rZ1h2cXNwWlQyYnVsMUJEYkoyckNuWjdq?=
 =?utf-8?B?WUlIZkc5dStBQ0dJcFI2YndqTkNIeEpPMjBRYXZpaGxDRkt3T2xvNWNFNUUz?=
 =?utf-8?B?S0ozVVhreUI4S3RjVGxFMEFvT2Y4aFlnaWhQUXNHa3MrTDE5QkwraW1jcmhv?=
 =?utf-8?B?N282djI0L3RCTFhkdVNYK2JqM3JYWVdNZUNUUWxIZ0x6eTBXZy80dkVaNC9h?=
 =?utf-8?B?VjgrMDdwakszMU1WWVhXeGYxVk9GdGpnMDFYcVYyalBKbVlrUmRiSVJrc1dL?=
 =?utf-8?B?SW9VNjFGam56bnhxSUdyc2orTzBhNnZpM2tJQ2lxWHdPSHcyL3EyWGlybXp1?=
 =?utf-8?B?OHZaNGkyVFNiYXRtbDNQM21RZHYxNDN5R0w2VWpxT3pHaldsd0xqYW9MQUNG?=
 =?utf-8?B?T0U1UVJ3RE1qUXhzUGJwL29qNERwK21SOG1YKzFPRG1oUENKTU5vcS9BbzV3?=
 =?utf-8?B?MDlPQ0laNmFWRDBpQUhnRWtBejA1ampTcnB5ZEduK2NDWm82cWhIZGJjNTRK?=
 =?utf-8?B?SlZOQ1BYU09pWHcrUGxTRjFieEdtZEMyS0ZlSSswaFhLZnA3VGRaNGQ3QTBq?=
 =?utf-8?B?cUYrNjlMc0V3THQwN1JuR0NhS0dGR1pZekZjV2MyYmJHL21mcGhWcFpHejFF?=
 =?utf-8?B?eVdjUFBFcHNFUnJjWk8rdys1OGkwdjVvTXEydlFRQmtNNzVFcXE5OUVVNFpu?=
 =?utf-8?B?eXArUUVub080SFN3Ykk1dThrQ041ZjBuWE16V3dpTlROazZMcldlRm5aWDA1?=
 =?utf-8?B?OTFUMGYveHlpeS9uSDRQbFc2cEtYQ3hUSjNib3VNa2p0djE4M2U5Ly8rQTJx?=
 =?utf-8?B?YjI5T05kazdhb3JOR3o2TVBFaEZZL2RCSVBNZWxGMUF6eFliVnhEQUpJYXVa?=
 =?utf-8?B?Q0lWTXZkU0FMZkorUU8zdTlBb2YwWUNScHo2QUlmVFhYKzRlUmNYTG5ScHlx?=
 =?utf-8?B?RFFrTVRXSG40UFI4TUV4Q2RpMndxRjhjWEttSlRSb0UxeklJdUtyUFV1aHdH?=
 =?utf-8?B?TW5WdGh3eDFwTmlxTnV1bll1UnZxdkJBN2twVmI0MHRQdlMzU3VGY2NVWDV4?=
 =?utf-8?B?S2ZoRUpabVloaVlIbytkVXRZdWhDZFRnTHdMaXpFUis0bnNDbWx2N0s1VjUx?=
 =?utf-8?B?M1JFQk1Kb0N6MFNTMWpUdExPcWVxQTdndnFkR0x0bGpCdTEwMUdkUnFYU3ZX?=
 =?utf-8?B?WUN6djJKTFlmdHRiOUZzbGQ2QjUydDdvUCtreWFuSkR4Vm9DYlU1dThiNjV5?=
 =?utf-8?B?VGlaNEY4K2hHOWZzQjdDWVBUbTVwVzZMNlBRclNpaDE1RVphMDg5UU5uOVIw?=
 =?utf-8?B?STBrSm1DTGxxSGZwMHFDd2diaTNleFlSMlZmL2U3YVZUTlpKaXdVNmYxNTZk?=
 =?utf-8?B?QTBmajc1NlozQXE2V2FQZEJKL3FGKzlERElEWVRWNGNmNy9BOElodG0vRXVT?=
 =?utf-8?B?aWE2QlBwbWJjNnJvYnhVSUFZdWM0eVRya3IxQnRZb2FRZFlIQS8yZW5Nc0VD?=
 =?utf-8?B?ZGh1Z0tJREpGczRnRGMySG5nWENRcldqQjBYNzNFY0hFaXNNUVVGbURLSHlC?=
 =?utf-8?B?NFMxM3EyTW1hK2NkemdFaU1HZUdWNVNUcXcxRFI4SDhHSmxrZTJGZmVFS0Js?=
 =?utf-8?B?YjdWelI2RGdVMFBWNDVIY2ZXRUhCVVYzNHRLQWY0V2RsRUcxLzVXRk1KQUYr?=
 =?utf-8?B?ZnRzZlZJRHBjT0JNV25vT2RGdEdXSkZtM1VvMWJzVFNKTGR0VHJESzJqWlov?=
 =?utf-8?B?SzZ1MGo2NkttYTErYzhVcjVFNGtqclJiWWJUM2dMSGZSRlZzUjRwVXNXbDBz?=
 =?utf-8?B?NHorY0t1SEZsK1krV1VSZW9iN1k3ZjdqT2RURWdKTmJCY3ZweXVIMDBKL0k0?=
 =?utf-8?B?Wk1MRWVjckk4YjNtdU5oWVp1Q05lL0JXKzkxUzFlaUE2K3N1Sm02VkRGWDFC?=
 =?utf-8?B?bnAvUkIvby8rQzQxYXY2SFRMc0ZXbWxLYXByWWd3M2t1SCtJeGxaMzlkaG5R?=
 =?utf-8?B?M29YT1RyQnJoRnNJS2k1Sll1YW1NT3hLTE1TbEVrbjNYQjZXRisrT2h4ajE1?=
 =?utf-8?B?QXc9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 861a75f3-584c-475b-dd56-08de3012d313
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2025 13:17:34.3515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KYw6ZjChA4iGNgrxywYr3TK7ji8TMP0FllATuUQoB3nJdjQc3z34bEzV54R6Jmn8ehqzsXGqNTG90PBZhpBlpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12034

It turns out that HSR offloads are so fine-grained that many DSA
switches can do a small part even though they weren't specifically
designed for the protocols supported by that driver (HSR and PRP).

Specifically NETIF_F_HW_HSR_DUP - it is simple packet duplication on
transmit, towards all (aka 2) ports members of the HSR device.

For many DSA switches, we know how to duplicate a packet, even though we
never typically use that feature. The transmit port mask from the
tagging protocol can have multiple bits set, and the switch should send
the packet once to every port with a bit set from that mask.

Nonetheless, not all tagging protocols are like this, and sometimes the
port is a single numeric value rather than a bit mask. For that reason,
and also because switches can sometimes change tagging protocols for
different ones, we need to make HSR offload helpers opt-in.

For devices that can do nothing else HSR-specific, we introduce
dsa_port_simple_hsr_join() and dsa_port_simple_hsr_leave(). These
functions monitor when two user ports of the same switch are part of the
same HSR device, and when that condition is true, they toggle the
NETIF_F_HW_HSR_DUP feature flag of both net devices.

Normally only dsa_port_simple_hsr_join() and dsa_port_simple_hsr_leave()
are needed. The dsa_port_simple_hsr_validate() helper is just to see
what kind of configuration could be offloadable using the generic
helpers. This is used by switch drivers which are not currently using
the right tagging protocol to offload this HSR ring, but could in
principle offload it after changing the tagger.

Suggested-by: David Yang <mmyangfl@gmail.com>
Cc: "Alvin Šipraga" <alsi@bang-olufsen.dk>
Cc: Chester A. Unal" <chester.a.unal@arinc9.com>
Cc: "Clément Léger" <clement.leger@bootlin.com>
Cc: Daniel Golle <daniel@makrotopia.org>
Cc: David Yang <mmyangfl@gmail.com>
Cc: DENG Qingfang <dqfext@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: George McCollister <george.mccollister@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>
Cc: Jonas Gorski <jonas.gorski@gmail.com>
Cc: Kurt Kanzenbach <kurt@linutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org
Cc: Sean Wang <sean.wang@mediatek.com>
Cc: UNGLinuxDriver@microchip.com
Cc: Woojung Huh <woojung.huh@microchip.com>
Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 include/net/dsa.h |  9 +++++++
 net/dsa/dsa.c     | 65 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/include/net/dsa.h b/include/net/dsa.h
index e40cdc12f7f3..cced1a866757 100644
--- a/include/net/dsa.h
+++ b/include/net/dsa.h
@@ -1322,6 +1322,15 @@ bool dsa_mdb_present_in_other_db(struct dsa_switch *ds, int port,
 				 const struct switchdev_obj_port_mdb *mdb,
 				 struct dsa_db db);
 
+int dsa_port_simple_hsr_validate(struct dsa_switch *ds, int port,
+				 struct net_device *hsr,
+				 struct netlink_ext_ack *extack);
+int dsa_port_simple_hsr_join(struct dsa_switch *ds, int port,
+			     struct net_device *hsr,
+			     struct netlink_ext_ack *extack);
+int dsa_port_simple_hsr_leave(struct dsa_switch *ds, int port,
+			      struct net_device *hsr);
+
 /* Keep inline for faster access in hot path */
 static inline bool netdev_uses_dsa(const struct net_device *dev)
 {
diff --git a/net/dsa/dsa.c b/net/dsa/dsa.c
index 5b01a0e43ebe..a20efabe778f 100644
--- a/net/dsa/dsa.c
+++ b/net/dsa/dsa.c
@@ -9,6 +9,7 @@
 
 #include <linux/device.h>
 #include <linux/err.h>
+#include <linux/if_hsr.h>
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/netdevice.h>
@@ -1766,6 +1767,70 @@ bool dsa_mdb_present_in_other_db(struct dsa_switch *ds, int port,
 }
 EXPORT_SYMBOL_GPL(dsa_mdb_present_in_other_db);
 
+/* Helpers for switches without specific HSR offloads, but which can implement
+ * NETIF_F_HW_HSR_DUP because their tagger uses dsa_xmit_port_mask()
+ */
+int dsa_port_simple_hsr_validate(struct dsa_switch *ds, int port,
+				 struct net_device *hsr,
+				 struct netlink_ext_ack *extack)
+{
+	enum hsr_port_type type;
+	int err;
+
+	err = hsr_get_port_type(hsr, dsa_to_port(ds, port)->user, &type);
+	if (err)
+		return err;
+
+	if (type != HSR_PT_SLAVE_A && type != HSR_PT_SLAVE_B) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Only HSR slave ports can be offloaded");
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(dsa_port_simple_hsr_validate);
+
+int dsa_port_simple_hsr_join(struct dsa_switch *ds, int port,
+			     struct net_device *hsr,
+			     struct netlink_ext_ack *extack)
+{
+	struct dsa_port *dp = dsa_to_port(ds, port), *other_dp;
+	int err;
+
+	err = dsa_port_simple_hsr_validate(ds, port, hsr, extack);
+	if (err)
+		return err;
+
+	dsa_hsr_foreach_port(other_dp, ds, hsr) {
+		if (other_dp != dp) {
+			dp->user->features |= NETIF_F_HW_HSR_DUP;
+			other_dp->user->features |= NETIF_F_HW_HSR_DUP;
+			break;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(dsa_port_simple_hsr_join);
+
+int dsa_port_simple_hsr_leave(struct dsa_switch *ds, int port,
+			      struct net_device *hsr)
+{
+	struct dsa_port *dp = dsa_to_port(ds, port), *other_dp;
+
+	dsa_hsr_foreach_port(other_dp, ds, hsr) {
+		if (other_dp != dp) {
+			dp->user->features &= ~NETIF_F_HW_HSR_DUP;
+			other_dp->user->features &= ~NETIF_F_HW_HSR_DUP;
+			break;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(dsa_port_simple_hsr_leave);
+
 static const struct dsa_stubs __dsa_stubs = {
 	.conduit_hwtstamp_validate = __dsa_conduit_hwtstamp_validate,
 };
-- 
2.34.1


