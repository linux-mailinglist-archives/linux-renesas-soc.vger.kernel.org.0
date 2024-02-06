Return-Path: <linux-renesas-soc+bounces-2369-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A28E84AF63
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Feb 2024 08:54:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90FF91F258F5
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Feb 2024 07:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D4412D744;
	Tue,  6 Feb 2024 07:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="PCGSyNaK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1990412CD97
	for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Feb 2024 07:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707205947; cv=none; b=MJo1xdTnM3aNXDC1ffPaDBSOCoV5wNmPP8D6fcRW/bHSSRe6eqi0StxsGDGs4PL4G/Sn0QP0zGzfCaErtcrOPervQyX0Ws4RAQE1qVXheUmp4fpXPG7WETWFk/D4Gj6fxA2MYbkXIr8mEmBuMACK/eA7vRXBDFWAAsGQ8oIZVIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707205947; c=relaxed/simple;
	bh=vR/061UDD5TR2oXq7LH1zZoAUat7cIdF/cOUx86FGVA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=px9DNyek0hiJvxWrvTpMc7ap1OfTCI8+7E17pw7v2ZsaXSNlpIodc1m9qGAvrgYRFGYo5xwp/Bo6OR2ooGTa2rwhgRFjw09pgdv4UwHwOq6svwLO8osuC3MF3jOt0wI4PyRJP9dZBxdd05q4nHU3LZSedf1Rr36HaF+GXOHOtdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=PCGSyNaK; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40fe6c66c3fso1329365e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Feb 2024 23:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707205943; x=1707810743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nslo2KqQ/crFqeERQmjq+RimgA4EmUsTWWhunmms0IA=;
        b=PCGSyNaKpUdTBV44ZY8r19owFJGHQLPyEeECUal6K3csajvkOmHc1MrAPlCQtKijjH
         qtcDgNmt4Vr4Je1DEyR9RK3xrosIn5z0eYf2XiIMOMhgyweFresF5XtPSo1y1an0nP3q
         k0iyrZfQlZsxL7lXQ5ogmh561ukWXn4W+uKVin/QLHyfMOAGYn+I66GOaYI9EU9Zyy4/
         HNQS+I9OHCoFbAfAVQImEcIRZidlBSlCm5tAATMXEdn1jt82xTxQ54aih+l27Aklq3cM
         a9G+K3vqWCrY+Wre+6C5M/rS3U6b/J59ku1aZDdiSP6gTQTSwombUEbBgGqTB4Okx90T
         5DFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707205943; x=1707810743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nslo2KqQ/crFqeERQmjq+RimgA4EmUsTWWhunmms0IA=;
        b=TDTtGK/lrhlTTOxV7T+iJk+iMihFYQLCZuNMhs16cmJ5OTeL5kM+zZYaUOzRNhfr3+
         F8Je+ILygGkLFA/XqfCnDtPuABTElD/THKlUFNNyUu4RKim3HyOwAnMfsIBABpihv+il
         jRfoc1QpDQ/M9TLcPRomi5RUxh1TRiUSaYlWy5vHfp4UantMJXEonCRiOmpGRuXNpqeL
         4XM9i0A8Py3ahRn78l75aUt8PnrRrz5QMTIXdUiY1ctJ1Z05HNtCS/Onm3Yr8oGtHWcQ
         0eOaJ6B+gQ/uoD6S1+wZMWjVmCgkf0wZ2WIZH68eyDTNb4X66X1Y9WlBCoIfNhQ6VLez
         LRNQ==
X-Gm-Message-State: AOJu0YyRb1Sif7wZiPp3RymQIXTnYBwwZ6zSAlRD9DUsohNfaBoZhKRK
	o72uib+ZQQ66mVLjkkTQsNQFhETGWbdmFKL46YWkz5UyfEnNTTYaKNa56tQgs3k=
X-Google-Smtp-Source: AGHT+IH0DcABr6gfcMRuxGn3CUTdqmHBzNB66l7a8pXOCpsFRKIZ5TZrhJVEsEPoXJfelqK22/1wSA==
X-Received: by 2002:a05:600c:a39c:b0:40f:b283:bb00 with SMTP id hn28-20020a05600ca39c00b0040fb283bb00mr905382wmb.18.1707205943227;
        Mon, 05 Feb 2024 23:52:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUByh8gVDOXfKSjUHDj4WM2iwjOaOi+9J3toa0ywjhR3II4dU3o9/xJri/AmIRviLmjV78QUbbf/HvcU649LBSZdQPKGCk64WxZQD16KXO1YSke2CvHYlX8q1WajPTf1CSR9+uyHq8rJXbkCXCNVl5g4JAErCysyVMxGFiORo5GkNF97ejKsuyNeDv41fvIp5RXaQjIR7aG7BDz3gegTI6uGe6hAWpM2ihYg/kmQudwmFVpwpqLZEjuB9e7ncXiS61MKrDvm7vTwwvkulylQX2AgAkpAlTk2+7xyrQJBnH4lP5pxiAp/hf88OF0HyafUY/uFY2RVujXTtukqZqlgkhY4z5H+X7OhkHjoFyp+Jks+ItdvRkf2OJLMGUPmZintxSbTCbUQi77MZfYSVH2SRPSls5a9lbovCxxo+Hq23ipc/yvd30oTCROiomILHQXVqgh3K0iDTl/g51gT5QLNDDCGOKB0mz5Ik44D9P0o6/BvkRxZupdukyY/ipnR+TItJcxCLfcZ4DcAfVaoy58d6XzqhsJG2yttuR1zAOSFA94+5aAdUM=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.154])
        by smtp.gmail.com with ESMTPSA id j32-20020a05600c1c2000b0040fbad272f6sm1106843wms.46.2024.02.05.23.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 23:52:22 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	biju.das.jz@bp.renesas.com
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 9/9] dt-bindings: watchdog: renesas,wdt: Document RZ/G3S support
Date: Tue,  6 Feb 2024 09:51:49 +0200
Message-Id: <20240206075149.864996-10-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240206075149.864996-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240206075149.864996-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Document the support for the watchdog IP available on RZ/G3S SoC. The
watchdog IP available on RZ/G3S SoC is identical to the one found on
RZ/G2L SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

Changes in v4:
- none

Changes in v3:
- re-arranged the tags as my b4 am/shazam placed previously the
  Ab, Rb tags before the author's Sob

Changes in v2:
- collected tags
- s/G2UL/G2L in patch description

 Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
index 951a7d54135a..220763838df0 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
@@ -29,6 +29,7 @@ properties:
               - renesas,r9a07g043-wdt    # RZ/G2UL and RZ/Five
               - renesas,r9a07g044-wdt    # RZ/G2{L,LC}
               - renesas,r9a07g054-wdt    # RZ/V2L
+              - renesas,r9a08g045-wdt    # RZ/G3S
           - const: renesas,rzg2l-wdt
 
       - items:
-- 
2.39.2


