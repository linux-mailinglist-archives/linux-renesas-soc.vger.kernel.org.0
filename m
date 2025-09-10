Return-Path: <linux-renesas-soc+bounces-21717-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D665CB518B3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 16:03:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9B9964E355A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 14:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F014B321F24;
	Wed, 10 Sep 2025 14:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="RjC4WqNI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227762DE1FE
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Sep 2025 14:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757513006; cv=none; b=qzZWlmsRzM1tbzBNEbkKs2UsPcF27XDWGL6RJLutcasYUsDpRUMboMXXh+eKOCsdvtvIAQm9KwGK2UW1MBK16jYDXMulcrzHlSL2DUSey4WDyBAWl0OEBF3jZgqvVvo0X8+Yim2Oop+8qSAQMy9FtmRq6hfPqimv7OoaQmzWCG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757513006; c=relaxed/simple;
	bh=mIES78B6726Znvf8L6XTq1c7dfrUiohkxj+gjIIj/0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LimMkN2rx9NP8aKr7reo7WtVCzo8hhEerg12AFzIpoXnzaya1hHk6blWrtdvmdU6yTF2pQyUiRZj/HEzUUTGvzIwMQxzqfH9K6Y6J4oOXOMEYZHanEA48N4buFX7fENMWN5xYVsZ/xL8JfS/xjIG0nZf8Lp7lwtk3f0kwznHxao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=RjC4WqNI; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45dde353b47so21380985e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Sep 2025 07:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757513003; x=1758117803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/VRRoBJDxUtuCClVOWAtoorGRAjTpvhk+jM3BYoUxN8=;
        b=RjC4WqNIESNPp4dqszRZR95oQCaMhUL5drrffpgkfmVxkN0y72k8naR+jotCgZMEif
         4sMAZFgsKNnDOpKR/UoK/cuv49WbLvrXdAdeAWxuXM6aYka2EK5+lpYv2hU5R69sSENx
         rxXMYT2eUCVz1kRBwQFj6bd3uqExJbfoGu388MNUbRXoSzl+IxNhW6bkPuydso8oghM9
         VUePHir0UD2CkEROJIrHAuM7ZoscKYc7bp19cO4WxtoSV9T58PWB/NMbPIdA0fFQgAa5
         Knt3gQ+nzSc2fq3CGd97aisPRcMdcj/F/qQMK6sRTLiRXdoHfFumKTGf0u+skX1lBNSZ
         z/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757513003; x=1758117803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/VRRoBJDxUtuCClVOWAtoorGRAjTpvhk+jM3BYoUxN8=;
        b=gaxmTVtRmxyTyE70Dz2zhNTLcBB782JfdC4UhA/UBW6dxpZ7nPjrSi2H22/I79pjIw
         z675xPzjagpGXGiKomeiTrX1l1Iic9mzirf4fTdx7YU5g6SgUNJjar8ha8GGton/PUGh
         BoHkaFzWLozPRpPbVBK3Lv8Qu3jna7DaNpc1EWym7BOVn1IE6yLu9J9wZMSb3J137YqC
         1GJ1g1DGw9V9uS0LjVLwmJXqtwUne5vKGjoOEQHiCAaRes5SHvuTNVD9PK6dDlMjyGYk
         x6nf9FpWnKSq4U5RLLs5/gd9FVrnT2dHpAPG+KG3OPzR33Z6CdBM8udjfZ7+nOL/OOe3
         rQSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGwigdSKM5xrwk1uPR9Afvw5FNiMISxX8cjXrra3L+IbI/4pVS/SD4HfmIkxN4kHDErgkZpIU0hcDNWaOdVL534g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDRaD/VIi0gSCGbVFDo8AhrTUEn8rvtKMnQbJ1LfmflPlhBsdc
	jPU0erPDj5M6/IXz43OXRVnK9mItNAUZPrHhIMTmL1QMG1SHfAAw8p+AJssF1qj4vMk=
X-Gm-Gg: ASbGnct1XaVVqSrwFdF63LVLAGlSt13fmj2UWZ1+ASr++XzcZ4OvoAjvBFVuIZD6lGO
	ehewhzpl4OCyCynolO55+6Fl3uUAY/N4iaAycSVoYQo1iD4WE62QESVBrwDcRFORLyZLJ0NW8n9
	5i4FhbKOXM3CIg9b+w7s8oAvRlSnoN4EaSfZ5Pc4WbAaPE9xipk09pny2Qtb8w4ZatuZwbwDgnN
	k/tS06NemmM6f/vVWju3zZq7X8yG/wYVv4wWkrPTNUQ6o/6o8QiUUXSXIU/yaJBFLOEPSvegpgc
	9ksjGuQWwwL53UaTgeAJI8bZHjCqhqezfMWKBCvmppuuyNDRthZVo0DZCPseggbTbDiAuES0JyI
	3vloVTmZlm42ivuo0ceSvdrkil1WUmv/rip8DsXZgOk7htteGrRii
X-Google-Smtp-Source: AGHT+IHhfcHfzteNbpb670GfMcFeMNBt1xhdYwJHk1+Sw0KbXw/4z1Sr9oNd9yxGkx0R5Z7OW1OtIw==
X-Received: by 2002:a05:600c:840f:b0:45b:6365:794e with SMTP id 5b1f17b1804b1-45dddecdacemr152293835e9.24.1757513003366;
        Wed, 10 Sep 2025 07:03:23 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df804bce3sm29523875e9.0.2025.09.10.07.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 07:03:22 -0700 (PDT)
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
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v6 1/7] dt-bindings: phy: renesas,usb2-phy: Mark resets as required for RZ/G3S
Date: Wed, 10 Sep 2025 17:02:59 +0300
Message-ID: <20250910140305.541961-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250910140305.541961-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250910140305.541961-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The reset lines are mandatory for the Renesas RZ/G3S platform and must be
explicitly defined in device tree.

Fixes: f3c849855114 ("dt-bindings: phy: renesas,usb2-phy: Document RZ/G3S phy bindings")
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v6:
- collected tags

Changes in v5:
- none

Changes in v4:
- none

Changes in v3:
- collected tags
- rebased on top of latest version of renesas,usb2-phy.yaml;
  Conor, Geert: I kept your tags; please let me know if you consider it
  otherwise

Changes in v2:
- none; this patch is new

 Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
index 179cb4bfc424..2bbec8702a1e 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
@@ -118,6 +118,7 @@ allOf:
           contains:
             enum:
               - renesas,usb2-phy-r9a09g057
+              - renesas,usb2-phy-r9a08g045
               - renesas,rzg2l-usb2-phy
     then:
       properties:
-- 
2.43.0


