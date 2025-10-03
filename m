Return-Path: <linux-renesas-soc+bounces-22625-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A17BB66BF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Oct 2025 12:08:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 646E5424C72
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Oct 2025 10:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 596E62773D9;
	Fri,  3 Oct 2025 10:08:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F4F1C84BC;
	Fri,  3 Oct 2025 10:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759486088; cv=none; b=Mw/QKK73Js/fES8cUmoMViitmZN5gBSU0oz6VfZ0djcdACKKOSExh6IML7OcteClGjJaXUm4dDtvnm3HQE2U9HCdn04dP2p7PO1ZGsJCmEmqkpTvliiYEp79hd0omdVsx31JeGZn6kDuHVeNfeGy0MZcq0KQNTsHy2QPELUtr4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759486088; c=relaxed/simple;
	bh=4VM2nluOFrPIhXz7wxt8N5FFjyo5VNBOtf1ihfAhYL8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n0nQooXjIfFxVsnWVkJbbcC9d1C9ORbQvad3/YcZiBUKdjM4mMtilXm50b129m0ds7Hvxc2C4iknaR/gis92WZkrEQE6HCmTTtqP/5AmRA6M/J+kDE6UdrHSvwmZcJe9UEO0u2I7dfWmknXXPoro5EK7vf9HTiH4nlv11bl/GOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89427C4CEF5;
	Fri,  3 Oct 2025 10:08:03 +0000 (UTC)
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
Subject: [PATCH/RFC 0/2] of/irq: Fix root interrupt controller handling
Date: Fri,  3 Oct 2025 12:07:47 +0200
Message-ID: <cover.1759485668.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

On ARM, the main interrupt controller is typically the GIC, and one can
safely put "interrupt-parent = <&gic>;" in the root node.  The GIC node
has an interrupts property, but it points to itself, causing
of_irq_init() to treat it as the root interrupt controller.

On RISC-V, the main interrupt controller is typically the PLIC.
However, one can not put "interrupt-parent = <&plic>;" in the root node,
as that would cause a kernel panic ("No interrupt controller found").
The main difference with ARM is that the PLIC is not the root interrupt
controller: its interrupt parent is the RISC-V CPU or Hart-Level
Interrupt Controller (HLIC).  The latter is the root interrupt
controller, and despite having no interrupts property, it is currently
not considered the root interrupt controller when an interrupt-parent
property is present in the root node.

This series fixes the issue in of_irq_init(), and moves the
"interrupt-parent = <&plic>;" for the RZ/Five (R9A07G043F) SoC from the
soc node to the top node, like was done recently for the very similar
RZ/G2UL (R9A07G043U) SoC[1].

Thanks for your comments!

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git/commit/?h=renesas-dts-for-v6.19&id=0070434f4a910179a23cd7ab812c33811f00b253)

Geert Uytterhoeven (2):
  of/irq: Ignore interrupt parent for nodes without interrupts
  riscv: dts: renesas: r9a07g043f: Move interrupt-parent to top node

 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi | 3 ++-
 drivers/of/irq.c                            | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

