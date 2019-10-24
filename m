Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D36AEE3010
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Oct 2019 13:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408059AbfJXLRD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Oct 2019 07:17:03 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:14863 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2405717AbfJXLRD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Oct 2019 07:17:03 -0400
X-IronPort-AV: E=Sophos;i="5.68,224,1569250800"; 
   d="scan'208";a="29695324"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 24 Oct 2019 20:17:01 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8B1904209FBE;
        Thu, 24 Oct 2019 20:17:01 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, geert+renesas@glider.be
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/3] clk: renesas: rcar-usb2-clock-sel: Fix clks/resets handling
Date:   Thu, 24 Oct 2019 20:16:58 +0900
Message-Id: <1571915821-1620-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series is based on the latest renesas-drivers.git /
clk-renesas-for-v5.5 branch.
The hardware also needs multiple clocks/resets management like
renesas_usbhs driver [1], so this patch series fixes it.

[1]
3df0e24 usb: renesas_usbhs: Add multiple clocks management
f181dbb usb: renesas_usbhs: Add reset_control

Yoshihiro Shimoda (3):
  dt-bindings: clock: renesas: rcar-usb2-clock-sel: Fix clock[-name]s
    properties
  clk: renesas: rcar-usb2-clock-sel: Add multiple clocks management
  clk: renesas: rcar-usb2-clock-sel: Add reset_control

 .../bindings/clock/renesas,rcar-usb2-clock-sel.txt |  8 ++--
 drivers/clk/renesas/rcar-usb2-clock-sel.c          | 49 +++++++++++++++++++++-
 2 files changed, 52 insertions(+), 5 deletions(-)

-- 
2.7.4

