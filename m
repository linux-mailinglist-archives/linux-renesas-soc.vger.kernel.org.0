Return-Path: <linux-renesas-soc+bounces-8005-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E4F95B0ED
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 10:52:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E776DB2207A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 08:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90CD116EB65;
	Thu, 22 Aug 2024 08:52:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371F816DEB4
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Aug 2024 08:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724316734; cv=none; b=eXdihkI4oGDeqNzhz4PdFvH01eE6dd6PcdhihUEHHy0XbLYVo9jIytBBcbeDZazRE/XmkhJyHW5eEagvAdTSA91nT3Hl8FX9zkeq/TUeG898V9XMkq5d2ebl3o7TVclVtfmlFa20cEmgPXtsOg5hG9E8JOCAWx62BE4MLecbI1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724316734; c=relaxed/simple;
	bh=Q8f3Aq61vQRwFvL+CffNn2g+APWskM2YIgGhXl7Cm4A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HtGwu4mtZLEox9qspqFSzQ+FDZ6QDzyrVd3SvH88ai/oLRDC18JRemUBxj0a1rFzlwoc9EXAzhe8bj8OggeZS7+fr5tKOsB97cfA0vpdUJ2wYR/vQszIhdYDZOCYgr8SDaoy7XIIAmFLf8nGTgZBbcG5tqEvI/L743ZxSGgi4Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:410c:b78a:c35b:cd3e])
	by baptiste.telenet-ops.be with bizsmtp
	id 2ws22D00B22R5AR01ws2p5; Thu, 22 Aug 2024 10:52:04 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sh3Y0-000VWs-16;
	Thu, 22 Aug 2024 10:52:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sh3Y2-002L5j-8Q;
	Thu, 22 Aug 2024 10:52:02 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas SoC updates for v6.12
Date: Thu, 22 Aug 2024 10:51:50 +0200
Message-Id: <cover.1724316478.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v6.12.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas ARM defconfig updates for v6.12

    - Enable support for AK4619 codecs and Renesas R-Car Ethernet-TSN
      controllers in the ARM64 defconfig,
    - Enable slab hardening and kmalloc buckets in the Renesas ARM
      defconfig.

  [GIT PULL 2/3] Renesas DT binding updates for v6.12

    - Document support for the Renesas RZ/G2M v3.0 (r8a774a3) SoC.

  [GIT PULL 3/3] Renesas DTS updates for v6.12

    - Add support for sound, push switches, and GP LEDs on the Gray Hawk
      Single development board,
    - Add missing iommus properties on R-Car Gen3/Gen4 and RZ/G2 SoCs,
    - Add PWM support for the R-Car V4M SoC,
    - Improve Ethernet descriptions on the RZ/G2L, RZ/G2LC, and RZ/G2UL
      SMARC SoMs,
    - Add DMAC support for the RZ/G3S SoC,
    - Add CAN-FD support for the R-Car V4M SoC and the Gray Hawk Single
      development board.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

