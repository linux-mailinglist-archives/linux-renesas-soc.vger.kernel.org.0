Return-Path: <linux-renesas-soc+bounces-28854-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iH4xIlBJqWlZ3wAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28854-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 10:13:52 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F3520E156
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 10:13:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 968BE3002757
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2026 09:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D19F126C03;
	Thu,  5 Mar 2026 09:08:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7472A86352;
	Thu,  5 Mar 2026 09:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772701709; cv=none; b=PjZjQC2RJzf8U9i/t/3o92kS8ZWMja3zsPOmzGnbmZqlqoP+iobAtVGaO5jhL3Q7vLHc0y+mBDJsj2H1YFPtEOnHylFRBv2z/QwzKCCMCO1SUygQFpaOz6UGLZfqzQXA3esBzIfoWNt/amT4leFWkCXhNCSHej0bNw2uHgPA9I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772701709; c=relaxed/simple;
	bh=pSUkOoJ4/ALTuvO3W1IcZcBwHHAMJ8QP4EcXEfW2+5s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fihgyx0d2VwheVXOBnI3Lb37g9Hod+TbXt1w+ZKNrXE++B/VY6EbHpZJuNKacL1n6Rbei1tcjRpqumrMkkBeszNLksNIzxXSG/pqMZUYEstYaZxjXI/Cc14PrTwrl5Ls5dUJa9V5j7//9TN5pGTlEjLzkDhSrXcicm8mG4r15qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE620C116C6;
	Thu,  5 Mar 2026 09:08:27 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] mmc: renesas_sdhi_sys_dmac: Convert to DEFINE_RUNTIME_DEV_PM_OPS()
Date: Thu,  5 Mar 2026 10:08:24 +0100
Message-ID: <a72e532c7364cd64b5cb4fc63c94b2af6b22ad8b.1772701528.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 07F3520E156
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28854-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,glider.be:mid,glider.be:email]
X-Rspamd-Action: no action

Convert the Renesas SDHI SD/SDIO controller driver using SYS-DMAC from
an open-coded dev_pm_ops structure to DEFINE_RUNTIME_DEV_PM_OPS() and
pm_ptr().  This simplifies the code, and reduces kernel size in case
CONFIG_PM is disabled.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/mmc/host/renesas_sdhi_sys_dmac.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
index 543ad1d0ed1cff95..9215600f03a2340e 100644
--- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
@@ -456,19 +456,15 @@ static int renesas_sdhi_sys_dmac_probe(struct platform_device *pdev)
 				  of_device_get_match_data(&pdev->dev), NULL);
 }
 
-static const struct dev_pm_ops renesas_sdhi_sys_dmac_dev_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
-	SET_RUNTIME_PM_OPS(tmio_mmc_host_runtime_suspend,
-			   tmio_mmc_host_runtime_resume,
-			   NULL)
-};
+static DEFINE_RUNTIME_DEV_PM_OPS(renesas_sdhi_sys_dmac_dev_pm_ops,
+				 tmio_mmc_host_runtime_suspend,
+				 tmio_mmc_host_runtime_resume, NULL);
 
 static struct platform_driver renesas_sys_dmac_sdhi_driver = {
 	.driver		= {
 		.name	= "sh_mobile_sdhi",
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
-		.pm	= &renesas_sdhi_sys_dmac_dev_pm_ops,
+		.pm	= pm_ptr(&renesas_sdhi_sys_dmac_dev_pm_ops),
 		.of_match_table = renesas_sdhi_sys_dmac_of_match,
 	},
 	.probe		= renesas_sdhi_sys_dmac_probe,
-- 
2.43.0


