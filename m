Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5BC93A3F70
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Jun 2021 11:47:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231651AbhFKJtV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Jun 2021 05:49:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231361AbhFKJtP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jun 2021 05:49:15 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BB5FC0613A2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Jun 2021 02:47:17 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:2411:a261:8fe2:b47f])
        by xavier.telenet-ops.be with bizsmtp
        id FlnD2500N25eH3q01lnDK4; Fri, 11 Jun 2021 11:47:14 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lrdkv-00FcQM-6D; Fri, 11 Jun 2021 11:47:13 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lrdku-00CZqn-OV; Fri, 11 Jun 2021 11:47:12 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/4] Renesas ARM defconfig updates for v5.14 (take two)
Date:   Fri, 11 Jun 2021 11:47:01 +0200
Message-Id: <cover.1623403795.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623403793.git.geert+renesas@glider.be>
References: <cover.1623403793.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 9558487e7d976c1b92b2bc66fb4d901b1d35437f:

  arm64: defconfig: Enable usb2_clksel for R-Car Gen3 and RZ/G2 (2021-05-25 10:04:39 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v5.14-tag2

for you to fetch changes up to 27a79a723d48dbeccb4fe6f7ede47e67642e6a4a:

  arm64: defconfig: Enable ARCH_R9A07G044 (2021-06-10 15:30:18 +0200)

----------------------------------------------------------------
Renesas ARM defconfig updates for v5.14 (take two)

  - Enable support for the new RZ/G2L SoC variants in the arm64
    defconfig.

----------------------------------------------------------------
Lad Prabhakar (1):
      arm64: defconfig: Enable ARCH_R9A07G044

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)
