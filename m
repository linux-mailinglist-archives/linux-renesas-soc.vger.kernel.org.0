Return-Path: <linux-renesas-soc+bounces-5879-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 971618FD1CC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2024 17:38:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C82FB2AB5C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2024 15:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1854C14D447;
	Wed,  5 Jun 2024 15:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iINa8Zxs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5830F14B968;
	Wed,  5 Jun 2024 15:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717601837; cv=none; b=ffElDPG+bl3rvPrP5DulIAWQNaDrsh2ubuKq9e7kgPM+TtkbRFlaolCyX1/xf/pC6Tyk8VDQtUJD9x1Ss6Rty8KzgA6pz47/lWPu6ktXYISdtmBEI9kTXOsP7tSSfxTGSWLnsSnv2BWGbUwcCbm0ZhnLqkV9f3bYE4ODyphTric=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717601837; c=relaxed/simple;
	bh=W8loeJgPBjnjnkzn24m+LbcwcKGo+/TYQDyUzZ/j8q0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=g+6FZnTM28/CI5pPK2d3Mntdt8dtxBQFDznSbiXoe5G5czrqBbdR9AL+++OAk5ALxrmVxBW59sZw2zL1GmnU7CC/0k2TYcjpMlP4v8actFhLipkMgKnGIr2XB0cfYOuIkV3HzzspyCQn1+YhZ3jBmgwZZfp99tsKuvkdv/ul8J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iINa8Zxs; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-421392b8156so23281135e9.3;
        Wed, 05 Jun 2024 08:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717601834; x=1718206634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lAjezbYFk4kRuwBAyZVCH+a9cPM1rylHv2qjz+E2Bv8=;
        b=iINa8Zxsrck0MG2QiqgCWmkTiZz1BGJLNqCdwa6d6AsmOqiA/+mmAfMtnqpTylpQLz
         VLjK2+reVklx27nCT4873chZZXsWy3dsy3gi1UZa9owJuNFLy/76DUnuTsSCT0BCeGy0
         slQGeFnxnLr7neYB2h1LsfPEhMw0Cd2El9toEDk15wpPpZ0tiyRvSq+lBBHUgcxlT84g
         i5zbOD7UbgZTlCfiqzw9K5A0NDj3gAzYn1BObqLzWIrp/TC3WJT5cOZpEx8IM41BDbZ9
         0O2yEbTi5cVVKjNZkVpDXv6M/eWSlmsqZCeMst2fzKe+nSIgiQnmCmKoP5Di69bGIrw+
         5dDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717601834; x=1718206634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lAjezbYFk4kRuwBAyZVCH+a9cPM1rylHv2qjz+E2Bv8=;
        b=FKziftfzZ9HGmmnfQOq7WyCMseMxV9NEGK5jBlVVUKDwjByYJzN7mKqoMH1VHy2JIT
         LGAv4YenwqwJsolOPmcVzWwGtw0nexqJUKh+bj4STTv7bFj1hlxuro5NGSTHaPck8xot
         l4DPw0nYrs1TIB2/PzfAtOZ5uQh++1F9YYHf6uQtxmcAvMztwEw6mFTWYZyq/ujmYQmQ
         InV7xrOcrVwAhDWYhijdvn4X4CXXxD8cpk1umQufpdTHsAmRGsPEA5ltMY4K3Tj6/88v
         GrH+zG94xkkuvxcgW7V/pSMqPiqj4lZQBzcuI797e7x7GnkzOkSXIJDjRhARWRLaf9wD
         Uwag==
X-Forwarded-Encrypted: i=1; AJvYcCWVG2YDPxjhj3k/sLEMOkR10xn95o4pB75PivUip/fOlEpq+Os9CCu5zTHt8ABf+bkOOpyPBu2LcnaqaeXnbVeTUwg2YHN1yFYWoDvEYGsDS5s=
X-Gm-Message-State: AOJu0YwGZKIP9Lus8OxspPNSGW/5u7SNQi31MIFBALjVkJs9wvY9Y7ay
	ajBpi/BWP+H+322AIqcO1Iln87ovzjWAGJCjXLjkmLlK1xGEZr2n
X-Google-Smtp-Source: AGHT+IGB+Rwwao76RXcektdyMHLa2vpeLrOu5clOBZtUdExzKvl3zDenxBafFf61pEtfzUiDObaYxg==
X-Received: by 2002:a05:600c:3589:b0:418:3eb7:e8c6 with SMTP id 5b1f17b1804b1-421562c24f0mr23479115e9.5.1717601833369;
        Wed, 05 Jun 2024 08:37:13 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421580a94edsm26433685e9.0.2024.06.05.08.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 08:37:12 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RESEND RFC PATCH] reset: Add devm_reset_control_deassert helper
Date: Wed,  5 Jun 2024 16:37:08 +0100
Message-Id: <20240605153708.613610-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

A typical code pattern for reset_control_deassert() call is to call it in
the _probe function and to call reset_control_assert() both from _probe
error path and from _remove function.

Add helper function to replace this bolierplate piece of code. Calling
devm_reset_control_deassert() removes the need for calling
reset_control_assert() both in the probe()'s error path and in the
remove() function.

Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/reset/core.c  | 22 ++++++++++++++++++++++
 include/linux/reset.h |  6 ++++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index dba74e857be6..a2a6eff8e599 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -592,6 +592,28 @@ int reset_control_deassert(struct reset_control *rstc)
 }
 EXPORT_SYMBOL_GPL(reset_control_deassert);
 
+static void reset_control_assert_action(void *rstc)
+{
+	reset_control_assert(rstc);
+}
+
+/**
+ * devm_reset_control_deassert - devres-enabled version of reset_control_deassert()
+ * @dev: device that requests the reset control
+ * @rstc: reset controller
+ */
+int devm_reset_control_deassert(struct device *dev, struct reset_control *rstc)
+{
+	int ret;
+
+	ret = reset_control_deassert(rstc);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(dev, reset_control_assert_action, rstc);
+}
+EXPORT_SYMBOL_GPL(devm_reset_control_deassert);
+
 /**
  * reset_control_bulk_deassert - deasserts the reset lines in reverse order
  * @num_rstcs: number of entries in rstcs array
diff --git a/include/linux/reset.h b/include/linux/reset.h
index 514ddf003efc..e41e752ba098 100644
--- a/include/linux/reset.h
+++ b/include/linux/reset.h
@@ -31,6 +31,7 @@ int reset_control_reset(struct reset_control *rstc);
 int reset_control_rearm(struct reset_control *rstc);
 int reset_control_assert(struct reset_control *rstc);
 int reset_control_deassert(struct reset_control *rstc);
+int devm_reset_control_deassert(struct device *dev, struct reset_control *rstc);
 int reset_control_status(struct reset_control *rstc);
 int reset_control_acquire(struct reset_control *rstc);
 void reset_control_release(struct reset_control *rstc);
@@ -91,6 +92,11 @@ static inline int reset_control_deassert(struct reset_control *rstc)
 	return 0;
 }
 
+static inline int devm_reset_control_deassert(struct device *dev, struct reset_control *rstc)
+{
+	return 0;
+}
+
 static inline int reset_control_status(struct reset_control *rstc)
 {
 	return 0;
-- 
2.34.1


