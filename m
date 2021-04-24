Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47ED4369EA7
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 Apr 2021 05:46:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233084AbhDXDrd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Apr 2021 23:47:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232155AbhDXDrd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Apr 2021 23:47:33 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 885C2C061574;
        Fri, 23 Apr 2021 20:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=FxgtYpB8VTPXivQMswCaKcl2h1MJ9Tet6FGK833n5NE=; b=Kx/fI5NZ5bIK1dVhyPo+mBGltr
        oQMQY1mUnbLjxT7C00AYIxQFDEKd/Esxh0ppFj+DfF+fhl2cqT3aIt2Z2aLr4+QVy5EeonuptP7/P
        KQeyWyspBwzTB4Jm3jbI9FicQ6zP317djEflR9BXa9Cwg9PzLRrBUQRyPUejKdNVWoyg64YKPusmn
        BfY/O4i4PMP2sOe9vmhntVLdsrWCb8MKPsGk8l70c/mTDmZmQi7WWIH7EimrDjEpJ7ix1lsjWykIf
        IVATJ9ogrBFa4RNm9yo0gV3V+89DOhShRElsAeDxsbXmV09ebrKIle2BSqe/SUAcEX3HDgcMq2pU3
        0R28pf+g==;
Received: from [2601:1c0:6280:3f0::df68] (helo=smtpauth.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1la9Fe-002gjB-Ac; Sat, 24 Apr 2021 03:46:41 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        David Airlie <airlied@linux.ie>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v3] drm: rcar: unbreak the R-Car menu items
Date:   Fri, 23 Apr 2021 20:46:32 -0700
Message-Id: <20210424034632.5531-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

DRM_RCAR_CMM depends on DRM_RCAR_DU. Since the following Kconfig
symbols do not depend on DRM_RCAR_DU, the menu presentation is
broken for the following R-Car Kconfig symbols.

Use an if/endif block to make all of these symbols depend on
DRM_RCAR_DU (and remove the separate "depends on DRM_RCAR_DU").
This makes the kconfig menu presentation much cleaner.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
---
v2: use an if/endif block for the dependencies (thanks, Geert)
v3: still applicable -- update/rebase

Applies after today's earlier patch to fix undefined reference
build errors for R-Car (probably won't matter).

I did this patch one year ago and then forgot about it somehow.
Rediscovered & updated it today.

 drivers/gpu/drm/rcar-du/Kconfig |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

--- linux-next-20210423.orig/drivers/gpu/drm/rcar-du/Kconfig
+++ linux-next-20210423/drivers/gpu/drm/rcar-du/Kconfig
@@ -14,10 +14,11 @@ config DRM_RCAR_DU
 	  Choose this option if you have an R-Car chipset.
 	  If M is selected the module will be called rcar-du-drm.
 
+if DRM_RCAR_DU
+
 config DRM_RCAR_CMM
 	tristate "R-Car DU Color Management Module (CMM) Support"
 	depends on DRM && OF
-	depends on DRM_RCAR_DU
 	help
 	  Enable support for R-Car Color Management Module (CMM).
 
@@ -41,7 +42,6 @@ config DRM_RCAR_LVDS
 config DRM_RCAR_VSP
 	bool "R-Car DU VSP Compositor Support" if ARM
 	default y if ARM64
-	depends on DRM_RCAR_DU
 	depends on VIDEO_RENESAS_VSP1=y || (VIDEO_RENESAS_VSP1 && DRM_RCAR_DU=m)
 	help
 	  Enable support to expose the R-Car VSP Compositor as KMS planes.
@@ -49,4 +49,5 @@ config DRM_RCAR_VSP
 config DRM_RCAR_WRITEBACK
 	bool
 	default y if ARM64
-	depends on DRM_RCAR_DU
+
+endif # DRM_RCAR_DU
