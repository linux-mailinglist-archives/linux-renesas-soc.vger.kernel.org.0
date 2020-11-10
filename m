Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D12F2AE45D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Nov 2020 00:48:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731657AbgKJXsc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Nov 2020 18:48:32 -0500
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:22933 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730254AbgKJXsc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Nov 2020 18:48:32 -0500
X-Halon-ID: 33a7446e-23af-11eb-954c-0050569116f7
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p4fca2458.dip0.t-ipconnect.de [79.202.36.88])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 33a7446e-23af-11eb-954c-0050569116f7;
        Wed, 11 Nov 2020 00:48:27 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/4] pinctrl: renesas: Add vin{4,5}_g8 pins
Date:   Wed, 11 Nov 2020 00:47:48 +0100
Message-Id: <20201110234752.52846-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

This series adds support for the vin{4,5}_g8 pins to R-Car r8a77951 (H3)
r8a7796 (M3-W), r8a77990 (E3) and r8a77965 (M3-N).

It is based on-top of v5.10-rc3.

Niklas Söderlund (4):
  pinctrl: renesas: r8a77951: Add vin{4,5}_g8 pins
  pinctrl: renesas: r8a7796: Add vin{4,5}_g8 pins
  pinctrl: renesas: r8a77990: Add vin{4,5}_g8 pins
  pinctrl: renesas: r8a77965: Add vin{4,5}_g8 pins

 drivers/pinctrl/renesas/pfc-r8a77951.c | 30 ++++++++++++++++++++++-
 drivers/pinctrl/renesas/pfc-r8a7796.c  | 30 ++++++++++++++++++++++-
 drivers/pinctrl/renesas/pfc-r8a77965.c | 34 +++++++++++++++++++++++++-
 drivers/pinctrl/renesas/pfc-r8a77990.c | 34 +++++++++++++++++++++++++-
 4 files changed, 124 insertions(+), 4 deletions(-)

-- 
2.29.2

