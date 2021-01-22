Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BCB73001C1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Jan 2021 12:41:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726744AbhAVLiF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Jan 2021 06:38:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728179AbhAVLfL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Jan 2021 06:35:11 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AEE9C06174A
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Jan 2021 03:34:30 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by andre.telenet-ops.be with bizsmtp
        id KnaU240024C55Sk01naU8W; Fri, 22 Jan 2021 12:34:28 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l2uhv-005lFU-Nv; Fri, 22 Jan 2021 12:34:27 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l2uhv-00Bt2O-7M; Fri, 22 Jan 2021 12:34:27 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Prabhakar <prabhakar.csengg@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v5 0/2] ARM: dts: r8a7742-iwg21d-q7-dbcm: Add support for ov7725 sensors
Date:   Fri, 22 Jan 2021 12:34:22 +0100
Message-Id: <20210122113424.2833127-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Prabhakar,

This is an alternative version of your v3[1], decribing only a single
camera in each .dtsi file, to be included multiple times.

Changes compared to v4:
  - Only enable i2c buses when needed.

I plan to queue this in renesas-devel for-v5.12.
Thanks for your comments!

[1] https://lore.kernel.org/linux-devicetree/20201126103053.29881-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Lad Prabhakar (2):
  ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Separate out ov5640 nodes
  ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Add support for 8-bit ov7725
    sensors

 .../boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts    | 159 +++++++++---------
 .../r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi |  32 ++++
 .../r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi |  29 ++++
 3 files changed, 140 insertions(+), 80 deletions(-)
 create mode 100644 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
 create mode 100644 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
