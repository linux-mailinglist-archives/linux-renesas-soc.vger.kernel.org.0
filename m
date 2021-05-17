Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 484BD38225C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 May 2021 02:41:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229600AbhEQAmb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 16 May 2021 20:42:31 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:38012 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229459AbhEQAma (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 May 2021 20:42:30 -0400
X-Greylist: delayed 303 seconds by postgrey-1.27 at vger.kernel.org; Sun, 16 May 2021 20:42:30 EDT
Date:   17 May 2021 09:36:11 +0900
X-IronPort-AV: E=Sophos;i="5.82,306,1613401200"; 
   d="scan'208";a="81299732"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 17 May 2021 09:36:11 +0900
Received: from mercury.renesas.com (unknown [10.166.252.133])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id EDC2A4142B7C;
        Mon, 17 May 2021 09:36:10 +0900 (JST)
Message-ID: <87k0nyci2t.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/3] arm64: dts: renesas: r8a77995: draak: add R-Car Sound support
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

These add R-Car Sound support for D3 draak board.
It is based on v5.13-rc1

Kuninori Morimoto (3):
  clk: renesas: r8a77995: Add ZA2 clock
  arm64: dts: renesas: r8a77995: add R-Car Sound support
  arm64: dts: renesas: r8a77995: draak: Add R-Car Sound support

 .../arm64/boot/dts/renesas/r8a77995-draak.dts | 103 ++++++++++
 arch/arm64/boot/dts/renesas/r8a77995.dtsi     | 176 ++++++++++++++++++
 drivers/clk/renesas/r8a77995-cpg-mssr.c       |   3 +
 3 files changed, 282 insertions(+)

-- 
2.25.1

