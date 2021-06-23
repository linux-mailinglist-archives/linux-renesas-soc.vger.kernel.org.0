Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E47313B1759
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 11:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230321AbhFWJ7z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 05:59:55 -0400
Received: from www.zeus03.de ([194.117.254.33]:49992 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230087AbhFWJ7y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 05:59:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=02UNocivhtrF2+BH+l95xHvH0H6
        H0HOTl8Xq8QQAay0=; b=veJTUSdUIqJlnqRDAVLu+W5Jt9Zr1Sji7ctdHKHL89t
        3rWAo0Ffhg+Xj3DYxgKyLqHA/8qtYy6e6W257buJL9nIMbR352cgGX2iXGNKu/HB
        NekjcQNZlgMYrsvtq5ypLZ7kNO6WqvcIC2kcCLoNw1kMQXKEMaw7AckjtzL/igfE
        =
Received: (qmail 2550951 invoked from network); 23 Jun 2021 11:57:34 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Jun 2021 11:57:34 +0200
X-UD-Smtp-Session: l3s3148p1@u1SH72vFAKogARa4RfhaAavnjlTTqzSz
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-arm-kernel@axis.com, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] mmc: use proper DMAENGINE API for termination
Date:   Wed, 23 Jun 2021 11:57:30 +0200
Message-Id: <20210623095734.3046-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

dmaengine_terminate_all() is deprecated in favor of explicitly saying if
it should be sync or async. Update the drivers I audited.


Wolfram Sang (3):
  mmc: renesas_sdhi_sys_dmac: : use proper DMAENGINE API for termination
  mmc: sh_mmcif: : use proper DMAENGINE API for termination
  mmc: usdhi6rol0: : use proper DMAENGINE API for termination

 drivers/mmc/host/renesas_sdhi_sys_dmac.c | 4 ++--
 drivers/mmc/host/sh_mmcif.c              | 4 ++--
 drivers/mmc/host/usdhi6rol0.c            | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.30.2

