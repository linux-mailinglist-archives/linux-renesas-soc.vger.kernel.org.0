Return-Path: <linux-renesas-soc+bounces-8833-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6D196FCC8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 22:31:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA59228CCAE
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 20:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2617113C9A6;
	Fri,  6 Sep 2024 20:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="UKRALhwG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-24.smtpout.orange.fr [80.12.242.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A448414C5B3;
	Fri,  6 Sep 2024 20:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725654691; cv=none; b=usQUzbHtb2agv/wpU+3ydd3eTyqPprrgFuELaPceA2JwbzJq2IAJy0eAMFZ05+31I3yNwiXeP8AiEWOARxBgL9V4yjSMddbMi18dDjLa0JfeYdQ2VdjUd9UQCe9XbPmwq5QYqF2jsgYA14f/UejhmXCwLjx0XLtWMcMbCflJZtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725654691; c=relaxed/simple;
	bh=5OSiCUxRsvtARcou56wXI3cDIiAdAe6GQc7hKq0JdXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qqbfVMIXEHgM5EhTeQeqFQRBTLWmqvCF7ZkXc2Ro4rKCSg50GWsVblzodVDxuAX2b0pqdCIBPdVt1cZ+fAkHSJQQjBaS0CvdrR00ZJrrE0rjEqZazmnl2xuBNZFg1RjNdswb7FH9zEOkPeWbJWFacRtRLo0hA7YXLYfe8yRSAbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=UKRALhwG; arc=none smtp.client-ip=80.12.242.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id mf5asaRIOjDE7mf5asHg0n; Fri, 06 Sep 2024 21:57:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1725652674;
	bh=xYR3kPiysp0DAu3hHTCdnVZ7J5OM+i5euxXxIpGksJ4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=UKRALhwGsYTuYigKVxKoo0JZ69+DDjBvnn6qfJcKI3njUqRapI3Rh51o8+diJHjuE
	 MhgHF9HQnh1G5UdkHXe+Ijsp4HwEphBpO9KK5OVMJFcd1p0m1Pev8lY98FjLHnsM6f
	 14VKjI/kFW9y/n/yw4te7mKEm3UoVH3om1zmYXAzE5RkqmUOR1DrZpSaEDSD0NMSMp
	 eejwB1pfMfRrESQd9sqWBRs0d/TIwnau3gBlyaEzdY2962egpIlD+AW0VPde039ebG
	 vvN3mh6SEx9MoGRI1HzwpCnk8TLGWyHyaCnwki82Fl13TdSFCPotd6vRaQjmVzARAG
	 bK5cf5AD8YdUA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 06 Sep 2024 21:57:54 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH] phy: renesas: rcar-gen3-usb2: Fix an error handling path in rcar_gen3_phy_usb2_probe()
Date: Fri,  6 Sep 2024 21:57:47 +0200
Message-ID: <fc9f7b444f0ca645411868992bbe16514aeccfed.1725652654.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If an error occurs after the rcar_gen3_phy_usb2_init_bus(),
reset_control_assert() must be called, as already done in the remove
function.

Fixes: 4eae16375357 ("phy: renesas: rcar-gen3-usb2: Add support to initialize the bus")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 58e123305152..8577056491de 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -770,7 +770,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		if (IS_ERR(channel->rphys[i].phy)) {
 			dev_err(dev, "Failed to create USB2 PHY\n");
 			ret = PTR_ERR(channel->rphys[i].phy);
-			goto error;
+			goto err_control_assert;
 		}
 		channel->rphys[i].ch = channel;
 		channel->rphys[i].int_enable_bits = rcar_gen3_int_enable[i];
@@ -784,7 +784,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	if (IS_ERR(channel->vbus)) {
 		if (PTR_ERR(channel->vbus) == -EPROBE_DEFER) {
 			ret = PTR_ERR(channel->vbus);
-			goto error;
+			goto err_control_assert;
 		}
 		channel->vbus = NULL;
 	}
@@ -793,15 +793,17 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	if (IS_ERR(provider)) {
 		dev_err(dev, "Failed to register PHY provider\n");
 		ret = PTR_ERR(provider);
-		goto error;
+		goto err_control_assert;
 	} else if (channel->is_otg_channel) {
 		ret = device_create_file(dev, &dev_attr_role);
 		if (ret < 0)
-			goto error;
+			goto err_control_assert;
 	}
 
 	return 0;
 
+err_control_assert:
+	reset_control_assert(channel->rstc);
 error:
 	pm_runtime_disable(dev);
 
-- 
2.46.0


