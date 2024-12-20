Return-Path: <linux-renesas-soc+bounces-11632-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A039F9048
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 11:31:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BD301884124
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 10:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CDE91BDAAA;
	Fri, 20 Dec 2024 10:31:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F83F1B6541
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Dec 2024 10:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734690662; cv=none; b=bPCse9gQk/FW6Gzw3FPfNb0IEDKG52+0kk5b7ZA/cEztq4arRR2SPUs6sHDHMl8Qq54Ge2LKzpEaiIiDLk8Hp5OMCq0TAQ5D2OdsdqPJNoJXF0SXhspHv1FehuntXnT1qMa19lZ2giPo8TzUPpIkDB2IkBfIIiHBenmT2uk1idc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734690662; c=relaxed/simple;
	bh=t2+p4vZ9XhVQstYCGbAjngiUKVItyKbWzDglfyWvzos=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E+cyH8CynvzLZLkjsBKeykSHMvglzsaglHNcdvaD6E1wFrS1Kk1Dptk/9x0j5Gkvb8km1DI00OZAvVEGVqvK8s3naN8jxl/FT/wi6RoveHzMgg/nhkgx9LQqwwRRRFJ2k30o8XaLMC9+B1cDOZTMxwQVyoF3j12RFje+5DvrAkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:7a4e:e361:29f2:181c])
	by laurent.telenet-ops.be with cmsmtp
	id qyWq2D00U5V3mYk01yWq5l; Fri, 20 Dec 2024 11:30:52 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tOaHN-001s3n-Gy;
	Fri, 20 Dec 2024 11:30:50 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tOaFY-000gNB-Ev;
	Fri, 20 Dec 2024 11:28:52 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/3] Renesas ARM defconfig updates for v6.14
Date: Fri, 20 Dec 2024 11:28:45 +0100
Message-Id: <cover.1734689799.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734689797.git.geert+renesas@glider.be>
References: <cover.1734689797.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v6.14-tag1

for you to fetch changes up to a40f02b2923b6d58e76cfef760b8ed61a00f1d53:

  arm64: defconfig: Enable R9A09G047 SoC (2024-12-13 11:09:59 +0100)

----------------------------------------------------------------
Renesas ARM defconfig updates for v6.14

  - Enable Watchdog support for the RZ/V2H(P) SoC and the RZ/V2H EVK
    board in the ARM64 defconfig,
  - Refresh shmobile_defconfig for v6.13-rc1,
  - Enable support for the Renesas RZ/G3E (R9A09G047) SoC in the ARM64
    defconfig.

----------------------------------------------------------------
Biju Das (1):
      arm64: defconfig: Enable R9A09G047 SoC

Geert Uytterhoeven (1):
      ARM: shmobile: defconfig: Refresh for v6.13-rc1

Lad Prabhakar (1):
      arm64: defconfig: Enable Renesas RZ/V2H(P) Watchdog driver

 arch/arm/configs/shmobile_defconfig | 1 +
 arch/arm64/configs/defconfig        | 2 ++
 2 files changed, 3 insertions(+)

