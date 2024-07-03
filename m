Return-Path: <linux-renesas-soc+bounces-7012-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D74D4924CA6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2024 02:13:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CD9F1F22865
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2024 00:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B52F376;
	Wed,  3 Jul 2024 00:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ctdcg7E/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011032.outbound.protection.outlook.com [52.101.125.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91F02900
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Jul 2024 00:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719965608; cv=fail; b=jX4oSQKci2432kob9kvOm+ncfthE04ALjhMUvBEHbs7DPdQj5PWY4bMdPb1Q1xOXraNs7zd7J1WXYZe6HNv7S47OYBmrBOeQz5Crmt/V88BRfFMCUHL4USWWzdkXizDNaLM7JLgwBzjkLZyFJFnnETj6oMX24yFYImiaEfGqUPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719965608; c=relaxed/simple;
	bh=zhb7HVcTRVsbnP8aD0i0/1xQxi93czwSvWOCu5bZIF8=;
	h=Message-ID:To:Cc:From:Subject:Content-Type:Date:MIME-Version; b=qI6yAnq+HEsXs3JB8eWtqW87FVURufFp7eP2QmpecFRqXVdgR4PcpbLwOHy5PQlZIJtc5KnkTA18NRCLYjfjMRwQEZPLb5QEL7glwzKoqXueNrgXA5RDP+7uVIhWoKCxPivb3KM3HIpGVjvkBMhesYnrxbFReufMGkXS4YtEm4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ctdcg7E/; arc=fail smtp.client-ip=52.101.125.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mrC4tUArrTNu3hiIIp8OXR9KPD+idjpzCBDbVmDpk0xacudqoBXRRi9r+vHeQYQ4koib6KFtwAZEoBBtCfOkqSfoKRZvN1zzO0Zwz8jCR0K2Kv/0YNFvqT0JUET9irPDMInAifLIq01XOjTUy38WwwaDQ+re8sHWRJHm4I8ZcVxv0jiPKv0R9U8+1apU5+ulD9aXxQbHk3s2d1RBMy1LqF2TvzPuawfjw08j2fuqJ9wtjX14uezg8qKn9f4uBQRF3mJxr8mB8mujfBB/Gy3aNYtKADwjhm0nMcdFnwOxDs1bl7WmNQA7rsKHeIprE4nL6Ql7kGgi8+4dzTLmqNSU6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJp7rt5vrpPIHCL6C97mLSzDvHRkpE9kLpePOIHjOSA=;
 b=B326Th1A1GuOOS8yZFf40ZTtL+1Uc9foy5wdnRL/25/3ZeKdyHUT4qRsmfPo5bR7+3pgLlig8gvxFVwfFLzbBnDjXlAniCzZF469LsV3fxEsiTB0LOW1sOYjCVQfw1EXDaMvmwrGlx3QErhfPlA0KpPplnvxenemKzXpcfH3HYJVVTHZIpgFDGQ6gFbiAtO95UV7jeFXMipoOh1xP0LRXpSdgVFJOAQzF8wtOzT+1eRRCr5Pt58HrIbulq45K/XWGrFR/BFLrQEDlXCgyd9V8I7hOcQ/BayRNJOipfOdhJWbJEIDvqiDORMWZxjHNI5m3hPJKt68amKjZtLdfXdNUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJp7rt5vrpPIHCL6C97mLSzDvHRkpE9kLpePOIHjOSA=;
 b=ctdcg7E/k/TAM/I0S9fS4OeprRH3YooU1smYFwAZQ98W8XSQ8zH57CqilijZBKcygTW3eQsnNAHTqkcxz3JNcMwcZT8MEtHJbCLUvHGv9TV6A79br7tBxkCALzm52nm218mF5OjEto8xk0VCWncGxlZ6IZtC9ncgMDuBUQftzjQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS0PR01MB6179.jpnprd01.prod.outlook.com
 (2603:1096:604:ce::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Wed, 3 Jul
 2024 00:13:21 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7719.029; Wed, 3 Jul 2024
 00:13:21 +0000
Message-ID: <87ed8bbae7.wl-kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org, Khanh Le <khanh.le.xr@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/3] arm64: V4M GrayHawk Sound support
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 3 Jul 2024 00:13:20 +0000
X-ClientProxiedBy: TYCP286CA0023.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS0PR01MB6179:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bcbd973-67a1-45bd-e44c-08dc9af4f258
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ALTmh0IVxVpToAwP5DAOpvm6m/QN92JP0ojd0Uhf8UZUGvGa+bI4hYPSeUBR?=
 =?us-ascii?Q?AtevNfzcdY8QAgVb6EjUY+OZHO4q996oePyikgFFR5nw5si0e6z0U5Inwcpq?=
 =?us-ascii?Q?FLBLZggxI82vIAHDIdBeSrBIoqYIVJwR0DlOcCM8xBCI/ewSkPNLSY47LMUf?=
 =?us-ascii?Q?B+gwFKqFSvYcfWQ84yLVAUXxs7/YeLuKLVhRpd+Y/wrBmrnpi9Buy0Cbk3UO?=
 =?us-ascii?Q?A5CoUUDTKuFX3KdIA90r+7p3GGUtgX2tvAqP7mkG2yY+OqD+GE3hHFCZEueB?=
 =?us-ascii?Q?Po8YQKlWBE78/GDygDJUqN6FEX2DQFvcsvD/UpDpy2o+Gcajd9YHahpNszEv?=
 =?us-ascii?Q?07vcU2nDhh1i2MmV4SzlBNiBYQpPhObcKdu79dPSpQz0iySOQr60KNq1PM5d?=
 =?us-ascii?Q?71J80qJeSyh6JVveOnJfiHbqjxLshxY4u3LDLKhSeP1tJ0kmL4QfkNgXjPEL?=
 =?us-ascii?Q?uRamyQAws25tuAL/bAIPEAJ5CFL41gwKKwhIIX+pfTmBUGZOBhfwrcbppoyI?=
 =?us-ascii?Q?eZuHm0nk0n4bzbjiz+P5AMN2OWvgjtlbjKa+e9h3xa1ZKhicMlDjYXwgcLT+?=
 =?us-ascii?Q?XB4eZaxsAwZhfKohoqam2+ThHIRrFxL/sMgHsIzbGyBOPeJcYrCQ00BAXYdo?=
 =?us-ascii?Q?tv6oLaHytKfiZy1H1wOI7yZtUE+1zbNBdmNQ2tMp3f+/sL4TODCs8e5u2dQX?=
 =?us-ascii?Q?LUfEcTc2c5fIjcrRC0rBzI2fx+GMjX8aF4ddgff7HxMEqzKhoZjF0IRypnth?=
 =?us-ascii?Q?JuBolNnEp3BMD7L0Z2afSc3iWUF0sdbu0ZjHbK3VhFRYiXVP1i0oyzskoWPb?=
 =?us-ascii?Q?xL89PEmwisnx5mEuzdIRsurfj5LRsFnwl6Z6itZilEBEreBhcf3pOXJwJNM0?=
 =?us-ascii?Q?ofPDPFUH5bizWYH5EL2l0GLJkKEdEEwYplf1EBAZw3yzHEkeHkI3FnkDaFZY?=
 =?us-ascii?Q?UMLI3mhjIOQuKsjBsHWaAH3V8gsdafcHbH/OUlUMR0DNSbpUP3y2HHpBMWzt?=
 =?us-ascii?Q?GXI4biJudNO1l23NUI0Orr5nNQEy0gugy54qAnw8vy1fEEh2KM70dm0ZfMmE?=
 =?us-ascii?Q?gkESnRpRugfuinCZn4NMo/bohERtNjk53cIPLGxMb62NsVlW1GtwJCGZkPux?=
 =?us-ascii?Q?sLz5IKnUlgP+Qgps8ButYGSEHMa60i+6JEmZ7tn8kt7QEn+A1w+7yDlqX0Zy?=
 =?us-ascii?Q?GTzMYh2tjQWzS/yHAYqMc/WebylvH+bphpHWN9CnycVsIpS8PgfuqMPJEIoS?=
 =?us-ascii?Q?v3woK3vAwGz9iKbCEIzHo07DEpG40AQffJRTcfNO0ppbDsqv9TKNQmfN/THT?=
 =?us-ascii?Q?akINqnqHs4pNI+pVEKQipc1au9e3S9UHhRuS+eW9NMzyhrT8Bf+FEpBRuRVm?=
 =?us-ascii?Q?W/FjVDhn1P+wTrWOwLdCvXyuZPW3lDe7TbeQpUy0BHODZAM2nw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NzVYrGJbm8G95qfnSeLc4nbIu6kPTBQvv/Mdqcfucv8fSphU/JyyZf9TLyjH?=
 =?us-ascii?Q?WwkRHsOY2K5ThyOAnOExmhr2/KfgLfFeHQzmaAbN7y7PGeqEfMSP2rG6H3yz?=
 =?us-ascii?Q?eV2rtlBj5SULoLQZGGwyyEfCu5k83SBRIZoTzuEstZ0CiPv48JIN6nOj+IDs?=
 =?us-ascii?Q?6JeajoU2FJtw2gaYFYlC1pScLKiqsP2LJ0R64mZWCMcpvVwiz9SWtESvSY+5?=
 =?us-ascii?Q?1uMMFjgLNLzIugo6x66kgMsfz9RvuFty3QcZ/raNSag8Z9jXb55oWfWSNFXt?=
 =?us-ascii?Q?FuFNWjz0CbtNvlHKQfqfpB/RDQ3TwuiuPDpxo4uEtnbNJe05QmxiXXPsnVRk?=
 =?us-ascii?Q?B1l0Qx42xng6KRgFewU/pZo+yHcidwj+jOjS9fjpkbBDOLL+W8ifZ8pUY5A/?=
 =?us-ascii?Q?4cZxSQ1ZDQJmfjNUcYb8O/HahgAZxMKVMDCf+ktpstcoIJ5kRsKL0wHiwwf3?=
 =?us-ascii?Q?FJrKbKYi66ZQ0JvzLgqt9hpK0/RfArEtOklRl0NFbW1//3eNDQfcb2YukY4W?=
 =?us-ascii?Q?/AteHhk7BqCfs/Eqt5DLZ4MBDmCasDt9GFLJ5KEC135GGYQ67st3aC9HIh7L?=
 =?us-ascii?Q?wUdH2/mSZLCvGMtWal6edKT0ociJRyKVmclwvSZRqjSqfwR+B2LSakXiqirj?=
 =?us-ascii?Q?LcUeU9yALBP0Jv2FvrRoe15NZyhQDiB80LVQ4UEdlzFqVyNicbjvreFrQDs1?=
 =?us-ascii?Q?p2HDOhfYrxkwJBHkHE0wrAD0viBn/NLul8DqwZ7vOs8y8z1GmbvS0kyxGRUM?=
 =?us-ascii?Q?ELQa3L/D516CVTydxlpJMSAhyLE7Wgww9whBAb1cjlZeneV7ktFvwGfaG4mt?=
 =?us-ascii?Q?v+eJHQ95tODa5aGOFKWZnCaM9IGCUx3E8b9+3FiLSoDC2o911SzNc3nF8bJT?=
 =?us-ascii?Q?MAsVoTzy6UPLRuWLkbVT71I1ceam4VICUyh13WHVozr5KjepVP7hmo5PLKVm?=
 =?us-ascii?Q?Xism2lPr144b8zHz3wyDWPN239vTtHkg4L76VXVZF554zLiMjSSMtylo6wdK?=
 =?us-ascii?Q?XRUnkc67jI4bzhEZVc3YpA692aN8hBST8Tg+p5Cplmdscdi2GMBTZKQTWPK+?=
 =?us-ascii?Q?1Z1QdHpkyRrjXQMNEQjXLeKlScx8mCMnLdjKrqxlNC3GpVKOQIDJqJbfNunO?=
 =?us-ascii?Q?kHNqhbvsYXD8Ph8/njjF/8MNugt8C2N9MsZhZYAHwZhOHvzPUdwUv8utiurK?=
 =?us-ascii?Q?fiLSGTmAQKsZhcNRynCIwxhTbb4PlNeMpabLNZGJrRn2p02NysH0Cd0wCG0o?=
 =?us-ascii?Q?J+Zf7hVtufEnnSqpDiyipKzCQVOQX1iKaVZn/XVoEm6ev3xdMfpf6qDBI/gO?=
 =?us-ascii?Q?wmVmkSOgrKGKYKCNN0EXwPt62UF8ko0LiiTJceP3d4eIVDzu56ikKuwvdCQw?=
 =?us-ascii?Q?AWRYItLFEkv8pN+uHPpslgrZEYjQztBXW5fOesseRyPJ5rEtC5ilsngdCUVY?=
 =?us-ascii?Q?WVlWBI7frxRXDjv5Cc7IxGfnEwnGCvhpwkfIbue5kIzZAo+8u/iIvH/P03cI?=
 =?us-ascii?Q?vgvVnqV6qUm/0EgdDc4vTGyttRPCzMyp9KKSZ9U664/ouygfGoM85NriDkIL?=
 =?us-ascii?Q?5pc7F4uTil7VN99VeAMz0KVuBdWsZftOSA5zSrx30Z6PVeOiMNCv06/Zp+as?=
 =?us-ascii?Q?AQhZdhQqyMPUxsn1uWqcP9U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bcbd973-67a1-45bd-e44c-08dc9af4f258
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 00:13:20.9414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PMCb4lAuMqXKGedCq+bgqg3XFQc/ajdb06zu+SsvWhmH6OaU7A8LJshDj7spFRuOQycVkK5eAwQpEecB8rYZGz73+uW0BgnEJyXdnJWycRG4a6FaUzmYH7eGulcMLa6L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6179


Hi Geert
Cc Khanh

This patch-set adds V4M GrayHawk Sound support.
clock/SoC part patch were already applied on previous patch-set.

Because V4M has only 1 SSI, we need to switch Playback/Capture when use.
ASoC will support board original label for MUX on v6.11.

You can find how to use Playback/Capture on DT file.
[3/3] is for renesas_defconfig

Kuninori Morimoto (3):
  arm64: dts: renesas: gray-hawk-single: Add Sound support
  arm64: defconfig: Enable AK4619 codec support
  arm64: renesas: defconfig: Enable AK4619/Simple_MUX

 .../dts/renesas/r8a779h0-gray-hawk-single.dts | 108 ++++++++++++++++++
 arch/arm64/configs/defconfig                  |   1 +
 arch/arm64/configs/renesas_defconfig          |   2 +
 3 files changed, 111 insertions(+)

-- 
2.43.0


