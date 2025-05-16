Return-Path: <linux-renesas-soc+bounces-17154-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1D0AB9CB3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 May 2025 14:55:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 014EE1B618A3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 May 2025 12:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8378B235069;
	Fri, 16 May 2025 12:55:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B201DFDE
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 May 2025 12:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747400120; cv=none; b=jC2lNXcUY1f8OZkYBI4PrIDC+Ovy+ZsjBBVu9EklULx8f+dpwCAYrsRuyi/UNJETYsbSCWS+9ftcYSxhkrFrhorvh3owQUtGd/INTgjSB2TVEiWCA+j0G/ShuvOE/adz90j8OlWge92h4q5+uqSmBjlasnVUgXV79QaEW8qk7/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747400120; c=relaxed/simple;
	bh=U5oH/qMNOUHhFZyDoJQVqdmcnhE1SOh1XkoNyNxpvqU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eFv/BJteJt5J5YQoRMRmAMHhAgdn1v45Mw65mi51DQDwVZDXfYZElVyLJ0eMPjUnGKVjnCv0dIUjxXq5et4wda6vDWiH3zCMsuxJmQ0SgSfZ4qZjdQ8TytGN194CN/wuNs3EUXgcrG1AEyIWGsGLlvYvQXb1GWHATbo/CKdBiwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b0d6:ccd4:58dc:70fd])
	by baptiste.telenet-ops.be with cmsmtp
	id pov82E00M3S8nz401ov8UX; Fri, 16 May 2025 14:55:09 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uFuaX-000000020ZE-1lBj;
	Fri, 16 May 2025 14:55:08 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uFuai-000000013QW-3I6B;
	Fri, 16 May 2025 14:55:08 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas DTS updates for v6.16 (take three)
Date: Fri, 16 May 2025 14:55:07 +0200
Message-ID: <cover.1747399860.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my third pull request for the inclusion of Renesas SoC updates
for v6.16, containing only fixes.

The following changes since commit b280613d480aa170e51029d5582bb4b666982b7c:

  ARM: dts: renesas: r9a06g032-rzn1d400-eb: Enable USB host port (2025-05-08 20:23:33 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.16-tag3

for you to fetch changes up to 1064013303c6dd59f1586656f853765c6e870f8b:

  riscv: dts: renesas: Add specific RZ/Five cache compatible (2025-05-14 13:30:06 +0200)

----------------------------------------------------------------
Renesas DTS updates for v6.16 (take three)

  - Silence a DTC warning,
  - Add an extra compatible value to avoid future issues.

Thanks for pulling!

----------------------------------------------------------------
Conor Dooley (1):
      riscv: dts: renesas: Add specific RZ/Five cache compatible

Geert Uytterhoeven (1):
      arm64: dts: renesas: sparrow-hawk: Disable dtc spi_bus_bridge check

 arch/arm64/boot/dts/renesas/Makefile        | 1 +
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

