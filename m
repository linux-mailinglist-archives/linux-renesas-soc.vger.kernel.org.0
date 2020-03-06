Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0E917C3FB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2020 18:15:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbgCFRPG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Mar 2020 12:15:06 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:46928 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725935AbgCFRPG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Mar 2020 12:15:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=hSdov4oi/jmTS3gMc77LB7lCDvmj8soE+O2v7sGdzgU=; b=WZbyVHEZAa5iQcFPRnUw+O7SCN
        1j62sYTJ/mr1vD7eotrt15t3kxZ7rMwE5J4vCxl8EQhpy0da+qVLFSWyerUlnN7wp+e9a/vzSIR0W
        ETEa6GQn0qy0mU7AOm5f+vio18C0pbnahsrLMcozaSks49HyM+M+KO9Z7Xnd+AMnbc0E8CagFiUA2
        mU9kfJbTl7r3rnZZsgmDvdDmxy9h/IjfYWonUPc04sIVUr2lzxjNmuPYZYUo0efxYWcY82bbnPaAs
        0d3uCiIjtXbwVpHC0d++rKIeThZNSHR96ytJ5vjaZ4ztsAoiVFx5vV4xmzrsgIj9kxgo3uwcVW1qP
        1VVtpp2Q==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jAGYw-0006fe-Ko; Fri, 06 Mar 2020 17:15:02 +0000
To:     LKML <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        David Airlie <airlied@linux.ie>,
        Geert Uytterhoeven <geert@linux-m68k.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2] drm: rcar-du: make all sub-symbols depend on DRM_RCAR_DU
Message-ID: <d5ecfccc-c7c8-4157-4d59-22b726fc0084@infradead.org>
Date:   Fri, 6 Mar 2020 09:15:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

DRM_RCAR_CMM depends on DRM_RCAR_DU. Since the following Kconfig
symbols do not depend on DRM_RCAR_DU, the menu presentation is
broken for these and following non-R-Car Kconfig symbols.

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

 drivers/gpu/drm/rcar-du/Kconfig |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

--- linux-next-20200305.orig/drivers/gpu/drm/rcar-du/Kconfig
+++ linux-next-20200305/drivers/gpu/drm/rcar-du/Kconfig
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
 
@@ -40,7 +41,6 @@ config DRM_RCAR_LVDS
 config DRM_RCAR_VSP
 	bool "R-Car DU VSP Compositor Support" if ARM
 	default y if ARM64
-	depends on DRM_RCAR_DU
 	depends on VIDEO_RENESAS_VSP1=y || (VIDEO_RENESAS_VSP1 && DRM_RCAR_DU=m)
 	help
 	  Enable support to expose the R-Car VSP Compositor as KMS planes.
@@ -48,3 +48,5 @@ config DRM_RCAR_VSP
 config DRM_RCAR_WRITEBACK
 	bool
 	default y if ARM64
+
+endif # DRM_RCAR_DU

