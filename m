Return-Path: <linux-renesas-soc+bounces-7852-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D99D5955DF2
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Aug 2024 19:29:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90FCD28142A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Aug 2024 17:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E68D215383A;
	Sun, 18 Aug 2024 17:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vtlpoyuj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71C01494D9
	for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Aug 2024 17:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724002133; cv=none; b=mUln6ZAp6RllyM6ke7DA8Q+Mr0/n3iZuq+5MZ3slkpzuxdYuv3r2s5PQwkdK5q+Wt/HXPScI8/RHFMO7lSG0FYCuwblTIUbQn9U9w4Y+YJ3sPT46OCQ12AXMrZr9wA+5MueumAFFU5dXmB9s6ylx/ABjePK8ISOJ1v3eNsUPrIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724002133; c=relaxed/simple;
	bh=ND2Ns7m2h9MafHRCr6JabpIRpQLxTmeDBLHdaLMYhgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ePUi2SwprsMec2xzy2PuCTvpEUGb8epJdcNfEO+lFBUUpXRGXnXQxeVb70dZAzC+tG9mO5Z+1aU3VW9jXlG5bpUGQfAhy1uusA7/zwzhhbNf3RURdppiIHFNPmK6k1gA+mhNRHIS9IsKGkjUj+LjSEt6PLh661lhY4vT1iBRZfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vtlpoyuj; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37196786139so1588031f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Aug 2024 10:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724002130; x=1724606930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zSmdK3PMjq/K9tgLuhcYRFCmQqxZohO2iMaFOSnuyz4=;
        b=VtlpoyujK6WC6yJCwfI7q1WkyDdqO21JB7wrDdTGIq2mowG9D84gVLAf1WXj4t7wEQ
         gjHGrb9E4RmZsMxgFfWsq1GS8BvXtyEBpr374Id0OOxyF/1m/tKY+mMDAiuvuqwOMVS3
         M++onSVmxLxGbo87FO1IJLpQt4eMSZvJzj7YzyEGraHKlz4V1QsTkri8+7ltcrK/r+hA
         h+bqAZcKf4DkjXMkzmu7gff/vCVIuBjFvzdXS54/MpOpGSmjiPP52600rQx2c8EuGWY7
         xfuHi0INppIzApT1iDcQ4Psibm2D02q+nYiIiX+Ezv8ESBoxgiY5S/j/BBvsNbv2JgnY
         bA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724002130; x=1724606930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zSmdK3PMjq/K9tgLuhcYRFCmQqxZohO2iMaFOSnuyz4=;
        b=BDKJFcVGFT9c871a6iPRDiJ7mcOwBVUoR73cZ0jfMl8ZyK+Cq17tYPf70uPFZAnFKf
         byQZ3YjT7cvIY/ElfVKcd1Sn/1An0Ck5peYt6Tbpxf99jz4+1RYWRGteTHa3bLA7oT/C
         zfc9D/J6ukL+bBgd/QIw4P2kyyrDLy49zIxPDVWNUlGmGiQjbAMZHEpuEqBtvp3TzWQr
         RoKT7mrnlbMRwAM9KFP6y8uhP1iyf0n+UjOsszhem7mQbIERGvPW/oAyHhLrPz3sy0sq
         a6C7KW+7QLDZbQtvGegmXE/L37s7PiMJR4VIFeO/QaGU8FsjGWYoN5PQZA26XnSYzTHL
         Oo0A==
X-Forwarded-Encrypted: i=1; AJvYcCXYYFmbhCi9rgYLP+WAoPJWCnKQfReyqw9WG+B3wHNImZxoDynzkyP3WRIoWPsBWgbehSe9FFtYkFc98J/CEJNbEiXTPiiq3Tu+ZTYRRS1IfUA=
X-Gm-Message-State: AOJu0YwrK6uVatJLuaflp86WsQFlIUczFro5lkbgluL3XkBZGb3BfxJc
	eR8sMjgBmZgtRWrewcJb/Xhk+y7CZoyLChwcoXdiogYvmv5TcJnSBoZwyts7t8g=
X-Google-Smtp-Source: AGHT+IFFcTzuaWi1C9l4fEAiu30Dke3dJ7DShYztrgu7+LZAs4fHVNOv+80w4I6uDPfpNgAVFTqNtg==
X-Received: by 2002:a5d:53c5:0:b0:367:8a00:fac3 with SMTP id ffacd0b85a97d-371946514e9mr5769488f8f.30.1724002130248;
        Sun, 18 Aug 2024 10:28:50 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718983a31csm8518541f8f.17.2024.08.18.10.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 10:28:49 -0700 (PDT)
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
Subject: [PATCH 2/3] dt-bindings: PCI: renesas,pci-rcar-gen2: add top-level constraints
Date: Sun, 18 Aug 2024 19:28:42 +0200
Message-ID: <20240818172843.121787-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240818172843.121787-1-krzysztof.kozlowski@linaro.org>
References: <20240818172843.121787-1-krzysztof.kozlowski@linaro.org>
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
 .../devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml    | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml b/Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml
index b288cdb1ec70..065b7508d288 100644
--- a/Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml
+++ b/Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml
@@ -42,9 +42,13 @@ properties:
   interrupts:
     maxItems: 1
 
-  clocks: true
+  clocks:
+    minItems: 1
+    maxItems: 3
 
-  clock-names: true
+  clock-names:
+    minItems: 1
+    maxItems: 3
 
   resets:
     maxItems: 1
-- 
2.43.0


