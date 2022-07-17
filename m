Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FB425777A3
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Jul 2022 19:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbiGQR6a (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 17 Jul 2022 13:58:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230429AbiGQR62 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 17 Jul 2022 13:58:28 -0400
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED1D613D5D
        for <linux-renesas-soc@vger.kernel.org>; Sun, 17 Jul 2022 10:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa1;
        h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
         subject:cc:to:from:from;
        bh=k798q7ML9R4Plrb6TqpakxyUbx1g5KWRA3qhCOyn4ek=;
        b=e4C90Y5+4w0vcw6rF3D2f2kPP3t7AKAHZcUH+DI7+w2S/TiSCVHlJIIDo1BTHWu8uXzcUjI1wRu52
         2zJtbAOys8Wv+uhj3pGNnfUOZEh/aY+NUpDDduf4CZ7mHj8+XoRYw2DYuVYiaWYk9eM9m1vqSFoJnJ
         MbGBsjKP3B+RERK182PCh3q8+RcvUgJ2bgxltXrqQAZZPOkqIRdhdzcDHFLQf+dsy8+Zf0WFmDf5vT
         suoUhkWliBi2VSyuOrwsDNYnBd4E0tI3lJ345y1HAwNMjxKe9UvyirlmZxYr5+qmnk20MXk8HcEv4Z
         VVKzfw1WQwbfXSE32Q1WGB1w08q0cLQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed1;
        h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
         subject:cc:to:from:from;
        bh=k798q7ML9R4Plrb6TqpakxyUbx1g5KWRA3qhCOyn4ek=;
        b=atAGNS4/GuLbsXt6VCubT00JfzK8dji6XUbvCGx+kiMBvBk+yhcp7ECF/qD3gslmtsoc7xgAbAlme
         hMikQjUAw==
X-HalOne-Cookie: e93fb8437fd3034790c1dedaf93d71e57f69d988
X-HalOne-ID: 0dd61fc2-05fa-11ed-be7f-d0431ea8bb03
Received: from mailproxy1.cst.dirpod4-cph3.one.com (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
        by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
        id 0dd61fc2-05fa-11ed-be7f-d0431ea8bb03;
        Sun, 17 Jul 2022 17:58:25 +0000 (UTC)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Benson Leung <bleung@chromium.org>,
        Cai Huoqing <cai.huoqing@linux.dev>,
        chrome-platform@lists.linux.dev,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Jitao Shi <jitao.shi@mediatek.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Philip Chen <philipchen@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v1 12/12] drm/todo: Add bridge related todo items
Date:   Sun, 17 Jul 2022 19:58:01 +0200
Message-Id: <20220717175801.78668-5-sam@ravnborg.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220717175801.78668-1-sam@ravnborg.org>
References: <20220717174454.46616-1-sam@ravnborg.org>
 <20220717175801.78668-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE,URIBL_BLACK autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add todo in the hope someone will help updating the bridge drivers.

v2:
  - Updated descriptions in todo.rst

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 Documentation/gpu/todo.rst | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 10bfb50908d1..fbcc232e0bc1 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -480,6 +480,26 @@ Contact: Thomas Zimmermann <tzimmermann@suse.de>
 
 Level: Starter
 
+Drop use of deprecated operations in bridge drivers
+--------------------------------------------------
+
+&struct drm_bridge_funcs contains a number of deprecated operations
+which can be replaced by the atomic variants.
+
+The following is more or less 1:1 replacements with the arguments
+and names adjusted:
+* pre_enable => atomic_pre_enable
+* enable => atomic_enable
+* disable => atomic_disable
+* post_disable => atomic_post_disable
+
+* mode_set is no longer required and the implementation shall be merged
+  with atomic_enable.
+
+Contact: bridge maintainers, Sam Ravnborg <sam@ravnborg.org>,
+         Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+
+Level: Beginner or intermediate (depending on the driver)
 
 Core refactorings
 =================
-- 
2.34.1

