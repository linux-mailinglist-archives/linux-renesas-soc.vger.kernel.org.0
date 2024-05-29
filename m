Return-Path: <linux-renesas-soc+bounces-5651-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE018D3678
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 14:32:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BC851F268C3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 12:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26C0718130B;
	Wed, 29 May 2024 12:32:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C8E181303
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 May 2024 12:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716985959; cv=none; b=TTsZv2chcWn1UVX3pGwuV/y2JDQac9bP151l4rjykX8RjwL9OXyQWZy6danY6F2DratdMt9Jnehdtf20mycqqNWierONvJhzMlGL33pGkUtl91KJ+6fTgVC0+ppGhWzcvabj3RCZcKk6/jiNIR8oFQzyvo1yPE5WPNQ5kOUb3ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716985959; c=relaxed/simple;
	bh=xr3BLD3QGdIgOEksdpVVfKsYGW4f9kqam36dVQmegkw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=icdb98fBsP2+w2CTYUbkwCZ1c4fH1ogSPMFIHGarlQBInO7WTRDwnZwYaD0Jb/xdIAGpDA4sklegW4cT9gpHtJSB0Azx8Di4jMY9AMEYmvjVTrMwRHAK6VCNsusoaoxHJNaPxam3kgOd/uoDvsi6i5wKlgbZgWZfNHBS3o4tjtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:1b01:1838:131c:4de4])
	by baptiste.telenet-ops.be with bizsmtp
	id V0YZ2C0043VPV9V010YZPH; Wed, 29 May 2024 14:32:34 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCISs-00Gecx-Gn;
	Wed, 29 May 2024 14:32:32 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCITo-009bMd-SX;
	Wed, 29 May 2024 14:32:32 +0200
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] dt-bindings: timer: renesas,tmu: Make interrupt-names required
Date: Wed, 29 May 2024 14:32:32 +0200
Message-Id: <65fdd0425be0cc1bae9e6f7996aceaa5ad34e510.1716985947.git.geert+renesas@glider.be>
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
v2:
  - Add Acked-by.
---
 Documentation/devicetree/bindings/timer/renesas,tmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
index b6dd98d956f3e867..75b0e7c70b62c89f 100644
--- a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
@@ -95,6 +95,7 @@ required:
   - compatible
   - reg
   - interrupts
+  - interrupt-names
   - clocks
   - clock-names
   - power-domains
-- 
2.34.1


