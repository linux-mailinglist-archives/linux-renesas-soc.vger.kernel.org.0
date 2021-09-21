Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7C03413056
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Sep 2021 10:46:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230488AbhIUIrk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Sep 2021 04:47:40 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:8367 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229590AbhIUIrj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Sep 2021 04:47:39 -0400
X-IronPort-AV: E=Sophos;i="5.85,310,1624287600"; 
   d="scan'208";a="94677074"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 21 Sep 2021 17:46:10 +0900
Received: from localhost.localdomain (unknown [10.226.92.242])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1252040061B7;
        Tue, 21 Sep 2021 17:46:07 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/4] Add Sound support for RZ/G2L SMARC EVK
Date:   Tue, 21 Sep 2021 09:46:01 +0100
Message-Id: <20210921084605.16250-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


This patch series aims to add sound support on RZ/G2L SMARC EVK.

Audio playback/record tested with 44.1Khz sampling rate.

Going forward we planned to upstream versa3 clock driver[1] and
planned to override the initial values programmed in OTP, so that mclock has 2 clock sources.

Based on the sampling rate versa3 clock driver switch the clock source and 
we can support both 48KHZ and 44.1 KHz as CPU as master.

This patch series based on renesas-devel and depend upon [2]

[1] https://github.com/renesas-rz/rz_linux-cip/blob/rzg2l-cip41/drivers/clk/clk-versaclock3.c

[2]https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=549985

Biju Das (4):
  arm64: dts: renesas: r9a07g044: Add DMA support to SSI
  arm64: dts: renesas: rzg2l-smarc: Add WM8978 sound codec
  arm64: dts: renesas: rzg2l-smarc: Enable audio
  arm64: dts: renesas: rzg2l-smarc: Add Mic routing

 arch/arm64/boot/dts/renesas/r9a07g044.dtsi   | 11 +++
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi | 79 ++++++++++++++++++++
 2 files changed, 90 insertions(+)

-- 
2.17.1

