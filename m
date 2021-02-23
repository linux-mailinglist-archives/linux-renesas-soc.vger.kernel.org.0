Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C828B3228A0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Feb 2021 11:11:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232464AbhBWKKu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Feb 2021 05:10:50 -0500
Received: from www.zeus03.de ([194.117.254.33]:49234 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232284AbhBWKJ3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Feb 2021 05:09:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=X0uHiRhrChptj3xmbp7NflwH9t0
        PQOAemyJn9uqKQBk=; b=vbW0fXHjnRJBj1HDu4OojKh1d1j7laMMaDYs/CGUwSb
        pyf6NfAEGkiwxK/6z53gtcLespnS8nkgs48TkPaCNNK/9NS/mCzml8Ur2VqIZyjN
        owtnAduO9qRtZumDvDongNf/cPEA431oCk4wP7n5tLpNPSK4dq+FFh7qrsk7HZfM
        =
Received: (qmail 2594313 invoked from network); 23 Feb 2021 11:08:38 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Feb 2021 11:08:38 +0100
X-UD-Smtp-Session: l3s3148p1@f4n1Gf67IoMgARa4RdeBASWYxunz7zkl
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/2] mmc: tmio/sdhi: add support for custom MASK_ALL
Date:   Tue, 23 Feb 2021 11:08:28 +0100
Message-Id: <20210223100830.25125-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Here is a small series to ensure SDHI Gen2+ will use its custom MASK_ALL
value all the time.

Please let me know what you think.

Happy hacking,

   Wolfram


Wolfram Sang (2):
  mmc: tmio: support custom irq masks
  mmc: renesas_sdhi: use custom mask for TMIO_MASK_ALL

 drivers/mmc/host/renesas_sdhi_core.c | 3 ++-
 drivers/mmc/host/tmio_mmc.h          | 3 ++-
 drivers/mmc/host/tmio_mmc_core.c     | 8 +++++---
 3 files changed, 9 insertions(+), 5 deletions(-)

-- 
2.30.0

