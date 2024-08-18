Return-Path: <linux-renesas-soc+bounces-7851-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEDD955DF0
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Aug 2024 19:29:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C85D52814FF
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Aug 2024 17:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD87015383F;
	Sun, 18 Aug 2024 17:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pKk1X/sw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55409148823
	for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Aug 2024 17:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724002132; cv=none; b=fsoPMu0eD8Z+gq+a5v2ayV6GXbK3hoMI7LyaaPl6cCd5IQXzoN4aHrw+fvKbvTH23nV1QyPDeDIRa3n1+zjmsyFWsrmA1rNtZgq5+3v37r5HGOsjyNNYLi+jUhX0GN+dCKe2xe9mHDkgJoyBpHB1uY7mavSaEMpYZYKlUInapPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724002132; c=relaxed/simple;
	bh=EcLybmfw+0g9pG7qN2rZISIWYbjARPz79yYF0pURgRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KGzYGnCvSsrDE93GMcoYk1HU0DWAMLXwbITfIfAT7p6RjEQZoXoz/xRyiUr+ZYJ5q93Re8o2enYG7WWvGCeGAPbOEo7lJaGIJcSuo0YtBagfKfWHAJZMUS1yczBgOr0zJ9bq4CR4Rw6ATnx2jtt+vbvZ8xPRbs+D7b6cUO893nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pKk1X/sw; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-371a6fcd863so1009341f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Aug 2024 10:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724002129; x=1724606929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GNx0581gmw5KmVnKNMArHkHEaJIxEm4/jRsnasy6Iao=;
        b=pKk1X/swdl2oN+2bNpUL5GH7qs4Ir4Cgl7LUFUkNE/562P1P/ui1Jib+Q88VxAIgb9
         /jSdiQSVxOeddjSASj4ktt1tDxLEzXdVzHhCGLdLO5I6vCXF+HtYyuzBJFabrWfpHaaK
         6P+eSRT5tdh3Ly4sBzReo0jdKyhaEGmkZ4jekegK0KF+5UT6fWW2yQeVaITVAuww6pl3
         Z65Ywt3UbN98sQ9CFk6tXyg01er/bw5utj0jY0/7GiMTo+tKbN5XCMLxfkHhFrdl6xni
         tl99lm2DNlB3uzROAwPOZJMyFDLrhbL0xX11zd2ASHCsCqVLUFPXRBOaSdCqVvhd/OJx
         1ZWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724002129; x=1724606929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GNx0581gmw5KmVnKNMArHkHEaJIxEm4/jRsnasy6Iao=;
        b=mMdx4ck/HGn2l67XdajSdV+RNAA+p/q7M9qXYO8kzjd6WF88B8N/VpABUKL1zJ5qfc
         c62Ld275Q7pl8IT2Vz8TRhKlGG8IdVu2K4NXCvn3aR5tvfGMST24GxQelVmAFixpfCN5
         ix0eSVFpDNE4kt9a1gwvXVU6szQdzZKP3crJiDQjC6HDkl4YfdQBif+AHMUPcjuijnpV
         H/dqLJQrU/QImvFPdJV9P+DQqO/DSnHR5uw1kaDGde0OZDHqASd2oK1tTjOKRue+J8WH
         TrvDrtC1EX59SdWqFez3AtSYpkFi6B9cC5kux+AdFKd9PrAX0oBmnI9ZPLohUJyY+P2W
         VkWg==
X-Forwarded-Encrypted: i=1; AJvYcCX7Og388bsmX9GxtX66NnixZqIKObhOB6gRONR9MYvsg46sE3JEMUJ5WG4yUQ7dS4kbuoEcgZ4EGagM6Gw61Zhb6dZDSd1JjHeSnOTNqqyu98U=
X-Gm-Message-State: AOJu0YxP1rqMyUvOSmdx6DBjy4aDCWbXpZ82xZzzIcbNCCUi6poRVZ5t
	cCB/uXLsB0LRrlsSq51w1oYsSI8oc8AfgPvzbbk4MgePjiHM0OOQRzUTUO5d/QQ=
X-Google-Smtp-Source: AGHT+IHhIVY0bWR2O7mz+r0RXXbWCwIx/u27MbcgBTwXx1CRg5LFhEFV+GL/Fw9bSLQnd+XYkgRWkw==
X-Received: by 2002:adf:f285:0:b0:371:888d:7aaa with SMTP id ffacd0b85a97d-371946b1ae9mr5217302f8f.49.1724002128655;
        Sun, 18 Aug 2024 10:28:48 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718983a31csm8518541f8f.17.2024.08.18.10.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 10:28:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Xiaowei Song <songxiaowei@hisilicon.com>,
	Binghui Wang <wangbinghui@hisilicon.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/3] dt-bindings: PCI: hisilicon,kirin-pcie: add top-level constraints
Date: Sun, 18 Aug 2024 19:28:41 +0200
Message-ID: <20240818172843.121787-1-krzysztof.kozlowski@linaro.org>
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
for clock-names and reset-names.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pci/hisilicon,kirin-pcie.yaml          | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/hisilicon,kirin-pcie.yaml b/Documentation/devicetree/bindings/pci/hisilicon,kirin-pcie.yaml
index c9f04999c9cf..e863519f3161 100644
--- a/Documentation/devicetree/bindings/pci/hisilicon,kirin-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/hisilicon,kirin-pcie.yaml
@@ -37,7 +37,8 @@ properties:
     minItems: 3
     maxItems: 4
 
-  clocks: true
+  clocks:
+    maxItems: 5
 
   clock-names:
     items:
-- 
2.43.0


