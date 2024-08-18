Return-Path: <linux-renesas-soc+bounces-7854-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9F1955DFB
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Aug 2024 19:30:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A45BAB215B5
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Aug 2024 17:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94EAB14C5B0;
	Sun, 18 Aug 2024 17:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="paFN9aOS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65491494D8
	for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Aug 2024 17:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724002153; cv=none; b=KIKhbnjGwIWwUkxN71vY6rDxqstbBG6NcY/u2YtYNOFIivVRpN3ECyZs/e0kuvuAxfWgeyrX7e7tcdj6gQhmPi7hCjogMUvK2ryYFf3zrzSyPVWs25QqJ0PdVbwV81OJYz15Qapni8vOCqcSi23jYqZWfUr/nNllqBxh5Imhc/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724002153; c=relaxed/simple;
	bh=qo4RqSrI+Xyz+o83PeyJscCvl1idzKiReGcMhpUR4p8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X8VkFGqXAxdFN9tsBYxDSOsIHkMH47rQYzfeR/FnnjyUOmWGfbj/5ZPlw0oLn33rlqhd5bJpMZM1sekwq8XYDqpQNWO7EcJNvEvHBHQLdvaW74l/eet0ohqavBNx30KP/ucvrKzCHJ1B90Rm46BI0sZrB6A6TndgV+58T44GqbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=paFN9aOS; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-428ec6c190eso29569015e9.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Aug 2024 10:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724002150; x=1724606950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0CjQK1KNzHVntTC0DMWrSHcz+PiTjzfj1MSfy1NDuc8=;
        b=paFN9aOSwOaosC0lboXNudZjng70eTm5n/O/vXl/GV3oLwkPTXrSpoM03lspNgTbIi
         0a4CxwozDfOfJX1JMmaeYKh3zUb7norIumOqCMORUWwFjwoBi6tdpUXzjeu60p9+TGb/
         Lm6BSWRhpeP495G1ZTCF3dysgBdORJBgyY1IezEF2JJHkqjQ04XalZECK+pkm7QGxar9
         TirznFCveqOu70JrWzghZEYi+zKUaVDYVGHduuox1zsRKnDF7VeqxuBXXVZH4YZpLOoW
         Y3W0WAs2VHcc21h3iLRywWTyruotyS7jEuXG47+/HgCNs0TkOLoJDmgg7iUMFdDbVKPg
         TSJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724002150; x=1724606950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0CjQK1KNzHVntTC0DMWrSHcz+PiTjzfj1MSfy1NDuc8=;
        b=KPsEyRmrpOnXH14+yBmpkAt+7/sFEkKH4uYhTVJMODMyt/maIeU/EXTb2mfk8rTvnC
         uwEqv4A8KGx+KbF4JXuM47Fys/jHvdzV+q/gGh5Si6Ao/nKMlxF3jgviSEWfZiA2FOEd
         DQWYFm5hqASDqEzoBEgdCGpV0J7m7+oPncEkJn0Om+jBEsZhVqZp5pbHvV931kj6Xzok
         hvTVlUmdFWxHL7uuPLcvt6J0a9IKZ/cArMJeWddavER/vOirDxV/gBgxyzcX4LujlX9c
         83Nh6hFDiBngPycrqb/ObSYNsRtEt7RQ+Rg4UE7PM/vE5/r2GSGs39AfNoOx74iG5WLL
         WzHg==
X-Forwarded-Encrypted: i=1; AJvYcCWK0X+rm2UwMSkYgTtGAWlqD7HbnA5FLqjy5KjhfFTLtQ34RUtjPCWz3fE0J1uKM6rVadcZeRBcRaY4C873iT01ZXU+d7z+75mUTrVk4yb41EY=
X-Gm-Message-State: AOJu0Yw8nVVV2q8r8L059ZSAlTAGPQW+JZ1YI5O3y4O3SiopRmjkqmkX
	n3CvtfrPGa/CwPlA3YDnldWMsywBreRA86URHMfDNdDxX3lsrsXLmmnhFBQS3L8=
X-Google-Smtp-Source: AGHT+IHVSICVAMx+qHSqk3Vlj4Vd8bvZ+oQ57yyU7L62VJrgm0bid26o1BgKAEh04NfnNQ975R706A==
X-Received: by 2002:a5d:6848:0:b0:362:b906:99c4 with SMTP id ffacd0b85a97d-371a74784a6mr2851156f8f.58.1724002150234;
        Sun, 18 Aug 2024 10:29:10 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718985a35fsm8510315f8f.59.2024.08.18.10.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 10:29:09 -0700 (PDT)
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
Subject: [PATCH net-next 1/4] dt-bindings: net: mediatek,net: narrow interrupts per variants
Date: Sun, 18 Aug 2024 19:29:02 +0200
Message-ID: <20240818172905.121829-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each variable-length property like interrupts must have fixed
constraints on number of items for given variant in binding.  The
clauses in "if:then:" block should define both limits: upper and lower.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/net/mediatek,net.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
index 686b5c2fae40..8c00a6f75357 100644
--- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
@@ -127,6 +127,7 @@ allOf:
     then:
       properties:
         interrupts:
+          minItems: 3
           maxItems: 3
 
         clocks:
@@ -183,6 +184,7 @@ allOf:
     then:
       properties:
         interrupts:
+          minItems: 3
           maxItems: 3
 
         clocks:
@@ -222,6 +224,7 @@ allOf:
     then:
       properties:
         interrupts:
+          minItems: 3
           maxItems: 3
 
         clocks:
-- 
2.43.0


