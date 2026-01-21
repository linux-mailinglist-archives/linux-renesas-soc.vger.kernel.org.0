Return-Path: <linux-renesas-soc+bounces-27195-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sE5aGhK0cGndZAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27195-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 12:10:10 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF4C55BD5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 12:10:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3A15F645F9D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 11:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46F3D3DA7E5;
	Wed, 21 Jan 2026 11:03:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E27B396B8C;
	Wed, 21 Jan 2026 11:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768993398; cv=none; b=qMbzlPT5Lh5EI7YfWE1oUeJVK7pOGvHgt/Tkx9peuNiw5rajqn7GqBmSOoA46NakiJquD8DUyphNwDumck+sGwpvZHNLviygRpwqw1otNGLHBbhDaHotoYEYD5Tp611MtTwN2SZtIR2JOpNz+Ql0UN5ZtMx0dz5Zcceb4+xLcmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768993398; c=relaxed/simple;
	bh=99V2KEzM5M/6j9u/iDcwCKzEKyoaom7t9aOwjdEiDzw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RiXcHLmL/Q0cmcNvYVtL83oVp4seQeojVm86bD9JuKip6KdN/b+rjx3etep2DefmPIirzgo6YJpUZEliIkkq0WHzQjJCY/cRBA+OsyaB3+8EYD+jSG6FttuiAy2br2tNSykgUevhWitYkzC19cgCw2rEiZ7gTiMPhgTyJ9sIQyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FFCCC116D0;
	Wed, 21 Jan 2026 11:03:16 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Marek Vasut <marex@denx.de>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH resend] clk: rs9: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed, 21 Jan 2026 12:03:11 +0100
Message-ID: <15f24d006fc782d501922d6c88e836976d69c7cb.1768993373.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.74 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27195-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,glider.be:mid,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 1FF4C55BD5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert the Renesas 9-series PCIe clock generator driver from
SIMPLE_DEV_PM_OPS() to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr().
This lets us drop the __maybe_unused annotations from its suspend and
resume callbacks, and reduces kernel size in case CONFIG_PM or
CONFIG_PM_SLEEP is disabled.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/clk-renesas-pcie.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
index 6650e3440c7492cf..b9bee616afe8d4ef 100644
--- a/drivers/clk/clk-renesas-pcie.c
+++ b/drivers/clk/clk-renesas-pcie.c
@@ -359,7 +359,7 @@ static int rs9_probe(struct i2c_client *client)
 	return ret;
 }
 
-static int __maybe_unused rs9_suspend(struct device *dev)
+static int rs9_suspend(struct device *dev)
 {
 	struct rs9_driver_data *rs9 = dev_get_drvdata(dev);
 
@@ -369,7 +369,7 @@ static int __maybe_unused rs9_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused rs9_resume(struct device *dev)
+static int rs9_resume(struct device *dev)
 {
 	struct rs9_driver_data *rs9 = dev_get_drvdata(dev);
 	int ret;
@@ -415,12 +415,12 @@ static const struct of_device_id clk_rs9_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, clk_rs9_of_match);
 
-static SIMPLE_DEV_PM_OPS(rs9_pm_ops, rs9_suspend, rs9_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(rs9_pm_ops, rs9_suspend, rs9_resume);
 
 static struct i2c_driver rs9_driver = {
 	.driver = {
 		.name = "clk-renesas-pcie-9series",
-		.pm	= &rs9_pm_ops,
+		.pm	= pm_sleep_ptr(&rs9_pm_ops),
 		.of_match_table = clk_rs9_of_match,
 	},
 	.probe		= rs9_probe,
-- 
2.43.0


