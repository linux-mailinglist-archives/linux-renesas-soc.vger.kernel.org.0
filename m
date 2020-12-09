Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0671D2D4B44
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Dec 2020 21:09:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbgLIUJX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Dec 2020 15:09:23 -0500
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:22065 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726439AbgLIUJX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Dec 2020 15:09:23 -0500
X-Halon-ID: 50d946f7-3a5a-11eb-a542-005056917a89
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p4fca2458.dip0.t-ipconnect.de [79.202.36.88])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 50d946f7-3a5a-11eb-a542-005056917a89;
        Wed, 09 Dec 2020 21:08:42 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] arm64: dts: renesas: r8a7796{1,5}: Add CMT nodes
Date:   Wed,  9 Dec 2020 21:07:36 +0100
Message-Id: <20201209200738.811173-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

Add CMT nodes to Renesas R-Car M3-W+ and D3 that for unknown reasons are 
missing these nodes. I only have access to the M3-W+ and I have tested 
this series on this (and H3, M3-W, M3-) by enabling all CMT nodes in DT 
and then using the kernel timer selftests located in
tools/testing/selftests/timers/

    - clocksource-switch.c
    - inconsistency-check.c
    - nanosleep.c

And if the fix for a deadlock race when switching clocksource [1] also 
is present the test pass on all SoCs mentioned above that I have access 
to. I have no reason to believe it would not also work on D3.

1. [PATCH 0/2] timekeeping: Fix change_clocksource() for PM and sh_cmt

Niklas Söderlund (2):
  arm64: dts: renesas: r8a77961: Add CMT nodes
  arm64: dts: renesas: r8a77995: Add CMT nodes

 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 70 +++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 70 +++++++++++++++++++++++
 2 files changed, 140 insertions(+)

-- 
2.29.2

