Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 779236B28DC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Mar 2023 16:30:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230386AbjCIPaz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Mar 2023 10:30:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230182AbjCIPay (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Mar 2023 10:30:54 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EA1F9F224
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Mar 2023 07:30:52 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:3a77:63e:b168:ae06])
        by xavier.telenet-ops.be with bizsmtp
        id WFWq2900X54Hw2A01FWqqu; Thu, 09 Mar 2023 16:30:50 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1paIDf-00BL6a-US;
        Thu, 09 Mar 2023 16:30:50 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1paIEE-00GUni-FZ;
        Thu, 09 Mar 2023 16:30:50 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] renesas: dts: Add remaining I2C EEPROMs
Date:   Thu,  9 Mar 2023 16:30:46 +0100
Message-Id: <cover.1678375464.git.geert+renesas@glider.be>
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

This patch series adds the I2C EEPROMs on the Atmark Techno
Armadillo-800-EVA, and the Renesas Condor and ULCB development boards.

This has been tested on Armadillo-800-EVA, Condor, and M3ULCB.

I plan to queue these in renesas-devel-for-v6.4.
Thanks for your comments!

Geert Uytterhoeven (3):
  ARM: dts: armadillo800eva: Add I2C EEPROM for MAC address
  arm64: dts: renesas: condor: Add I2C EEPROM for PMIC
  arm64: dts: renesas: ulcb: Add I2C EEPROM for PMIC

 arch/arm/boot/dts/r8a7740-armadillo800eva.dts | 19 +++++++++++++------
 .../boot/dts/renesas/r8a77980-condor.dts      |  8 ++++++++
 arch/arm64/boot/dts/renesas/ulcb.dtsi         |  6 ++++++
 3 files changed, 27 insertions(+), 6 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
