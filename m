Return-Path: <linux-renesas-soc+bounces-4175-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3FF891BA1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Mar 2024 14:29:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C6A41C26822
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Mar 2024 13:29:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 744308F72;
	Fri, 29 Mar 2024 12:37:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D34812DD9F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Mar 2024 12:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711715841; cv=none; b=E3njBn67dAs2TTjZzqHWFwR8nT8uGhZ3cjvFvASZnsc5FZ4zrflnQWl8seSx27wXgVPYBHFmCqRg9r5aomQDxBgplE7BU5MEqDBLrIO2GiPH4RSYfhxEfAMOMk50zOY/FygBqYew/rKnRIAorTykTBt92BmgwgOv64r1S+zRuMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711715841; c=relaxed/simple;
	bh=KCJvnCwUDRGfWB9FH7JYbuxRgM1DzU8NcIyMaiBlqy8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LDsj3dM7WdH/Him8ulQ/aIaAzCDr5X3WaB+1dP3ZXYfzEliGCwvgB+41yNnmxAzeAL3WN8bmOK62doATPtJ/o6ko4SmgdssHmKHGjdcLQje65bprCkT7QZVc3sMd8SZ2IGH72pHfm8AHVtdJdvhYh4wTk6tDtAQJLpjvMIKVyJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by michel.telenet-ops.be with bizsmtp
	id 4cdB2C00J0SSLxL06cdB8d; Fri, 29 Mar 2024 13:37:11 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rqBTS-005D9O-AO;
	Fri, 29 Mar 2024 13:37:11 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rqBTr-0020aZ-CG;
	Fri, 29 Mar 2024 13:37:11 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: timer: renesas,tmu: Make interrupt-names required
Date: Fri, 29 Mar 2024 13:37:09 +0100
Message-Id: <137c184267faacdc3024f0b88e53889571165a84.1711715780.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now all in-tree users have been updated with interrupt-names properties
according to commit 0076a37a426b6c85 ("dt-bindings: timer: renesas,tmu:
Document input capture interrupt"), make interrupt-names required.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/timer/renesas,tmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
index fde72eec7cb3cc8d..50b5225ceb10b64c 100644
--- a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
@@ -94,6 +94,7 @@ required:
   - compatible
   - reg
   - interrupts
+  - interrupt-names
   - clocks
   - clock-names
   - power-domains
-- 
2.34.1


