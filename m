Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5DCB122A4F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2019 12:40:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727397AbfLQLkp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Dec 2019 06:40:45 -0500
Received: from sauhun.de ([88.99.104.3]:52166 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726275AbfLQLko (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Dec 2019 06:40:44 -0500
Received: from localhost (p54B330AA.dip0.t-ipconnect.de [84.179.48.170])
        by pokefinder.org (Postfix) with ESMTPSA id 8B0EA2C06A5;
        Tue, 17 Dec 2019 12:40:42 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH v2 0/5] mmc: renesas_sdhi: add manual correction
Date:   Tue, 17 Dec 2019 12:40:29 +0100
Message-Id: <20191217114034.13290-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add manual tap correction because the automatic one fails for HS400 on
Gen3.

Changes since RFC v1:

* rebased to mmc/next
* added review tags from Shimoda-san
* fixed "enforce" in one commit message (Thanks Geert!)
* new patch 3/5: I think it makes sense to incorporate this patch from
  the BSP here already because it enhances manual correction. It could
  be argued if it should be merged with 2/5, yet for easier review I
  left it seperate for now
* new patch 5/5: a cleanup I came up with while working on 3/5.

I kept all tap_related variables 'unsigned long' for now. Geert has a
point that some of them could be changed to 'unsigned int'. I'd like to
leave this as a seperate issue, though, once we dealt with the other
HS400 issues. (Yes, more patches coming...)

I did some more testing but with my environment here, I hardly see taps
changing. What I see is that with HS400 RVSERR is regularly set but
SMPCMP is all cleared. So, this series maybe saves some unneeded tuning
for me. But I think the relevant cases are created in a lab, so some
more testing would be much appreciated. We definately want to wait for
Shimoda-san's comments before applying this.

This series depends on mmc/next because of this other series:
[PATCH 0/5] mmc: renesas_sdhi: prepare for recent HS400 updates

A branch is here:
git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/sdhi/new_manual_calib

Kind regards,

   Wolfram


Takeshi Saito (2):
  mmc: renesas_sdhi: Add manual correction
  mmc: renesas_sdhi: only check CMD status for HS400 manual correction

Wolfram Sang (3):
  mmc: renesas_sdhi: remove double clear of automatic correction
  mmc: renesas_sdhi: enforce manual correction for Gen3
  mmc: renesas_sdhi: cleanup SCC defines

 drivers/mmc/host/renesas_sdhi.h      |   1 +
 drivers/mmc/host/renesas_sdhi_core.c | 104 ++++++++++++++++++++++-----
 2 files changed, 86 insertions(+), 19 deletions(-)

-- 
2.20.1

