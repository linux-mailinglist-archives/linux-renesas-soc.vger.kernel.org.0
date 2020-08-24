Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49D4D24FF92
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Aug 2020 16:11:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726158AbgHXOLK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Aug 2020 10:11:10 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:2505 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725904AbgHXOLC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Aug 2020 10:11:02 -0400
X-IronPort-AV: E=Sophos;i="5.76,348,1592838000"; 
   d="scan'208";a="55383431"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 24 Aug 2020 23:10:58 +0900
Received: from localhost.localdomain (unknown [172.29.53.152])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1A0FE40031C8;
        Mon, 24 Aug 2020 23:10:55 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 0/5] Remodel HD3SS3220 device nodes
Date:   Mon, 24 Aug 2020 15:10:48 +0100
Message-Id: <20200824141053.5062-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Some platforms have only super speed data bus connected to HD3SS3220 device
and high speed data bus directly connected to the SoC. In such platforms
modelling connector as a child of this device is making it non compliant
with usb connector bindings. By modelling connector node as standalone
device node along with HD3SS3220 device and the SoC data bus will make it
compliant with usb connector bindings.

It is based on the below discussion threads

1) https://patchwork.kernel.org/patch/11669423/
2) https://patchwork.kernel.org/patch/11129567/

v2->v3
  * Added Heikkei's reviewed by tag
  * Incorporated Shimoda-san's review comments for binding patch.
    (https://patchwork.kernel.org/patch/11708831/)


Biju Das (4):
  dt-bindings: usb: renesas,usb3-peri: Document HS and SS data bus
  usb: typec: hd3ss3220: Use OF graph API to get the connector fwnode
  arm64: dts: renesas: cat874: Move connector node out of hd3ss3220
    device
  arm64: dts: renesas: beacon-renesom-baseboard: Move connector node out
    of hd3ss3220 device

Lad Prabhakar (1):
  dt-bindings: usb: convert ti,hd3ss3220 bindings to json-schema

 .../bindings/usb/renesas,usb3-peri.yaml       | 34 ++++++--
 .../devicetree/bindings/usb/ti,hd3ss3220.txt  | 38 ---------
 .../devicetree/bindings/usb/ti,hd3ss3220.yaml | 81 +++++++++++++++++++
 .../dts/renesas/beacon-renesom-baseboard.dtsi | 67 +++++++++++----
 .../boot/dts/renesas/r8a774c0-cat874.dts      | 67 +++++++++++----
 drivers/usb/typec/hd3ss3220.c                 | 18 ++++-
 6 files changed, 224 insertions(+), 81 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
 create mode 100644 Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml

-- 
2.17.1

