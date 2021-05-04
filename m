Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98D2B372C43
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 May 2021 16:41:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230307AbhEDOmY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 May 2021 10:42:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231467AbhEDOmY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 May 2021 10:42:24 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76785C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue,  4 May 2021 07:41:29 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:1ca1:e52f:3ec5:3ac5])
        by albert.telenet-ops.be with bizsmtp
        id 0ehT250083aEpPb06ehT2T; Tue, 04 May 2021 16:41:28 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ldwEo-002nql-QG; Tue, 04 May 2021 16:41:26 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ldwEo-00HQGb-CF; Tue, 04 May 2021 16:41:26 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 0/2] ARM: dts: rcar-gen1: Correct internal delay for i2c[123]
Date:   Tue,  4 May 2021 16:41:23 +0200
Message-Id: <cover.1620138979.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series lowers the internal delays for the second to fourth
I2C instances on R-Car Gen1 SoCs, to match the Hardware User's Manuals.

This is untested, because these I2C instances are not used in upstream
DTS files, and due to lack of direct hardware access for measurements.

If both patches are accepted, I'll probably squash them together while
applying.

Thanks for your comments!

Geert Uytterhoeven (2):
  ARM: dts: r8a7778: Correct internal delay for i2c[123]
  ARM: dts: r8a7779: Correct internal delay for i2c[123]

 arch/arm/boot/dts/r8a7778.dtsi | 3 +++
 arch/arm/boot/dts/r8a7779.dtsi | 3 +++
 2 files changed, 6 insertions(+)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
