Return-Path: <linux-renesas-soc+bounces-34691-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kVx0Br/TSGoguQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34691-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 11:34:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CF270744D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 11:34:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=BXaZoQUy;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34691-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34691-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 74392300B084
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jul 2026 09:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0FEE3A7D82;
	Sat,  4 Jul 2026 09:34:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A854A3A6B8A
	for <linux-renesas-soc@vger.kernel.org>; Sat,  4 Jul 2026 09:34:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783157681; cv=none; b=f8l7GtZlrhEjk+WsPgO9udT9LotWktxq3NVLszvoZ22BJK4/df0VgwvJMiGcTrYcne9ayikg8Lp7zx0CQJY2NDlQi/HmSpvFjjRpJVKuyitSjIGlRxQ0rCxLEIOoGoX4vAVjnzFnoCnf30SuZV5sjMdhy/ICeDzR6/p8PKmVAVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783157681; c=relaxed/simple;
	bh=jN0UnNq/IeYovTkauDK4Z5qBeFheq3mv+q6VLcBny+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T1CD85S/dJgOpma/4KbAqzgRulbJfx6AAXkEDy1OWYzJFsRpun8T2IOknNatLsNxik8wc9wPRCDek72zk3rGxX9aLYEdL5FHARxeJ/xg2uCq/QCej/jJodG4UJCnUS111qSzY711Wb1wjp5ZcX1w9SEGRlG0zUCJDNiVBwDKg/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXaZoQUy; arc=none smtp.client-ip=209.85.128.53
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so11496335e9.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 04 Jul 2026 02:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783157678; x=1783762478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iYVZTDuvtPuLzEvWGqRrMFm4g3sqVFgVTtW213vAnDE=;
        b=BXaZoQUyUSMKPXd+D12oio6ftC/D4ZF4TCZXK+VtCSS8/WTSN34g3gGBbYWLAQBMk7
         K7l0PjFuEMNGBlyV7cox+/b475kTOspa0Tx7bn9qUWhOB9jVkLW2tVmXI9jJcvLPVs9z
         2lRScPTe3UYf0EQ99tS7Il1jqwZHYpyg3hTPpO7lUozafCW9hjHK7jSnchKPP3YBUPH4
         jpT2iDqGkx5XjskGL886JGxmtq6WRiVCjprkrMPwVcNuHEGPbauLdUWK6rhgqLrzANOV
         ZDyvymsjZ9i3zE6svSb9VC5Vx7j636SEtrBayrLpEwCvP0drmw8sFsczIrltr66mqSUJ
         dxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783157678; x=1783762478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iYVZTDuvtPuLzEvWGqRrMFm4g3sqVFgVTtW213vAnDE=;
        b=Tc39XIxSXFpKJUK+6ypNNJElqkfnfZVBSuwZFMLEjulHIlyArVhlQCV+X7g9xQnuDQ
         s2q6grOL4ZlG0G3GZj3F7FMB4LjatuM8y0MpaJxO5+kmvN/lisk8WNphvRnGjROkSV2G
         cCzkS6gG/AOVYBgGymywgvCccqySzHE2SiJONjdJHHRM4zmc3MW8/v0Feil/AHzvBI+X
         m7lGXlWsDJu/xnyCANAkkDKIIOvgLZj41rUB9dHsDIzwa+7znhXuw7YUxkeQ0FW64hHJ
         4+rPHO6jJgQTV2FYhxh7eRVy//cZ1TOiitMJXYLVtSnWqya+DPR9FAj0xLx54II8OzBl
         oktg==
X-Forwarded-Encrypted: i=1; AFNElJ+EuNJjyLCS9n1TPqz7ptpZyZZSjprkkE5xqmEJsIR0gyXuA5bIYEDiLTfugB/Z0LrFCi3ftwAaJR7EUo8rvrLCEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKI2GLKvyAJUr4fQ2uUPWEOBjOp8ecAsx7miZHwraS/7gfqEvr
	njFH8f6Z5EyUNLH7U4vehi1rFvtrUYq4I+y6ajFWVuYUhvDB251u4NdI
X-Gm-Gg: AfdE7cnq0wHDKgxXfyXYETm7Zv66sb1JGx77HJX2SdMlKxm/N7xlgct+XMgiCNXr35m
	wnRwxgtf77kuRUDdQJNVsiiHTq6vN9HBAiX5okmCVRKXFXclrSSIefVo6aD+I+LnRKMp16N8D/E
	bQbijTWKNmu2J7zfD+44dPN/7ddGM3fM7ChdbnQKu60gQ4BDgsILg4jXGZHWUKilck5mtD3vd/d
	hasOgYe6fEjgqTIuIuvOcg/iRN/MdIzSJLuT71pGQBn68aCyCULOi6iE/CmjVera8EADahKRR5V
	uAI+UAOeKrEpnyjoMKPSDHhOYKEaFGvUpKi03WPkamyT2ZNXnzmyVDYkXgaWjzA+62wL3VFvAF3
	9NRLnOqKFibZbXFlb0sTKnarmvHBAJt4LRJQpksMYc2HP0QWe0kZvqNVcgl/xt7xJ5jB2uMFeY7
	NpJRnjKXub1sa7Vop5zcjz
X-Received: by 2002:a05:600c:a213:b0:493:b962:4abe with SMTP id 5b1f17b1804b1-493d11fb898mr18527475e9.36.1783157677924;
        Sat, 04 Jul 2026 02:34:37 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:8c5b:5b11:f6a5:9bc9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce040b4sm153180235e9.10.2026.07.04.02.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 02:34:37 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 05/16] drm: renesas: rzg2l_mipi_dsi: Add support for DSI PWRRDY
Date: Sat,  4 Jul 2026 10:34:15 +0100
Message-ID: <20260704093433.273672-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260704093433.273672-1-biju.das.jz@bp.renesas.com>
References: <20260704093433.273672-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_TO(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34691-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:biju.das.jz@bp.renesas.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:dri-devel@lists.freedesktop.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,bp.renesas.com,gmail.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,vger.kernel.org:from_smtp,renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 44CF270744D

From: Biju Das <biju.das.jz@bp.renesas.com>

The register for controlling power to the DSI region is in the SYSC
(System Controller) block. Add support for controlling the DSI PWRRDY
signal so the driver can efficiently manage power to the DSI region.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 180384c10264..8bd664aa69ac 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -13,11 +13,13 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/math.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/units.h>
@@ -54,6 +56,7 @@ struct rzg2l_mipi_dsi_hw_info {
 		const u8 *table;
 		const u8 table_size;
 	} cpg_plldsi;
+	const struct reg_field *syscon_field;
 	const struct rzg2l_mipi_dsi_timings *dsi_global_timings;
 	unsigned int num_dsi_global_timings;
 	u32 phy_reg_offset;
@@ -87,6 +90,8 @@ struct rzg2l_mipi_dsi {
 	struct clk *vclk;
 	struct clk *lpclk;
 
+	struct regmap_field *pwrrdy;
+
 	enum mipi_dsi_pixel_format format;
 	unsigned int num_data_lanes;
 	unsigned int lanes;
@@ -1396,6 +1401,53 @@ static const struct dev_pm_ops rzg2l_mipi_pm_ops = {
  * Probe & Remove
  */
 
+static int rzg2l_mipi_dsi_set_pwrrdy(struct rzg2l_mipi_dsi *dsi, bool power_on)
+{
+	u32 val, mask;
+
+	mask = BIT(dsi->info->syscon_field->msb);
+	val = power_on ? 0 : mask;
+
+	return regmap_field_update_bits(dsi->pwrrdy, mask, val);
+}
+
+static void rzg2l_mipi_dsi_pwrrdy_off(void *data)
+{
+	rzg2l_mipi_dsi_set_pwrrdy(data, false);
+}
+
+static int rzg2l_mipi_dsi_pwrrdy_init(struct rzg2l_mipi_dsi *dsi)
+{
+	struct regmap *regmap;
+	u32 args[2];
+	int ret;
+
+	if (!dsi->info->syscon_field)
+		return 0;
+
+	regmap = syscon_regmap_lookup_by_phandle_args(dsi->dev->of_node,
+						      "renesas,sysc-pwrrdy",
+						     ARRAY_SIZE(args), args);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	if (args[0] != dsi->info->syscon_field->reg)
+		return -EINVAL;
+
+	if (args[1] != BIT(dsi->info->syscon_field->msb))
+		return -EINVAL;
+
+	dsi->pwrrdy = devm_regmap_field_alloc(dsi->dev, regmap, *dsi->info->syscon_field);
+	if (IS_ERR(dsi->pwrrdy))
+		return PTR_ERR(dsi->pwrrdy);
+
+	ret = rzg2l_mipi_dsi_set_pwrrdy(dsi, true);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(dsi->dev, rzg2l_mipi_dsi_pwrrdy_off, dsi);
+}
+
 static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 {
 	unsigned int num_data_lanes;
@@ -1424,6 +1476,10 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->mmio))
 		return PTR_ERR(dsi->mmio);
 
+	ret = rzg2l_mipi_dsi_pwrrdy_init(dsi);
+	if (ret)
+		return ret;
+
 	dsi->vclk = devm_clk_get(dsi->dev, "vclk");
 	if (IS_ERR(dsi->vclk))
 		return PTR_ERR(dsi->vclk);
-- 
2.43.0


