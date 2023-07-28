Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED63766C3A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jul 2023 13:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234138AbjG1L5N (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Jul 2023 07:57:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231848AbjG1L5M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Jul 2023 07:57:12 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B8FDEC
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jul 2023 04:57:11 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:12b0:7b7e:d1ff:7873])
        by albert.telenet-ops.be with bizsmtp
        id Sbx62A0010d1nm806bx63U; Fri, 28 Jul 2023 13:57:09 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qPM5U-002mIh-Mq;
        Fri, 28 Jul 2023 13:57:05 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qPM5h-00AqNj-RN;
        Fri, 28 Jul 2023 13:57:05 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/3] Renesas ARM defconfig updates for v6.6
Date:   Fri, 28 Jul 2023 13:57:00 +0200
Message-Id: <cover.1690545141.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690545139.git.geert+renesas@glider.be>
References: <cover.1690545139.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v6.6-tag1

for you to fetch changes up to 0bfe5475f6b9fc766aa1fabb0a90c88b882c2f70:

  arm64: defconfig: Enable PMIC RAA215300 and RTC ISL 1208 configs (2023-07-10 09:29:21 +0200)

----------------------------------------------------------------
Renesas ARM defconfig updates for v6.6

  - Enable CSI driver support for Renesas RZ/V2M based platforms,
  - Enable MTU3a PWM and RAA215300 PMIC/RTC driver support, as used on
    Renesas RZ/{G2L,G2LC,G2UL,V2L} SMARC EVKs.

----------------------------------------------------------------
Biju Das (2):
      arm64: defconfig: Enable Renesas MTU3a PWM config
      arm64: defconfig: Enable PMIC RAA215300 and RTC ISL 1208 configs

Fabrizio Castro (1):
      arm64: defconfig: Enable Renesas RZ/V2M CSI driver

 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)
