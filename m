Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 204C42D5FA2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Dec 2020 16:29:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgLJP2W (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Dec 2020 10:28:22 -0500
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:1438 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389952AbgLJP2R (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 10:28:17 -0500
X-Halon-ID: 311f8fab-3afc-11eb-a542-005056917a89
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p4fca2458.dip0.t-ipconnect.de [79.202.36.88])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 311f8fab-3afc-11eb-a542-005056917a89;
        Thu, 10 Dec 2020 16:27:23 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 0/6] [PATCH 0/6] arm64: dts: renesas: Add TMU nodes
Date:   Thu, 10 Dec 2020 16:26:59 +0100
Message-Id: <20201210152705.1535156-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

Add TMU nodes to Renesas R-Car H3, M3-W, M3-W+, D3, M3-N and E3. I have
tested this on all but D3 and E3 SoCs which I do not have access to. I
tested by enabling all TMU nodes in DT and then used the kernel timer
selftests located in tools/testing/selftests/timers/

    - clocksource-switch.c
    - inconsistency-check.c
    - nanosleep.c

The test passes for all SoCs I have access to and I no reason to believe
it would not also work on D3 and E3.

Niklas Söderlund (6):
  arm64: dts: renesas: r8a77951: Add TMU nodes
  arm64: dts: renesas: r8a77960: Add TMU nodes
  arm64: dts: renesas: r8a77961: Add TMU nodes
  arm64: dts: renesas: r8a77965: Add TMU nodes
  arm64: dts: renesas: r8a77990: Add TMU nodes
  arm64: dts: renesas: r8a77995: Add TMU nodes

 arch/arm64/boot/dts/renesas/r8a77951.dtsi | 65 +++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 65 +++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 65 +++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 65 +++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 65 +++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 65 +++++++++++++++++++++++
 6 files changed, 390 insertions(+)

-- 
2.29.2

