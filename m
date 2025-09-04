Return-Path: <linux-renesas-soc+bounces-21402-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E82AEB447DD
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 22:58:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF5B55A2325
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 20:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA103288C2F;
	Thu,  4 Sep 2025 20:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="vMLCBk8Y";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="aeVWcsDl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803842874F3;
	Thu,  4 Sep 2025 20:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757019484; cv=none; b=EZ7Qkc4eBg2fnbCGxIzQd5fgiqUDbwAQksy4HIW0suQ6jjcxPtASIRKyG+yrtFkEkeuLoM57k3wdzE/+IYs+fTqIxPizhM+WUL4Ea2jQJZi+EI5yL2UVfXYklqgufgLCYukqIQFbAe+I60xy14H+CIG88sHEdEbDz2M59NjunuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757019484; c=relaxed/simple;
	bh=FyojK8RwUM5phr3l2/59Ngkfls2sXrsaBPDgQU5hXio=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lKm7jD9SeGMwikkYq7TU//6JQEp0eqcOz1FcNwgKWBC8fwVVA27RS80/FR0IKBJ2cfF0zhBOS2oPMe7pa2G1ZWLUeOFDJW94czEc/oJNtaBbGPHmsaQWQCpJiQQur4QH+It49E3rKlxWpk5JX9XtU2ZveCbhczsvblzCNPKgH08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=vMLCBk8Y; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=aeVWcsDl; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cHsJ83szSz9smB;
	Thu,  4 Sep 2025 22:58:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757019480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2tq3gJuMl6bujxraVEKI0u7CgBG/jl3cRzPkCwMKG2o=;
	b=vMLCBk8YkWBvz/PFjcduKg+r4TzMPk7VDdBYmSGoasVlces2+tfk17uuhhtOnO2te6lXrZ
	ar92hicJGO9ftEE3xRn6qJ5uAJGs+nelrNDrYsUAn+SeCZLOKumzcIn5z3lN5qYUNdCaTG
	UKQGhuXulwJprfNZL2lXtAJ1+JH7tZCkqtPy95VpA00JkdHf04GhXq/XGDXPLPkAgEgvSZ
	OJLtbwpKDu/EpX2fgr50D9cMW98w+jQW+iC69mq0p+pwAahyaB/xRPFCFNo5AsppoRNat1
	RcaDKfZKSDmB9Rwt3fHY13cc/ZauU+BBFYc3l1oU6LL2qywNcv+lJ39mymA4ug==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757019478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2tq3gJuMl6bujxraVEKI0u7CgBG/jl3cRzPkCwMKG2o=;
	b=aeVWcsDlpIVswZj8/EikCEm4qirrSbmxdwp9bZkp2MbD3yBsxP5kAwvYxd28cL5qD+SP6k
	x+lmiiwbmTyDqMgegKlTehJB6RAfHKJF8AkcdArFT1M7SoZT6bNscxSBLmBzd90i88MHbM
	7FTTU/0mT3xiv00wXIFKhsT6w1mRvI9DYW7FJx3HVB63nJT1kDClTy1vjbxQbKAlPWCIL1
	tL1ugp7HC8CYTmi4KcM6itXfMM8HSbX5beAeKZlzc0e1EPTw6nXbu8dO56D94asGcWHie3
	7GM4CLTy2IfDj1mVTwKg2vhP5a6cM05E7HCmSolkW6PHWKDRglf/GBQhpw1Njg==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Airlie <airlied@gmail.com>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: ili9881c: Document 5" Raspberry Pi 720x1280
Date: Thu,  4 Sep 2025 22:56:56 +0200
Message-ID: <20250904205743.186177-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 06307c98fe897621fb7
X-MBO-RS-META: nfqh8c7aa7fuyjwrp938qe7zft84q5p7

Document the 5" Raspberry Pi 720x1280 DSI panel based on ili9881.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: No change
---
 .../devicetree/bindings/display/panel/ilitek,ili9881c.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
index cf0aa996e072d..34a612705e8c4 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
@@ -20,6 +20,7 @@ properties:
           - bananapi,lhr050h41
           - bestar,bsd1218-a101kl68
           - feixin,k101-im2byl02
+          - raspberrypi,dsi-5inch
           - raspberrypi,dsi-7inch
           - startek,kd050hdfia020
           - tdo,tl050hdv35
-- 
2.50.1


