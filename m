Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5C05332466
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Mar 2021 12:50:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbhCILuD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Mar 2021 06:50:03 -0500
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:12833 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229799AbhCILtw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Mar 2021 06:49:52 -0500
X-Halon-ID: 88e7dc6b-80cd-11eb-a076-005056917f90
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de [84.172.85.33])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 88e7dc6b-80cd-11eb-a076-005056917f90;
        Tue, 09 Mar 2021 12:49:50 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 0/4] pinctrl: renesas: Add vin4_g8 and vin5_high8 pins
Date:   Tue,  9 Mar 2021 12:49:26 +0100
Message-Id: <20210309114930.2433711-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

This series adds support for the vin4_g8 and vin5_high8 pins to R-Car 
r8a77951 (H3) r8a7796 (M3-W), r8a77990 (E3) and r8a77965 (M3-N).

It is tested on-top of v5.12-rc2.

Niklas Söderlund (4):
  pinctrl: renesas: r8a77951: Add vin4_g8 and vin5_high8 pins
  pinctrl: renesas: r8a7796: Add vin4_g8 and vin5_high8 pins
  pinctrl: renesas: r8a77990: Add vin4_g8 and vin5_high8 pins
  pinctrl: renesas: r8a77965: Add vin4_g8 and vin5_high8 pins

 drivers/pinctrl/renesas/pfc-r8a77951.c | 30 ++++++++++++++++++++++-
 drivers/pinctrl/renesas/pfc-r8a7796.c  | 30 ++++++++++++++++++++++-
 drivers/pinctrl/renesas/pfc-r8a77965.c | 34 +++++++++++++++++++++++++-
 drivers/pinctrl/renesas/pfc-r8a77990.c | 34 +++++++++++++++++++++++++-
 4 files changed, 124 insertions(+), 4 deletions(-)

-- 
2.30.1

