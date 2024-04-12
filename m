Return-Path: <linux-renesas-soc+bounces-4547-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B51318A2CD4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Apr 2024 12:49:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A0081F22E88
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Apr 2024 10:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 423DF43AD5;
	Fri, 12 Apr 2024 10:49:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127234C624
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Apr 2024 10:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712918948; cv=none; b=edlMLCp2mGNHeT28YoiWBc9LeUYe16ixoEUoVBCeFDGRZ3ZbQZKaO5NAoDDCQ0Hvc8mlCYP5T/dLLVYazai8qtM8CvwIzrj8Xn+TWGqPep6NuBXwtUlQzEpumW1D+eon/z8fKABeZmFX50/aGklZQMq/d+xdIwtEuVjt87mMSLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712918948; c=relaxed/simple;
	bh=/TSbk8ixG8Ov0afWZN2BKF/1U7in3EOVQDQFyeNUCIM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=M2FBKP0M1PHrxCaBGvvumQGVAF53LITDqZgQ01XQGqFSl30Wbbqs91RfFzsYsmKKoBiCdQVrLKfCvtMI7Yf7AIsQVCTh/fyzzonCJGpZwYgAc+8WtMOhSgFlVS8df9gNTKYB4NKtawAnwYP1zD8tRUXFrSoChjRQhRKILxq0q1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by xavier.telenet-ops.be with bizsmtp
	id AAoy2C0030SSLxL01Aoylo; Fri, 12 Apr 2024 12:48:58 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rvESG-00GpCB-8Q;
	Fri, 12 Apr 2024 12:48:57 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rvDj5-004eQD-Ot;
	Fri, 12 Apr 2024 12:01:43 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/4] Renesas SoC updates for v6.10
Date: Fri, 12 Apr 2024 12:01:36 +0200
Message-Id: <cover.1712915528.git.geert+renesas@glider.be>
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
for v6.10.

It consists of 4 parts:

  [GIT PULL 1/4] Renesas ARM defconfig updates for v6.10

    - Enable support for the Renesas RZ/G2L display unit, DA9062 PMIC, and
      RZ/V2H (R9A09G057) SoC in the ARM64 defconfig,
    - Refresh shmobile_defconfig for v6.9-rc1.

  [GIT PULL 2/4] Renesas driver updates for v6.10

    - Identify the new RZ/V2H (R9A09G057) SoC,
    - Enable support for the TMU (Timer Unit) on R-Car Gen2 SoCs.

  [GIT PULL 3/4] Renesas DT binding updates for v6.10

    - Document support for the Renesas RZ/V2H(P) (R9A09G057) SoC variants.

  [GIT PULL 4/4] Renesas DTS updates for v6.10

    - Add HDMI capture support for the Function expansion board for the
      Eagle development board,
    - Add PMIC support for the RZ/G2UL SMARC EVK development board,
    - Add thermal, more serial ((H)SCIF), and timer (CMT and TMU) support
      for the R-Car V4M SoC,
    - Add Timer Unit (TMU) support for the R-Mobile APE6, R-Car Gen2, and
      RZ/G1 SoCs,
    - Miscellaneous fixes and improvements.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

