Return-Path: <linux-renesas-soc+bounces-22626-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BA432BB66CB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Oct 2025 12:08:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 64893344DB9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Oct 2025 10:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 912C52C15AA;
	Fri,  3 Oct 2025 10:08:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3541D88D0;
	Fri,  3 Oct 2025 10:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759486095; cv=none; b=s1HNsUuowFSmWNDM+6Qut/8YW0Z3wH0YVvAYF4j1M4OinLiqUJEWeHvmbtMI7SmOqVEhirFGO8jhYR07JZToMdt6Vg/cuJbEJjgrg5V41DAxXyTPsMk16k6QIPOx8Bl74n51C/yboUN8/39e4KG6NpMMcFUf3AorogSUEmgUH5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759486095; c=relaxed/simple;
	bh=7rgKALxlyD7zLq5Sy/eX+cMxrClqlIZzpl9cnsqV7Gs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M9BztBPn47Lr3prpjlEfQVUmzHg4roq/Mvbk4tzpZbT1Dk0Uem7VE6ickxtqX2bNTy876EsIsyIUa23/4GVMey4PwrwQg3a0JRjGHuFZbgkwpZi90g+dv4B7cJlhNajWoT0yFAy8AqPmVJ3ly4cbFDBiluzQIq1O/Rnz/jJvOp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E607FC4CEF9;
	Fri,  3 Oct 2025 10:08:11 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel@sholland.org>,
	Marc Zyngier <maz@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 1/2] of/irq: Ignore interrupt parent for nodes without interrupts
Date: Fri,  3 Oct 2025 12:07:48 +0200
Message-ID: <98e13934d06116d5c116bd2b2187842ec3a8c11a.1759485668.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1759485668.git.geert+renesas@glider.be>
References: <cover.1759485668.git.geert+renesas@glider.be>
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
 drivers/of/irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index c29f0bef7798ec02..f155054e297c989a 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -663,7 +663,7 @@ void __init of_irq_init(const struct of_device_id *matches)
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


