Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0E5133BF3F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Mar 2021 16:01:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233208AbhCOPAB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Mar 2021 11:00:01 -0400
Received: from www.zeus03.de ([194.117.254.33]:47498 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232148AbhCOO7m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Mar 2021 10:59:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version:content-type
        :content-transfer-encoding; s=k1; bh=y91h0IZWsPK0uPbTBAGrW3gUb8M
        gsss0dRGTUdTAbB0=; b=VVN24Sf8zwfuPAz6EIB1YcuszasJAfUkAs4BsvBR1yR
        99cyLCkvsjyM61Ia0jrUIwg+bH8NaHLcqbBOGSdOP9tdR6v96sh41jJrc+LUrZql
        NyHv/Drmkh9IeGDoKCumK6+knDBq4rbuq3ik5gFSi6LHJN/h/7tWtOIF5h1Vt7qM
        =
Received: (qmail 1439212 invoked from network); 15 Mar 2021 15:59:39 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Mar 2021 15:59:39 +0100
X-UD-Smtp-Session: l3s3148p1@2HvAf5S9CosgARa4RYTzARykWRFxRPkz
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 0/3] mmc: renesas_sdhi: reset via reset controller
Date:   Mon, 15 Mar 2021 15:59:35 +0100
Message-Id: <20210315145938.58565-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This series enables SDHI to be reset via a reset controller.
Please let me know about your (and BSP team's) thoughts.
The series is based on mmc/next and tested on Salvator-XS with R-Car H3
ES2.0 with what I think I can do locally here.

Changes since v1:
* Niklas tag added to patch 1 (thanks!)
* new patch 2 to factor out SCC reset and make intentions clearer
  (thanks to Shimoda-san for the review!)
* patch 3 re-inits now the SD clock again after the hard reset

Wolfram Sang (3):
  mmc: tmio: abort DMA before reset
  mmc: renesas_sdhi: break SCC reset into own function
  mmc: renesas_sdhi: do hard reset if possible

 drivers/mmc/host/Kconfig             |  1 +
 drivers/mmc/host/renesas_sdhi.h      |  2 ++
 drivers/mmc/host/renesas_sdhi_core.c | 35 +++++++++++++++++++++-------
 drivers/mmc/host/tmio_mmc_core.c     |  4 ++--
 4 files changed, 32 insertions(+), 10 deletions(-)

-- 
2.30.0

