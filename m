Return-Path: <linux-renesas-soc+bounces-26404-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A169D02655
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 12:31:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5ABCF309644B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 11:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A2048D64E;
	Thu,  8 Jan 2026 10:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="OUKSl3Sv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B689E48DA52
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 10:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767867972; cv=none; b=qrDfUfjhZpupduHzBNZYFUfDyVM8OXZYPn2Ui3ZJAn1sHjy6bvxTY1MFlraHgN4AI+0FMKCaMwDmd9ZSgGDS3sVIb/Qpk9iR2RaU9TF27nJid82b6bkLkn9+ECkcmqzYObjRIBLacuIVLydFZx4xtfBsBkk/ZjoUhyuNBuTY3Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767867972; c=relaxed/simple;
	bh=SSCOetx+bf7TOiWJB2uQADhyOYBmEsY5VHm0DVSXU/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qGwb2bB2kHkrJhX5myRqjR2HRxFyrq7kVx/JEjntHdiLHAt6fubh0oSZC/U/vL4wc0lD/wzMXFQlyLE9UihzUu6laXXDlHPH6eyoY/Wkydzq50pn28/wbi7S1cRw44Iu2sLKO/dQIkylAgukKksZ4h5300375Mm47GPnQgMUu4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=OUKSl3Sv; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42fbc544b09so2119436f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 02:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1767867963; x=1768472763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UzFU1t39uNOcSH5TMPmCZKGdfnSAK8ONwEhnmKi3ApE=;
        b=OUKSl3SvWbGZmVOLzF109OfmmyYo2MFpOwrXVLCZqh5tLzocAH2Rf3rmTxHVUYwvJL
         BC7SehBeXySvRzkWimsAQ+kigzQ7VpDcIKEaQdYa3QA/QlVQSj9defLWG4xTqoXtEjNE
         +PXD/l84BqMRMdRrYvbwQ9l8N1OhODYfvegD3PNEeqm2+Xgu/LPzw2VwFnnDV8bpvKGy
         njF3VJIfpcIyKPT/roRI8HAtjZzrZzy4kiANH8tJ5aH50hwKBulOItB7z/0bhxWWkyoq
         MtSNqeaQYkSEELR9r6G3ZgsCd385AFAa9uihvNfdxYRj18T1Fw0wPm4LdpfQfdYbWI/A
         aESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767867963; x=1768472763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UzFU1t39uNOcSH5TMPmCZKGdfnSAK8ONwEhnmKi3ApE=;
        b=RjIWsVYBgjXgLjJ60dDjuv1glfs0NADUcPIVceTlHMG8/aKItrpk45FW1d2ebMdhau
         lFDzoqYOnveVECgfa9Tlls9ZDxm86X0JaBYaX+UO2z7zwwZMR95FXjskNJ+1/J85/M+g
         JUiq0Myi/8eocvuHFmSX7DUcHYMCQcqEs28cX4ADTnAdXLtMfRmNpKQVXyBfkPemmFZm
         YMyzLMYAckSdcdaXXGqepWdY7O2YyE1vSI66z16wKuL/FHwPiy2DKfQgTDX9BRJpRKb6
         sEKdWbggxeNgdsSacAZgM/X8SdNOsuJaZc6bIKYeILoQpDpZuhRtwWRRjWDUnMjAZUbG
         YgFw==
X-Forwarded-Encrypted: i=1; AJvYcCVt8I/vo8z4bWhX76PqaU961Haoq8OfY0t5hPouI/B+G7212QsbsRVTYRNFwkJffITQul3T80KyLmYIu7eQRZm1dA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx4bnQ9UXMA3qMlEPPkPqd0qvopCNZVOFg4zFVmpxvnsPhJ92T
	kQ0D3OB4j2JPFy6yzT8mwXFBdhMZB+AoZ7unOw0m2dov+zjikDZbT+2xPUAIanrxwQk=
X-Gm-Gg: AY/fxX4drKs8xeLtx/3V5l/E7riyrm5lnXctM2wza7hQ2gxFNgFW4gM7eyAB0kcvjl6
	9gJGMa3i/rXSZjv2kBtZrlzxWghFbj85RTK9bsi74PpGYQ7npkiqIiN1tX9l3nEofFmtUxmuwfL
	WwfxoXwAzYrOMVfungf+eMyt297yd5dsieSiyLULC7oS+V0HHabV1HufK8+HGFNggo5IUF9S0L4
	jdnG/73fPgaqp7JWN4AhJb5RP+Vp7vMsFk9u1ENn9/1raq65ZVKWXQbFhIHwJa/G8p9zDQt0vA5
	W/IKvIAR09/Fe6fTAN7B1nPP5QAY4xlYogRpbu3Lc8knTX5iDc19xiVSpCsVz0AijjsepT7XHOb
	mu4YuwyI1+slFn/Vds8pmo4DRGNON/fM3n3cGjX1xWdcmvdXD/tYQA4aJRRzGHBJVY3QqPow8Vg
	huF2q+LOHzZ9izOfIcDQEy6+O9H/mVYsgK56CSpxQ=
X-Google-Smtp-Source: AGHT+IE0CNR982PLvgnsDGxUBoi/E06kF5nhcy/YB4oafov1EbceLrrFoApXZmvqJ5UoCbgrcv79ng==
X-Received: by 2002:a05:6000:1acb:b0:430:f879:a0fc with SMTP id ffacd0b85a97d-432c3790b06mr6924021f8f.21.1767867963408;
        Thu, 08 Jan 2026 02:26:03 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df90dsm14925966f8f.20.2026.01.08.02.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 02:26:03 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 1/2] reset: rzg2l-usbphy-ctrl: Propagate the return value of regmap_field_update_bits()
Date: Thu,  8 Jan 2026 12:25:59 +0200
Message-ID: <20260108102600.3477012-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260108102600.3477012-1-claudiu.beznea.uj@bp.renesas.com>
References: <20260108102600.3477012-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Propagate the return value of regmap_field_update_bits() to avoid losing
any possible error. With this, the return type of
rzg2l_usbphy_ctrl_set_pwrrdy() was updated accordingly.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none

Changes in v2:
- collected tags

 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index 4ecb9acb2641..9ce0c1f5d465 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -117,13 +117,13 @@ static const struct regmap_config rzg2l_usb_regconf = {
 	.max_register = 1,
 };
 
-static void rzg2l_usbphy_ctrl_set_pwrrdy(struct regmap_field *pwrrdy,
-					 bool power_on)
+static int rzg2l_usbphy_ctrl_set_pwrrdy(struct regmap_field *pwrrdy,
+					bool power_on)
 {
 	u32 val = power_on ? 0 : 1;
 
 	/* The initialization path guarantees that the mask is 1 bit long. */
-	regmap_field_update_bits(pwrrdy, 1, val);
+	return regmap_field_update_bits(pwrrdy, 1, val);
 }
 
 static void rzg2l_usbphy_ctrl_pwrrdy_off(void *data)
@@ -138,6 +138,7 @@ static int rzg2l_usbphy_ctrl_pwrrdy_init(struct device *dev)
 	struct regmap *regmap;
 	const int *data;
 	u32 args[2];
+	int ret;
 
 	data = device_get_match_data(dev);
 	if ((uintptr_t)data != RZG2L_USBPHY_CTRL_PWRRDY)
@@ -161,7 +162,9 @@ static int rzg2l_usbphy_ctrl_pwrrdy_init(struct device *dev)
 	if (IS_ERR(pwrrdy))
 		return PTR_ERR(pwrrdy);
 
-	rzg2l_usbphy_ctrl_set_pwrrdy(pwrrdy, true);
+	ret = rzg2l_usbphy_ctrl_set_pwrrdy(priv->pwrrdy, true);
+	if (ret)
+		return ret;
 
 	return devm_add_action_or_reset(dev, rzg2l_usbphy_ctrl_pwrrdy_off, pwrrdy);
 }
-- 
2.43.0


