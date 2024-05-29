Return-Path: <linux-renesas-soc+bounces-5649-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED418D3642
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 14:22:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05E62286592
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 12:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B639918132F;
	Wed, 29 May 2024 12:22:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A49180A99
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 May 2024 12:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716985335; cv=none; b=eRERypT2JIf+6mWa1q+3tnsoQpLtktYdu58+w7op2lf6L0zmrPwFbPi9BvZhISxCV+ljhd0dVJWLinQPjhk4/1nd2wCoW8iWZU9eh3dIXpFsi5VFTNbDY2dTzjzvaZIzNenJXK4WspK+lbcG6UOLBU/JISfaCqCWy9fJCpBGHIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716985335; c=relaxed/simple;
	bh=feewhomXOl7dYCVVnvL83cmLCbLT7Ntv8OV3SB+KiaY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EjsNaJHB7q1e8OhZ9XFEdrLCz6QxHEn50QaD+bBhHn7kjNUDOWB/ngY3A5wFFfJWARMV2ECnu3vTNSaEyngf6oCTCEMgcfgmk2WpzwmRBH6StebtnC5X3RRf8J0G9yk5q3IHVT6SUfJu67roGAXdHBufyEnuEoYDZ/YZm4JwHx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:1b01:1838:131c:4de4])
	by xavier.telenet-ops.be with bizsmtp
	id V0N82C00R3VPV9V010N8aF; Wed, 29 May 2024 14:22:12 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCIIo-00GdJw-8t;
	Wed, 29 May 2024 14:22:08 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCIJk-009XU5-Lt;
	Wed, 29 May 2024 14:22:08 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 2/3] dt-bindings: timer: renesas,tmu: Add RZ/G1 support
Date: Wed, 29 May 2024 14:22:05 +0200
Message-Id: <bdc30850526f448b8480d9a5e65e35739f416771.1716985096.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716985096.git.geert+renesas@glider.be>
References: <cover.1716985096.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document support for the Timer Unit (TMU) on RZ/G1 SoCs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v2:
  - Add Acked-by, Reviewed-by.
---
 Documentation/devicetree/bindings/timer/renesas,tmu.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
index 33170daa3bc348a0..cc228ed28ee8a301 100644
--- a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
@@ -23,6 +23,11 @@ properties:
       - enum:
           - renesas,tmu-r8a73a4  # R-Mobile APE6
           - renesas,tmu-r8a7740  # R-Mobile A1
+          - renesas,tmu-r8a7742  # RZ/G1H
+          - renesas,tmu-r8a7743  # RZ/G1M
+          - renesas,tmu-r8a7744  # RZ/G1N
+          - renesas,tmu-r8a7745  # RZ/G1E
+          - renesas,tmu-r8a77470 # RZ/G1C
           - renesas,tmu-r8a774a1 # RZ/G2M
           - renesas,tmu-r8a774b1 # RZ/G2N
           - renesas,tmu-r8a774c0 # RZ/G2E
-- 
2.34.1


