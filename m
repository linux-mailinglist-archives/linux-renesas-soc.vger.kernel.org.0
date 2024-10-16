Return-Path: <linux-renesas-soc+bounces-9792-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0E399FD1E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2024 02:28:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 873251F243E0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2024 00:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2BEC7494;
	Wed, 16 Oct 2024 00:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Tq+0sqBt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011053.outbound.protection.outlook.com [40.107.74.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A4DDDC7;
	Wed, 16 Oct 2024 00:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729038512; cv=fail; b=Zfy4/xXPEjcqakK+PT+hX4uM/VQYRcQmdvFrNFD3Ef1hJrMzXz5vF5s/O25VQRm72MWX9Kmc1sbt70cepXbq8MrJdeO8p+1UXC5cvdvXf3iyJy8Ztf0KVQXYODunjr9Bxibx0v/mlvI/EqXp3E1oF6rbS7D7FVseJJcbBKKQi/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729038512; c=relaxed/simple;
	bh=YIsam6cHrcPjg9mv3v8L7RQFYSiyq+Eh/Ri36Q0FWkk=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=pjMQ+99rqmWjYW5wI5EgirrAruRtceNYjIFlpbuiuWT+3Kskva3AUMJTWnpgtbNT6Hod9nCPmANHfqjgIcRCEmoHEfQvTSk8fdKomF6IfOYOZpOMQP90/cZEPnOpikwdEQKwikQezxBvh2cRuTJgOiK5ovzy7biLc7QKHa3x3ps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Tq+0sqBt; arc=fail smtp.client-ip=40.107.74.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gYdvyRfYnWvjEy0UuGZw2T9m71kBg85e/8D4QHS2kJRV9zs4TSwnEGilIQes9ZwbAFcP2T3zfphQwEkfJfE4SmJhFvgj2YIcyMMEW032QDWwmwSpDwavnpC/dSW8M5sro6a3aB7e145AAqawLcGo8dK0eTtiVdqJu3BxGjt4+d4v2iFoi1a/7NTffF3ve/UU5sOcsSATUtfW3JnqFQ7LvXvlk2oYe1msfzcNTRt+6TJsY4k9sUrx1IN6cqnlXMdWS25sIX3712VrmZjWBILuM3uyn9e7Dojgvuk5GI57xozNFKjlcME96nhCCkImoTSVActnv8LpC9JLilt6GcFonQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZ/YbqhuRjpT6coHA44ovlhz+O3UlXqA+JP3Q5ECy50=;
 b=hwwBxFwJTJLrp20PW1rtWEvmViAWhCYWOHtimNVaCd4QFClmuq9NkpK7CiLpPADqGiLE3vktqNhCJJKA3FSr6/yKwoFYH+KrSCTaNxNFmiEB8QZ0Mek6LQTuE48SlF6FZ5W6Gxkh29nAWtjWSzERNrVVGGWe5rfJfy8UNmWwqVJlAesN4FBTAYoGadE24UkgRUm90KRSTJiKnFEHyBHYdG4yvgRSxR5ZBqHg0A0OakLJjew+Xar1iUK4sdMSrgaWgb9b5ylr/DPdKJ7VY8sW8pqqgCNcMUUhYHJ4EFzx79U8AG4AUPMRLJPuJ9egCwFJuVLUb6Lm7VFmUyYC7rb2xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZ/YbqhuRjpT6coHA44ovlhz+O3UlXqA+JP3Q5ECy50=;
 b=Tq+0sqBtm1drdrXPFO81Q06wNZks18FGP86A+Uq+zeMBHEMrUF1Pg2jpynqCbeu3P5DRY3uF+WIvBOhtWppo8VhPVXn0ofpJio07wUR7lKm7pcHeAR61464YCGajH/TLCsjbOfV8QP3kdFKqzTDKBh74/kARnfti2PtcrWMtY0A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6205.jpnprd01.prod.outlook.com
 (2603:1096:400:7e::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17; Wed, 16 Oct
 2024 00:28:23 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 00:28:23 +0000
Message-ID: <87h69cevrt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 0/3] ASoC: Rename "sh" to "renesas"
In-Reply-To: <CA+V-a8u8bkCjL-YSyMOiKOtfZC8upBwGzhrJ0o+EmZ9S3z5hGA@mail.gmail.com>
References: <20241015113757.152548-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
	<CA+V-a8u8bkCjL-YSyMOiKOtfZC8upBwGzhrJ0o+EmZ9S3z5hGA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 16 Oct 2024 00:28:22 +0000
X-ClientProxiedBy: TYCPR01CA0142.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6205:EE_
X-MS-Office365-Filtering-Correlation-Id: f9a2f797-44df-4805-db56-08dced797193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bv3jPI1ObiRY/QMNOrGItbBwumC8xr8aX3cgX6IDB8xdArK77zCd/jPy4N0e?=
 =?us-ascii?Q?8nVJ7aAKvMAd6oElF//YRkyc3z8J4jxDzkEqqFUOjT6nKyoEQnvsZkGU8V9g?=
 =?us-ascii?Q?t+Ik89rZVp39RlksQ/RPeNAFnI7gW7LCv/v9Zk6192746CPSbePtkwcfheh5?=
 =?us-ascii?Q?vNAeghyJOAzhw66ABoGq6uu6DsxtBKhjjr1JHRW9iPZuzBVVNEti9SG+gTXk?=
 =?us-ascii?Q?EINl4xCEG7HLFi7NEdyUqwoSTqS9/0wJRbbbf8EUXgs+TJNx8DIUvwPx0G9P?=
 =?us-ascii?Q?mo6ateiAEMKDsuNkLh3jHCuSX4vkuPyLuz5hS2idKgDJrj9Uxit4AhwF7Suk?=
 =?us-ascii?Q?csKi5xZnVwD+gTcgpNtq0HZmZc63cz15VFjzKUsrPIMqBRUyssxn7Y1LiO6E?=
 =?us-ascii?Q?Rip5mf7+rftDkWiKlZQR94dMq2RfruAnwsFGvSxcAyNDN0CKDXQdOMzIY1dD?=
 =?us-ascii?Q?7HlpzBqWxd8W9NVrDCd4odcrfV3qARGL4VPMcpnrrXFwJKxGzF0zpWyhe0PF?=
 =?us-ascii?Q?qQkqsxSXPVRTIhxfNHdZVlgXEtT8PmTLoqyhuYRmal1+drzDPhHJ70WcFbp9?=
 =?us-ascii?Q?/DDjZ6yb/Rz4X8DBZsnrPH0vKMjl9B7sBxEOTXb+T0aRN3Z4lDKH0X2tKItm?=
 =?us-ascii?Q?0if2HISV7Hbew7GNzEVi0R8+4hgJzSHBv7jXauNMSGv4PlE/xzKF4kshzZKs?=
 =?us-ascii?Q?6hP6CtSjvBJfuS6isQ2DxPfahyOpvsH72w3RfFpH18BdAxFFY5rIwK51fc5e?=
 =?us-ascii?Q?4HiwAEIiqrwVzOF2NA2aG59TZpEZGLIc49Fe8tYS+p49y9ldXr1kLWQ9aK+5?=
 =?us-ascii?Q?/MdcyX5vXyHpV0trcLR6GPTkPU4b3taNfo57Cu9LLrsSaL+WAtDa2EjCrSjO?=
 =?us-ascii?Q?3fSXuGbjNZ3rbT7tAUSpEFY0kdUkjQzrsacDdM7E1sV36+hUeBuBxz2lL1mi?=
 =?us-ascii?Q?rhZEADJrT8zZdmdLmvj5fsAiVMum9TAY3UrIdbmuSFwS4RQGIBjTdnEfmoHW?=
 =?us-ascii?Q?H9naiVDPzsl6/v5yatgauxVYvWxUQLvXkZwnlGCfk/3t8r22lASsmMEgornW?=
 =?us-ascii?Q?Xy9eYaoCZxlpJC0VpGezs3Pc2Q0+PYNM76nYZMI0kJq/4sFhVzE1VkK1stjs?=
 =?us-ascii?Q?5PLiZvnsovgJtd62U/HOwRPUZxaN5SrQrJrodBlYyNKfIpvohZTX4j+SruPi?=
 =?us-ascii?Q?z2prX7OFadUDPsckV4VfWYgIUha1uCzne8rOszngBaTOqvntCavm3ySUMADR?=
 =?us-ascii?Q?ZZobEfOX2STJuy1Sm49Mthe0ivaTjorLvQmXiLE6wTWWfcUrBZiFNAPTlXK8?=
 =?us-ascii?Q?tqzNoBbeNEtOrJ9WBBvQwh51KjC1E56y0QNKEzQty1aWyw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D7aSrDa3Cy0ghNG0SRIRvDUbavmThDMRrY1Wy+Vo0lbR65ZdMqcNO1q14TXI?=
 =?us-ascii?Q?cTNPxnsaBSlG1B6su85L27fYYjlkAB48E9pDBvezP8/CxVLLr8IRLAnsnfwf?=
 =?us-ascii?Q?s5uLP0cg902MntmiHS1ucEdBpbTgIXTR8UhcHCWiiyvx/9yjHRAzMK1wAJCS?=
 =?us-ascii?Q?z15M9h+Zw6DSEBiJAuCzBAzafJRTqN3Md8b2bfKo8vKdc6JPtje/pKG1yOWS?=
 =?us-ascii?Q?Rg5S8utPwOnXs68qbOn+DwItEk2uRpFkrHkoVkV2211gCJlQuBBlboql3YSn?=
 =?us-ascii?Q?IFqz9cnftlf6uhpUd3JaItDpGREKOv9R+asJMUKgnyH6SABeS6bFGJKSZRlt?=
 =?us-ascii?Q?bkslw0TwyXBJ7FOvGdZUznZxaIOpkwbDMiZgdRyWfWE4SVsLRT3tEj4tf5B/?=
 =?us-ascii?Q?WJnUf6Wr7WBqwh8OQeAB6WCRW28GDJmM5rxoPcSZ0wg3SHIAq/Ex+zwYjdAo?=
 =?us-ascii?Q?Isbql3F+icXZyihh/GOx0z5SM6KHWVj5nT3G2R7tJoB495P5loAoHxlkVIG7?=
 =?us-ascii?Q?cMRbveH1qvCmCed21WQ3SRpx+aTajzZZiu6a1L/logM4ePG9XEc+/6p6J6ri?=
 =?us-ascii?Q?nZehuZeLgKcArSBJXyG6l2fzJTHUZiJK2sordk2KJLC1jZqrv3Fw+DsomwhW?=
 =?us-ascii?Q?9+99Cod3/IKJrphXgRiu5/IiM/5VkMQ3Lv2v1GA5BuedCDXrJckNgZg+rhfY?=
 =?us-ascii?Q?/gC4TAhYkfDuglGG02PpJpLVjPeofNZjGCE4bPtpBwwH6ZiRLZYzxgRJaScB?=
 =?us-ascii?Q?yY3dBLOfbcVcoLydSe1u44mtrkVozX+NMoQN/cAJVDCdxK5E6A7vD9ygcKXE?=
 =?us-ascii?Q?IfmODv0vjoszk5OhmCnbyBR8hZ0PVMN40lsZxOp/IjcplAHWAKemF2fC/wpg?=
 =?us-ascii?Q?HkPUbh4DQYsj6RRKz+3xWeyHncYychoW2a/Px9E1dyda9iQpYk0w4EC3k9Z6?=
 =?us-ascii?Q?N6L+WgiH4Yl6zQbvvnvs5uQgHVrHmMegWuvwFmijxKBVIW/1fBWRcuim9V4+?=
 =?us-ascii?Q?pbs2DQN6uXlf7B2t+H7jZFEiDFCVDLfnn0L/033Dz7KRKOfdYwzqAnnwrCOP?=
 =?us-ascii?Q?vf+XJpkidmPyyi0IZ4V/+LFOTkh8GTK2G8azFMR8ZUTtuRNICnyHpz6SK6GM?=
 =?us-ascii?Q?Eff0aa6QgIi6X6bUeIhxsK0vuQoEyvc0u8bgsybzK0UwWx2rHiIo6H/rqIu4?=
 =?us-ascii?Q?gkGdRSZzEDBi7A69x+H20vnMIWmVi9jQpy+mQWCtyIlPToC02F7EPwR+kCTx?=
 =?us-ascii?Q?Qq0SC/+TI/eroYaa11cU7QXivY/bWZLQDQT4p2Y7D5dIMpLbmou4nYK+8i+Q?=
 =?us-ascii?Q?CRX6/Kzn27AqkQnjdQTXrjBzIz5yJ6kRimzeGHv+zDrjWqrsa/NtNrfua2uE?=
 =?us-ascii?Q?NdVNKWEq0EET24XUjq4d1pInI1MaHNillGTDxemZL7CiaS73PQ79gVGhzLhg?=
 =?us-ascii?Q?sYexamMKb+Tjb0JsIRx6ydl2U/NGIlb9vIP6D8KgSvMMq3VXjOUE/80sowMD?=
 =?us-ascii?Q?D1Dkj7+Qp2lqbLXSAZ9HgxMADNVXDmvK4th6YbBmZMqpInD03YVjKaLFxt1W?=
 =?us-ascii?Q?ymsvV6z0DdF3OQpeTs+YqjOBv3D7O44H3P5dJm/zC4L61uXzcOtE9AE35lI1?=
 =?us-ascii?Q?PbJuJXn/vY6xQNyVVtQeN4I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9a2f797-44df-4805-db56-08dced797193
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 00:28:23.3147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PA3tyLmubdgxxPUipAW7uqxop1qpJ46LkXwhhm+/EYXJwYUy12tKzA4fLQj5t3BOG7uivFYJZguvB+9X7dOBLcrSoIXcmj0FYd5UfP/qi1ofZmwjVAlh42uEUZEMPHk+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6205


Hi Prabhakar, Mark

> I was intending to add the below entry to MAINTAINERS file, but wanted
> to make sure you are happy with below (I can send it as a follow up
> patch),

To Mark
I can review / comment for Renesas driver, but can you agree that
you continue to pick the patch instead of sending request-pull from me ?

In addition, I wonder should I be for simple-card/audio-graph, too ?

> RENESAS AUDIO (ASoC) DRIVERS
> M: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> L: linux-sound@vger.kernel.org
> L: linux-renesas-soc@vger.kernel.org
> S: Supported
> F: Documentation/devicetree/bindings/sound/renesas,rsnd.*
> F: Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
> F: sound/soc/renesas/
> 
> Let me know if you want me to add yourself just for sh7* and r-car
> only or include rz* too.

Please add/remove

+ L: alsa-devel@alsa-project.org
- F: Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml

Thank you for your help !!

Best regards
---
Kuninori Morimoto

