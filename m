Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17E7A6C9EBF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Mar 2023 10:59:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233520AbjC0I7p (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Mar 2023 04:59:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232640AbjC0I7P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Mar 2023 04:59:15 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77FFD59CF
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Mar 2023 01:57:12 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.187.55])
        by andre.telenet-ops.be with bizsmtp
        id dLx82900Q1C8whw01Lx81N; Mon, 27 Mar 2023 10:57:10 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pgieO-00ExYx-Ri;
        Mon, 27 Mar 2023 10:57:08 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pgif6-002ath-Cd;
        Mon, 27 Mar 2023 10:57:08 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/4] Renesas ARM defconfig updates for v6.4
Date:   Mon, 27 Mar 2023 10:57:01 +0200
Message-Id: <cover.1679907057.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679907055.git.geert+renesas@glider.be>
References: <cover.1679907055.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v6.4-tag1

for you to fetch changes up to 93582bdfd0cf5aeeb4451ade1076a455c53d8a85:

  arm64: defconfig: Enable RZ/V2M xHCI and USB3.1 DRD controller support (2023-03-10 16:41:43 +0100)

----------------------------------------------------------------
Renesas ARM defconfig updates for v6.4

  - Enable support for the Dialog Semiconductor DA7213 Codec, and the
    Renesas RZ/V2M xHCI and USB3.1 DRD controllers in the arm64
    defconfig,
  - Disable support for the obsolete R-Car H3 ES1.* (R8A77950) SoC in
    the arm64 defconfig,
  - Refresh shmobile_defconfig for v6.3-rc1,
  - Enable additional support for RZ/N1 platforms in multi_v7_defconfig.

----------------------------------------------------------------
Geert Uytterhoeven (3):
      ARM: shmobile: defconfig: Refresh for v6.3-rc1
      ARM: multi_v7_defconfig: Enable additional support for RZ/N1 platforms
      arm64: defconfig: Enable RZ/V2M xHCI and USB3.1 DRD controller support

Kuninori Morimoto (1):
      arm64: defconfig: Enable DA7213 Codec

Wolfram Sang (1):
      arm64: defconfig: Disable R-Car H3 ES1.*

 arch/arm/configs/multi_v7_defconfig | 6 ++++++
 arch/arm/configs/shmobile_defconfig | 2 ++
 arch/arm64/configs/defconfig        | 4 +++-
 3 files changed, 11 insertions(+), 1 deletion(-)
