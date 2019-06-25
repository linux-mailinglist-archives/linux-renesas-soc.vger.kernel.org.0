Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D317522EC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2019 07:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728356AbfFYFjf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jun 2019 01:39:35 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:53837 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728311AbfFYFjf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jun 2019 01:39:35 -0400
X-IronPort-AV: E=Sophos;i="5.62,413,1554735600"; 
   d="scan'208";a="19607549"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 25 Jun 2019 14:39:32 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 5AAC240031EF;
        Tue, 25 Jun 2019 14:39:32 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 00/13] usb: renesas_usbhs: refactor this driver
Date:   Tue, 25 Jun 2019 14:38:44 +0900
Message-Id: <1561441137-3090-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series is based on Greg's usb.git / usb-next branch.

The previous code had redundant memory allocations so that
the code readability was not good. I believe this patch series
makes it better.

Yoshihiro Shimoda (13):
  usb: renesas_usbhs: revise the irq_vbus comments
  usb: renesas_usbhs: remove notify_hotplug callback
  usb: renesas_usbhs: move macros from mod.c to the mod.h
  usb: renesas_usbhs: Avoid to write platform_data's value
  usb: renesas_usbhs: Use a specific flag instead of type for multi_clks
  usb: renesas_usbhs: Remove type member from renesas_usbhs_driver_param
  usb: renesas_usbhs: Use dev_of_node macro instead of open coded
  usb: renesas_usbhs: Add has_new_pipe_configs flag
  usb: renesas_usbhs: Add struct device * declaration in usbhs_probe()
  usb: renesas_usbhs: move device tree properties parsing
  usb: renesas_usbhs: Add a common function for the .get_id
  usb: renesas_usbhs: Use renesas_usbhs_platform_info on
    of_device_id.data
  usb: renesas_usbhs: Use struct platform_callback pointer

 drivers/usb/renesas_usbhs/common.c     | 197 +++++++++++----------------------
 drivers/usb/renesas_usbhs/common.h     |  11 +-
 drivers/usb/renesas_usbhs/fifo.c       |   3 +-
 drivers/usb/renesas_usbhs/mod.c        |  23 ++--
 drivers/usb/renesas_usbhs/mod.h        |  26 ++++-
 drivers/usb/renesas_usbhs/mod_gadget.c |   7 +-
 drivers/usb/renesas_usbhs/rcar2.c      |  22 ++--
 drivers/usb/renesas_usbhs/rcar2.h      |   3 +-
 drivers/usb/renesas_usbhs/rcar3.c      |  33 ++++--
 drivers/usb/renesas_usbhs/rcar3.h      |   5 +-
 drivers/usb/renesas_usbhs/rza.c        |  18 +--
 drivers/usb/renesas_usbhs/rza.h        |   4 +-
 drivers/usb/renesas_usbhs/rza2.c       |  22 ++--
 include/linux/usb/renesas_usbhs.h      |  35 +-----
 14 files changed, 168 insertions(+), 241 deletions(-)

-- 
2.7.4

