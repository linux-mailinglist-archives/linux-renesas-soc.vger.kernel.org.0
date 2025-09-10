Return-Path: <linux-renesas-soc+bounces-21681-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBDDB50A9F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 04:01:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C3FE3BF744
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 02:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF7AD192B90;
	Wed, 10 Sep 2025 02:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hDtTlsUq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010017.outbound.protection.outlook.com [52.101.229.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A7F54F81;
	Wed, 10 Sep 2025 02:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757469685; cv=fail; b=lIDkexGhm0kyV345QCGWTdqebFCYEYBaSs7fxxnKRuK3R3LXvkOQuLlpOoijyltcSAmEnTcj+RlLixFC8k8ICmpC4rIPRivfQGWMSfvVkHpXEIeTVLK73BPqc6tH32z9jsQ0jzx1L7B2iCQJb4Ma1I8DVrFuE4HqKHOOvYw1vIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757469685; c=relaxed/simple;
	bh=WQovMlYc81H5tTA3KHknmKjWozEmRgIsW2xR0oJDfEg=;
	h=Message-ID:From:To:Subject:Content-Type:Date:MIME-Version; b=TgJIqQ2R5VrQopKqii/JcdHcD6Bk5A55rriwOkd6eFiKL3c/Oh7ntdnaHrOzBIGm3HqB2tyFvT8rwDfua/mS8KUAlPPyfGBhG+HoAG3Fzd4X7D96+41ApXQgj5T0bmurS8jY83roizEThlvRAg3DdbukxeeIZmR7qQX09VzC2SM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hDtTlsUq; arc=fail smtp.client-ip=52.101.229.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CcRSE2c++nXb/NW0b4sLR7FoROVcZ/lVlf5Vu98V7F3QjT6U9BzCymZsC3J9dwhaE+ROw/NRkcLcW5+2+D8b91mGaNkaHcYvwGkeaUYthRMAgvnSpMVgQWMgWSKv1Jpi9gH3b6w7olm4BuMkoHLnfDia3G4Aat/jaUOUuMXUBeUckzne5IcIoafUmLLvQ8MDWkbxF+lR+9x31Sh5jHoAmXmg43pkCBA854cbis8JJ2BEPHYZA8yBw+NF7mea6QXysM2kbPEz7W94VaOHRAtCsINqf1PcpNSHtKaYIkAQQEDJkT6xIqDeugnj2a32Qhav6uiOD/zAX16DELZV5lg16Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zumFafpbZ/6JrLaXB7Pjz8boTVblzyc+QBtVZwYICok=;
 b=tpmMWJHQzDQdgQSqOeHVanTrUyWIb67yB2LrmN9HizTn9jsaqZqVlsOnYncDhMn2qUr5Acs99SKGnUQHxWYLZKkjqvxAFDByJTcRxbEn3MKeZ2NJfRPgkzARnTi5nr1G2hOz8MSbMWMLPLQR1tll3NSri1GrWp1BC0RrsWyyODSg89+eAxRZJmMeMCuKv63krTikj0HyGFH41RMTzh8DAKmkA5UPk6Jj2tSQWM3FjKFaRkEgp3mH19Y8oHFLvSfPKisGi7xO0PpX2LjHhZqbUGo8HUonwqIna4NxVFGcm4FGJscs1e3WDQvAraHhZ4JhyTi8u5K75jCR+4ohsAewZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zumFafpbZ/6JrLaXB7Pjz8boTVblzyc+QBtVZwYICok=;
 b=hDtTlsUq8/wxQF8bSeXihjnjo3ChsxzKsB8D0xfaHTw6G+RzryO4In5PNG9vfq/BTTZSCN3WqkwpsB+1dm/a9r7hfG3F/NtZ5j0NefYt6Kad2t0Am3YxtDWGDaWDKreS2DUyrllHiT+Y6F5vtXRlU428GsOPjRaPWqjBj7kXuuM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB6956.jpnprd01.prod.outlook.com
 (2603:1096:604:138::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 02:01:19 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 02:01:19 +0000
Message-ID: <87o6rjvzf4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 0/4] arm64: add R8A78000 support
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 10 Sep 2025 02:01:19 +0000
X-ClientProxiedBy: TYCP301CA0039.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB6956:EE_
X-MS-Office365-Filtering-Correlation-Id: d20a2c74-99ec-49d4-9e5f-08ddf00def43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bu6Rb0+yD2PNH4Xpe6WCfHYPOL22YKzI4bycAxG0iXRIvQj8y7eLI4pCboK0?=
 =?us-ascii?Q?nfeCe4pagG7yCV7F+SCwCv7uvMKnobIBWnXOwFdACiruW40Pa82y7Xro382H?=
 =?us-ascii?Q?pGzzL6w+buL9X56JERiV9UhXTmFTXZ1Afm/VPDfHOuAMTb2K/xeWWEEwgQu+?=
 =?us-ascii?Q?QqhYbxN2iXx95xX2E9xEf2jlc6qTyIhCDlAgNHl0ThiM1dFIjEHGEFkhCS6d?=
 =?us-ascii?Q?e9AfVzkPljFvCRl92236mipnhLIWPN3bhV83/KxWR57ubITgwCZ5UDaMQ7sT?=
 =?us-ascii?Q?3w3GGYEppdexF+EGgbkiHIluhRfojqBOwBXRa8XBZJ3Je9L47XSxOKCdY51+?=
 =?us-ascii?Q?nrkQMmBIKaU/BFoAw3mdaNW72ERa6eMDgdRu/ACI3nd9VdTFaVbgenM76P10?=
 =?us-ascii?Q?4+oRSNj8Cu4KrC9HkcGOF20YmgZdec0G0SMZbVxoY76BXoyDtcPJesgLZZdE?=
 =?us-ascii?Q?PVeeYK2qCZf1DQsVAb0ugVAEXx2RCS3KSMSsuGzAK66J6JeY4JakWkfUHRfV?=
 =?us-ascii?Q?QJdZ+yRh3AHLNmp6sejdsWJkSWlKSFIMPakvV4BDEI+dKsl/Cd3J+7FaoDx4?=
 =?us-ascii?Q?zFSM5w3rYldNydnZSl/dJAr7b2LxrUoXwww2d+r6s8+wh8tj8KiWk455CE5F?=
 =?us-ascii?Q?OkSS8/DT13IFVBgbTQG61TDd/ipk/yHVh6kOR29W809BrLuADIkWG94wxbk2?=
 =?us-ascii?Q?LKG9QjHef70MdPyiU+z/lrbtRN/RX1T6Wl88hFY+bg60tC42clvxvcWAGSx9?=
 =?us-ascii?Q?FjQbcnGn9xoSiw4GNymvi/uFjyHTi8AwNwuyZH5p0k2O4XbMrHdV+pmfkajo?=
 =?us-ascii?Q?1wdKOqPAjFEjV+KqX43qw4bNm1jVUer5HjHCniSWpJdMaNrkCyV+aglq72KZ?=
 =?us-ascii?Q?jqMF8UQ0BpFN2jLMdt+uIOceN2nn4Xu0q6iOPN06OC0b4qHdlMMuzhgcgyxK?=
 =?us-ascii?Q?RG1HYF1i3XTZjpE/X1sRPOIF014/T3uIkkP5YN31lp3j7ZXhDzxCp1M6MtVb?=
 =?us-ascii?Q?URJLgMAGF4L5zCjym9Kby2uo1empovBatihJHj4X4XVU67VCP9RXtKwpdc4U?=
 =?us-ascii?Q?je5bvmXLnly/F2XJpU50WArNVBzKQX09UwVs3Jc1TCqc1VQ2w+piDlcYy13n?=
 =?us-ascii?Q?FbL8Q86zkEbLZFbxzl51c4e2dRK2/ZVNQCNYQrvh7ntxekj8aDMkxOuYJkY/?=
 =?us-ascii?Q?eVh9Hqve9bZO+bYPgHWKiiBAFNiIsW7ULyt0+E/gwymxLUE08409gj8F/yFq?=
 =?us-ascii?Q?a49c4cgQQnFxLqxRDYqUOWcpHhEzlxvCTnc2LQ5Hie+//2Usk4QQ+iCtcA1I?=
 =?us-ascii?Q?LkqZLjEdVpvNhaQoRvQ4s3UTt/HRUBEY+wf4lgJcK58AXR7sK+Gd5MHfg4vk?=
 =?us-ascii?Q?sUitaSPoxyzmH/J/BunncsdCwiG31+HntBJtSaxuJtvDWc1LNeiUX/nazj5K?=
 =?us-ascii?Q?7nz5gD1FcQ4hv5bQfxep2hdgHXkHL03q0UmRdDEUDj99Wo6Ot4zeMi+nLSlW?=
 =?us-ascii?Q?t3+AAX+8koaaELc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HBibfx9d6eWviJORjtU8fOHmxFq9ZIsfI9mDn0u8UhS6uPZyG1KVFm5uVdk2?=
 =?us-ascii?Q?XEwMNR3HFhQSwWXAnMyFDcbYti8E/kbgTOeoLVbiBK0P7jxQfWyrjZO3PdPG?=
 =?us-ascii?Q?xk1iaL6Mh2D2Q2vAZKi1FjVvf9qa4IGegs4KNQ22QHyxgsWArvq4OtqyQlzZ?=
 =?us-ascii?Q?t2B9vmwerrs4jiH0sC3A2edjpKP8o1Edx5eNt3puq9V55qSHKpLGQlxc6b2r?=
 =?us-ascii?Q?BrcUkhYdNaAoSUbSCkNqEj58ZUFK+ZkumbXmgXuhUjwhupGFBpcMe+CYmO5e?=
 =?us-ascii?Q?CKvF5rVYcnxMn42wl4oJBYnrE0I6xDaUbFPnGynKaWehRTBx9Z6IaP0mLeX7?=
 =?us-ascii?Q?HUTlX1Tyz45VOc3EsuDeGtlrf7Yfr3PbbP6RV7e2tgMX148+qDcH0njM4A+l?=
 =?us-ascii?Q?8JY1b5dnakDX5Qqy84vKWCO440m9K9xZYtfDj7PljpFHPjmTlve08n3jOlkh?=
 =?us-ascii?Q?K0p3BtlcDtpMZWSWBgSRfW+6KDU7Yu0KCclcYwqXw69xnBbrm7QE1/cHDGPW?=
 =?us-ascii?Q?F40lHpVwNgmwCr1qIHQ7U0ipWlrK+HTcKI6tluQlsr/i8c8lRQ0MxKkXRL5q?=
 =?us-ascii?Q?MOFn1w6TBVH1tz3JCiw2ZefyVB637eRrpqff8Nlal4EFDCa7FyTMRWgwqgg1?=
 =?us-ascii?Q?eo1jFeRY4Cf8J2XG7kAW6LJg/7SfLv9F2l/0LI5IqwJTjRfsnTAWGDDQFpV+?=
 =?us-ascii?Q?DCBLM8St1onvS3u0Ya2T5xQQc6gKZmcWFRyIE4a1mZVL6bwKOLrKsJP6ISrG?=
 =?us-ascii?Q?V66XRp4sApK9ny11fsYWuI5nybQOAs+2vtlZ8/RML76hEVYattWnlmc1hgtT?=
 =?us-ascii?Q?M9vVA70lERCFVLBvng3fnlVhBhC1vhF9/C1jS/V3wkn1Wq4JnkboRNHS4hQ7?=
 =?us-ascii?Q?Sz3hZG78YRp6jVqIgG2NTouZlDvZyMxFRxbLm8eXfW3pGk4iEA+8P4W86+Lv?=
 =?us-ascii?Q?xenN9nEg9M5AOUm8OMGaharSPmPMxEPDSkuLbo54s2wuEVsng3fGGlkJoya+?=
 =?us-ascii?Q?lmZHfiNnyCH29QpW1OTS4XRE7jk0PB1SmHc+HfhoHS13pFjfCR6Cgl2X5xCL?=
 =?us-ascii?Q?zndTRlo35CHRY9p5uMI2VkdIwUDNVSp4PIP6t2jhNSXWQWwCK8T+g3sRQPU2?=
 =?us-ascii?Q?V44NESu0BzvTpTjPkG8XYw5UQaC0vlKAWvFUqquR2REjwh9Rwd27hO/kyVuV?=
 =?us-ascii?Q?F9gYcJsH9HZHMog/HRpyFYF3gXQsVP/4nt5jRHj7hjEUM3/JAtYujNNHiZg1?=
 =?us-ascii?Q?L7oJ/TP6OG2Of+bBiHmP06A75/klTOtJyI2lvaZ4SLrFNx1LySi38cXTVO9T?=
 =?us-ascii?Q?DALFc9idm/z2w+YZSNZOZP9ZcsCHcpWWc3mmRODTsdAiffnGGGChgkcJmTo6?=
 =?us-ascii?Q?KeCAC3dL+Tx29MuyzrW+nW+sLak64jggb7La12vCoVG7k36dUWr16ocqHfzH?=
 =?us-ascii?Q?R6LeSAobAx2PI0aIfVYbDT2P6A/o8dMNMdw3Cw42ZSVva8dv8IOMpTyqUv4G?=
 =?us-ascii?Q?iTBEG+e5C50uSFiB5PWN0CtT0Vu8rIPtBQbtqshLSSra/ZU1AN7Wv5tIG0vU?=
 =?us-ascii?Q?9wsIazqHHN/6kMU0YcVgrav8RlMHOxdliHj6lAM9wQDMlBhlpAxPOBTIj7zA?=
 =?us-ascii?Q?VgNm9C/maHkPu/rEnG8IrRQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d20a2c74-99ec-49d4-9e5f-08ddf00def43
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 02:01:19.7496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0OAaJStBD7fWUMtXWA9eEoPdulGst2CwSlPimTr/kZLOiyoAM6CfKNgfRrzPbdGYkxhVZ19LVjQTd2PrXkt4i0tKB9se/6oWAL22hd4XQUJAjinQY7WI75lPAZfLeuGO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6956


Hi Geert

This is v2 of R8A78000 support for Renesas.

This patch-set adds R8A78000 and Ironhide board support.
It is based on SDK v4.28.0 or later. It will be released at end of Oct.

Link: https://lore.kernel.org/r/87tt1c9z7h.wl-kuninori.morimoto.gx@renesas.com

v1 -> v2
	- Add Krzysztof's Acked-by on [1/4]
	- Tidyup "cache" properties on [3/4]
	- Add "clock-" prefix on fixed-clock [3/4]
	- remove un-needed clock-frequency [3/4]
	- use "-" instead of "_" on dummy-clk-sgasyncd4 [3/4]
	- use "0" instead of "0x0" for gic [3/4]
	- cleanup "bootargs" [4/4]

Duy Nguyen (1):
  soc: renesas: Identify R-Car X5H

Hai Pham (2):
  arm64: dts: renesas: Add R8A78000 X5H DTs
  arm64: renesas: Add R8A78000 Ironhide board code

Kuninori Morimoto (1):
  dt-bindings: soc: renesas: Document R-Car X5H Ironhide

 .../bindings/soc/renesas/renesas.yaml         |    6 +
 arch/arm64/boot/dts/renesas/Makefile          |    2 +
 .../boot/dts/renesas/r8a78000-ironhide.dts    |   87 ++
 arch/arm64/boot/dts/renesas/r8a78000.dtsi     | 1063 +++++++++++++++++
 drivers/soc/renesas/Kconfig                   |   12 +
 drivers/soc/renesas/renesas-soc.c             |   12 +
 6 files changed, 1182 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a78000.dtsi

-- 
2.43.0


