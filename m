Return-Path: <linux-renesas-soc+bounces-10197-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E18C19B560F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Oct 2024 23:51:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54534B21DEB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Oct 2024 22:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50A7A20A5EB;
	Tue, 29 Oct 2024 22:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="o6oy9X10"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011012.outbound.protection.outlook.com [40.107.74.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C84D18FDC5;
	Tue, 29 Oct 2024 22:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730242298; cv=fail; b=JiADzFhcSijz4iFGPGs+o+Dfee9OfprKFbksNtxUX4k0fTGZj/c4OAIR47rsAO6i8l1FLxgM8AKVjBiU3puhJNsqdZJtU4zGCpRsIlVgqBOO81AzWF38naCrpadX69cXmq34PkXW8gU9e25mhebE10uj4D9cve9jZ9ETvbkLc5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730242298; c=relaxed/simple;
	bh=FSWPi06VKVxsLhRkHTRDy4TSiz+W5ToJgLLXLTANe7Y=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=h/eXpeq6IgJaC33NeSO3tHCt3i1IeLr4DpvcqKMWxXirlq0YbQTjPQjru9nT3tZBKoxzf5L1EKlHjJiMgf95y7HfZWAF5IhTsS3ZfAFf488B59NV/hHCtqR5SU6OrnsNRCYkZVkxxhHFHwyWHSjAnoMgKf+dRGbEzooBFN14QL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=o6oy9X10; arc=fail smtp.client-ip=40.107.74.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fko3RPoM+COhRr0B2OxLvR7V0J5aG60w5zaU3YC6guKtMe3qH+8ukMLBPThFoyEK2bGeOPYBNQmOObGObtiBH8lpeMDqfB00hPFTkONk7cwjt/i8MbVnTsjvGomaCEKGN0lFWiq43cY8NLFydJe0Kpmhi6xSk0g0aaBR9Pv2BP40B8Vk7rQ9f/VY7J3/0raYW47D8IRK3HNFFE8M0XngyQuKXloSuXXie0J3oxP3imzIqfmnbre2s32I71W68n3E+ClRbiF6IwwUjTVtvBOs+xNI2ZbsA70WcNQGXYWlqKWfY9StcQJi/nnZ3ED2viXM6gVhlo6RwyIDdmYTDNepDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hxLQC9CrAeXty/k1paG8wgMENRUknfSzLzdEDDQOl5I=;
 b=uu3NzH6JmxbAGloYrEAFkB3CPRZUQ5JJ5D6HSMFDPOKhk2ygPi1dGqGHporag8XVdsBfy6CcGlAxZs1gVFOAqDyKuF/3DKvnjKs2Ro0WgiwCJo2MDJQP1DyQJzxvUx2X4guMtecTzyYBmApDDi85agGuu71rvmfx4NpIZooVeUIbIUBq/6VvU3lBee5ReHzJaPe1WKgh35yJ3dKvdIbIzf3Zb+G2QQzrYxBLKbPWmK2kk/Qoe5S8E1J4pszaVU2uQJmASdafLpKoNbdcBXSdovKbmf2KYb2GDMhf+wVdqtBHC943XUxM1g1j0P/J0ponzDJFOnQI77/hj3DBpmkKFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxLQC9CrAeXty/k1paG8wgMENRUknfSzLzdEDDQOl5I=;
 b=o6oy9X10PZXa63HL/sK99BYx96uzNoGiZCOIFRSM7KkMiPjXlb9W0SivcLkXqLEESX6Y9duQcUG0BNz+kp+QvRTBicGPZPDgOp8RMgWm6aZNr9FxG8cGvh2XHwLHLCCzmRBniZ1OmKuc8f35YTK4xJloOxznBuedYANvxSxpYMk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by OS7PR01MB11837.jpnprd01.prod.outlook.com
 (2603:1096:604:23a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Tue, 29 Oct
 2024 22:51:30 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%4]) with mapi id 15.20.8114.015; Tue, 29 Oct 2024
 22:51:30 +0000
Message-ID: <87jzdq4j6i.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] arm64: dts: renesas: hihope: Drop #sound-dai-cells
In-Reply-To: <CAMuHMdVX7hYdH3iLKttqkYeTC_ZGyCNmSycUtUx+QKSDCjaP1g@mail.gmail.com>
References: <20241010135332.710648-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
	<CAMuHMdVX7hYdH3iLKttqkYeTC_ZGyCNmSycUtUx+QKSDCjaP1g@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 29 Oct 2024 22:51:30 +0000
X-ClientProxiedBy: TY2PR06CA0001.apcprd06.prod.outlook.com
 (2603:1096:404:42::13) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|OS7PR01MB11837:EE_
X-MS-Office365-Filtering-Correlation-Id: c2cd29bb-0aab-40fb-4483-08dcf86c3ac1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Rg4pb6KsUz4D3R7qa3LxbLIfs/yOqFTkerEYuTHP5czprAVJOP2nW3ZaL1M4?=
 =?us-ascii?Q?lVbyYMFYmZlU/byL+rt5Bp7D/gCBCbhiGcyzy8cmdfkNa/94ZyQv7yW+AgQb?=
 =?us-ascii?Q?o6oYCzszDAhlEpUIw7Fycnj2QBnpEVi97sMP2iukfVtPujMTh1CDEgeocj1I?=
 =?us-ascii?Q?wmDv64NchhydxbFdQhx9wG/8RgtmGttcDaiVVGdfZtPKZo1E+Qiy5Nb70RKd?=
 =?us-ascii?Q?BHWf8oFkNWZJvTGwMvv3wPtHa5fEymc/Ynj1ZOyFuGHgE4WxkUHYjyO8U2k9?=
 =?us-ascii?Q?4/M+buUW74WCge3cQ+0pyykHiCs4+EUyL/U5xKUK1fgMsPfnCKNcwiQr+90R?=
 =?us-ascii?Q?t+ncN1BlMIU9ht1m5dcFUVajy3B21I0muaPHWtJibGKdIysszEM98SFWv3/k?=
 =?us-ascii?Q?l3zQ/TRRmOkrJzjU7brSZc4NMfIXUzkCaF7XPYoIiLwy+GnO06I4OxNYedoQ?=
 =?us-ascii?Q?m2KgRU8ypNfKt9uy1Kz1XV/Zt5tWo5ITzid8aeOd759AbjfDaKkrTPl9CJIe?=
 =?us-ascii?Q?c1MkcZ418Db2liMQottOwG3Ohyd21iu8vDb2H1UaBQJJ5k+1t4e1GWQiTbuL?=
 =?us-ascii?Q?UePZoVkLyjJnV4cKJQNjyNTCnDBWNFf8Yw1nD/506T0eR9aidEloagN+I+l0?=
 =?us-ascii?Q?RI2q9Khqan5BbCeuSuw/y0L9BgYQeVI62q+Zq9QDhKwPrAY5KDiEF2l2Shma?=
 =?us-ascii?Q?hArD+wbm+8gZC/k9PDnU1KMt3yVIuMJPvp0hF5piSbLWYdHVQCw1sI3na/72?=
 =?us-ascii?Q?Ya3CuF9pEHfu7xRolW4lsDhTnMJeFlsPMEpUIImbOGkqHKjgtIu9CQantSTj?=
 =?us-ascii?Q?+L44wBqHdv5W1fkP1QIsCwowei7miuPbGPEX+xOczaktDqPiQP9U/Zo5tAwC?=
 =?us-ascii?Q?jp0NN5EVxNZf0no5RKrjE6zK2m0o5zv3UYocVgSU6fdy/tsK9SPIhi8GWxQI?=
 =?us-ascii?Q?rD3XIRhrSs4kd46yse4rqpUAcPrcK00sIt6KvcdHe0aha8Ba5NFNGwJjwjKk?=
 =?us-ascii?Q?ilsqX3qgShCsTXELyR5hEhq0OeQXrkvxqdzc+4f1KJTwWKY7aG+bnzbfgFd7?=
 =?us-ascii?Q?XNMqkEB5iXmvRHdV30kgL8WPuulpL6LfQG15W4K+jh0VMy4qMulek1WTfohW?=
 =?us-ascii?Q?67x18Ci3acOBCYPWD5C1xcZ8dyo8QOl7jCP9HbaPismXwu7Ox2fHHOiy5BTm?=
 =?us-ascii?Q?aDmgC+77wXoktaijpyCTqiFAxGLJjKH0t5uUZ96dhiN51rLWhRltMgOXKiCb?=
 =?us-ascii?Q?lvDJAhhuuNHdjb3uf4+jawhrZE61Rt6+2n4D4pEKIQzbJP5fVImjqL1QqqaJ?=
 =?us-ascii?Q?+NFqDV9MzlaVwMh2sXIY1DvO/bLUFb0FMdU6X3/zWrqUdJCI0rcmeb3XNPpI?=
 =?us-ascii?Q?w1hjcPs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10906.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sZm/RtUnDxKQscvyDpwqdbP8AC2xhKX5PlJ6kTIpixOfD140Z0JdnwsH6d8D?=
 =?us-ascii?Q?hB2RXgWUYOMbT1bTzNknazom4Rpqp41496gUO4kU//vPu/bOYsNPuKfd8c9/?=
 =?us-ascii?Q?OFCpgh0pY8fmo6qq4Lfv2LM47wkK2WBXKYYqp5+d7Gbkpiu7Batr05FDoWYM?=
 =?us-ascii?Q?uDa2jm9aFDPMk/wMS9UmlPR88EjyIR8hdQqui/ABHX4QVCODxf0R12Tjs8Yw?=
 =?us-ascii?Q?O2ClzPhbd95vXvmahzuvwRDOkaRbdH5GyY1EoeIfNbFJ/xK+lTGnlbU6IMvs?=
 =?us-ascii?Q?nSCXQmqYES1EjncFBXr/4MtFCbDp4wp5gsMbH2M1vhi+dqCrYQu6FPdTtbUf?=
 =?us-ascii?Q?mjpc8uFq8J3Mz23TgxmPjTlT/WpLSKxB0vinmpas9Vv1/GPB4c/0nCHlHgUM?=
 =?us-ascii?Q?WpqTSiavGbw60KJ+XcudWTQ3UbjTAuzZVAC/qw2SadXWMOMHFf9DgwsvwZHW?=
 =?us-ascii?Q?XjvjwrXZAqaGwov9+6e1UiBrYJdcbQc5TQBcm5NTRBBrCTwRjjQVTZB2KTPg?=
 =?us-ascii?Q?cIcOiJB4x+Q7jzAPzkdgHLcsz8d2nsALXgIkqn2t1wYPblknz8QQ4szaOIrD?=
 =?us-ascii?Q?gXB7ujhwK3QdZNhk0VZ7XgZbYJiRED2aUWDl4BwWlHsgA6L3HTy3jcAaNiKj?=
 =?us-ascii?Q?QiYPTyQbxQQgK3UEk97vKWDRe4v3Ez2W/LYcuTy6LJuHEiCoD1e/rAuOY6nX?=
 =?us-ascii?Q?hr+05aBGbwYCjrM8iRNg+O4nHzTtcpj5k5imtZSvvm//wkAEPLfSDVvAY/9Z?=
 =?us-ascii?Q?1VrPoAWSgcKBPBVs383JYVMlaFYUWumXk6X/rqDCFTT2XCH0CakCjvAe2VcG?=
 =?us-ascii?Q?12wda/pri4jy01TugOS4dw5DLez+OPL3f38a0wphPhj/7XVMUtSZDTaW9Nba?=
 =?us-ascii?Q?k9ScJhpEvOg2DhHMtwasdk+zpv0gQjDpKg9KPcHV4QjMz4PDvuaPM6+Y8lCG?=
 =?us-ascii?Q?42Cc03Ucek6OZ29vF1pbNKBZqzWb4tgKhvga8hCdldci5JQOxzoK/r/o3KT8?=
 =?us-ascii?Q?UiCoYdNf9Ak0M25Tv3al4SdwOFmupyEs/zCbtxxVAI1iLXLHgRT3S9vuvka5?=
 =?us-ascii?Q?5q2RnDLyT5Mpt7J3LBsgdGZFnZNLVeTUVTC0iFcurjnX1tShOTrEa7dLeKlF?=
 =?us-ascii?Q?QrxRtigjY0Q2veOu/Qy6Mn2pboeDrHwIJNfe/XsY0C8fdZy8ZirRCO11Fuj/?=
 =?us-ascii?Q?xedca+rMAFdqShMzcjnD0TW/LmSG0KLQyP+GFLO9ndDFQMzO47qSiMXk4kz1?=
 =?us-ascii?Q?f2OnnRpz9mtiSRyifaHlfG36F5maOpoDhZbBsCi4+iRJdaAVfC5w6evLdkcL?=
 =?us-ascii?Q?u9EqaUOqOz50MqQi/YMAcG2pydQs6VfyvdpFwdfI7vxNoGRx/ZsqkHHRYHfw?=
 =?us-ascii?Q?dDHUfYbf/62znbHmKbEILgwwiuN9Ek3Gso+gdd0jYsfwdjQk2dI/kPryDanE?=
 =?us-ascii?Q?9Z47CokPJzMPaKL5qOmtNv8eRTezSb5gVt7+gKzR4H4NjidRKenbYcXxLQBs?=
 =?us-ascii?Q?VgdRvUqD1qvuVTWMztwxc2gsu2Ke6L0qgwrs2RlpfrudjWvghZhev9cJX2m9?=
 =?us-ascii?Q?kHwqzUBVatuOXH/8dTc35vVmAz4V2h5y8cOfFedrpWNINK+lGy+/8POgc5YL?=
 =?us-ascii?Q?9djXAOW3WkUtJTLPdkBGUjk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2cd29bb-0aab-40fb-4483-08dcf86c3ac1
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 22:51:30.6857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QltFFLfyevXRPCRK3b8nRHBNO9JFMkTJSRrSR1hIyLLhbSEzdEACneJPC3UoMSPagqk6B5CJ9b+ib1x1mjDgRR3RCdIl1F113LvCWFxstg08XoQygTRcAjjLE6z4X9LX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11837


Hi

> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > `#sound-dai-cells` is required if board is using "simple-card", and on
> > the hihope board we are using "audio-graph" thus remove the unneeded
> > `#sound-dai-cells`.
> >
> > Commit 9e72606cd2db ("arm64: dts: renesas: #sound-dai-cells is used when
> > simple-card") updated the comment regarding usage of `#sound-dai-cells`
> > in SoC DTSI but missed to remove the `#sound-dai-cells` from board DTS
> > files.
> >
> > Fixes: 9e72606cd2db ("arm64: dts: renesas: #sound-dai-cells is used when simple-card")
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.13, unless Morimoto-san objects.

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto

