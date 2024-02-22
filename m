Return-Path: <linux-renesas-soc+bounces-3093-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5671685F5EC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 11:43:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB5331F237B0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 10:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA7BE29CEA;
	Thu, 22 Feb 2024 10:43:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE8B3D97D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Feb 2024 10:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708598586; cv=none; b=kVxZs1NKSmA8fy4ncSGeN/e7XQJvY/GFO4rWgmfOv20+VZNGo4hGaQPWA+F9CxDJD1Dup9XVQnqmdsKKZldf0opC48Xefw0zMKKOMD1/9ySZLfY0+djoq9Iz91Djmtlunvvie3jfjYUB9sgtg5G/LCs2jnBpDe2tvHGxJKbXFck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708598586; c=relaxed/simple;
	bh=39ai/5lq8J288gkn+OSkBjCtZNEt6+Z9yRsFXWF7zu8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bFHrxAnEq9Bc0MlAfwgY5M20DFh/JzC0SLk55/Na4o90I+o41Qu+z9YUn3N+rct+usP0+FZG0Ofb6A6brjPJm+szq1ulNSp0K5t0v2Qk7T3Hun3BxAHFZA4LM37tPEClJ79ya1JOCkLsEEZpyC1EwFBFubQtBPLmak/5NCJhyDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5450:2f24:6e58:231d])
	by laurent.telenet-ops.be with bizsmtp
	id qAiu2B00259vpg201AiuLC; Thu, 22 Feb 2024 11:42:55 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rd6XN-001KZd-Gj;
	Thu, 22 Feb 2024 11:42:53 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rd6XV-00CYJK-Py;
	Thu, 22 Feb 2024 11:42:53 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas fixes for v6.8
Date: Thu, 22 Feb 2024 11:42:51 +0100
Message-Id: <cover.1708597150.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-fixes-for-v6.8-tag1

for you to fetch changes up to 8c987693dc2d292d777f1be63cb35233049ae25e:

  ARM: dts: renesas: rcar-gen2: Add missing #interrupt-cells to DA9063 nodes (2024-02-22 10:55:03 +0100)

----------------------------------------------------------------
Renesas fixes for v6.8

  - Add missing #interrupt-cells to DA9063 nodes.

Fast-tracked to avoid new dtc interrupt_provider warnings.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (1):
      ARM: dts: renesas: rcar-gen2: Add missing #interrupt-cells to DA9063 nodes

 arch/arm/boot/dts/renesas/r8a7790-lager.dts   | 1 +
 arch/arm/boot/dts/renesas/r8a7790-stout.dts   | 1 +
 arch/arm/boot/dts/renesas/r8a7791-koelsch.dts | 1 +
 arch/arm/boot/dts/renesas/r8a7791-porter.dts  | 1 +
 arch/arm/boot/dts/renesas/r8a7792-blanche.dts | 1 +
 arch/arm/boot/dts/renesas/r8a7793-gose.dts    | 1 +
 arch/arm/boot/dts/renesas/r8a7794-alt.dts     | 1 +
 arch/arm/boot/dts/renesas/r8a7794-silk.dts    | 1 +
 8 files changed, 8 insertions(+)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

