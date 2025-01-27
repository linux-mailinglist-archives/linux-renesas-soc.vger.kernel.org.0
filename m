Return-Path: <linux-renesas-soc+bounces-12577-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 81637A1D60D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 13:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2F7E188736A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 12:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F80D1FF7CD;
	Mon, 27 Jan 2025 12:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ed31XF8g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1541FF601;
	Mon, 27 Jan 2025 12:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737982005; cv=none; b=qcKaCYJmp0XaSKybQ6/hmCWl5ekdzvwCjaIDmNo2NcsiVeCUuQDPOqecjFVcprniPx3kJuOHYLxuNQWorkaAKf7MKUG+OfizwH7l9cTKN24KzfkcH0eGk7JU4gjN5ipxkklxSadBHjS3G/sabVytiG3cRRd7EVGRCDRQJUAJvus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737982005; c=relaxed/simple;
	bh=MLMI+xe4jCIVViG+z4qmFWASYnmXjrbqAPj9rw3IXr4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PisbDuD7+juJLC08UpvZ+HpkLX7KxT/xy6VZjelfbLgxQljEHQzPoIGoVpRo4KpHXVY2q3wuUdl/aAbHYqOX7T5qh7UvxRR6j5Z2nZWNjYsz1nbCiNenVU3GJGxTWbOIJXK6zFQQ4TYuDxNExR4wRXVmXg2vebQkTllfojcPqH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ed31XF8g; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-437a92d7b96so45292575e9.2;
        Mon, 27 Jan 2025 04:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737982002; x=1738586802; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cVfs7u/bC6+4J/CfEnlWiXT6DaEn0LhRfzsd996fsQY=;
        b=ed31XF8gtqZjYDbOQHGx+1XP2EKQpzO1bxuKPDbFzHAJBE5MI7Nmb3dlH236NzDCFU
         LUZCtxCbSQmzFKT3+YKE1ZAihOyWDqDbnM2/NMp/lJpWj0JAue4jBB4epoBzQKdzVeZb
         2Ke8iTDHhgossrJSEiQBAGZfVeSrKEZTrlSF15YICJiD5U3QNzovU6x85f5e7mOZvP3m
         PCfrE8uZmtP6jKStqhZE+xZA3KMhmf3ZjPDmLZVi8gpQNg0+rVS2xoXm2cnY4pUsJkJX
         fY3aIwVWUAX33VHbUtqb8gam9mNE4aLN4CtqLIxJH03A54jvwb6S1DIUp5qKiTgaroCH
         n4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737982002; x=1738586802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cVfs7u/bC6+4J/CfEnlWiXT6DaEn0LhRfzsd996fsQY=;
        b=mGFxQx/gP+UVL1dYMJLSLoAhmUvRIa++v46+5nU6AQTmtR2e69uVQXxssjucM2A+JF
         e8lfAy7Eo3J54v9+p1MIj05gcpV/SkAqe+v9JxafA//4MmDzrCDyhmEodINv8K8gOBFi
         xrcE9wg93/R4kckcAfgYP0+vy8RPV7eloxLxMPnr20Jf6Qi8UZOBwCKIdgE3o0gppOXA
         xtVaS55KYmcjwh606IxQpBjVy9Yvi/zy8cV+XLagWnD93O+nBdfhgtVAN3XzYPmpZhT+
         vDYuwdgNclIPuQDcGNQ7ij90mwnnRM4oGw0rE9zbV8iA9Y88WMBOKYiN8clEJqG7DnOR
         HXhw==
X-Forwarded-Encrypted: i=1; AJvYcCWDm+0e0hiprgGQkrud4JRoXGD601ywXCKynQORTFnzNcyxLgRXSOGtxWYD6JfJBtiK03vLVqJLLJLJPxA=@vger.kernel.org, AJvYcCXV2RTt106Anw4p0z11ZvlAwRk5/W7O79JkSCdy6V/7oUe2BJqLGyyFHQzEFjjn3CjDM2ELgQE2tVs8cJC962S+1DA=@vger.kernel.org
X-Gm-Message-State: AOJu0YznLnsLV1g+jzEmTzYp+HkmFUYQ56yiKdvVCmIe8XN0hr+r4jB0
	wpzjdJ5ocUdvsOyIomrxPsapOo1LfBSRDIPCf1p82/EGpdS46Hqg
X-Gm-Gg: ASbGncuWIOysUTGGeVtot9u5crB3wu/4uAH6vwJQZLZhMZpgwYMYLxR/MoRJYXWdJnn
	5fl54ZhXsvTlc9Hjr5zykAWrkyfT4uVHgSuu6FmVmkOpxuj6EIMt6Fpl+8OOnegzcREvZVJmqao
	KSS5+v3SFBEy2cCAcM0/0xNpuERjb1DXDigSAV7uSu/f17CeYhF3Ip4TQFrPC9iMKTSESzH/V3r
	/JQoHsUMeN3gsB3WwnM04NkorqFPlljbObTM9DumGZ7oIYgmjH0l4mhFZWFH/9J0PRuQDptiJjG
	gz5F
X-Google-Smtp-Source: AGHT+IHO/ZR9VI0DRMcofIQwLzf01DYV/sQAqDzIwYKFLnZG8rtRUybzRdSJJBgxpXuRFsHSUi3z3A==
X-Received: by 2002:a05:600c:c87:b0:434:ff30:a159 with SMTP id 5b1f17b1804b1-438912d54b1mr408036395e9.0.1737982001587;
        Mon, 27 Jan 2025 04:46:41 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd508257sm129236735e9.23.2025.01.27.04.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:46:41 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 27 Jan 2025 13:45:59 +0100
Subject: [PATCH RFC 04/14] ahci: dm816: Switch from CONFIG_PM_SLEEP guards
 to pm_sleep_ptr()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-pm_ata-v1-4-f8f50c821a2a@gmail.com>
References: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
In-Reply-To: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Viresh Kumar <vireshk@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1307; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=MLMI+xe4jCIVViG+z4qmFWASYnmXjrbqAPj9rw3IXr4=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnl4ArKDkEFE9Y3A5/bmNOJMKuAZd/TGXo/Hnk0
 /0p5XyElHiJAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ5eAKwAKCRDnIYpo1BLC
 tURaEACTN9XCdcNODbQBu+CcA358dwkWhwqcBpvBKiMOZuk7+bUram3CM+KscfMs2J4gd6MtfN/
 mJ32c1MQWHifQWvKWmdGr0ooGdtSGWohsgTrfVhi9KB8eGk6x0bHW7Oa6nMO/+bH1XBpsB0NGt8
 lXIhrHV9Aro7NvZiAp6oOB3ttVN38qKt9pdnA5zp/rNFfrnOZcYhx//s8ZOiR21PnNyOVag8OmA
 OTqWHR3pWFfC2fzT5NUG00T6TKnBaQhXEXczoDingtphAfQmOMG+y1za+ZrtTM1Ahb7gNuf47Ja
 3Fm6oikO5kNJqf7VkX4HSIYGpMhV8E0eadZxxZnnfo5NnGwwwlWDmYx/H6XTI4+Tp2uxJip3Ul+
 zosr9bo6XJW2rslEkJwDfPeeM9AIvuGfRgiQPuX6O0tiZeWFKEiDrHCpXfY5EC2vu7irMCitW2M
 JBW/vef5FWcx0wvsnOQ7Qi7ZyPtx6LXjxikC7Y2LS+TaLuoDlLWV+4mJrtniq2Gd0iFHqRsaaKK
 RPUxZjtg8KwWy0iUFXZGrQu6+Lc0VEmI1hmkEBZndGhBBo7Rh0sWQ/tlkvBFPkG+jU3/scbaqmZ
 gs/H79R23Gep2Ovribf5X2LTQYpPgNuxj/tbNOCOKw+TxFhMGgxXHZhZ1o6J+D9DVTps9jbb3ty
 0tD1wvT4bx+yMwg==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/ata/ahci_dm816.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/ata/ahci_dm816.c b/drivers/ata/ahci_dm816.c
index b08547b877a1f77ba220e925de321ed034147d7b..cb30a55945b8bdb1efefab192575864220215d08 100644
--- a/drivers/ata/ahci_dm816.c
+++ b/drivers/ata/ahci_dm816.c
@@ -170,9 +170,9 @@ static int ahci_dm816_probe(struct platform_device *pdev)
 	return rc;
 }
 
-static SIMPLE_DEV_PM_OPS(ahci_dm816_pm_ops,
-			 ahci_platform_suspend,
-			 ahci_platform_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ahci_dm816_pm_ops,
+				ahci_platform_suspend,
+				ahci_platform_resume);
 
 static const struct of_device_id ahci_dm816_of_match[] = {
 	{ .compatible = "ti,dm816-ahci", },
@@ -186,7 +186,7 @@ static struct platform_driver ahci_dm816_driver = {
 	.driver = {
 		.name = AHCI_DM816_DRV_NAME,
 		.of_match_table = ahci_dm816_of_match,
-		.pm = &ahci_dm816_pm_ops,
+		.pm = pm_sleep_ptr(&ahci_dm816_pm_ops),
 	},
 };
 module_platform_driver(ahci_dm816_driver);

-- 
2.48.0


