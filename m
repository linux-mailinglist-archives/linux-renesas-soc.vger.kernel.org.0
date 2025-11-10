Return-Path: <linux-renesas-soc+bounces-24399-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2128FC46843
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 13:14:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B89E34EA7EA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 12:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F5623148D3;
	Mon, 10 Nov 2025 12:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="mCc54UcV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010067.outbound.protection.outlook.com [52.101.228.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F640313E1A;
	Mon, 10 Nov 2025 12:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762776678; cv=fail; b=aQkLc1/wmsN2/uoxVOQjRh9+XUQrYD35lI93XNBltO9nKXPJ3FxQSsheWw3IyAc6uDDstyiiGlKCcIZScua1F7+UCDzriH1ZUnSIT1sQVQxnXsWsGan8oBCpOeWK3hAMOn4rojOARyfQemfPvA2ZEAnEihmjY94MgrJPGdjiMow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762776678; c=relaxed/simple;
	bh=XyUPSUcq1HMn37/GMJS1MdQxQ+djgcI+BfwMzbcwDCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h85GfU6bFlzxUsI9AF0Vic3bWgIT5nyCVZZAmDzJq2+MiTQKcLDqIX9tB3zwdntbzUa7pMBO9ri1WsqDT8fG2qUtFLLHlATBL8jjtusD2QL3+Rw88+GrLTjIe/4YGrfR+3hDJhr5JzRVd7IWVqzp9iV+Vm6fgYjqfy+bxckFWQs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=mCc54UcV; arc=fail smtp.client-ip=52.101.228.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G+QqDPsdKmk3VJnapElUgTHK1LxlI34p3DvqhhUxIzDLua/+nRY4gDJo7Gw+bK5bnmsFnpCO506M7cehjHkKlkBDZCN4/1PsN5i6xVzvdaRI//wQH2eVqM5O2YMkbbuTwGmujGzgFV8SC90ZIlX++FdRfEXN6IUgI0lN4lc7VLGg9Lq+kGPgTmxOCnYK35b0JA2rLL3CSfEueO96j2D5r6UHsYy1EF7pGNd0F1iQXFBN4SJTlOCsRYQzvyQKq3stlmdbnGk+GSAXyB31i0z1eMO+L5swvq8gI+Z1bLCo0GgPLcnZeCuQffKAad9qkBiwnx7syYiAbDkCTtDB3HX5rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSQedu4ypGWq2QJSkw5iLyZqGX5WADAKR8iYTCDn3ls=;
 b=Ev2ddkorxjZrPa1YxdlKWqKx+AwycvdTojwTMbGw4R79ca4nkjJFF2crDjaF0pTXouZ2hVBCzzftq57/NUfp9Z+o+LBjZm6PkANMfH9g4Tlp1jdFENPMK1XiDBoRDb1P3avyHGL1Q6ZtRuXWDL5sx1AggnOb2/sZr90m5Y/OZWxBWBTS1mQP7IUFFRRiiRKlSl/X1cNC26+oZ/Rm9y/zupCOLkFzlCXQrJmr6q+qe/f4PDZgVnTED92T2JZidenDvXX5R0TPaaUTyDssanie2msCCztuA+izoOvZNwZ4kFLmgX/og4rV9ipZobWatniCviM9baxo8XulR7ye1Y0khw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSQedu4ypGWq2QJSkw5iLyZqGX5WADAKR8iYTCDn3ls=;
 b=mCc54UcVw4rUgaxbQOohSdySZeaDjQtaS+W84tNIOXhpgVo8Ay6ixAmWh/iiCy4/h2bFeOgFfD1bWBfmZcYBKByoKzzInyJ2YXJvrUhleWvs2zHh4HYqt/zSS2Yth9Mb6FAw2rtCFYKQ4RLw+ksh0U12tL0lN2VwjwxfCtMVojM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB11558.jpnprd01.prod.outlook.com (2603:1096:400:37e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.14; Mon, 10 Nov
 2025 12:11:13 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9320.013; Mon, 10 Nov 2025
 12:11:13 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Rosin <peda@axentia.se>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 19/21] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable USB2 PHY0 VBUS support
Date: Mon, 10 Nov 2025 13:08:19 +0100
Message-ID: <e22bc437db98ed2065d40b471626f4daf45fd146.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MR2P264CA0176.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::15)
 To TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB11558:EE_
X-MS-Office365-Filtering-Correlation-Id: 23ffd8e5-6d02-4716-90ce-08de20523e06
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fdPOTAuocww3JMLzXHy8Luj4d5KUzo+FlukX/TtHJzR39XrWO1ozJXet9jZr?=
 =?us-ascii?Q?qW25anlEl4J0hzP/Rf9s95Vf4eytmfqCHWl12n71zZS2jqlvnq+DD97pigOa?=
 =?us-ascii?Q?JUl3dk58KkO//UiCrIvtN+g3p92sw3sJfgLH40HF3jaBraNPsF1ejwlum6Ph?=
 =?us-ascii?Q?/GeFSPDVe722bqk7TuYdCOzwGjPCQphdbMjKJCumKdP7f/3WKDPFV1ccCcI2?=
 =?us-ascii?Q?n/G9qE4xe+if5m3pdj71CwPVJ9A6lyGvmUG/lfqGuyvSaYiu4jYracJTJLja?=
 =?us-ascii?Q?1lulI0pz/cUc1eZzy6yt46htmypyVMIMwWu6nlw3EblQ73TI2e61vwmfAWps?=
 =?us-ascii?Q?7QIMStjb38/A0Mlbodly8ZCuyzcTS6wrMwniARL0576MhOuKSSai/a3Rrp0s?=
 =?us-ascii?Q?iDSL3NOPe+BnoVZxf4BUDuNC7YjQUIaUICTrD+24hBWsxNiaso68ACnMtFjI?=
 =?us-ascii?Q?totsG/aWV10x+FjIJ3yJOdU3YB4yl1Rczbx7QuuAtLcwEKFUqATIdduzgFWc?=
 =?us-ascii?Q?FF5Nj5gXVhTkFmN1OvHgb8BPQhoavXr8h/0dN3WKYqCU7qsAa2p1ROm3Mw9P?=
 =?us-ascii?Q?tCo8swL7VomaBy8ca12oLyABPm9oCzmNPrlYG0lrrH1awR3a23x2q8u26Em7?=
 =?us-ascii?Q?GeA5XKU0FIgNTpgSg8fJfdDlI+pkARo0Zb2SkqJVof9C1K3SkMmGfCmm7Vpe?=
 =?us-ascii?Q?M66ksJ0lW2u9e2mG5UchELzrWs+xe8VYU7prAmKOO5qvMdTYzpkX4SqYTkrg?=
 =?us-ascii?Q?K9yKJE3x9HiNW7zwVSDU93mreWxG/o/XqkRs4Ajxj7HGeBsSRHJaYlvgIs2r?=
 =?us-ascii?Q?HQ6C28PhbAwElCRpbvEckpYSgKAwdQJJYDzD888qdI9akrEvHQs8iuPsIdg9?=
 =?us-ascii?Q?i5wKDNR/qccQ3WqlI6xe0Dkqlov91L/LaQbPkiAmTWQ32vm5LXtK7OB5dfLp?=
 =?us-ascii?Q?8pOjXNjcZ8UnF7f0xynQBWjElbHnMyllpqYPFnuhrDrL24ZmvOKJ04ssI6Vf?=
 =?us-ascii?Q?2m871Th1awjgrys/2sdE6SEHfOHWzSJKksU5Oruyg6DYVQyLmMDLeUf4ypi9?=
 =?us-ascii?Q?mfhsTr7kTvUQxp4DcDr3oQKvIpuAzaWZuHcv1ys7WjnS4N6lzdm7SnuJhDTC?=
 =?us-ascii?Q?CppJKNoP+VIpnr3KGda7j7CV9uWcnSxS9JmxxkyH3XQ6fdJUvY9RwhPNyqIp?=
 =?us-ascii?Q?ZpNUtmo2AEwWcgDXK9inDiWJnUQdlyQxYqGUgx0esnsFb3zwirr8Tjnn1QkN?=
 =?us-ascii?Q?f7uU8NZaCOeEKBjiBJ+dv2aYo2wDnQvzO8nDOhc4zg4fls4YX72Iaj+Xv7Q+?=
 =?us-ascii?Q?zbT7nWN7aGwXu7Hwkm3iRYxOEljdgvtrSKZbv1ESbg+wXu4nhCZWuHjDAxf9?=
 =?us-ascii?Q?ZzSBg6J7vCOBuKuJCdm/2CwmNVQKefcDIG78/QvlulW1AOqQVKKYNGatpai/?=
 =?us-ascii?Q?nqaCUX0XNFQW+rhVMLxm+NP/2w8iRn9ZJVASZN5LBeCb+bhjRkJGosQbvfx6?=
 =?us-ascii?Q?oNFw+NIup/mvF0qZ0Ixy6fWFdR2Kyq8nJbE8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8YuYkkxV+hD/57+LT0p3TiPBk2MlP1WAwl05Ss/HE83dgr3KFwHPHeFI4uBQ?=
 =?us-ascii?Q?1DSNbWEdu6VlngzL1lmKE1o+uuMY0Ub+uUEjY+gSxAGSR6hqFJYmiKF9Rt68?=
 =?us-ascii?Q?ZK0Fn+HF5q4FXsjD2vri1nNN0eygSvU5fYj7KnqCaRHY9KxCAvcgRKjH7RHc?=
 =?us-ascii?Q?FYmss+jVxyJ3k8Dx9q2JmeK0ZO6Ai4MpDxT6DHnAuQZZSuDlEUWg7K1QqSM2?=
 =?us-ascii?Q?miXODeJ84a/mVccTJI08uv6Y4euld0PLY8sJeBSrQNh7zo/9qSddpSakCrAn?=
 =?us-ascii?Q?4CxeMbxKlL2PSFXRQ3mL8auSkcOKpRMdWHGIU8U37CHPaYPNdRYMyaxii1QZ?=
 =?us-ascii?Q?FAX9aig5KO9G4GgfGETZW0FIxESY7AMIM6u2prqycuA6vWdOUcPft4RklqLB?=
 =?us-ascii?Q?VuH82Gklkhd3U3Iwt9SUTTM8RkMSg9sWAb1nQISpNkwT5VWRwuzs345c877W?=
 =?us-ascii?Q?upu02FCzvLc+O4xiXSxJoZKxDpr0pVlOMOYP7j8siJH/fVpIKVvOIvE9EmsQ?=
 =?us-ascii?Q?ypGSw7iQ5wRUuKJZh3lLdvMHqRSTA4e/oLWW+mKSBeHk2vVp5weJFsrn5g7I?=
 =?us-ascii?Q?yBHJP+0/YBCIPO8xitzknaH88LwH+bpb5eJ87wx2FOVvaj6RhFSUZwGWKEOh?=
 =?us-ascii?Q?W5RE3mfUFssjmBI8vCx0z7SIl9/cDf3lVR8PaFW/0nZCK/2C/udA2tI4J/Vk?=
 =?us-ascii?Q?P6N/VOva2Rj+3Ov1gpxTvKZKtDuW5v4sWfisHhXznjObJ410ambrWjOc2VzX?=
 =?us-ascii?Q?pHCAGjhIKdiSpMvOkKx5FlwV/SKoMt0hvAFCtAgnmmAtbmG2iTbRGIII3b94?=
 =?us-ascii?Q?BdebymlLl9CRN6LX9KBsx1+EsJ5DwxzlrBLlMiIkFdlg+mVXvIy0gnPRztBb?=
 =?us-ascii?Q?dr97OJUFZGR/A0pztFdiumFMJaukfTMNjzGQQ9FbZn9oYaE0IW9KFyaKSaIJ?=
 =?us-ascii?Q?spKUgWPVg+ET9rkwdphOGV3D8cptlrfIszVxLk1hsNnpxbfkQUZ80Eoabqqi?=
 =?us-ascii?Q?XkyVkI1NcGhwC4h9ODBH2DveOaGiwzMQikmcwlVXfKgVHOakYZbn1ehVpzVR?=
 =?us-ascii?Q?QnrjmSJw9Hdtmv3ovnZ2O4tt2DcObieZNAMRAzQMhoS4viRZdisjULi6BDph?=
 =?us-ascii?Q?UFQL05iNc70Qye1H5yPQGd8u9WFfFEufOWSaAJR+xGPYQmAkywAfAbnxnhJg?=
 =?us-ascii?Q?qfdi9BzH13zxtrpEgG39YpqM4WLOhUPVpwDUr9iSx6tof9LEI4P6JE7cy/zV?=
 =?us-ascii?Q?FrJ+hxUiqr7HUXAB1UfR5WPHKH+u7nqzOa52AeELtmir6BHlqpOSqsRYTaZz?=
 =?us-ascii?Q?oT7jC0PGY9gJ0+pWyTV5CckpGnntIgSiq4gcj2/dsHajunZbX+c4BcDXTZaM?=
 =?us-ascii?Q?C2FgXCk4M67qeyrW0rYMs6cqWGBcL5aiHpqJW/QTUQOJHgBtxOelGhs20hH2?=
 =?us-ascii?Q?qxYfebEtGFEgPTXBhf4rOGUKhEV3H4dl/cqBDafWzUDhau/Fe34gb5xwNXUn?=
 =?us-ascii?Q?5dCjBijTxD9M8UVPeU/ouCv47Lqjbn9G3kryOgduSEdaYRA0FFOxiH/uHa0I?=
 =?us-ascii?Q?ORIgZBDpjSFwQRe8xZgnQBrZbQaIn+D+N6db0YGpmtWQRPqtRsIiMUGnO/Ol?=
 =?us-ascii?Q?JqnO/fQnQSwdr9CWpx2JP5Q=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23ffd8e5-6d02-4716-90ce-08de20523e06
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 12:11:13.7170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z7mkUFnHC+GmoDzZRn7YdcIWULPT4hwtay7cxDT9mawyL1gu4Zfy6C+tQI2XnoeGlmC82UKN7a2vYrZtLSVTLkpGtVZaUkRraS80rRnohr5lJP56G8u/BjMRYi9dAMEl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11558

Enable the vbus-supply and status properties for USB2 PHY0 and its
VBUS OTG regulator in the r9a09g057h44-rzv2h-evk device tree.

Enabling them ensures proper VBUS handling and reliable USB OTG
operation on the channel.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v2->v3:
 - No changes

v1->v2:
 - No changes

 arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index 5c06bce3d5b4..69ca9f0381f3 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -423,6 +423,11 @@ &usb2_phy0 {
 	pinctrl-0 = <&usb20_pins>;
 	pinctrl-names = "default";
 
+	vbus-supply = <&usb2_phy0_vbus_otg>;
+	status = "okay";
+};
+
+&usb2_phy0_vbus_otg {
 	status = "okay";
 };
 
-- 
2.43.0


