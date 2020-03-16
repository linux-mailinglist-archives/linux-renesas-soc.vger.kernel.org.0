Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3E13187017
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2020 17:35:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731924AbgCPQfA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Mar 2020 12:35:00 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.20]:16498 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732065AbgCPQfA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Mar 2020 12:35:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1584376495;
        s=strato-dkim-0002; d=fpond.eu;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=RRm6EYInxqm4NGcc6o+pz84OE/U0IUOVNTA5o8FP6w8=;
        b=TRy6N7rBiije6Hlc8t2U7piWWxaZJ72B1mpQcOmSjeq6ctjuaaPvtpd+C6DgU+JwKR
        Pe/2WQbDKU3uFZ9eq02NyHs9Dv4cVxfa9X/JpxvFHFZ1YuVDS4TY2cqfkNdvtZ68uwXn
        XM/JnqmY+ivuAWEB5Bwz/khFqcDoJP2fb61GjYCBD8t+jRT8aQSwhlNkuxdODappvoST
        oju8+A7sG1/HhIuBfgcHrDvExpx116x1dk+RRQ6K1ATA1nHVduNbMeePvWlmWCTcBlK0
        kfsIQXAouNrZNgkVh8jVg/0YHNa9We73HmIGbhkAsnt365Gp3yycLj6e3sdr921BhXe8
        lSTw==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR82RYdxOjioM="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
        with ESMTPSA id d00eabw2GGYiDtH
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Mon, 16 Mar 2020 17:34:44 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org,
        fabrizio.castro@bp.renesas.com,
        ramesh.shanmugasundaram@bp.renesas.com, magnus.damm@gmail.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v2 0/3] clk: renesas: cpg-mssr: add ignore-unused option
Date:   Mon, 16 Mar 2020 17:34:36 +0100
Message-Id: <1584376479-25258-1-git-send-email-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi!

This revision renames the data structure holding the ignore-unused clocks to
something hopefully less confusing, squashes the changes for R-Car Gen3 and
RZ/G2 into one patch each and removes redundant debug output. Functionally,
nothing has changed. Thanks to Wolfram and Geert for the review!

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

There are a number of Gen2 and RZ/G1 SoCs that have the RWDT clock declared
as critical in order to allow SMP bringup code to work. These have been
left as they are.

CU
Uli


Ulrich Hecht (3):
  clk: renesas: cpg-mssr: add support for ignore-unused clocks
  clk: renesas: rcar-gen3: mark RWDT clocks as ignore-unused
  clk: renesas: rzg2: mark RWDT clock as ignore-unused

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
 drivers/clk/renesas/renesas-cpg-mssr.c  | 5 +++++
 drivers/clk/renesas/renesas-cpg-mssr.h  | 9 +++++++++
 12 files changed, 64 insertions(+), 5 deletions(-)

-- 
2.7.4

