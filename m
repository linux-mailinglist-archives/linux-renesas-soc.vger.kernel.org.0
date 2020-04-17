Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D9AC1AD83C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2020 10:07:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729648AbgDQIHP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Apr 2020 04:07:15 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:14228 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729588AbgDQIHP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Apr 2020 04:07:15 -0400
X-IronPort-AV: E=Sophos;i="5.72,394,1580742000"; 
   d="scan'208";a="44991437"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 17 Apr 2020 17:07:14 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1A8FC41F2116;
        Fri, 17 Apr 2020 17:07:14 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     vkoul@kernel.org, robh+dt@kernel.org
Cc:     dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 0/2] dt-bindings: dma: renesas,{rcar,usb}-dmac: convert to json-schema
Date:   Fri, 17 Apr 2020 17:07:07 +0900
Message-Id: <1587110829-26609-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series converts rcar-dmac and usb-dmac documantation to
json-schema.

Changes from v2:
 - Fix some properties (take 2) on patch 2/2.
 https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=272511

Changes from v1:
 - Add power-domains and resets to required.
 - Fix some properties about related dma channels on patch 2/2.
 - Add Reviewed-by on patch 1/2.
 https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=269169

Yoshihiro Shimoda (2):
  dt-bindings: dma: renesas,rcar-dmac: convert bindings to json-schema
  dt-bindings: dma: renesas,usb-dmac: convert bindings to json-schema

 .../devicetree/bindings/dma/renesas,rcar-dmac.txt  | 117 ----------------
 .../devicetree/bindings/dma/renesas,rcar-dmac.yaml | 150 +++++++++++++++++++++
 .../devicetree/bindings/dma/renesas,usb-dmac.txt   |  55 --------
 .../devicetree/bindings/dma/renesas,usb-dmac.yaml  | 102 ++++++++++++++
 4 files changed, 252 insertions(+), 172 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
 create mode 100644 Documentation/devicetree/bindings/dma/renesas,rcar-dmac.yaml
 delete mode 100644 Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt
 create mode 100644 Documentation/devicetree/bindings/dma/renesas,usb-dmac.yaml

-- 
2.7.4

