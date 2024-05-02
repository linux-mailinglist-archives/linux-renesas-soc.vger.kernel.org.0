Return-Path: <linux-renesas-soc+bounces-5020-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B381E8B983B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 May 2024 11:57:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 795FC281310
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 May 2024 09:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F495647B;
	Thu,  2 May 2024 09:57:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CD756751
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 May 2024 09:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714643843; cv=none; b=bz/3MtCVm45iW5VUiwGY+zcjIgzR7UuZX9LY9NWW1ke3mGH0yXddKFpwEhpGXvhDD3IYFKHtUGCf8fZs+XUFMjHhqBd1hPvesgySpvcJQ2Y6QQb7BzJl+RDzyDuHfQ6iUxe5ZQpbJoakx/Vh15I0bRQGAX6lk2HUn5B+sG2gI+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714643843; c=relaxed/simple;
	bh=2CmnMP9+6aPHmNHVKDiaYZ6UZcvqAaXkOYkViBVhAWM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b1743r6RPrvdavrgPGkYbh3VhxBvH6R0Dn0PUVanWjXxcu4PsVifYLxWMJMQiWkJXKCgKNp4zVPzbr8LL6KKP/EluGSIrVQsTa/9Eg6LGCf0xQZL9BOQZvYnqZdyHbBpbYZWmuDsyPTvVUU8XgPR+KTml/VjUmUZwP8f61qsgFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:93f:7d7e:5c98:dabc])
	by laurent.telenet-ops.be with bizsmtp
	id J9xC2C0093PjoSD019xC0F; Thu, 02 May 2024 11:57:12 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1s2TAv-002nZE-Sa;
	Thu, 02 May 2024 11:57:12 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1s2TBg-004jYH-4P;
	Thu, 02 May 2024 11:57:12 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 2/8] dt-bindings: fuse: Document R-Car E-FUSE / OTP_MEM
Date: Thu,  2 May 2024 11:57:05 +0200
Message-Id: <1bdad606a9c07df40d1c2fd77bbdad350a981aa1.1714642390.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714642390.git.geert+renesas@glider.be>
References: <cover.1714642390.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for E-FUSE non-volatile memory accessible through
OTP_MEM on R-Car V4H and V4M.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../bindings/fuse/renesas,rcar-otp.yaml       | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fuse/renesas,rcar-otp.yaml

diff --git a/Documentation/devicetree/bindings/fuse/renesas,rcar-otp.yaml b/Documentation/devicetree/bindings/fuse/renesas,rcar-otp.yaml
new file mode 100644
index 0000000000000000..d74872ae9ff378f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/fuse/renesas,rcar-otp.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/fuse/renesas,rcar-otp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: R-Car E-FUSE connected to OTP_MEM
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+
+description:
+  The E-FUSE is a type of non-volatile memory, which is accessible through the
+  One-Time Programmable Memory (OTP_MEM) module on some R-Car Gen4 SoCs.
+
+properties:
+  compatible:
+    enum:
+      - renesas,r8a779g0-otp # R-CarV4H
+      - renesas,r8a779h0-otp # R-CarV4M
+
+  reg:
+    items:
+      - description: OTP_MEM_0
+      - description: OTP_MEM_1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    otp: otp@e61be000 {
+            compatible = "renesas,r8a779g0-otp";
+            reg = <0xe61be000 0x1000>, <0xe61bf000 0x1000>;
+    };
-- 
2.34.1


