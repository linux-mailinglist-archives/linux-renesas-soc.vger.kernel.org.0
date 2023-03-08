Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86F486B0BAE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Mar 2023 15:43:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230268AbjCHOn0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Mar 2023 09:43:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232039AbjCHOnH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Mar 2023 09:43:07 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFEF6C3638
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Mar 2023 06:41:07 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:614d:21b0:703:d0f9])
        by michel.telenet-ops.be with bizsmtp
        id Vqgx2900d3mNwr406qgy0F; Wed, 08 Mar 2023 15:40:58 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pZuxr-00BFYz-Mi;
        Wed, 08 Mar 2023 15:40:57 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pZuyP-00Fb3K-Qc;
        Wed, 08 Mar 2023 15:40:57 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] ARM/arm64: defconfig updates for Renesas platforms
Date:   Wed,  8 Mar 2023 15:40:51 +0100
Message-Id: <cover.1678286291.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

        Hi all,

This patch series contains updates related to Renesas platforms for the
various defconfig files.

I plan to qeueue these in renesas-devel-for-v6.4.

Thanks for your comments!

Geert Uytterhoeven (3):
  ARM: shmobile: defconfig: Refresh for v6.3-rc1
  ARM: multi_v7_defconfig: Enable additional support for RZ/N1 platforms
  arm64: defconfig: Enable RZ/V2M xHCI and USB3.1 DRD controller support

 arch/arm/configs/multi_v7_defconfig | 6 ++++++
 arch/arm/configs/shmobile_defconfig | 2 ++
 arch/arm64/configs/defconfig        | 2 ++
 3 files changed, 10 insertions(+)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
