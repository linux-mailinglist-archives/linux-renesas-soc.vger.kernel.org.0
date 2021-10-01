Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF55841E9F4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Oct 2021 11:42:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353168AbhJAJoj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Oct 2021 05:44:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353247AbhJAJog (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Oct 2021 05:44:36 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB5ACC06177C
        for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Oct 2021 02:42:52 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:5c32:c2e7:df7:3731])
        by laurent.telenet-ops.be with bizsmtp
        id 0Zir260011ZoSwU01ZirkJ; Fri, 01 Oct 2021 11:42:51 +0200
Received: from rox.of.borg ([192.168.97.57] helo=rox)
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mWF46-000zIj-IB; Fri, 01 Oct 2021 11:42:50 +0200
Received: from geert by rox with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mWF45-00BE6A-UA; Fri, 01 Oct 2021 11:42:49 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/4] Renesas ARM defconfig updates for v5.16
Date:   Fri,  1 Oct 2021 11:42:43 +0200
Message-Id: <cover.1633081145.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633081144.git.geert+renesas@glider.be>
References: <cover.1633081144.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v5.16-tag1

for you to fetch changes up to 93207e415d134e6fbcee6a723ab4cf060ef3926e:

  arm64: defconfig: Enable RZG2L_ADC (2021-09-28 09:31:38 +0200)

----------------------------------------------------------------
Renesas ARM defconfig updates for v5.16

  - Enable built-in (I2C, DMAC, USB PHY control) and modular (audio,
    ADC) build of drivers for the RZ/G2L SoC and SMARC EVK board,
  - Enable modular build of the Renesas TPU PWM driver for the R-Car
    V3U SoC.

----------------------------------------------------------------
Biju Das (5):
      arm64: defconfig: Enable RIIC
      arm64: defconfig: Enable RZ/G2L USBPHY control driver
      arm64: defconfig: Enable RZ_DMAC
      arm64: defconfig: Enable SOUND_SOC_RZ
      arm64: defconfig: Enable SND_SOC_WM8978

Lad Prabhakar (1):
      arm64: defconfig: Enable RZG2L_ADC

Wolfram Sang (1):
      arm64: defconfig: Add Renesas TPU as module

 arch/arm64/configs/defconfig | 7 +++++++
 1 file changed, 7 insertions(+)
