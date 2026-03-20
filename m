Return-Path: <linux-renesas-soc+bounces-29995-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPWnFncmvWmr6wIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29995-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 11:50:31 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5D92D90AB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 11:50:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6830630470B1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 10:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7655391E6F;
	Fri, 20 Mar 2026 10:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QVzgizIS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E5831F994
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 10:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774003798; cv=none; b=GyLpb4g39vEfBBFLMxk8/ZgVyvYkDcPdt79fRDeDYr1u7FbDYgUb7gik/D4/iDcEfEZ7SXKNSWlpdVgwPH9MNFjp2E6angXp2EfT4AzV3D9agP0eFw9/cPTUpT1dlSjmryBNCzlPv/W/4P53PLnbZKxqo3iqA0ZvMP1v+ByTgOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774003798; c=relaxed/simple;
	bh=IiVbDpGGDD4RSyLv3c7fTfBYylUyvZwXxZ1DAs2PfOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZBXf7cja6OjNidy8roEI42mEiW+eOb3MExvdU0BH1+t8XX9n9+/dkVhan259i9r21aKAWgNg6OKx5vXpa5JJFkkwS0/2F4xegnu934xJoCGMa6lUk+pQN5ulOoJoeMTQuNW/JPrqTjLL1/YQPrQgPA9V87MeWawKHVUAuEt1I/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QVzgizIS; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439d8dc4ae4so1422272f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 03:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774003793; x=1774608593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xEEA7I0ZvUlQhKijbyn5xZAb8FKf9j9NUypo5/H5hDY=;
        b=QVzgizISLt3b/hNHIH72ZgDmhIm5urwQqzXpvp9qub/Ysqy6n1CNtI+0qaUy4vdQji
         KfPU1717/+VlbBGRxjMn6KyXk5KduP1mTE0EghFlRUUUxEzaosh+Ti+Gtye13hSAq1JR
         IxDmYU6m/rTbSH4AjWwR5HXD9d8/aljAADCLHVXnD/CuFKoYvMpozZqB+HavwQmbB2PR
         Nn6jbRNxpQ2JE8DodPdStdtIqDeXtcQhwD9k7YRMtw2MP6U6TeG++yZEQGjaQ5zuC3Yx
         q2TpEl6uGj6kTT+DD1BdamqerWkdD17nTAODTkyo9Ed4Z9gskyIHXPuRbcJTl4Yex/fO
         Bycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774003793; x=1774608593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xEEA7I0ZvUlQhKijbyn5xZAb8FKf9j9NUypo5/H5hDY=;
        b=DhiXvZFBna2SbR2C2ztzoVZC4w0gUw7Hyrt7SqowdQbWaQyxI0FwbjXYQWw3MBEOOS
         Y+fW+ThL6bYlGhp3QJR3tJWCNI6il+xtjgVx/8gRCillLL6+hC04HEA8TaOxCCpNplSQ
         BHOxP6TQzqMtTQTDuc0ynZIqyWfUYcQZPo1glQZ/nvIEjSi+NVd0/CXSKV/2Rok7+WtE
         fmYubM/sy06RKVaF7EzBIq/YYukcJXsZ4PMN/84AIWMXfWsogQgwxJ6bJNj8IoAGL1yE
         +vkOm0Lt3D0RY9qgc0+3xyXcGeFOSpxoWtW9BUAkPE6HAmqvGeUPRQOksQvUsopYIcCk
         XWQw==
X-Forwarded-Encrypted: i=1; AJvYcCU7WG9x+uYRK+h0ENPExaaw5hJSj6GY/88hXuEvsbe6n88nlAUxATOfAV+noMn9yiLvxB29ZcOSik7FJlEUo9ujdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRFoAGP3k7Am/uPT6S1qkw93uH9Z5PncI4sbufHO93EAUu8ivu
	bClY4DAbkBo0RB7wM359tNPJi0zWE6szK8uHvps5cuJwvX6dotv5usOS
X-Gm-Gg: ATEYQzyAQHTuBH9okEvutDjx4oLZNiWS/7W7s88SefEy6mvdMPWkDN56XNH5APai1ez
	y6zyOWBZ1uCsfe++R2Ex+VZ0426c71g13y5h6uZHbLolrQXFY6K9UX78UnsGlPG3o3RAllmx/9f
	yX/F+4zhCXAGKd4It+/uS8Go/fTxLGOXs1RgsjnKgCptxB8X5O3zBjtn0x7Ir7C/8RhVUNyj8jQ
	3SfAVCklzFkdU6DGG46KPDmG6fFx4WGtXJfVZRbEq56YDdTJzkIUc+SwCxUfsz+RpyYhkVtb8Xa
	HurGJKc8kzRu1FemnyVpbqMEzfezAnpKD3z/YaiS+p7is3O3AnwT+1MtxaycDAqsLf6SeYu4aWQ
	qx2oGaUcMZZd3poKdXlE8/spBBYNwOAykyERops4VgArfuHQbF5fBR8N6SxKArFL22Gcu1/galc
	n0pxi7D4B9eDEGLGRgImBbDvbJrCa+7w6H9QtSRELjlg==
X-Received: by 2002:a05:6000:2f84:b0:439:bd70:6114 with SMTP id ffacd0b85a97d-43b6426d1b1mr4311679f8f.38.1774003793392;
        Fri, 20 Mar 2026 03:49:53 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:5b93:d2b1:bc5c:9231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644ae619sm6203062f8f.5.2026.03.20.03.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 03:49:53 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v7 02/10] clk: renesas: rzg2l-cpg: Add support for critical resets
Date: Fri, 20 Mar 2026 10:49:36 +0000
Message-ID: <20260320104950.42220-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320104950.42220-1-biju.das.jz@bp.renesas.com>
References: <20260320104950.42220-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-29995-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.719];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1A5D92D90AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Some reset lines must remain deasserted at all times after boot, as
asserting them would disable critical system functionality with no owning
driver to restore them. This mirrors the existing crit_mod_clks mechanism
which protects critical module clocks from being disabled.

On RZ/G2L family SoCs, the DMA reset must be remain deasserted for routing
some peripheral interrupts to CPU.

Add crit_resets and num_crit_resets fields to struct rzg2l_cpg_info to
allow SoC-specific data tables to declare reset IDs that must never be
asserted.

Introduce rzg2l_cpg_deassert_crit_resets() to iterate over all critical
resets and deassert them. Call it both at probe time and during resume to
ensure critical peripherals are held out of reset after power-on and
suspend/resume cycles.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6->v7:
 * No change
v5->v6:
 * Moved loop variable declaration inside for loops in
   __rzg2l_cpg_assert() and rzg2l_cpg_deassert_crit_resets()
 * Collected tag
v4->v5:
 * No change
v4:
 * Moved this patch from [1] as it is boot-dependent
 [1] https://lore.kernel.org/all/20260306134228.871815-1-biju.das.jz@bp.renesas.com/
---
 drivers/clk/renesas/rzg2l-cpg.c | 30 ++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h |  7 +++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index c0584bab58a3..f9e4af7f49d0 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1765,6 +1765,13 @@ static int __rzg2l_cpg_assert(struct reset_controller_dev *rcdev,
 	dev_dbg(rcdev->dev, "%s id:%ld offset:0x%x\n",
 		assert ? "assert" : "deassert", id, CLK_RST_R(reg));
 
+	if (assert) {
+		for (unsigned int i = 0; i < priv->info->num_crit_resets; i++) {
+			if (id == priv->info->crit_resets[i])
+				return 0;
+		}
+	}
+
 	if (!assert)
 		value |= mask;
 	writel(value, priv->base + CLK_RST_R(reg));
@@ -1802,6 +1809,20 @@ static int rzg2l_cpg_deassert(struct reset_controller_dev *rcdev,
 	return __rzg2l_cpg_assert(rcdev, id, false);
 }
 
+static int rzg2l_cpg_deassert_crit_resets(struct reset_controller_dev *rcdev,
+					  const struct rzg2l_cpg_info *info)
+{
+	int ret;
+
+	for (unsigned int i = 0; i < info->num_crit_resets; i++) {
+		ret = rzg2l_cpg_deassert(rcdev, info->crit_resets[i]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int rzg2l_cpg_reset(struct reset_controller_dev *rcdev,
 			   unsigned long id)
 {
@@ -2051,6 +2072,10 @@ static int __init rzg2l_cpg_probe(struct platform_device *pdev)
 	if (error)
 		return error;
 
+	error = rzg2l_cpg_deassert_crit_resets(&priv->rcdev, info);
+	if (error)
+		return error;
+
 	debugfs_create_file("mstop", 0444, NULL, priv, &rzg2l_mod_clock_mstop_fops);
 	return 0;
 }
@@ -2058,6 +2083,11 @@ static int __init rzg2l_cpg_probe(struct platform_device *pdev)
 static int rzg2l_cpg_resume(struct device *dev)
 {
 	struct rzg2l_cpg_priv *priv = dev_get_drvdata(dev);
+	int ret;
+
+	ret = rzg2l_cpg_deassert_crit_resets(&priv->rcdev, priv->info);
+	if (ret)
+		return ret;
 
 	rzg2l_mod_clock_init_mstop(priv);
 
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 55e815be16c8..af0a003d93f7 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -276,6 +276,9 @@ struct rzg2l_reset {
  * @crit_mod_clks: Array with Module Clock IDs of critical clocks that
  *                 should not be disabled without a knowledgeable driver
  * @num_crit_mod_clks: Number of entries in crit_mod_clks[]
+ * @crit_resets: Array with Reset IDs of critical resets that should not be
+ *               asserted without a knowledgeable driver
+ * @num_crit_resets: Number of entries in crit_resets[]
  * @has_clk_mon_regs: Flag indicating whether the SoC has CLK_MON registers
  */
 struct rzg2l_cpg_info {
@@ -302,6 +305,10 @@ struct rzg2l_cpg_info {
 	const unsigned int *crit_mod_clks;
 	unsigned int num_crit_mod_clks;
 
+	/* Critical Resets that should not be asserted */
+	const unsigned int *crit_resets;
+	unsigned int num_crit_resets;
+
 	bool has_clk_mon_regs;
 };
 
-- 
2.43.0


