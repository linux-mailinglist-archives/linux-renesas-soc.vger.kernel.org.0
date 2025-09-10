Return-Path: <linux-renesas-soc+bounces-21721-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77164B518C4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 16:05:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F215564426
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 14:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD41032A3D8;
	Wed, 10 Sep 2025 14:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="GWuVcwdf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA8C326D5C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Sep 2025 14:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757513014; cv=none; b=kbGts1Klyg9CxMjl5b0LioNiTrICLDsFs4497k0B3SRFsuF8Pa39B+QgKfa0wW16CkDgncxaEWvQA/2wz/x3rWzlx7jWH+9216UbibcLrW1yqL5tySZ7ovAmHNd3yhue0x1z4Usuf8h/X3i44lBbZOTSyMKCM7t9zuwX3LQxUlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757513014; c=relaxed/simple;
	bh=ZAVAGITvUw55XhUkxrz8oUWZkXF27JoqfN9DE8oUYOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A1byUlXqM5zvcWg0cZ6ofPFlomuHhhtQxb2dx2GczBr9Vglep6hrPrTHBQlWnTh6dQfsG/u/i12ybOhvw/AKgxtg+toAuDsQxBzKrYuzaprmSMwAuog/XOaoTMV5Xm6jD56ZfLSu3U4xBSRTOcRZcl9JKfXkhjSp+41z9frmg8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=GWuVcwdf; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45dd5e24d16so50633775e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Sep 2025 07:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757513011; x=1758117811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jAGLW0vGkRdepqvJWWr00In33Dyb9aFFqzfsMejvGVw=;
        b=GWuVcwdf2tn93Ctt+wzjh2pKjKzjJrQ6cI9e3kS9NuUyKC8IdVYaBLa1IRu1cuEuBm
         0I7NCa2AQx224OjUq/vvXhDzmm2aEjCs4uhUyCjvPbJ2yGHQvVLtpX5NI18rjHEBWI8S
         z1dC+ojbAYmV5vhfdJP6dejBLU7GzQ0bImWreSd6RUdZZwEQfJjzkIxx5P79JJQL05ar
         do9TYQekoRB654G8AmgLECgozbh0oWpsMn2OnRW09Jzfw4yfPsatoJJE/wK1rW53K10W
         /K6uhWBZ4L2VVz2ckkXNxaZy1JuaoRf4VaY10bkfJ2J7evE/IWs6p9J1vI8OZTLeQDEk
         wH5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757513011; x=1758117811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jAGLW0vGkRdepqvJWWr00In33Dyb9aFFqzfsMejvGVw=;
        b=gggKZnj8dIG6nnSA2/+AYkEG2Z8zXqJrth5WhbnNb2atYvWe7t7B55TN/KGy3eyVGa
         0K4Gj+DtXCzJV4FLAH//2O/fqKtRVhAfnEV/c/xYZHb4YVHy4d/i1DxeaHqYNl5bThtL
         rLNlyxUOAjpnE6kOoN1EdmqSQVVDHcEJbk5ml3BsuvsvTqLg9k4jsV1fp6e2gDZk8K3y
         I8xMaJT7Cie+XBhv4PDgNDK9g/ir2jeLLD0LoR3LRCzgwbUh/fjCBMxBf8TjH2/kFbKI
         eTeE0bwB8tuMSgGIN8v/tvnP/ZkVHrvqiLmBYCth54V4bNHfMBS5fSG1TUFQxaQ0e6nM
         EZPg==
X-Forwarded-Encrypted: i=1; AJvYcCUvMXxGKxKTcFGPiFZhaWSaehP47r1b29V/2adGRD0Qu+lkMizHE07h8ZAdC3j92yzcB8j3eFVO0/3GW042/cEYvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHECOsNgdftdnqWxVeltmzwqzwkky/PSnALqFF8nxpaLLTskSt
	seuBC8/6hJdcexyfhYYme/LHyyXcQXh8FjTLOcmupsD7PTYuqyxdph211q71ieUyR9o=
X-Gm-Gg: ASbGncuBzPxUfavQLkIKOn6UvriCqRB8N5DZz3p/vao1dpgXiiWIGAjcttD7XOVjdwC
	nY8+FzWmrrO/qYreS0O75CYaTQnrifNkDKOU08UjGlIQJB8BRomaZbmX2GD5w7KUAsaLSrBMgYJ
	x1i6x1l2CuGvIBMqx+9M8/6WnSPfqiG0KzVjo8Z0i+SGlTE2+l/+u6PfoMbIJztrkQxpZJ0lt2F
	mfVDaHo0X2XpjSp3ERwVQKPPaH4cDNcXUnmit3eE/0OLCerEnh1kLyVzLc74UsO5oZ/Tkrh/jSl
	wOuWrBVY6u9goNp1U2uUSTh5zQL7xFCTTwH5sk7TBqApUKwdRRyQhGI6uWjUacJtKBg0cs23Z41
	hYXVMZRP4ojWNwOKraFz/R8b7uzAMp1rq9PmWBSzVse8Xjfs1V/okU7HKwP/lePD59mMKLeIdJw
	==
X-Google-Smtp-Source: AGHT+IEowrawYHNa29PlMo3qPWXJ3OP72+rWfZLK8gTMTF1VH5JFTzYqdz15w3e8YqJzXojdc6C1CA==
X-Received: by 2002:a05:600c:1d16:b0:453:2066:4a26 with SMTP id 5b1f17b1804b1-45dddec9927mr191640485e9.16.1757513010776;
        Wed, 10 Sep 2025 07:03:30 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df804bce3sm29523875e9.0.2025.09.10.07.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 07:03:30 -0700 (PDT)
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
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v6 5/7] reset: rzg2l-usbphy-ctrl: Add support for RZ/G3S SoC
Date: Wed, 10 Sep 2025 17:03:03 +0300
Message-ID: <20250910140305.541961-6-claudiu.beznea.uj@bp.renesas.com>
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas RZ/G3S SoC USB PHY HW block receives as input the USB PWRRDY
signal from the system controller. Add support for the Renesas RZ/G3S SoC.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v6:
- collected tags

Changes in v5:
- none

Changes in v4:
- none

Changes in v3:
- none; this patch is new

 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index c58bf19993c1..a7fbf5c50940 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -108,6 +108,10 @@ static int rzg2l_usbphy_ctrl_status(struct reset_controller_dev *rcdev,
 
 static const struct of_device_id rzg2l_usbphy_ctrl_match_table[] = {
 	{ .compatible = "renesas,rzg2l-usbphy-ctrl" },
+	{
+		.compatible = "renesas,r9a08g045-usbphy-ctrl",
+		.data = (void *)RZG2L_USBPHY_CTRL_PWRRDY
+	},
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rzg2l_usbphy_ctrl_match_table);
-- 
2.43.0


