Return-Path: <linux-renesas-soc+bounces-23401-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F444BF9D9D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 05:39:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E083319C6623
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 03:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E712238C1F;
	Wed, 22 Oct 2025 03:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="HVjSZzdB";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="pZTg+7RC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30EC224893;
	Wed, 22 Oct 2025 03:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761104358; cv=none; b=txmaDAKTizNtI7tgpbEgNV0tujgjjP7yRuHzkikh8b/Lif9/5SFeQZDes15lfgQjHafND76ncPtrUHs1m7G0Gao70cHOXpKfYaVYrxA74E0cVt1iyEX+ZqcwHVG5xIuB3vjbu7H7VtwBOuv5lZzP1FO3Ced30XVTGezE1EvknwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761104358; c=relaxed/simple;
	bh=l+NMT5lqCQx3u8S2l5WPNXxxWnNNf2pg61vjKSbY5Mo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S3OjJn8YMOfiS4tQKBAn0viy0Nt96MQqdemwPVvHErAuD/PJeONeJJWL0C0xcKVrz8RwdThX2gfBf0xf5ClIcLwitCgEVAxgWiEZw8c3s5a+TWxcgrBYvUMFd2qpaOrgQA+qqAWwPmSius2Ll+dyad2bAYman1nVQzNAX9GDkGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=HVjSZzdB; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=pZTg+7RC; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4crvzP59zGz9tZ9;
	Wed, 22 Oct 2025 05:39:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761104353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=39rT+XhokNO2NN3dlFbS1lzXeQziRCXFI7W5KY5YjA4=;
	b=HVjSZzdB4B/SuznWkpy4c9URFolCuiRo9GuA21uuifCQa5qLv2sJ77UAnPnSyhIDoktJ7/
	N/Kt4DGWQLtZNHIc6RntfKGaAWl7JQ2Ltf6ur3pDI7oBhe54ldbd7h6qPEVeAYchmUEwe5
	tXIg4uxM9eXOglpE6F+UCHAwpi+ziyS9n5yCrRTSL0ULlNYhhd44EiG6ZTzWaJr3Gg94F5
	xre/In049qqh1/yxSWuxtICMOv8ZCEStKJr3tiZr1zYxELrLbSLkbyDifskcXu+HKH1uQG
	MOgO0K9ux5uWpMytYI891YbZ3UkKy+qSzKfvoijOzoTGzuVTvu5+al6yBwvc8w==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761104351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=39rT+XhokNO2NN3dlFbS1lzXeQziRCXFI7W5KY5YjA4=;
	b=pZTg+7RC7tElUd5AKiWxIPGEIMio4ZSjWoDzC6Eudxr3yBEsnNRw2a4BWQv/ww3IsjSrHY
	aOMXiFAjvFdi9ZMCYbRpN2YOgaewe4N2Z+HD3ZMbhTTarWx2u8fZJ3g+Xa/eVwP6HjNNPH
	r+l6WeiycNM3h7xqf4m+BAoZ+7cq4pEFZ6YpAvln118JKqOzzpQLpNkKzYgDRaZq3SN0Ex
	pj8oVoCtyULWxg8TtcomVMhTmYBhVlIIL/R77ExY7LKSobB9l+U2HYRlXfvEKV9NLW1Tej
	OIdkSCfsqM3CGyTwHlGaqnKTdrzkrSLTJoM1tgmKCbwJ3oamSwvKLsoF005Lww==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Adam Ford <aford173@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: gpu: img,powervr-rogue: Document GX6250 GPU in Renesas R-Car M3-W/M3-W+
Date: Wed, 22 Oct 2025 05:37:55 +0200
Message-ID: <20251022033847.471106-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 276ab661eaf958c0013
X-MBO-RS-META: 36ubt5r5k9o8qy3jpzdijb8ruxmt9tyy

Document Imagination Technologies PowerVR Rogue GX6250 BNVC 4.45.2.58
present in Renesas R-Car R8A77960 M3-W and R8A77961 M3-W+ SoC.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Adam Ford <aford173@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Frank Binns <frank.binns@imgtec.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Matt Coster <matt.coster@imgtec.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
See https://gitlab.freedesktop.org/imagination/linux-firmware/-/issues/13
for related userspace bits.
---
V2: - Add RB from Conor
    - Fill in allOf section for Renesas GPU, set fixed clock/clock-names
      maxItems count to 3 and power-domains/power-domain-names count to 2.
    - Use renesas,r8a7796-gpu for R8A77960 compatible string
V3: Split up the allOf section addition
---
 .../bindings/gpu/img,powervr-rogue.yaml           | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index 829febd8e0f40..aa8b2069cc24b 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -13,6 +13,12 @@ maintainers:
 properties:
   compatible:
     oneOf:
+      - items:
+          - enum:
+              - renesas,r8a7796-gpu
+              - renesas,r8a77961-gpu
+          - const: img,img-gx6250
+          - const: img,img-rogue
       - items:
           - enum:
               - ti,am62-gpu
@@ -94,11 +100,14 @@ allOf:
         clocks:
           maxItems: 1
 
+
   - if:
       properties:
         compatible:
           contains:
-            const: thead,th1520-gpu
+            enum:
+              - img,img-gx6250
+              - thead,th1520-gpu
     then:
       properties:
         clocks:
@@ -125,7 +134,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: img,img-bxs-4-64
+            enum:
+              - img,img-gx6250
+              - img,img-bxs-4-64
     then:
       properties:
         power-domains:
-- 
2.51.0


