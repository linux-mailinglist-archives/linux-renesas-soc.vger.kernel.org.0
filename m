Return-Path: <linux-renesas-soc+bounces-11187-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 223FC9EB7C7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 18:14:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34EDB164D3B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 17:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 130F7234963;
	Tue, 10 Dec 2024 17:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="JqwHzBsB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BFD23236F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 17:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733850644; cv=none; b=kpjGL7htwSDnYSKAAgMMrXmVNBvr25Q1klsBU+K/OvTIgWzdW9+C/rlT0BHRuFrAY2cu2srJVK9sJW4KQMOAko44bN90uC9GOzVKmQBaELXsDyOFSJsRSwxUVGxxwanrZ8FprMAZn1S54ZQHmorIvsa1moV3KeMewCHNThfXbZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733850644; c=relaxed/simple;
	bh=QfMAQ3ObJOM7gWSlinrrpwhjt1hderzxfmdZZzAXUok=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VzpivkZW7JVXP4TmovMN9y4KWbczBVk/q1NlW0xOQBDvXcW4vq66KqMxYYVo8re3nfAbYW7rPHIvZSwbog6RM7ZUCFMPsXBzJB4Lcrv28ta/GDnNa5hNc3I2r8g6NRb6JfMf4p1GzICy5Oc3hNE1Ud+echEH+WH3O9WjEKrweQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=JqwHzBsB; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d3e9f60bf4so4671036a12.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 09:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850641; x=1734455441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UysEDL+tYPOXb/CerEK2e/yd8/mnBKQO5ExCdaAA4A=;
        b=JqwHzBsBEtd6G7nP26tKtUetS/eenZbMMrUCRVLkWx99zAOMVKHQFyp8iaVQCf8OyC
         pK0H6wj5Qz2eWGxAGNMG82okQscg8tl5fVDnO55YWDbGhrh/K1+YOykOomQREU8H9yHs
         PTSEEQV+ewrbVQFglz+GYna9/XyO6nmPvpQmYCHLs9smQM+ayP85EAhIQlNgmOM2oGSY
         EUUVRaFxjvpyaDHkAdpcrzmXnvOi+QwqCiU0SxGsaOnTJ1xh7gN9LN+ugcGDiIKJap8t
         LRbpYIWSPUtH8TcB1Ly1vA2Bk6FHKxqZnE1DZBOe0TyasfNUoUm1xQ31sRez2CrvhUGB
         hrPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850641; x=1734455441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6UysEDL+tYPOXb/CerEK2e/yd8/mnBKQO5ExCdaAA4A=;
        b=oxaCAjYxq79anJXtwJvk37t1iYSa2VcUxMYLxrULYQGO0c1jsHSP/3smx+R3wnEDSz
         akDPGMCE+kFz6fwCWaZeznoNQHEbA91BLNdyEKdjmX33jeLEQnh+Vyh7J75Q+Sx0H2Td
         7jCv8iwTRJFzrT/3CM4W6sgdkMH7xpN4Lm5SV3lTfyp1NCAnrAqy7/ncVfeB8E5cWZGx
         tu6i210+18O0p1HtJphXcZeZrGKnS7I3/7yfbOCW4ZQLlQ+UfWSptlUgrV3nIUUknFba
         pTlbDMz1oR67wDx3hganX8juELxwf4ueOj3akPfewDXxq7gvGJFASfQHszeRh3nPBcaZ
         IW/g==
X-Forwarded-Encrypted: i=1; AJvYcCU7N8kLOCUENfCkgH+JSadXwdz/afpG7uzDnEw5IwWs+Q+OzSHAg+Q5m86TUXjFXXqsc2eBgeaXP1k/Nk9oShZQoA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlwby1rsDPZifs/K97k1ktn/1eNztYcecVNtujdSH9TOCyBNkD
	EoWCxNEsvSzD/htOcWoBEu/w0xodInOToUBUgbBqH2dNsmVO7yS9g5xWO0qhtMA=
X-Gm-Gg: ASbGncsILbMnjuQppV1F8cENXreSxcTl7io3ySzoz0SBXs53el8inmBY59W/ouwObG7
	OZFfUnrUSFuhIBIrwPDOQIhXXyweH5mDzNS/NX/HTvJLmcx/aF2mWypocsrLp51NzNhK6PuU3tn
	7cXRQXTqTHM/+fGcflSktcrje2PXGkF4o7+keILeVHFzyjrnPVfLKwyKhYuJ8TjSzY2tn1zO3pu
	D+/0+5Wjmj4Du6Zr1ejkOqvI4QBlIZ/n4lJLw1aotskxlZuJdrq6Rw2KiqiZme8j8V+iK2Eyin8
	C+gR3tSy
X-Google-Smtp-Source: AGHT+IGDKksFRS7v8EJ79Qo0q8lVB55Bo0RkH6EDk6sqVxrrszOEC3HW/n36JzbvJ+iqRQS48HVTZQ==
X-Received: by 2002:a05:6402:35d1:b0:5d0:a80d:bce9 with SMTP id 4fb4d7f45d1cf-5d3be71c114mr15442107a12.20.1733850640930;
        Tue, 10 Dec 2024 09:10:40 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:40 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 15/24] ASoC: renesas: rz-ssi: Add runtime PM support
Date: Tue, 10 Dec 2024 19:09:44 +0200
Message-Id: <20241210170953.2936724-16-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add runtime PM support to the ssi driver. This assert/de-assert the
reset lines on runtime suspend/resume. Along with it the de-assertion of
the reset line from probe function was removed as it is not necessary
anymore.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

Changes in v3:
- s/sh/renesas in patch title

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index eebf2d647ef2..34c2e22b5a67 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -1139,14 +1139,13 @@ static int rz_ssi_probe(struct platform_device *pdev)
 		goto err_release_dma_chs;
 	}
 
-	reset_control_deassert(ssi->rstc);
 	/* Default 0 for power saving. Can be overridden via sysfs. */
 	pm_runtime_set_autosuspend_delay(dev, 0);
 	pm_runtime_use_autosuspend(dev);
 	ret = devm_pm_runtime_enable(dev);
 	if (ret < 0) {
 		dev_err(dev, "Failed to enable runtime PM!\n");
-		goto err_reset;
+		goto err_release_dma_chs;
 	}
 
 	ret = devm_snd_soc_register_component(dev, &rz_ssi_soc_component,
@@ -1154,13 +1153,11 @@ static int rz_ssi_probe(struct platform_device *pdev)
 					      ARRAY_SIZE(rz_ssi_soc_dai));
 	if (ret < 0) {
 		dev_err(dev, "failed to register snd component\n");
-		goto err_reset;
+		goto err_release_dma_chs;
 	}
 
 	return 0;
 
-err_reset:
-	reset_control_assert(ssi->rstc);
 err_release_dma_chs:
 	rz_ssi_release_dma_channels(ssi);
 
@@ -1182,10 +1179,29 @@ static const struct of_device_id rz_ssi_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, rz_ssi_of_match);
 
+static int rz_ssi_runtime_suspend(struct device *dev)
+{
+	struct rz_ssi_priv *ssi = dev_get_drvdata(dev);
+
+	return reset_control_assert(ssi->rstc);
+}
+
+static int rz_ssi_runtime_resume(struct device *dev)
+{
+	struct rz_ssi_priv *ssi = dev_get_drvdata(dev);
+
+	return reset_control_deassert(ssi->rstc);
+}
+
+static const struct dev_pm_ops rz_ssi_pm_ops = {
+	RUNTIME_PM_OPS(rz_ssi_runtime_suspend, rz_ssi_runtime_resume, NULL)
+};
+
 static struct platform_driver rz_ssi_driver = {
 	.driver	= {
 		.name	= "rz-ssi-pcm-audio",
 		.of_match_table = rz_ssi_of_match,
+		.pm = pm_ptr(&rz_ssi_pm_ops),
 	},
 	.probe		= rz_ssi_probe,
 	.remove		= rz_ssi_remove,
-- 
2.39.2


