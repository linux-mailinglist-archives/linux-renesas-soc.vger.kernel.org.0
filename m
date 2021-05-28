Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55BF0394105
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 May 2021 12:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236486AbhE1Khd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 May 2021 06:37:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236509AbhE1Kha (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 May 2021 06:37:30 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3C7BC06138D
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 May 2021 03:35:55 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:751e:82a3:f2a2:3459])
        by baptiste.telenet-ops.be with bizsmtp
        id AAbs2500Y20MPSF01AbsAe; Fri, 28 May 2021 12:35:53 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lmZqK-00AD9W-Ft; Fri, 28 May 2021 12:35:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lmXtT-007G67-Sp; Fri, 28 May 2021 10:30:59 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/2] Renesas ARM defconfig updates for v5.14
Date:   Fri, 28 May 2021 10:30:49 +0200
Message-Id: <cover.1622188834.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1622188833.git.geert+renesas@glider.be>
References: <cover.1622188833.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v5.14-tag1

for you to fetch changes up to 9558487e7d976c1b92b2bc66fb4d901b1d35437f:

  arm64: defconfig: Enable usb2_clksel for R-Car Gen3 and RZ/G2 (2021-05-25 10:04:39 +0200)

----------------------------------------------------------------
Renesas ARM defconfig updates for v5.14

  - Refresh shmobile_defconfig for v5.13-rc1
  - Enable R-Car USB2 clock selector support

----------------------------------------------------------------
Adam Ford (1):
      arm64: defconfig: Enable usb2_clksel for R-Car Gen3 and RZ/G2

Geert Uytterhoeven (1):
      ARM: shmobile: defconfig: Refresh for v5.13-rc1

 arch/arm/configs/shmobile_defconfig | 1 -
 arch/arm64/configs/defconfig        | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)
