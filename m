Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C8C8559907
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jun 2022 14:02:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230227AbiFXMBs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Jun 2022 08:01:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231182AbiFXMBq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Jun 2022 08:01:46 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47ACD7E038
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Jun 2022 05:01:43 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id n01e2700L4C55Sk0601eDD; Fri, 24 Jun 2022 14:01:42 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1o4i0I-000gWY-Cd; Fri, 24 Jun 2022 14:01:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1o4i0H-009mpx-Qm; Fri, 24 Jun 2022 14:01:37 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/4] Renesas SoC updates for v5.20
Date:   Fri, 24 Jun 2022 14:01:28 +0200
Message-Id: <cover.1656069631.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
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

	Hi SoC folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v5.20.

It consists of 4 parts:

  [GIT PULL 1/4] Renesas ARM defconfig updates for v5.20

    - Enable support for the Renesas R-Car V4H SoC,
    - Refresh shmobile_defconfig for v5.19-rc1.

  [GIT PULL 2/4] Renesas ARM DT updates for v5.20

    - ADC and SPI support for the RZ/G2UL Soc and the RZ/G2UL SMARC EVK
      development board,
    - Ethernet support for the RZ/V2M SoC and the RZV2MEVK2 development
      board,
    - Thermal, IOMMU, Universal Flash Storage, octal Cortex-A55, and full
      serial support for the R-Car S4-8 SoC on the Spider development
      board,
    - RTC support for the RZN1D-DB board,
    - Miscellaneous fixes and improvements.

  [GIT PULL 3/4] Renesas driver updates for v5.20

    - Small fixes and improvements.

  [GIT PULL 4/4] Renesas DT binding updates for v5.20

    - Reorganize the renesas,prr DT binding document.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
