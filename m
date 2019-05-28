Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F212B2C868
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2019 16:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbfE1ONM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 May 2019 10:13:12 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48914 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726527AbfE1ONM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 May 2019 10:13:12 -0400
Received: from pendragon.ideasonboard.com (85-76-65-42-nat.elisa-mobile.fi [85.76.65.42])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E6D241024;
        Tue, 28 May 2019 16:13:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559052790;
        bh=uxSKNF3gEBehUg5UIQtYDqVcSvaWhkUaJDkom4F628U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QE8l6dgEZX8QMJY65XRbsHA1hCn82GUAFlnlyz9gIdRv1cdVNmDqt39R47JqZMO2i
         mlgfUsjmqZh1oo98L6K7ORbHOEDZkDp/DYYj88ZWdjlRFWMEMuJUhs53FXCcla8t87
         zXWPjGZFBFIp7NSaPkIfQArgR2XggoRA3pyXFqnM=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 02/10] dt-bindings: display: bridge: thc63lvd1024: Document dual-link operation
Date:   Tue, 28 May 2019 17:12:26 +0300
Message-Id: <20190528141234.15425-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The THC63LVD1024 LVDS decoder can operate in two modes, single-link or
dual-link. In dual-link mode both input ports are used to carry even-
and odd-numbered pixels separately. Document this in the DT bindings,
along with the related rules governing port and usage.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 .../bindings/display/bridge/thine,thc63lvd1024.txt          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
index 37f0c04d5a28..d17d1e5820d7 100644
--- a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
+++ b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
@@ -28,6 +28,12 @@ Optional video port nodes:
 - port@1: Second LVDS input port
 - port@3: Second digital CMOS/TTL parallel output
 
+The device can operate in single-link mode or dual-link mode. In single-link
+mode, all pixels are received on port@0, and port@1 shall not contain any
+endpoint. In dual-link mode, even-numbered pixels are received on port@0 and
+odd-numbered pixels on port@1, and both port@0 and port@1 shall contain
+endpoints.
+
 Example:
 --------
 
-- 
Regards,

Laurent Pinchart

