Return-Path: <linux-renesas-soc+bounces-21809-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0B3B54ABE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 13:14:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A7981647D4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 11:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14B322FF15E;
	Fri, 12 Sep 2025 11:14:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED21C296BBC;
	Fri, 12 Sep 2025 11:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757675642; cv=none; b=rsiWQx8Ewb/2bdhUR7RgamGolgKz4vRkr/IN+hKRpwoKpvy7lJdBwEx4BIuHdIHT8xfa0AM+xXPo9B4p9YCBVKQHROkSCiFU+QipDqQcDs6GfJPY6DaoJrYqSm2SfA4h/KUloeQj6VwuFH2OZWWCT87EFCaLACvvzrxvFODyiww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757675642; c=relaxed/simple;
	bh=1YYXsrlWC+X8GM9mWSP+Pe0eZ9xeSZDwU6HSJSvaIdI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AGoTxzWEpc7wRBaJAuBy5qOfV/Q9BupSZbNmL0P/8vUwwdgriq9h0U11thVRh53QL41yIkZBlrQVmHZprHP9K6vhzsOFmxFDYgt76T3TIUwLTtMRgowXcZYT98lLQPPio+Co5FS5TuNRG/NVYqSSVK5kj/tRoFDHmYdVbaMW/Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46638C4CEF1;
	Fri, 12 Sep 2025 11:14:00 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas SoC updates for v6.18 (take two)
Date: Fri, 12 Sep 2025 13:13:50 +0200
Message-ID: <cover.1757669912.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v6.18.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas driver updates for v6.18 (take two)

    - Identify the Renesas R-Car X5H (R8A78000) SoC.

  [GIT PULL 2/3] Renesas DT binding updates for v6.18

    - Document the R-Car X5H (R8A78000) SoC and the Ironhide board.

  [GIT PULL 3/3] Renesas DTS updates for v6.18 (take two)

    - Add pin control and I2C support for the RZ/N2H SoC and its
      evaluation board,
    - Add LED, EEPROM, eMMC, SD card, watchdog, and USB2.0 support for the
      RZ/T2H and RZ/N2H SoCs and their evaluation boards,
    - Add I3C support for the RZ/V2H and RZ/V2N SoCs,
    - Add IMX219 and IMX462 camera overlay support for the Sparrow Hawk
      board,
    - Miscellaneous fixes and improvements.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

