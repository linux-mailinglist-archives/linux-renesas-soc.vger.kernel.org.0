Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF04D1937CC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2020 06:29:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbgCZF32 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Mar 2020 01:29:28 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:11387 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726210AbgCZF32 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Mar 2020 01:29:28 -0400
X-IronPort-AV: E=Sophos;i="5.72,307,1580742000"; 
   d="scan'208";a="42883296"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 26 Mar 2020 14:29:27 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 21BD640083FB;
        Thu, 26 Mar 2020 14:29:27 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     kishon@ti.com, robh+dt@kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 0/4] dt-bindings: phy: add r8a77961 support
Date:   Thu, 26 Mar 2020 14:29:15 +0900
Message-Id: <1585200559-30033-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds USBPHY 2.0/3.0 devices support for r8a77961
(R-Car M3-W+).

Changes from v1:
 - Rebase these patches on top of my patches of convert bindings to
   json-schema.
 - Add Reviewed-by.
 https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=261195

Yoshihiro Shimoda (4):
  dt-bindings: phy: renesas: usb2-phy: convert bindings to json-schema
  dt-bindings: phy: renesas: usb2-phy: add r8a77961 support
  dt-bindings: phy: renesas: usb3-phy: convert bindings to json-schema
  dt-bindings: phy: renesas: usb3-phy: add r8a77961 support

 .../devicetree/bindings/phy/rcar-gen3-phy-usb2.txt |  70 --------------
 .../devicetree/bindings/phy/rcar-gen3-phy-usb3.txt |  52 -----------
 .../devicetree/bindings/phy/renesas,usb2-phy.yaml  | 104 +++++++++++++++++++++
 .../devicetree/bindings/phy/renesas,usb3-phy.yaml  |  79 ++++++++++++++++
 4 files changed, 183 insertions(+), 122 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
 delete mode 100644 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt
 create mode 100644 Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/renesas,usb3-phy.yaml

-- 
2.7.4

