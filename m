Return-Path: <linux-renesas-soc+bounces-31897-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PExDWow92lbdQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31897-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 03 May 2026 13:24:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7854B5417
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 03 May 2026 13:24:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E6F25301A7F4
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 May 2026 11:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B39BF345741;
	Sun,  3 May 2026 11:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="ol3CtWFw";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="ol3CtWFw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021099.outbound.protection.outlook.com [52.101.65.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8813130E0DC;
	Sun,  3 May 2026 11:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.99
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777807115; cv=fail; b=EEPSAJPqVi0dsDDfVOCCc120eRAnm8itBspzoNTsQMawSDKY/d4Ue2o+lqjMAnNz9bRQABidTITC8YbPYFSDkBgtV1K6DMqd5koZi/ENlCfvehSgS0zKIvCuon2PHQwklj/fgbT4pnorL/Vmd6oxaRWWfOlfSrkvKs/WwISdVIE=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777807115; c=relaxed/simple;
	bh=o8C/AipqJjr7WaHd+9fwbLhAYvNkf5DXssiv0ik659E=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=YLNuqjzZ+JOGMLc7WXOnjNc8E4OMFCuOB+XqbxLTSc95HiKtAmvE7NpnKN0kWVGrjaYTmiVXkbfBUHgR+4VhHSLLUSlVeuDemB9Fe5Eyl29yojoVvS2uJr2Zoz/ekq1I9iiai/XLSB+b6P2FwUub27Nrkl3HvcNGjRGSth9Jab0=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=ol3CtWFw; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=ol3CtWFw; arc=fail smtp.client-ip=52.101.65.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=uM23JzmKF7yc5o7pj778VF8CjY/YxsbBPnPVzhVVUMxD5Ki6UMjvmvgmBGE4sYPJEeKfAhRqljAE/yg/lU0lQz/4ngA/HVn8EdEAKyvdPUB5nXgkrZksgHE78Shj4LnQP7Yd/w9nVTNaJNwEm50y4Qpr9IxpCbNRPDcn0NR4i6lCMTOrqIfVMi7E1803q5LJ3nQBIB9g7v23OoubeUZYrD9Mah4PSCI3SgZhT9Jwxhp9RWZB87GIIOGTh72Li5N3L2UD0/cScnpwK1Dn3CaInBulEZw73EfuOYygCrHiWrcQmg68nPtZMCy+1oR5+/KMyz3KPlalCDcUD05rpJL2iQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xWHa4V7WVCCoP+M66sofqSjYBJrXAyrpvxfZ2n5ljMI=;
 b=vhntan8Pergh5Ejl6ZDARfmqNJcUROmunBKZab6FjvzliqMnk0HyPB1wUnW0YUowsNiY1CRFJQJSTy4rbh/MYb9t4wj3cj+14pA8l7hhRmIZAPX6nwwOOKv2XINq+P2yKzWMTtcZn8X6iErySkTrGEREHlS2S5I1Ijy9kBXxeSuap4PS8vfHTOn6vvSVf1TXBVxkI7wbpeygmwk6wtSUGjqG92TpPmtBEoojTQMd8uZkBXN5R5MtPPTxcIaFMuSUnOvcKgt7TNPu50kJgod+PpIiGmTu+vDS44aNiZnEkenoMC40b5nxU/MKWkX8k9B/vIxrTmzpKZGzw7KN87tQOA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=glider.be smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xWHa4V7WVCCoP+M66sofqSjYBJrXAyrpvxfZ2n5ljMI=;
 b=ol3CtWFwu1ztjcFzZvauFKITlpou50WfdefqVUmSQwrPK9y6+k4BdqRh6j7IdZSTnj2+jwSgTzufNEAirB5wZcNOUTSvftaHbN7/s2maXgJ9+i3t0/EkDDMGxn+Uf+z1gGFhGPe1Hgec5B2M/f7LmM77dwt/L2ZhMw+BqRjjtfJLKSdDWV/HkzAVs7t5wwfEZKazDaY5zqSX49WVoqzcSyO1mLRMxY9Au1RKksqGe7NYDtWaSC7YM3C+08SBYtnlZUH52woq5ybxyCEgRiNrv1TARYx0BntjsCTfBHcVZQH8R64Q9qYGY65Icgi5hFKxav1OYeT9rpjCMBouvsaxag==
Received: from DB9PR01CA0017.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::22) by GV1PR04MB10535.eurprd04.prod.outlook.com
 (2603:10a6:150:204::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Sun, 3 May
 2026 11:18:27 +0000
Received: from DU2PEPF00028D08.eurprd03.prod.outlook.com
 (2603:10a6:10:1d8:cafe::b9) by DB9PR01CA0017.outlook.office365.com
 (2603:10a6:10:1d8::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Sun,
 3 May 2026 11:18:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU2PEPF00028D08.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.22
 via Frontend Transport; Sun, 3 May 2026 11:18:27 +0000
Received: from emails-1631525-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-105.eu-west-1.compute.internal [10.20.6.105])
	by mta-outgoing-dlp-291-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 5A0787FD1C;
	Sun,  3 May 2026 11:18:27 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sun May  3 11:18:17 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kal+F6K3keH4SrcGdcPqLfaebku/hw9QkSMIXvFLtE4WPoWq5TSTzbEZ5SWXWAao9PumJGaKvMcL199TdaO4Jo4XEtOD8lxc9xeJf2gMXkruWHIb4/YeE9+hyIbtGAjt5gn654kB1fg9sI273ZJ2TbstVSsY0CxAhUrIg/14FORm95/r/jJhZ8wUGUjbg+5ZnagCz8k4PkyZ1IYvfET6+MjVlTIIxcyVh5Rz67yxOdKibHQ5CyTa32EnDUQ6lECW5m3PEvATyc+gqDKWZb8RqJV5WS6qQMfAjTpUoHoP0/4AyzDlIovzGV1sPGmYQm40rh8OP2e9H2kzb+SaAaYkxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xWHa4V7WVCCoP+M66sofqSjYBJrXAyrpvxfZ2n5ljMI=;
 b=qSxl7ahk8yylOJb1eCenWvsn6q9OitQDpCfPJskjqamMfx2kLmNtj7eAr6mKk8NoIOMShDRLKGopGqSR/DEbLJIR6sb3wgCgioNamRNnGqvDE4CPXLrfQ/SJnbdDzW79Dy/+ygIY3rWYZs7KH6H23YZqmGdrAuq7nIQWZxNqTpKmEs+XnIosbvnc7daVBk5ttUmMuwBCrIkd6cY8U9o3yfdigpt4ueG2X+quvlzOgQRJg4MggapVgniQZQ8wZ2zHW1glJ4dRO+6wWWm/9do+0yhgRZjIRzeHNyY0rDuaVp9N9fib+6KmPFj8jXw0xax9u5p8ITfdDd9z9m43sQlGTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xWHa4V7WVCCoP+M66sofqSjYBJrXAyrpvxfZ2n5ljMI=;
 b=ol3CtWFwu1ztjcFzZvauFKITlpou50WfdefqVUmSQwrPK9y6+k4BdqRh6j7IdZSTnj2+jwSgTzufNEAirB5wZcNOUTSvftaHbN7/s2maXgJ9+i3t0/EkDDMGxn+Uf+z1gGFhGPe1Hgec5B2M/f7LmM77dwt/L2ZhMw+BqRjjtfJLKSdDWV/HkzAVs7t5wwfEZKazDaY5zqSX49WVoqzcSyO1mLRMxY9Au1RKksqGe7NYDtWaSC7YM3C+08SBYtnlZUH52woq5ybxyCEgRiNrv1TARYx0BntjsCTfBHcVZQH8R64Q9qYGY65Icgi5hFKxav1OYeT9rpjCMBouvsaxag==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by AS8PR04MB8022.eurprd04.prod.outlook.com
 (2603:10a6:20b:28a::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Sun, 3 May
 2026 11:18:11 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%2]) with mapi id 15.20.9870.023; Sun, 3 May 2026
 11:18:11 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 03 May 2026 13:18:01 +0200
Subject: [PATCH 4/4] arm64: dts: renesas: add support for solidrun rzg2lc
 som and hb-iiot evb
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260503-rzg2-sr-boards-v1-4-8545677f93ca@solid-run.com>
References: <20260503-rzg2-sr-boards-v1-0-8545677f93ca@solid-run.com>
In-Reply-To: <20260503-rzg2-sr-boards-v1-0-8545677f93ca@solid-run.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Jon Nettleton <jon@solid-run.com>, 
 Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Yazan Shhady <yazan.shhady@solid-run.com>, 
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::9) To GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GVXPR04MB12057:EE_|AS8PR04MB8022:EE_|DU2PEPF00028D08:EE_|GV1PR04MB10535:EE_
X-MS-Office365-Filtering-Correlation-Id: 2015ad2b-1165-44c3-6620-08dea905b2e9
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 LQUXPgy7MjLOoZ+qNySPWlN5Za+JrY9YnBWrGFTkJqqis/FzTi8Q4a7Kg16DapPvhmL6L4C5eMXNATC6jfJg6S9m+gKCykxyV9TbpBXrnzJJCKKorwklmNjheq4fUd1qe7WYgf7A15Lyafz+hZ7MeiiVAJy05k4wWuDyd4tzz0TyleLiw5eF1SHJkcpNTWQ48jG79Lm+6VG0S4pVazAR/c3xlnFgWQyM8fzDHyzeLrhevh3x8kqSlxm4jfmCnwgovPI6z0jCiOfQmS/FX9BbHgTGI9cAY6OrneYO0D1c8c/rUx6iDm96EOFj4pzSvuNOc6vmvDAFaG+6glZhALqU+NDTC8LZVVsO1gPiB1E0S63MkYZldYMwNz1fhiKugf7TQ6d48UmPMH5U281hjNZM2IIWKIMcKVkHkL4JzrNBIyOJOqJuXhyMlPKN2R/OyBm3rSrrNbzVhDNK2qLuszdiK6cudhmH+dCajK5U/okgmmCYtB9W5tHvx6+JMbvn5rKcp2VZSRzV3mzE/UXne+8HD24IPrO3J5n/x+xEqSRRbBGn3bXDGEq1t05wiv/u6lzYH6vsyJHZG4AJqHMMzbp+kW5BNNeis8z2lI4zOJOndoRjQhJv4HzU4ktda/i/hMCA7XamPCjiTmgd/yUpC5iwpqkaun9EuMJnMUJUoaFApktiHF8p8RvZCA6DBf5bxn5mYl4Lw2fvPz3a0YJ7JLe++ROZx0qwSzDqtneAMaKSs8vk1U0kFcaxahPSDsB3uEfk
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 JU8yr6z5HE/mn2XdvJ6/nAohGuR9q2gKljbXmCZEn1Ov243eDAi/2uVcqGwN3iNrVLa6wSum7LntVpno478dWfrwMwZnT5z0JYsRP6GrXuEexyEo2O5/k5euPq4bD2gln+CiFEbNpAP59MDo9gq3wl8sqf1JrjPQjSRyrst58P/Ua1+OVlM5xFRSOCA5AGkfW5QpIQB3TnD3q59tpwQYQN5VmRHKY1dw063Tqr40hR1lGT/4qwmCEr3EFH4GNFcy0Q6bSdeoCw/+7QuwTFLqhx3PQOxllInTifas+6PGDtWS8/p4afW7m0IzUANEnHqWj9IApSDdrlFqOWyihUt9/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8022
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-6.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 0d02deb8a65a4573b31aac792c463531:solidrun,office365_emails,sent,inline:4d3f30dacdf940b3d93398ab685c33cc
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D08.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	907536c5-786c-4916-a056-08dea905a954
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|14060799003|35042699022|82310400026|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	5v67MxhZBW7FczEhwsHeAvyMO7S/n+FDal5AH5suzVdrKh9DQa9xIdVWc997+DQ2GL1ua5+Yo7XOJX0u2KzIOXKG7FjnfEIf7qp76om7qdySz1x1jy6XGDGG9cedCW4Glf75Li1qh8qGDIDALBErAhQ+4PJd00Uj2gl/Mf3PVgVfLztFVZd5wGfzdSHDII2Mj/Yo4PZX5wpJb3WfJ/oGdFCO6o7jo5YFrKA9Z14CzQec+TnFdLkPRSwHFiTzKJXxKRRZZXegipcPrnvcPNgj7kpsVl5d3mtZdGP0bKTKmcvorrwuFYY7cgcGtai2wzyufsveJJAMiM/DxwtmuiAgGHKfNVyaFnPjb2u8mpTli0AT6Fm88jhvxl5euDCAWegIbYxUNI9dT9T2TG1bJKeI9xlZpEzJIg860O8z+7F7og7uwTX4+wCbME3WmNShjBjMiL6edDJpbn6hhexEwiIkvA4DFoJoAfnFjyM6j6ka4ABj5thV3CJgdBYjxx+5+aoyUZMbgg+qsHMzOtsaEsLwzSmvfqSbW/p3V3PHVP45UXm7qoiPeFTwhHwlVqHJ1rrGFxs+S5azwDgmvTDAmgkJx5/Da4LFYVjWFCp7/QTGZOUoXhsGDDgV5ynfAkTASls+uEkSakBF2W08jLPsQvuQnvmWbCMlLmExQRum5ykpiOe0zbnZLWhJ5x2zpk/CBhS6Ylyek85LZZD6mgafMySmpLKMRsIRHjZKXpkzaITjxhY=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(14060799003)(35042699022)(82310400026)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	f4A0WCws9e6AND5z6Xq+iWdfwBkoTlp1qh6aSMkUWT/Csc/hdm4S/sgjreDhml7CJKjvMoOC5RwXuH/0cTeVsFsGznMQG1J1mzMHy8APVKSTnNSHv95xuVRCvPrEFYN/wNOBtul7FViPFzyfeu6Lmn3T1GgCSsVtg39/77Dq8/Drs7mz0oDUo4uivkyE1I6LFMfLVutelPc4puKMwJ3SjjMrKbP17WzVO9k4BSjQqVKOCB/Ssu4ijw1GJbu9zIK01JBkrG0gKNpTG5XZyvwo+O4l5XwRjuHRY0rKMpJS7uiDWmv7ixwfhKSMXD4AsC3DE0JZjPtptFw7Lz8ApuHlBwczcO6Dp1jxoDUKaWrR/vrVgNH4Unz4cHQedvLnn+vy6ZHf8b378vi2UCLwjbej6W38TgTxjH+8UYYkXqagg8KGRfmZ0rKvRZypJO63kVgy
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2026 11:18:27.4327
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2015ad2b-1165-44c3-6620-08dea905b2e9
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D08.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10535
X-Rspamd-Queue-Id: 9B7854B5417
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	ARC_REJECT(1.00)[cv is fail on i=3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31897-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[solid-run.com:s=selector1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,3.117.2.128:email,solid-run.com:email,solid-run.com:dkim,solid-run.com:mid,0.0.0.0:email,0.0.0.12:email,0.0.0.50:email];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[solid-run.com,reject];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DBL_PROHIBIT(0.00)[2.98.90.0:email];
	FROM_NEQ_ENVFROM(0.00)[josua@solid-run.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[solid-run.com:+];
	NEURAL_HAM(-0.00)[-0.987];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	R_SPF_ALLOW(0.00)[+ip4:172.105.105.114:c];
	RCVD_COUNT_SEVEN(0.00)[9]

Add support for the SolidRun RZ/G2LC SoM on Hummingboard IIoT.

The SoM features:
- 1Gbps Ethernet with PHY
- eMMC
- 1/2GB DDR
- WiFi + Bluetooth
- SDHI Mux switching between eMMC and Carrier Board

The HummingBoard IIoT features:
- 3x USB-2.0 Type A connector
- 1x 1Gbps RJ45 Ethernet
- USB Type-C Console Port
- microSD connector
- RTC with backup battery
- RGB Status LED
- 1x M.2 B-Key connector with USB-2.0 + SIM card holder
- 1x DSI Display Connector
- GPIO header
- 2x RS232/RS485 ports (configurable)

The RZ/G2LC SoM was designed to be pin compatible to G2L SoM, with
slightly reduced feature set.

Descriptions for eMMC, microSD, and RS485 are shared with G2L.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/renesas/Makefile               |  11 +
 .../dts/renesas/r9a07g044c2-hummingboard-iiot.dts  |  20 ++
 arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi     | 373 +++++++++++++++++++++
 3 files changed, 404 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index cdf59f3240e27..adba304a9d767 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -164,6 +164,17 @@ dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043u11-smarc-du-adv7513.dtb
 r9a07g043u11-smarc-pmod-dtbs := r9a07g043u11-smarc.dtb r9a07g043-smarc-pmod.dtbo
 dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043u11-smarc-pmod.dtb
 
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot.dtb
+r9a07g044c2-hummingboard-iiot-emmc-dtbs += r9a07g044c2-hummingboard-iiot.dtb rzg2l-sr-som-emmc.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-emmc.dtb
+r9a07g044c2-hummingboard-iiot-microsd-dtbs += r9a07g044c2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-microsd.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-microsd.dtb
+dtb-$(CONFIG_ARCH_R9A07G044) += rzg2l-hummingboard-iiot-rs485-a.dtbo
+r9a07g044c2-hummingboard-iiot-rs485-a-dtbs += r9a07g044c2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-a.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-rs485-a.dtb
+dtb-$(CONFIG_ARCH_R9A07G044) += rzg2l-hummingboard-iiot-rs485-b.dtbo
+r9a07g044c2-hummingboard-iiot-rs485-b-dtbs += r9a07g044c2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-b.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-rs485-b.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-smarc.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-smarc-cru-csi-ov5645.dtbo
 r9a07g044c2-smarc-cru-csi-ov5645-dtbs := r9a07g044c2-smarc.dtb r9a07g044c2-smarc-cru-csi-ov5645.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot.dts b/arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot.dts
new file mode 100644
index 0000000000000..06d9d031cbe91
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include "r9a07g044c2.dtsi"
+#include "rzg2lc-sr-som.dtsi"
+#include "rzg2l-hummingboard-iiot-common.dtsi"
+
+/ {
+	compatible = "solidrun,rzg2lc-hummingboard-iiot", "solidrun,rzg2lc-sr-som",
+		     "renesas,r9a07g044c2", "renesas,r9a07g044";
+	model = "SolidRun RZ/G2LC HummingBoard IIoT";
+};
+
+&vmmc {
+	gpio = <&pinctrl RZG2L_GPIO(18, 1) GPIO_ACTIVE_LOW>;
+};
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi
new file mode 100644
index 0000000000000..e244836f5ec39
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi
@@ -0,0 +1,373 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/G2LC Solidrun SOM
+ *
+ * Copyright 2023 SolidRun Ltd.
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+/ {
+	aliases {
+		ethernet0 = &eth0;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		mmc0 = &sdhi0;
+		mmc1 = &sdhi1;
+		rtc0 = &pmic;
+		serial0 = &scif0;
+		serial1 = &scif1;
+		serial2 = &scif2;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	sdhi0_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		/*
+		 * Mux switches SD0_DATA[0-3], SD0_CMD & SD0_CLK between
+		 * on-SoM eMMC and board-to-board connector using one gpio:
+		 * 0 = connector, 1 = eMMC.
+		 */
+		mux-gpios = <&pinctrl RZG2L_GPIO(22, 1) GPIO_ACTIVE_HIGH>;
+	};
+
+	reg_pmic_buck1: regulator-pmic-buck1 {
+		compatible = "regulator-fixed";
+		regulator-name = "pmic-buck1";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <1100000>;
+		regulator-min-microvolt = <1100000>;
+	};
+
+	reg_pmic_buck3: regulator-pmic-buck3 {
+		compatible = "regulator-fixed";
+		regulator-name = "pmic-buck3";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+	};
+
+	reg_pmic_buck4: regulator-pmic-buck4 {
+		compatible = "regulator-fixed";
+		regulator-name = "pmic-buck4";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+	};
+
+	reg_pmic_ldo1: regulator-pmic-ldo1 {
+		compatible = "regulator-gpio";
+		regulator-name = "pmic-ldo1";
+		gpios = <&pinctrl RZG2L_GPIO(39, 0) GPIO_ACTIVE_HIGH>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <1800000>;
+		states = <3300000 1>, <1800000 0>;
+	};
+
+	reg_pmic_ldo2: regulator-pmic-ldo2 {
+		compatible = "regulator-fixed";
+		regulator-name = "pmic-ldo2";
+		/*
+		 * This ldo can switch mmc host controller io voltage between
+		 * 1.8V and 3.3V by assembly option of pull-up / pull-dow.
+		 * Default assembly is 3.3V.
+		 */
+		regulator-min-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		mmp_reserved: linux,multimedia {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x68000000 0x0 0x8000000>;
+			reusable;
+		};
+
+		global_cma: linux,cma@58000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x58000000 0x0 0x10000000>;
+			reusable;
+			linux,cma-default;
+		};
+	};
+
+	sdhi1_pwrseq: sdhi1-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&pinctrl RZG2L_GPIO(23, 0) GPIO_ACTIVE_LOW>;
+	};
+
+	/* 32.768kHz crystal */
+	x2: x2-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
+
+	memory@40000000 {
+		reg = <0x0 0x40000000 0x0 0x20000000>;
+		device_type = "memory";
+	};
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&eth0 {
+	phy-handle = <&phy0>;
+	pinctrl-0 = <&eth0_pins>;
+	pinctrl-names = "default";
+	/*
+	 * ravb driver does not configure mac internal delays for RZ/G2L(C),
+	 * instead delays are added by the ADIN1200 phy driver.
+	 */
+	phy-mode = "rgmii-id";
+	status = "okay";
+
+	phy0: ethernet-phy@0 {
+		reg = <0>;
+		interrupts-extended = <&pinctrl RZG2L_GPIO(27, 0) IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+&extal_clk {
+	clock-frequency = <24000000>;
+};
+
+&gpu {
+	mali-supply = <&reg_pmic_buck1>;
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	eeprom: eeprom@50 {
+		compatible = "atmel,24c01";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&i2c2 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pmic: pmic@12 {
+		compatible = "renesas,raa215300";
+		reg = <0x12>, <0x6f>;
+		reg-names = "main", "rtc";
+		clocks = <&x2>;
+		clock-names = "xin";
+	};
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
+&ostm1 {
+	status = "okay";
+};
+
+&ostm2 {
+	status = "okay";
+};
+
+&phyrst {
+	status = "okay";
+};
+
+&pinctrl {
+	eth0_pins: eth0 {
+		pinmux = <RZG2L_PORT_PINMUX(28, 1, 1)>, /* ET0_LINKSTA */
+			 <RZG2L_PORT_PINMUX(27, 1, 1)>, /* ET0_MDC */
+			 <RZG2L_PORT_PINMUX(28, 0, 1)>, /* ET0_MDIO */
+			 <RZG2L_PORT_PINMUX(20, 0, 1)>, /* ET0_TXC */
+			 <RZG2L_PORT_PINMUX(20, 1, 1)>, /* ET0_TX_CTL */
+			 <RZG2L_PORT_PINMUX(20, 2, 1)>, /* ET0_TXD0 */
+			 <RZG2L_PORT_PINMUX(21, 0, 1)>, /* ET0_TXD1 */
+			 <RZG2L_PORT_PINMUX(21, 1, 1)>, /* ET0_TXD2 */
+			 <RZG2L_PORT_PINMUX(22, 0, 1)>, /* ET0_TXD3 */
+			 <RZG2L_PORT_PINMUX(24, 0, 1)>, /* ET0_RXC */
+			 <RZG2L_PORT_PINMUX(24, 1, 1)>, /* ET0_RX_CTL */
+			 <RZG2L_PORT_PINMUX(25, 0, 1)>, /* ET0_RXD0 */
+			 <RZG2L_PORT_PINMUX(25, 1, 1)>, /* ET0_RXD1 */
+			 <RZG2L_PORT_PINMUX(26, 0, 1)>, /* ET0_RXD2 */
+			 <RZG2L_PORT_PINMUX(26, 1, 1)>; /* ET0_RXD3 */
+	};
+
+	i2c0_pins: i2c0 {
+		input-enable;
+		pins = "RIIC0_SDA", "RIIC0_SCL";
+	};
+
+	i2c1_pins: i2c1 {
+		input-enable;
+		pins = "RIIC1_SDA", "RIIC1_SCL";
+	};
+
+	i2c2_pins: i2c2 {
+		pinmux = <RZG2L_PORT_PINMUX(42, 3, 1)>, /* RIIC2_SDA */
+			 <RZG2L_PORT_PINMUX(42, 4, 1)>; /* RIIC2_SCL */
+	};
+
+	qspi0_pins: qspi0 {
+		pins = "QSPI0_IO0", "QSPI0_IO1", "QSPI0_IO2", "QSPI0_IO3",
+		       "QSPI0_SPCLK", "QSPI0_SSL";
+		power-source = <1800>;
+	};
+
+	scif0_pins: scif0 {
+		pinmux = <RZG2L_PORT_PINMUX(38, 0, 1)>, /* SCIF0_TXD */
+			 <RZG2L_PORT_PINMUX(38, 1, 1)>; /* SCIF0_RXD */
+	};
+
+	scif2_pins: scif2 {
+		pinmux = <RZG2L_PORT_PINMUX(42, 0, 4)>, /* SCIF2_TXD */
+			 <RZG2L_PORT_PINMUX(42, 1, 4)>, /* SCIF2_RXD */
+			 <RZG2L_PORT_PINMUX(5, 1, 2)>, /* SCIF2_CTS# */
+			 <RZG2L_PORT_PINMUX(5, 2, 2)>; /* SCIF2_RTS# */
+	};
+
+	sdhi0_pins: sdhi0 {
+		pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3",
+		       "SD0_DATA4", "SD0_DATA5", "SD0_DATA6", "SD0_DATA7",
+		       "SD0_CLK", "SD0_CMD";
+		power-source = <3300>;
+	};
+
+	sdhi0_uhs_pins: sdhi0 {
+		pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3",
+		       "SD0_DATA4", "SD0_DATA5", "SD0_DATA6", "SD0_DATA7",
+		       "SD0_CLK", "SD0_CMD";
+		power-source = <1800>;
+	};
+
+	sdhi0_cd_pins: sdhi0-cd {
+		pinmux = <RZG2L_PORT_PINMUX(18, 0, 1)>; /* SD0_CD */
+	};
+
+	/* SD0_RST is only routed to eMMC which uses fixed 1.8V IO voltage */
+	sdhi0_rst_pins: sdhi0-rst {
+		pins = "SD0_RST#";
+		power-source = <1800>;
+	};
+
+	sdhi1_pins: sdhi1 {
+		pins = "SD1_DATA0", "SD1_DATA1", "SD1_DATA2", "SD1_DATA3",
+		       "SD1_CLK", "SD1_CMD";
+		power-source = <3300>;
+	};
+
+	spi1_pins: spi1 {
+		pinmux = <RZG2L_PORT_PINMUX(44, 2, 1)>, /* RSPI1_MISO */
+			 <RZG2L_PORT_PINMUX(44, 1, 1)>, /* RSPI1_MOSI# */
+			 <RZG2L_PORT_PINMUX(44, 0, 1)>; /* RSPI1_CK# */
+	};
+
+	spi1_cs_pins: spi1-cs {
+		pinmux = <RZG2L_PORT_PINMUX(44, 3, 1)>; /* RSPI1_SSL */
+	};
+
+	usb0_vbus_pins: usb0-vbus {
+		pinmux = <RZG2L_PORT_PINMUX(4, 0, 1)>; /* USB0_VBUSEN */
+	};
+};
+
+&sbc {
+	pinctrl-0 = <&qspi0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	flash@0 {
+		compatible = "winbond,w25q80bl", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+		m25p,fast-read;
+	};
+};
+
+&scif0 {
+	pinctrl-0 = <&scif0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&scif2 {
+	pinctrl-0 = <&scif2_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	status = "okay";
+};
+
+/* WiFi */
+&sdhi1 {
+	/* Murata 1YN max rate is 50MHz */
+	max-frequency = <50000000>;
+	bus-width = <4>;
+	mmc-pwrseq = <&sdhi1_pwrseq>;
+	non-removable;
+	no-1-8-v;
+	no-sd;
+	pinctrl-0 = <&sdhi1_pins>;
+	pinctrl-names = "default";
+	vmmc-supply = <&reg_pmic_buck4>;
+	/*
+	 * Host controller IO voltage is provided from reg_pmic_ldo2,
+	 * WiFi module IO voltage from reg_pmic_buck4.
+	 * Neither is configurable at run-time so either can be set here.
+	 */
+	vqmmc-supply = <&reg_pmic_ldo2>;
+	status = "okay";
+};
+
+&usb2_phy0 {
+	vbus-supply = <&usb0_vbus_otg>;
+	status = "okay";
+};
+
+&usb2_phy1 {
+	status = "okay";
+};
+
+&wdt0 {
+	status = "okay";
+};

-- 
2.51.0


