Return-Path: <linux-renesas-soc+bounces-23515-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28427C01A61
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 16:09:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BAC73B8E83
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 13:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63356322C77;
	Thu, 23 Oct 2025 13:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="LQJ+609g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682E2320CA0
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 13:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761227913; cv=none; b=V4CtOTYqjNK2bT/BNLC+f7jp8It0Wp6PahMrAdTggl+NCmEWPB9Gnp2N44CduNnDuNQqHNqrFKkt6n5M3iDD8Lfqi2AnisVaCews6D+C6fTZcFoACH02zgv1r4zPnwVq71CUfHnXvG6kQSd3h1N8dD+lc0uPUpX3BxZg4OzNIi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761227913; c=relaxed/simple;
	bh=7pVJRtjZLD5TeJtHqNBvULeyoq1fs96v67StzdBP0ew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jLyCimgPRZ17PKOUDZgP+9z1P16xThOnRF63HCqPC+kEWsOiaGNv3+CLm4VfTVKf5t1QnH25WwijBFPW9hXFHKqWOvoWaycVunacCVnPiU28BwD/OLmqKwuLsQHuWLc6NhPIn37vMm26v8Qo/sRDiKHdmEJVh2owAcPHbSqLs2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=LQJ+609g; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-61feb87fe26so1489669a12.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 06:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1761227910; x=1761832710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hv0OLxIw6eR8M9PP1FC7Hsyw74xGUijbxOyWvfPyb1o=;
        b=LQJ+609go0icKvbN8Uet5pMxn6/AlqaTxce8+pasVmB3ZC3AXx9YRuqHgprqUefdSc
         fchfo24fM+lRAIqszy2WljET4L+jwM1j+g9rSazouUO6NHljr4yZbD7Oz7WtI8f6RLIN
         gKKSzgpTZIt94BUxo/rhy6ka4hntaQMNwAVYGy8GzS8ttg+qRsaqR4OmJN9CUMNptu+W
         XUfwLQVm2Uv5GhFSzIeUw8vzm2dazWlYJcm405nJswMHfZel4Cy0IJtz51qfTx/bq+sw
         55nrg5PAu0nwGeA82ZGAVPzJQf0GF3tD5wnTvYKq6/vnMK/jo5laLeuTdW4/7e8Brdss
         LzJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761227910; x=1761832710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hv0OLxIw6eR8M9PP1FC7Hsyw74xGUijbxOyWvfPyb1o=;
        b=sNe2wKdoLzcT20JUaSKgZRv0asagvbV2GP4qoQcpc7hlPMMb09cXWm85x8jTEVjJgj
         7Zx3T8NE0ONJGQwKEYhiNSto+nJfBP4OBJ9mggcIBXY+iNcuH9xEf5FQ5JMm5VpaTxU8
         fYPLyen4IQupheYVoXjYhYSbkOXQaQRELfTCmSCQHejhorFzi9T4J57WQqiGIJe0NQVA
         LaJ4pNxGtdke7vj5VMovraUQrsjeGDdGmFEuBSNiQQrB90F0If8k3LyA6mB3n8L9G3L1
         nvlPTm/iKCR7qdGgRNIBhFqW79v/bX9vrEIQDDJf2SS7LGr2akr2VP/ENMvd2QEKLrkB
         VEHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCteNj0B5/jaUJ8LS65SCxk6S0hxUKdoTH8DSjqdtiuQ/lIWiJq2RHhB6MRv2EtoavZAKftirlNXv4xCzafHFDWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJhD3QCZGHiJQUVUlc8T7FN58EO0VH1YAsQqIz4YqB9BBK9QvF
	752p7ilIm/ntZhNy1xZcDWIGOkAw6XjO59qmzRfVLh9D8xlUQJBh7wFRdFK3e8IUDxs=
X-Gm-Gg: ASbGncthU2fnw0pjbyks2sRA4SRSgXiuks7hw5jADtrPP1dvLBjlnk5exd+FAeGT3Bi
	/0Qp6ZKIpTbSuOqfQlw4MdGVblkgI758U2OUmZv5l7k2dSKsFznTF1tcWauq3YHrc/HBP+bCiJc
	yKKcgZ8Q1A1ivzMBvdcBWGT3VVsMzJ2CmaMSCYTjQP3CxFPvawvdw/lTufkb3Fhw+1VxUkiQYYC
	WooDzkQf4WwAHAn8XHtVBV/HHn9w+atzer+63USMWrJkD6XOGfPH9FfNN1A8TK0PXyqUVcmeF2+
	Kr7eeYwQrk0XlrmheGYdcO//m9T38TP5Mu8Be9XY45hBVdf4klVa5pDDkU4Dy+6r2hP9bL1ZADm
	7j4oXk/5SojRqS7VfKtU486212oVTC7JnL6rfezWpWcUFaRqoXCkKoDJbkm5beuqBzXSon2kDgp
	CUC861EztyPr0aLEnlwCUggYn5i0YiyFFfJ7QM6d6Z
X-Google-Smtp-Source: AGHT+IF5LB7zjNrRLkZ5eXQ1A6Lm7xHSr+oOpxBpiq+5BFOfT5pJDhYCz3rgr76zPso7ExfB4BpJ+Q==
X-Received: by 2002:a17:906:730f:b0:afe:7b8c:a583 with SMTP id a640c23a62f3a-b647403a645mr3069948666b.13.1761227909653;
        Thu, 23 Oct 2025 06:58:29 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d511f8634sm226114066b.29.2025.10.23.06.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 06:58:28 -0700 (PDT)
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
Subject: [PATCH v8 2/7] phy: renesas: rcar-gen3-usb2: Fix an error handling path in rcar_gen3_phy_usb2_probe()
Date: Thu, 23 Oct 2025 16:58:05 +0300
Message-ID: <20251023135810.1688415-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251023135810.1688415-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251023135810.1688415-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v8:
- none

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


