Return-Path: <linux-renesas-soc+bounces-24526-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D51C54C89
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 00:14:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EB883AF341
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 23:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA932EC55A;
	Wed, 12 Nov 2025 23:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Fn+A8nbN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010070.outbound.protection.outlook.com [52.101.229.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099F12E229F;
	Wed, 12 Nov 2025 23:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762989271; cv=fail; b=r12v2LbmAggPmyki0M6EG8bVXEkuS7Et++fEB2D8DhmHCqMqDgCqglUD+jmYD2SeWjV+UEP1eS8lqumVYxk0ecuah+klNt1dDjkEWSTMzXzfWUuq1qi31B0xM6b/sFujpTYyJSxVtOwhQGBra4rZF16773v5RiARCK3mWUU3wY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762989271; c=relaxed/simple;
	bh=jfTy9a+GFyQhluLr9UQ36cMJCaKfR4Hci2G1N3pJAis=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=GXcdTZOAgvVoIewI2+DhiMqrBf9dTm6+B0tPeaCqjncN7/p+lt2FEpOxxaS1TIuIeD5rlgfZ+rPrAYMDxfkzJfE/nthtBwDD0cdA1W4x8h1lgwC/x0c3lxlEceTKr4Bvlf7SpPW+4WmsCx4AkAD4jPPguIt9fLWPXmnCE/zRvHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Fn+A8nbN; arc=fail smtp.client-ip=52.101.229.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CIs1GsamU5mKUmwBJO9dcCNP2RwdrVtjfTkszkx7CUzf8ONzteYksiLz3ftSbrOFh8UAkI3y1eBXkNzzkvz+QGFISE4AT7KTecL/bCg+rHWZEYd76irKKa7krmXvcLPPew/cqoPXHDWcE75SkDhe1rg3aCjireLRBbo/M13FjN0WtbkwpXH2Q9FbqzDooqpndEJRif9tFF78BSnYUqmpVVk+Vz4O6GeUFWQtCeJEtI6FcZ39z6u7AciNlq9zDjUwqKdmVtbapTS0zo3/7tpY7uS207QbzuubK8dZjMU3BalSn4i2y3/sGOXhWHCV7AMqr6/u9t7kPXj7+Xv7g9GW8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5aW0+mngwAeeDV2pMY0NQxv7eZLtXAtBYGf3bT88u2A=;
 b=DWlvZ4fDblaWqbI5wGmuERFf4s0nGq9p4yf5+QT4NUF/734bUDAcIQl13gRIaiWuagWHfU5nyxqLoYDNE8nYwZ46Sq7BQeUtPE2YeU/Le9ZlLQreWYhXJaAjKADrTi1PgfOSaYpY3tKvzMyDKn0qeAYR/CHr7zzlVJ5bwNCOExSeJQY4TzMNNGZBuTiAje2dokrbhsD9qMENm5RhDAjHuDxgoyIyTLME7NkuOUmkGJja2/YVZgjUl/YAT6kF3ircAVMu2xG07PivJ+0ijWqNucNyG2FsSzgF5+jRFcQVGMBwC2++d44lgoZX+6N24AZRohpguBiepVsaU4U7fmP6vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5aW0+mngwAeeDV2pMY0NQxv7eZLtXAtBYGf3bT88u2A=;
 b=Fn+A8nbNpHsYMPewzoLcL2ogVZY8Ch6yvLI8z3mmNQRrxdbGHqJHqFBpOH7GumVre+KXQrKG6Po33tjFyzxZcPghA6uGDzwGZJ6KLKBK1ZLiJxmnSm2kWYyUJnJXLYq6xwJQBKP/Y1fcnG4bUwdfO+DDGM54tVNJV8cnkE9pvsM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10997.jpnprd01.prod.outlook.com
 (2603:1096:400:395::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Wed, 12 Nov
 2025 23:14:25 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 23:14:25 +0000
Message-ID: <87qzu2x2r3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: rsnd: fix OF node reference leak in rsnd_ssiu_probe()
In-Reply-To: <20251112065709.1522-1-vulab@iscas.ac.cn>
References: <20251112065709.1522-1-vulab@iscas.ac.cn>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 12 Nov 2025 23:14:25 +0000
X-ClientProxiedBy: TYWPR01CA0049.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10997:EE_
X-MS-Office365-Filtering-Correlation-Id: 20944fff-374a-46ba-3e43-08de224138be
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fCu/aVbClJzroHcg0MDkMng9MIUTodK1gZ/FbE6iKxNJmg8uIB7bySSWcpXu?=
 =?us-ascii?Q?raobehXxJtqmrkgTUjQEQu1jNzbtN3LZ6Kt2ISusEvYrs1Uhaji2XFURN4SK?=
 =?us-ascii?Q?Q6QRX3p6Su3O1Z56JSnUPzFINuRtP1EUlv7zljBzOKizotBMZbRXJ4Mgk5eO?=
 =?us-ascii?Q?OnqzKyrAtjBkyxFkGRjBd2EnMrLZCoWFPfMVS+SCE1NnfjJkzp74VhPowIgM?=
 =?us-ascii?Q?Ou5wxnKMUO2Xqy7OQX4j8r8A/JV6crG/GvbnyxsbYLD8q9f/cb/35G9vl+wY?=
 =?us-ascii?Q?95PYvHyJjWAhgMjgrU5vCc7rpweOrpqFroo5X57+aX1hEXLP3MOZNgGE6w4m?=
 =?us-ascii?Q?BYb0FTtvy2GhFj5p6irPlmEp5hYnV2HoVIlFp6hQFMEMw66S/H8DI/ReVuHL?=
 =?us-ascii?Q?J4omNDYlaJ2typSdv1P3aUVxSh8bP7Y0/mIUPFRfWnoOQuC0touixhQAvGGc?=
 =?us-ascii?Q?bnJjEYNUHfyqhs3w1zVm2NM39RN7Y6mXay5/RmebH3zIsIDLRIXZ9L/O1MhV?=
 =?us-ascii?Q?AR4JJdYe9//c/UlJW9unmgnxZMl6txXo3fXo0MuLtvj/quDG4YJA1xq2uUwn?=
 =?us-ascii?Q?cTSBcTyydC8FmFASbAZ6tviJGoI6FRn1mnNaxxrfo5xe7ICX5Xd8Deh6x0FM?=
 =?us-ascii?Q?iXug7bY3gTR48tbrJR1SWXCn+TV+jA3NjBZDCmzsxoKlpjZDiegYQ9oP65MV?=
 =?us-ascii?Q?zlDhAJUL447p1Ij4drPKYKhdGJfwNhQys4HJCkHfXKqaAlYs1IXHJO8H9RHH?=
 =?us-ascii?Q?99li5w45pxd3pyUMSeMqDhlNLJEZj3zKhPz3HqrPHc3Db8NfzjgmYXJjeFIK?=
 =?us-ascii?Q?l9BwE8iqvF0TjoyXdyH0FWLIQwk8bEn2onpmoyW2FbvU7aQqgZxLzf5zbfiz?=
 =?us-ascii?Q?yLK7+IEv8RHqrEh0FVJrXKO0GGA7huF9msMEuWqqG8N/gYjAJ8+sE+8bJzED?=
 =?us-ascii?Q?dCZ6Wp7Od9Gv22AkUNYByp/XqAOqnYhZrsAB+u/qm6UedyAJDiEDzYnqUjWH?=
 =?us-ascii?Q?xN6e26+iG1dTeza10y0ssEJEcHeGVZMpU4x3dz004MYHltM/jO8SZ92vhN0H?=
 =?us-ascii?Q?q4jf2uFzDClQhOLBNrjSmdo2T/wYuJoPg553wAB9zNGUa5Mu4gfPqd0ZqMi4?=
 =?us-ascii?Q?IZOpsi+lUeszqjQCmL88FAa4D3uQkpiyP4aINSaVnXN9S5hcItV84mu8KpaH?=
 =?us-ascii?Q?idXHkh77hoiiO45mL9ThhA1qZjKGivo5V1RrwfjfRC4HoBj8+KqmvYUElzqR?=
 =?us-ascii?Q?AKhY7Ri0CEFDfzR8zGpaJ2fWLbEP49x4uVkMuV6uXTs1J40Z24YXg5ga40iI?=
 =?us-ascii?Q?ROjvcKuKBUxYicUQQqFYt4pqU6KmNeU5LncN+swtvT+IUaLXe5pmW9L229Zq?=
 =?us-ascii?Q?RXvasigZKcG5TwIjFmPzTPZEN/L8OTU0VpWGG6JdGog1Coukgrf4OYDr9y0i?=
 =?us-ascii?Q?A7z6o+gUgvoq/AN2XBEWAaQrEUq9oCn5scpiqOK5d78uJhGmCEPQNhXIvowm?=
 =?us-ascii?Q?hbVZjjIIm7aGWRetSwB77ARm6sZfojqqF7py?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xcJMiOfNKnRQuYq1IZwXp5jV56f3xlqmVPfbvRpOzBbdwZhe9p9Je/zG3p9J?=
 =?us-ascii?Q?xmLFVs2nh9a1kN0EVhx3xyww2X/eYt5avpd+ECQ7F8NC173VoTzfxaWsgJ9u?=
 =?us-ascii?Q?D/W0Sm9HoRcF5IOdmGfjzQp7b9OXMXV1fIZwyPMocfWqfwhHgdmmaAD4pIOZ?=
 =?us-ascii?Q?2478OBEX5ShSMje31oCOcXjzsNXJQDCm+6cWkBCuAsGbrPBZtj/zp8Ntx5Df?=
 =?us-ascii?Q?sQw6ANrCSfitEwVLCEpuLQuQkuYbeMwVUAzscaPuUnza1IRbWuzTrG1JABvM?=
 =?us-ascii?Q?YlTNkITPPKe5BhnOkZYnFHeIR1YUgk/RpNLSA6PVbTDHrChoySanxPfluw1H?=
 =?us-ascii?Q?+5KDHNng6FNUxV4OvwchKqae/047lXzbOoXZfUvlbRHQi1sLnr9sRFe/+n3i?=
 =?us-ascii?Q?ZZ+A1U1MsLXhk5FMI6df1DLuIJBckwLyufyYDwGacgklDt/UL1I2U5cwKVgE?=
 =?us-ascii?Q?R3sfXUERhy/XMVXQa2MzG+zzS/QZDGhma1Lbm6FUjBBATmmG+lD1a+rsZRF/?=
 =?us-ascii?Q?1GRLUBe/KfBBKm9UEVMuygTquR38Q2AoSpvXX4wXt5vNbdPnSW8feYQLG7kP?=
 =?us-ascii?Q?yYgCWunadVkr2R7t0olPouCSG/0Qfzj2VJTb8x7Ypeg51XgN+zkLE3oErDBN?=
 =?us-ascii?Q?LyQXkdThaNDSYczf9XnluNJe7+mdkFW9DyDNJ5hIbmbSLzvX8bfEObmvmYT7?=
 =?us-ascii?Q?wl6668ccQy0mDrmo01Hfaxle/b+j4+bgL5fT9qa4IFsbbrA86oB3/je6k7Lk?=
 =?us-ascii?Q?kyTiBn2ATaSiLZnNNIBbNQFKSreXWT5sQXmUaKSPeES2Q6QZwhJNPOqIxfBO?=
 =?us-ascii?Q?TpVSt7gKH5GLZxXVtoE7Nl8wUU0Vblo6cPhsvEnmTbNrW2SPzXvOurctffOT?=
 =?us-ascii?Q?A0rxoVhGOb3BJUKr0ZtasFz/NwT9bfjM+4Ve9Uwmih1OjwSEIBj47yBHcZRo?=
 =?us-ascii?Q?mlwVieePPxkN/oAvtm3/g6lt1FBBOC3BpMK54HBPqLSYFu9GGHcvAhL0xB06?=
 =?us-ascii?Q?aiuhiqAW0dP5MXpiO1czci8BtPs1MfLhiCX4u6A7s0v7ORk6fkfEOZiY96xo?=
 =?us-ascii?Q?RSFMjzzgFZ0ejQoZVczkZ07bBvL2ixrhhYovTz6P6wB4g48iqVd8+j59Tcsc?=
 =?us-ascii?Q?FGdsn1tSIJuOUWjqovGYGK/1Dr+1fpkuUw36WmuRt8r5OsWrtb56+iFOS44G?=
 =?us-ascii?Q?Oeya9ya4D5nn2Bk9xyK9uZ3R43MBxtnyAHsVOX8xgMkCHOMhd7Y3AYVlJFZz?=
 =?us-ascii?Q?o69w0GhzEFVfjFCNNF0lY3xI+GCH4dFjx/Pp4otTJTLcnIeQUIqvR4YpcANj?=
 =?us-ascii?Q?YoG9IhfZSkuVfnlpObrR/equhlWdyxOw9VQLxemWSN1TWO9QDxSKmSaNNGki?=
 =?us-ascii?Q?ojeWFvBswf+YzJdpmyJdnUFvlhuzqIwM4M7wZeX34hMCQyMziUHxFK9IdhOe?=
 =?us-ascii?Q?uUn7o8JLsnFblWMT8mp/rAuHHpoelrxu2vO5y3plqAcxUO94JF5WxeKJsAke?=
 =?us-ascii?Q?gak22sZoNpSLZXTBTaztEysAJRYy44x2TYMiDKUzhj6Qd7QaYRkrHWSbLjbO?=
 =?us-ascii?Q?fvthWoyBBQRqsfviu0bMcYXPCFGPJggOW9/4G+5Zl4F7dy8AV/zUrOauZ/iX?=
 =?us-ascii?Q?Jhiyz88zisVELbilTEwsOFQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20944fff-374a-46ba-3e43-08de224138be
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 23:14:25.4238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wjasUQUqwVSlWRsLHIv4bpLaCxe01uqU5f4It+rsTKW4hKyeypUykqVa4c7h4hDA28ZRbrEayQTXHjvc3lLPIjylEw8zW0pLVfQGzAq1/n9PgBoi0RrSuR4h4M3oeDud
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10997


Hi Haotian

> rsnd_ssiu_probe() leaks an OF node reference obtained by
> rsnd_ssiu_of_node(). The node reference is acquired but
> never released across all return paths.
> 
> Fix it by declaring the device node with the __free(device_node)
> cleanup construct to ensure automatic release when the variable goes
> out of scope.
> 
> Fixes: 4e7788fb8018 ("ASoC: rsnd: add SSIU BUSIF support")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto

