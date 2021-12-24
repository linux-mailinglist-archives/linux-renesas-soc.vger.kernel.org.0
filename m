Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98C2747EB95
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Dec 2021 06:23:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351345AbhLXFXq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Dec 2021 00:23:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351338AbhLXFXo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Dec 2021 00:23:44 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB41EC061401
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Dec 2021 21:23:43 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id bq20so16913313lfb.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Dec 2021 21:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+A6R7NBtfUQnLlLDkSBl+KL94Li6QNQFhWmSmSRXFes=;
        b=T+j4o5YtE3hx3HWodazGWr+DMJhdsDMjBjNNr4kfrcKEjB/Y+DnF80FniEAppTSWJZ
         fI2O5+RlOFitBe88RtpukpDWl+6K/rT0/dD8YzPDqH8rooaogqsUe9CMFaDw771YLCSz
         5MzAlJGEHjfDMwMHb0/l82bvl5RXauwU9xBpmhdM4KXf+9A3lAYQIauW2QaZbEvl+Q0B
         4a0a98BtRewN1Zdzkp3Xk6Je0rFf//bGxe1b+wY0KpnxmwOY6LeetVrlPiuBj2tlgyqH
         BE1pWujq2lYxsZglorCeEMdwZHSC3rTvvC2IG5FHrRcPTeENjJV3XU+hlag1ZhIgD2CQ
         MtLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+A6R7NBtfUQnLlLDkSBl+KL94Li6QNQFhWmSmSRXFes=;
        b=i9KN2QAwKQ4fWiGKxyBROZiUkMDBUMXjjmC1b7GPdYjI4SthmbjBlBNYhOR3PAELnE
         wD3Kr5K1glu0IMfqujbkd2Vhr+zlKpXR/sxPhOOt/6oyj1Zuuj+TO5mIOfmwKNpdALS7
         QZ6lpIZK4EbCemPZPjZ62mD+AzU1eRMG1b838NO75w5qQ1tN9rxaYteQ610SwnCXf3cQ
         lDSLl7nGxRpM/8OaNtWvMKI7zYZTkQ+lA25N3o4wuddzNUGcVYgfA4ARmt+fCTEH/THr
         wskvMTXrOkkVEY46IKWKXdkdvDz6XyXkQERnyIeFmHy7mjwjkxEMn7N8wtl7gyVvmMx8
         QpiQ==
X-Gm-Message-State: AOAM531KkHxv2gs/UcCjdiIRHiTa49GOoUNnXoTqNXrgXD6NrJRGpjA8
        mfrfWyqkpRWK+zRe53rERSmDRQ==
X-Google-Smtp-Source: ABdhPJw2hgZNyZhh1NpwjrhB8tKAf5hRDZK9f2T43eAkIbL4fGq35UrtZxCmRf3mIhJTxldmA6SbVQ==
X-Received: by 2002:a05:6512:10d3:: with SMTP id k19mr4010796lfg.448.1640323422107;
        Thu, 23 Dec 2021 21:23:42 -0800 (PST)
Received: from cobook.home (nikaet.starlink.ru. [94.141.168.29])
        by smtp.gmail.com with ESMTPSA id e13sm702858lfs.306.2021.12.23.21.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Dec 2021 21:23:41 -0800 (PST)
From:   Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH 3/3] dt-bindings: display: bridge: renesas,lvds: Document r8a77961 bindings
Date:   Fri, 24 Dec 2021 08:23:09 +0300
Message-Id: <20211224052309.1997096-4-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211224052309.1997096-1-nikita.yoush@cogentembedded.com>
References: <20211224052309.1997096-1-nikita.yoush@cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document the R-Car M3-W+ (R8A77961) SoC in the R-Car LVDS encoder
bindings.

Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 .../devicetree/bindings/display/bridge/renesas,lvds.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
index acfc327f70a7..ca5443e5c2e3 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
@@ -27,6 +27,7 @@ properties:
       - renesas,r8a7791-lvds # for R-Car M2-W compatible LVDS encoders
       - renesas,r8a7793-lvds # for R-Car M2-N compatible LVDS encoders
       - renesas,r8a7795-lvds # for R-Car H3 compatible LVDS encoders
+      - renesas,r8a77961-lvds # for R-Car M3-W+ compatible LVDS encoders
       - renesas,r8a7796-lvds # for R-Car M3-W compatible LVDS encoders
       - renesas,r8a77965-lvds # for R-Car M3-N compatible LVDS encoders
       - renesas,r8a77970-lvds # for R-Car V3M compatible LVDS encoders
-- 
2.30.2

