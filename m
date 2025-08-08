Return-Path: <linux-renesas-soc+bounces-20127-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07821B1E228
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 08:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 043391880469
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 06:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A853C23ABB3;
	Fri,  8 Aug 2025 06:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="V5yDFkHB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879D9233721
	for <linux-renesas-soc@vger.kernel.org>; Fri,  8 Aug 2025 06:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754633915; cv=none; b=nCp7GjxHF5O7vki5w5i9oe3zD1Ng1E8Q08jXr/HO7cuKTRbVGRXo5hEokGa3O050SlD2snkuiNGNXIqxZWaJJFXrsQMwJp1sG63s4r5Yxe4/eajCCaMybUk816Gojve0HXyivI5R4ns243swZbOXKG8I96fXXO4E7h2Xlx/YkMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754633915; c=relaxed/simple;
	bh=d51qXhMFqngZ+nXqw82toVbILYHcU/fluB+NBuKSs8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e5RhmjhtqRcNgbxvBfMUnucbPhc+Gs6pUJZGGgGem0MS0ztEvZ4wgenGR9OUzUx1L7evyLV/n/Vw9JUEPJhIS74vwhC9YcF1mNO+FqTj2bXZGVoCvqJfct1X0GnqVM3r2AOEbzdKPsKvizKRYd08G0UzU+wpilRX70lR1p3lImA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=V5yDFkHB; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-af97c0290dcso325606966b.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Aug 2025 23:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754633912; x=1755238712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QgaBZoG1YrnEA6bfqCkXkFoVQXkJH/A3swaWngLeOHQ=;
        b=V5yDFkHBNQdwb8OUYVeapmH6EbojB22hATBJpCabSihJ4VpRb+7Cag04mmAH0LIaSP
         J7DbJfv9NraRgjCeHkXGKC9NM1KTMKpb+aXj9Zwt0FZorAKN9BneunXqxV3pXTLabKNG
         U1WnPNXOB+wPJojuhH+DxlG9Qn+7dgX1pjl+G+Cc+B5yWotRn0D1Aedth6I9AG68H5Ww
         WZda5+9RCTiBvgRv0QRLByKv8s2opd+uzjvAJVddtOv21PxRHb+Kvb56YcxqyG7xyxic
         M+OvaM8B9GI4+zWVKOU0BVwcxHRW3rpWtwFyzZZovqV5yC1COxQI7lf+Qd20UR5CRu0c
         m0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754633912; x=1755238712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QgaBZoG1YrnEA6bfqCkXkFoVQXkJH/A3swaWngLeOHQ=;
        b=fUVNaycMyq8BRoDEew0qa3U6e8u1qY7Ujp/mycrTyAa8HcQC5ixoRW86a8pZxGVKuX
         pur+7m9WIgcZiGABlLersAchcLL4vt1/rUdEiYzYE9W1ByglXCCuDw5k4gBf9vMi9Jp/
         DCtkDbe8NrhOygMFcMREiCO2tayDWvRdAz17X2bbGB0iVdy7kDnsCUri+7NPdOe1cx4M
         sTIr7B/bzlW9XQOjpOoTe7CgURR9TcpAAxmemH3ij++ojtYUulpilhSZut53xSB+EBbf
         QIvpfwpJDjStzFkPptqXjq3KbZk5HmsPCPiSHd6tbZJRkMGdA855Dis8rHQ9vsI6j7uS
         IT1g==
X-Forwarded-Encrypted: i=1; AJvYcCVBxYrXYRxsm0Y2+9CXqcS5Xs5Qb/8kPOt1mVyFtPQ00/yADwm0zm+XvWUSDKY23rklt3AJqulH20na8SlwTFP6eA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywebr0262VCZ6kPvOvSzkkUq4aPYopFBZrXaQsIfmOTQiuSYOmD
	IAZU5HNu57zeOxCgZshEn1gsQ+xxKv/28YZS4aDPVJN1MVvgH4keXZrJVBzMkEt2ZNU=
X-Gm-Gg: ASbGncv0LT4JbFjvhAA2q6DAg+HYErDz97X5ioyRTuOCfNzy4K2cgPxxRBD5WmG/VQa
	dfzmFOWqLM/f0inVx7TOw1pF7xFa8MnFxFqlSAzV1+SaLBvU0JqoJFXNrEH39QCxZtpIXHPEf7Q
	30uvAthlFmDMTnx5IC08eg/S7TEVVwzJuFigSEiTUMT8D5l2qIN1XzszbcfJ72FBQ4yc57i/Aiy
	JR4Nt550gYmjPBSwpun2NW2Y1Gni/NsF3DXKPBn9ri5mdePEohW13cOhE3jrq0HEThaatXxNCvb
	37lX8ajeHQjlaR0X/BDktbvZPc5UWkAcW5TeFdnNH80YKo0AyDYMMsv9g6Ruh+3hdeBXFqQkI9n
	SWE86Gg0dua4x6uaLTnuJuGAF2Gnh1PZXaxg18rQCyu8XSP+mqB7tnDq/GLqR4EI=
X-Google-Smtp-Source: AGHT+IHttm5+ImjErw0mMRHoLiZ9CbwBXmRFtvaluIHBtf8iEFaAC3msQWdYIGs1nItjsBv9XcEAOQ==
X-Received: by 2002:a17:907:72c9:b0:ae0:d08b:e85 with SMTP id a640c23a62f3a-af9c6613dd3mr145882366b.61.1754633911879;
        Thu, 07 Aug 2025 23:18:31 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a218ab4sm1440488566b.92.2025.08.07.23.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 23:18:31 -0700 (PDT)
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
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 6/8] reset: rzg2l-usbphy-ctrl: Add support for RZ/G3S SoC
Date: Fri,  8 Aug 2025 09:18:04 +0300
Message-ID: <20250808061806.2729274-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250808061806.2729274-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250808061806.2729274-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas RZ/G3S SoC USB PHY HW block receives as input the USB PWRRDY
signal from the system controller. Add support for the Renesas RZ/G3S SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- none; this patch is new

 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index fc14c41f5572..8aa2a5833c2e 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -108,6 +108,10 @@ static int rzg2l_usbphy_ctrl_status(struct reset_controller_dev *rcdev,
 
 static const struct of_device_id rzg2l_usbphy_ctrl_match_table[] = {
 	{ .compatible = "renesas,rzg2l-usbphy-ctrl" },
+	{
+		.compatible = "renesas,r9a08g045-usbphy-ctrl",
+		.data = (void *)RZG2L_USBPHY_CTRL_PWRRDY
+	},
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rzg2l_usbphy_ctrl_match_table);
-- 
2.43.0


