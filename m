Return-Path: <linux-renesas-soc+bounces-26283-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00215CF30DD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 05 Jan 2026 11:51:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2931C3017228
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Jan 2026 10:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E69E23161A4;
	Mon,  5 Jan 2026 10:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="PHa5wqxX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011047.outbound.protection.outlook.com [40.107.74.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41066314A82;
	Mon,  5 Jan 2026 10:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767610249; cv=fail; b=LmyVmthUrIV6gEtICeLXdKHmWqSZCv8qI7cObRi3s9QG/CsPCBcIcdXAslNmE8GRzOK9O/dIf8bJGm83LAQ76Krpd9rF1U5k/7JMsquQ8R5itjquV2OAV4EvFtNqqwsc2XnFPfyMPpU6b1QuSGiSUeoL+NuqUtTO+oG7IjYCSv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767610249; c=relaxed/simple;
	bh=c2CWdGDQ08oRVzoGrR0fN6/ZjAeHy4gTweSaUfjHH9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Du0zOqMi3pxCwqLo3FQdb4gQsxyh6Fc0yYmWX5me5PuDVgNmTry9Ps5TirAojQ55iFm2zjGvBtSVvla9KFf+R1Yt6rbdZrE7SkJk4LT0gvUQsQrcAyCMWJBXNHpCtVgjxJlU/RkVUyh1CX2N4aAoTaIijluX0/SJRBs873Fll34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=PHa5wqxX; arc=fail smtp.client-ip=40.107.74.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jjp+x7U6P8aNyk0JhKHDwyRV/v3z23aFwMNlOAygYFwHBqxyzghxSleSgSEZ605/wx65kU6gXkZcpwcG5NiWfJ3nccdTbpkSgPU96SK7phPc9/NY4UkDEsDD0Tg7lg3XXaXjm3r4GpeSBWFXBcTaU22qh2HKSnBWA++rm3ayFORJdsKT6W5t9MF+WcfE4AlWK+u28ZUwW8lzhu/lFjGidgwJC3hzXRXlJiIhFjz1RbW30dl2bPCegj7BBLliq0GHXAqHJ/pWWaDsjXoBy+K8DY/zAgr6jiTiIG6F2o5vDBi1AmkWgmTKs8e253T5RqaGNAJKIU07hwvjU55vsV2YKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=atTjqG28lutdNciGlmOUNZSQAT/lZT0uzCHr2CMvSAQ=;
 b=GAs3iBdCt5ZcCnbdr7/EiBBQvTkoPf484An7IFhwc1jwL0Bewkcnsubaf5onWsQv2AOPuPL4Ai9FXLtXg4tTM9qBFQRiXEliPbCDxnNZMWvFUvS9oFXx+3GlebumXgLAN8IMkp7sm35sHcd76rz3tgmRsd3tqkHsXeP+65UuTvdSntYXSchDJNYFjwDfsW5jrkjOwoL15YTAuqFy6u2WxqfEASEfkUrHp8w2ahPLDjXf6/AxunBjoxAzn+2S2+UXMO0avqCNnbMVClabG421pMAnkafrObuEtaVViaulB7V7OKD8Fu9yPL7eD8y3V/WSO2FtoWz+zfbUJsWlGCLU3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=atTjqG28lutdNciGlmOUNZSQAT/lZT0uzCHr2CMvSAQ=;
 b=PHa5wqxXYO3mxBZJfc+378jcu12t/y85GXNGMXfIUjiLjJiy34V5bEPlH5TQA0RidZKS2kBvxkQMDUrCUgBzxj2G2S4OYC3TglHxgY47drFWUYoJW9qpa3+VkGMekCWvsqNuu8qnrnQH8S6iyJ7YRfrrTZuLmoKd7OtfIUHk2Oc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY4PR01MB15540.jpnprd01.prod.outlook.com (2603:1096:405:274::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.1; Mon, 5 Jan
 2026 10:50:45 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9499.001; Mon, 5 Jan 2026
 10:50:45 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/4] i3c: renesas: Add suspend/resume support
Date: Mon,  5 Jan 2026 11:50:02 +0100
Message-ID: <e7d14d84bea4503d2e0b8163d864e29b710b404f.1767608450.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767608450.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1767608450.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::15) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY4PR01MB15540:EE_
X-MS-Office365-Filtering-Correlation-Id: 24fbf979-1567-4fd8-145d-08de4c484739
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LArtwwB4pzAxBngUqHWbJnBNmgbqMLf5ruMv6VB/AKJN83hrv0TgaV5vFbqs?=
 =?us-ascii?Q?v+pMzO6ndxHHfsfIPnHc7OecTqamka7kOqYrFg71/5vUTJhyE8x7lo7YvKhS?=
 =?us-ascii?Q?vxxKCIAIimQ3Pi3OW3wGZt7RGjiXwqAXy358+Dq1e50hdqUPfGQcLcjKYdJv?=
 =?us-ascii?Q?2L+8VRj7bLv46l4lrYs21qASrmYWw3OSLszwkrcaLg8y5zWPcZ53uN1P8Rhp?=
 =?us-ascii?Q?nH+tGgtyVZMCFXMgOsnDcM2Vp/yXvlWKKCRB6VHYIbA70/6iJwIRpAZNK+Wg?=
 =?us-ascii?Q?BCTqjG4Fd79b+TsHplgfEIba0rPYCD7Q78hsbx6jUxlqHt5uxIg9P2EKz7/1?=
 =?us-ascii?Q?3ae62RIkNPNFaawgCXMCcO5XYAlU4VgeF+KJ/cJkonc6L0XW0gSnPiyBzL1N?=
 =?us-ascii?Q?8xwmVSXoDTWYQHgh3x7dMs13mYwS1LnFeisgr8VDKgOWDk09OlX/oQWwvA0f?=
 =?us-ascii?Q?WeU3xBkS+zOG2JsryL/sBtO9Rz+irhS8lLMGs6hIxR28AvRoYb735ySTM+Uc?=
 =?us-ascii?Q?fmj1tA4L0iWalpvgDOTbV5j0nEQooChXD9f905tVS+HlgB1g4HV76xA4Jd9t?=
 =?us-ascii?Q?jTNcb7PWTLp3ZfsX605SiPi8wg2xZBYDJTvVLHyxQIBKgaw5sPesmpWo7ucN?=
 =?us-ascii?Q?jWkp5hoBsSKB4fD0ZDM9hWeoLKmnCZapKqEOcHqVgKZNjWjzOzwhPkwOs2L3?=
 =?us-ascii?Q?brsqP6PFQHp9xYknAAJzhRKTRVRV8ZS9SJlyDoWb9SynymBjlesTTAi+EQE7?=
 =?us-ascii?Q?Ee/LUWjVSO3GQZqXsYQg+Ybrawm9jIERsIYrZkgdaoh8iUr6HqfTk+bCn2nm?=
 =?us-ascii?Q?3SMKKra8gip0KAZ7rcMAWy6qT0D/G9i53eLvgC16aIiinZCOY+E7rdkXh2z1?=
 =?us-ascii?Q?sLhE4pT6d8qWS7MdNbyuurS/Q/4tJ2TLqpMp9qMqcPkRmXPzGr6E9lgauG6P?=
 =?us-ascii?Q?0wejRVDPz1y/SqVcFC0csJ9LHbjOjVbYqAInjlPHHRAQy9NVMud/GrnplUzU?=
 =?us-ascii?Q?jK5uJUPsHJRNBQUR/KKyGZKazvDV2PSQ8k9LZAsjfSs0Lcqbja8mBEFjIC/K?=
 =?us-ascii?Q?dvVU0zv4v5c2N8AXsAq0BrnVEOQsH9wVznHGi3VO8gbCtkKMF+2E2+LKYpwf?=
 =?us-ascii?Q?tQ20+lBGzVmRsR2xFJER8eAoJh2ms6Vw8vUYgo9gORWjwz/IOoBnWVMCMQkc?=
 =?us-ascii?Q?KSITSAJwwJ8qRoaWkuKCYmbgE66n8Q2ViuMy55DeyFkFqpBhzlWgDupj3xUJ?=
 =?us-ascii?Q?kAr+xY0SZk8SXn2ldYqJE3I1SFxdcljf8eatyty4XRDJr529+TdkNz84aizQ?=
 =?us-ascii?Q?YzJNtJJTBgAQyOsbN7AIOFgfkJiqn3c4bvkEcuReqjiY+NvNgTxjw2zrrv09?=
 =?us-ascii?Q?1TrDPq0AfMVb0HXLk86mMWuNnjqJEvz1yUd75HKmPX9IxyYOke9sHpJe9LZY?=
 =?us-ascii?Q?L5Pc/bjI90aj0JLWgaoqQdZZa4XnvstpVQZbdyGaJQvpkVLzDprQMuadxIOY?=
 =?us-ascii?Q?DBk+8c1IVf+cCuN5HXOIFO/617xwTGV5oWOQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I+NcL8KC/+gRNCwcM+XU0erc7gq+wkxG9YK7o7rwY59vrw4uZLCNCFrmOFJE?=
 =?us-ascii?Q?TB2u0YzFaWQT3LlohpzsYBHo4hPJAVNw3wKn3D7otofzyj2/YUfRihZiKoBP?=
 =?us-ascii?Q?4HR8aaXg4rdU2y2tcEjt88Y26GBLlyq/LWG3JX2NmtaLz8AAudVfqcFecDQz?=
 =?us-ascii?Q?41KWtVr6iFs/GsmfgoH6Uj49bYasgutBY9TDAcvpL8IATyhLQPPsrktM0qE+?=
 =?us-ascii?Q?h0HysSHAVHjS7COL7GsE24Vu6MpCiNIUyLTuhG6UTNInHgp+Bimq/snoWlW4?=
 =?us-ascii?Q?Y+c68M2LozgXBbowj+rLMqv0MSG4cMgpn0H4k3c4ZbXrN13SIP7NJxnXUhbH?=
 =?us-ascii?Q?b1mki6JmWD6Mhb6GfQyFUlaM0C37GWsuIzZRiUeg3NdjjT3lxSdhf1XnDIZa?=
 =?us-ascii?Q?mklqBZVhWJJqxrbxSe1RKrSOnt1VzcmDcNLAm9E9Nc+pe+DoRxW/2wxNfwIb?=
 =?us-ascii?Q?KoYUX+xHnQGHFy1NqXuunJx0AAjlm3YV7Vap2utTEYmi1l7cl3XZjcFs9y+4?=
 =?us-ascii?Q?QVFZ0XQBR9p1Z581BsNf9FUQZPPPOZRVkaVug4jztgWOISPLfG7vmwsyDp15?=
 =?us-ascii?Q?zjZD+FwKJMHqFdA+rjq9l9nosiCUgK8z5Y1IQzNdDoVu70pf2xj+cFUM5agp?=
 =?us-ascii?Q?KJXLlcaPTo9oB452w1knCvzuPbk31r1+mhhwHP5Bp33dEx5WFnNb5Yiy+Ebl?=
 =?us-ascii?Q?DdNBiAMjkm2+046vfGFy65ieYyAAEAGFKS4AUCOjHszLlt+CJDaJBP3AxQJ6?=
 =?us-ascii?Q?jCgdIyLu3eTlDinu0K7c3c57zI3GHFlbxtSZRRVHqCCY9WxLQlJkmNhd1wRb?=
 =?us-ascii?Q?sWEJk4+ou5XwlAGM3DAGuAao/mRkB7BXlf4q4lBugUgazlUd5+YtocA0dafB?=
 =?us-ascii?Q?VhGHQ/uqnF9ZVvb8m38aam3Wkky4QftZ0uPP6mZhlyUyAE1FzZk9AJVsYR+N?=
 =?us-ascii?Q?KsQ1xHA1UYY7PN1a1uF8FahyvyIvzpgJGWGYa7DgV470jXB32eNnauAakRdr?=
 =?us-ascii?Q?xAgg9zxpU6ZOLr+pXQ7csO5JSCJCh61F0MPVaK1pRbN4ffQuUohu7O7vSCZt?=
 =?us-ascii?Q?L9bf1SrxF5iNi/k59jfI8xlMoOoBQtASrPjzL7gEbrvSKn4ns7zYkoYQ5qr4?=
 =?us-ascii?Q?9dJ5k38rtL5Z6DzcFVvxIyxyJXh0dE1BXlolEPeEubGo1pkZSoXCvNC3eoSG?=
 =?us-ascii?Q?P/xWIE0FjVfpbvbgHoM8N8mZQC8cCSAfJmTQ0/mTB0HbYwlGNmuMd28W3RFR?=
 =?us-ascii?Q?p2AsQyynB2sb7DfpX2yPYyrdGJHUZ7Ba2y2NaHCt/Efj5iXUG58P6VnIylX4?=
 =?us-ascii?Q?TpIfsrGwXGZanzxDo0UwwB4bIL3AjnYFlCNanhh2WeB9TXJqIyDpywfPNUGI?=
 =?us-ascii?Q?AH8yK68iWqUNQDZC8zqGDS0J25bO5bcFj2FmE5zs4bL65ehLrLBiGQjvH6nO?=
 =?us-ascii?Q?FwRnUwt5+bovnreftfGGwzi/CrRt6CMFzJ9dqeJO6pF5ABRlat4pnno23PBF?=
 =?us-ascii?Q?7PNnNnLeqzcdCAtP8ZTmkQZGLcZE4G/2X1tFY7wXElSp/SULUF1++O6ZeeiB?=
 =?us-ascii?Q?+HnzJ4H6Z08Y/4nucp97noKnxOs4zkJNK59wi5swXOvfp551HLU9GRaka07j?=
 =?us-ascii?Q?fnbl29hDNnW0Z6cfURSUTXUhAFPIubliMHDW7W8tEazER0V74MGfBSzJkTR5?=
 =?us-ascii?Q?kcScV5w+7GINJ0EOWVYcZDwJeY6yY5mAL1zor3VTWZJPqVqu1Z8GXenWwxZH?=
 =?us-ascii?Q?nVLVqZYEvmr372RM8Y/IIF6kDVfq3itiRk3HbWcxr+mmmYlH6f2P?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24fbf979-1567-4fd8-145d-08de4c484739
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 10:50:45.3119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +00fHLrGbhbvd13t1rVee0oJaFgXQz8OWDBb8h7ZD8iQlG8PpfJVwInKH2IHCtHZNieMk0UwPxuReF1UihM63RHaGBhBR9Aes6xzFSPTgHmy5AiZDq2Oz22mpPm0CgJy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15540

The Renesas I3C controller does not retain its register state across system
suspend, requiring the driver to explicitly save and restore hardware
configuration.

Add suspend and resume NOIRQ callbacks to handle system sleep transitions.

During suspend, save the Device Address Table (DAT) entries, assert reset
lines, and disable all related clocks to allow the controller to enter a
low-power state.

On resume, re-enable clocks and reset lines in the proper order. Restore
the REFCKCTL register, master dynamic address, and all DAT entries, then
reinitialize the controller.

Store the REFCLK divider value, and the master dynamic address to restore
timing and addressing configuration after resume.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v3->v4:
 - Use clk_bulk_disable/enable() into renesas_i3c_suspend/resume_noirq()
   instead of clk_bulk_prepare_enable()/clk_bulk_disable_unprepare()

v2->v3:
 - Fixed error path into renesas_i3c_resume_noirq() and
   renesas_i3c_suspend_noirq() function.
 - Moved up one line sizeof(u32) * i3c->maxdevs into devm_kzalloc() call.

v1->v2:
 - Updated commit as v1 has been split into smaller patches.
 - Use clock bulk API into renesas_i3c_suspend_noirq() and
   renesas_i3c_resume_noirq().

 drivers/i3c/master/renesas-i3c.c | 89 ++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index b065b8d4b138..4123593fc16b 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -256,16 +256,19 @@ struct renesas_i3c {
 	enum i3c_internal_state internal_state;
 	u16 maxdevs;
 	u32 free_pos;
+	u32 dyn_addr;
 	u32 i2c_STDBR;
 	u32 i3c_STDBR;
 	unsigned long rate;
 	u8 addrs[RENESAS_I3C_MAX_DEVS];
 	struct renesas_i3c_xferqueue xferqueue;
 	void __iomem *regs;
+	u32 *DATBASn;
 	struct clk_bulk_data *clks;
 	u8 num_clks;
 	struct reset_control *presetn;
 	struct reset_control *tresetn;
+	u8 refclk_div;
 };
 
 struct renesas_i3c_i2c_dev_data {
@@ -609,6 +612,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 					   EXTBR_EBRHP(pp_high_ticks));
 
 	renesas_writel(i3c->regs, REFCKCTL, REFCKCTL_IREFCKS(cks));
+	i3c->refclk_div = cks;
 
 	/* I3C hw init*/
 	renesas_i3c_hw_init(i3c);
@@ -617,6 +621,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 	if (ret < 0)
 		return ret;
 
+	i3c->dyn_addr = ret;
 	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYAD(ret) | MSDVAD_MDYADV);
 
 	memset(&info, 0, sizeof(info));
@@ -1362,6 +1367,12 @@ static int renesas_i3c_probe(struct platform_device *pdev)
 	i3c->maxdevs = RENESAS_I3C_MAX_DEVS;
 	i3c->free_pos = GENMASK(i3c->maxdevs - 1, 0);
 
+	/* Allocate dynamic Device Address Table backup. */
+	i3c->DATBASn = devm_kzalloc(&pdev->dev, sizeof(u32) * i3c->maxdevs,
+				    GFP_KERNEL);
+	if (!i3c->DATBASn)
+		return -ENOMEM;
+
 	return i3c_master_register(&i3c->base, &pdev->dev, &renesas_i3c_ops, false);
 }
 
@@ -1372,6 +1383,83 @@ static void renesas_i3c_remove(struct platform_device *pdev)
 	i3c_master_unregister(&i3c->base);
 }
 
+static int renesas_i3c_suspend_noirq(struct device *dev)
+{
+	struct renesas_i3c *i3c = dev_get_drvdata(dev);
+	int i, ret;
+
+	i2c_mark_adapter_suspended(&i3c->base.i2c);
+
+	/* Store Device Address Table values. */
+	for (i = 0; i < i3c->maxdevs; i++)
+		i3c->DATBASn[i] = renesas_readl(i3c->regs, DATBAS(i));
+
+	ret = reset_control_assert(i3c->presetn);
+	if (ret)
+		goto err_mark_resumed;
+
+	ret = reset_control_assert(i3c->tresetn);
+	if (ret)
+		goto err_presetn;
+
+	clk_bulk_disable(i3c->num_clks, i3c->clks);
+
+	return 0;
+
+err_presetn:
+	reset_control_deassert(i3c->presetn);
+err_mark_resumed:
+	i2c_mark_adapter_resumed(&i3c->base.i2c);
+
+	return ret;
+}
+
+static int renesas_i3c_resume_noirq(struct device *dev)
+{
+	struct renesas_i3c *i3c = dev_get_drvdata(dev);
+	int i, ret;
+
+	ret = reset_control_deassert(i3c->presetn);
+	if (ret)
+		return ret;
+
+	ret = reset_control_deassert(i3c->tresetn);
+	if (ret)
+		goto err_presetn;
+
+	ret = clk_bulk_enable(i3c->num_clks, i3c->clks);
+	if (ret)
+		goto err_tresetn;
+
+	/* Re-store I3C registers value. */
+	renesas_writel(i3c->regs, REFCKCTL,
+		       REFCKCTL_IREFCKS(i3c->refclk_div));
+	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYADV |
+		       MSDVAD_MDYAD(i3c->dyn_addr));
+
+	/* Restore Device Address Table values. */
+	for (i = 0; i < i3c->maxdevs; i++)
+		renesas_writel(i3c->regs, DATBAS(i), i3c->DATBASn[i]);
+
+	/* I3C hw init. */
+	renesas_i3c_hw_init(i3c);
+
+	i2c_mark_adapter_resumed(&i3c->base.i2c);
+
+	return 0;
+
+err_tresetn:
+	reset_control_assert(i3c->tresetn);
+err_presetn:
+	reset_control_assert(i3c->presetn);
+	return ret;
+}
+
+static const struct dev_pm_ops renesas_i3c_pm_ops = {
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(renesas_i3c_suspend_noirq,
+				  renesas_i3c_resume_noirq)
+};
+
 static const struct of_device_id renesas_i3c_of_ids[] = {
 	{ .compatible = "renesas,r9a08g045-i3c" },
 	{ .compatible = "renesas,r9a09g047-i3c" },
@@ -1385,6 +1473,7 @@ static struct platform_driver renesas_i3c = {
 	.driver = {
 		.name = "renesas-i3c",
 		.of_match_table = renesas_i3c_of_ids,
+		.pm = pm_sleep_ptr(&renesas_i3c_pm_ops),
 	},
 };
 module_platform_driver(renesas_i3c);
-- 
2.43.0


