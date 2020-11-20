Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 513F62BACF2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Nov 2020 16:07:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728766AbgKTPHD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Nov 2020 10:07:03 -0500
Received: from www.zeus03.de ([194.117.254.33]:43430 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728762AbgKTPG4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Nov 2020 10:06:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=0cEj12D45/gnrPeg+tP43kdtsVz
        0cBSJpjREvk5JLU0=; b=wlOLLAbY82PPydElgh91wNQI8r78myOnO8O0m1h7/n2
        0sF/Q/molBhKXV0LHg5pqViuhv1bIkzeCkKx9ZnRffEcz2ajBBqcS0z+E9rd5/Nk
        8SOeGpN7hucdQqAwEdWJYKm1FEW224iZVhAnnYZt0tNGKy7RSyLDH1z/KAIKtsSg
        =
Received: (qmail 1520170 invoked from network); 20 Nov 2020 16:06:53 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Nov 2020 16:06:53 +0100
X-UD-Smtp-Session: l3s3148p1@3/jRMYu0EN0gAwDPXwi7AEBAgYxIRHZX
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH RFT v2 0/3] mmc: tmio: honor busy timeouts properly
Date:   Fri, 20 Nov 2020 16:06:44 +0100
Message-Id: <20201120150647.123237-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

(I fixed the typo in patch 1 and retested again. Sorry for the noise!)

TMIO has a HW busy timeout detection which was always running but the
driver did not handle it yet in a proper way. This series fixes that.

Patch 1 sets max_busy_timeout, so the MMC core will not use R1B when it
is beyond the maximum HW timeout. Patch 2 adds proper handling of the
timeout interrupt. After ensuring both, we can finally enable the
WAIT_WHILE_BUSY capability to save the polling.

This was tested using my Renesas Salvator-XS (R-Car M3-N) and Lager
(R-Car H2). However, more advanced testing from the BSP team and/or
Shimoda-san would be much appreciated.

The branch is based on mmc/next plus one patch "[PATCH RFT v2] mmc: tmio: Fix
command error processing". A branch is available here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/sdhi/busy_timeout

Yamada-san: I enabled setting max_busy_timeout for Uniphier as well
because I am quite sure this HW supports it and it will fix timeout
issues with long erase timeouts. I did not enable WAIT_WHILE_BUSY
because this is "only" an improvement and not a fix. I think opt-in
after some testing is good for that case.

I think all patches are 5.11 material to get enough testing. Patch 1
is IMHO stable material, nonetheless. I am open for discussions, of
course.

Looking forward to comments, reviews, tags...

Thanks and happy hacking,

   Wolfram


Masaharu Hayakawa (1):
  mmc: tmio: Add data timeout error detection

Wolfram Sang (2):
  mmc: tmio: set max_busy_timeout
  mmc: renesas_sdhi: enable WAIT_WHILE_BUSY

 drivers/mmc/host/renesas_sdhi_core.c          |  3 ++
 drivers/mmc/host/renesas_sdhi_internal_dmac.c |  4 +--
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      |  7 ++--
 drivers/mmc/host/tmio_mmc.h                   |  8 +++--
 drivers/mmc/host/tmio_mmc_core.c              | 32 +++++++++++++++----
 drivers/mmc/host/uniphier-sd.c                |  1 +
 include/linux/mfd/tmio.h                      |  7 +++-
 7 files changed, 48 insertions(+), 14 deletions(-)

-- 
2.28.0

