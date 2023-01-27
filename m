Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8FBB67EADE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jan 2023 17:28:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234853AbjA0Q2c (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Jan 2023 11:28:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232597AbjA0Q2b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Jan 2023 11:28:31 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3755B7D2B1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Jan 2023 08:28:28 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:a160:4e65:21d4:30bf])
        by xavier.telenet-ops.be with bizsmtp
        id DsUS2900C2rBNjs01sUSMj; Fri, 27 Jan 2023 17:28:26 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pLRaG-007Zkf-Mi;
        Fri, 27 Jan 2023 17:28:24 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pLRaS-005TaU-Ei;
        Fri, 27 Jan 2023 17:28:24 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas SoC updates for v6.3 (take two)
Date:   Fri, 27 Jan 2023 17:28:11 +0100
Message-Id: <cover.1674815093.git.geert+renesas@glider.be>
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

	Hi SoC folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v6.3.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas driver updates for v6.3 (take two)

    - Add support for the Renesas RZ/V2M External Power Sequence
      Controller (PWC).

  [GIT PULL 2/3] Renesas DT binding updates for v6.3

    - Document support for the Renesas RZ/V2M External Power Sequence
      Controller (PWC).

  [GIT PULL 3/3] Renesas DT updates for v6.3 (take two)

    - High Performance mode (1.8 GHz) support for the Cortex-A76 CPU cores
      on R-Car V4H,
    - GPIO interrupt support for the RZ/G2UL SoC and the RZ/G2UL SMARC EVK
      development board,
    - USB Function support for the RZ/N1D SoC,
    - Generic Sound Card driver examples for the Renesas R-Car Starter Kit
      Premier/Pro and Shimafugi Kingfisher development board stack,
    - Universal Flash Storage support for the Renesas Spider development
      board,
    - External Power Sequence Controller (PWC) support for the RZ/V2M SoC
      and the RZ/V2M Evaluation Kit 2.0,
    - IOMMU support for MMC on the R-Car S4-8 SoC,
    - Miscellaneous fixes and improvements.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
