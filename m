Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C137F23D551
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Aug 2020 04:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbgHFCS1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Aug 2020 22:18:27 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38248 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726718AbgHFCSZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Aug 2020 22:18:25 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5CE01560;
        Thu,  6 Aug 2020 04:18:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596680303;
        bh=Fyum/h78ZDwKaaks/79gTyBmIhysXtX9P1gJVEiigoE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mk4YemVLNsjXozm2O//sPJFKziXvEzZ9x66NqxP1Pst/EHVt83Ya6U/QeqCoZ4/uq
         ARM7/o7HEPEcbazRjPLHgJy8d45osWhwVQvOHM4CNKrlDJQaO5SmiXgWUb1YZW1HZd
         khDnGb3iZZ9QDbxvzfR0JJmdqTdkFfvAIVoix14s=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/8] card: Add a method to retrieve the device minor
Date:   Thu,  6 Aug 2020 05:17:59 +0300
Message-Id: <20200806021807.21863-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200806021807.21863-1-laurent.pinchart@ideasonboard.com>
References: <20200806021807.21863-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The device minor number is needed to access the debugfs directory
corresponding to the device. Make it available to users through a
get_minor() method on the Card object.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 kms++/inc/kms++/card.h |  3 +++
 kms++/src/card.cpp     | 11 +++++++++++
 py/pykms/pykmsbase.cpp |  1 +
 3 files changed, 15 insertions(+)

diff --git a/kms++/inc/kms++/card.h b/kms++/inc/kms++/card.h
index 5c1cf7cfcedc..0a11747f7985 100644
--- a/kms++/inc/kms++/card.h
+++ b/kms++/inc/kms++/card.h
@@ -35,6 +35,7 @@ public:
 	Card& operator=(const Card& other) = delete;
 
 	int fd() const { return m_fd; }
+	unsigned int dev_minor() const { return m_minor; }
 
 	void drop_master();
 
@@ -84,7 +85,9 @@ private:
 	std::vector<Framebuffer*> m_framebuffers;
 
 	int m_fd;
+	unsigned int m_minor;
 	bool m_is_master;
+	std::string m_device;
 
 	bool m_has_atomic;
 	bool m_has_universal_planes;
diff --git a/kms++/src/card.cpp b/kms++/src/card.cpp
index 527aca6cd127..3a7ab700ed49 100644
--- a/kms++/src/card.cpp
+++ b/kms++/src/card.cpp
@@ -9,6 +9,10 @@
 #include <algorithm>
 #include <glob.h>
 
+#include <sys/stat.h>
+#include <sys/sysmacros.h>
+#include <sys/types.h>
+
 #include <xf86drm.h>
 #include <xf86drmMode.h>
 
@@ -183,8 +187,15 @@ void Card::setup()
 	m_version.desc = string(ver->desc, ver->desc_len);
 	drmFreeVersion(ver);
 
+	struct stat stats;
 	int r;
 
+	r = fstat(m_fd, &stats);
+	if (r < 0)
+		throw invalid_argument("Can't stat device (" + string(strerror(errno)) + ")");
+
+	m_minor = minor(stats.st_dev);
+
 	r = drmSetMaster(m_fd);
 	m_is_master = r == 0;
 
diff --git a/py/pykms/pykmsbase.cpp b/py/pykms/pykmsbase.cpp
index c039833a41fb..fc72d056627f 100644
--- a/py/pykms/pykmsbase.cpp
+++ b/py/pykms/pykmsbase.cpp
@@ -24,6 +24,7 @@ void init_pykmsbase(py::module &m)
 			.def(py::init<const string&>())
 			.def(py::init<const string&, uint32_t>())
 			.def_property_readonly("fd", &Card::fd)
+			.def_property_readonly("minor", &Card::dev_minor)
 			.def_property_readonly("get_first_connected_connector", &Card::get_first_connected_connector)
 
 			// XXX pybind11 can't handle vector<T*> where T is non-copyable, and complains:
-- 
Regards,

Laurent Pinchart

