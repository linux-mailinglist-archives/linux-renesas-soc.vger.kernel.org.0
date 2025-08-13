Return-Path: <linux-renesas-soc+bounces-20460-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0935FB24AB3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Aug 2025 15:37:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 967847AB6B2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Aug 2025 13:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F3C11A9FBE;
	Wed, 13 Aug 2025 13:37:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D857261D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Aug 2025 13:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755092231; cv=none; b=jK80nwnp48YN8McskyesYp81mvks5nzNJkcWHl2kFCUH1rg5YBW02ZVYTB1DS21aXSHWB+JxyzSHAGAdS+yf8aaBWyiqfac/mBzvtFejZ+MQlXz90txT4t3nIIis4az8U/PYbRMYs95R1HweI9QOx9vkBzYP5xYKCb5yWZOC4uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755092231; c=relaxed/simple;
	bh=1gntjqj71uLzc0x/E8yJ8ty1hJ+2XaHrzlDXdxOos/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xg+4luhJcoCwojutgdQdAZnvcY+5zyV5ufkplD7jmS8baYKApovl+P1dxNgruRr2R1taHIuoqtSKPekOJzYbx+2pK4Lcibg9msz7a+o9kANoU+KZ1Y+eghlJYjEDTmnxXLyH3SyGtUmI30qja0KJhCFsMx75sIddAyQsOCIvRB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CFBCC4CEF5;
	Wed, 13 Aug 2025 13:37:09 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] arm64: dts: renesas: Increase CANFD clock rates
Date: Wed, 13 Aug 2025 15:37:02 +0200
Message-ID: <cover.1755090456.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

Currently, all R-Car Gen3 and RZ/G2 .dtsi files configure the CANFD core
clocks to 40 MHz, which limits CAN-FD data transfer rates to 4 Mbps.
However, all R-Car Gen3 and RZ/G2 SoCs except for R-Car D3 support CANFD
clock rates up to 80 MHz.

Now the R-Car CAN-FD driver has gained support for Transceiver Delay
Compensation in v6.17-rc1, increase all appropriate CANFD clock rates to
the documented maximum, to support data rates up to 8 Mbps.

The R-Car Gen3 boards that have CAN-FD enabled use CAN transceivers
that support transfer rates up to 8 (Ebisu) or 5 (Condor(-I), Eagle)
Mbps.  None of the RZ/G2 boards have CAN-FD enabled.

The Draak board, and some of the RZ/G2 boards have CAN enabled instead
of CAN-FD.  None of these are affected by this series, as they either
rely on the default value of zero for the "renesas,can-clock-select"
property, or configure it explicitly to zero, thus not using the CANFD
core clock as CAN clock source.

All .dtsi files for SoCs in the RZ/G2L family configure the P0_DIV2
clock to 50 Mhz, which should be sufficient for the maximum supported
transfer rates of 4 Mbps (my board has no CAN transceiver mounted...).
RZ/G3E already configures its can_clk to 80 MHz.

This series has been tested on Ebisu-4D (R-Car E3).
I plan to queue it in renesas-devel for v6.18.

Thanks for your comments!

Geert Uytterhoeven (2):
  arm64: dts: renesas: rcar-gen3: Increase CANFD clock rates
  arm64: dts: renesas: rzg2: Increase CANFD clock rates

 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a77951.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a77970.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a77980.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

