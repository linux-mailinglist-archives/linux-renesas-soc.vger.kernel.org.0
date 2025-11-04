Return-Path: <linux-renesas-soc+bounces-24080-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19546C31568
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 04 Nov 2025 14:58:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C292F18854D3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Nov 2025 13:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C0B32277B;
	Tue,  4 Nov 2025 13:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="LJLva/8v";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="qh8UdAQ9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D1132A3DE;
	Tue,  4 Nov 2025 13:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762264662; cv=none; b=hSaF6X3405qbq48L4NuSjLsFG7bKaT2yeSbV3aXJQEw/+FiLf9q1YxQA3z6y+bW/cqvpNstUlCSd4ki+/jzADQGcXLMKMBiA17IKo4WQTIcAlXj0Aqj777+tthiaf3UW3QssGK0aAzfOflj3WnZf0PWhtNoscLSfBpJui3Z7dKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762264662; c=relaxed/simple;
	bh=sMaaGMYzKl0voVuxA0jPldzf8qp7X4HPqeegT6N4YIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cwsPwekO+/y91IRyh9iHWHIStCcMfp0D1wDZg79MqAfCsUVw+hEX7Q4Jhm7UdOq1di9wBPRewsIE2N1pukc8ZJUzV4B3hA9DCVdJgfImkohfdwglsT16Csyb9LRUSkM3fcX8goQxvq76FotSA5KRYsDSGxcIU8hfEuPc0u8e07E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=LJLva/8v; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=qh8UdAQ9; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4d194y1Q2Bz9tTx;
	Tue,  4 Nov 2025 14:57:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762264658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=azh9EIIHbuJCMsWSwizHtMXAOPOT7L1Kr+T6Whvcj18=;
	b=LJLva/8vnakd1WVyMli1KIfy6g4G6adcT6CMx5KqMxcfiBSbNtyrjOVOf9JMjJAY9Mpj8G
	8fJfpPhe9RHggZAN81rWYsEryAqWAEym3JmRSzmDKRoabRLSnrJdGoZ3LnUrlTFq8sYYmS
	OMOmjjwUSFXz+wA0fLBzc6Sx4k0tld2DRyh7ThCcVnmi+PscZ+tfrVEzklaXUneB7Ap/bP
	zVDw5iBDedskChYAAHojjvIIAA/Y+6swICR+fSxdJvrHOccc0P0JdG1n7qciEqSPvkeVDY
	kHlLLy2iysTrTxm468iKKYqFYXSSOtRW/7uyWgkovFHs/UACHWzGW27lR+DMpQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762264656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=azh9EIIHbuJCMsWSwizHtMXAOPOT7L1Kr+T6Whvcj18=;
	b=qh8UdAQ9f08fis57Dw3+uJ74MIBOCKZOWdeXUVQTCDlaLfwMhp508+v6EtjY8xpsT7YIQv
	dDQ1TcFWbpga5VC8I156BnBA0nBa2HzXvIERuXE5aUa26icepP5suoMIAWH1bOApXsO5DQ
	xMINS307T7v3KrArprDU2Mya6YZh3Ls31er+Qbs0cEwKiG+2sOnl2oy3KrrD0TGwPKUXjn
	CozBQKxGfHEw4ZipnHFa5NCZnb8pbpvE5zmL8h3wg31cP2PWBL1VnIpRpvZIG1W2InUjlR
	hkmMhhrBsSugRnyHxzr2H0411/yG431gG9VpMGv1w80yid4NDkCHfAomdCoqlg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: gpu: img,powervr-rogue: Document GE7800 GPU in Renesas R-Car M3-N
Date: Tue,  4 Nov 2025 14:56:06 +0100
Message-ID: <20251104135716.12497-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251104135716.12497-1-marek.vasut+renesas@mailbox.org>
References: <20251104135716.12497-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: z7yk8gie4p5rbzsz3efh6hjtcqg178ee
X-MBO-RS-ID: be7e89d5fb2248b9717

Document Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
present in Renesas R-Car R8A77965 M3-N SoC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Frank Binns <frank.binns@imgtec.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Matt Coster <matt.coster@imgtec.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: "Niklas Söderlund" <niklas.soderlund@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: Add RB from Geert and Krzysztof
---
 .../devicetree/bindings/gpu/img,powervr-rogue.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index 550da008629c..225a6e1b7fcd 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -19,6 +19,10 @@ properties:
               - renesas,r8a77961-gpu
           - const: img,img-gx6250
           - const: img,img-rogue
+      - items:
+          - const: renesas,r8a77965-gpu
+          - const: img,img-ge7800
+          - const: img,img-rogue
       - items:
           - enum:
               - ti,am62-gpu
@@ -105,6 +109,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - img,img-ge7800
               - img,img-gx6250
               - thead,th1520-gpu
     then:
@@ -135,6 +140,7 @@ allOf:
           contains:
             enum:
               - img,img-bxs-4-64
+              - img,img-ge7800
               - img,img-gx6250
     then:
       properties:
-- 
2.51.0


