Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CA111F3A4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 14:16:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728305AbfEOMQi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 08:16:38 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:22171 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728056AbfEOMQg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 08:16:36 -0400
X-IronPort-AV: E=Sophos;i="5.60,472,1549897200"; 
   d="scan'208";a="15815950"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 15 May 2019 21:16:33 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 887D24003864;
        Wed, 15 May 2019 21:16:30 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v6 0/7] Add USB3.0 and TI HD3SS3220 driver support
Date:   Wed, 15 May 2019 13:09:05 +0100
Message-Id: <1557922152-16449-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This series adds USB 3.0 support for the CAT874 platform, including a
new driver for the TI HD3SS3220 USB Type-C DRP port controller.

This patch series supports:
1) Host hotplug operation
2) Device hot plug operation
3) USB type-C data_role switch
   (Tested with 2 RZ/G2E boards connected with a Type-C cable)

This patchset is based on linux_next next-20190514 branch.
V5-->V6
  * Updated bindings patch by using usb-role-switch property
  * Used graph api's to get role switch supported by the usb-c-connector
V4-->V5
  * Incorporated Heikki's review comment.
    (https://patchwork.kernel.org/patch/10902531/)
  * Patch 1 is a dependency patch to make the compilation successful.
    (https://patchwork.kernel.org/patch/10909971/)
  * Patch 2 is also dependency patch to make the compilation successful.
    Rebased on top of Patch1 and fixed Heikki's review comments
    (https://patchwork.kernel.org/patch/10882555/)
  * Incorporated Shimoda-San's review comment.
    (https://patchwork.kernel.org/patch/10902535/)
V3-->V4
  * Incorporated Chunfeng Yun's review comment
    (https://patchwork.kernel.org/project/linux-usb/list/?submitter=133171)
  * Used fwnode API's to get roleswitch handle

V2-->V3
  * Used the new API to usb_role_switch by node to find the remote endpoint
    (https://patchwork.kernel.org/patch/10882555/)
  * Added renesas,usb-role-switch property
  * Incorporated shimoda-san's review comment
    (https://patchwork.kernel.org/patch/10852507/)

V1-->V2
  * Use USB role class instead of extcon to receive connect and disconnect
    events and also for the dual role switch.
  * Dropped patch 6
  * Squashed patch 8 and patch 9
  * https://patchwork.kernel.org/cover/10840641/


Biju Das (7):
  dt-bindings: usb: hd3ss3220 device tree binding document
  dt-bindings: usb: renesas_usb3: Document usb role switch support
  usb: typec: driver for TI HD3SS3220 USB Type-C DRP port controller
  usb: gadget: udc: renesas_usb3: Add dual role switch support
  arm64: defconfig: enable TYPEC_HD3SS3220 config option
  arm64: dts: renesas: r8a774c0-cat874: Enable USB3.0 host/peripheral
    device node
  arm64: dts: renesas: r8a774c0-cat874: Enable usb role switch support

 .../devicetree/bindings/usb/renesas_usb3.txt       |  26 ++
 .../devicetree/bindings/usb/ti,hd3ss3220.txt       |  37 +++
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts    |  56 +++++
 arch/arm64/configs/defconfig                       |   2 +
 drivers/usb/gadget/udc/renesas_usb3.c              | 121 +++++++++-
 drivers/usb/typec/Kconfig                          |  10 +
 drivers/usb/typec/Makefile                         |   1 +
 drivers/usb/typec/hd3ss3220.c                      | 263 +++++++++++++++++++++
 8 files changed, 509 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
 create mode 100644 drivers/usb/typec/hd3ss3220.c

-- 
2.7.4

