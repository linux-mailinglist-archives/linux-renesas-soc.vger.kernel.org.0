Return-Path: <linux-renesas-soc+bounces-21718-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBF5B518B9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 16:03:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7EE47A7451
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 14:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CD31322A22;
	Wed, 10 Sep 2025 14:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="JKnkXOhM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18126307AC7
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Sep 2025 14:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757513009; cv=none; b=pDEWVbaOoV4hN9M5p5kjokXs8yz6TzcT1i61lExM22PbVCB4usHzPohJUQj+rX0LTCtNcr4KNd49b7BsnDYWopw0ze87MtogVCK1PvqcxqHdt5hppgXv9TlbzrDUPa6DfGpxIePQVBm8acwmlgkDEFBllz2V1amdlHrRuKJuuH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757513009; c=relaxed/simple;
	bh=xnkO2/ugdWW1AEEoC5uQKPmEa+cWP3HwT2TacT+rR48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kCZk5S0e5KPWSqIG1goR3R/S3iuhKe6Wxx0yze9e0cyDg8+cQ4xas+ltkMRBD2YX29SZHl4oQy7hFo2TSWO3x9GGZJfCzUS8oX1qUosmcBeagTD/IVktCtvVKe0mFvCWzfQYyZX1NwfRDQ6bK2bT/eaB0tAl8iU6qf/T9IC/kXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=JKnkXOhM; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45ddc7d5731so29875205e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Sep 2025 07:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757513005; x=1758117805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jkyh4Dhlw28CLMdRTkOh/1iBArvWo9DTQbXvmwtecM0=;
        b=JKnkXOhMNnxwxIP9nKcLBcZNkcvPvEGLHKwtu+ZYCERoXYtI9a8Y9RR/7J/ApWKrd6
         zMxmF9DyXp0XyNVXrvUSVapRBF7Uxw82daTbYvdh/DoGdEgVVrn1ITIZlPNULTizWGGO
         GF+Ru7H44rVh7Fvch/OpeOgk5yIE+m7jcrxWbXcZZklOdDcnkVbkzsr9t+W7p/eVWdDQ
         MUy3CRPO+UazZWwy/CgwJRqVKlMYgmyMrll0GOrO8OhQtNLTYPQp15Mh2cdIVazHbLzM
         MWo1Ioe+vOm+yoRL+lzqdaWNH0wBw7uFObJGjpCPGHA5ezQW1M0SkRxKp7PsQdt/7B9E
         AF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757513005; x=1758117805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jkyh4Dhlw28CLMdRTkOh/1iBArvWo9DTQbXvmwtecM0=;
        b=T1y/hRklXeJUm9gxpCDr7uX4a7Or8EccbuFGRFtRe1fPmcJxJVFNy485cc4zL6uTso
         3zZctnUuhK8TKoQeKABOJThgRiZ/dPbn/VmoHplSQcCAsvD7kF9X1cxirGCiCnVgiWd1
         1vcq4yh9r6ih8AhaHGcNp0PTt5EIlFkwQUfwCc4sU8DAElziNFep90SV2hZFOGjJEQeQ
         6Teh4sMklNtrM4fuN7WfOYgcBJqQlAMRRfSYCshdrJV5ea70/matkSlt05h3RDY/D09r
         XLy1mUvdcOGdVQ9NyXmg2HoawyUh3t6UBFXvQsvNLOFCpYWALupPdHo2gqsKtssHHxSI
         J7Tg==
X-Forwarded-Encrypted: i=1; AJvYcCUBfGZHNSk/tFpaAQX65NGPuD+0q2xfUakJNw4rhFp/2rrRczw4zwDKZNs9Y5w+VnjFGKjg/VV9emlwvsxBX/6xaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx0mFc4Egx6infdNpgJ8FYXw0yoRxYXjzrHWihpELFsBA9IaGg
	UZlIbAe5gegkgSLKQxSaGvezdkiLaYVxhrNZISKUW+aSbYxI5wUvpXe1pjhO07cNX6IfAR8mFqx
	RugSs
X-Gm-Gg: ASbGncvii67OZEA2MYVakjlAAI9D5CCvc+6oHMq74uKt+kSuu08F3nz+OY9KE0FAEBJ
	qj0PSL8uCCiR6yEb9FbHBE2OJ9O/EIFqOMRc4bUaFVGogvtvASA5AdK+ze3fK+TCVQ1BA4+cfEO
	lNgSrRD1Gof9Ka3m3l5GTyz5DxzYOsRNcCan/FSR+bvol2PhSkYDe46ckSmooEU3P7HMbz6l+SA
	Ec6mCXrst8KHEp9qfcMHSrDts/lRFnKPMzQq9k39a3zu0QcrVxdf898zzwTMOt/Hh/oBSW84YE+
	SC+daoe+X1F1USZXS6hP1sn3c6lHw2YctP7N5EV8NSOh/Y8s5LoTNhiIWV0tAPnQa+VFCZJ5O6R
	8b7aOhREayP8lZS0mfLpXVSgO8ectyMW+Ng6kuoNj3tGtOiOLctWw
X-Google-Smtp-Source: AGHT+IFSs4+XILv/ozu1ePkTUArRSwLZOgfXjnuMdSXTBp3f8FpU0Yp9uKqcu+HOub89ber0vORyLw==
X-Received: by 2002:a05:600c:19c8:b0:45b:7ce0:fb98 with SMTP id 5b1f17b1804b1-45ddde866c8mr148790095e9.5.1757513005134;
        Wed, 10 Sep 2025 07:03:25 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df804bce3sm29523875e9.0.2025.09.10.07.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 07:03:24 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	yoshihiro.shimoda.uh@renesas.com,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v6 2/7] phy: renesas: rcar-gen3-usb2: Fix an error handling path in rcar_gen3_phy_usb2_probe()
Date: Wed, 10 Sep 2025 17:03:00 +0300
Message-ID: <20250910140305.541961-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250910140305.541961-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250910140305.541961-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If an error occurs after the reset_control_deassert(),
reset_control_assert() must be called, as already done in the remove
function.

Use devm_add_action_or_reset() to add the missing call and simplify the
.remove() function accordingly.

While at it, drop struct rcar_gen3_chan::rstc as it is not used aymore.

Fixes: 4eae16375357 ("phy: renesas: rcar-gen3-usb2: Add support to initialize the bus")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
[claudiu.beznea: removed "struct reset_control *rstc = data;" from
 rcar_gen3_reset_assert(), dropped struct rcar_gen3_chan::rstc]
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v6:
- dropped struct rcar_gen3_chan::rstc; updated the patch description
  to reflect it
- collected tags

Changes in v5:
- none

Changes in v4:
- none

Changes in v3:
- collected tags

Changes in v2:
- none; this patch is new; re-spinned the Christophe's work at
  https://lore.kernel.org/all/TYCPR01MB113329930BA5E2149C9BE2A1986672@TYCPR01MB11332.jpnprd01.prod.outlook.com/


 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 3f6b480e1092..a38ead7c8055 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -134,7 +134,6 @@ struct rcar_gen3_chan {
 	struct extcon_dev *extcon;
 	struct rcar_gen3_phy rphys[NUM_OF_PHYS];
 	struct regulator *vbus;
-	struct reset_control *rstc;
 	struct work_struct work;
 	spinlock_t lock;	/* protects access to hardware and driver data structure. */
 	enum usb_dr_mode dr_mode;
@@ -771,21 +770,31 @@ static enum usb_dr_mode rcar_gen3_get_dr_mode(struct device_node *np)
 	return candidate;
 }
 
+static void rcar_gen3_reset_assert(void *data)
+{
+	reset_control_assert(data);
+}
+
 static int rcar_gen3_phy_usb2_init_bus(struct rcar_gen3_chan *channel)
 {
 	struct device *dev = channel->dev;
+	struct reset_control *rstc;
 	int ret;
 	u32 val;
 
-	channel->rstc = devm_reset_control_array_get_shared(dev);
-	if (IS_ERR(channel->rstc))
-		return PTR_ERR(channel->rstc);
+	rstc = devm_reset_control_array_get_shared(dev);
+	if (IS_ERR(rstc))
+		return PTR_ERR(rstc);
 
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret)
 		return ret;
 
-	ret = reset_control_deassert(channel->rstc);
+	ret = reset_control_deassert(rstc);
+	if (ret)
+		goto rpm_put;
+
+	ret = devm_add_action_or_reset(dev, rcar_gen3_reset_assert, rstc);
 	if (ret)
 		goto rpm_put;
 
@@ -924,7 +933,6 @@ static void rcar_gen3_phy_usb2_remove(struct platform_device *pdev)
 	if (channel->is_otg_channel)
 		device_remove_file(&pdev->dev, &dev_attr_role);
 
-	reset_control_assert(channel->rstc);
 	pm_runtime_disable(&pdev->dev);
 };
 
-- 
2.43.0


