Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 401282699C5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Sep 2020 01:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbgINXio (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Sep 2020 19:38:44 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:16112 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725994AbgINXio (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Sep 2020 19:38:44 -0400
X-Halon-ID: 4580f4c3-f6e3-11ea-b48b-0050569116f7
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac52a8.dip0.t-ipconnect.de [84.172.82.168])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 4580f4c3-f6e3-11ea-b48b-0050569116f7;
        Tue, 15 Sep 2020 01:37:48 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/4] pinctrl: sh-pfc: Add VIN stf8 pins
Date:   Tue, 15 Sep 2020 01:37:40 +0200
Message-Id: <20200914233744.468175-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

This series upports pinctrl configuration for VIN4 and VIN5 SFT8 pins 
from the Renesas BSP. All patches are are based on work from Takeshi 
Kihara.

Niklas Söderlund (2):
  pinctrl: sh-pfc: r8a77990: Add VIN stf8 pins
  pinctrl: sh-pfc: r8a77965: Add VIN stf8 pins

Takeshi Kihara (2):
  pinctrl: sh-pfc: r8a77951: Add VIN pins, groups and functions
  pinctrl: sh-pfc: r8a7796: Add VIN pins, groups and functions

 drivers/pinctrl/sh-pfc/pfc-r8a77951.c | 28 +++++++++++++++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c  | 28 +++++++++++++++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c | 32 +++++++++++++++++++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 32 +++++++++++++++++++++++++++
 4 files changed, 120 insertions(+)

-- 
2.28.0

