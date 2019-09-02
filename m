Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A721AA5575
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Sep 2019 14:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731242AbfIBMD1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Sep 2019 08:03:27 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:20903 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731194AbfIBMD1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Sep 2019 08:03:27 -0400
X-IronPort-AV: E=Sophos;i="5.64,459,1559487600"; 
   d="scan'208";a="25536223"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 02 Sep 2019 21:03:25 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7A4A84005160;
        Mon,  2 Sep 2019 21:03:25 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 0/3] usb: host: xhci-{plat,rcar}: clean up the drivers
Date:   Mon,  2 Sep 2019 21:01:35 +0900
Message-Id: <1567425698-27560-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series is based on the latest Greg's linux-usb.git /
usb-next branch.

Changes from v1:
 - Rebase today's usb-next branch.
 - Remove 4/4 patch (because I need more time to investigate how to fix it).
 - Add Geert-san's Reviewed-by from patch 1/3 to 3/3.
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=165847


Yoshihiro Shimoda (3):
  usb: host: xhci-plat: add quirks member into struct xhci_plat_priv
  usb: host: xhci-rcar: Add a helper macro to set xhci_plat_priv
  usb: host: xhci-rcar: Use xhci_plat_priv.quirks instead of code
    settings

 drivers/usb/host/xhci-plat.c | 14 +++++---------
 drivers/usb/host/xhci-plat.h |  2 ++
 drivers/usb/host/xhci-rcar.c | 28 ----------------------------
 drivers/usb/host/xhci-rcar.h | 21 +++++++++++++++++++++
 4 files changed, 28 insertions(+), 37 deletions(-)

-- 
2.7.4

