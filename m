Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDB751EE425
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jun 2020 14:07:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728162AbgFDMHF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Jun 2020 08:07:05 -0400
Received: from www.zeus03.de ([194.117.254.33]:45456 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728583AbgFDMGu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Jun 2020 08:06:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=DbFMoiJ0z7pRaNu9XXMvTlC2NJz
        sQjw/AIsDmirtsXs=; b=ofSxs4geCvRUnIVg9E4Cyjn4zQach7vAht3f1lnCm56
        mhALuEDNAq3k/qrLlqEnCrK0TDH5RHVlOPjM+blXxL2vO1mr0Sw6BfG8Tvnh8fKF
        BqcSsHVGhTnXJx1LSwJ9hImTp5rKTKhZ+kMij4UwgJjgzIHaX6iRNvwOxGMfLWsw
        =
Received: (qmail 1676192 invoked from network); 4 Jun 2020 14:06:47 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Jun 2020 14:06:47 +0200
X-UD-Smtp-Session: l3s3148p1@AOqW+kCn0uUgAwDPXw1XANux7yWtmp4Z
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH v3 0/2] mmc: renesas_sdhi: support manual calibration
Date:   Thu,  4 Jun 2020 14:06:31 +0200
Message-Id: <20200604120633.22795-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Some R-Car Gen3 SoCs need corrections after they tuned to HS400. This
series implements that. Please have a look at the patch descriptions for
details. The origins were patches in the BSP from Takeshi Saito.

Changes for RFC v3:

* rebased to the latest BSP patches which now use tables instead of
  computed values for the correction values
* other refactoring because of the above
* MMC0 instance is hardcoded now because it is located at the same
  address on all Gen3 SoCs
* except for the TMPPORT accessors, it is basically a new patch

There is a branch for testing here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/sdhi-manual-calib

What is missing here is more testing on more boards. I post it already
for review comments. And because it is needed to trigger a stalled SCC
condition which is fixed by a patchset I just sent out.

Thanks and happy hacking,

   Wolfram


Wolfram Sang (2):
  mmc: tmio: add generic hook to fixup after a completed request
  mmc: renesas_sdhi: support manual calibration

 drivers/mmc/host/renesas_sdhi.h      |   5 +
 drivers/mmc/host/renesas_sdhi_core.c | 152 ++++++++++++++++++++++++++-
 drivers/mmc/host/tmio_mmc.h          |   1 +
 drivers/mmc/host/tmio_mmc_core.c     |   3 +
 4 files changed, 159 insertions(+), 2 deletions(-)

-- 
2.20.1

