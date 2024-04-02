Return-Path: <linux-renesas-soc+bounces-4217-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CECE1895709
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Apr 2024 16:39:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C2D71C2263C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Apr 2024 14:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E54312BF17;
	Tue,  2 Apr 2024 14:36:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595B0131753
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Apr 2024 14:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712068571; cv=none; b=SXcwqBgrRtzxiBuaKovpIEtVmB6hKzo87qzJ79zOk7OaztlcYD3vWdtGF3oyj2dcOYjpaV9ZvaaknRq8kahMtHyvcqK++FtghqGBr+GhQjX6JxvMOoVYCrPuHW0XKoo10gpLPbtp4XQA/kfUs8c8xIEexFaLV0rlr8PyivuXEjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712068571; c=relaxed/simple;
	bh=jp8Rf3HNnA6jRQ+dBqYOdDJGouS6G1V2+oooEdU+y1I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FGxIncxTGLvWKDdvlP6VMpaqf82xWd7wY+J71BSjn3icQ9k5jPksOlq8FouCOcfURGd649aWTwna5PnA+g9Z4n119wEuzXHOEW+8si86Lss7we++a/ab0sG+aPR/cAVrOw4CyaQ92icSEC/s59xUYmBG2vZzkgWqbg4JB53mRE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by andre.telenet-ops.be with bizsmtp
	id 6Ec72C00M0SSLxL01Ec7fb; Tue, 02 Apr 2024 16:36:07 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rrfEh-00GBRP-Jf;
	Tue, 02 Apr 2024 16:36:07 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rrfF8-009rQc-UA;
	Tue, 02 Apr 2024 16:36:06 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: timer: renesas,cmt: Add R-Car V4M support
Date: Tue,  2 Apr 2024 16:36:05 +0200
Message-Id: <3e8a7a93261d8ad264dec2fa2784fe1bbfc4a23c.1712068536.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for the Compare Match Timer Type0 (CMT0) and Type1
(CMT1) in the Renesas R-Car V4M (R8A779H0) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/timer/renesas,cmt.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/renesas,cmt.yaml b/Documentation/devicetree/bindings/timer/renesas,cmt.yaml
index a0be1755ea28b996..5e09c04da30e47d5 100644
--- a/Documentation/devicetree/bindings/timer/renesas,cmt.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,cmt.yaml
@@ -103,6 +103,7 @@ properties:
               - renesas,r8a779a0-cmt0     # 32-bit CMT0 on R-Car V3U
               - renesas,r8a779f0-cmt0     # 32-bit CMT0 on R-Car S4-8
               - renesas,r8a779g0-cmt0     # 32-bit CMT0 on R-Car V4H
+              - renesas,r8a779h0-cmt0     # 32-bit CMT0 on R-Car V4M
           - const: renesas,rcar-gen4-cmt0 # 32-bit CMT0 on R-Car Gen4
 
       - items:
@@ -110,6 +111,7 @@ properties:
               - renesas,r8a779a0-cmt1     # 48-bit CMT on R-Car V3U
               - renesas,r8a779f0-cmt1     # 48-bit CMT on R-Car S4-8
               - renesas,r8a779g0-cmt1     # 48-bit CMT on R-Car V4H
+              - renesas,r8a779h0-cmt1     # 48-bit CMT on R-Car V4M
           - const: renesas,rcar-gen4-cmt1 # 48-bit CMT on R-Car Gen4
 
   reg:
-- 
2.34.1


