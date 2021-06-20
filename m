Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9EEC3ADD4F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Jun 2021 08:07:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbhFTGJq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Jun 2021 02:09:46 -0400
Received: from lists.levonline.com ([217.70.32.42]:44598 "EHLO
        lists.levonline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbhFTGJq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Jun 2021 02:09:46 -0400
Received: from exc-halon1.levonline.com (exc-halon1.levonline.com [217.70.32.123])
        by lists.levonline.com (Postfix) with ESMTP id CC5393A0D48
        for <linux-renesas-soc@vger.kernel.org>; Sun, 20 Jun 2021 07:58:43 +0200 (CEST)
X-SA-score: -1
X-Halon-ID: e5d5552e-d18c-11eb-8ebc-0050568168d4
Received: from ormen2.djurnet.levonline.com (ormen2.djurnet.levonline.com [192.168.17.32])
        by exc-halon1.levonline.com (Halon) with ESMTPS
        id e5d5552e-d18c-11eb-8ebc-0050568168d4;
        Sun, 20 Jun 2021 08:01:04 +0200 (CEST)
Received: from [127.0.0.1] (l193216.ppp.asahi-net.or.jp [218.219.193.216])
        (authenticated bits=0)
        by ormen2.djurnet.levonline.com (8.13.8/8.13.8) with ESMTP id 15K612QP011852;
        Sun, 20 Jun 2021 08:01:03 +0200
X-Origin-Levonline: b0359001
From:   Magnus Damm <damm@opensource.se>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <damm@opensource.se>, geert+renesas@glider.be
Date:   Sun, 20 Jun 2021 14:21:13 +0900
Message-Id: <162416647337.11444.4467438519249633023.sendpatchset@octo>
Subject: [PATCH 0/3] SoftSW DIP switch support for Draak, Eagle and Ebisu
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SoftSW DIP switch support for Draak, Eagle and Ebisu

[PATCH 1/3] arm64: dts: renesas: r8a77995: draak: Add SW56 support
[PATCH 2/3] arm64: dts: renesas: r8a77970: eagle: Add SW2 support
[PATCH 3/3] arm64: dts: renesas: r8a77990: ebisu: Add SW4 support

These patches add support for on-board SoftSW DIP switches to the
Draak, Eagle and Ebisu boards via board specific DTS changes. 

The GPIOs connecting the DIP switches to the SoC are board specific. There
are no on-board pull-ups mounted so internal resistors need to be enabled as
pull-ups for these boards. As expected 2k resistors are used to tie the
signals to ground for the case the DIP switch is set to ON.

All keys have been tested by toggling each DIP switch and making sure the
interrupt count in /proc/interrupts is changing as expected. The voltage level
of each signal has not been measured at this point so there is a small risk
that the internal pull-up isn't enabled and the signal is floating.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Developed on top of renesas-drivers-2021-06-08-v5.13-rc5

 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts |   43 ++++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts |   42 +++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts |   42 +++++++++++++++++++++++
 3 files changed, 127 insertions(+)
    
