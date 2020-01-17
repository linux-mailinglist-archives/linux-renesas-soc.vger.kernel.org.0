Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABD81140867
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jan 2020 11:54:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726479AbgAQKyJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jan 2020 05:54:09 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:3183 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726196AbgAQKyJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jan 2020 05:54:09 -0500
X-IronPort-AV: E=Sophos;i="5.70,329,1574089200"; 
   d="scan'208";a="36950902"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 17 Jan 2020 19:54:07 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 58E3440104E2;
        Fri, 17 Jan 2020 19:54:07 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        linux@prisktech.co.nz, robh+dt@kernel.org, mark.rutland@arm.com
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] usb: host: ehci-platform: add a quirk to avoid stuck
Date:   Fri, 17 Jan 2020 19:54:05 +0900
Message-Id: <1579258447-28135-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Since EHCI/OHCI controllers on R-Car Gen3 SoCs are possible to
be getting stuck very rarely after a full/low usb device was
disconnected. To detect/recover from such a situation, the controllers
require a special way which poll the EHCI PORTSC register and changes
the OHCI functional state.

So, this patch adds a polling timer into the ehci-platform driver,
and if the ehci driver detects the issue by the EHCI PORTSC register,
the ehci driver removes a companion device (= the OHCI controller)
to change the OHCI functional state to USB Reset once. And then,
the ehci driver adds the companion device again.

Yoshihiro Shimoda (2):
  dt-bindings: usb: generic-ehci: add a quirk property to avoid stuck
  usb: host: ehci-platform: add a quirk to avoid stuck

 .../devicetree/bindings/usb/generic-ehci.yaml      |   5 +
 drivers/usb/host/ehci-platform.c                   | 104 +++++++++++++++++++++
 2 files changed, 109 insertions(+)

-- 
2.7.4

