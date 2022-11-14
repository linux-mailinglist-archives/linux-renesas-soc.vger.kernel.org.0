Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDBB8627E91
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Nov 2022 13:49:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237323AbiKNMtL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Nov 2022 07:49:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237309AbiKNMtL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2022 07:49:11 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A4502C8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Nov 2022 04:49:09 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:9cda:b28b:1ded:8138])
        by laurent.telenet-ops.be with bizsmtp
        id kCp52800b3NlhLw01Cp5VS; Mon, 14 Nov 2022 13:49:07 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ouYtd-000UU9-HT; Mon, 14 Nov 2022 13:49:05 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ouYtc-003gyw-V1; Mon, 14 Nov 2022 13:49:04 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/5] arm64: dts: renesas: r8a779g0: CPU topology improvements
Date:   Mon, 14 Nov 2022 13:48:59 +0100
Message-Id: <cover.1668429870.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Currently, the R-Car V4H DTS describes a single Cortex-A76 CPU core
only.  This patch series completes the description of the Cortex-A76
clusters by describing L3 caches, CPU cores 1-3, CPU map, PSCI for CPU
bring up, CPUIdle, CPU core clocks, and CPU core operating points.

This has been tested on the White-Hawk development board, where now all
4 Cortex-A76 CPU cores are available after boot.  All but the first CPU
core can be controlled from sysfs (/sys/*/*/cpu/cpu[0-3]/online).
CPU core performance follows the CPU core clocks, when changing the
frequency of the latter.

I plan to queue this in renesas-devel for v6.2.

Thanks for your comments!

Geert Uytterhoeven (5):
  arm64: dts: renesas: r8a779g0: Add L3 cache controller
  arm64: dts: renesas: r8a779g0: Add secondary CA76 CPU cores
  arm64: dts: renesas: r8a779g0: Add CPUIdle support
  arm64: dts: renesas: r8a779g0: Add CPU core clocks
  arm64: dts: renesas: r8a779g0: Add CA76 operating points

 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 130 +++++++++++++++++++++-
 1 file changed, 125 insertions(+), 5 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
