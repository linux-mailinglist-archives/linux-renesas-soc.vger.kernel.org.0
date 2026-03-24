Return-Path: <linux-renesas-soc+bounces-30164-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NAoOEmBwmlneQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30164-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 13:19:21 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F02403080CC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 13:19:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 78309303A384
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 12:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D487B3F0AB3;
	Tue, 24 Mar 2026 12:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="yBfG1JZg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE983EFD1B;
	Tue, 24 Mar 2026 12:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774353892; cv=none; b=GFMP4IBIF3x2ZV8NKoJUvb3vTo82Tu0xHqpEjOAYmU8cD97f5lXoubmi0F9gmSga7QKmPc2+NjP3o9UuGKle8DyViWVf+dEyTaOkWeVQ+YYEA602YV4vme5Dlb3Vsqi6JlDgFrNDoT/+uZ6olSocBfYFafO8aSC5W/YEWUMbeus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774353892; c=relaxed/simple;
	bh=7hp4oyD2ib9d7eJ9ntkQRrAYelNaifGy6OMHeHtB1Fk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b/0YrLvTuph8BT9x6BmXWWD+FxOYPb84+VuHRLjVRBagDX0BB4eE3QLI3JLwbQ5jobQmcajknowLT0uFbbGwDWi7VioMFMNK47k+E5W0nZjDkeqwE3k550OBKMdN5p8ut3fiKti8+VRG9nCFOoaYrqOgNpE6KJQqpdQp5BXmSow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=yBfG1JZg; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0D7C8C5809A;
	Tue, 24 Mar 2026 12:05:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C37B86011D;
	Tue, 24 Mar 2026 12:04:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DB47B10451156;
	Tue, 24 Mar 2026 13:04:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774353885; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=KwCN0/LateHGENonRi4R+ouqEYQekmjHU4ZzMyhdWag=;
	b=yBfG1JZgb1O5OxxSXx/H91EnZIQ6Nc5B+g7T7RIeAUx7EJAnY5MVVbtuNWgpRLvVjjFEmk
	xXAsphATx0ArDVJjlg2BdvciJaci+XygHMi/3hk7mVvKJyElDp7bNfnocWWWDTWE9Vw0Vu
	CwR4cpzfTQb2hdTpio3/2mvOJeiN538uEUcKbHiiiEj0cagbCHOL07nkC0VkLipxx8T9Ps
	cSYKpBOHbgq5YHPW27CmJry1iE4V1DU7g8xb6eX3K9It9TTgJ9fB894zRAcgzvjsbHFUNt
	rkgflB19K6jQozEkn072ysGvL9XyhsVn1iUqSlssi0gw6y0NrtvD0CoOzJ/rHw==
From: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	"Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Subject: [PATCH v3 1/1] clk: renesas: r9a06g032: Enable watchdog reset sources
Date: Tue, 24 Mar 2026 13:04:30 +0100
Message-ID: <20260324120435.243641-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324120435.243641-1-herve.codina@bootlin.com>
References: <20260324120435.243641-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30164-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid]
X-Rspamd-Queue-Id: F02403080CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The watchdog timeout is signaled using an interrupt and, on this
interrupt, a software initiated reset is performed.

This software initiated reset performs, in the end, a hardware system
reset using SWRST_REQ of RSTCTRL register.

The watchdog itself is able to control directly the hardware system
reset without any operation done by the interrupt handler. This feature
allows the watchdog to not depend on the software to reset the system
when a watchdog timeout occurs.

Indeed, when the watchdog timeout occurs, the watchdog requests a system
reset using its own hardware dedicated line but this reset source is
disabled at the reset controller level.

To benefit of this feature and be robust against software issues, enable
watchdogs reset sources.

Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/clk/renesas/r9a06g032-clocks.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index 7407a4183a6c..2bed88e09ce6 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -1342,8 +1342,9 @@ static int __init r9a06g032_clocks_probe(struct platform_device *pdev)
 	/* Clear potentially pending resets */
 	writel(R9A06G032_SYSCTRL_WDA7RST_0 | R9A06G032_SYSCTRL_WDA7RST_1,
 	       clocks->reg + R9A06G032_SYSCTRL_RSTCTRL);
-	/* Allow software reset */
-	writel(R9A06G032_SYSCTRL_SWRST | R9A06G032_SYSCTRL_RSTEN_MRESET_EN,
+	/* Allow watchdogs and software resets */
+	writel(R9A06G032_SYSCTRL_WDA7RST_0 | R9A06G032_SYSCTRL_WDA7RST_1 |
+	       R9A06G032_SYSCTRL_SWRST | R9A06G032_SYSCTRL_RSTEN_MRESET_EN,
 	       clocks->reg + R9A06G032_SYSCTRL_RSTEN);
 
 	error = devm_register_sys_off_handler(dev, SYS_OFF_MODE_RESTART, SYS_OFF_PRIO_HIGH,
-- 
2.53.0


