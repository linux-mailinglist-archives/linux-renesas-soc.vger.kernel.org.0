Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B30C8632348
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Nov 2022 14:18:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbiKUNSq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Nov 2022 08:18:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiKUNSp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Nov 2022 08:18:45 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48B5B74604
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Nov 2022 05:18:43 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:4821:1ba5:2638:5c3a])
        by baptiste.telenet-ops.be with bizsmtp
        id n1Jg2800h5WXlCv011JgX8; Mon, 21 Nov 2022 14:18:41 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ox6h6-0018zz-HG; Mon, 21 Nov 2022 14:18:40 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ox6h6-00BMkF-3Q; Mon, 21 Nov 2022 14:18:40 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 0/4] pinctrl: renesas: r8a779g0: Miscellaneous fixes
Date:   Mon, 21 Nov 2022 14:18:35 +0100
Message-Id: <cover.1669036423.git.geert+renesas@glider.be>
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

This patch series contains miscellaneous fixes for the R-Car V4H pin
control driver.  Any functional changes are based on R-Car V4H Series
User’s Manual: Hardware Rev. 0.54.

The last 3 patches are marked RFC, as the affected functionality could
not be tested yet.

Thanks for your comments!

Geert Uytterhoeven (4):
  pinctrl: renesas: r8a779g0: Fix alignment in GPSR[678]_* macros
  pinctrl: renesas: r8a779g0: Fix Group 4/5 pin functions
  pinctrl: renesas: r8a779g0: Fix Group 6/7 pin functions
  pinctrl: renesas: r8a779g0: Fix ERROROUTC function names

 drivers/pinctrl/renesas/pfc-r8a779g0.c | 1102 ++++++++++++------------
 1 file changed, 560 insertions(+), 542 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
