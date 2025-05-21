Return-Path: <linux-renesas-soc+bounces-17287-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC95DABEED9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 11:00:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FAEF3B29DA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 09:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE7312356DE;
	Wed, 21 May 2025 09:00:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BA5231852
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 May 2025 09:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747818020; cv=none; b=MlJY0aN65hPGSyFqlLOBovob6+kahn4BWRfzKrHz7vkDQaf1r2Z0YDj70T150dmIaFg35mDNvn3fsEv4mzoKo5AgsoANx/iaUceX6EJrWjvJarlpCAugA2u99XpM4Sc4glcj5b3gintng+oY2A0D7mEz5Eddwi0j574vf1H5TQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747818020; c=relaxed/simple;
	bh=9q+hyRHXohHqDSLnLvFvFUAnzd0H8twh56Uq+QEEVLg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UqH0YHqz3cnkwblv670iuifdTse6/ksB5Sbaz4BpDCKXxvcmK/k8XfxijEDBJgzox+K0YdyW0V0CRltI6E+DWXsHrBznJdrNCKAwilGW5u4mGJAuTuK+ea7W5DEhUB156oquI1lS5NrlguBodcdDgGx8/qMfAYb/h0hMZzmkISk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:2bba:d77b:9240:3c4e])
	by michel.telenet-ops.be with cmsmtp
	id rl0G2E0024GqtyW06l0GUC; Wed, 21 May 2025 11:00:16 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uHfIw-00000002i7H-3gyx;
	Wed, 21 May 2025 11:00:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uHfJA-00000002ch9-02Wf;
	Wed, 21 May 2025 11:00:16 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas DTS updates for v6.16 (take four)
Date: Wed, 21 May 2025 11:00:13 +0200
Message-ID: <cover.1747817851.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my fourth pull request for the inclusion of Renesas SoC updates
for v6.16, containing just a fix.

The following changes since commit 1064013303c6dd59f1586656f853765c6e870f8b:

  riscv: dts: renesas: Add specific RZ/Five cache compatible (2025-05-14 13:30:06 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.16-tag4

for you to fetch changes up to 652eea251dd852f02cef6223f367220acb3d1867:

  arm64: dts: renesas: white-hawk-ard-audio: Fix TPU0 groups (2025-05-20 09:31:11 +0200)

----------------------------------------------------------------
Renesas DTS updates for v6.16 (take four)

  - Fix White Hawk ARD Audio breakage.

Thanks for pulling!

----------------------------------------------------------------
Thuan Nguyen (1):
      arm64: dts: renesas: white-hawk-ard-audio: Fix TPU0 groups

 arch/arm64/boot/dts/renesas/white-hawk-ard-audio-da7212.dtso | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

