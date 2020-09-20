Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13EE427149A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Sep 2020 15:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbgITNtL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Sep 2020 09:49:11 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:8429 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726305AbgITNtL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Sep 2020 09:49:11 -0400
X-IronPort-AV: E=Sophos;i="5.77,282,1596466800"; 
   d="scan'208";a="57728978"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 20 Sep 2020 22:49:08 +0900
Received: from localhost.localdomain (unknown [172.29.52.129])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 03F5140078C5;
        Sun, 20 Sep 2020 22:49:05 +0900 (JST)
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
Subject: [PATCH v4 0/6] Remodel HD3SS3220 device nodes
Date:   Sun, 20 Sep 2020 14:48:59 +0100
Message-Id: <20200920134905.4370-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
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

V3->V4
  * Updated connector and ti,hd3ss3220 as per Rob's suggestion
  * Added Rb tags.

Biju Das (5):
  dt-bindings: update usb-c-connector example
  dt-bindings: usb: renesas,usb3-peri: Document HS and SS data bus
  usb: typec: hd3ss3220: Use OF graph API to get the connector fwnode
  arm64: dts: renesas: cat874: Move connector node out of hd3ss3220
    device
  arm64: dts: renesas: beacon-renesom-baseboard: Move connector node out
    of hd3ss3220 device

Lad Prabhakar (1):
  dt-bindings: usb: convert ti,hd3ss3220 bindings to json-schema

 .../bindings/connector/usb-connector.yaml     | 30 ++++++-
 .../bindings/usb/renesas,usb3-peri.yaml       | 34 ++++++--
 .../devicetree/bindings/usb/ti,hd3ss3220.txt  | 38 ---------
 .../devicetree/bindings/usb/ti,hd3ss3220.yaml | 82 +++++++++++++++++++
 .../dts/renesas/beacon-renesom-baseboard.dtsi | 67 +++++++++++----
 .../boot/dts/renesas/r8a774c0-cat874.dts      | 67 +++++++++++----
 drivers/usb/typec/hd3ss3220.c                 | 18 +++-
 7 files changed, 254 insertions(+), 82 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
 create mode 100644 Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml

-- 
2.17.1

