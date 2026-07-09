Return-Path: <linux-renesas-soc+bounces-34918-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RxSuJ6IIT2q5ZQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34918-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 04:34:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 335EB72BFBA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 04:34:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vivo.com header.s=selector2 header.b="Qwb7v9/N";
	dmarc=pass (policy=quarantine) header.from=vivo.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34918-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34918-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C5B7E3022CFB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2026 02:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C13C3803F3;
	Thu,  9 Jul 2026 02:32:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012017.outbound.protection.outlook.com [40.107.75.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DA437F755;
	Thu,  9 Jul 2026 02:32:18 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783564340; cv=fail; b=PZomwtkTmophu7SuqF3XWmoR2JMHUPLC6tA521Eozkhb9acUotL3HZPEYKa5qnmC6w+87PZdyy5grFH41iaXISTY7PbLAQYq2Pq2pYEMXpFfisfu02Ndb2BdNU09lzrg3bOyfugCmcd11Xm9AwJK8B4tYivMnBQW4u6fb2RyMoY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783564340; c=relaxed/simple;
	bh=3qXZm8/6xb5r3tITu/1e2L/8SvLtqmzkcOjtOLhKKZ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XiDHTWJPxVQHq4j2QzBN1tPZr6dLj9aA31Zq5PN+Mq/636ZLO456MPwvD+iXHoN7jOcjH+LAEO7vr0c4sXSYVLXUpM0C5GUeVoHbTvQROnQJw8vlOY3hREXxQ4yQj9t9j65XOcNrGC1Ssir6yv72OzOfWEV/xqB0FUXCa3ezohY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=Qwb7v9/N; arc=fail smtp.client-ip=40.107.75.17
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sMXk9qYpg6iipzbsy9/oa3hME03ZlBd6Qo8XmIPM0oTzF0Xk2DybeRMG15sDB11eyM5qVjJ2FNt4FdG1BBS+jA8sSr3KwuU/htUCLzk0iMACHQGtqVwtDdJvtNteT4FYCdvZp+/f9+L0++6jumzNqDuwlsHpobaK0ZhPBw0jzlLOrDH7d7wCZPqElJY0MkGsnhfx4jwGqXvwON28IjyVsMVO8d0cleDEdObe9XGgoIGp4HbSyFkaCFxTsl6cnb13++udZhSVRY0H2XQqTOC5DfKOVTBADrTWF08ZXRRaOrhi+h1ggudLJyfrgVPzurbiURDW+92jCEDvd4byjJT2DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w0toJDCon7fx1oHz/f7uIfHD0MhgkGENIzCXb56rXic=;
 b=m+uHOgakOMwSLW2QNhd0N74lbtLpcFvnZTEs2nezPFmeTxnIstBD8Sqsy4Pi54cZ7JhL8OhBR/z0ATZCV6xdp5IopMhvmtzv3grJ/HgEIrXsUr3/QtX7j3OTv7IUNIGc0B53IMOOgO8cXn304JwvUbVMBWgae90ddpm1JXEbWxM4Ei0V/iCg5GtYkv8F6BP58X5hD8DZVKLsTWuhyYpR/j7Z4Rv/gydvxmy1C6c0sfh3CMkBzeUW3E9zcIojgJr02ZwhTMcQFSgcXu+dutnKfKdRqZXFmDg/4cx+SI1Zapp00C6B/1GrVtITgKnlb1Iy8a7jzbKcHfE+FxSuu5oBsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0toJDCon7fx1oHz/f7uIfHD0MhgkGENIzCXb56rXic=;
 b=Qwb7v9/Nwh/9mvfJw3yHg3p6Ml5OqY+IfTJramNZRzL9daIk8bgC9SCuJzDT26rgnQObU72nc2LuG1+XCmFTJBbVInmbNzKeuome5eJtebfWIV+jc5R3wl/0GWjtnvJTICJhTXvRnthS0vqNQY5QB/Gepr4WCyLU1GgvNYcAsoQxl5UU1UPIRRYiUss63vSG1MUGxzJ6Hwv1cb0dQUBAiQLoqeJIUkxWRdqpLTQWK7ZCg+tY257dNOFeFr+g3Om02j34A2m7OCrfL0MX+HYasuBHJUnDP6cDWaBYcJnoYFTZHMxP5HVPB6Q1CFi3nQ82+Ki7oWKNau50mgD2WUb17Q==
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SEYPR06MB6278.apcprd06.prod.outlook.com (2603:1096:101:143::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 02:32:15 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 02:32:15 +0000
From: Pan Chuang <panchuang@vivo.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	John Madieu <john.madieu.xa@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org (open list:RENESAS R-CAR THERMAL DRIVERS),
	linux-pm@vger.kernel.org (open list:THERMAL),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 14/18] thermal/drivers/renesas: Remove redundant dev_err()
Date: Thu,  9 Jul 2026 10:30:17 +0800
Message-Id: <20260709023048.599150-15-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260709023048.599150-1-panchuang@vivo.com>
References: <20260709023048.599150-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0019.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::14) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SEYPR06MB6278:EE_
X-MS-Office365-Filtering-Correlation-Id: 659ae8c6-87cf-49a5-5934-08dedd6249e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|23010399003|7416014|1800799024|366016|18002099003|22082099003|11063799006|56012099006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	obNb6pz4uj93b/+7Bc7KyA4S5OtBA0p+L/TDctaOS++8P/M/lcr8M7EFD5xDrFZY00j6Hmkj8aMGTyguBs+MTB3yLEjBG407VgEHTMETqiifFIqpbkZIbYDjd43qrIMKG11qIU+KUpREJ2hWlMt/fPYzem3BtFL5YXGlfedCJerC+jZeqXrSQbbGdwYhZwvpW+NRMEBleE9ZDTbbZ60wwK1ip4JTNToAKvbaYweUK4xuMvqsAAZOCO0e0Qfe91aYycaJZgAoCcCTKI0YVsiYtjZyzwPQjfQWzdEqpLKt1Y2f/ab4B6yyj7EbkSJT8AlCGLzP3MIY1xEFHHfNF57pIaNh2rNchTyay0K/0aEPdtW2IOvXvaOlxW5o/cc3XKbIi+IsllNkorMrsHq/Qa/OKvAKHp1LAQsLKY3hTPASPISMrVQBhYxYeSiexwiiUGS36YqsS3czarMc6rsJrE/cO9jJe2mqzlrGMovGCY4lgGaXkI+Ohil8q7mkeXtQXwgQGBMxEiPxaxFiIkvmNUzeM4ZJsCcOV6oUj4zuuGaCc6+cI9oRz2rrRolQ2E31zIvdriPjp6pXdVNRxSvgcJGvyv/SdXNbt04vZ+EcFDJhF2dXBpOUtWsMRgIr2rIcedk3RK8Q85pc2aWNuuw0eMmVNppcSbzRNJdzj6Y0g54CRYnJfoSUVihhnMFmODWvB879D1Gm8uZnHanoP0MI6UesfKu/W/QErybu6xyh1t23tR4sSVU6kahRXPgAjwqsTemh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(7416014)(1800799024)(366016)(18002099003)(22082099003)(11063799006)(56012099006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O724uvWBEWaiD9fCZ3Ub230ADNTGaEI7bObTW12c0RRI6JLWcebdVDjIcdRT?=
 =?us-ascii?Q?75bBmd9iEcpDi85wXiE0/UQYhKCz9ltjqEO84hRB/U5vQJkSBEILlw5cmDvc?=
 =?us-ascii?Q?H9+ALVgB0AfTbuipvzq/RsmW5scbM6ZExqnuaDlwF7JiGbNkNiaslpEY6N4f?=
 =?us-ascii?Q?ThCC8DMe0e+FamphJtTpbenSafZaKE44SW/sp/4q3tB+++pXl3HvC7od9ceD?=
 =?us-ascii?Q?t9S5rDO0ysod0qe2KjJb6iRY+5TIHi0uapP4xWdrLjmcAGF0PKvzt5D8sS/Z?=
 =?us-ascii?Q?jvuQSyfIqwMxdgzbHmQOVGppjOkS2ffG5kmKoj+0JESyX9hKF6WGR79/8Ylc?=
 =?us-ascii?Q?OOkvt+YSGpsQMOwVht6kMbJioBX7VcizpyKB7luOrmEjJRC8ve0IgTMXd8jF?=
 =?us-ascii?Q?+4hce7do6OQ8DV8XFMOVd7QB9k6TbjXQHm4bRTxBLJ+8VntBwPXNPUhEaoS2?=
 =?us-ascii?Q?/18gb5OF5o5/YSmSOmWXeObeIXo+QPB300OP/msjDttgfIe0mUM4PdOxovpo?=
 =?us-ascii?Q?eQX47RUExGahkW9aE2I/sXp3APSXRo9p/GMh5PBsa96SACnEv5PMIqiAn026?=
 =?us-ascii?Q?oolVL/7fO0mmBkQWwLRhiRZ+uf4+4oj6XDIJJZaDzNBog90FvqF0u5odWKRn?=
 =?us-ascii?Q?wcaEMbtoVx7ApjhnVUNkIXTRvxLkO2xDbPCURJHDGEqXCXAN6Ijzrj74brCP?=
 =?us-ascii?Q?WiFgaW/FHk2aQZdKOeNOiBsc+O4/Vkdv3qMP4UoEckGEWqher504vxms7cj5?=
 =?us-ascii?Q?9YjL4PlSqNeXKDCNUCiwojkjGPzKdr4l//8133U2PlwIReJEDQQmupcnknAG?=
 =?us-ascii?Q?jLWD88qDED5N6ndsLYVIQDTwD4WF38noTPkwIfNquQmQ+pH6WDd/oIUOZXhT?=
 =?us-ascii?Q?8wPG+7XHgQDZcMwtndpcNeEekxe6KBO4MVtqXmolCxsRiRtnWic4OFXkFaKV?=
 =?us-ascii?Q?bbpRRf1XOYRFpv1BRh5+X4pvb2BWa0K1xNRQ6WR37xo3vVcvBtV1bTmytb7b?=
 =?us-ascii?Q?oC+oQn2xhiZSx/sK/wknwHxXaJ8M5dhD5/sM7zb/RamfbYh75PkWgjwkpUhw?=
 =?us-ascii?Q?6ZB/Z4qcXj7w+2jrD7JnmkFK00zLunqC6wWS0sD6WcmjtF+NWFmhb/vFY6NU?=
 =?us-ascii?Q?Ue4ZET0IeSg86FDBx3A8wJt6DpZk2THdELPFkdXdM1WyjDS4BNnRpPSgF5eG?=
 =?us-ascii?Q?GRrTAq3J57DArMuBoYW/dgYRwsd6f4Rk1fOAI+dupWcFlJYaW9Gs7BixfhU9?=
 =?us-ascii?Q?FezhRgwSFGI/QSQt3XPJ/uF266lwuLCjM2FkiHnEpOP52Qiyo9OsrJ/aU/9D?=
 =?us-ascii?Q?6K0ZRw4zyvc3V8KYcLCJuHoPWrmDuRhxz5Lv+U1bG16e1/cvHCtLPy0r67T7?=
 =?us-ascii?Q?uvojmolI86AB17E9LL3NTTHxK8M3Ll0ZOnlsTQRNxW1Pyp/jA6w/vgQccOA5?=
 =?us-ascii?Q?Yma8EwARhrDCfmdxYQ/Pv3iRw65VsGu4ZdS6cB4+4DEJvxU4tBzJ6JcXTwWk?=
 =?us-ascii?Q?fOH9Tpx7zk+HZVuNDZg9vCXJuTAuur7naPL9t+J20czz8J1s5+sYWU4oOgNG?=
 =?us-ascii?Q?DkxbQPONUpFCDa0O0TvsQf6PWDOoc34xYrxD3x6yFzSVbsFVORGFdHdow64o?=
 =?us-ascii?Q?cx1HSRZAncTvGaXYAlBh7qAiQ08SNjljPSoK/3z1arqLjejV57esLvhiYpMD?=
 =?us-ascii?Q?nUHFAeeLE9YqpRS3uBO8182Dm+RvQrOpPhk9ukdMpkOPgwbAd21/EE8VHZE+?=
 =?us-ascii?Q?GEj0UtMpwA=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 659ae8c6-87cf-49a5-5934-08dedd6249e2
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 02:32:15.1060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MUn3uWjSJLbhJ6hZ6Nxgcn8kMY5SC+GNsw1CDLt2t6alhfyJujbb7iR7BB7gYh3TaBZVKBGK0CpTO1KLzA0Lqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6278
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vivo.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[vivo.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34918-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[ragnatech.se,kernel.org,intel.com,arm.com,glider.be,gmail.com,bp.renesas.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund@ragnatech.se,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:john.madieu.xa@bp.renesas.com,m:linux-renesas-soc@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:panchuang@vivo.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[panchuang@vivo.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[vivo.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[panchuang@vivo.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,vivo.com:from_mime,vivo.com:email,vivo.com:mid,vivo.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 335EB72BFBA

The devm_request_threaded_irq() now automatically logs detailed error
messages on failure. This eliminates the need for driver-specific
dev_err() calls that previously printed generic messages.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/thermal/renesas/rcar_thermal.c  | 4 +---
 drivers/thermal/renesas/rzg3e_thermal.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/thermal/renesas/rcar_thermal.c b/drivers/thermal/renesas/rcar_thermal.c
index 6e5dcac5d47a..cf80e2655416 100644
--- a/drivers/thermal/renesas/rcar_thermal.c
+++ b/drivers/thermal/renesas/rcar_thermal.c
@@ -446,10 +446,8 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 
 		ret = devm_request_irq(dev, irq, rcar_thermal_irq,
 				       IRQF_SHARED, dev_name(dev), common);
-		if (ret) {
-			dev_err(dev, "irq request failed\n");
+		if (ret)
 			goto error_unregister;
-		}
 
 		/* update ENR bits */
 		if (chip->irq_per_ch)
diff --git a/drivers/thermal/renesas/rzg3e_thermal.c b/drivers/thermal/renesas/rzg3e_thermal.c
index f0e29fe633db..c44f5b8858d0 100644
--- a/drivers/thermal/renesas/rzg3e_thermal.c
+++ b/drivers/thermal/renesas/rzg3e_thermal.c
@@ -461,10 +461,8 @@ static int rzg3e_thermal_probe(struct platform_device *pdev)
 	ret = devm_request_threaded_irq(dev, irq, rzg3e_thermal_irq,
 					rzg3e_thermal_irq_thread,
 					IRQF_ONESHOT, "rzg3e_thermal", priv);
-	if (ret) {
-		dev_err(dev, "Failed to request IRQ: %d\n", ret);
+	if (ret)
 		goto err_pm_put;
-	}
 
 	/* Add hwmon sysfs interface */
 	ret = devm_thermal_add_hwmon_sysfs(dev, priv->zone);
-- 
2.34.1


