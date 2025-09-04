Return-Path: <linux-renesas-soc+bounces-21373-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D16B446D5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 22:01:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29EFF1C2817E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 20:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3959524503B;
	Thu,  4 Sep 2025 20:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="xB5yQC+g";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="PGcRzfcO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80E8129E6E;
	Thu,  4 Sep 2025 20:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757016110; cv=none; b=U1QwTZNNsyIPZp3y9PKq96a9mrGw2mlbMCsF7ixx6FQ4tolOCPOqWTdf/cIoSNKloyfBp/vj2egItXovQgjPQRYsFEJekHmLB3JGqvkqRq1ygeQXFDe8iZebSTqbZTCnIjbrAHJfouZL50Ht/GphIZai0tYYUEE2rBNbcoOlM0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757016110; c=relaxed/simple;
	bh=/yHJWDhivFi2U5ADtYlVTXKSC3W275xDh5sKWx+erjs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tNp5kOSWxxQ3UOSZtpYY24uvRvcyZrjgdujOcpYUopfGv9upLORw8mMVqMmN8SwSH+jZHqJgpn9Ibu2oM0N7cr2N/63/AhfZY1rK3ZJ1hs69N7ipWhFnlrhpPufVHbwZJl+mi3Hog+g7ZTp/CuZ2c1jIEXGT0a5VuDz5/eFnHjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=xB5yQC+g; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=PGcRzfcO; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cHr3F6rt9z9t3f;
	Thu,  4 Sep 2025 22:01:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757016106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0Umhovcau/YqRorev3Ev6aBhjaNGXWMdzGC74D6Sf68=;
	b=xB5yQC+gLAs/Ca00D/OMu2oZxi2Tu19fFMzbUUnE/AHV4ASg9oTHGzIdWo2vNwPm5GAIx2
	gvkEzwlBvPFA0YVfzFKjYVHsMHLQgflEnzO7EPTMT5eQi2ymR/GBIRyPLA53ROEFayASCm
	UxIDlBWKWQ7HycDvOLfTofZ785GpilJVw+J5HHbwMA3p1V/lqMiVyfRjfk6RB7NPL32To7
	Wh6BVFm9TrkVDv8yYsd+jlWv2Ie0B7u4/+bkOHjr7MURz06LC6+PDdIOTmZZlG3/XmuWRU
	UvAlpHwqg7h6D9tPg81P+sTNt/py/jOUA62cgiTfhGT33VlrI/vBmQLH+mY28w==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757016104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0Umhovcau/YqRorev3Ev6aBhjaNGXWMdzGC74D6Sf68=;
	b=PGcRzfcO89dfpdg4vTU5D296q5hb/j3j7dKL7ipTg+RwXasTFFKVxkwAvs/0ss4ub9z9uo
	6qywlKOG/6qVwP13e1o4LfrLA8T0OT+cq4mD+EraBKzQUZTQ+G+xQvJ0asGUGIInqX5v2S
	EqfUzF161xobHIBKlM85wrSqHjWG6z3EchMlbr2vvMY1ad+z0T9R/FxTAjSjKjbWvCafGe
	X3ZQEtUTaR1c7HiLRw7uNb2o4fu938hAK0G6qg1pClPEJvEw2edb131xGA0EyYW3rJOPBS
	Oq6LPV9wnYqJs6fsvnhCibwRx8zI5mR8p7QUSvuXvKWdfkYwUfOcYEoOXXvdgw==
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
Subject: [PATCH] dt-bindings: ili9881c: Allow port subnode
Date: Thu,  4 Sep 2025 22:01:08 +0200
Message-ID: <20250904200130.168263-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 755f89b141a440e5f99
X-MBO-RS-META: hkjeud4gg6a7prpocn71mp77f56oh519

The ILI9881C is a DSI panel, which can be tied to a DSI controller
using OF graph port/endpoint. Allow the port subnode in the binding.

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
 .../devicetree/bindings/display/panel/ilitek,ili9881c.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
index 434cc6af9c954..cf0aa996e072d 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
@@ -30,6 +30,7 @@ properties:
     maxItems: 1
 
   backlight: true
+  port: true
   power-supply: true
   reset-gpios: true
   rotation: true
-- 
2.50.1


