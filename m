Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 301186998E7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Feb 2023 16:30:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230222AbjBPPan (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Feb 2023 10:30:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbjBPPal (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Feb 2023 10:30:41 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBFFE25E2F
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Feb 2023 07:30:40 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:4605:3635:9491:c6bc])
        by andre.telenet-ops.be with bizsmtp
        id MrWd2900J3wKl5501rWdhm; Thu, 16 Feb 2023 16:30:38 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pSgD8-009BmM-Me;
        Thu, 16 Feb 2023 16:30:37 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pSgDV-005ttN-DV;
        Thu, 16 Feb 2023 16:30:37 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc:     Simon Horman <horms+renesas@verge.net.au>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] arm64: dts: renesas: Remove bogus voltages from OPP table
Date:   Thu, 16 Feb 2023 16:30:30 +0100
Message-Id: <cover.1676560856.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
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

The System CPU cores on R-Car E3 and RZ/G2E do not have their own power
supplies, but use the common internal power supplies (typical 1.03V).
However, their Operating Performance Points tables do list 0.82V
voltages for the various operating points, which are clearly bogus.
Hence this series removes the bogus properties.

This has been tested on the Ebisu 4D-development board with R-Car E3,
where CPUfreq works as before.

I intend to queue this series in renesas-devel for v6.4.

Thanks for your comments!

Geert Uytterhoeven (2):
  arm64: dts: renesas: r8a77990: Remove bogus voltages from OPP table
  arm64: dts: renesas: r8a774c0: Remove bogus voltages from OPP table

 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 3 ---
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 3 ---
 2 files changed, 6 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
