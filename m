Return-Path: <linux-renesas-soc+bounces-7857-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C01955E0D
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Aug 2024 19:30:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D27B28155B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Aug 2024 17:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ADE7156250;
	Sun, 18 Aug 2024 17:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cu5/pbPB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA66156875
	for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Aug 2024 17:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724002159; cv=none; b=baR+JuimQFcvmwcldou4NAEgzFFt/M8RsG6ZXERovcvtNGw+21KHnL9yjVcOyCaA9H8yINjyv79fPqMAccI67uM3TApvnGUrhz7Kw8HSHumRU/z9KHfwzmlhrPeYLNrrgsfVuV6ho5tVRYUymcYSFV99fTTOtusHitQIUqzLc8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724002159; c=relaxed/simple;
	bh=u3LI4Mk7eTmteZbd26ULN0NFsDdnlkh5zLeBBwZf8GU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KET/64z4Pp4XY4VRmL1D6PXkrreCPurMylbWY6Fg4H2H56PD9NANkcPwIayXMDp1lngDuspAW7/5jD4cwrQhXvpoBwe7fdV/mgrgyDO/SLAhd5ia/PfCYVmZr3m0lJilkXF8b+/kaNHXveCvIE23YSHZ4lGvuJr2NWBzCSbJnUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cu5/pbPB; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3719753d365so1551616f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Aug 2024 10:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724002156; x=1724606956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8es/l2u9z7YHRxm+My9mNPpeISEV38hkj5XsiYsgUE=;
        b=Cu5/pbPB56Y3jYuYGzHZZFEG0lj0CJRvLUAjT5KRhGsLQs8ost3dBuxbf1+MnraAAg
         Ur6KCrmmlpowZIAsL8w19BVI/b6+dhTL6KavtF+F+Y35wRJ8TLQ/1QeWVNohrzX4K/ty
         UPGYc7Fl44DgG8fSFHSnERcRw9STLfMRogyxFRYs+XMu4d2W2b4p5wvPK+7DMuOOq3EO
         Qj4m48MpGGzc+E9ddKiuCzEtRdl5vhftALOu1p6Qn8MQZCxPAvwpUjNQ76BrJcrGYHSh
         RF7CmnN14yTkB0U474N9DUCjsDzdKmvfyCUQ0T1zmH4xvw8CWC4+zB2plKjA8xXiGgMZ
         xSww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724002156; x=1724606956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l8es/l2u9z7YHRxm+My9mNPpeISEV38hkj5XsiYsgUE=;
        b=dGqs8ODlGdQYi0jBAeNncdcrB/skaB6iaoanB7BYcSbNFMdp4DQeF0ISxEX2klbwx/
         C1sJRcuP9IER+kI3djU217QsRriBu+jcmww7TrBc07V7DIQ8620MFZQua3W1qqGUMlbH
         BGgH+hRFxiW2lKwUJhwZljYVlF+ufxRGAR5xNcIG4K/0OPx31N+RR4PPkRkTf1hj+p0M
         eWLnhRLG3F4xDATuQACA8jLQVhzVr4i3tOpHyuM7kaqHCf2Vyumk9qG3TaosdbnuNiHC
         ii3UtDEhfdcsdrOBCzV5Y3e0WUFtj0XiZgpE9PFAlYCVzS+aPgMnsiTL8ybDikF6Kcxn
         op8g==
X-Forwarded-Encrypted: i=1; AJvYcCV4jz0lZtgpwQckw0572TiZWzzLmU17bg2p7b5ifNNSglsZkyPcSF8wVoEh9mkdEmZIN4yFhPAKqIWpxLh6QDiG0oZUFQFZJV42Q4NA+zqYs2Y=
X-Gm-Message-State: AOJu0Yxs7o5KWwgimBP/z0iV4SyxtdVt626EXb5RZrNMsatS/DiE4AVn
	JCyHilKXPEP0cTof/svq2kfs3HW56TBRQ3fRr3plBCQjN2ml4zTLtSLbeWnIVl8=
X-Google-Smtp-Source: AGHT+IGDihqENsu32+YwhVnlSe0afwAWIr3NedxRFUFDhgEflC/5EBBcl/lZ8aHqbdVFXfdVdizpFQ==
X-Received: by 2002:a5d:4f0f:0:b0:362:8201:fa3 with SMTP id ffacd0b85a97d-3719465e8a6mr7100101f8f.34.1724002156139;
        Sun, 18 Aug 2024 10:29:16 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718985a35fsm8510315f8f.59.2024.08.18.10.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 10:29:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	Sergei Shtylyov <sergei.shtylyov@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH net-next 4/4] dt-bindings: net: socionext,uniphier-ave4: add top-level constraints
Date: Sun, 18 Aug 2024 19:29:05 +0200
Message-ID: <20240818172905.121829-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240818172905.121829-1-krzysztof.kozlowski@linaro.org>
References: <20240818172905.121829-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Properties with variable number of items per each device are expected to
have widest constraints in top-level "properties:" block and further
customized (narrowed) in "if:then:".  Add missing top-level constraints
for clock-names and reset-names.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/net/socionext,uniphier-ave4.yaml  | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/socionext,uniphier-ave4.yaml b/Documentation/devicetree/bindings/net/socionext,uniphier-ave4.yaml
index b0ebcef6801c..4eb63b303cff 100644
--- a/Documentation/devicetree/bindings/net/socionext,uniphier-ave4.yaml
+++ b/Documentation/devicetree/bindings/net/socionext,uniphier-ave4.yaml
@@ -41,13 +41,17 @@ properties:
     minItems: 1
     maxItems: 4
 
-  clock-names: true
+  clock-names:
+    minItems: 1
+    maxItems: 4
 
   resets:
     minItems: 1
     maxItems: 2
 
-  reset-names: true
+  reset-names:
+    minItems: 1
+    maxItems: 2
 
   socionext,syscon-phy-mode:
     $ref: /schemas/types.yaml#/definitions/phandle-array
-- 
2.43.0


