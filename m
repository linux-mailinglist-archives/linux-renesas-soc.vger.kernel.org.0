Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A3313A036
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Jun 2019 16:13:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726984AbfFHONC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 8 Jun 2019 10:13:02 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39402 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbfFHONC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 8 Jun 2019 10:13:02 -0400
Received: from localhost.localdomain (unknown [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4326E5D;
        Sat,  8 Jun 2019 16:13:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560003180;
        bh=X2/JVVfXS1x08ZUXukgr/dKfXIosmPbD2c0O9DtaWNY=;
        h=From:To:Cc:Subject:Date:From;
        b=MpXZEqat3Q/YlVPEkXLNlr5/+tUHYld3Sy+Z+l/tR8Zyf04EjjNJ+TqFJgCDDTohj
         AQqRKjMnSmJUblDYJZ0FlXI321jaL/IgRgkPMABQCvHLyIH7s5ejypFWMSYmjQfG32
         3V+bKOO8rBR6/oj0kseU0P0WIEsMe0kzuiLLIqOE=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] drm: panels: Add MAINTAINERS entry for LVDS panel driver
Date:   Sat,  8 Jun 2019 17:12:41 +0300
Message-Id: <20190608141242.17461-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As the DRM LVDS panel driver uses a different approach to DT bindings
compared to what Thierry Reding advocates, add a specific MAINTAINERS
entry to avoid bothering Thierry with requests related to that driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7a2f487ea49a..713733afec17 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5021,6 +5021,14 @@ S:	Orphan / Obsolete
 F:	drivers/gpu/drm/i810/
 F:	include/uapi/drm/i810_drm.h
 
+DRM DRIVER FOR LVDS PANELS
+M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+L:	dri-devel@lists.freedesktop.org
+T:	git git://anongit.freedesktop.org/drm/drm
+S:	Maintained
+F:	drivers/gpu/drm/panel/panel-lvds.c
+F:	Documentation/devicetree/bindings/display/panel/panel-lvds.txt
+
 DRM DRIVER FOR MATROX G200/G400 GRAPHICS CARDS
 S:	Orphan / Obsolete
 F:	drivers/gpu/drm/mga/
-- 
Regards,

Laurent Pinchart

