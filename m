Return-Path: <linux-renesas-soc+bounces-6206-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D883908710
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 11:07:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DB10281CB2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 09:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27542183071;
	Fri, 14 Jun 2024 09:07:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED78F148844
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 09:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718356036; cv=none; b=QAr3GRN7TVEl1xC8a122enVw2vahQlqWemaf+eJkSvl9Y3yJ8JDc0FOca/YKd6DdIzKqrLxgvAWYLVoKgPNKhW0KdRncnJsJIE2KNRCuUw0Sk/lti9NWD15UWIC7izNp/YgGhfbqchpa8GJNdhfP3HRrTZ8bwF0fqpv0nh8XuZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718356036; c=relaxed/simple;
	bh=c5p4y5JMVWLeetbHdFadZZKgUE3h05QJXf9r0AojEfA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ZZUzYY1g02hfoWl6ZKWSbKv6aPUA4Bzk1bBnkrQLlhTF3rTijJ6pqjgvwEIE9Q/pRFD4pSwcQNc+6OetliGUiecB3GWfnkQiq6r4I6Xre239xkfmlvV2xA/05lmQSDxPzMZ3MdYZNYE2S8kN5Es4aRBxgHCbQWxH9gPN/PzvTC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:be2a:f066:50f0:dff7])
	by baptiste.telenet-ops.be with bizsmtp
	id bM7D2C00U3w30qz01M7Dyc; Fri, 14 Jun 2024 11:07:13 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sI2so-00BqPl-PD;
	Fri, 14 Jun 2024 11:07:13 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sI2tt-00FbKH-9T;
	Fri, 14 Jun 2024 11:07:13 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.11
Date: Fri, 14 Jun 2024 11:07:10 +0200
Message-Id: <cover.1718355410.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

	Hi Mike, Stephen,

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.11-tag1

for you to fetch changes up to f92d44a00bd559f411b2c70b677afbc7c4723019:

  clk: renesas: r8a779h0: Add VIN clocks (2024-06-11 09:36:27 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v6.11

  - Add video capture (ISPCS, CSI-2, VIN) clocks on R-Car V4M,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (3):
      clk: renesas: r8a77970: Use common cpg_lock
      clk: renesas: cpg-lib: Use DEFINE_SPINLOCK() for global spinlock
      clk: renesas: rcar-gen2: Use DEFINE_SPINLOCK() for static spinlock

Lad Prabhakar (1):
      dt-bindings: clock: renesas,rzg2l-cpg: Update description for #reset-cells

Niklas Söderlund (3):
      clk: renesas: r8a779h0: Add ISPCS clocks
      clk: renesas: r8a779h0: Add CSI-2 clocks
      clk: renesas: r8a779h0: Add VIN clocks

 .../devicetree/bindings/clock/renesas,rzg2l-cpg.yaml |  2 +-
 drivers/clk/renesas/r8a77970-cpg-mssr.c              |  5 +----
 drivers/clk/renesas/r8a779h0-cpg-mssr.c              | 20 ++++++++++++++++++++
 drivers/clk/renesas/rcar-cpg-lib.c                   |  2 +-
 drivers/clk/renesas/rcar-gen2-cpg.c                  |  4 +---
 drivers/clk/renesas/rcar-gen3-cpg.c                  |  2 --
 drivers/clk/renesas/rcar-gen4-cpg.c                  |  2 --
 7 files changed, 24 insertions(+), 13 deletions(-)

