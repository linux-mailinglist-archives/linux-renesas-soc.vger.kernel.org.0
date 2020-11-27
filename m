Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32E812C66B6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Nov 2020 14:23:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729402AbgK0NWH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Nov 2020 08:22:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730033AbgK0NWH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Nov 2020 08:22:07 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0360C0613D1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Nov 2020 05:22:06 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by xavier.telenet-ops.be with bizsmtp
        id xRN32300E4C55Sk01RN3kD; Fri, 27 Nov 2020 14:22:04 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kidhL-0065FN-Cj; Fri, 27 Nov 2020 14:22:03 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kidhL-000K9i-0I; Fri, 27 Nov 2020 14:22:03 +0100
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [GIT PULL 0/3] Renesas ARM SoC updates for v5.11 (take two)
Date:   Fri, 27 Nov 2020 14:21:52 +0100
Message-Id: <20201127132155.77418-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi arm-soc folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v5.11.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas ARM DT updates for v5.11 (take two)

    - PCIe endpoint support for the R-Car H3 ES2.0+ SoC.

  [GIT PULL 2/3] Renesas ARM SoC updates for v5.11

    - Stop using static I/O mappings and __raw_*() I/O accessors.

  [GIT PULL 3/3] Renesas driver updates for v5.11 (take two)

    - Stop using __raw_*() I/O accessors.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
