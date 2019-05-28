Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 850372C870
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2019 16:13:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbfE1ONW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 May 2019 10:13:22 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48942 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726532AbfE1ONW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 May 2019 10:13:22 -0400
Received: from pendragon.ideasonboard.com (85-76-65-42-nat.elisa-mobile.fi [85.76.65.42])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 344FEFA6;
        Tue, 28 May 2019 16:13:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559052800;
        bh=FZ8tKX+2q1d7L1Zf9S1cHwyrJV63lrUPbAQjyzA0qCM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aNM9B/r3o8jlujv6PAOrZvBaBXBTZ8opUqlV39Ib12AX0LOO1LHAxLOu/Z7Hsto+g
         4E6rljwJSYmIHP2WqiY5hfMbs6flW402kSN8r2+JJXgW1rNLbuYoV8bp7nLl/JesDJ
         4ys2tgvHOXKGJtbZ0nIXpFg/KaP+0+FTitmI9fXs=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        devicetree@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v3 04/10] dt-bindings: display: renesas: lvds: Add renesas,companion property
Date:   Tue, 28 May 2019 17:12:28 +0300
Message-Id: <20190528141234.15425-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a new optional renesas,companion property to point to the companion
LVDS encoder. This is used to support dual-link operation where the main
LVDS encoder splits even-numbered and odd-numbered pixels between the
two LVDS encoders.

The new property doesn't control the mode of operation, it only
describes the relationship between the master and companion LVDS
encoders.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
Changes since v2:

- Clarify when the companion property is required or not allowed

Changes since v1:

- Fixed typo
---
 .../devicetree/bindings/display/bridge/renesas,lvds.txt    | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
index 900a884ad9f5..2d24bd8cbec5 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
@@ -45,6 +45,13 @@ OF graph bindings specified in Documentation/devicetree/bindings/graph.txt.
 
 Each port shall have a single endpoint.
 
+Optional properties:
+
+- renesas,companion : phandle to the companion LVDS encoder. This property is
+  mandatory for the first LVDS encoder on D3 and E3 SoCs, and shall point to
+  the second encoder to be used as a companion in dual-link mode. It shall not
+  be set for any other LVDS encoder.
+
 
 Example:
 
-- 
Regards,

Laurent Pinchart

