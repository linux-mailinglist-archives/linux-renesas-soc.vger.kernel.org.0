Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96F3F2AEE5B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Nov 2020 11:02:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbgKKKCz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Nov 2020 05:02:55 -0500
Received: from www.zeus03.de ([194.117.254.33]:47524 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725995AbgKKKCy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Nov 2020 05:02:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=gJhuVf2u77p9axHBPzGy+D8eEIE
        +mlfeZyceOt0HfX0=; b=GzH8Nq+7CZAD5BnKMFll9IZ8haH+Eycug21ORR+JxdQ
        ZF1E/KXL16x0TBcZ/68EfOP3HtPe5SxYV4HwiG049KuckfwzbCvWeyhi9S5IrxJC
        fvlPxHiARjPEUBnEDoQRTSXLgXFE8zGOoYzDJ3VFRbIbbG3gmp1TGmUDs6jObztw
        =
Received: (qmail 2440279 invoked from network); 11 Nov 2020 11:02:51 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Nov 2020 11:02:51 +0100
X-UD-Smtp-Session: l3s3148p1@auz15dGzVJMgAwDPXwjxAOzndPPvnXZD
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/3] mmc: renesas_sdhi: generic cleanups
Date:   Wed, 11 Nov 2020 11:02:41 +0100
Message-Id: <20201111100244.15823-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Here are a few patches fixing cosmetic issues which always annoyed me
when working on this driver. Patches #1+#2 improve naming and remove
hardcoded values. Patch #3 sorts the defines. The object files were
identical here before and after the patchset, as expected.

The patches depend on the series "[PATCH 0/3] mmc: renesas_sdhi:
refactor SCC reset" and are part of this branch:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/sdhi/tap_en_v2

Hope you'll like it,

   Wolfram


Wolfram Sang (3):
  mmc: renesas_sdhi: improve HOST_MODE usage
  mmc: renesas_sdhi: don't hardcode SDIF values
  mmc: renesas_sdhi: sort includes

 drivers/mmc/host/renesas_sdhi_core.c | 49 +++++++++++++++++-----------
 drivers/mmc/host/tmio_mmc.h          |  1 -
 2 files changed, 30 insertions(+), 20 deletions(-)

-- 
2.28.0

