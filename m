Return-Path: <linux-renesas-soc+bounces-17844-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 30235ACE190
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jun 2025 17:36:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 283577ADA85
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jun 2025 15:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E8519DF8D;
	Wed,  4 Jun 2025 15:29:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAA819D88F
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Jun 2025 15:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749050996; cv=none; b=hAGcqYjHh82za2Xn6Y7gII+72jBYD8clgJABArISdGZ8gvO87vPRW3WZ3uYbzIntI84c0l6nkNWlL7zbpEiRYFhi9wKp3diBusNO39FTmfHLgRrv4l6eHevEP8IGXwSmsbMGW6qSu+to9D2rlR68QxnNbaXQiRg9y77tNpodpGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749050996; c=relaxed/simple;
	bh=j+kfnMV4AYciov5Kf2Oe+MuLoiNuhBIkupLzfFk1iss=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qHYYxPEMDWvLzhRPu0K8CeDbl4aA6kFTPS5HvsOZwZ2bojTYtLQgq/cydUnuRvnxLzXZ0ZvxGYWglIvgSagVIcAxc8wDSe2tnP/SbaNuGoGsupYAVsDW8L3hyQS0shAGeE6zc/15QPRBT3vUJOWKoCrkuTLLzauifGhwEVm/Nt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57057C4CEE4;
	Wed,  4 Jun 2025 15:29:55 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFT 0/6] arm64: renesas: r8a77980a: Add support for CANFD2
Date: Wed,  4 Jun 2025 17:29:45 +0200
Message-ID: <cover.1749048734.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

This patch series is an attempt to add support for the third CAN-FD
channel on R-Car V3H2.  It consists of three parts:
  1. Extend Pin Function Control for the third CAN-FD pin group,
  2. Extend the R-Car CAN-FD driver for third CAN-FD channel,
  3. Update DTS.

Unfortunately full testing requires local access to a (modified)
Condor-I board:
  - CANFD2 can be made available on GP1_19 and GP1_20, which are routed
    to test points CP4 and CP5, and to EXIO connector A after populating
    two zero-ohm resistors,
  - The ADV7511W node must be disabled, as its interrupt pin is shared
    with CANFD2_RX,
  - An external CAN transceiver must be added.
Alternatively, perhaps some testing can be performed by adding support
for the various test modes (External/Internal Loopback Mode,
Inter-Channel Communication Test) to the CAN-FD driver?
I still have to look into that...

Thanks for your comments!

Geert Uytterhoeven (6):
  dt-bindings: pinctrl: renesas: Document R-Car V3H2 support
  pinctrl: renesas: r8a77980: Add R-Car V3H2 support
  dt-bindings: can: renesas,rcar-canfd: Document R-Car V3H2 support
  can: rcar_canfd: Increase number of channels to 3 on R-Car Gen3
  arm64: dts: renesas: r8a77980a: Update PFC compatible
  arm64: dts: renesas: r8a77980a: Add support for CAN-FD channel 2

 .../bindings/net/can/renesas,rcar-canfd.yaml  |  18 +-
 .../bindings/pinctrl/renesas,pfc.yaml         |  72 +--
 arch/arm64/boot/dts/renesas/r8a77980a.dtsi    |  12 +
 drivers/net/can/rcar/rcar_canfd.c             |   2 +-
 drivers/pinctrl/renesas/core.c                |   4 +
 drivers/pinctrl/renesas/pfc-r8a77980.c        | 457 ++++++++++--------
 drivers/pinctrl/renesas/sh_pfc.h              |   1 +
 7 files changed, 326 insertions(+), 240 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

