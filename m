Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E19B1A981
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 May 2019 23:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726360AbfEKVHh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 May 2019 17:07:37 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58288 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbfEKVHh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 May 2019 17:07:37 -0400
Received: from pendragon.bb.dnainternet.fi (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 233C5587;
        Sat, 11 May 2019 23:07:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1557608853;
        bh=C42ViQQj+3BvDs8mfpAj5KQh4LmMJlp09KTfcFjJpSw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iYPtkkeornhkS4/kPUi7ChxtpUmbrMP4Z/90A9MMX58sCGawnoyc7KAh/7P1Ykvwp
         YF2AjSb3pEiFxRuLfDJn+v2sctjWhB4cQvYmhc431wCO/5fktIqpS61Hjo5OOriaG4
         Zo+lW0JlSZpXXjRQMptw4mbxDk7jkYJ8Uo+ETu4U=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        devicetree@vger.kernel.org
Subject: [PATCH v2 04/10] dt-bindings: display: renesas: lvds: Add renesas,companion property
Date:   Sun, 12 May 2019 00:06:56 +0300
Message-Id: <20190511210702.18394-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
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
---
Changes since v1:

- Fixed typo
---
 .../devicetree/bindings/display/bridge/renesas,lvds.txt     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
index 900a884ad9f5..f2cc01d54cbd 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
@@ -45,6 +45,12 @@ OF graph bindings specified in Documentation/devicetree/bindings/graph.txt.
 
 Each port shall have a single endpoint.
 
+Optional properties:
+
+- renesas,companion : phandle to the companion LVDS encoder. This property is
+  valid for the first LVDS encoder on D3 and E3 SoCs only, and points to the
+  second encoder to be used as a companion in dual-link mode.
+
 
 Example:
 
-- 
Regards,

Laurent Pinchart

