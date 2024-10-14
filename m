Return-Path: <linux-renesas-soc+bounces-9730-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB61B99DA51
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 01:49:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59828283763
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Oct 2024 23:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24E4A1DD557;
	Mon, 14 Oct 2024 23:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="C9+petoW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011068.outbound.protection.outlook.com [52.101.125.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65531D9A72;
	Mon, 14 Oct 2024 23:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728949765; cv=fail; b=BBD2vnngzw9pQl5NiUHGD6KrrkHYbbdqLkJa9P90sr+qZs14FnISKp886qPEzHXCKqi4FW64FsxD7CWkI/6JNHAYPTTE4r6ozPHsUsz9lOvHV2rXb88e1HeCIkVZ+4i7FsSku9vz0jNK8GallAX/WDXXmLBFs/cVZJ3SV3VDzaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728949765; c=relaxed/simple;
	bh=nGobrtYlSUvps66yy/9Z8K4rmIDzSM2RAw7hgLbj0G0=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=TPPsqtc3s6ftzmesE5+37h5AGw+c5JVuiZRXeKN8x4F74BAXUJ480CxdUVnNLgceS2yvPjk7nQXwsUSJIoCxIK1AsEaDQIshWcsvdmGlLKS0dRGS8ZX9gYIp1oAUHuD2qeOBI2cM263eYFKI5dnZMD6u9hq4oy4eA3VIuubcYs8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=C9+petoW; arc=fail smtp.client-ip=52.101.125.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lNqcAGNjKnMK/JJpJO1mhLQMqARQVUSfqHV02rJZpn2m+HdulW2PTqP9lCEq+oqOFI/EPfC8uIW/5d6Kvbq52k74hSwnRqLuFMOIVVX6K7ipGwEZcCP4nQrdT9VY78DbUdX2X4NugcDVDn1BQekCwnRS8G7ZxYDx/12dma9ABsPjmglxJAGoVWgXBtvLtLsjyDGODMKYs0ZFRCIti3DlSQQ44hvr/QO7FgBt5VMUA0LKWNFxABDH/qdQgWeoLikiVCHBRDZvCGvSo3+3pKlrF4rB/F41zQmWvHvL5c5Q2uYgLHzgGtZB/1KDiIVe33VKTrVqG0RezAPk7aWl20XTyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGobrtYlSUvps66yy/9Z8K4rmIDzSM2RAw7hgLbj0G0=;
 b=YUHuNLCpzehnkLIRKShn+i/bYFh8GeOkvvhsKqgKzH/Bzenk2XISncko8I0W78TXAUbmIsR+os+jSsel7rJ6T35IcLrLhm0I/wRTRA/6F0jMNE8nvhVf1+NejXspi2yt4WFLa7MpfgGgvUEfgs/ma2QOfnaSqwlvqYPPw329LojLZ7fCCboJSuE/ShmIQh0e9m9QnEiRUoPzEZKBDZNTzHXRn9qrnBp2fDboFpdKHU683ajrc60ULmJfZvPYBiZVFaFXmKSzCZ3z5vWWwNUcVexh2iJBQkN9wsbnQ9NAnrb29catsWjoeBIm2B6B7rTRKNpovXEebn8Ln1X1ca5tsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nGobrtYlSUvps66yy/9Z8K4rmIDzSM2RAw7hgLbj0G0=;
 b=C9+petoWdX0O3tLx6ufngTA/0i31qEws1gnNddkx1SVZj7OdZqzw6iIeIBj7ztn432RNKg4OCabeaY6tKVktE0YfOlD2WBN7wJ9hNPL6hlNKoyDvIBb8zWM6t2j2W3CzyaHCbHlyMkUyKMA6jBU+dT26ot3win2EwPisMU1vAsk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB13264.jpnprd01.prod.outlook.com
 (2603:1096:405:112::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 23:49:19 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 23:49:19 +0000
Message-ID: <87v7xuqm84.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
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
Subject: Re: [PATCH] ASoC: rsnd: Fix probe failure on HiHope boards due to endpoint parsing
In-Reply-To: <CA+V-a8vzt0XLVn7BLWwi7d6Y9zUfzxXw21o4ZbERfe6Lt4V_gg@mail.gmail.com>
References: <20241010141432.716868-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
	<CAMuHMdUzTyDvrAGZj0gp4QuW72LvS49VQxBT5UZP6OYXH6xtJA@mail.gmail.com>
	<CA+V-a8vzt0XLVn7BLWwi7d6Y9zUfzxXw21o4ZbERfe6Lt4V_gg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 14 Oct 2024 23:49:18 +0000
X-ClientProxiedBy: TYCPR01CA0112.jpnprd01.prod.outlook.com
 (2603:1096:405:4::28) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB13264:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c646a62-e223-47c1-4549-08dcecaad1f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q1Qkudw9keY+3zU9MotwL5LN+7ZrmQht0B6KIlLGTKaek1i13iqrLweN8lM3?=
 =?us-ascii?Q?GkePYIZj72RnU/h9zGGEvQtONsAzQp0dfGN7xmHVWnT21y++Vf5j//QMv8Kz?=
 =?us-ascii?Q?Nechl2TmALysj9n8ZtYayE22JkQ9ZU7D+7+31pH4yVborkxaBsfLj07iSqhd?=
 =?us-ascii?Q?7Zq4h0cBux+5vhp2TtMVRQVDpblEpnwU7cGsVV+DVLjqr36gnl9aL+GYTryC?=
 =?us-ascii?Q?lE5LMBAYMUzIszaeCkZfHaCPo8TEhBooXw5TQNyCm1luOWxYjd/i9B/7FghR?=
 =?us-ascii?Q?FBUqkV7WefOAO7mtIzgUtKTL6kNEVEZZUNm+EaUvsCh8raj+0KKKRoIRiiTM?=
 =?us-ascii?Q?CaaTVryP7ceE52Suyvh0Jaj0kpKIlLV8r9KCRNwQAOuOOXc+U9xmdsgAd4/O?=
 =?us-ascii?Q?iP7JHplWFiX5eHoudy/dk5skWC3o0SnxrjV8QZHbfOn1WLmCZ7szLJQIol/j?=
 =?us-ascii?Q?MijGDKsaivmrRPSoSw71ftohKXWp6Fc+1HcQIYx7qdGj1zD5u/sxg+/UOQLm?=
 =?us-ascii?Q?NZVvGVrVI+AOus0jH6wGlo9o/jFBvbZef1w9MpbOM5iz2DDv9lRhaCNez0xT?=
 =?us-ascii?Q?/oioJ/ZubUZQnoDWSwM1HRj1inG8PVNKF+blJrRVGFAMbwoph/H+Oj9xWmyR?=
 =?us-ascii?Q?wyPTv6IZDR8rjTeApZsWHjJSTr8OuL0sxW/UhfCnzDJ/FfAifxA7HvUp2tkp?=
 =?us-ascii?Q?UE2VmRmyEt4EKL6f3YWGpFuBm/dz5w2UZpSHfZYhEvTQjqRVJwjSvm6SxfDm?=
 =?us-ascii?Q?fCuPZ6qdws5Sk1+mV8SwwiltAYkg8LUrttBf48ItluQHOZjZdzt6CtDQ/goE?=
 =?us-ascii?Q?P2/0rDOZTlR5AS8aNMobNUlgF5FfGoMlQxFNJHLAeM5mr8xT5oFR2CQFgsxy?=
 =?us-ascii?Q?cA31XR5/UzOzlESsfcxU7sWsbn0BBegQlX24oTEjgNzsM2to3K6WGSwBD8KV?=
 =?us-ascii?Q?RU8QESFIUsy2d9HQzFqx+55nkHBRpBYC/BFbWTymSWk31KhVzQONVsydpIVA?=
 =?us-ascii?Q?OQ6ZIfXwbtLLoJjBfsF/ucw+2y07vzDKzCmzAsfJoXTW+YXo+lGqk01ZQozi?=
 =?us-ascii?Q?yEBem1i0cb5++Au/2dZyYdLN9REQnxQ4FOy1Fgv/oMgNs6riXyEsUn96U5Pd?=
 =?us-ascii?Q?fttV528eSuOf7ksSaUDAGUGn1NaLogxr/zEHhBdd3YVN5KSfCVQNzF0c+1Ol?=
 =?us-ascii?Q?fML1A/HSp+O35CqL8OTR60uia9dawQCTXsi70MmAi9U4P89BT8dDebQOXHXh?=
 =?us-ascii?Q?ElbMUsx8TrGaYoWwMQwktA2mvEQY2FbeDnWb98BGCI+Ck/IFWk0yJBv2eOjH?=
 =?us-ascii?Q?C8Lc/nz8NlBu/AxiL6SWLVkw2EAAVV4jlrVniEoaIxW88g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ubXvr4vxEi45+1eQyE81fDn3YRn0TzUUk3THwQLcPiQkdZBqWowVYvvQJPuY?=
 =?us-ascii?Q?JWF20IyE3xwjCtHzv+37EeSW62HUK1Fk1yFxz7uZDDH/afAEjSIjUGGnrGYU?=
 =?us-ascii?Q?XA0vDHAEajT6eXe2h78+TDJ6DJY0OBQLIjQ6qSccLTI41o04Utw/qll4QU7n?=
 =?us-ascii?Q?5KsIFF8k4+KGGDqK7EzdSLAZNN5yAFQ9Oe9rk1OLBAIiA037nF12vDScZX3t?=
 =?us-ascii?Q?Oqck6UmGVfuVY2gRfioVFlejF+combF7NFFOnDYl8DeFb/6zXOyH2GAt+yQc?=
 =?us-ascii?Q?c09lbhFDiJvlGWeoOwQCk8emkE7maNyOaL81tWogds0V/qTCEjSQBel10M5V?=
 =?us-ascii?Q?gPu8AT2nXau2wDNSY5rH4hJWo3myjxTYmp1mWanKkQ6vWxJXP75d8CC5u3lD?=
 =?us-ascii?Q?hHHslkcHQxuiwSa2nM5JoTYKC3RRnCuAoW2+Nc7pqk5E9gYYWiQWFSWzawCp?=
 =?us-ascii?Q?KQ4ZzUhD8wFOt7gXM8w0McsWjOpJKvjnbLY5K3iMSnLc8EGKhe8rbFWgVXtu?=
 =?us-ascii?Q?aa2LPM8fOWjPsp4vWBBGuY8cq1MbOTV9OG8DkpVjJAAcygbr/lAcy1Fuftwk?=
 =?us-ascii?Q?Kv8n2oIzFiefb0OflAkLnp2/8c0W4iXWuLiyimyi7ziJKQs96dxY2frbzSvN?=
 =?us-ascii?Q?tEznq1GGrB4L9HTJue8Mq6Y7GFgcR1uM8kSe1L9mlY+m2fU1pHaec+Q36fat?=
 =?us-ascii?Q?hTvFANgcZx7uPzNKYoK333TGp2Vr92zM0OogLE3bKi60S8m/CuVAybwws03S?=
 =?us-ascii?Q?LncnED04qkkGy2bvJCef3VAdVV29n2rnMWpNaXC2rVpw61Z/t9MPlEYu15Uf?=
 =?us-ascii?Q?cdewwq6+8zv58/BRsQ9pnxEkqFtv9gDwuVwEe2pJbgA2NZTrHV9ATn4G1WeT?=
 =?us-ascii?Q?fq+9NXd4cBZdvBpK5teXdJ8rMDmQQ4kNZ1mv4Xd9ju86vti/EAcI9YKbxWCQ?=
 =?us-ascii?Q?LUcDW5iLSj7oc1b6cuMwe4o7t3zGaR/SJe4b81W/6QTXulcjhF3xflirwwCX?=
 =?us-ascii?Q?SLt6GMVUkN3BrKqn4abPy12YDHE0drHKzlkycq6TYF2FbM5lL3Bh/jcsCD+M?=
 =?us-ascii?Q?Ezlhq6SPJqRUtcuENg7rwU1sPaXvpJs5rv6V1RRwaerZ2U/Xb+clISkk8ml1?=
 =?us-ascii?Q?0DnC14FHSjARYHGvzne2xezfP0wA1mXehWBFVWu6Qv22kpnybWy30MejBZ3W?=
 =?us-ascii?Q?62Fvj1+Ocj2GrDO6SGZ1XdJzgeu+H+9xu3B+d3l4kUYomaOHrjwqraYo0cwa?=
 =?us-ascii?Q?DNYsSg89X9djSIhZgInMg31vdK5w60uFqbb+PDhN5x4+Id42dp+0zw5JKmBz?=
 =?us-ascii?Q?YtZPKr+qB1R+ljSUd0b9iUJIW5JhRZ7tD7PixAVK2iCvFgbjSLFvaXYim38x?=
 =?us-ascii?Q?MENQFfstjp2ZF0z3ajIUiIbvoTg9xgtNZQnYe2WruEMVfUxkofPJgYE9mp72?=
 =?us-ascii?Q?u4SD04+6UfARf91otU5Kwzk3vGjyejnIlua45Y3urpdqdo4G+GJ3ZFoQ/VUt?=
 =?us-ascii?Q?YcjhihOegeREHZMrAVLK0STH9OwT0Za9GYAfaxtpInBrnxTQNboym9WKP0bx?=
 =?us-ascii?Q?OevxpKEIRzCzTVQM+V8mbSX4HqQ8AcE7oZdZa62IpHO7EQQp14l8kSxMv1Q1?=
 =?us-ascii?Q?Nz3JKHCqaLmY8w3bZsHw4is=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c646a62-e223-47c1-4549-08dcecaad1f5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 23:49:19.2715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c0bVXUQrd5ilNh87pv0wjXmdk/H9yGCwJ0FrGRUI/7Elzs9B2HiIXgLGS41i5Dh+MV7yX44KMQ/1VunloDqVj9sDn2UODB1fjJcxQs4U/ernPaRqu1rrxoj/xrD1KqsX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13264


Hi Lad

> > > I was intending to rename the sh folder to renesas, do you think that should be OK?
(snip)
> Morimoto-san, what do you think of renaming the sh folder to renesas?

Yeah, it sounds good idea !

Best regards
---
Kuninori Morimoto

