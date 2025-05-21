Return-Path: <linux-renesas-soc+bounces-17314-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5CCABF760
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 16:12:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F8EE7B365C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 14:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E225727C15A;
	Wed, 21 May 2025 14:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="h1gOxFXk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF38B2777E4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 May 2025 14:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747836621; cv=none; b=OysXz8Npt7zQ+3ndPpwhHso14iSbYV7xscKsNHPu/3Wf9Uk88BT+r58amK4T6vs4wefo3RvNQNzU1HQdQseG3sGL001C77cSDqw0vEPBlS7Tv84cztLjGxFAdrLuufLLuA+C6eXqSO1iz+cxm8PB7uTvSVa3pVeLRs13vYw0rSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747836621; c=relaxed/simple;
	bh=EGFE9fF8CoyqCcQrGQ5RtJ1O3HstgRvlsNO0EcsOKKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VLctrZkny1L7j3k0JIzlTsztUNtyDO4JFYFOvEmYftrGWlx0q9hjf8H+YLUnpH3tscSW1+ROTqISoM+boAafTgtwnWZwLDa/5ry/5I3kZ2So8JeqhkUHslHf4/e3R14r9gOpbrpG9+ug4Yssw7BkdkOu1wA4gSMFYKh9yD9taRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=h1gOxFXk; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6016d401501so8714511a12.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 May 2025 07:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747836617; x=1748441417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1CHusJ4ei6D6vHackJEhVkMXrFixKZ73PuOqrjq43c=;
        b=h1gOxFXkymt5ugbEYFFKHOVB7tTtFkFGsrSQC2FaVTZ5TarZVdDS9mYA7uwRe6q0ml
         VOrIW0FdUF3bFL/A+aX9B+roh1XYO6Xqzkjn5lHZxIg+lq8jPBi9eYnCH3ScPoSVOcsj
         5GV/hO/TKIIP8sgBbDVVpRTA7geFA2TlUK3KY3k1UAN9PVaffh24Kjrl5VzDm+5e6J9k
         w7GByWFqCCRym8WJeH//sb0Vd/UhNI6ZZr4nrfOz17+lNoeX4Xcp3YijT+IevLxr2Vzu
         71rbrRIhsEHBCiv4QAHvBh/NDtiSF5arkzWHgsb20isQ6qohrJTJqYNSZvA8qMjtbZbK
         iVcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747836617; x=1748441417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O1CHusJ4ei6D6vHackJEhVkMXrFixKZ73PuOqrjq43c=;
        b=v7GFT2HEouQPYNHocA7vc17tc26xZn1Rw4eKHnjXAWzGZ8KR+4M+ajhEKXofE73s0+
         LcKkPAMvt6D21NDd+Z+ra8lST4kabv4AXdp7XI12r+/go+3/zsehykoJCqwwI23bjm4a
         Tb90WwASUHbuNCwl+txZhB/5sAB1kVOOt/up921+leWaa6jQZVeqAHq6JNYEVFTLE8Kr
         3D5IzMjcd8sz328blRLGyNN8ZzMiwSRfCm5xEaOZ0OfLqtu0tpwFwh0Tw+rLjoliTPGy
         xyLq/bhTtRC7Np8zwflhFR3JyP1ibYY3K59hCx+cpOneqJFNgwcIawwbmcMavuEmqW4N
         myjw==
X-Forwarded-Encrypted: i=1; AJvYcCUsHbl33Hm4RoDZozbd7EN8JsDG9hnFtnRcvZqrGB+39X6kRfhErpk4HCJRclJ2iROuRLxPGC+IkqUlCP8ZbFwHhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIDaLP9/hALqDnZDxl6ObqCnpGpMf9H9fNDkAiKYT9IoyhSjq3
	Rv8kLWW0OR1qjrgbKMy3DF8sktS9VLcZNOyAbIq1NcfAnkYJZlGt1lP7IMQF5tvW9vA=
X-Gm-Gg: ASbGncvJe1ZpuOZ7ccCqgi1PK7owm7hU7wE8p2Jpb6dytqVAIRCvaI7Ga4ZXTq0j3MF
	y4ag75sP0UTZjmA/R3XdWWqh+HyLufRbBSUalg9asRUDz0douZldjiwfYLBsTgvIMSJ9QNqyJx6
	kZlo6qSFKI9A35H+9j4mwQ4ZtHlltjYlZRICz/5JBqn/DRsw3zKP9y4dRFktUx4TesXO3+aVN2p
	8xHaLWXgxrS07H+UEkDqEFUNGFHRf9s7uKVSHpkwIbc4C2/xsTSI97N/SsuNmjxP1mcl6UDAtcS
	Gz2NyRbVnREruxb39jsPeEHhLZFbeD5EVoAh41Z+njwBoPr/Az/6JWhEzacHcYVZ5RJ6gaJb3vw
	DSMlF
X-Google-Smtp-Source: AGHT+IGvqJR7e/kOZrWWHQJQW+m9p5RsEiN0pjfvxiINSPfnR4snDax5MoMW4mDXwqItr/FNVvG8UQ==
X-Received: by 2002:a17:907:7d89:b0:ad2:5408:bf1a with SMTP id a640c23a62f3a-ad52d64216fmr1934817166b.61.1747836616979;
        Wed, 21 May 2025 07:10:16 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d271916sm914552866b.69.2025.05.21.07.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 07:10:16 -0700 (PDT)
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
	kees@kernel.org,
	gustavoars@kernel.org,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	john.madieu.xa@bp.renesas.com,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 06/12] phy: renesas: rcar-gen3-usb2: Fix an error handling path in rcar_gen3_phy_usb2_probe()
Date: Wed, 21 May 2025 17:09:37 +0300
Message-ID: <20250521140943.3830195-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250521140943.3830195-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250521140943.3830195-1-claudiu.beznea.uj@bp.renesas.com>
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

Fixes: 4eae16375357 ("phy: renesas: rcar-gen3-usb2: Add support to initialize the bus")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
[claudiu.beznea: removed "struct reset_control *rstc = data;" from
 rcar_gen3_reset_assert()]
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags

Changes in v2:
- none; this patch is new; re-spinned the Christophe's work at
  https://lore.kernel.org/all/TYCPR01MB113329930BA5E2149C9BE2A1986672@TYCPR01MB11332.jpnprd01.prod.outlook.com/


 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 47beb94cd424..d61c171d454f 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -699,6 +699,11 @@ static enum usb_dr_mode rcar_gen3_get_dr_mode(struct device_node *np)
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
@@ -717,6 +722,11 @@ static int rcar_gen3_phy_usb2_init_bus(struct rcar_gen3_chan *channel)
 	if (ret)
 		goto rpm_put;
 
+	ret = devm_add_action_or_reset(dev, rcar_gen3_reset_assert,
+				       channel->rstc);
+	if (ret)
+		goto rpm_put;
+
 	val = readl(channel->base + USB2_AHB_BUS_CTR);
 	val &= ~USB2_AHB_BUS_CTR_MBL_MASK;
 	val |= USB2_AHB_BUS_CTR_MBL_INCR4;
@@ -860,7 +870,6 @@ static void rcar_gen3_phy_usb2_remove(struct platform_device *pdev)
 	if (channel->is_otg_channel)
 		device_remove_file(&pdev->dev, &dev_attr_role);
 
-	reset_control_assert(channel->rstc);
 	pm_runtime_disable(&pdev->dev);
 };
 
-- 
2.43.0


