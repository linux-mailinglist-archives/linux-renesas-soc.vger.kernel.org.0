Return-Path: <linux-renesas-soc+bounces-9340-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A9398ECA0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2024 12:02:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B739D1C20A95
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2024 10:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB2F013D278;
	Thu,  3 Oct 2024 10:02:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F798146A60
	for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Oct 2024 10:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727949768; cv=none; b=f/WWqILCyau5265T5ME4VFYhhpca9KlMeDjPvEoHjHTnIoHTiSe+JtMJyTBMlnU5fHPnYMTlJkmd8HFnwedm59DU++YhXa25Nzf0JgwI4EjptLvpwRClih8ATzwtxaVi2nLedfQBKGTmZVdBOISZOiG/zN0abTGlS+BGHCldGKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727949768; c=relaxed/simple;
	bh=4dXSyJJ//Byhz1pM4gcDXO38II7RuZekReaVyPIKEUk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CeyuvF89u4IpZC1QYs+WQxWAH/kAjJdVwH8RFa8G2STt1Cl4lk0o+2lsWR+i5dGFzkvWQzMEFR9fJsQKCusotndFiee/6K3BlpH0kLbiQ6eNcPZJjwMVKyIkMVNBLogHSeJnUHZz5oAroI51UxVXskuiomdxJFrweL3LJPIznJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:d4db:7463:4f08:3c82])
	by xavier.telenet-ops.be with cmsmtp
	id Km2c2D00e5K8SYz01m2cdX; Thu, 03 Oct 2024 12:02:37 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swIfE-001BCp-Cz;
	Thu, 03 Oct 2024 12:02:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swIfM-0068YP-Ka;
	Thu, 03 Oct 2024 12:02:36 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL 0/3] arm64: renesas: defconfig: Updates after v6.12-rc1
Date: Thu,  3 Oct 2024 12:02:31 +0200
Message-Id: <cover.1727949523.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

This patch series contains customary updates after the v6.12-rc1
release.  As usual, this is not intended for upstream integration, but
to be applied to my topic/renesas-defconfig branch.

Thanks for your comments!

Geert Uytterhoeven (3):
  arm64: renesas: defconfig: Disable Synopsys DesignWare I2C support
  arm64: renesas: defconfig: Enable RZ/V2H(P) Watchdog support
  arm64: renesas: defconfig: Refresh for v6.12-rc1

 arch/arm64/configs/renesas_defconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

