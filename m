Return-Path: <linux-renesas-soc+bounces-24051-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 19503C2E004
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 03 Nov 2025 21:09:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5A1FF4F5129
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Nov 2025 20:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4065129A300;
	Mon,  3 Nov 2025 20:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="X5Y+8ilo";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="xI66H01M"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B32E245005;
	Mon,  3 Nov 2025 20:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762200512; cv=none; b=LMf/Ejk9JTRTu4a2dcdnUJlD/VnbQ68EicQm72qIA9t8QtmEMH9aGoRzXZTgdJQ+7JZJQ/9fOdlfcanlayrT7bEIKOux/rH0E/DBLok+SUnjafr4f1+noekuknkdzY2xYuqZWmt1lE8DMI63DidDNSFNu2EUjj/WgTej3hc/8ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762200512; c=relaxed/simple;
	bh=c+VsxSrmkWoKnik2zsmOhuOIx2KYrxYMd+GV8ubfBH0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Qsk9TW+nXibkPPn4fRrffSMhsk7cKTlX7MVtInNHeKYgZ9RP75kiYshdsv8X5tA57NZCf9LqomBnMrvvtK3Ub5zMSQqNyv9xDiDU7sd0icYEDR6jr+yHC39Op5VxoqU70PE437LrXn9TFzFwSok756XGSspcXp966FaAxik0Ziw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=X5Y+8ilo; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=xI66H01M; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4d0jMB4JpDz9sxJ;
	Mon,  3 Nov 2025 21:08:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762200502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gO1uJlhV6oM64fVpq/0JHSVRxjQ7sLQnALSTsOIjYT8=;
	b=X5Y+8ilodsOL4HoPbZhGRipcGdvgrg5A+4S0GGWdKrlzaSe+/pB790XiCyHIJH/iTol3cj
	yR0r4fGRm9EiaSSs2PtK59Qjdq1IMlxks4i7AsZRRZCJ+3vX6qvpUX1Lbaz5iQkkrL0Nft
	uCgQbew9IhSOaJxs/63ofIVZDa735q6VlAuhgapYiqwM/oGpz04UG1oATZAKD6p6739Ext
	EF2cteoqnWTCkU1eOvqHk+v3ZxBcQDlv9dq5mnArLcjKKbN6OvsUsuR0gkO+j7JribmxBK
	QCP8Ka4C/2eUIi4YuoMEHQoQy4a8e9GL7N5EK4/mfinCEPTWdStbT4thtekNYQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=xI66H01M;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762200500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gO1uJlhV6oM64fVpq/0JHSVRxjQ7sLQnALSTsOIjYT8=;
	b=xI66H01MM1/fv0z0izQzVRJQPMuP3I6bz+TAuuAPKQPlnq7DvVRC0CVYwJxQk2HDLQSyyy
	13Fbr9xPflk3Xh6E55W8oiVfhcTqOzWB40Dl3d3BqKUa5nJW6W7+ZDHdiUPfFj69jdxJ3S
	aBNUP4NZYCbHz3jMMOq6dsRbwrL2Ub/iknkPRiG5/Ujp4cCvxRacPEwmwWJvpI8c0/gENM
	CG/5HD2tI1SEURI/MPo4BtItGb/1fP1g9+1Y/eLADF6+KifszQl1FG8EZD4j3qCeVxIq9Q
	lHM2YsDliF2FIb7zypw5ZGOPNyEAksRlWLIIJHuQuG6qZtONPPXYvsIQJFA30A==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
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
Subject: [PATCH 1/2] dt-bindings: gpu: img,powervr-rogue: Document GE7800 GPU in Renesas R-Car M3-N
Date: Mon,  3 Nov 2025 21:07:35 +0100
Message-ID: <20251103200800.173440-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: khrd3qq4o39hm5ydwj6crqdebybxex5s
X-MBO-RS-ID: 914238a6db457e3aa3b
X-Rspamd-Queue-Id: 4d0jMB4JpDz9sxJ

Document Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
present in Renesas R-Car R8A77965 M3-N SoC.

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
 .../devicetree/bindings/gpu/img,powervr-rogue.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index a7ca6d3fdf10..c03efbedc397 100644
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
@@ -134,6 +139,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - img,img-ge7800
               - img,img-gx6250
               - img,img-bxs-4-64
     then:
-- 
2.51.0


