Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D0D32D4B14
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Dec 2020 20:55:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729949AbgLITyy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Dec 2020 14:54:54 -0500
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:7833 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729166AbgLITyy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Dec 2020 14:54:54 -0500
X-Halon-ID: 49d4e69e-3a58-11eb-a542-005056917a89
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p4fca2458.dip0.t-ipconnect.de [79.202.36.88])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 49d4e69e-3a58-11eb-a542-005056917a89;
        Wed, 09 Dec 2020 20:54:12 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/5] clk: renesas: Add TMU clocks
Date:   Wed,  9 Dec 2020 20:53:38 +0100
Message-Id: <20201209195343.803120-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

This series adds the missing TMU clocks for most Renesas R-Car Gen3 
SoCs. I have tested this series on all boards but D3 and E3 as I do not 
have access to those. But I see no reason they should not not work 
equally well as they the boards I can test on.

Niklas Söderlund (5):
  clk: renesas: r8a7795: Add TMU clocks
  clk: renesas: r8a7796: Add TMU clocks
  clk: renesas: r8a77965: Add TMU clocks
  clk: renesas: r8a77990: Add TMU clocks
  clk: renesas: r8a77995: Add TMU clocks

 drivers/clk/renesas/r8a7795-cpg-mssr.c  | 5 +++++
 drivers/clk/renesas/r8a7796-cpg-mssr.c  | 5 +++++
 drivers/clk/renesas/r8a77965-cpg-mssr.c | 5 +++++
 drivers/clk/renesas/r8a77990-cpg-mssr.c | 5 +++++
 drivers/clk/renesas/r8a77995-cpg-mssr.c | 5 +++++
 5 files changed, 25 insertions(+)

-- 
2.29.2

