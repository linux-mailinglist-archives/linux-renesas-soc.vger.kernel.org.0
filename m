Return-Path: <linux-renesas-soc+bounces-24532-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A0026C55DA7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 06:51:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A47E14E1793
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 05:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 152413002DE;
	Thu, 13 Nov 2025 05:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="R0Nux/FP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010065.outbound.protection.outlook.com [52.101.229.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434662F5463;
	Thu, 13 Nov 2025 05:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763013080; cv=fail; b=hXNu6s8RYsY9fa6pYxvGVVoFHFiY60JWt/0q1vY+lMc54bRoXO04KrNZFA2KeHLZPhChazqzkrgB8WVSK8iCVN6bGP6z9OcKEzxB1NtbkvEp+5RhLUxKhiZT3vL1Dho2qZwO4LavezZmMc9sRwSZjaFfGa/Ko5d7MuyKrdCJIvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763013080; c=relaxed/simple;
	bh=SnDZTjFnpj9xy5eiM8+q+fhcCuP+8KH/rxv7AOdKHVQ=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=QcZ4Zg+ebnDekKGemWSmP4HavMD9orVNzDBs4horjd8TaFzvkYEFQPBN316i3qrF5vDvRZxfx+quZtmnD5fQ3s3Dv6/9iREUEVs4DkEW0VJTYWH6zq9siRI/UMLirChM1+Gt58GwqyEgniQEUFvEntsRmYpW6nkqvDVl9tSp4vo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=R0Nux/FP; arc=fail smtp.client-ip=52.101.229.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DR1iM5qpx6CchknGZYFOYcNfB7uGhkJ96eYnTV2zagTOaxO5FlbGB2fXIl6bBq825jE49UBixRTFIBoUGpY9l6qZFdyxBLGKQYSTe3C2ADKBLCghmo/jCnbifbphdqscLYr3peo6AUsoqRV3Mc4h2yI8W1wCkCUZz7LApMLkY20YpViq0HS7XAgCggRNC178SKafO9DkiQx7c8vy7em7gQa1RF/4Ii0FNYhDkjaWirPvMumrVi7Z/PVGK+IOx9wf+ynIQ0QItJZOQfR9S3rwKTqN+8wr6rmvd2CHMfL62ckE8HKkkPJ/LYgf8QEYdlGWSe7iWNVcsJqunY1Zu3vx1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEqHoRBfjzpOXvAG88lQw0Jwk7QLTf+oRHdJQ+uzMyQ=;
 b=TXBC+cH0pyJEeNxEY1VP9jHVAFRBxa8advuAzy0LFC2WKLw2J9VSvKrGEHn3BOo4AuLudjrRmMpXQ1gvPqWtqEhgSBakkHDh9PoVep0L3SAs4VvWu4oPpgowRFuGXKqO0bkhGSEGugCl1+hHamY+EeqB4U/KxX2ozcXzK06MwkgtOZvL65jRgXyXwWO1PrO8elxzdObJ491OEKnDj8nkdvswTOw3Zw8Jp/pP8xlBGbgvJC+bkBnUqQh2QZMWCgupBA26B39oLQgUaIs7f9sNmhjGaZ9qWtUNOsr/S8zCQYDEaoLu7jr8Ja9kXd3gVcl9D1i3Yx+L7Awuu7+jolUX8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEqHoRBfjzpOXvAG88lQw0Jwk7QLTf+oRHdJQ+uzMyQ=;
 b=R0Nux/FPU7JdsNTsxlyZpNi35usL8JP40y3uqsnxHHPpDLgfnjaIWQRMzq6+n0A8G2PPx6Ca1gXX/xiPuPfzUq9ft1P07p8XNSr6gqFZDXFCGktpEin036J/6XN+7JEIJUw66lVvttdB7B/fam7Ns8Ni5wGZAs+fqT44HXvwgCA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB11731.jpnprd01.prod.outlook.com
 (2603:1096:604:248::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 05:51:15 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 05:51:15 +0000
Message-ID: <87a50qwkdp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	stable@kernel.org
Subject: Re: [PATCH 2/7] ASoC: renesas: rz-ssi: Fix rz_ssi_priv::hw_params_cache::sample_width
In-Reply-To: <20251112154115.1048298-3-biju.das.jz@bp.renesas.com>
References: <20251112154115.1048298-1-biju.das.jz@bp.renesas.com>
	<20251112154115.1048298-3-biju.das.jz@bp.renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 13 Nov 2025 05:51:15 +0000
X-ClientProxiedBy: TYCP286CA0066.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB11731:EE_
X-MS-Office365-Filtering-Correlation-Id: 32c99cf1-0b33-46da-8d7b-08de2278a8a7
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JfSGFdT9iU4cv3n8yzNTCCFyu4Mjx5jm1pMZsaIpA8y3O6BlU5r89YwgCGHj?=
 =?us-ascii?Q?ver7BbRMgH5EyTFSFZQdAlrWy3RJKBETaigfg7Nknj1n2Y46V+gcg4lp6qCG?=
 =?us-ascii?Q?quAcD5s2HXRgPTE6YB439NFrDfy5L7Dqx9fmmWsQHceGrz8ec1Y71u4c04fV?=
 =?us-ascii?Q?c8Q22LLUsBm9vK+UNRr859cDzOhsIwb/62ctsF2d2+gtL7mKBGxpRVVs4f8O?=
 =?us-ascii?Q?Vhi/Vdo/pPU3ttwtgrhqg9U3me3sb8L8XCce6Zw9i4ZLwKmZfl6fJqW7aJKy?=
 =?us-ascii?Q?AYUeTH/9Q80yMXcmQNhwhEvGmpCYhGMqbEBdzXgI4gXPjaF+/ud2nLgtovzh?=
 =?us-ascii?Q?9O8GHDPyt0VoP3n01Ke8MfefjflLD1q5DWC8/CiBWcPDB7TN6mKeimt0Psbb?=
 =?us-ascii?Q?HS8GXyLsMuwiY73vNFp0IF3gWt+zRwnXnTuFvxfFcUtdFuIr2a5eb5vZHPmB?=
 =?us-ascii?Q?7LWIITYA4BbDdKzCouoH15LJ5vopDK8/tDmXFLWYj4X7YzxxMa2l6Ld0IQKx?=
 =?us-ascii?Q?sUgvESVTI70I5HBN+tSqkSGUMTsiAuiV6z4TpzW1LQbnXCjZS899YrQx5XEg?=
 =?us-ascii?Q?c/CsadA86ADnZ6udq6KDovEFjg/nGnX3Q0LXnUTGAtcuSHBR8eryaPGF54BS?=
 =?us-ascii?Q?ge1ERmUTnJOlqKIblMJ6L3iDktTwSeeWvEozY1Z46mVY6WjCB0iTa+BBaElY?=
 =?us-ascii?Q?62mCAz5V/rAa6G41mj4j2VWAqQpdJdFovhhHY9Hll9xrl748m2lrOu7sai0U?=
 =?us-ascii?Q?TSBtzPl0dKCFNkkdDOAquINZXNeaJqrNXybASkx4GL0GLR9MSo+BZG0tLIu6?=
 =?us-ascii?Q?aPrZKXObuXuTg2NJ+n0REOb6zx8KWakzM2ZxmvrNX52ZVVPqxN8cNtlafUiH?=
 =?us-ascii?Q?HrEmX/20R2O/s0TgUj334ib4Jkld9O0Gp3QYRUNfo1HooQznVWebG7y6cjVy?=
 =?us-ascii?Q?QbqRtQbiCcOCxJO8BT1G9c2Dty5kCbajUFD63JWSmdNDMXz9CRigr4Mrpn6I?=
 =?us-ascii?Q?Z7dMaLb4f52Phds4Dh+el65JGNKOP8bq6eOqg0s+sQMliP97HrbQ7ovzFEYy?=
 =?us-ascii?Q?KHBZq+FETSQVJK/nvWeHQpZ9Q0KbdDhwvVKdMLrciCHqetu1hSMUxvzlKn3S?=
 =?us-ascii?Q?dQD+D5f8Cj0dWmWuO4uMYZlyhLPc6yLg4kdyYS5M/ylyAOq6mYxbWKpwNeRs?=
 =?us-ascii?Q?eX0vSRNBzGVELJg7wa6BHw36LnF51mH2FUIAfQ6sANi3O/r76B31RCuIASa1?=
 =?us-ascii?Q?qFrfAcVR9bdnQzb5qLY9JwYey/5lIQUQrBMcGbTtHB8+OoxEWpdrgiMV++p9?=
 =?us-ascii?Q?x5nOkDggTTvck7y/O9SByawsz59/nh9Rz0uIZdFLXPtAFjc+xcyrq0YkWQCR?=
 =?us-ascii?Q?bpnimAr2i5Z8gfZ+uVeap0CL3rIz5Hx8kO06tIPKXm2xLPOu4L6TNmCxdorh?=
 =?us-ascii?Q?9Bh3tFNo683XpXCllmwuheJ7MjTWqKZ2OqTvfPLXOp5QQFqpraIBimfjzl32?=
 =?us-ascii?Q?2Xl+hncaHW+nLwF0li2lx4dXTzQFcODDQTs8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AeKrp53D8mkw5m/UCJNX/N81nqTCav8YVjguy5mHHZvmaGh7jhHhp4OnpQj/?=
 =?us-ascii?Q?wkvD8vQ1qr9oV4+Ugr6Czxa3n5nuAAimj2bdz28DSOUIGlSMeigvlgD7Y+d2?=
 =?us-ascii?Q?OpciFir3jfJjlFaxH6fyeSSEMujsJNHX6bJr8f7lr5kutd+U4w5oxTtxGox/?=
 =?us-ascii?Q?fPzzE+hz/WgTAETJExBfAueVoGMNgFLfsLo9Uyx6ct24r3OkC4dGgwit+MkI?=
 =?us-ascii?Q?9uH6T2mg8Bl9CSZCKe1UU3Gba5JnsUHmdwH3uCxlKZ8JW2xpAYtPg/JP6h7T?=
 =?us-ascii?Q?4oIPNvMPtxvLdccHbfdJXSx+IxhbpDF41eEz5POzy9wacF0Cx7yhE+VQumGj?=
 =?us-ascii?Q?5sSFv7RtvCuwz7xh2lOmI0YY8fJ+I2FsyKnc7rM8Jvf6hTbgGQKLAtyeh1RH?=
 =?us-ascii?Q?1TuqnmxOx2ZFr7dIW6HJPpsuVNu0YGnGNHvaab9QDTgZe9JJKroL6QdtflE7?=
 =?us-ascii?Q?LkuhAUNgaYxaDDJhSoMYGnG/Z8lNv2xfYCuiEQtRwUasTAk/Mk+DkgfAwd85?=
 =?us-ascii?Q?WZnrV3Cr+TEbK0opHQurDfUFu1CLmrlBi5TQwEt+66owMLBYFky9QQy+8v1j?=
 =?us-ascii?Q?gA6lchAGjGV+vm1BUyInPHs/FYhgV4n68+5vgRpVdNy303bYm2tHIgTfHLPp?=
 =?us-ascii?Q?bRzwdzWFdSfKHU+6OR5GUzXuMIth+5dosBlxZdGnsospTIOP019wAGEddqpQ?=
 =?us-ascii?Q?ec2i2jpkbpgzL1TobvujFvzgNtT9SAgD0VVQveF9+RszWJIHu8Ou2jBSwNnU?=
 =?us-ascii?Q?gMkksyvFENAqS2JCiXMkCZBGUiNHTr6okwHYPghkIAKgjJuP7Gw7bQTuMhVc?=
 =?us-ascii?Q?N/SJkBZTZcYIXBJWB71wGeTWWNSzE8RRv/6Ojpyk+C6z2QQpFOyKR7ccgWLi?=
 =?us-ascii?Q?dsnfO6vlRJQNSs3bfWYozIE8j8WnVxtOYtudxCHk/pJE44NApqz1mgqgaKtS?=
 =?us-ascii?Q?8j2JPjjUF2nO6WQWj+acx0Sl3eBy9L+IUjgDlsI/kYCP1r9/5L9NoImE+LDw?=
 =?us-ascii?Q?plRg0AQ24oOk2BfdZOCcWHsDXfZzlKPCjb7Te8k39HjqrWIPDSJkD0FkwOWj?=
 =?us-ascii?Q?jKcB/L20+Cu51yO8/f6PCjEsuJclqQCldDAnk453IA4xmkyGhOUMypOTkQs8?=
 =?us-ascii?Q?/nBn9zGmI4LXTDHNfoPPzgy2N34Y1cSVA0t+dlFkSefmkSWCO4dGDVKcBj+E?=
 =?us-ascii?Q?YL+wIJ9b03m+b05oUwIwvLrWk/RErnKCoHhMndGXSEMAFaWLbkz3eDjLaoXm?=
 =?us-ascii?Q?ofcsFXk6SiXI0Io3m+RK4ShUMtQ2mWAwW8Gju1XPuVUVtsycX/MrA2pt0Pmb?=
 =?us-ascii?Q?1ZXshvrex/+KTSeosSQj400JHr7j2yxYIvKSvLB1PEnrzCE15a/83YqJ2eIz?=
 =?us-ascii?Q?agC/FPdYFsHT7QfPb9d+T6YWsqQLI2LDZqC4/ccx6pQeiYFsb+aKWnSDfcDq?=
 =?us-ascii?Q?D53OKa+rXcEelyqaqBM8vXecVXqIz8fACELYVKUAQhkJlfNuuxb2GWJKwIfR?=
 =?us-ascii?Q?za5ygfMWNPLN3FT0x7dSxYrh5Q6LW30LMlARj7fCPQ+iIzDpzeiyoosTmK3p?=
 =?us-ascii?Q?MqLax1V57zQZNpHeq/sUNOz/mpcV1oAe+5JL5F3iEK0Qo2xZ30gclhkMhfSF?=
 =?us-ascii?Q?2ncSKYciZliWuq0BQysjxiI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32c99cf1-0b33-46da-8d7b-08de2278a8a7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 05:51:15.5796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cy/OeKYN0R+E01b9oFjLKijQLk7WJ90TawlXl/Ne8FJL4MZKJcLvmyYStpezx5aVfGjSpUQWwGSFxN5jQn2fD9W3u2Jwu1xCsBHorUpL7euUJs5T309isnxT9amf8g8B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11731


Hi

> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> The strm->sample_width is not filled during rz_ssi_dai_hw_params(). This
> wrong value is used for caching sample_width in struct hw_params_cache.
> Fix this issue by replacing 'strm->sample_width'->'params_width(params)'
> in rz_ssi_dai_hw_params(). After this drop the variable sample_width
> from struct rz_ssi_stream as it is unused.
> 
> Cc: stable@kernel.org
> Fixes: 4f8cd05a4305 ("ASoC: sh: rz-ssi: Add full duplex support")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---

Reviewed-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Best regards
---
Kuninori Morimoto

