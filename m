Return-Path: <linux-renesas-soc+bounces-21216-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C82E3B40944
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 17:41:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DA643B3D6A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 15:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47EB132ED2E;
	Tue,  2 Sep 2025 15:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XHP3WVI+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7496322DB2
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Sep 2025 15:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756827662; cv=none; b=kE87Fu7ENvg7zOyVo2ZLFGdWdGXYoXbbrOY5BvCX45UrTSc5xjFQcHfTmHP533Qq0RcW+wzrJa+V4H3rdTeG/Y8vpx72HgBg/PX1BIVhxLPRMgU5Vu87mMWjEm6o6gi/HxDqglKirbtInFIxkk1ilL6337isFxo+Qu6KRBer698=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756827662; c=relaxed/simple;
	bh=sFLVskm/GZvqeQI/f+rrxfYgvGE1+3DHh+EYMzpJNhc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j8venRjnURjIqNVZZ4SKf9XK7oBknIVKXDgxiZIr3P5B5ckA/4iJthwexk3CTAr6A+5QVI9ycewbCGrFnnv72mzfHUMnQwJCk4E+MGquxToWX2nzVfzKsYTkUvKgcZG1rkdhQqoWeJzo0aMEOTziZfmFoCXC267JImKTsIZ3pNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XHP3WVI+; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-61d1f60aac7so760758a12.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Sep 2025 08:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756827657; x=1757432457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wB2hOz6NFjWbWAhm1PV1EJGvhxwPuieGYAKDStpXw6s=;
        b=XHP3WVI+RNDMqCh2yt9MR3dr5UtbbYHT2Wz2J5EYxUGWv9H6xCpv24rlB1wQJbOW2G
         BFwKOtkFkstQEpyiat3sKKgCYFTJ6684+/0+JuMnpgDoDnh3Ebp/Svo0lfDC21GKAOz1
         QzS7Zo+cYl0UzXmpZeaVR3DGA6WvDLzN5YaV9/ESdF5DAiL4D5VaiBTupL/h5cSken9E
         Er02XsJwBnfAxGF4EGI9MLWHiH7XJu5BLuaRrYR4MoqRxt/sR52QJk2tJZkQmF7czjTy
         gOqvM15GPkdu1rw/Jqq49CI10/QHetYDjfhVWFOI3dWhVAag37w223zZVMk3Xii0GeBo
         /LJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756827657; x=1757432457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wB2hOz6NFjWbWAhm1PV1EJGvhxwPuieGYAKDStpXw6s=;
        b=VENy/Z3urGJj2r/v4HKcM0fDULTz1ZAkDLjANsG8s333gZqvUB7iXr2MJz7kMMJ1VC
         WInSOelMUlvmRz6RHIC9yXbK/AfYd9QOX3f06/HmWYYnRs3h42Wgu6zPj+R8lWycvas4
         iFyqGVEgJW5I1xCpi7+RIbyjshYTIXQZemnsbicz7vInbegaPCOXhV90awMWWZwVAnAo
         FF5vhnG93lgsVjzFV8Y588lRZdrlJ4tSYzO2Nrub8/+hhR5pug+YrZ1dSO8dDOg2D03s
         2FeGVgyMI1TxAuqjTZeQQpHzjevro8Ao/q0firQ3RltbJk/2xLQ6zZAfQi48kviDMK7r
         2wYA==
X-Forwarded-Encrypted: i=1; AJvYcCUzi1SpC2OhbZmdh3kmjO367vdSqVCLB+8O56A5ZJnOPDeRfptSID4kWhQ0tzt57H8hFch9EuvK63cCvssuo1bsUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyN4oKfJpJiXDNyvvqD2EDWmhCFZs6FwNNlF10nmWTkEoda4MMo
	N8SV3A7+Jy4UdTK9wzKaONvULPvY3uNTH0h7LNU1kT3ZJmMufDZ4w7IJC9EojyAJayU=
X-Gm-Gg: ASbGncuAhTY92JMOv5u1GVcmIdI4Hb2Lx/Lg6jiB3AU8lTVTt2NYn+5kTb/NeLd0SHG
	YU6DS/X0qsmFjSMgjDFPNIt2qUBiVrrTkcYf3f/mUtX83KC10Zca/zKWTf0nOLPXMe3B26fl/+f
	qEHvwIljVPkRLy24lnefw7sLav/4VmnPHWlVyT4NNuxoGYtP/vTFJA5VlScywZjGqfP0hz3HcI4
	ynHfLDXrTMvwCmoneDz6GPNXTrcL5EpAfyReZ24uKX+AkyUyq8dlV6D8jrQc7ax3WIIYx/jNKk2
	HLqu09cK9hh598v6bmL33do+pocZSQZP8Fhs/LOohVovaLaMBpz91jU3Dgjp4Maa52hVR5CfnYn
	KyD94PBmy2dEe1w2wWocoyFPKTDKKc+mMcA==
X-Google-Smtp-Source: AGHT+IEWMtUipiwvP55o7SnFFNedcIB9J8Y92SnsL3bGTAtWU6+jlkNHHkULu5G9fMF+Xt5W8a2bmQ==
X-Received: by 2002:a17:907:3cc3:b0:afc:ebfd:c285 with SMTP id a640c23a62f3a-aff0edc4d6cmr819502266b.1.1756827657134;
        Tue, 02 Sep 2025 08:40:57 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0438102debsm418746666b.66.2025.09.02.08.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 08:40:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Matthew Gerlach <matthew.gerlach@altera.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/2] dt-bindings: net: altr,socfpga-stmmac: Constrain interrupts
Date: Tue,  2 Sep 2025 17:40:52 +0200
Message-ID: <20250902154051.263156-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=968; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=sFLVskm/GZvqeQI/f+rrxfYgvGE1+3DHh+EYMzpJNhc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBotxAEs7Pi4pRQzSl+H723I8RHNxnqQ8YsTSkC4
 vkxAmnxXj+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLcQBAAKCRDBN2bmhouD
 1+k/D/0UuXc2i9vi5ZJEk2QSnLsML7RPV42gQabAHH1WKmWnL4CAxBu79LPPNM4a7I1ooZ1jhtF
 Mr0HfnWsGPBrGmp8I1/uv/bXwxzHoXkai/Nz6y8C7yM+JNberjHA+TiBdQVzwbVM3RrI3EPANB3
 lWmBIcSxHKokKT6EaVY1AKnmFgurZZ6y0eBstHMsdJ6ELNsyPVyS6BaAUipo++or72IL3/XbP8t
 o30+Rbvby6HDByLMYbdefwjD4wAzJUzz8Y4uN+rOxXGvErZC3E1bvX2mJG5WVYkRRwTSN+cWw3R
 YUEAJdS3sN0m7TIPexcrKhSmyvNL+7CebE/kX8UNOcms6KyQpmTkmoiwlKEITwCuKHu7rqCcloj
 kXbG0f20Poz5QjpvoBJMOu13+2qCJcWhUCRNVXOGGHVR1EEKa71BYZzwH+6eM1Di4nxFa901haa
 MPJ/wDC6mZ5vqxoKG1aMzF8c5gTYUdO8z/1pyNpGzkwLLdQdFo+k33FRQmngLKLdN3TmFgHHaya
 RVG8d1yntleXzsQP6HRY2mICIMlwAy2wmRJpiusUUYtjnOE96Z3zIcA3TBfTXlXA92EGeJtuUKv
 O16pHUiaXsjIP1644k6rtwNhNVpYEVZ1NJokD2I0xZ5+2h1/Xa7D3vHI9tqIkagc3GnIv4q92i7 pJ52l3zbCm7aBLQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

STMMAC on SoCFPGA uses exactly one interrupt in in-kernel DTS and common
snps,dwmac.yaml binding is flexible, so define precise constraint for
this device.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Minor typo in commit msg.
---
 .../devicetree/bindings/net/altr,socfpga-stmmac.yaml       | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
index 3a22d35db778..fc445ad5a1f1 100644
--- a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
+++ b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
@@ -62,6 +62,13 @@ properties:
       - const: stmmaceth
       - const: ptp_ref
 
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    items:
+      - const: macirq
+
   iommus:
     minItems: 1
     maxItems: 2
-- 
2.48.1


