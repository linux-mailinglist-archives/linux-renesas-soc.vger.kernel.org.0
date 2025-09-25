Return-Path: <linux-renesas-soc+bounces-22365-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4CFB9E89F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 12:04:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66F7C2E174D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 10:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95B1B2EA179;
	Thu, 25 Sep 2025 10:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="o0bWGPGL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A614E2877C5
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Sep 2025 10:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758794644; cv=none; b=tm8o5u8X5+kIPWtKZX5r0yG+fTzG7CN1e0CZLSD3KKIGWSempXtVJH73Z+M5sxn6mhFqMLedIWLfSH0+YcRoODzRUEw262P3/EeSMKEtFK9lswT69NND65+yyyl3fBLD2VlTOGByXpUjusXrO89G1TKAL59goJeMvn32FGp7k9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758794644; c=relaxed/simple;
	bh=5LwfQQA2FSxm0IPZZvIhDVKdNaeblYpwUcCGmdume4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LVx3BZiWCWrEm8Dok5+O9Ta4mncum/LcGTFx3Y+9gG4IQjCsEZOZbo/sViVzrozQexKE7Y+MPS5NI6fzwnPsjmoQuW9S7pN589EvUES0KKYwpTKH9FLcD8nMVNNxyjvjajIjltvRMxZwrmh+lk083nbcvz/GpEcQQIibzV5kirw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=o0bWGPGL; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3ee13baf2e1so688126f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Sep 2025 03:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1758794641; x=1759399441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZgyfHtUHQdMbguLJFX4F1FvUu8sipY+NMLLL9K489o=;
        b=o0bWGPGLGk/r1wxE7ng89MMOxZXQAkZD5RX/Us4zmS5QOvIqNmBiklBX4cL3/MAQRt
         APyMsTF7ThmRxxOyPVRF7+/nwc7Bk7AduJcHJE/OVonTKyiaRAKcD7sUAs21slDGkeks
         11OIVo7ZiobWmSnjUqaajaLiEkoRv71LdPhFAga9HFUuzJD8gd3N7dRCi1DJt66g5IK3
         LCNCT2CG5fauo9DYk8kYmE20mcfd6Cehu8iy7hXHQ6hB9YwHZCHltdi2i+kjf9HWH2Pl
         EfnqkRMIHT9suk4Nj9N6DYXDIlXozJjMcQTWU5jqK20N11l216b+v5V4xXYsrRUCAuap
         XvGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758794641; x=1759399441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CZgyfHtUHQdMbguLJFX4F1FvUu8sipY+NMLLL9K489o=;
        b=WWDb53I9WxOzke8d4pD+gC62jz1aURZLfI1IXKEI2iK16B1AF3bSlN+u+VcY8PfN1P
         Q+1V/tYj95K7AKijTUjc6RaK1VNGOyXIe7wzybSQPbr12VDdDyDGbLenM5VQejzZUW/E
         9Glqz6cOZID6nDVunRS8OURGq5kjrT6gcMkHqeOYjgHbxDaJy+sng7hzcowrTD7xunQQ
         q7j+owWPyJIINsYHTfK80MsTe5LCtl4jRFxTq+MaTztjHZ4WWhxIO0cmsl7tzC0hSwnj
         DaRkNIRtNgHc5gTDwySi16KOe/eXU6bDGU4yeOjFDSTPU2DWQ4u+uxOeJpo/kreECywf
         BEzw==
X-Forwarded-Encrypted: i=1; AJvYcCUCL7WnzzOYRrs/73wU28dbuyEyW/IqZgCswovgFgAaGOmcfSZIXYTF+kcCaQ+vOQ3Xv1R4H/V/mvoyqWqT943S0g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy4O9MIUt/LBNaARQnKnpeqJGlNfzXaEEpGgnRy3jCTOhM+Fzq
	hCPEG6X9w1z2NZYxLL2fI1t4o1YT4RL6BJl3FffIhnjpg3jrMoM7cum8nEqHXL/ztfI=
X-Gm-Gg: ASbGnctau51n8bGTecmpRUoadrxs3W+GxLpn3nARBOuAvpXzJUxIHb9Rc1L5gASk5dI
	Ao4vqJ0Au4pSSAvUhvEW0yOVCDWgEsjbBj/r98AwyS8i5GuaaCReK/QvRxTpCc1LbOwj+gQLt3R
	11TwsrbMsgG658N8BROgNRQ6sA4sao2RFJufgHsDadSr9DN6wN+OWdOvCTP06gC1zBqtFNbFH3O
	OWgb9lAiCPmighjyoJ3jd+hwmTggA9nShMvGhkD7z2fQ7H70t2OZ0a5KZP2rj/laeJAagREsMYS
	eBlruXrP75/wyrwc+nR+dNWNbfd2Rr/UuY3497+RyAoYdpg0pYWtC9H5m/GhFBUQJHjCRfjG28U
	5s2IcxlXFlEpktrVIfH6ggmFeQgfVnFCC9iHzNoXUU4cvziLD3D81sIEz6XVVxwA=
X-Google-Smtp-Source: AGHT+IHo/3qusJbcYRKvdsf6z3fzubLCdhWCe1adxIeyHLBVQ60Km31sfkop5cZSQNMmWg9wyfVu1w==
X-Received: by 2002:a05:6000:1863:b0:3e8:68:3a91 with SMTP id ffacd0b85a97d-40e4cf41e80mr2677896f8f.60.1758794640880;
        Thu, 25 Sep 2025 03:04:00 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb72fb6b7sm2501122f8f.2.2025.09.25.03.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 03:04:00 -0700 (PDT)
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
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v7 1/7] dt-bindings: phy: renesas,usb2-phy: Mark resets as required for RZ/G3S
Date: Thu, 25 Sep 2025 13:02:56 +0300
Message-ID: <20250925100302.3508038-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250925100302.3508038-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250925100302.3508038-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v7:
- dropped Tb tag as it was reported that it is not valid on bindings

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


