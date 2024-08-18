Return-Path: <linux-renesas-soc+bounces-7859-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C982C955E19
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Aug 2024 19:31:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B575B21530
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Aug 2024 17:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA57149E0E;
	Sun, 18 Aug 2024 17:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FaIbDTma"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD08155300
	for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Aug 2024 17:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724002177; cv=none; b=a2QjJ0uKgXkJG5wMd1Ihv4YN3n0D9q3zddZnTe9VMFoFNiY7dIiUl4AUv3BdNo/6tLIq1RiuJSUDnwN2PjtoNWm8gsEm5bcex4+pgyGWnDejn1QpZq79utEBv5woRaysiMb3u+wtBCXTLadX0+CVGLIb2Db2kASuirFrHvRfzT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724002177; c=relaxed/simple;
	bh=riEkD223nMpSd4Ri0+UlbPLL7QKAydIdxdVKe45wDyc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ByLktlC8FbBjQwn/IozsIMCXqyVW3QZkWUKVG1OCGbz892gOwOA+kTn9F0SsLamOHspdK9mvCvCeYHKJB1kd5E59HzpfbLZF087Fzv5H8SVo/tdd/z1Umee9JDOLtuabtSrKUnEYh6E8L9wT9PDgQA26DOm0Dpj4xukQVJKVODk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FaIbDTma; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4281c164408so27233155e9.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Aug 2024 10:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724002174; x=1724606974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AeiZfad8wR07/GKDDxU3Mvsttgv3BgDpBybqGjqUhLg=;
        b=FaIbDTmapMl7DwSNHt6LsYdvNJqsQvO8r7LUYLvRnIlbuzKU00YLQKzpDh3NmrTf8J
         50RrSrRctkz9D1SDCVaQ+1B/VekqLdltyVX3P9NupvSAnQ93c7/4BBzaIKiXnR+UTd8U
         IqN1EvDE/XjEmjeUzoixfcgB2F+RPRHoWY7psXmrtlJBr09YPSt+3el2zqWeb4FZXBD8
         ZLyAI16CR2b7nuMQ5/t+nFN4UjcFiQnXnlhF9il2BOa72OKeGXrsfCZVo3TKHMhi2Xdc
         MRBZfQ7xGydky5rM/mZjzGcwLATPWG7k7V5uSLsvjdDLC0FQ53DUShFYYnnDBu56u6fF
         HA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724002174; x=1724606974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AeiZfad8wR07/GKDDxU3Mvsttgv3BgDpBybqGjqUhLg=;
        b=A8ExOJU3Z1aoi+S7e6+v2wp5z3phCHQYhCwCBBRqXJF/ZlVSrgMiH6BWP6vhloIyGc
         foAtn4FW9i2xIKRsDyvEFhnuvWWlRozpmqau3levI/c6iYllTnClaKJd2d16v1xRYCz9
         nzha3mO+OrkhYE31PmzvWH7UsJWqAlG52XcAgszXTeki9b7YQUM4JkDtdWqM5WBp/1Gu
         xSe3c2VeYKm0aJiDVe1HMaGglwJZBA1KsL7ljZohp+ziYuw1/Wa4kK+nG/DOVFm0Y0J9
         gZpcXqqHoHqcGtK9FFfl6NOT/1UNQxbr/UcKHqvsD8JX/3pr6f+z+BOS8S6aJ9uI4Wag
         Yvbg==
X-Forwarded-Encrypted: i=1; AJvYcCXDslbuMFM7NwRKprdSGxv7BDjyXlQIyoQpgs2x2PsA8fuRjGMtR3jGnzelXLPonktZzUWzMaP08yxAxUX4HJS9vZPJFSNxZHQqBWE7o5tIv+o=
X-Gm-Message-State: AOJu0YxQDhzPIseclJf29yg46zOm4gnvB3207seNsvWiao8OVIsDjOec
	9gsOjtykB32G90ReW2rU3Py042YItuM+K7zR1zVinDCXMds8w8BV3LcquvfHjcA=
X-Google-Smtp-Source: AGHT+IFQQJwmCJzKHbrpe/eTfnscLkdu+x/NdF8rhyHCFf/9CstatRUpIwICUSKgU8ekNRqBHyRO0A==
X-Received: by 2002:a05:600c:35c5:b0:427:ff7a:794 with SMTP id 5b1f17b1804b1-429ed77722dmr55804875e9.4.1724002173952;
        Sun, 18 Aug 2024 10:29:33 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429d7830539sm158319495e9.0.2024.08.18.10.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 10:29:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Sergei Shtylyov <sergei.shtylyov@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: memory-controllers: renesas,rpc-if: add top-level constraints
Date: Sun, 18 Aug 2024 19:29:30 +0200
Message-ID: <20240818172930.121898-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
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
for clocks.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/memory-controllers/renesas,rpc-if.yaml           | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml b/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
index d7745dd53b51..4f4bc953e31a 100644
--- a/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
@@ -67,7 +67,9 @@ properties:
       - const: dirmap
       - const: wbuf
 
-  clocks: true
+  clocks:
+    minItems: 1
+    maxItems: 2
 
   interrupts:
     maxItems: 1
-- 
2.43.0


