Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 030391105F2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2019 21:33:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727234AbfLCUdH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Dec 2019 15:33:07 -0500
Received: from sauhun.de ([88.99.104.3]:34596 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726567AbfLCUdH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Dec 2019 15:33:07 -0500
Received: from localhost (p54B33759.dip0.t-ipconnect.de [84.179.55.89])
        by pokefinder.org (Postfix) with ESMTPSA id 368242C020F;
        Tue,  3 Dec 2019 21:33:05 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 0/2] mmc: renesas_sdhi: add manual correction
Date:   Tue,  3 Dec 2019 21:32:58 +0100
Message-Id: <20191203203301.2202-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add manual tap correction because the automatic one fails for HS400 on
Gen3.

(Limited) testing on Renesas Salvator-XS with M3-N and H3 ES2.0. I want
to apply more testing before sending out the real versions. Yet, release
early...

Depends on this series:
[PATCH 0/5] mmc: renesas_sdhi: prepare for recent HS400 updates

A branch is here:
git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/sdhi/new_manual_calib


Takeshi Saito (1):
  mmc: renesas_sdhi: Add manual correction

Wolfram Sang (1):
  mmc: renesas_sdhi: enfore manual correction for Gen3

 drivers/mmc/host/renesas_sdhi.h      |  1 +
 drivers/mmc/host/renesas_sdhi_core.c | 68 +++++++++++++++++++++++-----
 2 files changed, 58 insertions(+), 11 deletions(-)

-- 
2.20.1

