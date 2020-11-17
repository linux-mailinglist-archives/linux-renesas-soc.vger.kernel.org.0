Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B18C42B5B7F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Nov 2020 10:04:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbgKQJDi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Nov 2020 04:03:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbgKQJDf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Nov 2020 04:03:35 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BBD5C0617A7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2020 01:03:34 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by xavier.telenet-ops.be with bizsmtp
        id tM3W2301M4C55Sk01M3WrZ; Tue, 17 Nov 2020 10:03:31 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kewte-003A6M-N3
        for linux-renesas-soc@vger.kernel.org; Tue, 17 Nov 2020 10:03:30 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kewtd-008vpz-VZ
        for linux-renesas-soc@vger.kernel.org; Tue, 17 Nov 2020 10:03:29 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Subject: [PATCH RFC 0/4] r8a779a0: Add MSIOF support
Date:   Tue, 17 Nov 2020 10:03:25 +0100
Message-Id: <20201117090329.2128904-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series adds support for MSIOF on R-Car V3U.

I tested it on Falcon, with MSIOF1 TXD/RXD loopback (connect pins 5/6 of
CN5), CONFIG_SPI_LOOPBACK_TEST, loopback=1, and the following appended
to arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts:

    &msiof1 {
	    #address-cells = <1>;
	    #size-cells = <0>;
	    status = "okay";
     
	    loopback@0 {
		    compatible = "linux,spi-loopback-test";
		    reg = <0>;
		    spi-max-frequency = <10000000>;
	    };
    };

Although the bootloader defaults for GPSR1 (0xbff7fff) and IP1SR1
(0x00000000) should be correct to configure the pins for the MSIOF1
function, spi-loopback-test failed with:

    spi-loopback-test spi0.0:   with iteration values: len = 2, tx_off = 0, rx_off = 0
    spi-loopback-test spi0.0: loopback strangeness - transfer mismatch on byte 0001 - expected 0x01, but got 0x00
    spi-loopback-test spi0.0:   spi_msg@(____ptrval____)
    spi-loopback-test spi0.0:     frame_length:  2
    spi-loopback-test spi0.0:     actual_length: 2
    spi-loopback-test spi0.0:     spi_transfer@(____ptrval____)
    spi-loopback-test spi0.0:       len:    2
    spi-loopback-test spi0.0:       tx_buf: (____ptrval____)
	      TX: 00000000: 00 01
    spi-loopback-test spi0.0:       rx_buf: (____ptrval____)
	      RX: 00000000: 00 00
    spi-loopback-test spi0.0: test failed - test returned -22, but we expect 0
    spi-loopback-test spi0.0: Finished spi-loopback-tests with return: -22
    spi-loopback-test: probe of spi0.0 failed with error -22

Note that the tests before (len = 1) did succeed...

I will retry after we have proper pinctrl support.

Thanks for your comments!

Geert Uytterhoeven (2):
  [RFC] clk: renesas: r8a779a0: Add MSIOF clocks
  [RFC] arm64: dts: renesas: r8a779a0: Add dmac1 placeholder node

Koji Matsuoka (1):
  [RFC] arm64: dts: renesas: r8a779a0: Add MSIOF device nodes

Wolfram Sang (1):
  spi: renesas,sh-msiof: Add r8a779a0 (V3U) support

 .../bindings/spi/renesas,sh-msiof.yaml        |  1 +
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi     | 96 +++++++++++++++++++
 drivers/clk/renesas/r8a779a0-cpg-mssr.c       |  6 ++
 3 files changed, 103 insertions(+)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
