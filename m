Return-Path: <linux-renesas-soc+bounces-26523-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D01FD0AA9E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 09 Jan 2026 15:38:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FC0B303F781
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jan 2026 14:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D02E73612D9;
	Fri,  9 Jan 2026 14:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Fy30uRlA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D04A35FF5C
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jan 2026 14:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767969429; cv=none; b=h8v3KRaE0dMohGONj8YLYE5GiGZf/56Ch0ke53j0zAMLXOP6vNiivd+c+BOvVNWGo72Vf5YlWsQ8M+e2nVqCjcO/r3ExbE42ctveHGt8jjTDXI7zmP5CR5gwxdDnV57Kg7a6wQbSPL8jpD6OFbYCLulnyvA4MZYPwJLoPHjNeoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767969429; c=relaxed/simple;
	bh=Zui0vLXzRFh/wERc2HgRYk2capyFYM3OgNDblRDrPj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i06/W+Hf268bE5dn8ix+bzrVlOPatgYJum+VtEbvjuTjUofgEULQZOVZFeTPVFy1BJvTDT+67GqVrUxm4are2h6xTKUSLnWp/KDM9AmEjg8hvaTefvxNXGXoV4g5ITlXe2Kuo8n7D3yDFJPK+Ljo4UId80l1qCl0p7RoSTHtZCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Fy30uRlA; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42fbc305552so3004151f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 06:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1767969424; x=1768574224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PwXH/65fGSKTqwN64GUgQEIR6iAT3YZ4bpdY++yDPPE=;
        b=Fy30uRlAlgiGYO+c4kkRrI0wKeC9T3awH7JAtL9K+h8t7r/WZ6Fry+ew7kVs0jx4Bz
         2Kts6gw9AXAAjqzRaLf3oHKc/vLlGxR+UyuVWtStxX3LuQ482Qc+eGs0Uva130JvsSZD
         17B3+i3q9kZ8NOTXttSs93Z/ADu3E1O5aQxJPb7Wucgm2rL0GgHXokF2zUK0NI6rJTBP
         owbcCEW2E1zdaiBSMYTH7Glz5cGY7eTetYEdXEkiNJhofdzyxa2ratEGmu5bL/vb7o32
         VHARnbDKOh2963RF37Au0EYQO2rpbgaEXF6RXPhSLI0BxkWDKZ0ZUzobqZ/XkhevRS95
         LRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767969424; x=1768574224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PwXH/65fGSKTqwN64GUgQEIR6iAT3YZ4bpdY++yDPPE=;
        b=j/j4yVEeyztCgspPBJGeJ1PQUEzLtTNZGyH0ivz+gzlV32hLX08eW3KDRZ7NnP4/tp
         B85qZx1Foybcj2XlXR5Pp4mDdSCn46QDPw89W8aNKG0R/Nd7iCnJjfw4cyniTJcLojVJ
         tFwS7yVzjYZ3z6s7veMC+JODZURBM9/VYq8qP8YFxSRlCNEM3rPy4N1sxAGi50eBqz1R
         3yYiTzu1Yj5RlWdUszP/8DQvc+hRbQHfZD5yMg/VGhK87fZ9byhUcd8jXTIaqKVgEGxV
         tXcTKQmkxvT38NWCHcj0N9JiLgLwtndDc+ckDmAabRWANJUqkrRM7pldO3HI0IuMsa1u
         kT0w==
X-Forwarded-Encrypted: i=1; AJvYcCX9pa+8pc6haSfLusef3IkZjz/MLKKAF+lE7MpTiPAer4tU4vh9U3uzQnJl0DvAIFpcHtvFVgrTJZfErAykbKWBog==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2KtRc+6v6QLu0P7xVa/8lpxl3dHi0s/3pbJoVIGTP49lshOhu
	KLd6IS895fZRvjr9JiBOSAm+Oe7jpz4O/rfpc5xEYauGZe/u5Z328hkAHIstp0tHiwE=
X-Gm-Gg: AY/fxX5KNnK0jXNlZMk148NwmlClM9RjtHZSa6sRK8SxEnaSpgpwnuBq876Y2tp5KH6
	n2p73eczVIIxBt3apNx8fuEPUzKvpYrye/s9wsEM8uLo1xgB3AsDcRlsvWbRd5EGFLadSGxzeCs
	r8CnwBXqYJV083H+nI5XldAeZj9Gqxbtynhcft2luA7TaTfYK6Qs3EsC/HJu9n+QifajEn74aiS
	aEW77v1f7AdHAyjFV1fktD28itmFqUNk/saUofawtWxu4KVKvEjn7OCxUZpvQi1F2te8cANUcqm
	NOkqID4dAniJZ6d0qh1kfu7uvgfX2/NssBd8LI/qvbdLGniimGYTfIbwM91f8bATLTd8mrAaarq
	YCzDOrkR5YwBOOR5MoaFeHyBxWKeiYHmD31JQetTejv895o14ZOCFSNlx/VBvvejA/prw9XQK1y
	8qAnhLwHRKfCKMh6fe48yFQj/DLkBkt7kYsuztTQQ=
X-Google-Smtp-Source: AGHT+IF4yV3/c092rXhw/fsJog+qS63Jw0Lvg6nSkZ+NSHK+evNI7o5vQMYfw7ETawpyEOhIj1Fi2g==
X-Received: by 2002:a05:6000:24c5:b0:430:f494:6a9c with SMTP id ffacd0b85a97d-432c3760c3emr11494348f8f.17.1767969423695;
        Fri, 09 Jan 2026 06:37:03 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e17aasm23197216f8f.15.2026.01.09.06.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 06:37:03 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v4 1/2] reset: rzg2l-usbphy-ctrl: Propagate the return value of regmap_field_update_bits()
Date: Fri,  9 Jan 2026 16:36:58 +0200
Message-ID: <20260109143659.817797-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109143659.817797-1-claudiu.beznea.uj@bp.renesas.com>
References: <20260109143659.817797-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v4:
- none

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


