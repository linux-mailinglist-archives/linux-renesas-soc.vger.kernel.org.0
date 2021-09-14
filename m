Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C81640B6BF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Sep 2021 20:21:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232024AbhINSWQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Sep 2021 14:22:16 -0400
Received: from www.zeus03.de ([194.117.254.33]:56698 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231877AbhINSV5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Sep 2021 14:21:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=3c7mX5ionLNREfObThAMqjn6+P8
        hA74BV4tKmmabYlI=; b=CrSrx5d6xyixJBFYnOAGyRWZ/83jNrsZSPm9N7kMi/g
        gG75jB3xVPt3lNgbxF1nO7dRE8pxx2LbPcxQ5APHYwZB3QjDmbqGHw4om33ZJlII
        PYXNA6+s0Aum+2QEFc7e5ojX8xKFwX3kgLDOC7gu29n7qs3wjNP9v2vG0xdSn1R4
        =
Received: (qmail 518116 invoked from network); 14 Sep 2021 20:20:34 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Sep 2021 20:20:34 +0200
X-UD-Smtp-Session: l3s3148p1@Ddu/ovjLHpEgAwDPXxMyACCkRmvQydX8
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/3] mmc: also abort tuning with CMD12 for SD
Date:   Tue, 14 Sep 2021 20:20:20 +0200
Message-Id: <20210914182023.8103-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

After my hackish RFC patch, here is a small series implementing
(hopefully) the solution we discussed. It will make
mmc_send_abort_tuning() also send CMD12 for SD cards which makes more SD
cards work for us. Details are in the patch descriptions.

Please let me know what you think.

Thanks, and happy hacking!


Wolfram Sang (3):
  mmc: core: add helper to send STOP
  mmc: core: also abort tuning with CMD12 for SD
  mmc: core: remove obsolete parameter from mmc_send_abort_tuning

 drivers/mmc/core/block.c             | 14 +-------------
 drivers/mmc/core/core.h              |  1 +
 drivers/mmc/core/mmc.c               |  6 ++++++
 drivers/mmc/core/mmc_ops.c           | 23 ++++-------------------
 drivers/mmc/core/mmc_ops.h           | 14 ++++++++++++++
 drivers/mmc/core/sd.c                |  6 ++++++
 drivers/mmc/host/renesas_sdhi_core.c |  2 +-
 drivers/mmc/host/sdhci.c             |  2 +-
 include/linux/mmc/host.h             |  2 +-
 9 files changed, 35 insertions(+), 35 deletions(-)

-- 
2.30.2

