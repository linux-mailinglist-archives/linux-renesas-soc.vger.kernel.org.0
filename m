Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 993A21937AD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2020 06:27:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726038AbgCZF07 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Mar 2020 01:26:59 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:46738 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725842AbgCZF07 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Mar 2020 01:26:59 -0400
X-IronPort-AV: E=Sophos;i="5.72,307,1580742000"; 
   d="scan'208";a="42883074"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 26 Mar 2020 14:26:58 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3F28D400A115;
        Thu, 26 Mar 2020 14:26:58 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org, robh+dt@kernel.org
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 0/3] dt-bindings: usb: add r8a77961 support
Date:   Thu, 26 Mar 2020 14:26:47 +0900
Message-Id: <1585200410-28841-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds USB 2.0/3.0 devices support for r8a77961
(R-Car M3-W+).

Changes from v1:
 - Update the comment of "renesas,xhci-r8a77961" for r8a77960.
 - Add Reviewed-by.
 https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=261191

Yoshihiro Shimoda (3):
  dt-bindings: usb: usb-xhci: add r8a77961 support
  dt-bindings: usb: renesas,usbhs: add r8a77961 support
  dt-bindings: usb: renesas,usb3-peri: add r8a77961 support

 Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml | 1 +
 Documentation/devicetree/bindings/usb/renesas,usbhs.yaml     | 1 +
 Documentation/devicetree/bindings/usb/usb-xhci.txt           | 3 ++-
 3 files changed, 4 insertions(+), 1 deletion(-)

-- 
2.7.4

