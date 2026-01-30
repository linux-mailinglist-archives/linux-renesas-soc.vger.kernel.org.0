Return-Path: <linux-renesas-soc+bounces-27685-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPuKO5jBfGmTOgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27685-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 15:35:05 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A410BB9E9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 15:35:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11F3E30053EA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 14:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B6AC2FE05D;
	Fri, 30 Jan 2026 14:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ed8f6iJx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2572E6CD3
	for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jan 2026 14:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769783702; cv=none; b=XssePQeXffjostpulFOC7k4BmZkmjlRL53kTlXu2Du25TkQlIn4kQYgZUslso1wk4NiYbOiBjgyxHWFUHPMdcDRFuSNVMN6lSt5kXMcp6eO0hhsBaqRlpCvpCb2gsIdetllr7TatXu7lSaY0r71WmwFDbRu/uPTjw7RgZq2T20c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769783702; c=relaxed/simple;
	bh=n2Wsd3RQPIbljg+YG+aIbzv8r4oiDMC153jN4cyNWHs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Rl9nDDd3kqJOuingDZImrT21a2Nm1IUlCilJDdbe5kWIU5mLtszTwyPzagvyq9kFYD7mytBINsA/vAS1oLfzNuAGF9jCOWyV7aV6S7kqcZRz3oY6ANtb3sUUw3jROYgx11kprING1KcpnkjWuR8dGIfjcyn1r9I/AE+XVVWSJ9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ed8f6iJx; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-653780e9eb3so3051432a12.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jan 2026 06:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769783699; x=1770388499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Byw5W/UArvMTRrdXLkgeguHqFYyTfvL3tSa7AhvDzc=;
        b=ed8f6iJxogNEYoFWWSkzXqg8rgCekiXTGu5OJCz/F+ciidEVMaXvhARD7XywtwTDh2
         WLup4BhBslYqh5jwSB5utI/ZTzBy5jcIdiuOjT26WNSn/W/IRVoz5KFsa1h4k/ebf9B7
         oisKu8PaaOhnn3ptW0Qg08LlJnv1hP81q/tbR+XOn7gjajf8mQKXyRSkAQXdY73F7eB6
         UpVqA+WuB3ooBggDDJmynLCBKb++mqaTV4vZ9WgHSViB48ywMcJoKQemocXqMXquAjrk
         XrkOhWi6OvEBfD9dqsQhJnyg7wp2DWGwEH01LVmjojnH3oQa7YVA7jiu4MbPlKescXHs
         3k2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769783699; x=1770388499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Byw5W/UArvMTRrdXLkgeguHqFYyTfvL3tSa7AhvDzc=;
        b=EIWneB+pemaZKLpzw47ECbuHXgmxfzecWYDjMFzuZkSF+x4hhlQocXnlb5RTap8F5V
         pTm8l3SFJhufJCLBUqTRYM1YcUCqIOcwwOSw5TNKw9PNlqRCeQWMt4T8ko65ND5K9W86
         /etK65G2gSEhA8JQGvzVzM10vvBd9jkiYpxVCaGaSE/3nOzoBqowmPNUJ4QVEdRj8uQu
         LgvITVlfKpc7qGS6uUyslwXHEoweOVd82WPNzBe8oQ0BBw/ZxIoddJcvoqfVIDiNv3Ao
         PjNBokxmSpabmaQsN1igKyDQ0TFeiSNAG42FIp2Es1cCLUk4dQv8ycG1YlJMVK/XBJ92
         VNmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJAEPtMwDJsI9fxdb9YDNwuWZhe7q/KJDiLfs5wKgwaRHAmbryZdVxG74TRKtDtdg8+g/dmt9/2o4VNiIl3bfxMg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3uhhpXf5t7qplVcYAM8TVFzb4G6ZCudz1sn0FBqLNkHuDyLPh
	/aCNiYHNXgbKK10RsqtLKvdOasOdIWwGvaU840UqQ312xtIw/8MY9N11
X-Gm-Gg: AZuq6aICu25q7CXiRYUldgw+fm0M7x4nmjs0fzgrRmaESlds3DOrCqqkj9Va/zf6elH
	j7YTmgHk1f+Qevd0+hnz0CKNOgPNYMUgyOgDsvYZBGpF65iQBdlJFyJLLU3Yka97SkYtw8AuLBs
	sdc8FzX/AMOpHTOkh8sp+5IqezkwxxR4HQPEnBB/tXhjJHrXddTkpF+4zvP23jS6ySg8mqui5F0
	IqvHKdzcqVDNEd3sltxMg5ahL9Cukmis+duHP3y/YWhluBo+I4JuVYOStUNKOgplGbtIefDpg9q
	dyWGVhHSLn2hOJFcQ5biUuz0Y5oT+wrt363btDr3dVFcO5Zg66jIqz7ujCNrhLU1h12Or0h4rhH
	ZapDSOV7oLikz6QW7k9CNd8rTIrOgcqcwehqDns9YxdFyJBRAAAZkmnkIifFgZzYV8i4pLIxE3m
	Txh6sTPfVAO/e4IrjhYOVqhttNwCNdtUHPRVM=
X-Received: by 2002:a05:6402:5cd:b0:658:bd60:43e2 with SMTP id 4fb4d7f45d1cf-658de5a0831mr1909516a12.17.1769783699071;
        Fri, 30 Jan 2026 06:34:59 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:bd64:2984:fe71:7633])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b4256a92sm4268188a12.5.2026.01.30.06.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 06:34:58 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] clk: renesas: rzg2l: Drop DMA driver dependency for system boot
Date: Fri, 30 Jan 2026 14:34:49 +0000
Message-ID: <20260130143456.256813-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-27685-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 6A410BB9E9
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

As per section 4.6.1.7.1 of the RZ/G3L hardware manual "Precaution when
use the peripheral modules which can initiate DMA Controller", it is
stated that it needs the below register settings even if DMA controller
is not used:
 - Set CPG_CLKON_DMAC_REG register to supply a clock for DMA Controller.
 - Set CPG_RST_DMAC register to release a reset for DMA Controller.

Currently, the serial IRQ is not routed to the CPU if the DMA ACLK is off,
or if DMA resets being in the asserted state result in not getting serial
IRQs for the console. Fix the issue by explicitly deasserting the DMA
resets during probe, and since the DMA clk is a critical clock, it will be
turned on forever. This will allow booting system without DMA driver.

RZ/G2L SoC loses power during s2ram. Explicitly turn on clk/deassert
resets to get the console during wakeup.

The DMA driver is used by both RZ/G2L and RZ/V2H family SoCs. The latter
does not have any issue related to serial IRQ routing. The reset assert
in DMA driver will impact wakeup using serial IRQ on RZ/G2L SoCs. The
cpg_suspend() is suspend-no-irq which suspends later than DMA driver. So,
deassert thereset in cpg_suspend() for making available the serial IRQ
as a wakeup source for s2idle.

With these changes, the RZ/G2L-based systems:
 1) can boot without the DMA driver
 2) get serial IRQ available as wakeup source for s2idle
 3) get serial console prompt during wakeup of s2ram.
 4) has no dependency on bootloaders for turning on DMA clks/releasing
    the resets.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 35 ++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index f4deb5d3b837..16771a0101bd 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -86,6 +86,12 @@
 #define PLL5_HSCLK_MIN		10000000
 #define PLL5_HSCLK_MAX		187500000
 
+/* Critical clk/resets to route serial IRQ to CPU by default */
+#define CPG_CLKON_DMAC_REG	0x52c
+#define CPG_RST_DMAC		0x82c
+#define CPG_CLKON_DMAC_REG_ACLK_ON	((BIT(0) << 16) | BIT(0))
+#define CPG_RST_DMAC_DEASSERTED_ALL	((GENMASK(1, 0) << 16) | GENMASK(1, 0))
+
 /**
  * struct clk_hw_data - clock hardware data
  * @hw: clock hw
@@ -2051,21 +2057,48 @@ static int __init rzg2l_cpg_probe(struct platform_device *pdev)
 	if (error)
 		return error;
 
+	/*
+	 * Deassert DMA resets to route the serial IRQ to CPU for serial
+	 * console during boot. DMA clk is critical clk and it will be
+	 * turned on forever.
+	 */
+	writel(CPG_RST_DMAC_DEASSERTED_ALL, priv->base + CPG_RST_DMAC);
+
 	debugfs_create_file("mstop", 0444, NULL, priv, &rzg2l_mod_clock_mstop_fops);
 	return 0;
 }
 
+static int rzg2l_cpg_suspend(struct device *dev)
+{
+	struct rzg2l_cpg_priv *priv = dev_get_drvdata(dev);
+
+	/*
+	 * Deassert DMA resets to route the serial IRQ to CPU for making
+	 * serial IRQ available as wakeup source for s2idle.
+	 */
+	writel(CPG_RST_DMAC_DEASSERTED_ALL, priv->base + CPG_RST_DMAC);
+	return 0;
+}
+
 static int rzg2l_cpg_resume(struct device *dev)
 {
 	struct rzg2l_cpg_priv *priv = dev_get_drvdata(dev);
 
 	rzg2l_mod_clock_init_mstop(priv);
 
+	/*
+	 * Deassert DMA resets and enable clk to route serial IRQ to CPU for
+	 * serial console during wakeup from s2ram as the SoC is in DDR
+	 * retention mode.
+	 */
+	writel(CPG_CLKON_DMAC_REG_ACLK_ON, priv->base + CPG_CLKON_DMAC_REG);
+	writel(CPG_RST_DMAC_DEASSERTED_ALL, priv->base + CPG_RST_DMAC);
+
 	return 0;
 }
 
 static const struct dev_pm_ops rzg2l_cpg_pm_ops = {
-	NOIRQ_SYSTEM_SLEEP_PM_OPS(NULL, rzg2l_cpg_resume)
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(rzg2l_cpg_suspend, rzg2l_cpg_resume)
 };
 
 static const struct of_device_id rzg2l_cpg_match[] = {
-- 
2.43.0


