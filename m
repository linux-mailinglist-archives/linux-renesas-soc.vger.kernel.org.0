Return-Path: <linux-renesas-soc+bounces-16382-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 421F0A9C91B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Apr 2025 14:42:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7895A1889101
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Apr 2025 12:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D688F24BC1A;
	Fri, 25 Apr 2025 12:42:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4118D24BC1D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Apr 2025 12:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745584939; cv=none; b=TtN3WpB5G97UQ3KOylBdFU51NLRG664svp9hiXfDAAABHVKNIryW0RoujwVVTdHwLoAnjopJYGbFY/TYfxofmk5+VJGtCjdjl2gDc6Ol6BPKPYI+6Qfzts3yex0mSMixV2ZXDbl7R/L98UeEbSDTRUG5oIpB/wtZ5fYigZQRAaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745584939; c=relaxed/simple;
	bh=s18HugNEZxIvYEkNxXfXxoiEi0mv19F9mUAB6gheJbk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j7VRb57ZIgyMqg6QwbuqBwJwLZzkfJQdfxRhxCMi7nuTKtaoveKnOvrLAykFpCDfzYPCFXYSSBc+4NN4kwpwwv8CAluhnEjJTmD0DMTqtz5wHU1ZeGZ8wLlRzx9Q2EfvzFMyKkZGoIl1NdFmHf71PcaRnrTBBYK68QwTWYTTJSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4ZkXNt3vcgz4xW5r
	for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Apr 2025 14:35:10 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:3329:b4bc:d565:c72])
	by baptiste.telenet-ops.be with cmsmtp
	id hQb22E00l16PE0201Qb2k0; Fri, 25 Apr 2025 14:35:03 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u8IGb-00000001gJW-1em3;
	Fri, 25 Apr 2025 14:35:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u8IGk-0000000CKiv-2agP;
	Fri, 25 Apr 2025 14:35:02 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/4] Renesas SoC updates for v6.16
Date: Fri, 25 Apr 2025 14:34:55 +0200
Message-ID: <cover.1745582587.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v6.16.

It consists of 4 parts:

  [GIT PULL 1/4] Renesas ARM defconfig updates for v6.16

    - Enable all Renesas SoCs by default when ARCH_RENESAS is set, and
      remove individual SoC entries from the various defconfigs.

  [GIT PULL 2/4] Renesas driver updates for v6.16

    - Enable all Renesas SoCs by default when ARCH_RENESAS is set, which
      will allow up to remove all individual Renesas SoC entries from the
      various defconfigs,
    - Initial support for the Renesas RZ/V2N (R9A09G056) SoC.

  [GIT PULL 3/4] Renesas DT binding updates for v6.16

    - Document support for the Renesas RZ/T2H (R9A09G077) SoC and the
      RZT2H-EVK evaluation board,
    - Document support for the Retronix Sparrow Hawk board, which is based
      on R-Car V4H ES3.0.

  [GIT PULL 4/4] Renesas DTS updates for v6.16

    - Add SDHI, ICU, I2C, PMIC, and GPU support on the RZ/G3E SoC and the
      RZ/G3E SoM and SMARC Carrier-II EVK development board,
    - Add internal SDHI regulator support on the RZ/V2H(P) SoC,
    - Add UFS tuning parameters in E-FUSE on the R-Car S4-8 ES1.2 SoC,
    - Add support for Ethernet ports C and D, I2C, keys, and SDHI on the
      RZ/N1D SoC and the RZN1D-DB and RZN1D-EB development and expansion
      boards,
    - Add initial support for the RZ/V2N (R9A09G056) and the RZ/V2N EVK
      board,
    - Add support for the Retronix Sparrow Hawk board, which is based on
      R-Car V4H ES3.0,
    - Add ISP core support on R-Car V3U, V4H, and V4M,
    - Miscellaneous fixes and improvements.

Notes:
  - The commit "soc: renesas: Kconfig: Enable SoCs by default when
    ARCH_RENESAS is set" is shared by PRs 1/4 and 2/4, as the defconfig
    updates depend on it,
  - PR 4/4 includes DT bindings and bindings definitions for the RZ/V2N
    SoC, which are shared by DT source files and device drivers.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

