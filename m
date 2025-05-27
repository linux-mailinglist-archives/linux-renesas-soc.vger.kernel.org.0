Return-Path: <linux-renesas-soc+bounces-17562-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C201BAC5AD0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 May 2025 21:35:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DC971BC1E62
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 May 2025 19:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7949B12B93;
	Tue, 27 May 2025 19:35:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E3127E7C6
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 May 2025 19:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748374502; cv=none; b=kw8VmIzs1LIrsjPVxMMbam2e0jq+0DOu9OZg3NVKeWIbPDgKY+lrGOjnUdLV+wCJxMn7517LoIKFfZZ2X/cmJJfR6S2Uui94sF8UR4c1He8lDs21NdM2EYlpA7xMD79gYg8yVZk2z/mvGDOoBzkiCjcJRYQpTDBJFn8T8qAE67s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748374502; c=relaxed/simple;
	bh=OlAB+JCKLcfOL+LfdBc8fLSIe4f/4QqXEJtAvYyj2t0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CVytEVeZhRvMROU6xmHEbcZBrWri6gJyvqRh1WYsfY9xcmoU+BktkwOHPwuQo5sRrG5NXD9/Oplp+cVXicvRXlsTWSIyMh7OXDeShWpDQCGoH5ln0/3RhSKRsNM8WUk48/goep3ExYV9svnPqPGsGFk41EAE7dgDH6/6Cl/2k9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan2 ([IPv6:2a02:1810:ac12:ed80:9962:836e:244b:c4d7])
	by laurent.telenet-ops.be with cmsmtp
	id uKar2E0090Y7Yez01KarLX; Tue, 27 May 2025 21:34:51 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan2 with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uK04Z-00000003oJJ-24WQ;
	Tue, 27 May 2025 21:34:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uK04Z-00000003WiW-1gKl;
	Tue, 27 May 2025 21:34:51 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas DTS updates for v6.16 (take five)
Date: Tue, 27 May 2025 21:34:47 +0200
Message-ID: <cover.1748355530.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my fifth pull request for the inclusion of Renesas SoC updates
for v6.16, containing just a fix.

The following changes since commit 652eea251dd852f02cef6223f367220acb3d1867:

  arm64: dts: renesas: white-hawk-ard-audio: Fix TPU0 groups (2025-05-20 09:31:11 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.16-tag5

for you to fetch changes up to f62bb41740462bf9fde4b110df5c7d3bc223fb3c:

  arm64: dts: renesas: rzg3e-smarc-som: Reduce I2C2 clock frequency (2025-05-26 12:07:27 +0200)

----------------------------------------------------------------
Renesas DTS updates for v6.16 (take five)

  - Reduce I2C2 clock frequency on the RZ/G3E SMARC SoM.

Thanks for pulling!

----------------------------------------------------------------
John Madieu (1):
      arm64: dts: renesas: rzg3e-smarc-som: Reduce I2C2 clock frequency

 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

