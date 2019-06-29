Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 428AD5AD3E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Jun 2019 21:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726960AbfF2T42 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 29 Jun 2019 15:56:28 -0400
Received: from sauhun.de ([88.99.104.3]:36158 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726891AbfF2T41 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 29 Jun 2019 15:56:27 -0400
Received: from localhost (p5486CA23.dip0.t-ipconnect.de [84.134.202.35])
        by pokefinder.org (Postfix) with ESMTPSA id 21F312C047A;
        Sat, 29 Jun 2019 21:56:23 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 RFT 0/4] mmc: renesas_sdhi: support manual calibration
Date:   Sat, 29 Jun 2019 21:54:39 +0200
Message-Id: <20190629195443.366-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

For those who read the text already, I'll put the changes since v1 here:

* check 'quirk' pointer before using it in patch 3
* fixed a bug in the verification debug patch (not visible in this series)
* tested on more boards

Old cover-letter follows:


Some R-Car Gen3 SoCs need corrections after they tuned to HS400. This
series implements that. Please have a look at the patch descriptions for
details.

The origins were patches in the BSP from Takeshi Saito. However, this
series is heavily refactored:

* DT configuration was dropped, there is no user for it
* the fixup offset is currently hardcoded because all affected SoCs use
  the same offset. We can add it later to the struct quirks if needed
* disabling HS400 for some SoCs was already upstreamed
* the callback in the TMIO was made more generic to allow other use
  cases in the future
* less impact on the TMIO driver by stricter seperation of the SDHI parts
* clearing the runtime flag in the error case was moved from
  select_tuning to hw_reset to catch all error cases
* cosmetic fixups

There is a branch for testing here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/sdhi-manual-calib

Tested with a Renesas R-Car M3-N (needs this new quirk), H3 ES2.0
(doesn't need this new but older quirks), and H2 (needs no quirk).

The patches were developed against mmc/next. However, the above branch
is based on v5.2-rc6 with some cherry-picked patches from mmc/next, so
Geert can consume it easier for his renesas-drivers branch. There are
two more patches in that branch worth mentioning. A clk driver WIP patch
which I needed to get HS400 on my M3-N working at all. We are discussing
this patch internally right now and its upstreaming is a seperate issue.

Also, there is a debug patch on top. I can't test that the manual fixup
values improve HS400 because the actual issue only shows with
temperatures I can't (and don't want to) provide here in my office.
So, the debug patches add some trace_printk to demonstrate the functions
are called and the outputs match the intended state machine.

Here are examples (with comments) from my M3-N. If you review this,
please don't trust anything I write here.

An unaffected SDHI instance (no eMMC):

Adjustment and runtime flag get disabled during the reset in the
beginning of the initialization. The same reset routine will be called
when tuning fails.

kworker/0:2-965   [000] ....     1.413767: renesas_sdhi_reset_hs400_mode: ee100000.sd: adjustment disabled
kworker/0:2-965   [000] ....     1.413768: renesas_sdhi_hw_reset: ee100000.sd: reset! flag disabled


An SDHI instance with a HS400 capable eMMC connected:

When preparing HS400 tuning, (potential) old HS400 tuning gets reset and
the manual adjustment gets disabled, the runtime flag (signalling new
manual adjustment will be needed) is set:

kworker/0:1H-1009  [000] ....     1.864628: renesas_sdhi_reset_hs400_mode: ee140000.sd: adjustment disabled
kworker/0:1H-1009  [000] ....     1.864629: renesas_sdhi_prepare_hs400_tuning: ee140000.sd: flag enabled

Lots of tuning CMDs:

kworker/0:2-965   [000] ....     1.864673: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
kworker/0:2-965   [000] ....     1.864706: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
kworker/0:2-965   [000] ....     1.864735: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
kworker/0:2-965   [000] ....     1.864765: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
kworker/0:2-965   [000] ....     1.864797: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
kworker/0:2-965   [000] ....     1.864825: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
kworker/0:2-965   [000] ....     1.864855: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
kworker/0:2-965   [000] ....     1.864882: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
kworker/0:2-965   [000] ....     1.864909: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
kworker/0:2-965   [000] ....     1.864935: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
kworker/0:2-965   [000] ....     1.864966: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
kworker/0:2-965   [000] ....     1.864998: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
kworker/0:2-965   [000] ....     1.865025: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
kworker/0:2-965   [000] ....     1.865052: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
kworker/0:2-965   [000] ....     1.865079: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
kworker/0:2-965   [000] ....     1.865106: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
kworker/0:2-965   [000] ....     1.865130: renesas_sdhi_fixup_request: ee140000.sd: opcode 6, flag 1
kworker/0:2-965   [000] ....     1.865603: renesas_sdhi_fixup_request: ee140000.sd: opcode 13, flag 1

First CMD13 after tuning discovered, enable adjustment, clear runtime
flag:

kworker/0:2-965   [000] ....     1.865609: renesas_sdhi_fixup_request: ee140000.sd: adjustment enabled, flag disabled
kworker/0:2-965   [000] ....     1.865635: renesas_sdhi_fixup_request: ee140000.sd: opcode 6, flag 0
kworker/0:2-965   [000] ....     1.865654: renesas_sdhi_fixup_request: ee140000.sd: opcode 13, flag 0
kworker/0:2-965   [000] ....     1.865676: renesas_sdhi_fixup_request: ee140000.sd: opcode 6, flag 0
kworker/0:2-965   [000] ....     1.866143: renesas_sdhi_fixup_request: ee140000.sd: opcode 13, flag 0
kworker/0:2-965   [000] ....     1.866601: renesas_sdhi_fixup_request: ee140000.sd: opcode 18, flag 0

Reading multiple blocks (CMD18) above failed

kworker/0:2-965   [000] ....     1.866867: renesas_sdhi_fixup_request: ee140000.sd: opcode 6, flag 0
kworker/0:2-965   [000] ....     1.867113: renesas_sdhi_fixup_request: ee140000.sd: opcode 13, flag 0
kworker/0:2-965   [000] ....     1.867137: renesas_sdhi_fixup_request: ee140000.sd: opcode 6, flag 0
kworker/0:2-965   [000] ....     1.867384: renesas_sdhi_fixup_request: ee140000.sd: opcode 13, flag 0
kworker/0:2-965   [000] ....     1.867409: renesas_sdhi_fixup_request: ee140000.sd: opcode 6, flag 0
kworker/0:2-965   [000] ....     1.867651: renesas_sdhi_fixup_request: ee140000.sd: opcode 13, flag 0

Seems like another retune is need, start cycle again:

kworker/0:1H-1009  [000] ....     1.867880: renesas_sdhi_reset_hs400_mode: ee140000.sd: adjustment disabled
kworker/0:1H-1009  [000] ....     1.867882: renesas_sdhi_prepare_hs400_tuning: ee140000.sd: flag enabled
kworker/0:2-965   [000] ....     1.867926: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
kworker/0:2-965   [000] ....     1.867958: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
kworker/0:2-965   [000] ....     1.867986: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
kworker/0:2-965   [000] ....     1.868019: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
kworker/0:2-965   [000] ....     1.868048: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
kworker/0:2-965   [000] ....     1.868076: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
kworker/0:2-965   [000] ....     1.868103: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
kworker/0:2-965   [000] ....     1.868129: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
kworker/0:2-965   [000] ....     1.868156: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
kworker/0:2-965   [000] ....     1.868181: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
kworker/0:2-965   [000] ....     1.868208: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
kworker/0:2-965   [000] ....     1.868237: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
kworker/0:2-965   [000] ....     1.868267: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
kworker/0:2-965   [000] ....     1.868294: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
kworker/0:2-965   [000] ....     1.868321: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
kworker/0:2-965   [000] ....     1.868347: renesas_sdhi_fixup_request: ee140000.sd: opcode 21, flag 1
kworker/0:2-965   [000] ....     1.868370: renesas_sdhi_fixup_request: ee140000.sd: opcode 6, flag 1
kworker/0:2-965   [000] ....     1.868837: renesas_sdhi_fixup_request: ee140000.sd: opcode 13, flag 1
kworker/0:2-965   [000] ....     1.868842: renesas_sdhi_fixup_request: ee140000.sd: adjustment enabled, flag disabled
kworker/0:2-965   [000] ....     1.868869: renesas_sdhi_fixup_request: ee140000.sd: opcode 6, flag 0
kworker/0:2-965   [000] ....     1.868888: renesas_sdhi_fixup_request: ee140000.sd: opcode 13, flag 0
kworker/0:2-965   [000] ....     1.868913: renesas_sdhi_fixup_request: ee140000.sd: opcode 6, flag 0
kworker/0:2-965   [000] ....     1.869381: renesas_sdhi_fixup_request: ee140000.sd: opcode 13, flag 0

Finally, we can read lots of blocks without problems. The manual
adjustment is still enabled as desired:

kworker/0:2-965   [000] ....     1.870027: renesas_sdhi_fixup_request: ee140000.sd: opcode 18, flag 0
kworker/0:2-965   [000] ....     1.871300: renesas_sdhi_fixup_request: ee140000.sd: opcode 18, flag 0
kworker/0:2-965   [000] ....     1.871454: renesas_sdhi_fixup_request: ee140000.sd: opcode 18, flag 0
kworker/0:2-965   [000] ....     1.871579: renesas_sdhi_fixup_request: ee140000.sd: opcode 18, flag 0
kworker/0:2-965   [000] ....     1.871712: renesas_sdhi_fixup_request: ee140000.sd: opcode 18, flag 0
...


Okay, I know this is a lot of text, but it is a subtle issue, so I
wanted to provide the details which enable other people to actually
review what I have done.

Shimoda-san, if the BSP team could have a look and share their opinion
or could test, I'd be most grateful.

Thanks and happy hacking,

   Wolfram


Wolfram Sang (4):
  mmc: renesas_sdhi: keep sorting
  mmc: tmio: add generic hook to fixup after a completed request
  mmc: renesas_sdhi: make quirks info accessible outside probe()
  mmc: renesas_sdhi: support manual calibration

 drivers/mmc/host/renesas_sdhi.h      |   9 ++
 drivers/mmc/host/renesas_sdhi_core.c | 129 +++++++++++++++++++++++++--
 drivers/mmc/host/tmio_mmc.h          |   1 +
 drivers/mmc/host/tmio_mmc_core.c     |   3 +
 4 files changed, 135 insertions(+), 7 deletions(-)

-- 
2.20.1

