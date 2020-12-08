Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DADA82D2556
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Dec 2020 09:06:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727695AbgLHIEm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Dec 2020 03:04:42 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:50630 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725927AbgLHIEm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Dec 2020 03:04:42 -0500
X-IronPort-AV: E=Sophos;i="5.78,401,1599490800"; 
   d="scan'208";a="65020040"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 08 Dec 2020 17:04:10 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9F9A2422927B;
        Tue,  8 Dec 2020 17:04:10 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     marek.vasut+renesas@gmail.com, lee.jones@linaro.org
Cc:     khiem.nguyen.xt@renesas.com, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/3] mfd: bd9571mwv: Add support for BD9574MWF
Date:   Tue,  8 Dec 2020 17:04:00 +0900
Message-Id: <1607414643-25498-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add BD574MWF support into bd9571mwv mfd driver. Latest Ebisu-4D
boards has this chip instead of BD9571MWV so that we need this
patch.

Khiem Nguyen (2):
  mfd: bd9571mwv: Make the driver more generic
  mfd: bd9571mwv: Add support for BD9574MWF

Yoshihiro Shimoda (1):
  mfd: bd9571mwv: Use the SPDX license identifier

 drivers/mfd/bd9571mwv.c       | 149 +++++++++++++++++++++++++++++++++++++-----
 include/linux/mfd/bd9571mwv.h | 109 +++++++++++++++++++++++++++---
 2 files changed, 231 insertions(+), 27 deletions(-)

-- 
2.7.4

