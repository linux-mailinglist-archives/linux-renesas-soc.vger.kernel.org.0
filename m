Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E830F3DB939
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jul 2021 15:19:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238963AbhG3NTb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Jul 2021 09:19:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238970AbhG3NTU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Jul 2021 09:19:20 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B918C0613D5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jul 2021 06:19:10 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:69f0:c617:e432:6919])
        by baptiste.telenet-ops.be with bizsmtp
        id bRK62500C2oLRg901RK65H; Fri, 30 Jul 2021 15:19:06 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m9SPp-002GQp-VU; Fri, 30 Jul 2021 15:19:05 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m9SPp-00HJro-FB; Fri, 30 Jul 2021 15:19:05 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas SoC updates for v5.15
Date:   Fri, 30 Jul 2021 15:18:53 +0200
Message-Id: <cover.1627650695.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi soc folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v5.15.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas ARM DT updates for v5.15

    - Switches support for the Draak and Ebisu development boards,
    - I2C support on RZ/G2L,
    - I2C EEPROM support on the Ebisu development board,
    - Sound support for the R-Car D3 SoC and the Draak development board,
    - Support for the new R-Car H3e-2G and M3e-2G SoCs on the Salvator-XS
      and ULCB development boards,
    - IOMMU support for DMAC, EtherAVB, and SDHI on the R-Car M3-W+ SoC,
    - Miscellaneous fixes and improvements.

  [GIT PULL 2/3] Renesas driver updates for v5.15

    - Initial support for the new R-Car H3e-2G and M3e-2G SoCs.

  [GIT PULL 3/3] Renesas DT binding updates for v5.15

    - Document support for the new R-Car H3e-2G and M3e-2G SoCs and
      boards.

Note that the first part is based on v5.14-rc2, as older versions do
not include renesas-fixes-for-v5.14-tag1.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
