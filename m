Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DA58356E6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2019 08:21:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbfFEGVW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jun 2019 02:21:22 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:7955 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726050AbfFEGVW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jun 2019 02:21:22 -0400
X-IronPort-AV: E=Sophos;i="5.60,550,1549897200"; 
   d="scan'208";a="17858262"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 05 Jun 2019 15:21:20 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1CD414005E37;
        Wed,  5 Jun 2019 15:21:20 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 0/2] usb: renesas_usbhs: remove unused features
Date:   Wed,  5 Jun 2019 15:16:20 +0900
Message-Id: <1559715382-28390-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series removes unused features of sudmac and controlling
PWEN/EXTLP.

Changes from v1 [1]:
 - Revise the commit log on both patch 1 and 2.
 - Remove an unused macro on patch 1.
 - Add Geert-san and Simon-san's Reviewed-by on both patch 1 and 2.

[1]
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=126687


Yoshihiro Shimoda (2):
  usb: renesas_usbhs: remove sudmac support
  usb: renesas_usbhs: remove controlling PWEN/EXTLP support

 drivers/usb/renesas_usbhs/common.c | 4 ----
 drivers/usb/renesas_usbhs/fifo.c   | 6 +-----
 include/linux/usb/renesas_usbhs.h  | 2 --
 3 files changed, 1 insertion(+), 11 deletions(-)

-- 
2.7.4

