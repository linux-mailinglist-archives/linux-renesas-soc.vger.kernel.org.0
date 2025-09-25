Return-Path: <linux-renesas-soc+bounces-22366-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A70CEB9E8A8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 12:04:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DE884A5302
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 10:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFE0A2EA730;
	Thu, 25 Sep 2025 10:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="SePmSlX7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C55A28134F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Sep 2025 10:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758794645; cv=none; b=tNzHPrtCIoEY7H8WwHmC3ld5mWK+FSZKtHfPNL7SRELRm8TpA9X14kJqHw3YtleOR3+pAlHXcmD0x6r8HExdXO2DQXMdlaZajszhqFPeln3t57Kz+6jbCP5tFftnHc1pCrfBYEgKOVu7XOcgQnF/zfnHVRXDJnCewBr9fmewjfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758794645; c=relaxed/simple;
	bh=JT6jFW6b41ridcLyHhg1Cw216EUa7wXbTkdFW3QbAWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uj4zqqeIcq/XH21WHlnXStEgMkbYnsoXznBlrasAqnEUGReDBhmDDYVBvJxrKC5NB3/zRSlksOkrJF+Zlq6TTLx+4g4xxUnMVXWLBnztfjaCyg+wgQK5INYfl/zBTD8iK/SVYMoh8YWKgQUIbjIu7ARdljbgI3qItbt4oXZjvrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=SePmSlX7; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3f2cf786abeso597045f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Sep 2025 03:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1758794642; x=1759399442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6a2Orro9dC+tTpehWSMqFbpqcjs/UMiQK/3nAw0F/fM=;
        b=SePmSlX7FCW5qQUTJ80YYitrJhEgA6qS17QZAIlMCioJ395XiC/0kcflPYo2HNRcxQ
         elNja6mAcNZtHA3Ds3M7VHXAN+v6FykZcaUf3ofiI5jigvTSLZn0yJm0OCd//0zTsvHX
         PSAJF3U6AzonM6B8HzuQO7B9v2GQjaxCUxa3SAHY9xHT6kJ5j42cDY1c0qJanPZCEXJv
         co3avxBTSRKKADoa1yLxgL86DGnTCF2yYFgWe0QAR7C8iod8DFJCQVM7t5qSxN/oz9rP
         pPuV9MG5dX2JdP8k7E2SEhfEtp6YVuEQ0N04PcvWH9Jwpd6Xr3rdYo9e0YJEAEgmSBPQ
         +gYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758794642; x=1759399442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6a2Orro9dC+tTpehWSMqFbpqcjs/UMiQK/3nAw0F/fM=;
        b=qVhF0c3IyaNHMEfMtPQH263vD0FcMIEhGKJqh7tREaX45rcsvotQWf8m2tN9Z/wuQF
         NBx1ioevcbc+eP9Gi0PN2W7yTN3Qoan8oBvXNohLk71kI2WrA1fq+8PWbmVLtT3vTZYx
         cDJ8UKj6+ifK7EId/FiyTg9n4IWGeSgHOrJIus0t3GmYLNOZkeiugCA/7CAr+hZJ/Z8O
         WsDX3cWqMWK0ymyg2D7tqdO/Rf3D9LgTe1gG+DNpOyXlW5ePv/gkbyVExCebGNvBaDPB
         h/lCEW9LUeoOKmemWfizv3jpazKq4iM8IaSgkunrThOYtAwAZwOImvX5rX1ieraIoORn
         IKwA==
X-Forwarded-Encrypted: i=1; AJvYcCXbVJD4N+zqPD1ZVJ6emEV6oxFjacvhVr2VFlBLkDAL3aIgbwKJwXnbswCMxh2XEvWhh5iIWdUtgBT4nwkQdGWFdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdZYYdSj5Cr8RnJXbDo0zTH0wQ1DdgfC2C6OlB7tf4V3cpzH97
	syvfmeMehtd/73zH9O/b7k/Vf4MxzNkU0DqKMgXTNFdRnyaSr3eKeum2ciJKOoCu+5U=
X-Gm-Gg: ASbGnctMyXZFXnvl71+gZ09oLH+H0eslQyhl9wQh8GL1xxcgFrrTvZywjMZlcNnKmJd
	ycWYF4SbeiL8tU3z/kb14kFbiH96jzOlMgeHbtpO9wwfvY9Lww78ldxWg+XRFbzf/FVXJXoptjE
	x7TWJHdUGArpo9ceXGUyDdV/ATd+mmEc+HS/EpepEehPCUs4e//YuZjRO3m5owXD5DQWQ5ssB5Q
	0l1G3Hx0GBoflytjwy5Cd/c4NVdAF2O5KRJIzTd/huj4LdT3gqH4rDWt2N7LnRIH6X+APfnz4ol
	/n6EZQcTGWi1Cx5trkW9pYdWDbsnF9wN0h+2/SOFTJ1gGjdl/iPadG9Ic5IvdWBOUTPrK4Q6/a0
	cxpEzA/ybub6toMXvtNFazg6J35apMor4ngj5hCjKPKVMziLKjOkG
X-Google-Smtp-Source: AGHT+IFCkCUX1Nhiu4z+bRR45isAzd2DfgEkYuZkUigXlnjJNugaaDklr/VgV1+VGrKsaVyGgmulGg==
X-Received: by 2002:a05:6000:290b:b0:3ee:1368:a8e9 with SMTP id ffacd0b85a97d-40e4a7114a2mr2803142f8f.17.1758794642473;
        Thu, 25 Sep 2025 03:04:02 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb72fb6b7sm2501122f8f.2.2025.09.25.03.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 03:04:02 -0700 (PDT)
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
Subject: [PATCH v7 2/7] phy: renesas: rcar-gen3-usb2: Fix an error handling path in rcar_gen3_phy_usb2_probe()
Date: Thu, 25 Sep 2025 13:02:57 +0300
Message-ID: <20250925100302.3508038-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250925100302.3508038-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250925100302.3508038-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v7:
- none

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


