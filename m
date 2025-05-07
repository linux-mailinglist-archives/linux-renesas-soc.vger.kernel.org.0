Return-Path: <linux-renesas-soc+bounces-16757-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA14CAADFC3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 May 2025 14:51:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F7DA7AFBA0
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 May 2025 12:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4AD52857DD;
	Wed,  7 May 2025 12:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="aINOKAg1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC4528468D
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 May 2025 12:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746622246; cv=none; b=VAQggZHjwLY43Vjtb0mWD/nfOTyt+pyIbCWTmMN2Ia/88vlwlNP0zXdWxKpq9nqnxIKhBYnSuc4LS+Bde8OnwKXzbxlbSGkqapVf0eUCqpr5zPQTD4h0jjqWfO/R1lNV54mikQCHtv9Cj7GFAkfUiyg+N7qNswX8cm2p6skx0iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746622246; c=relaxed/simple;
	bh=NNbI2mZc7orPCD96orrUtGmro7jcN7TH/vdaWXSEFkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AvFwwK4YEH/ehTweNt2c6Cj7K0+XpUOlRBwiUkE36fFmips2vjUpXz1LhuHaIpFysJ9IRv36hXGo64Rgj6iBsDYcPLJrMQgxAzQBWVOII3Zkd5tNFJ0Bnst/06Jtxw8b/dVkbhuyxki6RnL2p5hOBZWUlhpLc3ma9aRX50DUIws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=aINOKAg1; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac7bd86f637so182821966b.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 May 2025 05:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1746622243; x=1747227043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPcRXEDFKMfOBueOV1ZZggEMaCzz9uMyyXHjT+cR4Zg=;
        b=aINOKAg12P7aT0KDfpvr4TYz1todh2ccAr3rMKqqx5DEVwdEiDgNYU/Bf6ZOnsP6VK
         fezUWRbWeUjcy6xj4EM+v0bmi4zKOAWT7/aJBZrREVMwSn3XypGztXtIOc/pLIX32PUu
         Vm/8eEwWVr5nH7Nv2YBXfGyyHh/iLRXCQQ2FCNDFNP6k4siM762/0CqRi6nTh74Z1Rqb
         aocClaXrViap9AfDFaI9WMRTnfOD+AJqlKp1r5e3j4lOofFouZm0Xy0bU6kO5Hw+yinY
         g8QicAR7wRyCKhtvr7ixQ/oMEg9ys8OYLT/w9rjr2DiMo6b5xxoBmebcRnl0BXTXy+hF
         PtrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746622243; x=1747227043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TPcRXEDFKMfOBueOV1ZZggEMaCzz9uMyyXHjT+cR4Zg=;
        b=NOh3fzG+a5RhyTd4hh0sxtjJ1EmG5skffk66iWybZEpjtzEfAkpKZB4J1ByVenxjAn
         MDIGni/AYyAZDfws+I8KPtxvV/kqcxoSi5+TwvTQBwse6oREluGNeNAJVWmRGb/Q9+o6
         6i2NBCqN3xwBpI8/2x7+6UrumTMlUX1xAK9H16GVYlwhJzcT2iM49eHVpnS6i0gRks5r
         hbueByNcsOeDMekZH6h4QcOAfe1/HMj0QddaMPWLi7WGov+KSmsFE31xbB8sA28A6tu7
         +Y5JQWlR97gmCvvi9wV/fLXo6mAUG/KAwViTfohqF944z+WXdST8ACUlOEFRO501gk+H
         aYTw==
X-Forwarded-Encrypted: i=1; AJvYcCUIOXaqc5Ux2vrmkIWJ2gDl96BfX97HE8jJZrcSAwKRxJ9gvPiYZPmKetalSgS46C8/g4UJbz1wpKjRkHziVJuEmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOpy8po7aLNIYMvabFmjljHYfLDE4ApcFMEZF6oxRpr0r0tQr4
	MRIbN42hwK+t8Ztd/Mp68JdF7htVxOsZ51mEPwoXOaj1dSB6yoDXbNZvtXwl430=
X-Gm-Gg: ASbGncsZ/f9P7UveoA8cK47b+EobvHP+FLcNXcHymCTtDsd534XTR29nmttth2iPzcH
	Ir7tICrhy8fwN5sl2gOu8RXQ0xYB0c1zDyDIC+x8Wd5mczomwRFkFsWMSDK1x6IQAWDiMyYXroR
	nOhnKjAuRpOAR+z0EmJ1DhOwvFLxG2yPB7cfm6po3+5d+KUKOzGptooadpKu9W4WJ1lGlAjRVSw
	iZAavM9gJhns4suSNSxJHlvMPrFdYKXXLTF746e27DR+rRIc3v36fZIwnBGTi/3zznHG0W/7gAB
	hKWNg8o5pQQWd2ps+vu8HRwbvFY4VZ2jiVAI0iy3EbuvRRl0Kcb1giDQ8P3rBUWdyk99Wpc=
X-Google-Smtp-Source: AGHT+IFgr60R6EGG/hfv1qbucadH38+M65/DG+xuJSaXMntsG1skx5u3NWADh8GI7FcyDwNsoxp1ZQ==
X-Received: by 2002:a17:907:1c9c:b0:acf:877c:ccc7 with SMTP id a640c23a62f3a-ad1eafbe4f6mr342734766b.13.1746622242991;
        Wed, 07 May 2025 05:50:42 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189146fb4sm913182766b.10.2025.05.07.05.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 05:50:42 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: yoshihiro.shimoda.uh@renesas.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	horms+renesas@verge.net.au,
	fabrizio.castro@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH RESEND v3 5/5] phy: renesas: rcar-gen3-usb2: Set timing registers only once
Date: Wed,  7 May 2025 15:50:32 +0300
Message-ID: <20250507125032.565017-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507125032.565017-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250507125032.565017-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

phy-rcar-gen3-usb2 driver exports 4 PHYs. The timing registers are common
to all PHYs. There is no need to set them every time a PHY is initialized.
Set timing register only when the 1st PHY is initialized.

Fixes: f3b5a8d9b50d ("phy: rcar-gen3-usb2: Add R-Car Gen3 USB2 PHY driver")
Cc: stable@vger.kernel.org
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags

Changes in v2:
- collected tags

 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 118899efda70..9fdf17e0848a 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -467,8 +467,11 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
 	val = readl(usb2_base + USB2_INT_ENABLE);
 	val |= USB2_INT_ENABLE_UCOM_INTEN | rphy->int_enable_bits;
 	writel(val, usb2_base + USB2_INT_ENABLE);
-	writel(USB2_SPD_RSM_TIMSET_INIT, usb2_base + USB2_SPD_RSM_TIMSET);
-	writel(USB2_OC_TIMSET_INIT, usb2_base + USB2_OC_TIMSET);
+
+	if (!rcar_gen3_is_any_rphy_initialized(channel)) {
+		writel(USB2_SPD_RSM_TIMSET_INIT, usb2_base + USB2_SPD_RSM_TIMSET);
+		writel(USB2_OC_TIMSET_INIT, usb2_base + USB2_OC_TIMSET);
+	}
 
 	/* Initialize otg part (only if we initialize a PHY with IRQs). */
 	if (rphy->int_enable_bits)
-- 
2.43.0


