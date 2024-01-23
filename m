Return-Path: <linux-renesas-soc+bounces-1708-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BA8838F22
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 14:01:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B92E1C24D91
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 13:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 976185FF0E;
	Tue, 23 Jan 2024 12:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="myfLVAq1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D042C5F869
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jan 2024 12:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706014781; cv=none; b=pwlGrTdYLeqMRU0BFYI2gqaiBT122Flj5fWMz/SGJaNtEk6YYVWhD91TngMML4owZhxmYPkOwDVCvB1UNzevu/UGPnT4eoqfkkzBdut/ca0z2Ckz9DVQI14czxy9IVo5s2oUwDG9V6AAQPYqfmFd6O7lMKh6PvrL6t5HNLb1fE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706014781; c=relaxed/simple;
	bh=dRyt6tWlbiKqoIJh66DiSSuXinFPKcVAZdUgI40W4Tc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cVfxx3XmEd5vnf9SjxC8YRS6/ek4YV5Z7jd7SEQcIfRr1qioSYjKewP/cRaXAlY5TIBxy1yF9NxJOQFVVViFlmNlyPr4CKJSoOY6CahDustb2x7qjmNb9qdKnV50aSwgD6GfEGsVGJ3hFLVIrEwXuphKkcz7hIzLy9Mz5SL/7OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=myfLVAq1; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40eac352733so23373755e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jan 2024 04:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706014777; x=1706619577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pkNsgorlOGjO2MgWb/dT6E51SlKpQ9V2ft0OBIasSE=;
        b=myfLVAq1GSzrsIPignzEqKZyx4XfxUBYnJg+wgXt9As14Qg19xDU4hdgR4KmKcaCK4
         lNvIzXFakDO0S+kYB+f8lGMT+XBgMO0ehgbygVQkMW/PXoxbRmj8HRFtohyDZWJRCfiS
         9pkZClJvLLQG7Y6rbwimFZI9scQjX2AipL73F5h6qs6UO/WmV8GrwCuiw/KE0momw09o
         7sGcoXAjAl61c54MI60wrB2RnaJiKp6VisA4e5co9VibeX9VdZ4QnjJEwWbN5WhWwKRi
         NBuGoXbiTAteEr0OZS8BnXr4T80HoiSkLurJuAU+KKq6x81M2WU22Vqjw8x84RN8+0fK
         cjLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706014777; x=1706619577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8pkNsgorlOGjO2MgWb/dT6E51SlKpQ9V2ft0OBIasSE=;
        b=gAZcWzHaq6jdEuA4d3/G0LsmPM7azFtvzJKRzL8ecBgaIgXGkWbQzKpkSqnnOIonem
         wEmqSVDDF5Kudbj/d8wNcgPW0n1DJhDi/39okVdzutLYdc+NtG5oou/NC4Njy606nlBK
         2khUrTlRHQkY0taVd+ETtNd1noNiwjyF8zOF4rdNhW4ZBMhJP+Fl6mSrM1wy2QVnjcZK
         oaSOapcZYjTxaPsX00Z5bY0uc7xHuUE3hDCnepiQYK7PeSfZLW7Losw7n/fVy5e0Qg9I
         z4BxzHhDe3z3fSfgPpK+W+1zA5F6KV+nGujBL8Qw9aUF3coDR9GgevqvQupUcJ5Zffm0
         Uerw==
X-Gm-Message-State: AOJu0Yz+ci9CukPrgEryYkCXZenrbZrxCBsjcScJ9XSEwmQ+/bUZLX1b
	1DgnR5AmSuZh55ZLEJfCqVHnemLFV1I/X/VnY1xWY384XxN+vB3jsBVSRPsWAnQ=
X-Google-Smtp-Source: AGHT+IFH7tBcsGS3WsUDe+n7CUyuFtsX+cq7kxc9uy/KMcmXwHHJNM9zSRkzhzDJxNKStViTBqQnSg==
X-Received: by 2002:a05:600c:1e84:b0:40e:4395:bc4a with SMTP id be4-20020a05600c1e8400b0040e4395bc4amr111242wmb.67.1706014777163;
        Tue, 23 Jan 2024 04:59:37 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.135])
        by smtp.gmail.com with ESMTPSA id s4-20020a05600c45c400b0040e6ff60057sm33655711wmo.48.2024.01.23.04.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 04:59:36 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH net-next v4 04/15] net: ravb: Switch to SYSTEM_SLEEP_PM_OPS()/RUNTIME_PM_OPS() and pm_ptr()
Date: Tue, 23 Jan 2024 14:58:18 +0200
Message-Id: <20240123125829.3970325-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240123125829.3970325-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240123125829.3970325-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

SET_SYSTEM_SLEEP_PM_OPS() and SET_RUNTIME_PM_OPS() are deprecated now
and require __maybe_unused protection against unused function warnings.
The usage of pm_ptr() and SYSTEM_SLEEP_PM_OPS()/RUNTIME_PM_OPS() allows
the compiler to see the functions, thus suppressing the warning. Thus
drop the __maybe_unused markings.

Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- collected tags


 drivers/net/ethernet/renesas/ravb_main.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 65b084778b93..d054d1405cec 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2971,7 +2971,7 @@ static int ravb_wol_restore(struct net_device *ndev)
 	return disable_irq_wake(priv->emac_irq);
 }
 
-static int __maybe_unused ravb_suspend(struct device *dev)
+static int ravb_suspend(struct device *dev)
 {
 	struct net_device *ndev = dev_get_drvdata(dev);
 	struct ravb_private *priv = netdev_priv(ndev);
@@ -2993,7 +2993,7 @@ static int __maybe_unused ravb_suspend(struct device *dev)
 	return ret;
 }
 
-static int __maybe_unused ravb_resume(struct device *dev)
+static int ravb_resume(struct device *dev)
 {
 	struct net_device *ndev = dev_get_drvdata(dev);
 	struct ravb_private *priv = netdev_priv(ndev);
@@ -3052,7 +3052,7 @@ static int __maybe_unused ravb_resume(struct device *dev)
 	return ret;
 }
 
-static int __maybe_unused ravb_runtime_nop(struct device *dev)
+static int ravb_runtime_nop(struct device *dev)
 {
 	/* Runtime PM callback shared between ->runtime_suspend()
 	 * and ->runtime_resume(). Simply returns success.
@@ -3065,8 +3065,8 @@ static int __maybe_unused ravb_runtime_nop(struct device *dev)
 }
 
 static const struct dev_pm_ops ravb_dev_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(ravb_suspend, ravb_resume)
-	SET_RUNTIME_PM_OPS(ravb_runtime_nop, ravb_runtime_nop, NULL)
+	SYSTEM_SLEEP_PM_OPS(ravb_suspend, ravb_resume)
+	RUNTIME_PM_OPS(ravb_runtime_nop, ravb_runtime_nop, NULL)
 };
 
 static struct platform_driver ravb_driver = {
@@ -3074,7 +3074,7 @@ static struct platform_driver ravb_driver = {
 	.remove_new	= ravb_remove,
 	.driver = {
 		.name	= "ravb",
-		.pm	= &ravb_dev_pm_ops,
+		.pm	= pm_ptr(&ravb_dev_pm_ops),
 		.of_match_table = ravb_match_table,
 	},
 };
-- 
2.39.2


