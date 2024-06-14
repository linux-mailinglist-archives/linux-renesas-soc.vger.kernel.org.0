Return-Path: <linux-renesas-soc+bounces-6204-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E18D90870D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 11:07:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 828871C2102A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 09:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A11EC191496;
	Fri, 14 Jun 2024 09:07:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71DC1836C9
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 09:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718356027; cv=none; b=W7RlrcQjOh30c+5YUkDCLtjJZRHDl7W0o2SrABpgZXZh0VWFHLmBtXDQePLlT3wN/09+sL4t3ujSV4IM8aoRmd8GInfKHUnPmlsiPlyHZM7bfFLXcA8sL+VbV3NIcGuoDWTA71tFJkML7bPTOq7yqpZD296Z3omwZBDWrmUl85k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718356027; c=relaxed/simple;
	bh=LTuz6zjQydZlU4KCBqUR5FF60go+ot2pKN1uXud6hEI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Fc9cbMqoBlsAvzmkBX0rGEVfUzlnN/JXAWwly9KNxkA5dTcCiGaplYbw4iDPpt9SDdWDrlo6JRW//Frxjf7jikH8XehxGckpSh/xlEel9mYHLljUuYbREZALrVEHT2ZnbubTHcp02LAS0w0kG7CowiNGG2We0CJ9lGc95k8op6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:be2a:f066:50f0:dff7])
	by baptiste.telenet-ops.be with bizsmtp
	id bM732C00L3w30qz01M73x4; Fri, 14 Jun 2024 11:07:03 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sI2se-00BqO6-Sb;
	Fri, 14 Jun 2024 11:07:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sI2tj-00FbJe-E0;
	Fri, 14 Jun 2024 11:07:03 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/2] Renesas ARM defconfig updates for v6.11
Date: Fri, 14 Jun 2024 11:06:58 +0200
Message-Id: <cover.1718355311.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718355309.git.geert+renesas@glider.be>
References: <cover.1718355309.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v6.11-tag1

for you to fetch changes up to 4b45a978b25da1d4de051ed8e91e669e3701d780:

  arm64: defconfig: Enable Marvell 88Q2XXX PHY support (2024-06-03 09:35:27 +0200)

----------------------------------------------------------------
Renesas ARM defconfig updates for v6.11

  - Enable support for Renesas R-Car Gen4 PCIe controllers and Marvell
    88Q2XXX 100/1000BASE-T1 Automotive Ethernet PHYs in the ARM64
    defconfig.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      arm64: defconfig: Enable Marvell 88Q2XXX PHY support

Wolfram Sang (1):
      arm64: defconfig: Enable Renesas R-Car Gen4 PCIe controller

 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

