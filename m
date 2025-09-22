Return-Path: <linux-renesas-soc+bounces-22154-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EB0B91E78
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 17:27:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F8402A1725
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 15:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A022E2661;
	Mon, 22 Sep 2025 15:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Go658E63"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B39B442C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 15:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758554817; cv=none; b=qdHkpzvhLi1/uZYmnGk3DlIXO5sO3eoZZGTcuLkbWUUotzbgj3UuEh06+Gpu7IWMsynBGZPsNUMpGr+ZMBAJ2l3CdrwstG7u2Ef16yu7Us8xdOLZOtne3Rme93JnPuKQWcq0rB8/Tl5gwYrKg9v7CnLsddE6X4Ag+lMVFJaabrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758554817; c=relaxed/simple;
	bh=Xk4yP5zQXEjAMym/oguGn2Aj0e2M0s2/7Fs1amWjgII=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IZdMpJtJnewMjR7xF6deFWErTspON+b41zAnw7WmRhIB0oXM3FhVtXl0E9ReH81LEZCJHKGpT+Ju+xpEm6DwG8P2qqz8b6G6Nq9xacIBWtVdh6ypgdZ6oi95oKNm2pmKODAGCBCwAX6wg4AGgT5kDlm/yuh2jX26Kw3JZ1ZcP38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Go658E63; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7C3B41A0EDB;
	Mon, 22 Sep 2025 15:26:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4FCD260635;
	Mon, 22 Sep 2025 15:26:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8FC35102F1942;
	Mon, 22 Sep 2025 17:26:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758554812; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=C8hZd6fZB4bmNjdKtYHznLIIjH0LHrp+zNRbkcAgyZs=;
	b=Go658E63X9WyOfgY0iyeAD8zNaaiUjd6ExoGPAljgbnBacEwf2XveK9YK7Ffx63XNdgR04
	jPjZgLJnRhDa2N+GEfLdWTHL7/DKbJiBfwaRBTdWXIsbyKVa6PKaugzEBy4L955ttGs7MA
	1WwyamwtR2mMND0Sad30jwLmkmZFgPRS5xjMQc6nvEOj4upmiowTot6X5UrgJGHKp/FNeF
	gApB5YP+k7osFK4rjvTHVCNEGVg0aeDTJm+QVkvGG6FR0EZSLvop+ml3tlK3dMYkaHzCPD
	pnwoKikS9zIJF4JIfszpjyncoUpvL7PQBs69xNPQa61tuc1ZczMsk1Oz4npsBw==
From: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@google.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Phil Edworthy <phil.edworthy@renesas.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v4 0/8] gpio: renesas: Add support for GPIO and related interrupts in RZ/N1 SoC
Date: Mon, 22 Sep 2025 17:26:31 +0200
Message-ID: <20250922152640.154092-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

This series adds support for GPIO and GPIO IRQ mux available in the
RZ/N1 SoCs.

The first patches in this series are related to a new helper introduced
to parse an interrupt-map property.
  - patch 1: Introduce the helper (for_each_of_imap_item)
  - patch 2: Add a unittest for the new helper
  - patch 3 and 4: convert existing drivers to use this new helper

Patch 4 will conflicts with commit 40c26230a1bf ("irqchip: Use int type
to store negative error codes") available in linux-next.

Patch 5 adds support for GPIO (device-tree description)

The last patches (6, 7 and 8) of the series are related to GPIO
interrupts and GPIO IRQ multiplexer.

In the RZ/N1 SoCs, GPIO interrupts are wired to a GPIO IRQ multiplexer.

This multiplexer does nothing but select 8 GPIO IRQ lines out of the 96
available to wire them to the GIC input lines.

One upstreaming attempt have been done previously by Phil Edworthy [1]
but the series has never been applied.

Based on my understanding, I have fully reworked the driver proposed by
Phil and removed the IRQ domain. Indeed, the device doesn't handle
interrupts. It just routes signals.

Also, as an interrupt-map property is used, the driver cannot be
involved as an interrupt controller itself. It is a nexus node.

With that in mind,
  - Patch 6 is related to the irq-mux binding.

  - Patch 7 introduces the irq-mux driver.
    This driver uses the 'for_each_of_imap_item' helper introduced
    previously. Indeed, the lines routing is defined by the
    interrupt-map property and the driver needs to set registers to
    apply this routing.

  - Patch 8 is the RZ/N1 device-tree description update to have the
    support for the GPIO interrupts.

[1] https://lore.kernel.org/all/20190219155511.28507-1-phil.edworthy@renesas.com/

Best regards,
Hervé

Changes v3 -> v4
  v3: https://lore.kernel.org/lkml/20250918104009.94754-1-herve.codina@bootlin.com/

  Patch 1:
    - Add 'Tested-by: Wolfram Sang'

  Patch 2..5:
    - No changes

  Patch 6:
    - Add minItems and maxItems
    - Update the 'interrup-map' description

  Patch 7:
    - Use rzn1_irqmux prefix instead of irqmux.
    - Introduce rzn1_irqmux_output_lines[] to give the mapping between
      the interrupt output line index and the GIC controller interrupt
      number.
    - Remove of_irq_count() call and related checks

  Patch 8:
    - Describe the irq mux node using a reduced (one item) interrupt-map
      property.

Changes v2 -> v3
  v2: https://lore.kernel.org/lkml/20250909120041.154459-1-herve.codina@bootlin.com/

  Reordered patches as suggested by Thomas Gleixner.

  Patch 1: (3 in v2)
    - Replace a wrong 'extern' by 'static inline' in of_irq.h  (detected
      by test robots)

  Patch 2: (4 in v2)
  Patch 3: (5 in v2)
  Patch 4: (6 in v2)
    - No changes

  Patch 5: (1 in v2)
    - Add 'Reviewed-by: Wolfram Sang'
    - Add 'Tested-by: Wolfram Sang'

  Patch 6: (2 in v2)
    - Add '#address-cells = <0>;' in the interrupt-controller node
      present in the example.

  Patch 7:
  Patch 8:
    - No changes

Changes v1 -> v2
  v1: https://lore.kernel.org/lkml/20250725152618.32886-1-herve.codina@bootlin.com/

  Rebase on top of v6.17-rc5

  Patch 1 in v1
    - Removed in v2 (no need for RZ/N1 compatible strings).

  Patch 1 (2 in v1)
    - Fix node names (issue reported by Rob's bot)
    - Fix compatible RZ/N1 compatible strings
    - Removed undocumented and unused 'bank-name' properties

  Patch 2 (3 in v1)
   - Remove 'interrupts' property
   - Update 'interrupt-map' description

  Patch 3 (4 in v1)
   - Rework of_irq_foreach_imap() to provide the for_each_of_imap_item
     iterator (similar to for_each_of_range)

  Patch 4 (new in v2)
   - Add a unittest for for_each_of_imap_item

  Patch 5 (new in v2)
   - Convert irqchip/ls-extirq to use for_each_of_imap_item

  Patch 6 (new in v2)
   - Convert irqchip/renesas-rza1 to use for_each_of_imap_item

  Patch 7 (5 in v1)
   - Use for_each_of_imap_item
   - Remove 'interrupts' property usage

  Patch 8 (6 in v1)
   - Remove 'interrupts' property

Herve Codina (Schneider Electric) (8):
  of/irq: Introduce for_each_of_imap_item
  of: unittest: Add a test case for for_each_of_imap_item iterator
  irqchip/ls-extirq: Use for_each_of_imap_item iterator
  irqchip/renesas-rza1: Use for_each_of_imap_item iterator
  ARM: dts: r9a06g032: Add GPIO controllers
  dt-bindings: soc: renesas: Add the Renesas RZ/N1 GPIO Interrupt
    Multiplexer
  soc: renesas: Add support for Renesas RZ/N1 GPIO Interrupt Multiplexer
  ARM: dts: r9a06g032: Add support for GPIO interrupts

 .../soc/renesas/renesas,rzn1-gpioirqmux.yaml  |  87 ++++++++++
 arch/arm/boot/dts/renesas/r9a06g032.dtsi      | 164 ++++++++++++++++++
 drivers/irqchip/irq-ls-extirq.c               |  47 ++---
 drivers/irqchip/irq-renesas-rza1.c            |  43 ++---
 drivers/of/irq.c                              |  70 ++++++++
 .../of/unittest-data/tests-interrupts.dtsi    |   9 +
 drivers/of/unittest.c                         | 116 +++++++++++++
 drivers/soc/renesas/Kconfig                   |   4 +
 drivers/soc/renesas/Makefile                  |   1 +
 drivers/soc/renesas/rzn1_irqmux.c             | 136 +++++++++++++++
 include/linux/of_irq.h                        |  41 ++++-
 11 files changed, 660 insertions(+), 58 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas,rzn1-gpioirqmux.yaml
 create mode 100644 drivers/soc/renesas/rzn1_irqmux.c

-- 
2.51.0


