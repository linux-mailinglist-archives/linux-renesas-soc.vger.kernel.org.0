Return-Path: <linux-renesas-soc+bounces-6891-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E1891BF5B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 15:15:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F540284C84
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 13:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DCF3156653;
	Fri, 28 Jun 2024 13:15:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624D6154434
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jun 2024 13:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719580556; cv=none; b=r8qZJCo8m2WtCwJNU3kWJu+CiTVLEmoYan8BVv7ZhOvmGuA4iyyHk4qk6ybpoQT+y7PX194BzKrs6DJu4JAx+X9A7i6xrUiufFoQLh8Y+Syxwi8OC0aj4A7ec8OKzLBCgJqORUSfQlyZJkju/qJ6qUEYhK1kLtvyRjfEYyEPuw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719580556; c=relaxed/simple;
	bh=XIgHNqE3O8FEDFfOHLzFxU1ZTNrvHsIgIEM9xwoivNI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SK7rNNFvQ/cbfEp3ZFscWpG6iMsLAk/8Q2HycYM67HyFGjuIKDJCZAHdqcVh7Us3VbgzYNTB8jVZ0Ig0fyS+DLBQAjG3TZ4pGhbRuHpZ7ylvsfdPO7I1Qso+Lx9eV9pOW/gKpbrjcnyfXqh+iDesDxy3EEzHI9SkzvEV1Xm5v7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:acf4:1256:ab55:12e6])
	by laurent.telenet-ops.be with bizsmtp
	id h1Fs2C00B5ECAAU011Fslv; Fri, 28 Jun 2024 15:15:52 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sNBS6-000VGa-9d;
	Fri, 28 Jun 2024 15:15:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sNBSC-00BlRQ-5J;
	Fri, 28 Jun 2024 15:15:52 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/3] Renesas DTS updates for v6.11 (take two)
Date: Fri, 28 Jun 2024 15:15:49 +0200
Message-Id: <cover.1719578281.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719578273.git.geert+renesas@glider.be>
References: <cover.1719578273.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 2bb78d9fb7c997f13309838600eead88cc99e96b:

  arm64: dts: renesas: r8a779h0: Add video capture nodes (2024-06-07 14:19:29 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.11-tag2

for you to fetch changes up to 40382441cb3c4ff51882087bf53c6e933ce21e0d:

  arm64: dts: renesas: r8a779h0: Drop "opp-shared" from opp-table-0 (2024-06-28 09:34:06 +0200)

----------------------------------------------------------------
Renesas DTS updates for v6.11 (take two)

  - Add E-FUSE support for the R-Car V3U, S4-8, V4H, and V4M SoCs,
  - Add sound support for the R-Car V4M SoC,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Geert Uytterhoeven (18):
      dt-bindings: fuse: Document R-Car E-FUSE / PFC
      dt-bindings: fuse: Document R-Car E-FUSE / OTP_MEM
      soc: renesas: Add R-Car fuse driver
      Merge tag 'renesas-rcar-fuse-tag' into renesas-dts-for-v6.11
      arm64: dts: renesas: r8a779a0: Add E-FUSE node
      arm64: dts: renesas: r8a779f0: Add E-FUSE node
      arm64: dts: renesas: r8a779g0: Add OTP_MEM node
      arm64: dts: renesas: r8a779h0: Add OTP_MEM node
      arm64: dts: renesas: r8a779a0: Add missing hypervisor virtual timer IRQ
      arm64: dts: renesas: r8a779f0: Add missing hypervisor virtual timer IRQ
      arm64: dts: renesas: r8a779g0: Add missing hypervisor virtual timer IRQ
      arm64: dts: renesas: r9a07g043u: Add missing hypervisor virtual timer IRQ
      arm64: dts: renesas: r9a07g044: Add missing hypervisor virtual timer IRQ
      arm64: dts: renesas: r9a07g054: Add missing hypervisor virtual timer IRQ
      arm64: dts: renesas: r9a08g045: Add missing hypervisor virtual timer IRQ
      ARM: dts: renesas: Add interrupt-names to arch timer nodes
      arm64: dts: renesas: Add interrupt-names to arch timer nodes
      arm64: dts: renesas: r8a779h0: Drop "opp-shared" from opp-table-0

Kuninori Morimoto (2):
      arm64: dts: renesas: r8a779g0: Tidy up sound DT settings
      arm64: dts: renesas: r8a779h0: R-Car Sound support

 .../bindings/fuse/renesas,rcar-efuse.yaml          |  55 ++++++
 .../devicetree/bindings/fuse/renesas,rcar-otp.yaml |  38 ++++
 arch/arm/boot/dts/renesas/r8a73a4.dtsi             |   1 +
 arch/arm/boot/dts/renesas/r8a7742.dtsi             |   1 +
 arch/arm/boot/dts/renesas/r8a7743.dtsi             |   1 +
 arch/arm/boot/dts/renesas/r8a7744.dtsi             |   1 +
 arch/arm/boot/dts/renesas/r8a7745.dtsi             |   1 +
 arch/arm/boot/dts/renesas/r8a77470.dtsi            |   1 +
 arch/arm/boot/dts/renesas/r8a7790.dtsi             |   1 +
 arch/arm/boot/dts/renesas/r8a7791.dtsi             |   1 +
 arch/arm/boot/dts/renesas/r8a7792.dtsi             |   1 +
 arch/arm/boot/dts/renesas/r8a7793.dtsi             |   1 +
 arch/arm/boot/dts/renesas/r8a7794.dtsi             |   1 +
 arch/arm/boot/dts/renesas/r9a06g032.dtsi           |   1 +
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          |   1 +
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          |   1 +
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          |   1 +
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi          |   1 +
 arch/arm64/boot/dts/renesas/r8a77951.dtsi          |   1 +
 arch/arm64/boot/dts/renesas/r8a77960.dtsi          |   1 +
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |   1 +
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |   1 +
 arch/arm64/boot/dts/renesas/r8a77970.dtsi          |   1 +
 arch/arm64/boot/dts/renesas/r8a77980.dtsi          |   1 +
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          |   1 +
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          |   1 +
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |  13 +-
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi          |  13 +-
 .../r8a779g0-white-hawk-ard-audio-da7212.dtso      |   4 -
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          |  27 +--
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi          |  76 +++++++-
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi        |   5 +-
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi         |   5 +-
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi         |   5 +-
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi         |   5 +-
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi         |   1 +
 drivers/soc/renesas/Kconfig                        |   8 +
 drivers/soc/renesas/Makefile                       |   1 +
 drivers/soc/renesas/rcar-fuse.c                    | 201 +++++++++++++++++++++
 include/linux/platform_data/rcar_fuse.h            |  11 ++
 include/linux/soc/renesas/rcar-fuse.h              |  41 +++++
 41 files changed, 509 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/fuse/renesas,rcar-efuse.yaml
 create mode 100644 Documentation/devicetree/bindings/fuse/renesas,rcar-otp.yaml
 create mode 100644 drivers/soc/renesas/rcar-fuse.c
 create mode 100644 include/linux/platform_data/rcar_fuse.h
 create mode 100644 include/linux/soc/renesas/rcar-fuse.h

