Return-Path: <linux-renesas-soc+bounces-21881-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 286ABB588A3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 01:56:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72F401B22CDA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Sep 2025 23:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 171502DA77F;
	Mon, 15 Sep 2025 23:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PjxN8DIU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2066.outbound.protection.outlook.com [40.107.114.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54FE1C84C0;
	Mon, 15 Sep 2025 23:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757980576; cv=fail; b=o5PF/reCzsgN+amsPIBrHkXAvC9fn4iHM83IghSl4cXCmJ9wR6HFolgQj88vbVAkVnNPsfkpYnGprCfCKvVTqB8Yq8OWxJBG85jxQ+C/YUvLwBQqLnbOfbgN0Gtq/ijT8Ot8ahDPhD7aNTTZQD4DIHvZB1OxBKAj3Fi3pPazAws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757980576; c=relaxed/simple;
	bh=buPRPTov+4YL47vjCIRmk2UynYGWjSp31uZlpc9Qq3c=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=CV3kp9IihM/azGdZyi0zb9KT9y1tN1v5yc4/o40b68K/LeB82xQakhdlgraOwaU9CaQxkjR5RIqHrL8e6HhYAUfn88J8DgZL//PUwbF/VUyVOXye8wk8/35IpzwP2EsWhvZU/O/6wOL72VxuMwwuoNVTys8Aam7f8tayg4tz/0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PjxN8DIU; arc=fail smtp.client-ip=40.107.114.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ddNchYPRBFrShzkiZHU6GIrTwfDA6DrHdb5nrqkik01CI19V2oh+fB0YSdtYezk9zM75aITR8qV+MxTe6XtM+o1ivxVr5h530s17kb9PbMe7nT++FPL09Q9C0fXGxvfTQOG6YZe8NKhpGMpJe+wToaMhPISxyIRwULfRRKNk+0lj6af7svyB+K5iAly4PpqUQJolQL+cGMNFADTJftHpjpQ+u0gVamvc6Ua1Y+fmpPpPBBMdbJXrNvpsgmDghlZ1jlYg4tmzAP8+KBYHWp2E5pWeNgyaN9qoC4bnIdwb7bcDzfOEN0UdWGC9aMbPGmIfLs6SAXSqAwRoELJAhkC7Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTlzWiN6mRTubgAtlCUKCVwvnFM39wakxymQ2n1d9e4=;
 b=PThTlKuQe01IH1rD5TiOQyUgEjzIC9srEoCqbs1+tqvqDRjWDAQQ+1QfWMsb/US3PMMoHxw3HGzEFhB35ik4ClpIRP47CTRHOcveJiJIh4wpWRN1/JUdMobkob61cL/J241vbT+aB9LgRmQtY7nUpwSSzt8UTtRDFAJ2jUfW9sQnlN11ngaQOL1+sRLXVJIQIcC0Wei6gZkrYobQWIrvPgqNfOZCiTLVyVOjrLdM7QYcV+/EweEc/5q2pAc7EMy7TmgAqpHqpQ4WnoT0DzDgEnL6fd0YZpOeAMcXKqtBc87BncSwPgPusoKkXh4NgtPYdCO8mIiv71psZIvDWZyH6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTlzWiN6mRTubgAtlCUKCVwvnFM39wakxymQ2n1d9e4=;
 b=PjxN8DIUAbJY4p2HZrQ3ptYtoVSquaOO3GFwqKsfizo7nDIvJjXDxsa+cS5VD05j+LXjiCsrus/W56TqE/atuBaDzn3TvqGVtgLjA62MDib18sYXo3MZGuHyJekpm/GeMaVOzBIdqG/kT01llXveeTx3euvX+oFfzNdNShSNQ5I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9747.jpnprd01.prod.outlook.com
 (2603:1096:400:22c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Mon, 15 Sep
 2025 23:56:11 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 23:56:10 +0000
Message-ID: <875xdjjmna.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: chenyuan_fl@163.com
Cc: geert+renesas@glider.be,	mturquette@baylibre.com,	sboyd@kernel.org,	linux-renesas-soc@vger.kernel.org,	linux-clk@vger.kernel.org,	linux-kernel@vger.kernel.org,	Yuan CHen <chenyuan@kylinos.cn>
Subject: Re: [PATCH] clk: renesas: fix memory leak in cpg_mssr_reserved_init()
In-Reply-To: <20250915131214.3160-1-chenyuan_fl@163.com>
References: <87segx256a.wl-kuninori.morimoto.gx@renesas.com>
	<20250915131214.3160-1-chenyuan_fl@163.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 15 Sep 2025 23:56:09 +0000
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9747:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b9c483f-02c0-4cda-b2ac-08ddf4b371b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QIpV+XOXtz3cf0yQMOyabt3jPFVcwo5av8bkf8y/x4+uUufL2bf2KtTw/K3l?=
 =?us-ascii?Q?VqfUz1BphA/GQiHJqfhXXUR6u17TZi5HgRh8gl0DDtIZJAnZaMtQmxxMQQ02?=
 =?us-ascii?Q?8CkWrUQOGwY96Ktggkdoas8/qitY6qQKOFtQANHqHP/fIW4BRcWKbw6JmOOu?=
 =?us-ascii?Q?Xie31Vq7jUSVWh7TGvFZ3gDLegZ+OzUFG53MJrGqC5m/JR5yb1rJlF7m6eSZ?=
 =?us-ascii?Q?4kG1PdzCUQGpeNS/s72GcvMRR81H6q3c0fFb2tYDSCKHq6J206sxCHin5bDZ?=
 =?us-ascii?Q?a496Q46eFt01DtI5N8DJUhFi7ALVbtO9gI6tMeXBJDpjbp9IWpE5hpWd9oxB?=
 =?us-ascii?Q?mQLUoqJ+D9G/Xo3f0N2nUuAVpjc553nBPYpwQH2Ty5/vEyPQ6gvYwt4LmjdP?=
 =?us-ascii?Q?iFA85K40VECoDoaikj5Cx8Oa/RtNBN21EWzkoGgRZuLr6jplRyeAHdHGa8xC?=
 =?us-ascii?Q?o2QA/Q3wndLus4ShaO96h1D6yfLBlZosAGl4F7V0MCmqECR/jPg16gZ81e8v?=
 =?us-ascii?Q?zOxcd6iB24HZk6GXVSxCJ1aeuklukoSn7/pOHjjLg/ivhN/KDqtpdk/vPhdH?=
 =?us-ascii?Q?852grGFcGPb8wsZkxK0gDkpr9NnZgwtyzr79um6SCSyYOUHLtnx6ujLTv3vo?=
 =?us-ascii?Q?9R1ADpjEZFsv3jYm4Teon+1IfAtKfOmrD+rPHV2j5waZLb+xmvA/+lG2j+ka?=
 =?us-ascii?Q?hOTuHBiGt4+v0gZRnA+eatUp4tnKHrOMNY+I6NS5FIvJp9+QajPJCfmwK2kI?=
 =?us-ascii?Q?UQMEAtDHM1HPAxyppeALoPMqKXx65r5RDeZYDpzJmS8xY4n9rwPoNGvHxflM?=
 =?us-ascii?Q?wTxANZxsuotVx9y/ppJKAffLcF3BGDdipCUVdA7yEJ86Na7Ku/6GLD3ukayG?=
 =?us-ascii?Q?qI9TALdR/Un1tp7WRnvkAElMAqCnM03qmbQSiBsUw8IjavY2ZsYR4UvTjIsA?=
 =?us-ascii?Q?R/gMhpSbr+UN8NHZ8IJcdZH4mmRQagKNX8R5jEam49nmS3EV1ylqjsnLdQAC?=
 =?us-ascii?Q?rJ3T5IOncOXgvm4B8lotw6AoNWTvFeHZmWXTm89zcZZsBMZrpYCzX77K4fYg?=
 =?us-ascii?Q?P5PcVX5VgRI2xouFmzFdm9nYvXRgSUHSmqs/ToLWcyPJ5yLWsGzTkDIsS/iC?=
 =?us-ascii?Q?B29FR188qmFrNpEQWWksKkuWJdgC+IYyDyLawU2RbokEr90ohY6qASEFHUns?=
 =?us-ascii?Q?Dqnlv+jGnrIedMgyMCBITmAzeJ8sSXvo6sqK1ULcKJrM5RxhhQdjtUoTkQG2?=
 =?us-ascii?Q?FQVhxS9m+IIpxxChnVfXbUwgPF9ZDodRTzC+Um/qL3srR+41sgtcOzOasAw+?=
 =?us-ascii?Q?IYsmztNcQNA/K1GsShMDP3l60MMJ7sXT9KlrbFHL0OYWCNZiyoglI81aC0Jr?=
 =?us-ascii?Q?REYtZpGraxwqynEAu58WQrDlWiuaCOHE0IFyln+bsOv6KkY7pV1DI7R8gTw9?=
 =?us-ascii?Q?GOA0VYxuw7mr/WjeQlTjntDNjFkMBDIdUORNZhUNqpoJGYJyxosQxw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PF+OF0rJzFoidjio6qRBkL5Tn9RD2YC53CO/xGf3hTBqpqHiSn1xiBY+0Dc0?=
 =?us-ascii?Q?6GSPSEPCLqKXqqK8gSA+pH6j3sHXi/BjiyLgTq6Dk8wDppGrPSkYt62M06h4?=
 =?us-ascii?Q?+KbwjlfN5OFqXCufNHLLZLppuVeLFO98ZmVVlA7ezsapW2ddMs6DRRzgpnEr?=
 =?us-ascii?Q?+IwJBTTXb8onsMXVzf9x12rN8y6x5m0VQNaiYIDIcTd6h+yNe51PwBYtVx2o?=
 =?us-ascii?Q?QAXg/D40kL0lvjaHhJDJP3h2UAWnxbrkwO1kt4Jc8QJcTj6uxE5n2IkIGjYq?=
 =?us-ascii?Q?OdJZX4D/O4jIQJzFgZnGFwrCaRuDXZ7HkzCCAUuJ8FEbKdmKJcgH1I4mFAiq?=
 =?us-ascii?Q?HW9JfhHWqESOcEuqTYDyoTcfrrQIE5YBOmPdW1THHrA7n14a86pvBbUP/eRd?=
 =?us-ascii?Q?gQQKWKb0NGQMIg58M8VAZqmwAm7RjmlBsLfyudJDDBs0nMvWXsW6vvvKFhKu?=
 =?us-ascii?Q?3Hb9Bvc7fE93qcojCj7+tRU88tF3eFla7tkvxke0nLQ9S7vShQ6uK5y/lL1z?=
 =?us-ascii?Q?nuCkhFNeqysfaT3psTAF5ANOvTcfBpizBT5PeCG7a3iI6sSJqpOIejYRQ+Oc?=
 =?us-ascii?Q?uU8Cv9EXtn3EsQ+NOED4nBwy/NRPyYyX3r5Jn+aRbYYgLq2P0d4vM2jh/oya?=
 =?us-ascii?Q?MlLzo5dORjm6+wQFUXgzAB+3wX7NmnXq/Lot5QqaqLEG+ZfOzmY82RV9DrwM?=
 =?us-ascii?Q?5/LZyGgawSe6lEyLsC/rkZBFC/TQg4l3LqTKhe7gav28teBkNyHrxNWmwcQi?=
 =?us-ascii?Q?H8uEdOtAwQqNWFPCzgJi5F0MSjDCfhipyP/Lu7q4z3vIZ3hs89XGsBCDmz8F?=
 =?us-ascii?Q?BEkgkZO1hcq0CN2zYuqlIzpldsuNVPduE/fqb2w7+2DkCaecxJtry4UNfaVy?=
 =?us-ascii?Q?Cor7WTkUDet8f+vaCEfcXcmep1ASHUWcRzCIfJ2LDhrZdo3JCpDqUfC8l7wE?=
 =?us-ascii?Q?84CvUKastzFLk5QjmX6VS1HTunKswidVzJ7OUIEOxvem3WpBtQWjpDxFGDaJ?=
 =?us-ascii?Q?Ksp1movoTrUUDh29BSoqn+UJX+lKwKAopOF8q+jj3usZA6nJ1ppzXInAGvc3?=
 =?us-ascii?Q?Io8K4ounEe6wLeP1FP8ygrw9aRpYYfQkd+IWDp/Fmf5kMSI0c9Vi3tCRKTcp?=
 =?us-ascii?Q?b/KjlJitMnAqRhKDgGLN6fOqIHb+eFCRfmPCbK4FlSJl61P6WCFa7wbllgtG?=
 =?us-ascii?Q?NX5YusUZUm9BTq6Z9QSmDKnVIBpTj3okfz6DjspiEJerVbNPk7D0vUceVzOk?=
 =?us-ascii?Q?/wD9LUIDxMkHR9Nrpc3G791XETG9t0mnd9n3vZgW4CaG5gqCYKUKO0KTjPeZ?=
 =?us-ascii?Q?c+StIsVGoSCD24jMdNEBTbBrSEyWjIDxGtaWmFOD07UzPt9nDRt7T7Xdj5sF?=
 =?us-ascii?Q?3MsGd8k9JioH2TUtjzV/fgv6DO96qQ63aM7/8U+SiIRAPRNTu6rhuZN6FqoW?=
 =?us-ascii?Q?TGFcKdXRN3hGWWit4OGRCtsJXEXnc+dOS7NeJFmLRklwSsPFh4byiQwTNrwh?=
 =?us-ascii?Q?5jLLHgSPVqNRwaPwQMMDUohwH5YiD6zXuIljwrj+U4/W79YauKu6l7wtxSYy?=
 =?us-ascii?Q?8tH6EAdMO4cLnniioygZjtepxR5/o/0ehV8GX5VMCe+9yEQOU9SjLIy2noOV?=
 =?us-ascii?Q?OmuhuNiQI0AII7E7P0kUnvQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b9c483f-02c0-4cda-b2ac-08ddf4b371b5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 23:56:10.2755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eBZWPaSFMq3BXqzIlELRC43MExkPVY42H6gkDY7s+OuL9BVzon9HtYN7+asW5cxtuUYj+ALAPf37zV0kywYC85tWrg+5qkmya3mBYfWxyY431UWu+4ytEeKDWlK+KAqn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9747


Hi chenyuan, Geet

# It seems 1st mail had strange header, repost

Thank you for the patch

> In case of krealloc_array() failure, current error handling just
> returns from function without freeing alloced array. It cause a
> memory leak. Fixup it.
> 
> Fixes: 6aa175476490 ("clk: renesas: cpg-mssr: Ignore all clocks assigned to non-Linux system")
> Signed-off-by: Yuan CHen <chenyuan@kylinos.cn>
> ---

I think Geet already applied this patch with fixing git-log, but

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto

