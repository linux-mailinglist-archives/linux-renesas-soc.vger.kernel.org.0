Return-Path: <linux-renesas-soc+bounces-26914-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CE0D2FDE8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 11:50:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3D1EA301AB7F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 10:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74218361DD7;
	Fri, 16 Jan 2026 10:50:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B48030BBBF;
	Fri, 16 Jan 2026 10:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768560626; cv=none; b=Vk8F/kUeWVIGQ6qVi56mBzrx41Gk406PwJFZ/mszs+4Q/1cOPia/Ho+gWPz415pOPENct0te5hfwz11JPmLVXMPiipNwbfwn5ddZoNM17Rus7wliDxsWSOuqD4OtqN8FrkIMHsTrJTRb6WNpKQ2UIV+PHmIqFOZ/x7FbZ3o9pSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768560626; c=relaxed/simple;
	bh=oT//iS3U4g6c70kJJ+DwWtZX4nzmGfZJYFAcrxv+XzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X9Nn2Lwz+A8HygbY9qu7EDMeBLBpM3ViWzAkVE4wGuo+s79vVAfC1zrcWUhTzilNWPCsnaMnTDIIQai6fk3VzgTj4Ke0SCaNPQyx3HQz+aIdQ9YyL6Zro0D/jU1oR3q3HPNJJMYZzyy0uuDgMjVTJzCL6JUYI2Wm1QBWE/dYgNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA064C116C6;
	Fri, 16 Jan 2026 10:50:24 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/3] Renesas driver updates for v6.20 (take two)
Date: Fri, 16 Jan 2026 11:50:16 +0100
Message-ID: <cover.1768559764.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1768559762.git.geert+renesas@glider.be>
References: <cover.1768559762.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 1bea7e94bf09ee6d46051076866a9369f64d302a:

  soc: renesas: Enable ICU support on RZ/N2H (2025-12-23 09:25:33 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.20-tag2

for you to fetch changes up to 49261f479d45714692587ff0abe0c5279c6068d6:

  soc: renesas: Add support for RZ/N1 GPIO Interrupt Multiplexer (2026-01-15 12:05:16 +0100)

----------------------------------------------------------------
Renesas driver updates for v6.20 (take two)

  - Add and use for_each_of_imap_item() iterator,
  - Add support for the RZ/N1 GPIO Interrupt Multiplexer.

----------------------------------------------------------------
Herve Codina (Schneider Electric) (5):
      of/irq: Introduce for_each_of_imap_item
      of: unittest: Add a test case for for_each_of_imap_item iterator
      irqchip/ls-extirq: Use for_each_of_imap_item iterator
      irqchip/renesas-rza1: Use for_each_of_imap_item iterator
      soc: renesas: Add support for RZ/N1 GPIO Interrupt Multiplexer

 drivers/irqchip/irq-ls-extirq.c                |  47 ++++-----
 drivers/irqchip/irq-renesas-rza1.c             |  43 ++++-----
 drivers/of/irq.c                               |  70 ++++++++++++++
 drivers/of/unittest-data/tests-interrupts.dtsi |   9 ++
 drivers/of/unittest.c                          | 116 ++++++++++++++++++++++
 drivers/soc/renesas/Kconfig                    |   4 +
 drivers/soc/renesas/Makefile                   |   1 +
 drivers/soc/renesas/rzn1_irqmux.c              | 127 +++++++++++++++++++++++++
 include/linux/of_irq.h                         |  41 +++++++-
 9 files changed, 400 insertions(+), 58 deletions(-)
 create mode 100644 drivers/soc/renesas/rzn1_irqmux.c

