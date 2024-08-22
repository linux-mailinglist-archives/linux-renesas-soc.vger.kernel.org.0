Return-Path: <linux-renesas-soc+bounces-8045-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F41395BA49
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 17:31:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F45A1C219DE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 15:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4EC21CDA37;
	Thu, 22 Aug 2024 15:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="TALQ1WPf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB6F1CEADD
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Aug 2024 15:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724340517; cv=none; b=al54YmbzGCIAvTfUWpik2SCTaVfXjuX+9jA4q/TRgz8PFIhAVfkdCBnO3sm3mlkhN4Oy44j/rMs9KIwjs1eppB1j+NyMQ7xpqjwKlequFepxAUnplTFx8WqbHeGsqQ3kG9dvrPFoZQ3qZWDsuzAThoaS2A89HLLIIpLqccNmBx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724340517; c=relaxed/simple;
	bh=mG2HhfWd8qCb8fqq+XG4F4xVuNxXzEDJIM8/ycCUv/E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aconfUEjp1RcIO0IXNlwaJtPkDxK0kFDTODy2fF0wP75Ngwp+bJz7eBOmHhXo2nnZcEZZgCD2kki8hecwqA2sMUV36yEcizWv/XuH91SoeUT03OR9o0MG/b23W0qhuqLi86g2E4fHysYnoOnNOTkrh6fd0uuSMdYVBjhyt1Ojx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=TALQ1WPf; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a7d26c2297eso121688166b.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Aug 2024 08:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724340514; x=1724945314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGjGXMgxdEYAGo1GbGD2zE9hgBaB/Zwy6Dj9nf1BYt0=;
        b=TALQ1WPfsGlwnkAcUoHj25P9VKpYFU+aShb4VqPEViLtKjkDktCDKkujlRbazFzGh1
         rJrB9FsJ0frIrXfCw5BxgDbCwI904Z+3cg0ISE/ZIsLYWFaJW8rzMu/SIAMXUcRp5ZT8
         +pGkiBKnhlCbiIjiyl+rn4vtN4Jh8WCBaCpi+6CB5ubtAaXCf9/L8QqRn8TT9knwphwu
         a384FK2gmqWDdeSMb+7DRB8sTH9equo624fxXNZvIwpiA0aYZJ7n4dDbAmDkIbeex7QN
         4pANwMKr7a2weQdFgZua7+0NdbXJxxYpHDjZW3UOZX2Io776w76AkeLRS03twigAEPpq
         CRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724340514; x=1724945314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mGjGXMgxdEYAGo1GbGD2zE9hgBaB/Zwy6Dj9nf1BYt0=;
        b=KN36eCp/AH3vcpi4rbCB6PSfZVENNPw4nYVxao8n4xVtETUKqCX9JgLW7t/krwJ/DJ
         bn2LuGWqe47Zwd4kPZpk1+qDMjjjGkxCHpIGasJ94t3CFxRFwZlTuRVcBPQC59Prr6OX
         PEwcVMYnbyIU6RALOpRF46i6VuFgfJSnOQfyY/7zzbjeBPS1DajIX+eQ/BgjVMp+R/ih
         T2tdrjRHZ+lIPFhjxaEGHMdhXYotPflUEckkb51qYYGYd3idscB+RquxXZd5n8daOxdY
         Pjy20a55bluwie6TUCHvDHZLAxhgyf0684AHkHjNth0nrU2Ac7zN/LIqe6zR9SHP15GA
         jX4A==
X-Forwarded-Encrypted: i=1; AJvYcCVgnAkbE759yB7T75HBezKFvyaf9PhZnvuQZ2Fsy3DdZa+k8b0BaC3tygltXXrXuNM57RUs1CXAFpvJafM9mZcL/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4/kCB5+JtwaWmPhsnrpzfnyBzkRCE3Of+xJtZgFJoMqxrogja
	aQjLxYpVyqcA3W1ZHG8M5cXvMRO/rM+jyQFn306CnxBs5KyFqXfbf+iIeipXEFA=
X-Google-Smtp-Source: AGHT+IGJeJoxOq1tlRUs+MCEa5uz16WViXX/h9LB3VGUBluXlsLHOcyR6hbTFMMPgE0Rs2wdaLi06w==
X-Received: by 2002:a17:907:f74f:b0:a72:40b4:c845 with SMTP id a640c23a62f3a-a866f70378emr511233066b.51.1724340514344;
        Thu, 22 Aug 2024 08:28:34 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f484dc5sm134189166b.171.2024.08.22.08.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 08:28:33 -0700 (PDT)
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
	gregkh@linuxfoundation.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	yoshihiro.shimoda.uh@renesas.com,
	biju.das.jz@bp.renesas.com,
	ulf.hansson@linaro.org
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 09/16] dt-bindings: usb: renesas,usbhs: Document RZ/G3S SoC
Date: Thu, 22 Aug 2024 18:27:54 +0300
Message-Id: <20240822152801.602318-10-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The USBHS IP block on RZ/G3S SoC is identitcal to the one found on the
RZ/G2L device. Document the RZ/G3S USBHS IP block.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 Documentation/devicetree/bindings/usb/renesas,usbhs.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
index c63db3ebd07b..0f84cba872ce 100644
--- a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
+++ b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
@@ -26,6 +26,7 @@ properties:
               - renesas,usbhs-r9a07g043 # RZ/G2UL and RZ/Five
               - renesas,usbhs-r9a07g044 # RZ/G2{L,LC}
               - renesas,usbhs-r9a07g054 # RZ/V2L
+              - renesas,usbhs-r9a08g045 # RZ/G3S
           - const: renesas,rzg2l-usbhs
 
       - items:
@@ -126,6 +127,7 @@ allOf:
               - renesas,usbhs-r9a07g043
               - renesas,usbhs-r9a07g044
               - renesas,usbhs-r9a07g054
+              - renesas,usbhs-r9a08g045
     then:
       properties:
         interrupts:
-- 
2.39.2


