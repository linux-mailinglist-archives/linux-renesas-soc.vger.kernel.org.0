Return-Path: <linux-renesas-soc+bounces-9784-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EC199F7CF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 22:04:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88CD21C2305F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 20:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57EBB1FF059;
	Tue, 15 Oct 2024 20:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WYezYEl3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2C21FF044;
	Tue, 15 Oct 2024 20:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729022562; cv=none; b=TJR4nqK87z/Yck8NmzJKVrGVjIeOM3m8QZS7yg6hFPAN+lCnGRqBQsDftwI+JG52kZ/PUN+QY8y1eOLjPs/kE1WGTBuyGwAJ53DDEOVkouyFkDCuoxkDViZrO/T7pPhvEgHfWtlEA0fc2mZxLxOeIAlLwGX407IhzkDuNmsQ/+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729022562; c=relaxed/simple;
	bh=bk+3487l6q9TzfLOX73ymPMg2rI1oPjPCENy0GqRe+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GxcQkY+MZjfRHuP18e65o4jSwHU6X7YrS8kut+nzBJoKLjJVhscohubCAMZwtjxROU3zpzoO8wLs1qY1FOhQPsodNNu2rAKrTCY6Sa3hRuAjeN8W7nq8dWguX/JXKoKq1JFauzMTYfSVTjbrybRi3YSSRTg6fPkHDwpQ/f540qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WYezYEl3; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71e4c2e36daso162115b3a.0;
        Tue, 15 Oct 2024 13:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729022560; x=1729627360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2zTTCNmsBFr9AQAiKF1M8ZtwCExJpwgSSti0BgjQY0=;
        b=WYezYEl38GutEwI4875fOvafbOCAVaTxL9QThnIGNO7TM+YmDcGduPkYWdB7b0oLou
         i3G7ewyLL1T/RORUdhIH9dYEA0z7ZPUEIo20gvNCb5lv4bUlnR9Fu6suGLTkHgFQm8sj
         g4KPTMNwE7kqAd8mls1LT3+uNqt158p5llg2kgOxJVoC8ca9Id5SLGBqysXa3wXoVBT8
         eVQdKCA0NzREWYDaZwjdzO+2kRuqJmW/+JHxUzuq/41nDY2xCZj1zP5o1mtqCRi9YO/f
         BqVCo05+KRT08q7xmJacdT/Tl+7GLhWrwbxxlV7cHZEeTYDImrWgnFg2gPbqdZ4dm+RX
         dHLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729022560; x=1729627360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K2zTTCNmsBFr9AQAiKF1M8ZtwCExJpwgSSti0BgjQY0=;
        b=qVWI1Ry5dEVMjAmB0Xi37HdP1WijxXX9JmK0uDu2D6pOEWpxVjtH98Eo0C3bmW8lSf
         pAPeNEbbUZHoyGU//I5enHREeNcJ/R9rGfQc2LNZ66fQEJ+qBqM7Jr4XPrKDn2nKAYef
         zKcXUph4fztzr3h7gdmkNbf+Eoz8cgh6kIe2LZ08EdBEkO7gH1v6dKgJxBsvoCvUuzy9
         GbegS+aSvsc2+YJAivBO/4LmEsGJVcsq3wIMNuOqJ34YC2MZdHaZiCs7shIsZoAG6Y/H
         mkV8ZBI5UBM46RhWj822NOSFK1tzqWLc1U7T7qAg8i2SBZVtrO6HzTQ7eY8Wpg6aXYA+
         xUVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAe0yLUmM8AHcNJD9w/ZDFcq7GIg+tg//BiVqUXq8n1JHI7MZBUndsQEZzQpIwjy/1KLkO2HTQrEJCJ24=@vger.kernel.org, AJvYcCXUcfmoh6lJrnzmiAl1Scqm8/vHG4xQ4w3cXU8m2yeECbrUkbN4iz6UEniNg/GqoE+4MtrLCO3/WC79/uJuciE0yJ4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsw1hPYrv02dUGSiYfYt5t/jYDw5juPU+CXM3bpOJ3P0egC9g6
	2HuaZCcI/Fj9wgSscFt+Jx/0nk7uO+XG93NTMTUyc2OH231jBa5UzWT7wueI
X-Google-Smtp-Source: AGHT+IE4PDveGExp+bQG/xt0ssoR3HWs/WP6wUGZmAnugEy0L9fjqD5Pj6SBoncfA1l4nIlJ0bUaSA==
X-Received: by 2002:a05:6a20:c888:b0:1c8:de01:e7e5 with SMTP id adf61e73a8af0-1d8bc8c8c47mr19937000637.15.1729022559748;
        Tue, 15 Oct 2024 13:02:39 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e77518a1csm1690163b3a.187.2024.10.15.13.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 13:02:39 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com (maintainer:MICROCHIP KSZ SERIES ETHERNET SWITCH DRIVER),
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	George McCollister <george.mccollister@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Rosen Penev <rosenp@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Jacob Keller <jacob.e.keller@intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Breno Leitao <leitao@debian.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-renesas-soc@vger.kernel.org (open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER)
Subject: [PATCHv7 net-next 6/6] net: ibm: emac: generate random MAC if not found
Date: Tue, 15 Oct 2024 13:02:21 -0700
Message-ID: <20241015200222.12452-8-rosenp@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241015200222.12452-1-rosenp@gmail.com>
References: <20241015200222.12452-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On this Cisco MX60W, u-boot sets the local-mac-address property.
Unfortunately by default, the MAC is wrong and is actually located on a
UBI partition. Which means nvmem needs to be used to grab it.

In the case where that fails, EMAC fails to initialize instead of
generating a random MAC as many other drivers do.

Match behavior with other drivers to have a working ethernet interface.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/ethernet/ibm/emac/core.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/ibm/emac/core.c b/drivers/net/ethernet/ibm/emac/core.c
index 3bea10624291..fb9adcc3a16d 100644
--- a/drivers/net/ethernet/ibm/emac/core.c
+++ b/drivers/net/ethernet/ibm/emac/core.c
@@ -2937,9 +2937,12 @@ static int emac_init_config(struct emac_instance *dev)
 
 	/* Read MAC-address */
 	err = of_get_ethdev_address(np, dev->ndev);
-	if (err)
-		return dev_err_probe(&dev->ofdev->dev, err,
-				     "Can't get valid [local-]mac-address from OF !\n");
+	if (err == -EPROBE_DEFER)
+		return err;
+	if (err) {
+		dev_warn(&dev->ofdev->dev, "Can't get valid mac-address. Generating random.");
+		eth_hw_addr_random(dev->ndev);
+	}
 
 	/* IAHT and GAHT filter parameterization */
 	if (emac_has_feature(dev, EMAC_FTR_EMAC4SYNC)) {
-- 
2.47.0


