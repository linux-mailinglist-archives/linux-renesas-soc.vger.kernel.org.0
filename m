Return-Path: <linux-renesas-soc+bounces-33195-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGTMN4KpFmr+oAcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33195-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 10:21:22 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D395E1039
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 10:21:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B49630086E8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 08:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7301F3D564D;
	Wed, 27 May 2026 08:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="SgIB3lfz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010015.outbound.protection.outlook.com [52.101.229.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517273BB673;
	Wed, 27 May 2026 08:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779870070; cv=fail; b=eq0p0Oh4bfVqbVwsiZz+q84uPHVwZwmFZ5kJyOE1KMTUDtC4fcZVDIXosLbIiXZyW2a/aTAspGDY/LSKQ8CHZ1Mzx2OJUwhFsD+UULt+CymlGIh+H97ebY2MYGD20vlbNeADw+4xKxvSDqD9D/cINZWcGcLvCSf0QdiwOfJGSeo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779870070; c=relaxed/simple;
	bh=OmeZ1E73F0JG2GE+Dte9J1jyEziq3Z+xs9KiHOdtqEA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UUYN2hjR1r3zA9LKnrBkN6IyM635DL49OH0WziZHAQu5Kq9D/dCS2SGBhyTmu2pv9gM0mq9DlBSrwhqszUcseONN5wRPpR/7BXqxidK7aTgMUfAD7dTUsOrUMB4h/XCl2l40u1bal9ZW5zSSQ/b7QdtIs+jXvIzxwdhteex+dZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=SgIB3lfz; arc=fail smtp.client-ip=52.101.229.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q2ZVfyz2G1TBN4ibD7kjU0SlTVNaaVxN5RZxsLKrz/J3HjJyofvwiCXHpPQM4H1qIfMcinVIWB3OSx8Rpiej6bzOAoan29DJqrkAtmBvn9gO848ibFWrlim0IUqy6MruIXd+rmrsQ58p0xw9KJezpQcZ3FYC1V/WgpkQS0CceoEBH0YKhwt/qiYlPc6K+7SOdLoQ+v9FEesWNeXlNGOHUselV1sD+3PshCOXvM8jXfjOiGFQeJ0/toRitNkHkX0zmyfKNSfq/jxCdbS5LrXN2CXo4OuUplHPBUcEs06fU4F2wfaooLZEOGFlRtdRcoqFFpnJZl/zk3hcEhMHVJFWNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mvvhJchdza69Qne4ITJhK7TcwvDfBYdVe3SfaMEqN5o=;
 b=LUUPgrwhPz1DiIqClwhecdtDkxsG+/ZPIqtfLr+LfbNZPK8hxHlJdyjM/IuhAeTOU/zBR+sQL2YJHDBFHJnuchw9O/oQmMTCOiJYgtvRq5JbEh4miZoda3pggKqGWofZATI3iHmmGf9cQK4ktmoYygm3BZ9gy8YEyIEc2aObWcHaQcwZNGqxYHZdoI9s2itwFNJIUejmyUf8Tt7Cwc8kZUpNJj7Z/ZBFpjnf10KP9FaHUPT4KXOhSD94RBpn5j0taSKvKhDqKWaHyJDJQZoHW/w4m3169/FrRAnMqqi/RGVjBSYXAtlaj4fVCweuPGCDiqA63sIjyG7cU2cCPXg0aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mvvhJchdza69Qne4ITJhK7TcwvDfBYdVe3SfaMEqN5o=;
 b=SgIB3lfzdXdKqE926QQ58pyK5ekacjU9GA42wHj0OHRDrQnUl/9moVHIw8GZFmJpwhLiuZvicQC2yOJ5tGjGwxq9oqylKRKAYhgQWdZTA75ZXjxNiDV/sZ/2s5xVtLKtoRZD3Oqfv/CgIzbtt3f319zPCmvWUpQAaMBhcRkQxXc=
Received: from TYCPR01CA0144.jpnprd01.prod.outlook.com (2603:1096:400:2b7::20)
 by OS9PR01MB15442.jpnprd01.prod.outlook.com (2603:1096:604:3be::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 08:21:04 +0000
Received: from TY2PEPF00005624.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b7:cafe::69) by TYCPR01CA0144.outlook.office365.com
 (2603:1096:400:2b7::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Wed, 27
 May 2026 08:21:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TY2PEPF00005624.mail.protection.outlook.com (10.167.240.55) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Wed, 27 May 2026 08:21:04 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.196])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id F4061300010D;
	Wed, 27 May 2026 17:21:01 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [PATCH v2] phy: renesas: phy-rzg3e-usb3: Use SYSTEM_SLEEP_PM_OPS instead of NOIRQ
Date: Wed, 27 May 2026 08:20:52 +0000
Message-ID: <20260527082052.117289-1-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF00005624:EE_|OS9PR01MB15442:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 714afbe2-e73a-4ada-e415-08debbc8e535
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|56012099006|11063799006|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	slkcXPDT8u6h2W6LmqJcx9KzQ17AJe2TrqLfNDXyVgrJwYyy5bT7HvwwcmLC3Yeyz0HSBCFcD1U08+7HQvyJmkE1mpUvtc//XdiK8xAtSrJwFhpkQytXzMTctnpjLnT24kFYv5vI4k094VTQc+qSJQ27P0R4kl32CdR57cTeyzWw97w5yplu/Tin7N8grjSIt2C5xStwWQQNQuGtkPWfS+HMp5AwBCxmJqjQDFutnu11beKlFEPoWYx4X9kVe6+o7CW8A2h69ulzlYVulTVq0ZXms7ugNz8E3zy9GvralOBZgYDVNlb3l4N5pvhgBmZzqALmvmAnFkV78bRutCEEHSev6qwIX/Li2+oXb7vBZFRy6Oyp/NBD6bKnj6yakKdFRSFzFcT9WePqaZn5SALG76meexOa566G7ORdyYhVIBQQK22t55MoggfbjjwhpYEz4GvfZW6AuKKASBRWvJNjWbOq5dk9Sji8yov97XYSPmpk6Eo+hqgC1Clj8MT+Q6bKjRcTAvlYVEKU2UKYzrgi4zggMQTfN4ip3a1FSAgkS8byx5LpV8WmvyyYVielYmUF1qQ7j5DwIM8/xen6jYlYbW3iC0/hH4BC6u/MccvUp1tu0Oc7ccp+pCuUI6c/c9SrLMZnprnggKz0gIn5NDr1nZ/5W+Qk2+gpgL+hoHVQLoAUqg472Os3uVdCnYohHD1IWByBRk2JLgCiYy93y4mwCUMQgp3ZXk4D00PeUSMYeGA=
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(56012099006)(11063799006)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DCQPqAgK5mwZLMQCMQ4eBuDoYunmFbI+4+Sya1KyKxG+Gh0h37CVIpsJEePxAfxguxr0rBAGbcsWecyUan6BimfY51BKkN1MSUxlag/re88aOi9KIyuRz1uITpRM3scHkHTN5+pzdgfeqTQ7NLKCJP+sZuw9La7xwjT9it62EHPW1jWAybg+2zK98+AP84TNfelgCmT6aUXrpVYkrtIw7Y+26LJy0Y9NBArjZUMa0oL7ynKqCXvKBN5VZBIP0P28HOkxbaL9GuxRv2t0I9C4YVSsADiUwwoP5dhmNKGGzz7y0YEE/31fHEOBruLOcHPWcg3skU9C+SNXmTaXKXAqmEqCu62GQJx2qqBCCH88MNRtuVvfD7F/GDp68S+cVbbP2Q+i6jp0+yMgx4BnVbzGNa1bNM1W44PahcEeROZRfprC+zY1Sp8slJwTimVSBxlG
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 08:21:04.6047
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 714afbe2-e73a-4ada-e415-08debbc8e535
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF00005624.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15442
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33195-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ovidiu.panait.rb@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email,renesas.com:mid,renesas.com:dkim]
X-Rspamd-Queue-Id: 46D395E1039
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On the Renesas RZ/V2H platform, if the xhci driver is unbound and the
system is suspended afterwards, a PM underflow error will occur:

 # echo 15850000.usb > /sys/bus/platform/drivers/xhci-renesas-hcd/unbind
 # systemctl suspend
 15870000.usb-phy: PM: dpm_run_callback(): genpd_resume_noirq returns -13
 15870000.usb-phy: PM: failed to resume noirq: error -13
 15870000.usb-phy: Runtime PM usage count underflow!

When the xhci driver is unbound, the runtime PM usage count of the PHY
drops to 0. Since the suspend/resume callbacks are in the noirq phase,
the pm_runtime_resume_and_get() on resume errors out with -EACCES and
the usage count stays at 0. The subsequent put in device_complete()
then underflows the counter.

To fix this, move the suspend/resume callbacks out of the noirq phase by
switching from NOIRQ_SYSTEM_SLEEP_PM_OPS to SYSTEM_SLEEP_PM_OPS.

Fixes: ee5f1a3f90a4 ("phy: renesas: Add Renesas RZ/G3E USB3.0 PHY driver")
Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
v2:
- Dropped the runtime PM rework part from the previous version, as it
  was not needed to fix the original issue.

v1: https://lore.kernel.org/all/20260427194741.161533-1-ovidiu.panait.rb@renesas.com/

 drivers/phy/renesas/phy-rzg3e-usb3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/renesas/phy-rzg3e-usb3.c b/drivers/phy/renesas/phy-rzg3e-usb3.c
index 060309547ea5..4d2b0f5f5b09 100644
--- a/drivers/phy/renesas/phy-rzg3e-usb3.c
+++ b/drivers/phy/renesas/phy-rzg3e-usb3.c
@@ -233,7 +233,7 @@ static int rzg3e_phy_usb3_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rzg3e_phy_usb3_pm = {
-	NOIRQ_SYSTEM_SLEEP_PM_OPS(rzg3e_phy_usb3_suspend, rzg3e_phy_usb3_resume)
+	SYSTEM_SLEEP_PM_OPS(rzg3e_phy_usb3_suspend, rzg3e_phy_usb3_resume)
 };
 
 static const struct of_device_id rzg3e_phy_usb3_match_table[] = {
-- 
2.34.1


