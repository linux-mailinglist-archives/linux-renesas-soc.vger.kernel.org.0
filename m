Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CED355F7A99
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Oct 2022 17:34:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229507AbiJGPeI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Oct 2022 11:34:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230051AbiJGPeH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Oct 2022 11:34:07 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D66F91162FA
        for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Oct 2022 08:34:05 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:a4a4:fd15:fba:df3b])
        by andre.telenet-ops.be with bizsmtp
        id V3a32800U5Lh0ZK013a4Rx; Fri, 07 Oct 2022 17:34:04 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ogpMR-000ugl-I0; Fri, 07 Oct 2022 17:34:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ogpMR-00CQXV-3C; Fri, 07 Oct 2022 17:34:03 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] arm64: dts: renesas: r8a779g0: Add PWM and TPU device
Date:   Fri,  7 Oct 2022 17:34:00 +0200
Message-Id: <cover.1665156417.git.geert+renesas@glider.be>
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

This patch series adds devices nodes for the PWM timers and the 16-Bit
Timer Pulse Unit (TPU) on the Renesas R-Car V4H (R8A779G0) SoC.

PWM[089] and TPU0 can be accessed on test points resp. the IO Pin Header
on the White Hawk development board using DT overlays available from
[1].  PWM operation (correct period and duty cycle) has been verified
with a scope.

I plan to queues this series in renesas-devel for v6.2.
Thanks for your comments!

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/renesas-overlays

CongDang (2):
  arm64: dts: renesas: r8a779g0: Add PWM device nodes
  arm64: dts: renesas: r8a779g0: Add TPU device node

 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 111 ++++++++++++++++++++++
 1 file changed, 111 insertions(+)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
