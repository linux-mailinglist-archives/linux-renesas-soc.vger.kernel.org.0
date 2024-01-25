Return-Path: <linux-renesas-soc+bounces-1848-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEA683CCF4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jan 2024 20:55:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7440DB2390A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jan 2024 19:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A125F8472;
	Thu, 25 Jan 2024 19:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="cEm0SI7f"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBE41350D7
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jan 2024 19:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706212519; cv=none; b=GkQVXUam+Ot6LGgjC6Vagjt4pL8W/5q1ieFhoc0j10gJOzj31N+XFDPNMpS+B5+HBAs3SJIUWfZpuVbi5Io9qnVgsly816rjPi9jcz+YwdJ0GijyOzkqDfXge8geud+xDRb48XnFrQfFykoGC7DN6M5dvWnSH8EWMCjxG6s/YCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706212519; c=relaxed/simple;
	bh=tyGJPSdLLqL4ZqqIIV1A5m+kw+4O/iJFU53bNEEP28M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=R5pdz5/qpgojRP8nP72ZfjYlsu0pIaQTA0bmRID31zNRuLJgxtgoaDKtHMRXb2W+FczZQgx9bIMfM/7SE7nM3+iCtai2GS4PKcuh4C1dZ4kIXQm6ALqxC9Mj0rzI/oAWWnr6eR0KhpByEZn0HypqvVeBFa6JITtHZ8T5fL9ESVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=cEm0SI7f; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a33c91ca179so52927266b.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jan 2024 11:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1706212515; x=1706817315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yz97naasz57ghtKxH2RM1w/PN9uU/7we3O2M+hv9/1w=;
        b=cEm0SI7f68T1dh1C+yuY8BJ310jdtJ+0fcS9BNr26rIKim06/sdE3RzdVrq5zu0nRS
         xa4C92xy1LUTqyqa9Ktrr5N29os+utNiRDM/FX4TbNRhyYNj4rhC18BR1ouPkyh1oGLm
         sxsr8Vimq65Xu85XIo029kc8xVKlDh3dnqzCCerh7DgjlLM5f1qmluWPlt/xfVWidE24
         IY4AVQnT1mVHj52rxxhCxQ/E7yoZl4Fy13rD/B0e99Bgkr4dD0l5xPqCP1QG97HGBTqg
         RUQ/DE09YRvX4ddKtSbPbYfJosOA278At5h4WmcymGxYssZfrdAk03YtGv3sLre0nsDM
         R9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706212515; x=1706817315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yz97naasz57ghtKxH2RM1w/PN9uU/7we3O2M+hv9/1w=;
        b=eWpg8LUgmZ/9mK9E96y3cNqLgRjx5AZkVBt1ltRFp0cosH8kWJFLfKEumXHt7fdzRT
         LWrTYg62aWXm+ZaFJc1XpSGTynL7WWDpNU5KsJHUZJHeGPm5kfjR3zVf+nCSYCTScQIo
         d5X7IuMR3xl81AEtIVkbt1wtruXnwf6aC6LXW9bMZYHXVKekEUlMVoUvfHG3dwjYLjEg
         f6Z4Geo24LvnJ99z9MTMArCdcvMcxGfji7IxtKjW4z0bxDFihV434NN+t/rQKoi2i8/7
         mrAoxoUkUwb2ayTL/LRuyhxe+vSw2mVAxIIgTgGZCgnSR89zo+pQMh9nnNQW8dOsI04t
         n2PA==
X-Gm-Message-State: AOJu0YzbYf9LZSFsnXbUivEXj+lAC6M80uC1LVPHRVInxcAY5doQvTZJ
	kfuxdZI8dZGxgGU0gInNJ3jnXtg3NwOzKImvr79dpgbuHiSq14/YS2qL/6xhZyo=
X-Google-Smtp-Source: AGHT+IGsioElMK4m0rpxX+UtLukezKMQZyu84Omeyclfh7wfWC4t0/+Bv53Jwquvcrb42IMj7k/1vw==
X-Received: by 2002:a17:906:4117:b0:a28:f8d2:7897 with SMTP id j23-20020a170906411700b00a28f8d27897mr74983ejk.20.1706212514953;
        Thu, 25 Jan 2024 11:55:14 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id tj3-20020a170907c24300b00a2fde3a8097sm658042ejc.74.2024.01.25.11.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 11:55:14 -0800 (PST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] media: rcar-csi2: Move driver to renesas directory
Date: Thu, 25 Jan 2024 20:54:58 +0100
Message-ID: <20240125195458.960961-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The rcar-csi2 driver was added before the platform/renesas directory
existed and since it was used together in a pipeline with the rcar-vin
driver it was located together with it.

The rcar-isp driver can also be used together with the rcar-csi2 driver
in a pipeline that is terminated by the rcar-vin driver. However by the
time rcar-isp was added the platform/renesas directory existed so it was
added there.

To remove the confusion that the rcar-csi2 driver have code dependencies
on the rcar-vin driver move it to the same directory level as the
rcar-isp driver. This makes it clear they are three distinct drivers
that can be used together in a pipeline, but do not depend on each
other.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 MAINTAINERS                                      |  1 +
 drivers/media/platform/renesas/Kconfig           | 16 ++++++++++++++++
 drivers/media/platform/renesas/Makefile          |  1 +
 .../platform/renesas/{rcar-vin => }/rcar-csi2.c  |  0
 drivers/media/platform/renesas/rcar-vin/Kconfig  | 16 ----------------
 drivers/media/platform/renesas/rcar-vin/Makefile |  1 -
 6 files changed, 18 insertions(+), 17 deletions(-)
 rename drivers/media/platform/renesas/{rcar-vin => }/rcar-csi2.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 675e5d63a25b..ea49082ec3a0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13430,6 +13430,7 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/renesas,csi2.yaml
 F:	Documentation/devicetree/bindings/media/renesas,isp.yaml
 F:	Documentation/devicetree/bindings/media/renesas,vin.yaml
+F:	drivers/media/platform/renesas/rcar-csi2.c
 F:	drivers/media/platform/renesas/rcar-isp.c
 F:	drivers/media/platform/renesas/rcar-vin/
 
diff --git a/drivers/media/platform/renesas/Kconfig b/drivers/media/platform/renesas/Kconfig
index ed788e991f74..c7fc718a30a5 100644
--- a/drivers/media/platform/renesas/Kconfig
+++ b/drivers/media/platform/renesas/Kconfig
@@ -14,6 +14,22 @@ config VIDEO_RENESAS_CEU
 	help
 	  This is a v4l2 driver for the Renesas CEU Interface
 
+config VIDEO_RCAR_CSI2
+	tristate "R-Car MIPI CSI-2 Receiver"
+	depends on V4L_PLATFORM_DRIVERS
+	depends on VIDEO_DEV && OF
+	depends on ARCH_RENESAS || COMPILE_TEST
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
+	select RESET_CONTROLLER
+	select V4L2_FWNODE
+	help
+	  Support for Renesas R-Car MIPI CSI-2 receiver.
+	  Supports R-Car Gen3 and RZ/G2 SoCs.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called rcar-csi2.
+
 config VIDEO_RCAR_ISP
 	tristate "R-Car Image Signal Processor (ISP)"
 	depends on V4L_PLATFORM_DRIVERS
diff --git a/drivers/media/platform/renesas/Makefile b/drivers/media/platform/renesas/Makefile
index 55854e868887..50774a20330c 100644
--- a/drivers/media/platform/renesas/Makefile
+++ b/drivers/media/platform/renesas/Makefile
@@ -7,6 +7,7 @@ obj-y += rcar-vin/
 obj-y += rzg2l-cru/
 obj-y += vsp1/
 
+obj-$(CONFIG_VIDEO_RCAR_CSI2) += rcar-csi2.o
 obj-$(CONFIG_VIDEO_RCAR_DRIF) += rcar_drif.o
 obj-$(CONFIG_VIDEO_RCAR_ISP) += rcar-isp.o
 obj-$(CONFIG_VIDEO_RENESAS_CEU) += renesas-ceu.o
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
similarity index 100%
rename from drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
rename to drivers/media/platform/renesas/rcar-csi2.c
diff --git a/drivers/media/platform/renesas/rcar-vin/Kconfig b/drivers/media/platform/renesas/rcar-vin/Kconfig
index de55fe63d84c..2ec857ab83cb 100644
--- a/drivers/media/platform/renesas/rcar-vin/Kconfig
+++ b/drivers/media/platform/renesas/rcar-vin/Kconfig
@@ -1,20 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-config VIDEO_RCAR_CSI2
-	tristate "R-Car MIPI CSI-2 Receiver"
-	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_DEV && OF
-	depends on ARCH_RENESAS || COMPILE_TEST
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select RESET_CONTROLLER
-	select V4L2_FWNODE
-	help
-	  Support for Renesas R-Car MIPI CSI-2 receiver.
-	  Supports R-Car Gen3 and RZ/G2 SoCs.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called rcar-csi2.
-
 config VIDEO_RCAR_VIN
 	tristate "R-Car Video Input (VIN) Driver"
 	depends on V4L_PLATFORM_DRIVERS
diff --git a/drivers/media/platform/renesas/rcar-vin/Makefile b/drivers/media/platform/renesas/rcar-vin/Makefile
index 00d809f5d2c1..5938ad6290c8 100644
--- a/drivers/media/platform/renesas/rcar-vin/Makefile
+++ b/drivers/media/platform/renesas/rcar-vin/Makefile
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 rcar-vin-objs = rcar-core.o rcar-dma.o rcar-v4l2.o
 
-obj-$(CONFIG_VIDEO_RCAR_CSI2) += rcar-csi2.o
 obj-$(CONFIG_VIDEO_RCAR_VIN) += rcar-vin.o
-- 
2.43.0


