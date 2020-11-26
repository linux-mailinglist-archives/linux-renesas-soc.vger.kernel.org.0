Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 200A12C5DB7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Nov 2020 23:14:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388651AbgKZWOg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Nov 2020 17:14:36 -0500
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:17259 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726814AbgKZWOg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Nov 2020 17:14:36 -0500
X-Halon-ID: bfaf7366-3034-11eb-a78a-0050569116f7
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p4fca2458.dip0.t-ipconnect.de [79.202.36.88])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id bfaf7366-3034-11eb-a78a-0050569116f7;
        Thu, 26 Nov 2020 23:14:30 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] clk: renesas: r8a779a0: Add clocks to support thermal
Date:   Thu, 26 Nov 2020 23:14:14 +0100
Message-Id: <20201126221416.3110341-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

This series aims to add enough clocks to enable proper operation of the 
thermal IP block for V3U. The series have been tested on target together 
with other thermal enablement patches to prove operation of thermal.

Niklas Söderlund (2):
  clk: renesas: r8a779a0: Add CP clock
  clk: renesas: r8a779a0: Add THS/TSC clock

 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.29.2

