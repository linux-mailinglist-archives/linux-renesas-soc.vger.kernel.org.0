Return-Path: <linux-renesas-soc+bounces-17678-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F8BAC8CE7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 May 2025 13:22:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C437D1886517
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 May 2025 11:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D89622F3A8;
	Fri, 30 May 2025 11:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="GOVGmP3u"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F5522E01E
	for <linux-renesas-soc@vger.kernel.org>; Fri, 30 May 2025 11:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748604004; cv=none; b=tvI2XHz2Lnl+xQunS+B+Hq6KzbOwcthRtG9uoe/NDdDRvC3LTBHHCN547QBLm3hOEac/Eykn9cur0ovhymWL1Z5Q33+4DoiojIH+KhwCJ0hyjG7cLC8yOEQZC7l0xKv9rT16Kbi25xrOcsYCz5FvmT8aDSgR2kEq7hL7Ea3/sW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748604004; c=relaxed/simple;
	bh=PrFWTreIuoDsO+2dJtLRS+p9byMc23RZOKSzUzdjGdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nt6FO8/0xU+PXEJWQWYbIYwLT60wimKZ/GDCzHXJg7DkTRw2ZIBkSUzNTrs8Re5m3JSn+NueB7VIPx3cRzJPYS6RSjABspLVLUVA0hjp7MtTnP+IQtXDvbO3cq1weEk9vj4MBSuaO4LZ01cAKeF5elmMqMxfM82ACqgVz+ob+LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=GOVGmP3u; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfe574976so15303155e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 May 2025 04:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1748604001; x=1749208801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBGOjaATHiERWGlVICubjqS+hAYT10Q+U69oOw2FjwA=;
        b=GOVGmP3uTCvTkrkGmlk9XlPB7Zcc930lljqJSrcMoFR7ic1xGAqzYavWil06zi2mGv
         1+znsfSXNcU7BJdpSyWPzNlI3zsvNGfqfG1egeCbwtHmYcUwu/fIeK31Ua4pX19r0pSt
         GzYMBTdtRApDw9syaQcsooIxlWBOkrDJbutynG5UPmggQYjozAcfe8SMm70h1BvwLXm8
         Mf59w+tm6ZvJ53Uup/gg++/9hs1t9eiq3JbqC6FB2OM8OwSQK4YQKCAgWLVwaeCbNsoV
         MYvPkFsUMMzBYUFxtkeJvqK1afXhptMDP8zwwSr1WW+9ufSbd+O+EiLGeIx0D7ayGauD
         7Gbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748604001; x=1749208801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBGOjaATHiERWGlVICubjqS+hAYT10Q+U69oOw2FjwA=;
        b=iCxMb/+735340Uf4NeGtc7yJJtwHMvSHbGCzGCPtsgF2bpIoOA0WbwnXk2KinL5dpp
         F3y4pxTA/IkAc8L3ClKa6KSe4ck7A7CGgqCME8ywG/hE7N5e2PW4e7nUIQFadFWteab1
         9o3LgUVbFv5zB1DN2AzRTnD+tW0Rn4ckSGzU4EpaFMR3zJRx305AnI6izxXjPE7tcB/K
         cE4DQmbi0pNAHOG6bQRZj4gqhN7sOg0/30xCrqr1JCXT5O05OZYQ8fnJDLs0Y493B87m
         R3H/F74VooRQ8kqAWD5qQOTuGiwHX5ZTt364SAvqgMY8ZDEz7v4gHB9bNchhwJJ8fCYU
         WzAA==
X-Forwarded-Encrypted: i=1; AJvYcCV+SyrVn8gG6jIKO0fiOZlLVaIUZI+Ss2MCRKBVcu8wHLlJBc5mLNmEdTgrzztgn8ciNpEJ+UZlDR5cY8WqoMX5jw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy/k6veolul+WmOIXs4ICMQadk3q5/S8vqu0nOhR0eclaaHvf2
	3av8K86mGzygSHFa3OaTZPyWa0/7ki/vAKDgNRTMtAWUX6NLJNGP1Xt4LzWyXtVZ9/s=
X-Gm-Gg: ASbGncs1lv2c+PQA09iiDhGS53UfWKVNOGSEmLKDbxntTyXP/LNBkh+BJ3voqz3yACy
	QrfexUVTGKqonyNsNT9ip4YjsmEiQeH4vcg+WXWpthcgfh2RE5QaMfAw2Oq8N3ZWxUVZH0gxn1O
	4KElFWCiUAnmsFYT5rLkzeJ50VytEAlBSJ2AkKu/m2YYOiSQtSHeA/8gnAgTcPqbUIIY84EndZu
	3MQSIhjgwWYkfd/k9WaWxnV/FpM61kvq4qltxG7G6aXe4gkm/eJyire/dADGwO2dOwDjcGu5MuF
	NS5pE+oCzRYbbhkD4ACQNCOuLSSbEatHe2Jgp2QBIu4mFBPkLtKBL2vAD+hSnB8g2/aBjAabG4l
	5TW+zbg==
X-Google-Smtp-Source: AGHT+IFOnZeDzHLcJzr2XiB1V8TCQqZ4gnYI0oqjqw7IlK2qZ/Smc3vbO5ZYPTsUQejGYt+DG3ev/Q==
X-Received: by 2002:a05:600c:1d99:b0:442:d9fc:7de with SMTP id 5b1f17b1804b1-450d6546354mr24484345e9.22.1748604000826;
        Fri, 30 May 2025 04:20:00 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450dc818f27sm3986435e9.18.2025.05.30.04.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 04:19:59 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	john.madieu.xa@bp.renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 8/8] arm64: defconfig: Enable PCIe for the Renesas RZ/G3S SoC
Date: Fri, 30 May 2025 14:19:17 +0300
Message-ID: <20250530111917.1495023-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530111917.1495023-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250530111917.1495023-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable PCIe for the Renesas RZ/G3S SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 897fc686e6a9..3274d14421d4 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -226,6 +226,7 @@ CONFIG_PCIE_MEDIATEK_GEN3=m
 CONFIG_PCI_TEGRA=y
 CONFIG_PCIE_RCAR_HOST=y
 CONFIG_PCIE_RCAR_EP=y
+CONFIG_PCIE_RENESAS_RZG3S_HOST=m
 CONFIG_PCIE_ROCKCHIP_HOST=m
 CONFIG_PCI_XGENE=y
 CONFIG_PCI_IMX6_HOST=y
-- 
2.43.0


