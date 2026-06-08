Return-Path: <linux-renesas-soc+bounces-33710-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pakFGAUnJ2rCsgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33710-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 22:33:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B15DD65A767
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 22:33:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=naxSkwD1;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33710-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33710-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1146F30477EE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2026 20:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62AB439E6DE;
	Mon,  8 Jun 2026 20:26:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011049.outbound.protection.outlook.com [52.101.125.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9500D39AD55;
	Mon,  8 Jun 2026 20:26:00 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780950362; cv=fail; b=TPanWEc+zhVdKEz5QeoOKEqbHnTRv4PnRUzZFwprDpj3pETa9s/SFykt4qxmJoSIR0is7T4I59j7ZrFiWkHphB0HAVwG75He8FCMKebToilA7w10h+jOugJBWWS12N18qIATfSD4Wwl5nhe1NtiimtN2O650J20ymVfMcHRtBJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780950362; c=relaxed/simple;
	bh=llpmJ2DUdlmoL+Yo+dqWQR9j//d+3nMxadix6HMNngQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=TtiCrY7u3gq9eW09UVZZDpkxuC+ACErlv+pm5Co70mxcxYbArTLs8aLqfuKL2AT45H9qRA4FfyqD2n5A8akBFuinkYvyvpStyF2w4T7JxNVigeJR7uLe554hVn3Y7uvgKY1pPpJtx4CokG4ZD6eBlNl4+3sexJD9p3EOzbOyf2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=naxSkwD1; arc=fail smtp.client-ip=52.101.125.49
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OkBxcsWhge5rM4LKNSVsGK0HwqNWaeLQZLBX93VKmfnfcaXmqSuLT7ii2wE+pMwIyaeP8JZB+bgDBXaYFLlCsbsZhodnSCmPxaYoSNEv7m+2kUVkyG5nwrI0Y/LRmSP2mMV0TjRNtcgZT0PYL/oC/NddDbKZFSgPouvuxzNetf2XZVJs24DmUUwGgb6XVNQVmOvY5ZUVIyvH94ZJvf5ResUPbxwbD+xQhn4OiflS5v/I0npvhmFmNesSHM2jsYnLaQ59LbjZzVlVK08UE6vXxrP46q7ycOtVVbm8FOGxjSBmiyGxnad8RyIbBqQNT9LX/B2LOVJBbv7t+0y2f7osAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FTV8u17S7m8awg8550YmVIqD7DE4dGuegPbDj67q7NQ=;
 b=lbA9Zn6hatLjS26mvtK/U66VO2HMJb28APeAZqPNKraQFd8KpVKriM9jE1vZMZMf942Fu1OCNw7pbFYJwWwJpkcB3uDk44fd4NW9SNupJCWN/hzOj2uAahS83EVgCAObBFy8FvF34Ubjnm6Sg6Yi1tGiKU+HVGhyoBcMnyAZUh4LT8bowvoUcls/JyXRknkInQzRHbWZzu2hD/DUckF+qT11vIQW2H0lS9z8v45E+y8d1i05bgZf3Ju7ZX0+kkPDzmlfvD7OlPoRvMNKbkWrjaVuP2ttOhWa/4W0h8KGgmjCpOjJ+NDdj+Qga258nBPuHhWNUXIvK3r6Qc95CoreLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FTV8u17S7m8awg8550YmVIqD7DE4dGuegPbDj67q7NQ=;
 b=naxSkwD1/EMqxyqvE4ms0DDtpqWeGHjUoEwayg2m4t8MMuTj5Zz3S/HzR6Ea9+SwBU9qM36k6kUWZUmf/sAjnZcDUn/6JUn3XP13Iy0r19x0F0FwDHz62DrX5+NPnnrJ+LNkqemZR+gejhXp6+epWuWF2M0OXimmU9ifOopk/F0=
Received: from TY3PR01MB11948.jpnprd01.prod.outlook.com (2603:1096:400:409::5)
 by OS7PR01MB12113.jpnprd01.prod.outlook.com (2603:1096:604:265::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Mon, 8 Jun 2026
 20:25:57 +0000
Received: from TY3PR01MB11948.jpnprd01.prod.outlook.com
 ([fe80::b718:17d0:6c0f:1495]) by TY3PR01MB11948.jpnprd01.prod.outlook.com
 ([fe80::b718:17d0:6c0f:1495%4]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 20:25:56 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] spi: rzv2h-rspi: Add suspend/resume support
Date: Mon,  8 Jun 2026 22:25:08 +0200
Message-ID: <20260608202509.3651345-1-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::19) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11948:EE_|OS7PR01MB12113:EE_
X-MS-Office365-Filtering-Correlation-Id: 993420f7-7820-4744-eeef-08dec59c230f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	CJ+7pN9z2/F2L/AeOUV74Ob1mXYdCzcL0xGO5Ie5Zgv0eWNeC9xvYHbl7ItQf/zQjihGhtB28Bz5dD4g9kVp9hCGDUO/3N3rj3QQK6VPROwE2pzvzEsw0VeFIvO3tZaEgTRKxa5LuwDXWkVR2JcWzu0KV0yY31RNtwzuDlWlKQ96U57A6mJM7y7waemm+/xDnKWDn8zlDNrizCfHefhyZBMY090LH0+5P5LYCmxzqquk48BZE+NWrG4t4xwd4FuzWCYuYOjVWXg0vWe4yZ7r0gEDONUYxFTPfjS4/ScoctXmXGr+UMRnZGXftIwOy8qwPsRkJdRfc5a4HQv3BWkxS45mc/RBQyaZGZ9Oh4pFWz0q8TUMTS7Sekhmvw2BKNG5XVSuKw0UJiJd2CX846tePwNh352D8JRulxL4EguffitlgaH7Rw1CkhkFYp8HnHYi1OUip3p0navZGP6bUdF0tkdx6QBAApPGNYJmLCnb6GgmlcVDi/w6G7h99pBYV7V2KNlM1DDDTKlti5BWwVFwY2/7afOi3wyojdiEhPCMoCpqau4R+aNdX/JOrVoQ6R9l7R9rcYnq4NnRlQGCu99atHfzuoRhtR+obxs94oDM118KXzegBtDeez03SWLcBkMbES1hImuF5NjLQickh1/q3Ko7XxOAeFNTEZVnGCbmPejzsUKZVGQOx6NuKBWgxLOtqOttPMOS+XLMMo51agHGGcJGDLYhx0DAnF/yBlvqb/ldZNXjnfARIA/OKc0IO62W
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11948.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PjBmlyKtRRhqxfeC3WKx4mcaFZn2qBdAN/J+jfBxzKqqpzJ1b2mEMxeLgM25?=
 =?us-ascii?Q?hSj0oGnMRZ0abeZNXpSL3rLeQZUdC92JyIoUxWEbMu06w2w/HUNaUneUZbb0?=
 =?us-ascii?Q?gLSwmYuViBFXHs0TSGvbET+c0B5br+Hc4zVOjRliKJsb3kHF1HmxsekChPvp?=
 =?us-ascii?Q?c/kKz67Dt5EuT1PkYo7Qpk+DtZDcevbIRySOO9kQvF1ie2EU6z/oNcaAy/Hn?=
 =?us-ascii?Q?JrU8Tcd99bSJ8M7bazOv7jFBivxpYIFoVQZ9VuKl3RuiSS8sPkazaXi/dxdv?=
 =?us-ascii?Q?nk/gaiZp6K4EQ40J4exWlr3VowAs/QA+u/vIQvqkJXhFqTj/FIcBEpzYHfJQ?=
 =?us-ascii?Q?gfh/CBkw7SEItDTEp0TXItYp+icCTXEjFfAGIxbUXe28A2hVCg0kihIN67BI?=
 =?us-ascii?Q?q4/cQRbkIvJ/FXTMPitiRkAZ+BVO+633q7nV9s1ZLt8KgHHw3/uS5c+TqKqk?=
 =?us-ascii?Q?/C3MTI4tO1GYmD06vKxoRoJG63oYxgay5J7KqPvzhj4JVk/dQEyzkkxDGfcd?=
 =?us-ascii?Q?IZHa3CC26k0WKo7pUwp9++2sQMydcFMGkFFW8hDdF3dpzg6+TWQxli917+00?=
 =?us-ascii?Q?S7nAQEL4VNqQRRtH2nr3tx8om8w2mOKK5vMLTEfn0L70arty/gHHAO6egzrB?=
 =?us-ascii?Q?UnX+hjqKmXBZE79ZD1zgueBqR1y1g9wNyjdUNgaVrzz3L+hsK/WK4WVshDjj?=
 =?us-ascii?Q?2U/7EwaVCpB1f0jq1kM4b+daLixnstdpHE7GFR3HuklLZWdEOXXc+Hf0sCaa?=
 =?us-ascii?Q?6unVOT4lucMnCxjVxGONpv1dNO6/Ly0UrXX49uHNUNYWwtKvYNG55MpfSN9E?=
 =?us-ascii?Q?Dq0clBYZj5flNgg59K8W2orEl0QI2ufQyMiUOw43py9Ze9AIeHV0ke2bJbXn?=
 =?us-ascii?Q?QwzirkbIByz9dIoyUVuJhGAQNEvHk8/NqW/hVoj4ck8oZ39LBWp8aC5Tj065?=
 =?us-ascii?Q?2JcfsOcOOvYLnNlYqAR7+M72QokEYdqYtRDwM5wO6aZg78xRAplwHFXWV5Pn?=
 =?us-ascii?Q?fz3avjF0t4FnGlzwTMdFRRA5IxfjfhmWn3l4hpM4jsiKsy6ZIWkCCq+25+jD?=
 =?us-ascii?Q?bHyJ9lAwXwjnFephhA5v0fBTaYTdQYacScd9VjG6TYEPZiFcG5KebZAhCYce?=
 =?us-ascii?Q?uZejrtgfPZEVuV5Z9OEApGIgVv7dDjF/baFyGJSpVHoO4Hubzr05VfgKcqlu?=
 =?us-ascii?Q?QgJUTSww1Xlgu9RK9bEAgpgcVbaInlzT8jnYqq/BwixupxUhyXtnNcUVeeoS?=
 =?us-ascii?Q?91pCGJ14fpmehbUlGMYZCluorytYar92KCwDb/W/2ISzi/hIq0oWxfn8AH2P?=
 =?us-ascii?Q?2CljdRN9pU18lOI66z7WIQ07x+Qt9Bs5HaNVzOI/MoMlWzsWusLfSMNALN0I?=
 =?us-ascii?Q?BHCliPC/v+VDVtVhB/lappCtADGVxGM+2iUk4rUxQ9rzWyicjtTjuc/oeYhs?=
 =?us-ascii?Q?UFAhoO5irPdNzb1txoEMX2SzOf7RCopokF/YuDIqv7bFV8WlzQO/t4QjcuMl?=
 =?us-ascii?Q?458p0yR2H8h87tK6YD/HXf9A2H4IONNk86PGtrObEP6HT/d+F62VCoJGf8hl?=
 =?us-ascii?Q?BgreSV4LB9FM6QFzeJb1PzndpTSKph6y0ImoFf86njaK/cbu2aftvfW9mLoY?=
 =?us-ascii?Q?5e1shtSAFGANP80kjSn9iL7cvZOaUC24a5gBoBzkNmA/nI2fNsN59cKOqLJ3?=
 =?us-ascii?Q?2PLEGrBXRfPz8WvdP6n4oj4P6n6gC5DRwgxRqtwUKllW+oaSDcyFMTTQblso?=
 =?us-ascii?Q?g+jrNNK7suW5SB+e8n5AhqaPMFE6moeW/fJ2IJxoICzoFnD84P/3?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 993420f7-7820-4744-eeef-08dec59c230f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 20:25:56.8281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rnMEKZ8JxDe3DhOMI2nLadUAQRE5hlfgjyMjbXsuhNhBEd4v9v7WFKqej73mhAaKh9BnO8aHD1kqJ8IO2DwMbcMItMlTK9BUWyfISE5T7/Ey+H1ydSjTis8KhKiJPilP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB12113
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33710-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:broonie@kernel.org,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tommmerciai@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B15DD65A767

Add suspend/resume support to the rzv2h-rspi driver by implementing
suspend and resume callbacks that delegate to spi_controller_suspend()
and spi_controller_resume() respectively.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/spi/spi-rzv2h-rspi.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/spi/spi-rzv2h-rspi.c b/drivers/spi/spi-rzv2h-rspi.c
index 1655efda7d20..694e5305c638 100644
--- a/drivers/spi/spi-rzv2h-rspi.c
+++ b/drivers/spi/spi-rzv2h-rspi.c
@@ -802,6 +802,23 @@ static int rzv2h_rspi_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static int rzv2h_rspi_suspend(struct device *dev)
+{
+	struct rzv2h_rspi_priv *rspi = dev_get_drvdata(dev);
+
+	return spi_controller_suspend(rspi->controller);
+}
+
+static int rzv2h_rspi_resume(struct device *dev)
+{
+	struct rzv2h_rspi_priv *rspi = dev_get_drvdata(dev);
+
+	return spi_controller_resume(rspi->controller);
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(rzv2h_rspi_pm_ops, rzv2h_rspi_suspend,
+				rzv2h_rspi_resume);
+
 static const struct rzv2h_rspi_info rzv2h_info = {
 	.find_tclk_rate = rzv2h_rspi_find_rate_fixed,
 	.tclk_name = "tclk",
@@ -837,6 +854,7 @@ static struct platform_driver rzv2h_rspi_drv = {
 	.driver = {
 		.name = "rzv2h_rspi",
 		.of_match_table = rzv2h_rspi_match,
+		.pm = pm_sleep_ptr(&rzv2h_rspi_pm_ops),
 	},
 };
 module_platform_driver(rzv2h_rspi_drv);
-- 
2.54.0


