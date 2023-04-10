Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCDE56DC40E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Apr 2023 09:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbjDJHzs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Apr 2023 03:55:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbjDJHzr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Apr 2023 03:55:47 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC2144204
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Apr 2023 00:55:45 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.187.55])
        by michel.telenet-ops.be with bizsmtp
        id ivvj290091C8whw06vvjKG; Mon, 10 Apr 2023 09:55:43 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1plmMW-00GRrr-I2;
        Mon, 10 Apr 2023 09:55:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1plmNL-008PVA-3G;
        Mon, 10 Apr 2023 09:55:43 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas SoC updates for v6.4 (take two)
Date:   Mon, 10 Apr 2023 09:55:25 +0200
Message-Id: <cover.1681113111.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi SoC folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v6.4.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas ARM SoC updates for v6.4

    - Use of_cpu_node_to_id() to read CPU node 'reg'.

  [GIT PULL 2/3] Renesas driver updates for v6.4 (take two)

    - Add "renesas," file contents pattern to MAINTAINERS,
    - Fix a small leak on OOM.

  [GIT PULL 3/3] Renesas DTS updates for v6.4 (take two)

    - Add PWM support for the R-Car H1 and H2 SoCs,
    - Add slide switch and I2C support for the Marzen development board,
    - Add SCI (serial) and Camera support for the RZ/G2L SoC and the
      RZ/G2L SMARC EVK development board,
    - Add IOMMU support for the R-Car V4H SoC,
    - Miscellaneous fixes and improvements.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
