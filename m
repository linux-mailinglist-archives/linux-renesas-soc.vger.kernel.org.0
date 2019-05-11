Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C9901A97D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 May 2019 23:07:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbfEKVHf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 May 2019 17:07:35 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58288 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbfEKVHf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 May 2019 17:07:35 -0400
Received: from pendragon.bb.dnainternet.fi (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 16EB9529;
        Sat, 11 May 2019 23:07:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1557608852;
        bh=Vy6ECXUHgTnstWUXdhj+axgJ3SeJtey0vjQ8XV95J84=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NHbBWE3nFg0brkDS5AqeO6ris9pXWZPrvmblVr9+22uVqvdqYTMwA8NatQB+a2mEI
         9EPmRJQLkIu5A5cwrZXQeBEbDMrNDqOTICfGbuQT8OUjAjRoeDjW83T5LMvT4G5WXr
         WGGh6NLx1+IIy4a3JYASe4EtgmjHI+oj7bRX6CkE=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        devicetree@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2 02/10] dt-bindings: display: bridge: thc63lvd1024: Document dual-link operation
Date:   Sun, 12 May 2019 00:06:54 +0300
Message-Id: <20190511210702.18394-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
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

