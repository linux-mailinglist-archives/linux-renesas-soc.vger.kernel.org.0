Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5F459E53B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2019 12:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728802AbfH0KDu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Aug 2019 06:03:50 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:27292 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727788AbfH0KDu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Aug 2019 06:03:50 -0400
X-IronPort-AV: E=Sophos;i="5.64,436,1559487600"; 
   d="scan'208";a="25044201"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 27 Aug 2019 19:03:47 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B3DD640061AA;
        Tue, 27 Aug 2019 19:03:47 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/4] usb: host: xhci-{plat,rcar}: clean up and add a workaround
Date:   Tue, 27 Aug 2019 19:02:03 +0900
Message-Id: <1566900127-11148-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series is based on the latest Greg's linux-usb.git /
usb-next branch.

From patch 1 to 3 are clean-up patches and patch 4 is adding
a workaround code for a specific condition. So, I don't think
the patch 4 is not a fixed patch.

Yoshihiro Shimoda (4):
  usb: host: xhci-plat: add quirks member into struct xhci_plat_priv
  usb: host: xhci-rcar: Add a helper macro to set xhci_plat_priv
  usb: host: xhci-rcar: Use xhci_plat_priv.quirks instead of code
    settings
  usb: host: xhci-rcar: avoid 60s wait by request_firmware() in system
    booting

 drivers/usb/host/xhci-plat.c | 14 +++++---------
 drivers/usb/host/xhci-plat.h |  2 ++
 drivers/usb/host/xhci-rcar.c | 34 +++++-----------------------------
 drivers/usb/host/xhci-rcar.h | 21 +++++++++++++++++++++
 4 files changed, 33 insertions(+), 38 deletions(-)

-- 
2.7.4

