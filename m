Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CB8017098F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2020 21:28:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727425AbgBZU2g (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Feb 2020 15:28:36 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.25]:36634 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727289AbgBZU2g (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Feb 2020 15:28:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582748914;
        s=strato-dkim-0002; d=fpond.eu;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=7goxirsbldqzP9pgJwAfyQkP+SmoYCugLKXiLAUA660=;
        b=jq28TpaWrblPlu6H8oZPuiLV22PsbQ6y6N+tg+J0XmW2z8JNqHFe3rWhZe3KePqasW
        3U8qjPlWvmAMM0XptQgO0Pq3nqnL3PYRoXjYKH3oAwlBSu3ZBBtO2oJHNjr1/yhHyzTR
        Ro9evNduFQx5766Onqz1cge6OfKHpWrrNUyf27z2QdwkzouW5wVbiXgieQvB81aADtWF
        sWkI6zXQ8rhuWu0iw4P5ODTuA1MCVAoyqrhnDy5LZulEGxaHAfI9drKm6oRxTEsl731R
        ZzEOjkUShZHfITktQdkzYvu6zF023gQWT+qboMMmxb+Yi8jkz/D8XhrcX924GxnoH73R
        ge/w==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8GNcd21/dZ4="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id L09b9cw1QKSMWNy
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 26 Feb 2020 21:28:22 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org,
        fabrizio.castro@bp.renesas.com,
        ramesh.shanmugasundaram@bp.renesas.com, magnus.damm@gmail.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH 00/11] clk: renesas: cpg-mssr: add ignore-unused option
Date:   Wed, 26 Feb 2020 21:28:06 +0100
Message-Id: <1582748897-17374-1-git-send-email-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi!

This series adds the option for declaring clocks as "ignore-unused", i.e. 
clocks that will not be turned on if not used, but also not turned off if
unused. It also enables this option for the RWDT clocks in (almost) all
SoCs.

The point of this is to allow a WDT that has been enabled by the bootloader
to survive these events:

- deferred probing of the WDT device, which can lead the clock driver
  to disable the WDT clock until the WDT is re-probed, giving it a
  blind spot
- probe failure in the WDT driver

There are a number of SoCs that have the RWDT clock already declared as
critical (i.e. turn it on even if it is off _and_ unused). I don't know if
that is because there was no option for ignore-unused before, or if the
behavior of turning the clock on even if neither the bootloader nor anything
in the kernel has asked for it is actually desired. If it's the former,
these SoCs also have to be converted to the new mechanism.

CU
Uli


Ulrich Hecht (11):
  clk: renesas: cpg-mssr: add support for ignore-unused clocks
  clk: renesas: r8a7796: mark RWDT clock as ignore-unused
  clk: renesas: r8a7795: mark RWDT clock as ignore-unused
  clk: renesas: r8a77970: mark RWDT clock as ignore-unused
  clk: renesas: r8a77980: mark RWDT clock as ignore-unused
  clk: renesas: r8a77995: mark RWDT clock as ignore-unused
  clk: renesas: r8a774a1: mark RWDT clock as ignore-unused
  clk: renesas: r8a774b1: mark RWDT clock as ignore-unused
  clk: renesas: r8a774c0: mark RWDT clock as ignore-unused
  clk: renesas: r8a77965: mark RWDT clock as ignore-unused
  clk: renesas: r8a77990: mark RWDT clock as ignore-unused

 drivers/clk/renesas/r8a774a1-cpg-mssr.c | 5 +++++
 drivers/clk/renesas/r8a774b1-cpg-mssr.c | 5 +++++
 drivers/clk/renesas/r8a774c0-cpg-mssr.c | 5 +++++
 drivers/clk/renesas/r8a7795-cpg-mssr.c  | 6 +++++-
 drivers/clk/renesas/r8a7796-cpg-mssr.c  | 6 +++++-
 drivers/clk/renesas/r8a77965-cpg-mssr.c | 5 +++++
 drivers/clk/renesas/r8a77970-cpg-mssr.c | 6 +++++-
 drivers/clk/renesas/r8a77980-cpg-mssr.c | 6 +++++-
 drivers/clk/renesas/r8a77990-cpg-mssr.c | 5 +++++
 drivers/clk/renesas/r8a77995-cpg-mssr.c | 6 +++++-
 drivers/clk/renesas/renesas-cpg-mssr.c  | 7 +++++++
 drivers/clk/renesas/renesas-cpg-mssr.h  | 7 +++++++
 12 files changed, 64 insertions(+), 5 deletions(-)

-- 
2.7.4

