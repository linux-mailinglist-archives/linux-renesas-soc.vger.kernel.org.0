Return-Path: <linux-renesas-soc+bounces-21376-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E01B446ED
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 22:05:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 292E87A2356
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 20:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C61F72741DA;
	Thu,  4 Sep 2025 20:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="NYgHj6g/";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="fiyV9Qb/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C011E4AE;
	Thu,  4 Sep 2025 20:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757016295; cv=none; b=joKbnmLh4XtVcC0sg8wIw3BS2xGiSdxT78LPj2C3l5hu5vEkLf2dbjJynkoWE8M3zONdSVOjjRkrZECgLIKvXmyDpRXmluDovT2V2TIvwYUzDg/OXXhjUU8s1uFTuAaWo9a1LPjAP6wRUWxqe21bNzhVeqdTWi7gWou/guTS/P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757016295; c=relaxed/simple;
	bh=mVNQG8IpdWv90dvQpnlnIvaAQ78Fin6zgbbaXjvtO30=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i3pgWCULob7QT2VY5z05agjKa6a1CQUt8sbnSTz6w1NeCZ+9oIu26Oa11y5pEkBDW6tUkPuN+6KprRmRWvYb2zJj0byMJjXiwshyaqpq6bXAM3A7kZsncCa9ECK/rZNDV+rPrenWBf0UWgPEoTqpJWj8OGB8Mjs/8rSS4dChK+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=NYgHj6g/; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=fiyV9Qb/; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cHr6r0m2Pz9t0n;
	Thu,  4 Sep 2025 22:04:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757016292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6Wl+hI7LKm1WzouZGi2FUnVOee5FU/DJYF/1DrUr4+8=;
	b=NYgHj6g/Vg1/O3aM0zaNiKsM9/5AWE0M+MT1BsSdoYKVCVsAhglc/3e+rl6eiLOs5CLZEU
	p8tQe70AEDdSmmb/5ApmsiBZI1LDZKjJH0xmKszK1RAXwOOaqqeLu47tW20Su6UpM106Ba
	pxOP8Tmfadsf3hrTu3r4CutoxJegb9mXNXYQVQnb1EDwna1YdaXzvF9xP4e+eLF1IPkX7S
	07r4ex0MXPDMcTKZE3kQ3y5yldcjwX5aw8NG6CqFwZF0VTPR6gM7xoe8feXtNAnx44jfsc
	3d9KtuYwZiJjE6p8ZdMcHPkE8vJ9lLfYsm2AtXxXpPoi+V9wnxjKZHcz5pulig==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="fiyV9Qb/";
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757016290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6Wl+hI7LKm1WzouZGi2FUnVOee5FU/DJYF/1DrUr4+8=;
	b=fiyV9Qb/X6XHDMvj9SqyrwGMjyVaHeGWNnV06LxH5h+7AXdmE6MwD+7qLWSuTTMt+if43j
	GuM8rxwIoYAHt3VOHeLmfbIsPW2qZTGeWvT5Nr81eQmsIE8o5B1TRkYM9e8x4o1q4xhn1a
	c4XBrwzl+8S3vmdMMFmOwqd85SYa1aZids9atdUvWBV7O3zh9S2oLejHhjCAC1pGuUKdn0
	V8EcWY/bbdtMIKx5oP8+yF988vDE+BYnk+IU/c6RbNw5EHFFnLN0eZIObarIYlSwW5Dqob
	AEGsJtS51b9wyrnzdIhZFLD1F0eEmaEhdPLxIy5qAJPQn8Xp6cXvGoDIwIXb4w==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/4] arm64: dts: renesas: r8a779a0: Rename dsi-encoder@ to dsi@
Date: Thu,  4 Sep 2025 22:03:05 +0200
Message-ID: <20250904200431.168363-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 39f0f10070675c996cd
X-MBO-RS-META: ouccmeteysisoe6uftnetf7iouy8sp36
X-Rspamd-Queue-Id: 4cHr6r0m2Pz9t0n

Rename dsi-encoder@ node to dsi@ node to follow node name pattern
in Documentation/devicetree/bindings/display/dsi-controller.yaml .
No functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 95ff693399919..2c3fb34abb28e 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -2949,7 +2949,7 @@ isp3vin31: endpoint {
 			};
 		};
 
-		dsi0: dsi-encoder@fed80000 {
+		dsi0: dsi@fed80000 {
 			compatible = "renesas,r8a779a0-dsi-csi2-tx";
 			reg = <0 0xfed80000 0 0x10000>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
@@ -2977,7 +2977,7 @@ port@1 {
 			};
 		};
 
-		dsi1: dsi-encoder@fed90000 {
+		dsi1: dsi@fed90000 {
 			compatible = "renesas,r8a779a0-dsi-csi2-tx";
 			reg = <0 0xfed90000 0 0x10000>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
-- 
2.50.1


