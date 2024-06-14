Return-Path: <linux-renesas-soc+bounces-6205-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3581D90870E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 11:07:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF7062819CF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 09:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF9CB148844;
	Fri, 14 Jun 2024 09:07:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C718C183071
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 09:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718356027; cv=none; b=sB0fP4VVVsQMoc3gnsrqYG8L/WvTv2OjnXfnLK6MPc9323Cf0l08ydllU9yBIytoVrZgVwH11WvENgqCx908pVu4Qr3qTNOLZFpY8cgutPROKEmYtItlfant7RR53TUthOIxFNuiV9VXNqXNs7mBXbTXlkZDJs9y6l/mQuWud/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718356027; c=relaxed/simple;
	bh=FIfBfxxRPksWEdNmhx7BCEcEstxmujlsImdrlwxE+7k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NEKWKoUghMxVdcAucKllbOq1ZG63Lg1bDCSTPevuwfLmTeq7PKBmoFVIaB8z1YnnHxGyMS3JjC9bB60uLvvJB1mE/XCOak0h4u6AsKxrW7ihhxrmJj58IOtRuwz5YWTbsrOhb9NKqTu2usKFkuhAFrhKLk69kPomv/XlJaegs8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:be2a:f066:50f0:dff7])
	by baptiste.telenet-ops.be with bizsmtp
	id bM732C00M3w30qz01M73x5; Fri, 14 Jun 2024 11:07:03 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sI2se-00BqO8-TO;
	Fri, 14 Jun 2024 11:07:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sI2tj-00FbJi-Fe;
	Fri, 14 Jun 2024 11:07:03 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/2] Renesas DTS updates for v6.11
Date: Fri, 14 Jun 2024 11:06:59 +0200
Message-Id: <cover.1718355312.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718355309.git.geert+renesas@glider.be>
References: <cover.1718355309.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.11-tag1

for you to fetch changes up to 2bb78d9fb7c997f13309838600eead88cc99e96b:

  arm64: dts: renesas: r8a779h0: Add video capture nodes (2024-06-07 14:19:29 +0200)

----------------------------------------------------------------
Renesas DTS updates for v6.11

  - Add support for the second and third Ethernet interfaces on the
    White Hawk development board,
  - Add support for the second Ethernet interface on the RZ/N1 SoC,
  - Add I2C EEPROM support for the Condor-I development board,
  - Add video capture support for the R-Car V4M SoC,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Clément Léger (1):
      ARM: dts: renesas: r9a06g032: Describe GMAC1

Geert Uytterhoeven (1):
      arm64: dts: renesas: condor-i: Add I2C EEPROM

Lad Prabhakar (3):
      arm64: dts: renesas: r9a09g011: Update fallback string for SDHI nodes
      arm64: dts: renesas: rzg2l: Update fallback string for SDHI nodes
      arm64: dts: renesas: r9a08g045: Update fallback string for SDHI nodes

Niklas Söderlund (3):
      arm64: dts: renesas: r8a779g0: Use MDIO node for all AVB devices
      arm64: dts: renesas: white-hawk: ethernet: Describe AVB1 and AVB2
      arm64: dts: renesas: r8a779h0: Add video capture nodes

Wolfram Sang (4):
      arm64: dts: renesas: gray-hawk-single: Add aliases for I2C buses
      arm64: dts: renesas: white-hawk-cpu: Add aliases for I2C buses
      arm64: dts: renesas: spider-cpu: Add aliases for I2C buses
      arm64: dts: renesas: s4sk: Add aliases for I2C buses

 arch/arm/boot/dts/renesas/r9a06g032.dtsi           |  18 +
 arch/arm64/boot/dts/renesas/condor-common.dtsi     |   6 +
 arch/arm64/boot/dts/renesas/r8a77980-condor.dts    |   8 -
 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi      |   6 +
 arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts      |   6 +
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          |   6 -
 .../boot/dts/renesas/r8a779h0-gray-hawk-single.dts |   4 +
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi          | 666 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi         |   4 +-
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi         |   4 +-
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi         |   4 +-
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi         |   6 +-
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi         |   6 +-
 .../boot/dts/renesas/white-hawk-cpu-common.dtsi    |  29 +-
 .../boot/dts/renesas/white-hawk-ethernet.dtsi      | 103 ++++
 15 files changed, 841 insertions(+), 35 deletions(-)

