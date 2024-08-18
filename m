Return-Path: <linux-renesas-soc+bounces-7855-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEB9955E08
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Aug 2024 19:30:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A2EA1C20D3D
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Aug 2024 17:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2366156669;
	Sun, 18 Aug 2024 17:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NVkNdbHu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0047214EC47
	for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Aug 2024 17:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724002156; cv=none; b=hHkk9SN9PxAMtL/fk1FSXiS5HSSqUzU9xODIkP/2ObAPPUE2voe9MSmCGFd+8ZdE4Uc6bM9Avy6EChrIu7dOlh38koVwSh6Y4e/CAbeEY+nZcqFvWrE+sU1/sBEWV0A2mt+5AJvA+yLWG2MUvKhl3tvaGmBYKPtsTApaLmX3lMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724002156; c=relaxed/simple;
	bh=bo6Oemt17UiR8uphrtM3lFkju/6XmMZtoXZx2VFaquI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xq4PwZM1MH2oEIyo5flUCuOHmmUAlJRJJ4LOF9OSoC+WdAH3GXj3P6FpZh2Idn0Egw3rNfYYFW4RqT2W1ThLYvn/unSyDT3RRwtxHJUwOouq4L7sxDJ/Gs6uSK/4ab+0W0LpmHAoDDWTiWzrpRXJVU5yhdUjkvyn5EH7VCpaUS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NVkNdbHu; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4281faefea9so27187675e9.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Aug 2024 10:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724002152; x=1724606952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8blFZbfnGlvrrpro9Mt+fDTe8etw4wnb+/lJOb2V/Lk=;
        b=NVkNdbHuKwNMrkpFHEv+jG0xWdIRbaTxNZrJikljwVoePyrByWQW3BSmHR4OtXu88k
         pxPSc3x/yH46AKIt1kYUj/+0pD3NQok5ykvRWeWsJLV2X/rLLZ2yjyfXpPyA8E8Y5qz9
         NQ8rBbdC0D7ESWVhsC3u40a6FfJ6OkAYexO1vp8LMjM6kr+4vlydPdAwvJjdkonfathC
         RkhkLmKsQ9z9pv4dtiRz3qowGvsAen1Rd2vJmn7Ps8RJ0jtt27zOpJlk+5nMVINZS9lv
         OSuFZZj0mw5zbQLhIzxywFSSxO0LJl61VtkIIT4lX+boFbYv0ola+5vgozV6gNfuO/Dw
         OCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724002152; x=1724606952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8blFZbfnGlvrrpro9Mt+fDTe8etw4wnb+/lJOb2V/Lk=;
        b=i+l4/b79EShGJeV5sh/2ZGI7I6CHdDQ2SxqQ8QTBqtzQMRfufVnUtxa/lFzrpoNvTn
         MvQJ+qEPpYtNdQucvtPVLo0CekrUDEjELOOn8mr7/yLvMqAZTFQ6s7NnZqHMxVZWdLkv
         Mbn2EwGQLjZIyEoTDpA+WXCR10y5Lzms41oKn3pA5MduceHlsIjIPTtTVYltIFlaNOCu
         5fBOEgow3MVr0RShSopiwn50RQcQfk3jUHUdCQVwxpeh3gdsudASXKObIwmoydliXg31
         HUxQavVDiU0CQoMAleqib43i1LFyVOHh7wQ4xFhUerQS+DGqN1FBFdBotKoxFAPmjYAi
         T1Mg==
X-Forwarded-Encrypted: i=1; AJvYcCVmH1v8JjyyLeUkiXY4z8MKYNvhj8q7ERqMYDKDPCiZOIOvCp9x8cBo9X3oHEPR5qBFCa2k/7vtyn/9waibaoI/12rkEEXq08C1NeGy362800s=
X-Gm-Message-State: AOJu0Yz/IT2xRFaa/J8nm6lFS41bvh6nh9plqghDNz1fRzjtY9gAgvUj
	iiPWG3YhyaTgED8mlw9RQJ7EnmH0ue55xVYqUretwDs0xhnrxByaXw+v/iL+dZE=
X-Google-Smtp-Source: AGHT+IHZWNYxDr1n2Hm+4Vk1yE2Q3KfSWgr7knMmpEN6fGiOFgE6l7GIrD+dz0zW1NTTiyyy6UNsPQ==
X-Received: by 2002:a5d:408a:0:b0:371:8e77:92f with SMTP id ffacd0b85a97d-371946dc42emr4545780f8f.61.1724002152245;
        Sun, 18 Aug 2024 10:29:12 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718985a35fsm8510315f8f.59.2024.08.18.10.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 10:29:11 -0700 (PDT)
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
Subject: [PATCH net-next 2/4] dt-bindings: net: mediatek,net: add top-level constraints
Date: Sun, 18 Aug 2024 19:29:03 +0200
Message-ID: <20240818172905.121829-2-krzysztof.kozlowski@linaro.org>
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
for clocks and clock-names.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/net/mediatek,net.yaml | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
index 8c00a6f75357..9e02fd80af83 100644
--- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
@@ -30,8 +30,13 @@ properties:
   reg:
     maxItems: 1
 
-  clocks: true
-  clock-names: true
+  clocks:
+    minItems: 2
+    maxItems: 24
+
+  clock-names:
+    minItems: 2
+    maxItems: 24
 
   interrupts:
     minItems: 1
-- 
2.43.0


