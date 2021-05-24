Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD09C38F5F2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 May 2021 00:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbhEXW7J (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 May 2021 18:59:09 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:35739 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229668AbhEXW7I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 May 2021 18:59:08 -0400
Date:   25 May 2021 07:57:38 +0900
X-IronPort-AV: E=Sophos;i="5.82,327,1613401200"; 
   d="scan'208";a="82282349"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 25 May 2021 07:57:38 +0900
Received: from mercury.renesas.com (unknown [10.166.252.133])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9F0444009F8A;
        Tue, 25 May 2021 07:57:38 +0900 (JST)
Message-ID: <87sg2boi3h.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 0/3] arm64: dts: renesas: r8a77995: draak: add R-Car Sound support
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
        kazuya.mizuguchi.ks@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        hoai.luu.ub@renesas.com, takeshi.kihara.df@renesas.com,
        harunobu.kurokawa.dn@renesas.com, khiem.nguyen.xt@renesas.com,
        hien.dang.eb@renesas.com
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Geert

These are v2 of R-Car D3 Sound support patch-set.
It is based on latest ALSA SoC branch (= asoc/for-5.14).

asoc
	git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git

v1 -> v2

	- ZA2 clock is based on PLL0D3 clock
	- alphabetical / numerical sort order
	- move SW60 comment to related block
	- tidyup git-log typo
	- based on latest ALSA SoC
	 * don't have null_clock (= audio_clk_c)
	 * no more DT warning

Link: https://lore.kernel.org/r/87k0nyci2t.wl-kuninori.morimoto.gx@renesas.com

Kuninori Morimoto (3):
  clk: renesas: r8a77995: Add ZA2 clock
  arm64: dts: renesas: r8a77995: add R-Car Sound support
  arm64: dts: renesas: r8a77995: draak: Add R-Car Sound support

 .../arm64/boot/dts/renesas/r8a77995-draak.dts | 111 ++++++++++++
 arch/arm64/boot/dts/renesas/r8a77995.dtsi     | 166 ++++++++++++++++++
 drivers/clk/renesas/r8a77995-cpg-mssr.c       |   1 +
 3 files changed, 278 insertions(+)

-- 
2.25.1

