Return-Path: <linux-renesas-soc+bounces-17320-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6B6ABF778
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 16:14:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CD8E188C0D2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 14:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0CF9286893;
	Wed, 21 May 2025 14:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="avZxFlea"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C23285405
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 May 2025 14:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747836632; cv=none; b=eLbkrBP9/WnuibACg6d6WVL2ZTn6dv2pv7CIBV2rjtUNj7e49uBFQxTajWyH7tHfyRo7TXwK90ifw0sxPMqpFl0twfi8BmXv/tY8RK219SDJ4c+KySsQZMAqkvps+8WwqNilHejl5ZttF9tC0D2tjIDuchEbGmGUlJtx3qs3slg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747836632; c=relaxed/simple;
	bh=XODCdlQ9JYoDDsNnzBn69mhkXEts4CheV3BPuja6CXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n6OuKpqfO/8g/E3XhlrmInPDYqeOJR0+Ajyrfi9vg8SYOXPtfi7rr2dZKtdrIXLjB4+0JXuBhbXeDYN4buE4X2JfuUahegAxZABUnuqntD941fxyABwmfkjTVXsP1ZJuR0JgJnDVsXtD+0WygcwkWjIfWkB93lgL8M8/XlqELwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=avZxFlea; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ad51ef2424bso1050965166b.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 May 2025 07:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747836629; x=1748441429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cl9iumKUHycZw2LuiJs/rBHFbGkhee2I0sRJSJxgwN8=;
        b=avZxFleaiifhZ8pBzOZFs+QS/vthJ/5QLTlVUlw1qPxkXUKj06TGlt+vkbPDvIQ6bq
         f8EKsXaUqVEwMB933FvB+3ri5mlQgE6+ad4b0Jpqq7+Nj5pzkZVVsjjQLl7wA2EAY+Qo
         IyrBlmun5CBOJNHXBlYUMaWegiMV9t2Brl7O6CRpWb5OV7vsKSjZIebvMyEyJPJfS2it
         91DE8OB0yWOSASVnkJG4gqLxqEOBf985P1pFy48MWIOIV5ITXdIhOeRfVWXIxUV5wW5H
         K7eoh3nY7p2I/j4qqCuFR4T/ooBQVA+hgdAEjtNJ+69zFPHoVmF8gJDONKjrZ0QnNnEB
         pwag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747836629; x=1748441429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cl9iumKUHycZw2LuiJs/rBHFbGkhee2I0sRJSJxgwN8=;
        b=UuVbh+tzXBkt6RcnhpOhoVu7186UGDWKGpQ9CjgEzomomHF4Txc2j7fUaLhVHNXvRp
         GDB9RHcYjuxSnTC/HoP6Ea6XrklR8lSTHsOt4lpxEoPFGGgdEc2b8Yk6JlvyVrqVWx0j
         WPtCV8rCC2e1V03IbDL4p685XZs+WL8IMdJO7OnV4bn337k+C9mw5ezSuGzKdPHZKUhi
         JiedXDIIpz+AXTI75BK3xLFoiEKIX6FlASy2vP38EfcUZuodkb1hIZ9P6on25Xe2A/2h
         Xtn3CCjqycwwRUbQyiyv0YuynuNgb7FR2xUna+TQMI871cnPhBTDnEsU9jq8zWlg9MpF
         tchA==
X-Forwarded-Encrypted: i=1; AJvYcCXQJ4wzS3W7UGBR6Rs3v15mBhnC8d5f5RW8jvHNPMt2izxjyzRSTaM91wba0qgKXSQt14YlPYJ1C9H0ZlfuWkfK+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdKVNcOMsym24jsg6mzEcc3zhl224Pd2B6K4vi7sUBYQ8K2fIg
	d5LDmB2/xt4/L75Fhw/zztXfAxvGAZhOAUbZ2cYZ2STQnMVym3m5qiW7F/HUV72EJBie4ql+vP3
	d3+XL
X-Gm-Gg: ASbGnctupltLvznkE36emBIkRPb8gBwaX9OPSeqlAybj2yeZ5A7f+WsZZr8g2i+Se8O
	Nzgjd+dwTjmhmXks1CKRFHISevSwfoOd0HODYhA/BJ+fTmE26Gs0wJvcK8SrJbJ5qX+tvlxb6fX
	2XNb6LajnZ0egaPt61UOQ8xI5u11D+dj3cWLeB0Bv3pzE1KV3/3ClaPMW9g8LBCIxYubUI1aKnw
	Qco5FSDTuIQPi5uFgvqYkIONCljMI2szVZUeCzic0uQw+Ksvw8QVa5XK2vnzA/C0GYHLHXZRvTx
	4ruYsaxGKy2UykTHJe7x/po0IKnkZmm6yQwVk9TAUS6G0jrFz6ZKAwzYn1KlmqTQ2NFGiELKQVU
	w3/wN
X-Google-Smtp-Source: AGHT+IGD2TFDUAmZSCVXr+Ck8MJMzjDFoIU+oJlf9NZINhEoKVsrTuMXHWv6l6Kj+MwSbuL8IYJrfQ==
X-Received: by 2002:a17:907:968f:b0:ad2:53fc:a884 with SMTP id a640c23a62f3a-ad52d549101mr2012530866b.29.1747836601240;
        Wed, 21 May 2025 07:10:01 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d271916sm914552866b.69.2025.05.21.07.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 07:10:00 -0700 (PDT)
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
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 04/12] dt-bindings: phy: renesas,usb2-phy: Mark resets as required for RZ/G3S
Date: Wed, 21 May 2025 17:09:35 +0300
Message-ID: <20250521140943.3830195-5-claudiu.beznea.uj@bp.renesas.com>
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The reset lines are mandatory for the Renesas RZ/G3S platform and must be
explicitly defined in device tree.

Fixes: f3c849855114 ("dt-bindings: phy: renesas,usb2-phy: Document RZ/G3S phy bindings")
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

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
index 2822dce8d9f4..12f8d5d8af55 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
@@ -108,6 +108,7 @@ allOf:
           contains:
             enum:
               - renesas,usb2-phy-r9a09g057
+              - renesas,usb2-phy-r9a08g045
               - renesas,rzg2l-usb2-phy
     then:
       properties:
-- 
2.43.0


