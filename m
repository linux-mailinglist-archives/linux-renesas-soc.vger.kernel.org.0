Return-Path: <linux-renesas-soc+bounces-24786-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 73477C6E5E6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 13:04:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 36F474E28A5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 12:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEF593563EC;
	Wed, 19 Nov 2025 12:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="jCNbTy+a"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3863355805
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 12:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763553866; cv=none; b=X2VhLX2chOT5crXs5DzBZAFW46Va4ku4qFWxMTVGzPOEoQtQB5xBhrsisuuV3U8+s+h2biCS8OexjuOKOw4h323WuTDmMH2JRkly5hWj/xUQjDSnmm6Qah6eytfZCJQXf9ODw+ltX0ONBFeT7QIZHGJ3g9cXrOmQdwxMmd9fcYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763553866; c=relaxed/simple;
	bh=j3tNWfRl9BS7NiuInYLBL8XKsdb1qibHsq5qM8AVQSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z7Wptd2G8hIWZ1zgvxKFdhBPdZygWiYklKb+WlD9U/rnTPp67wakGci5xGf3Ya/f4w92KF3BiOix9PX3iF3MOduOc3AtLiHWOU5/vURPrD12WvWBfGnKP7nvR4woRFizqEq3+GcutxloSEW5uaAt9Pyxbo7CVN6I/hY2ezCprkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=jCNbTy+a; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b2e9ac45aso4296127f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 04:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1763553863; x=1764158663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0aY2gFv7ygvSVsf1zlQJN5LYC9AoQYaQyEQzxhKb3Tw=;
        b=jCNbTy+artW/vGQRzqYrxYp7LxxIEVdyFdlkWHfsR0bwZ1HLH0myiOhdNY2Ofy18aq
         2kjTJ1n1vkkoPWtNmcY5BAi6PlREiTVgt6KCvtfewWUUyhfwz39n8kjyOliv0vi1Ei+W
         N9j5n3sHZmKvmGdomoCdxZe+VbaJOtQ+5rOwxcIdtaehqjtZQPmsUOYNvWPdC42iWaCB
         gDI69uNs3S05E20J61qoBYtPD8Xtu9nhCfVfd8Almc384C+yOMdgLFZu23f9mZp1xhlY
         5wx4ZH6iNKP+otAv3AGFtIi4Bc9DwTslIE3yKp+Gptb7QXf84GYIaQWwSTJMzelb1637
         saAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763553863; x=1764158663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0aY2gFv7ygvSVsf1zlQJN5LYC9AoQYaQyEQzxhKb3Tw=;
        b=jemJVzdI27FI+p6JyWZNMMag0Uy9UTp1KcpRFOAL0BD3N45N/GOHtaAc1a+FowuZex
         t4w0WPG70tMAVxjRWIQyXvanG8/CBM/5SdIPWM9dEil0fN/uBQBPC426qM9Iq5FO/pSW
         dKereuBEmBx+j8z8mkGFU6wzjWe3YaYfMBn5Pchd1PNMcVMoyNJs3dQxys2WemWvUVC7
         HEVVUOzTamTGaeR8mCjapSlmQV/cpqLgHsFfvKPPUvIyaACjILsc7xsWm9HVkNCfjMzt
         wpg/C2YyX1UggCBJcoySaCVCHmguC+lyEZfxD5j+aFUgpln/2X3LLv+fcsOtzTVu56iM
         Q0fg==
X-Forwarded-Encrypted: i=1; AJvYcCUXO3aBI3mmeJHQKGeiBV27ohfDIdK9z2H+lL4WGDTDxGFNN5oBrNZ+7cIWuOmFAZsWMpZQUMiqbOGuIjRS14U+2w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz521/RwtjGrDY74m1N6NcKClig6/HpdVZAgPeVz+MNqeZvEF8I
	+rbGPd/rhPdJHKkVsTZ9mdy1mcq+Yq8q2tauvg9iGBC+bmE9Sc4Skt8/l7Nq8pYYix0=
X-Gm-Gg: ASbGncsNY5GdbPF+fXsy7aGx1y2xMoPnNRuQcPTLgOzAkHRRENo6GkfqY45QRutkdqC
	LA4g5jAQHj7cHOdEl0TDoYG3DWzDh9pyYIY1DJmEdzMJWzWdY7RuBUvnQwJpGWdQ3zbydBGUAIP
	Ly6ucoTFMK9cVogNQohILfNocNhMx+2YDseQsIJyrjU68Lyfdpy+qkwbN/g44+E0MtA1aIgqmLj
	SnDvZ6C+4sm8wMEI0UYMxPeXozB8CzmqJt+hnYcqiIrWXHTNHwtk/G397AKCQ/Qga0UZ3hsYug0
	HTmMzSA3YghT3XRbogYyQZWj5v1H+mf2OmDoRNah9E2nr0og/pYWfv/QA6GkBe9vuFoCrG0+lHz
	KSCeBzlCePbhqOJ6FjIktSv2rr4HyqRUX+PVXRVJ8EqoUM5Fb9+9NZQyKRF8WRkW8y0+BkrO1Hi
	d4XNiry8sWxSh5tJmt1K6EwhdLSa6V6yAjNeAlwsyo1Mt+vzexNIo=
X-Google-Smtp-Source: AGHT+IG5kDWW9dEEuHX258Qk4WTXIkyTFBNiIBUZhWRXkgD1Aeggk6N6ts0khJchzedGqhwdb2H5Vw==
X-Received: by 2002:a05:6000:1a8e:b0:42b:3e0a:64b8 with SMTP id ffacd0b85a97d-42b593505bamr18557552f8f.24.1763553862994;
        Wed, 19 Nov 2025 04:04:22 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f2084dsm38431132f8f.42.2025.11.19.04.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 04:04:22 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: yoshihiro.shimoda.uh@renesas.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 1/2] phy: renesas: rcar-gen3-usb2: Move phy_data->init_bus check
Date: Wed, 19 Nov 2025 14:04:17 +0200
Message-ID: <20251119120418.686224-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119120418.686224-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251119120418.686224-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Move the check of phy_data->init_bus from rcar_gen3_phy_usb2_init_bus()
to rcar_gen3_phy_usb2_probe() to avoid having it duplicated in both the
probe path and the upcoming resume code. This is a preparatory patch.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none; this patch is new

 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index a38ead7c8055..b9d5bb52e02c 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -782,6 +782,9 @@ static int rcar_gen3_phy_usb2_init_bus(struct rcar_gen3_chan *channel)
 	int ret;
 	u32 val;
 
+	if (!channel->phy_data->init_bus)
+		return 0;
+
 	rstc = devm_reset_control_array_get_shared(dev);
 	if (IS_ERR(rstc))
 		return PTR_ERR(rstc);
@@ -861,11 +864,9 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, channel);
 	channel->dev = dev;
 
-	if (channel->phy_data->init_bus) {
-		ret = rcar_gen3_phy_usb2_init_bus(channel);
-		if (ret)
-			goto error;
-	}
+	ret = rcar_gen3_phy_usb2_init_bus(channel);
+	if (ret)
+		goto error;
 
 	spin_lock_init(&channel->lock);
 	for (i = 0; i < NUM_OF_PHYS; i++) {
-- 
2.43.0


