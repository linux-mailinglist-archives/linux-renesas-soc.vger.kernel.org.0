Return-Path: <linux-renesas-soc+bounces-9731-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BEC99DA8A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 02:10:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 394631F231C0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 00:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 272FC7F6;
	Tue, 15 Oct 2024 00:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fTOaOf/k"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011039.outbound.protection.outlook.com [40.107.74.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E03191;
	Tue, 15 Oct 2024 00:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728951023; cv=fail; b=lriqe2DH/gtesavMIPJTvKZbsIDHm8w/P5e0iwesEtslpgAF0kiJgK4BnchlXPjGr3c4LNfVdF1gRNnn3D3/2tili752Eca0Wf2DDQ2ap0A0rTFQ/3ttpO6eh2nGPty17btz8iguuKQ3O93cXf0/M7vH1FQ585XNIe7wTjOsXjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728951023; c=relaxed/simple;
	bh=YHaIfhbo9pLq7o/x9bZn6J9HRh8JxWn358clxAk6xsA=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ThvM7FdHaP6auMYLGp46975RG0uyEvKzn3wpASEvJoKLaY2tfx6SxpOIX519qj30bBwaQq50qAIZESyhs1MKv0C6M3fo2cAm1Qsa8z7f9x1KEVsHTKi7JAEiJUtGv4Q9huuC+G0X1cwk90U0B1H8ssK/y83a/2NB5h3PFx7XXM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fTOaOf/k; arc=fail smtp.client-ip=40.107.74.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F0Sm7MHCJin1sf8Z3N0DLnSzsWEMo9gvRcTP+VJ+RDkqjF3s0ivBAkd4D5wpDIxt5/oDirvtl08fBb1LZF4oKPjY6psqDKxnp4WFNnR7Q3iB/4KG2VgZbgFw5Qy/9JMN7ZJchLv9TZ6Am+hyFcNUJipsKglb987MJ1SBDJ1FU2rdgh0yNkHcXxpX+VxZEC3Jz7kc2iSQapB7VThe97fFeMju7JUEGg8R1k3IJaSh41OPXkFx8J8YIxdm46DLZIr7lmOrMX+NTQuwGtTL7ENGPF+YiD2YDaF1H10LQbQF8aPahOZJb3Oy5q4d+JY67gwxgWW7d4yssYlvi6GDsXUjlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zmg5jonAwhXVIISLfp2E6LZU3duVPioO1CVeK6wx5BI=;
 b=ELUdCO7jNVvyeC6XlW4qhg8SV2pYWWmwLFtf3DHA5UnrW9At9Uug30qFJcE9HEnvGM+zoKwJecwql3sYdGFUDqdL+s9wIDMv/OF6rznlI3JKaWpE5AfgiCs0Tsk87UN5dkXk231DDtoJW4jNKXzg10e47y9Ekx/CN/9KM46n7lT6HYrWn2Ug9VidYg2Z9+oXrbZ5hbft3YJ7SzFJnvxkJ+PBBGVqB+RLvdJfhbePbC6dKf8Pywv6iLlb5eW6KDz3s+l9epr9/FrqYhwO09YyNdjG4MIUwbFRL0JhoC0cBITZ18LToEcCw7+lg9M26qsdmJU6k8OudZcrXwgqQDRfeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zmg5jonAwhXVIISLfp2E6LZU3duVPioO1CVeK6wx5BI=;
 b=fTOaOf/kWntEgnzQmpH3jrvgp+1whHcSQeRtOVRoFpKmdtobcPE9WqdF40ZT7q9nMXpwLBSyhRubBNoKjJqRvtg9WSSvKy2TXtGNXi3PzEGcj9rmDu99D+shQ9J6MzYk1BD4F+QLkb069L4a29Hg8P73KhB7CnUiDrZlU0JQQuc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9948.jpnprd01.prod.outlook.com
 (2603:1096:400:1ab::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Tue, 15 Oct
 2024 00:10:16 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 00:10:16 +0000
Message-ID: <87r08iql93.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] ASoC: rsnd: Refactor port handling with helper for endpoint node selection
In-Reply-To: <20241011175346.1093649-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241011175346.1093649-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 15 Oct 2024 00:10:16 +0000
X-ClientProxiedBy: TYCP286CA0025.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9948:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d065cda-4a46-4df6-70f0-08dcecadbf65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uvUC8StXKDIXhs7A/geET5PsnAWf5guHrHnxa9K/Q2PuoLUWv8+JhTq/NgJ/?=
 =?us-ascii?Q?jgZmikT5lJNjcinK0sqvOBx96avtfT2vkdupdsrR9TPrjtyVNgY+ilh11NC2?=
 =?us-ascii?Q?kU8M1qhAW6FYBplEMYMpzArJz1Eh4Gx5maFAvmOZ0hYX/Ik+w+y9wJaTGR2A?=
 =?us-ascii?Q?P3NffpsFt6hbtuzgv8/Iq+GAmkXtWamz16rP0ZQHtjKL47yzU4xX6Z7FWmzf?=
 =?us-ascii?Q?+suaITwNJLKs89AV0Qc+GHp0QPBCVe6tVuvAsMpseJFGV3HCNfuC7XVutGzk?=
 =?us-ascii?Q?9mctB4B9Pn2XTCrBGQVyAUx+3PSM5Q6bmn6QqE9h0JeDJ1DupLIvnlFUOs2T?=
 =?us-ascii?Q?RE1G87yZ129rgEHwHZ3oXZdM094Q3M8mAh3zPlUvOoCULNsPZ2o1OK7Smnbn?=
 =?us-ascii?Q?4OKaeBEilalmCnRyqfjkrUo+qcdFSdkmgveuJhZ77eMOeiXZdpYHvIQNiuKx?=
 =?us-ascii?Q?bCTOxG1OIdk31Aiw+O8Ey9ZuNojxTRw4gi4lBwaeIx6GTCKSoMr1Hqt05526?=
 =?us-ascii?Q?t8hW8SI5ZU3qj2HLSToTa8f+qp5+1EvjsSxnmBNJhyXJ7INSGAsMh7fpefFB?=
 =?us-ascii?Q?jgIZ05qhEbFVQUexfRsTxwS/yfhW3+0sJtOJD8ccSFZZCXnK7fQX1sNqtcOp?=
 =?us-ascii?Q?WWcCFcmLSPn+pMw5VeAO2K30J8LSR62kccqjFBLbFTCzXQDX4chXhSIZs9ZA?=
 =?us-ascii?Q?NcvkLX0ggh8CGjlK7B0hBPjwJFfhBtZEfkhuuY6zmE8c2bEj3/Gr407aYKYs?=
 =?us-ascii?Q?K/W2jd8JW+g+I9InVqEk9Qcqobel+bi/lCF7AFwk/q6zgJWAqCDlhfZyd8/0?=
 =?us-ascii?Q?mtspYu+b9FmIeLMKC2w4gCHFRhP4q2oq7kHU2dm6AfQxHsRqXY6bNvDiylTU?=
 =?us-ascii?Q?QEh19b6xQS66nnWLe7UV9TyGsPS7qAt6rzxLQyuqjeqG8UTaWtrKpqgMYTKb?=
 =?us-ascii?Q?6ArfZHqSRwB6v27odhI4F80DlxSrtfWokm7jPvQ6xgxKC5Mt1G88oxtFf7j3?=
 =?us-ascii?Q?7o6uGofB6zBa1zPbSEdAlY67bCmAL40eNQ1ePeqKw8s0389rsOq4hY7tro8D?=
 =?us-ascii?Q?y52XUihSzgjeifh7p1z3uQjw4ujAncQrURl9x7KpVNGOGxZyHaA1doY4H0t5?=
 =?us-ascii?Q?ozhwGeuqirbkILkPZfQ6r3gWcmdTDV5Q/FWtxWmj+opLenS3DgGxT4Dorj0m?=
 =?us-ascii?Q?j9MQiQGK8fStcK3QwaRmJCfL3EjUr1TN/tfAuHqICUUob6DzyUfMtjLMDKfj?=
 =?us-ascii?Q?rBE3gKHh72RuiV23F+vQM4TCv9OXS1OXPP0RtomjFlQuqHAHVfAzqKq0T0Iy?=
 =?us-ascii?Q?vdg3I6uJz8FEmz7R/UmJCztyHz7lvHoo7LK/Gk94S2UC3g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YW8kl+qLAQLjcxPURZ+ky2Fdp29H1sZZ1r+O20U68OVQ/NYl9TEC7rLadKUf?=
 =?us-ascii?Q?3P4oHS8s40ojNAt9VQYCpYzVWNVEHZZYrzG+pIhVSojBa1jcA6+LtmpgEnmh?=
 =?us-ascii?Q?Mw3rXoYw06IVnGYo/5XLX2j/l9Ga9bGcEeVwSXrXgFUPHHjepnlGZDdQ0qjv?=
 =?us-ascii?Q?Hpfw4CkO76Md41wFir2z1SBWeQdT+WarVHEA7CPoZ5QB0Jbu7CLt37UQVrb8?=
 =?us-ascii?Q?dJv1W1nEnwf8RsDPhIWruGrg0RKVw85fAAm9ggAmr7DKCsfZyic99Ka0Vtkw?=
 =?us-ascii?Q?QGg0HrPP5ilKHDW6GLXMnEZEeQQ0vqz7BakXffm1mFjKoKq4yrf09o2r88Aj?=
 =?us-ascii?Q?5btA9RnQSyyYknm9WF/+nOPTXlrs1NVw/f39XBAsdCSoJ1shx1N9zWmDI1dl?=
 =?us-ascii?Q?/987ElpG1gg7XUsp25lN0pp5+fg6LoT+boeKk5kwFcXWtjLLZfSh58OA5noP?=
 =?us-ascii?Q?C9Hlqr0Jb3feUokXCeQcsKCuBnoLKxf82fSNvcw8g66FJBz38mpFtQUaFjI7?=
 =?us-ascii?Q?lI1UbjJmLzlpvCYFcKCYDaTsp6i5XMFTXCccyx2iV4BYnaEE/9H5mKOsn732?=
 =?us-ascii?Q?ZM1eZt1fvDqBGETtZRnQZoBZlFafe8vzPCW1q1F4sdAeXLXzkHLZAlTdHbZB?=
 =?us-ascii?Q?EkfvjbE5AIdgUqriTKeLz3Dtl5WTloZvVrm3h7X01u9xVbZBPzYzL7hRocVm?=
 =?us-ascii?Q?VZYFuIP5tDciCW9Tx2O6VCZiYIAO8GvKgNdDhKg9XWjqPfx5Bcn/L8c1VPMe?=
 =?us-ascii?Q?dsOGUIpcErfp3F6butQNqLzri0Re2D+/U+34A8cfsvw3sBy0Q76wddjfDSwB?=
 =?us-ascii?Q?AZwrH+D6CGCWNVCp2CQ3CB8HPx7QwyGTQfzViFT5e7RsB2G6FcVHz/Bz95U/?=
 =?us-ascii?Q?bMsSGtW8zh1RsaC+R3iPVAxoLTGEAdYHKoTWZhL/4kaxsVp3gQ5+TKxgijRy?=
 =?us-ascii?Q?7ohANPdknnllHdIw5GZS2oDih6rzMf2vrOOI8ci181YHRODZjVSc796TMdL5?=
 =?us-ascii?Q?qE1hXdIwVtJ/9o//jaOtTFcKj/q91gCO8h8/JKyuPLvelI18NA8/EWFnijGE?=
 =?us-ascii?Q?Zr5gZUe8LYlBUqnFKKlqpVoMKM/klGR/vsm3Ck51p2MESlOo4kmey1TG+zY5?=
 =?us-ascii?Q?3A5lvFYhw/aKgjm53vEIjtHGdzhw0ucEHecuaAmLox+LmGRFZCy7UHQ7RRGZ?=
 =?us-ascii?Q?9prhRvLTXKPmWTulbySYc4xfEoiiWPfGq3CJbp23CDzhJ/H4Fl/n+fqDK1ak?=
 =?us-ascii?Q?c4MrRe4pslE7o6lRKJ95e57pSYlW2X/yQJOgNLFCdlt9PqJw8KWpme7nBUnF?=
 =?us-ascii?Q?KGIBOIaorzpN1NKe5naGugHVJ91QqISiiHLQcZnciwX6iqMWF0WRc6jTfVul?=
 =?us-ascii?Q?RtTQjU6u3z+FOdq+1SoFDib13p8PymCVWzkDLyW6bh547f+hbQuEJ2R1EvvT?=
 =?us-ascii?Q?W6tZK1han0I9BQ7eEK10VQIVE8GKJggngF7Hak+EMrk6s6yZ3R9lWF3bUG0y?=
 =?us-ascii?Q?J0e+eqTzYEbeXhwcS6wfqfLT3qjtJGSC4/5yEXv+itnlBXb//Fi/YVv+TK0e?=
 =?us-ascii?Q?BWgSYC8Tyo9BRLMUPJkQzVzTLQLXWWhEg7kUipgimmgd5p1ZUvVj9XSMrWOv?=
 =?us-ascii?Q?6L1gCFSUsxgzWuZWcgyFqmE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d065cda-4a46-4df6-70f0-08dcecadbf65
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 00:10:16.5558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OpeYVc1CBFWHqhQa8Y6IiBFpFZCupgSaIPfHeg8L7J7XgNiZNkPTFAybLm7HZNj9FBaT3nSbHjq0ojLOXQzPHpgk0KIIXXpg/DMqL4XDC5Q3205X+UgvAJHixuox3I5r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9948


Hi Prabhakar

> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Refactor the code responsible for selecting the correct device node for
> audio endpoint parsing in the rsnd driver. A new helper function
> `rsnd_pick_endpoint_node_for_ports()` is introduced to handle the
> selection of the endpoint node by checking whether the port is named
> 'port' or 'ports'.
> 
> This change simplifies the logic in both `rsnd_dai_of_node()` and
> `rsnd_dai_probe()` functions by replacing repetitive condition checks
> with the new helper.
> 
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto

