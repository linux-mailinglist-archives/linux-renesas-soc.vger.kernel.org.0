Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 796EB1920F6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2020 07:18:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725909AbgCYGSb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Mar 2020 02:18:31 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:61892 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725832AbgCYGSa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Mar 2020 02:18:30 -0400
X-IronPort-AV: E=Sophos;i="5.72,303,1580742000"; 
   d="scan'208";a="42785379"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 25 Mar 2020 15:18:29 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id BA81A4000FAF;
        Wed, 25 Mar 2020 15:18:29 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     kishon@ti.com, robh+dt@kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] dt-bindings: phy: add r8a77961 support
Date:   Wed, 25 Mar 2020 15:18:18 +0900
Message-Id: <1585117100-8359-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds USBPHY 2.0/3.0 devices support for r8a77961
(R-Car M3-W+).

Yoshihiro Shimoda (2):
  dt-bindings: phy: rcar-gen3-phy-usb2: add r8a77961 support
  dt-bindings: phy: rcar-gen3-phy-usb3: add r8a77961 support

 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 2 ++
 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt | 2 ++
 2 files changed, 4 insertions(+)

-- 
2.7.4

