Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B77DE5EACBA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Sep 2022 18:39:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbiIZQjo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Sep 2022 12:39:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbiIZQjV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Sep 2022 12:39:21 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10D31137E6D
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Sep 2022 08:26:33 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:d95b:5c9b:4085:7c0d])
        by michel.telenet-ops.be with bizsmtp
        id QfST280083Qogd106fSTnm; Mon, 26 Sep 2022 17:26:27 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ocq03-006Jqw-0m; Mon, 26 Sep 2022 17:26:27 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ocq02-00DOPq-GG; Mon, 26 Sep 2022 17:26:26 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] arm64: dts: renesas: r8a779g0: Add DMA and MSIOF support
Date:   Mon, 26 Sep 2022 17:26:22 +0200
Message-Id: <cover.1664204771.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
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

This patch series adds support for DMA on the R-Car V4H SoC, to be used
(for now) by:
  - I2C,
  - the HSCIF0 serial port,
  - the newly-added MSIOF SPI support.

HSCIF0 DMA was tested on the White Hawk development board by removing
the uart_console() check from sci_request_dma().
MSIOF1 and MSIOF2 were tested on the MSIOF Pin Headers on the White Hawk
development board using a logic analyzer, and internal and external
loopback with the spi-loopback-test module, cfr. the DT overlays at [1].
Unfortunately I don't know how to test I2C DMA: all transfers used by
the AT24 EEPROM driver seem to be either too small, or unsafe for DMA.
Anyone who knows a good test client?

I plan to queue these in renesas-devel-for-v6.2.

Thanks!

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?h=topic/renesas-overlays&id=88f65e516d426aaa105416557f8157a38147cb21

Geert Uytterhoeven (2):
  arm64: dts: renesas: r8a779g0: Add DMA support
  arm64: dts: renesas: r8a779g0: Add MSIOF nodes

 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 187 ++++++++++++++++++++++
 1 file changed, 187 insertions(+)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
