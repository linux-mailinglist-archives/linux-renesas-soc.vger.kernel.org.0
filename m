Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B954F1CE087
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2020 18:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730563AbgEKQeM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 May 2020 12:34:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728556AbgEKQeL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 May 2020 12:34:11 -0400
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5300::12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 431C5C061A0C
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2020 09:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1589214848;
        s=strato-dkim-0002; d=fpond.eu;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=hZvklQ/9RCEFWzFLf/nnPQI2XGak1GOKFPEA1gsoooI=;
        b=XIrn1X62J4xzImhGtM7MSb4NTGqO5+pbqvspqIVpG2wY2FZUXumDfd92TZ64CVhpVz
        jLcWKOMR/f5+bhBWZogUhw98NyFvzJrSjlF53Y2/qd1tEOtaTtVR/bzeOELpwQLY7KQi
        giIPXgJ1NhwTXcu6wIKvyuQuWbFZ6NQ8lugE9S9NtQ66YOMloDKvT5dWqKhjun5pvNCO
        4YWztSqF7giUnhTKIzsr+3Tch60gMF85QEHG8sQjJbMTMW7x7uUAWkF3TXS0r4Z3Z2Mr
        STRTYNvv/JZHMmAYfdXy+g312XoV+xMUKB0Rj6PFaRuNMPr7B2rpLwYEJyBVn/IUU+uZ
        fQcA==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR92REa5ElWg=="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
        with ESMTPSA id Z0acdaw4BGY5DFp
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Mon, 11 May 2020 18:34:05 +0200 (CEST)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, magnus.damm@gmail.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v3 0/3] clk: renesas: cpg-mssr: add never-disable option
Date:   Mon, 11 May 2020 18:33:55 +0200
Message-Id: <1589214838-18075-1-git-send-email-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi!

This revision should work more reliably as it keeps the never-disable
handling in the clock driver instead of relying on the semantics of
CLK_IGNORE_UNUSED, which still allows clocks to be turned off for power
management.

This series adds the option for declaring clocks as "never-disable", i.e. 
clocks that will not be turned on if not used, but also not turned off if
unused. It also enables this option for the RWDT clocks in (almost) all
SoCs.

The point of this is to allow a WDT that has been enabled by the bootloader
to survive these events:

- deferred probing of the WDT device, which can lead the clock driver
  to disable the WDT clock until the WDT is re-probed, giving it a
  blind spot
- probe failure in the WDT driver

There are a number of Gen2 and RZ/G1 SoCs that have the RWDT clock declared
as critical in order to allow SMP bringup code to work. These have been
left as they are.

CU
Uli


Changes since v2:
- use the term "never-disable" instead of "ignore-unused"
- do the handling internally instead of relying on the behavior of
  CLK_IGNORE_UNUSED

Changes since v1:
- rename data structures for clarity
- squash SoC-specific patches into one per family


Ulrich Hecht (3):
  clk: renesas: cpg-mssr: add support for never-disable clocks
  clk: renesas: rcar-gen3: mark RWDT clocks as never-disable
  clk: renesas: rzg2: mark RWDT clock as never-disable

 drivers/clk/renesas/r8a774a1-cpg-mssr.c |  5 +++++
 drivers/clk/renesas/r8a774b1-cpg-mssr.c |  5 +++++
 drivers/clk/renesas/r8a774c0-cpg-mssr.c |  5 +++++
 drivers/clk/renesas/r8a7795-cpg-mssr.c  |  6 +++++-
 drivers/clk/renesas/r8a7796-cpg-mssr.c  |  6 +++++-
 drivers/clk/renesas/r8a77965-cpg-mssr.c |  5 +++++
 drivers/clk/renesas/r8a77970-cpg-mssr.c |  6 +++++-
 drivers/clk/renesas/r8a77980-cpg-mssr.c |  6 +++++-
 drivers/clk/renesas/r8a77990-cpg-mssr.c |  5 +++++
 drivers/clk/renesas/r8a77995-cpg-mssr.c |  6 +++++-
 drivers/clk/renesas/renesas-cpg-mssr.c  | 10 ++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.h  |  9 +++++++++
 12 files changed, 69 insertions(+), 5 deletions(-)

-- 
2.7.4

