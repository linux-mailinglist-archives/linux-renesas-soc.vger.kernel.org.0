Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5DA823D559
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Aug 2020 04:18:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbgHFCSf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Aug 2020 22:18:35 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38262 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726899AbgHFCSe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Aug 2020 22:18:34 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 53A4BDDF;
        Thu,  6 Aug 2020 04:18:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596680305;
        bh=hWXHDNBPEF2qXDz/4e1+eAg7VHFWlm82CFk6pV1qJ6Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pm9QgsuFDKRYUsZ/4t/UM/9eskesLVKMPo3PSp1KZnrLJUr0ogGC6NWJ1mqRVZDr4
         8M20OFgKGf5DNYPHfwziwfRoVjCaYNG8S7NjE98glzAZH9ZgvI4GF9Ta+fe9XCSWrT
         oceRC9I27UpUjWNXlFtiUF4P/rc8GtP4xCbiChqs=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [PATCH 5/8] pykmsbase: Add missing pixel formats
Date:   Thu,  6 Aug 2020 05:18:03 +0300
Message-Id: <20200806021807.21863-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200806021807.21863-1-laurent.pinchart@ideasonboard.com>
References: <20200806021807.21863-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Several pixel formats defined in the C++ PixelFormat class are missing
from the Python API. Add them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 py/pykms/pykmsbase.cpp | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/py/pykms/pykmsbase.cpp b/py/pykms/pykmsbase.cpp
index fc72d056627f..407b9485f556 100644
--- a/py/pykms/pykmsbase.cpp
+++ b/py/pykms/pykmsbase.cpp
@@ -186,14 +186,32 @@ void init_pykmsbase(py::module &m)
 
 			.value("XRGB8888", PixelFormat::XRGB8888)
 			.value("XBGR8888", PixelFormat::XBGR8888)
+			.value("RGBX8888", PixelFormat::RGBX8888)
+			.value("BGRX8888", PixelFormat::BGRX8888)
+
 			.value("ARGB8888", PixelFormat::ARGB8888)
 			.value("ABGR8888", PixelFormat::ABGR8888)
+			.value("RGBA8888", PixelFormat::RGBA8888)
+			.value("BGRA8888", PixelFormat::BGRA8888)
 
 			.value("RGB888", PixelFormat::RGB888)
 			.value("BGR888", PixelFormat::BGR888)
 
 			.value("RGB565", PixelFormat::RGB565)
 			.value("BGR565", PixelFormat::BGR565)
+
+			.value("ARGB4444", PixelFormat::ARGB4444)
+			.value("ARGB1555", PixelFormat::ARGB1555)
+
+			.value("XRGB2101010", PixelFormat::XRGB2101010)
+			.value("XBGR2101010", PixelFormat::XBGR2101010)
+			.value("RGBX1010102", PixelFormat::RGBX1010102)
+			.value("BGRX1010102", PixelFormat::BGRX1010102)
+
+			.value("ARGB2101010", PixelFormat::ARGB2101010)
+			.value("ABGR2101010", PixelFormat::ABGR2101010)
+			.value("RGBA1010102", PixelFormat::RGBA1010102)
+			.value("BGRA1010102", PixelFormat::BGRA1010102)
 			;
 
 	py::enum_<SyncPolarity>(m, "SyncPolarity")
-- 
Regards,

Laurent Pinchart

