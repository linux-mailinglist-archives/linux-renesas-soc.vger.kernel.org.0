Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF5EC7D3877
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Oct 2023 15:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbjJWNwf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Oct 2023 09:52:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229686AbjJWNwa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Oct 2023 09:52:30 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8CBB103
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Oct 2023 06:52:26 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:375d:2b56:c03f:d72d])
        by laurent.telenet-ops.be with bizsmtp
        id 1RsQ2B0043CbNjd01RsQDK; Mon, 23 Oct 2023 15:52:24 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1quvLt-007KH7-0r;
        Mon, 23 Oct 2023 15:52:23 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1quvLz-007oKq-S1;
        Mon, 23 Oct 2023 15:52:23 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] dts: renesas: Fix I2C bus demux node names and ADV751[13] power supplies
Date:   Mon, 23 Oct 2023 15:52:14 +0200
Message-Id: <cover.1698068646.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series fixes some rather cosmetical issues detected while
converting the I2C bus demultiplexer Device Tree binding documentation
to json-schema[1].

I intend to queue these in renesas-devel for v6.8.

Thanks for your comments!

[1] https://lore.kernel.org/r/28c173dfbbc17403b0c5a6f27661d7bd33a86f84.1698068607.git.geert+renesas@glider.be

Geert Uytterhoeven (3):
  ARM: dts: renesas: rcar-gen2: Fix I2C bus demux node names
  ARM: dts: renesas: Add missing ADV751[13] power supply properties
  arm64: dts: renesas: Add missing ADV751[13] power supply properties

 .../boot/dts/renesas/iwg20d-q7-dbcm-ca.dtsi   | 15 ++++++++++
 .../renesas/r8a7745-iwg22d-sodimm-dbhd-ca.dts | 15 ++++++++++
 arch/arm/boot/dts/renesas/r8a7790-lager.dts   | 23 +++++++++++---
 arch/arm/boot/dts/renesas/r8a7790-stout.dts   | 15 ++++++++++
 arch/arm/boot/dts/renesas/r8a7791-koelsch.dts | 30 +++++++++++++++++--
 arch/arm/boot/dts/renesas/r8a7791-porter.dts  | 26 +++++++++++++++-
 arch/arm/boot/dts/renesas/r8a7792-blanche.dts | 15 ++++++++++
 arch/arm/boot/dts/renesas/r8a7792-wheat.dts   | 21 +++++++++++++
 arch/arm/boot/dts/renesas/r8a7793-gose.dts    | 28 +++++++++++++++--
 arch/arm/boot/dts/renesas/r8a7794-alt.dts     |  4 +--
 arch/arm/boot/dts/renesas/r8a7794-silk.dts    | 17 ++++++++++-
 arch/arm64/boot/dts/renesas/draak.dtsi        |  6 ++++
 arch/arm64/boot/dts/renesas/ebisu.dtsi        |  6 ++++
 .../arm64/boot/dts/renesas/r8a77970-eagle.dts | 15 ++++++++++
 14 files changed, 223 insertions(+), 13 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
