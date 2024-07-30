Return-Path: <linux-renesas-soc+bounces-7635-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F105941484
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 16:36:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68E391C211DB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 14:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C80531A00CB;
	Tue, 30 Jul 2024 14:36:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA69319DF41
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jul 2024 14:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722350209; cv=none; b=UxQ/S1mdb2lUYzqkMKzJulojRFWiTFIlBA7LkOI/zXp8MA7nhzUFrer5G5zVh7NqUIERsHm+7Zi11rRLdMda29b4zRrMo2iP6t+VLIw3dKDk5fkz0+UjCJT0T5GVDtKtxNETHsESr6pTokVVXf6bKPHfQn2BaIAn1vSe+ErjJPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722350209; c=relaxed/simple;
	bh=pr/z1TuNHT/HRdTRw5sNGrPViowH5UsNykPSK2wYXW8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iEw5gLp7Tbu66hncssKW20rNKHUuA0QbmwWXuK7zrIfZKOOZ5Xpd/klW6bxbkfVu57Z1t9gyorNDUJfCGTCICf7YCEL83FQImZahom1lIEtq6iTaS3sutgvR5wZmBELfwT4IdYHJ1BUYqE7DKqaOZfbP4xOq1ZDtkjfigyAR3As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:520d:93ad:ff6d:335e])
	by albert.telenet-ops.be with bizsmtp
	id tqck2C00X30Ayot06qckbf; Tue, 30 Jul 2024 16:36:45 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sYnxd-004B1i-Ke;
	Tue, 30 Jul 2024 16:36:44 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sYny0-00E1FV-MW;
	Tue, 30 Jul 2024 16:36:44 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL 0/3] arm64: renesas: defconfig: Updates after v6.11-rc1
Date: Tue, 30 Jul 2024 16:36:39 +0200
Message-Id: <cover.1722349965.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

        Hi all,

Regular updates for the defconfig for Renesas ARM64 systems.
As usual, these are not intended for upstream merge, but to be applied
to the topic/renesas-defconfig branch. 

Geert Uytterhoeven (3):
  arm64: renesas: defconfig: Enable slab hardening and kmalloc buckets
  arm64: renesas: defconfig: Enable Renesas Ethernet-TSN support
  arm64: renesas: defconfig: Refresh for v6.11-rc1

 arch/arm64/configs/renesas_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

