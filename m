Return-Path: <linux-renesas-soc+bounces-1584-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9131B82DC6A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jan 2024 16:35:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97A2E1C21CFE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jan 2024 15:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87DE217758;
	Mon, 15 Jan 2024 15:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="TGBmuxBA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C09317740
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jan 2024 15:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40e67e90d5aso29231565e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jan 2024 07:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1705332908; x=1705937708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7sXP2wWN7OS4lxiu3tRx0xrGyfyR6bYdV+7zNUsquuY=;
        b=TGBmuxBAZl8Vp63Enop9B5lCqjpcckTKcw/1wJQ59Cs6qHeJRXeYIv7ZCn4tiiVMCm
         Xc2J9hbKtaS81RmiQQKvfwz/yij2KD3khaBog//GHWrazKSoP714yGI4SmPgKqflThKf
         iQYZxsYNzoqfzcWh9Nwx3yDpUOSvvL8scf1SeFNxMc99G8tLI44A5MXhKuDO2FG8v8V7
         rnBxGSRgAD0DPZxTyfUaXtCyuCH4jKsI/srvY5GvSlqdvBagQzhWWaDS7L/KY76PFbIf
         pCR/X4pg9qJ78dR4SrFZ2io8G1Nr4IauVSd87RLXyRfxguwP18km/gnPnKk82gdWMW7W
         lPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705332908; x=1705937708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7sXP2wWN7OS4lxiu3tRx0xrGyfyR6bYdV+7zNUsquuY=;
        b=hssNqaPTpE2/Ezol8i6jcryA3zOa+S/i/TfojFekBHy10II0Obd4vi+cFTldmflh5b
         DsTRjsnSaK+9wQCcKyxzRFXqtfKxIf5YpYsbnUGNFMvl4uYtx05JKI0+2/0sxJUY+Yk2
         dHXBW+zYbuibl7EhDD5uNpAz1EM72duLJ8crwnrgkpYWewUzuba1pUziiPhFAWBrNi82
         5L/z1v3DIc+C/4VL4wRM29g6hjerhVuVjkPlHTo8hGbjurliGW8lKJOrQIQAHwIEuRzr
         C5vlcI/ikp4LyAF/AsYppLlxC8o9KIftLyxQuGXTDD+o2WO1bnxSlmGwVZA9vlHvXbTS
         Htug==
X-Gm-Message-State: AOJu0YwZ7Ydax38s3ZLC9/HJObADFe/6DoBfP2JwBd2e8fQEc+qQenxV
	havbs4Ksjr2+VwXQz/uGmn0sHagGBUd4kA==
X-Google-Smtp-Source: AGHT+IGzatJ/7hZOzre8B/o78msUnDuMXcCh6wtybHE/L06ZrvWzCB2OANnn2yShig0nnWnnUXjO1w==
X-Received: by 2002:a05:600c:46d4:b0:40c:4904:bb72 with SMTP id q20-20020a05600c46d400b0040c4904bb72mr3013214wmo.18.1705332908291;
        Mon, 15 Jan 2024 07:35:08 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.46])
        by smtp.gmail.com with ESMTPSA id p31-20020a05600c1d9f00b0040e6ea6d2d0sm476627wms.24.2024.01.15.07.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 07:35:07 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH] pinctrl: renesas: rzg2l: Fix locking in rzg2l_dt_subnode_to_map()
Date: Mon, 15 Jan 2024 17:34:53 +0200
Message-Id: <20240115153453.99226-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Commit d3aaa7203a17 ("pinctrl: renesas: rzg2l: Add pin configuration
support for pinmux groups") introduced the possibility to parse pin
configuration for pinmux groups. It did that by calling
rzg2l_map_add_config() at the end of rzg2l_dt_subnode_to_map() and
jumping to the remove_group label in case rzg2l_map_add_config() failed.
But if that happens, the mutex will already be unlocked, thus this it will
lead to double mutex unlock operation. To fix this move the
rzg2l_map_add_config() call just after all the name argument is ready and
before the mutex is locked. There is no harm in doing this, as this only
parses the data from device tree that will be further processed by
pinctrl core code.

Fixes: d3aaa7203a17 ("pinctrl: renesas: rzg2l: Add pin configuration support for pinmux groups")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 80fb5011c7bb..01ef6921cb35 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -447,6 +447,16 @@ static int rzg2l_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 		name = np->name;
 	}
 
+	if (num_configs) {
+		ret = rzg2l_map_add_config(&maps[idx], name,
+					   PIN_MAP_TYPE_CONFIGS_GROUP,
+					   configs, num_configs);
+		if (ret < 0)
+			goto done;
+
+		idx++;
+	}
+
 	mutex_lock(&pctrl->mutex);
 
 	/* Register a single pin group listing all the pins we read from DT */
@@ -474,16 +484,6 @@ static int rzg2l_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 	maps[idx].data.mux.function = name;
 	idx++;
 
-	if (num_configs) {
-		ret = rzg2l_map_add_config(&maps[idx], name,
-					   PIN_MAP_TYPE_CONFIGS_GROUP,
-					   configs, num_configs);
-		if (ret < 0)
-			goto remove_group;
-
-		idx++;
-	}
-
 	dev_dbg(pctrl->dev, "Parsed %pOF with %d pins\n", np, num_pinmux);
 	ret = 0;
 	goto done;
-- 
2.39.2


