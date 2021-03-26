Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B63D34A5D1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Mar 2021 11:51:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbhCZKuu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Mar 2021 06:50:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbhCZKue (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Mar 2021 06:50:34 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E052FC0613B3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Mar 2021 03:50:17 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:5cae:bca6:def7:9f08])
        by xavier.telenet-ops.be with bizsmtp
        id kyqD2400C53vE1T01yqD50; Fri, 26 Mar 2021 11:50:14 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lPk2f-00AWWZ-7m; Fri, 26 Mar 2021 11:50:13 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lPk2e-006bak-Gt; Fri, 26 Mar 2021 11:50:12 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Dien Pham <dien.pham.ry@renesas.com>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] arm64: dts: renesas: Add cpu-supply properties for DVFS
Date:   Fri, 26 Mar 2021 11:50:07 +0100
Message-Id: <20210326105009.1574424-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series adds the cpu-supply properties to the a57_0 nodes on
the Salvator-X(S) and ULCB development boards, so Dynamic Voltage and
Frequency Scaling (DVFS) can change the CPU core voltages.
This is a prerequisite for enabling CPU boost modes.

To be queued in renesas-devel for 5.13.

Dien Pham (1):
  arm64: dts: renesas: salvator-common: Add cpu-supply property to a57_0
    node

Yusuke Goda (1):
  arm64: dts: renesas: ulcb: Add cpu-supply property to a57_0 node

 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 4 ++++
 arch/arm64/boot/dts/renesas/ulcb.dtsi            | 4 ++++
 2 files changed, 8 insertions(+)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
