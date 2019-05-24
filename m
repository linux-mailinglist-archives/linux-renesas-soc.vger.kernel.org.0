Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B198029B12
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 May 2019 17:32:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389405AbfEXPb7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 May 2019 11:31:59 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:30426 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2389288AbfEXPb7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 May 2019 11:31:59 -0400
X-IronPort-AV: E=Sophos;i="5.60,507,1549897200"; 
   d="scan'208";a="16673457"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 25 May 2019 00:31:56 +0900
Received: from renesas-VirtualBox.ree.adwin.renesas.com (unknown [10.226.37.56])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 373F9400A6AC;
        Sat, 25 May 2019 00:31:54 +0900 (JST)
From:   Gareth Williams <gareth.williams.jx@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Gareth Williams <gareth.williams.jx@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] clk: renesas: r9a06g032: Add clock domain support
Date:   Fri, 24 May 2019 16:31:42 +0100
Message-Id: <1558711904-27278-1-git-send-email-gareth.williams.jx@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

There are several clocks on the r9ag032 which are currently not enabled
in their drivers that can be delegated to clock domain system for power
management. Therefore add support for clock domain functionality to the
r9a06g032 clock driver after updating the relevant dt-bindings file.

Gareth Williams (2):
  dt-bindings: clock: renesas,r9a06g032-sysctrl: Document power Domains
  clk: renesas: r9a06g032: Add clock domain support

 .../bindings/clock/renesas,r9a06g032-sysctrl.txt   |   3 +
 drivers/clk/renesas/r9a06g032-clocks.c             | 229 ++++++++++++++-------
 2 files changed, 163 insertions(+), 69 deletions(-)

-- 
2.7.4

