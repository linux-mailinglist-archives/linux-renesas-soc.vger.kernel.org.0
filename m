Return-Path: <linux-renesas-soc+bounces-24641-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6515AC5CA9E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 11:48:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54E7F3B1566
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 10:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B63A30DEDC;
	Fri, 14 Nov 2025 10:48:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA01221DB6;
	Fri, 14 Nov 2025 10:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763117291; cv=none; b=SU7yzTBJE6poSSpxtB6tWKwAdQ1GLdOh4l8bNSkHS0Ivezer+Rgu8GlH7m6faxsu05LgwBVcFBjmCm/ImhTaGEsumBozbL6kty10+lSB5EfLTo7mmXgOPc9i3YuGuMaN6mWMpU8v+lckwA/uFa/uo/aVvPyTyGLYbCILhyOzPhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763117291; c=relaxed/simple;
	bh=EZwz1bB3XcTruiRfg9BCLAPMvF7j9341FUFoWrsny94=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=txyRjmUFxAWFYdLMzwNzgxsX9kePRjKFMzZn/0kETMsDr6Iu9OHVAejJIuPJ9N1THrwfJJ8k9c3pzp8kCzYqj/XnSosE+v+w/1ZRxteCY+nFoWyaFEPEYpbRDxuxYOh9TF8JPnEGj5LaNpFaoTdl+J1w+9nJOq0uzGZI6JXZILE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE180C16AAE;
	Fri, 14 Nov 2025 10:48:03 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel@sholland.org>,
	Marc Zyngier <maz@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] of/irq: Ignore interrupt parent for nodes without interrupts
Date: Fri, 14 Nov 2025 11:47:54 +0100
Message-ID: <fbe6fc3657070fe2df7f0529043542b52b827449.1763116833.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Devicetree Specification states:

    The root of the interrupt tree is determined when traversal of the
    interrupt tree reaches an interrupt controller node without an
    interrupts property and thus no explicit interrupt parent.

However, of_irq_init() gratuitously assumes that a node without
interrupts has an actual interrupt parent if it finds an
interrupt-parent property higher up in the device tree.  Hence when such
a property is present (e.g. in the root node), the root interrupt
controller may not be detected as such, causing a panic:

    OF: of_irq_init: children remain, but no parents
    Kernel panic - not syncing: No interrupt controller found.

Commit e91033621d56e055 ("of/irq: Use interrupts-extended to find
parent") already fixed a first part, by checking for the presence of an
interrupts-extended property.  Fix the second part by only calling
of_irq_find_parent() when an interrupts property is present.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Split off from series "[PATCH/RFC 0/2] of/irq: Fix root interrupt
    controller handling"[1] to relax dependencies,
  - Drop RFC.

[1] https://lore.kernel.org/all/cover.1759485668.git.geert+renesas@glider.be
---
 drivers/of/irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index b174ec29648955c6..5cb1ca89c1d8725d 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -613,7 +613,7 @@ void __init of_irq_init(const struct of_device_id *matches)
 		 * are the same distance away from the root irq controller.
 		 */
 		desc->interrupt_parent = of_parse_phandle(np, "interrupts-extended", 0);
-		if (!desc->interrupt_parent)
+		if (!desc->interrupt_parent && of_property_present(np, "interrupts"))
 			desc->interrupt_parent = of_irq_find_parent(np);
 		if (desc->interrupt_parent == np) {
 			of_node_put(desc->interrupt_parent);
-- 
2.43.0


