Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26E833312BA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Mar 2021 17:01:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229893AbhCHQA4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Mar 2021 11:00:56 -0500
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:43453 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229737AbhCHQAg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Mar 2021 11:00:36 -0500
X-Halon-ID: 657a1b85-8027-11eb-a542-005056917a89
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de [84.172.85.33])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 657a1b85-8027-11eb-a542-005056917a89;
        Mon, 08 Mar 2021 17:00:30 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 0/4] pinctrl: renesas: Add vin{4,5}_high8 pins
Date:   Mon,  8 Mar 2021 16:59:38 +0100
Message-Id: <20210308155942.1733341-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

This series adds support for the vin{4,5}_high8 pins to R-Car r8a77951 (H3)
r8a7796 (M3-W), r8a77990 (E3) and r8a77965 (M3-N).

It is tested on-top of v5.12-rc2.

Niklas Söderlund (4):
  pinctrl: renesas: r8a77951: Add vin{4,5}_high8 pins
  pinctrl: renesas: r8a7796: Add vin{4,5}_high8 pins
  pinctrl: renesas: r8a77990: Add vin{4,5}_high8 pins
  pinctrl: renesas: r8a77965: Add vin{4,5}_high8 pins

 drivers/pinctrl/renesas/pfc-r8a77951.c | 30 ++++++++++++++++++++++-
 drivers/pinctrl/renesas/pfc-r8a7796.c  | 30 ++++++++++++++++++++++-
 drivers/pinctrl/renesas/pfc-r8a77965.c | 34 +++++++++++++++++++++++++-
 drivers/pinctrl/renesas/pfc-r8a77990.c | 34 +++++++++++++++++++++++++-
 4 files changed, 124 insertions(+), 4 deletions(-)

-- 
2.30.1

