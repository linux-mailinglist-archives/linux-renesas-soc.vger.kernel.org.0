Return-Path: <linux-renesas-soc+bounces-14445-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A67A2A6458B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 09:32:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2192188BA0F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 08:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCCE721B8F7;
	Mon, 17 Mar 2025 08:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="NnuO3FAC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011050.outbound.protection.outlook.com [40.107.74.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB2A21ABA6;
	Mon, 17 Mar 2025 08:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742200367; cv=fail; b=nmI+v9DsCmRc0z6jYImkOHMjtWd0TrLAd5L9udnZYIrctcIburbTx/txkN6yG/ECQBFYozg83HoZciauYblLwhn6uVXnu7TWcw/7Ee1IUdsU0l7tkLr53DWgdQG4O1gmDQamnO5Zx8xZEyrlLe2I4yoO7BOMWSBVskFFWmThMPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742200367; c=relaxed/simple;
	bh=WyS0v3m/ERZl+ceSe6OyPnfjUe/eO7ZQFhbAxhE/rqs=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=kQqLG28BbEBF77k6Db6XR4mnyqg+Tp9bfqf/AwYP56NqIMo3E7C4n5x0o73ch8AW2quvRMvB/pj67AUhkgOCM01WLJ+uWdY4wAAihOOTBpakU1psutypHa0CMbty7+sjBsK1mAMyZcF6e7rOSu2iYYe79L/KF2JpTiyBjRC2cTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=NnuO3FAC; arc=fail smtp.client-ip=40.107.74.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sfLdS/hx1CaiQJe8AuodHLAn+gHFf9xhmtjxpp2TP9iRVPSZVBVhBfdw3PklbLOktHdmRC/T1ACYTGxzs4SNdVfFjHsXV8BHWKqI1ERnbWVys+ImVXKG3P2El+QXPV1soWVh9kKzNX9KbNfzL7QXgFdRA/11bgUX82aPAtUOpKuUaUuFapTM2R/GQpY+MpgInHOuiWPXqaG82849Glpi57ahHnMjLyXUBFwq05+HP1UYIQZti5sKSsdJUNndFNaR7HZgQ2xWNAIJWVBCEZ4+3AIja40++YleSmlytObexEe2imDh515SsQFMG/PUblWEZPL5cvKTTZkDTWHvG9/g2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TEJejFTpWCTTuAhJLWweJePlE5MGT+DM/cDuav2DZgo=;
 b=lvPkyFPDv2pcxbzyNqyGGOku15leAR5XbcRJy5RxtRMyiUJufzKBvo4fqtEhgKk+TR/VpKw60p2d6Tlpsi4mW2Sq6yH7CXACkjwGGad0/D7eJpOWHV2urLm9EwPlP+XrZNkvwQEGknLat4+rMS5Y3Y5cctVyJu80kFwK4+IO8LWrnc6go2PSDyDRevaEnxKvboFlup71V4JBvjrEHB+SEG2cc+qbfDIY3ABV9ABEhX6M7sBPE4Ivv1eyC7lqSebt5NgGIbNJUti+oIANhg3cf7EPb6LzeGsY7FyZtrUA5OXkWBKmzn9YgCUaei+tcvKea8sy5WfPmNMgoUHe2lWnPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TEJejFTpWCTTuAhJLWweJePlE5MGT+DM/cDuav2DZgo=;
 b=NnuO3FACWIgtJSZkuYhX5ckCDNIBunQT7wTSD/hbPZ1KwpWxtzhRyrfIu+dcxcnqxvgsWQ5Qu2Th0Uy/+8RD3mciYdVfzomqkezbU4+6P/enF2M+Tevl/HdlvTKrR5ouUveozKgSERhfIny5DdVnmFBLN07o2U3u51gwFyX1pwU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS7PR01MB15407.jpnprd01.prod.outlook.com (2603:1096:604:39c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 08:32:40 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 08:32:39 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] clk: renesas: rzv2h: Fixes and improvements
Date: Mon, 17 Mar 2025 09:32:08 +0100
Message-ID: <20250317083213.371614-1-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0027.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::14) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS7PR01MB15407:EE_
X-MS-Office365-Filtering-Correlation-Id: 96cc1d30-cc3f-4b88-a9dc-08dd652e4734
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cW1izLky/IauBMJC00Yoo+pyFhksw5atKGUTGNjSqgvUHKm7QUuf5JEQZil4?=
 =?us-ascii?Q?mxKp2dRmDyruJfP68qlnLzbOEFbvpu6YicqSY8j51R2rQRtchbGVnzvd1Lpg?=
 =?us-ascii?Q?i2u5kdQi44+Kje5rUBjWunrmTz2JtRM745wOucj7+OJyfPj4/Y6PEWkvfts7?=
 =?us-ascii?Q?fedkTYnE1vYKcwGSYgY6ocSZclL3myI+rqulOVJdf51gBaQUJNpeAjBrrZVt?=
 =?us-ascii?Q?V5wsqV5/mZX0goxP8VlgwOCOSBYDJ9Q+6RIhnO34Xkfg26YaCsSxCDU8GlNQ?=
 =?us-ascii?Q?LaC+UoWjVJTvvk1hB8MYKHvGC+7sAp6YAMmNXXz61EthJAl4ZmZThlDrUn1I?=
 =?us-ascii?Q?UKZ2xbIXX4je7SlWFCwdvVHeuHmPhC8NfOK96VtfpSqiDXpTQXel8d4Frofd?=
 =?us-ascii?Q?Ozu8C/d0MVkS9fUuePvxB1kDtubm+tnOnLnW7juvVTmkAyleIRCP2k+EqAMk?=
 =?us-ascii?Q?VJ+uc14ZUNg1TACC5ncGmv5K3RLIKF5kFvPkIMLyOkxQMJ83IiAFxrkb9jzP?=
 =?us-ascii?Q?zVwPC9b5VA1DvrTT6TZhUNUJ7wfh6U79svr3DRF8tqzwDV1yE8uagfX7181f?=
 =?us-ascii?Q?OWR8Xo0rTeFym3KNMJI8djqGW7+Au5Az5lD2xmnL0cNw6c3oKwUmTBgRENqg?=
 =?us-ascii?Q?cRxkQHGP2LU/UPW+zf5blm3qSdgiERxHST5p55xNfhrqEd6XGdkO0hDyqwAG?=
 =?us-ascii?Q?nrrCcahz65O3lIZivCtEUjqhD1/UpOGMSCjZ/CRD0fsDKpLCetN3nN9AOW6q?=
 =?us-ascii?Q?q7zD7TDBmjzwFQgMkQYhnKBj5IPp2g+gzVmn7BgGHgjO161H8yqjZRMol0+V?=
 =?us-ascii?Q?Uow6akDX0xYn+Lp4ANOeOKdlp7U4ef/osR8+P2MxsLKLczfaswUkhAAu5Yaj?=
 =?us-ascii?Q?SvM3+XZxWFMqZpqWetbXS39S0EcewcyidcmvqcOb1BqV8lpu9eHqe/XPQOMP?=
 =?us-ascii?Q?dup1TjzE+UH9COslyzmr0CckDxod280ucXErzDIpgcY/YjXhyQL1w43s495H?=
 =?us-ascii?Q?et3wlKf4FlSrS92SftrvTFMO15uubtDA3VAWhnrcSGOEGhz3HxsofZXworXQ?=
 =?us-ascii?Q?W28qi90yNXsFnb33hDOeWY5a1QzQhqjTRyzQouHI1nSHaMQ+Du49xySOZXQ0?=
 =?us-ascii?Q?NTvP8Qr/ahcj0IEYknZ3dOYLTEZOi76pFkz2cfIILi+G2xdUS1Sn9dR0JBrH?=
 =?us-ascii?Q?CEjzcOX4moT+GwdB606aiJmvhxWeKr7Xf63LwaQG7Lxqx2ZWqi0Xjxys4F+O?=
 =?us-ascii?Q?4F/fPb33+7soS1CKT7R+2loo2qyCb6J82UeDZmTDhne5D9bjDvpM9zXhW6oy?=
 =?us-ascii?Q?EklJxAHqdnzRPlPhA+e+bwtjwjgL5ixjZAZIri2qdVB0CpgsMg1yDaMkIyms?=
 =?us-ascii?Q?lubUyHbZj+byl/kSpxgp+FpkmHbLpM+hnxQZ1IUNqhvEArBU48H0Ndn24AUR?=
 =?us-ascii?Q?XOB8wy339F4pBkGZ+qujG8sQK2orp/3V?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GU09lBTmpP6onBHNydbFw5om4V4oZbD8/QL4/awN+TgGOUVSmRllkeynzGF4?=
 =?us-ascii?Q?xyWp9NyVktUrxvunOdOQjJglV1KfvYEi5gViOurypv/Hl9yYSW0vHH6ANvYi?=
 =?us-ascii?Q?kGbJjUo/vdgiXg82BxVxk9q3N9hlYvWg7Hx29Q4nmYoZtz7OF8LSDDCBfnDf?=
 =?us-ascii?Q?q2vWxCI1INEJs3JHYtjk1oheZ+9g0BP8lxPMEbs31Cfa1QfitO6FkecbU93y?=
 =?us-ascii?Q?fBfFOpqjs4GoX8oT0N1vnqtfYbyU7mRFro1qqOJWta3MAMFMRYyPSAcAvP+O?=
 =?us-ascii?Q?w6U2cW7NMvZYLYgi1h5q1wY6T9iO1SYq0WjmWe3grutrUz/sNruDOdUYCacu?=
 =?us-ascii?Q?I5KRWJTY4198Ia8zmhXrvNTp0Yefvu/wRitMGq+lpU31VibdgJS9xEced6qk?=
 =?us-ascii?Q?eXErvO5IgFjDOCnpybmx32Sb3AZclYmBiEtmqThTwd5p6yS4vurru4zclgm4?=
 =?us-ascii?Q?GOv4CFU6959hyCGXRLezQIdZJRaGmbuE3aGPlzhbdU0j6eDIGWMoBI2Vdfb+?=
 =?us-ascii?Q?Izw/2SUgu50PFexd4QFGaLASHo0EsVGu3KGgvliXtor3kBiRVJ8b7w/L/WxK?=
 =?us-ascii?Q?5uWHlj6KEmakZUz5NxN+sfT0wTjoHm6PdFB800DFhpHlrvsETpijKQpORHqg?=
 =?us-ascii?Q?ht64934GaIQwbLw5xr1apegpe0aPmwAMYmr+IfhfH8I/AlCcCehzbvyMILk+?=
 =?us-ascii?Q?InR2Xuqo8KEVamcQck0Qq+xGvuufyK8fCG664ytF4KmcpPYu1VRnb1JB0xmA?=
 =?us-ascii?Q?twZDyUynab3rkbSZQbi1olzE7GmVmtWpaG73YwH1VsYJ01jpIRJWjQasf6fO?=
 =?us-ascii?Q?4Jl7kOc93Jonpy0c7q3lkLI5YBG42Fr599tQmx4SdH7ze9QoT9BiNf4g9d6P?=
 =?us-ascii?Q?O/AnP0/8ak/R52giimHjt2zC4tReeSeMxvwXcfjhRudU8wITVoeLJ5MFXPl4?=
 =?us-ascii?Q?DsIFZAnrbg/qcJYFUxz9zheSDN6bdthbNfGeVa3NZWirJ5A0xW8nUuPwQI6S?=
 =?us-ascii?Q?OhW2tsdu7smiK22L1FX/YoOOlK0OGSQ8gB70xkhq8Rf7p0/Lx3CbBY9o07Fv?=
 =?us-ascii?Q?HlR4P7YQx609FF0PZN6AnZ0wxkBsGhg5vSjtop+QTMZ932PVm0A1YXoQ8i/S?=
 =?us-ascii?Q?iR61F5QS+NiOH46QIkC0Ze92iPdKVqyFpPI0e5URpqpXYf4G50eYKC5pXg/t?=
 =?us-ascii?Q?eCmS8R1TVgMUcuxmu87GLDPcVLXp13YMeyl7EbC8pB0do3AATThCH49aOwGT?=
 =?us-ascii?Q?QRmiEgOweGbmTcZmu7ev9wPv/lNAgXFolCmE7mOrbzq5wnIMD48v7QLHQOiT?=
 =?us-ascii?Q?Nmn9OAh3OuIrvD+ZM+6y6StpsGmaWXLwgGFS99+r8LOe6++2bkQ1+j+Hv9Rk?=
 =?us-ascii?Q?t5rUccIvyCDK/ChkwbJsDEcTHCcY2qg5+uHIAR4yYKmATWq1/i4Mes9vu+sK?=
 =?us-ascii?Q?2r3SQHzN99q+ibPX9xJ+tj3ofqbZZNJVPOLNr9BgWHx1sdN31jRCj7ABYHvj?=
 =?us-ascii?Q?9V1TRa16j8ZufMbfUW5kPSWT9qS5g6E3ZCruCBJNyMpZMxmOOCFwXLuaYK2E?=
 =?us-ascii?Q?wOZzS1qiNFGEmLGE04O5ncA3sVy0rMGCUC7qphJ7roMyd3mZV4AQ3tmnS4JC?=
 =?us-ascii?Q?p6qdxjr8861SaH0EpNxYP1M=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96cc1d30-cc3f-4b88-a9dc-08dd652e4734
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 08:32:39.8350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IX74/rGZekvA1NM0Sd4I5de58FbuGP8V1+hXHQjbDkni+UNvJgnWzo/vpjPY1Bdq7yui1FULpfvZWVoJd+5p5u41KE3GRNmg+RhyuSt04XC5uTAat4tVbCBhBt9mq8zT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB15407

Dear All,

This patchset contains small fixes and improvements related to the rzv2h cpg
clock driver.

Thanks & Regards,
Tommaso

Tommaso Merciai (3):
  dt-bindings: clock: renesas: Fix description section
  clk: renesas: rzv2h: Improve rzv2h_ddiv_set_rate()
  clk: renesas: rzv2h: Simplify rzv2h_cpg_assert()/rzv2h_cpg_deassert()

 .../bindings/clock/renesas,rzv2h-cpg.yaml     |  2 +-
 drivers/clk/renesas/rzv2h-cpg.c               | 40 +++++++------------
 2 files changed, 15 insertions(+), 27 deletions(-)

-- 
2.43.0


