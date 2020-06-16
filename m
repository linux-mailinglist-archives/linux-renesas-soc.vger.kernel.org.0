Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34EEF1FBBA5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2020 18:27:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729957AbgFPQ0n (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Jun 2020 12:26:43 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.20]:34157 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729386AbgFPQ0l (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Jun 2020 12:26:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1592324798;
        s=strato-dkim-0002; d=fpond.eu;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=FmE7e/I76oFWjpwU42EMD8UxbMc1b3P7Wn4az0pRclA=;
        b=gnef0ImJvc3dV+FcTiLcOkM+9aKtcW7Ioaw5YeJ7qrgzMlIXyWfXqJh62jUMNRtLMO
        nJWUgTztfdvAsHgESO44TeGhCXgcL6RVSDp0lypp6nUDLrI1rUeRd4QdhguJvEr71zSC
        A47AcboO1iaP0aplKrlVzdKlA80tVvckXKHkceTEmHJ6t3lfRxW+6ug26AfOUXBsGDmE
        7LIZDXxlFgmTh3nd38XWJ+Jg2EhiLcztO+4XI5IGoB2IsVzBSztG526Ia7kX1ZjD3I83
        itABRtA6J/UdfB/SZ+faAEvYx28WWSTsSlQ6vzGZvXKvpXrpC3hiO/rXZTjwdQwgcgA4
        qYTw==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8WdEaEuFwQ=="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 46.10.4 DYNA|AUTH)
        with ESMTPSA id a0ab6bw5GGQZFwQ
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 16 Jun 2020 18:26:35 +0200 (CEST)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-clk@vger.kernel.org, wsa@the-dreams.de, geert@linux-m68k.org,
        magnus.damm@gmail.com, Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v4 0/3] clk: renesas: cpg-mssr: add RWDT to critical clocks
Date:   Tue, 16 Jun 2020 18:26:23 +0200
Message-Id: <20200616162626.27944-1-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

(was: "clk: renesas: cpg-mssr: add never-disable option")

Hi!

The purpose of this series is to allow a WDT that has been enabled by the
bootloader to survive these events:

- deferred probing of the WDT device, which can lead the clock driver
  to disable the WDT clock until the WDT is re-probed, giving it a
  blind spot
- probe failure in the WDT driver

Following a suggestion by Geert, this revision, instead of adding another
list of clocks with special handling, changes the semantics of the
crit_mod_clks[] array slightly by only marking clocks critical that are
enabled at boot time. That way it can be used for RWDT without forcing the
clock on unnecessarily.

The other existing user of crit_mod_clks[] (INTC-AP) is always on at boot time
and should thus not be affected by this change.

There are a number of Gen2 and RZ/G1 SoCs that have the RWDT clock declared
as critical already in order to allow SMP bringup code to work. That should
still work with this series applied, assuming that the WDT clock is on at
boot time.

CU
Uli


Changes since v3:
- drop separate array, add RWDT to crit_mod_clks[]
- only mark clocks as critical if they are enabled on boot

Changes since v2:
- use the term "never-disable" instead of "ignore-unused"
- do the handling internally instead of relying on the behavior of
  CLK_IGNORE_UNUSED

Changes since v1:
- rename data structures for clarity
- squash SoC-specific patches into one per family


Ulrich Hecht (3):
  clk: renesas: cpg-mssr: mark clocks as critical only if on at boot
  clk: renesas: rcar-gen3: mark RWDT clocks as critical
  clk: renesas: rzg2: mark RWDT clock as critical

 drivers/clk/renesas/r8a774a1-cpg-mssr.c |  1 +
 drivers/clk/renesas/r8a774b1-cpg-mssr.c |  1 +
 drivers/clk/renesas/r8a774c0-cpg-mssr.c |  1 +
 drivers/clk/renesas/r8a7795-cpg-mssr.c  |  2 +-
 drivers/clk/renesas/r8a7796-cpg-mssr.c  |  2 +-
 drivers/clk/renesas/r8a77965-cpg-mssr.c |  1 +
 drivers/clk/renesas/r8a77970-cpg-mssr.c |  2 +-
 drivers/clk/renesas/r8a77980-cpg-mssr.c |  2 +-
 drivers/clk/renesas/r8a77990-cpg-mssr.c |  1 +
 drivers/clk/renesas/r8a77995-cpg-mssr.c |  2 +-
 drivers/clk/renesas/renesas-cpg-mssr.c  | 17 +++++++++--------
 11 files changed, 19 insertions(+), 13 deletions(-)

-- 
2.20.1

