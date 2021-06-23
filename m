Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA1A53B1EE2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 18:43:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbhFWQpc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 12:45:32 -0400
Received: from mail-io1-f50.google.com ([209.85.166.50]:38878 "EHLO
        mail-io1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbhFWQpb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 12:45:31 -0400
Received: by mail-io1-f50.google.com with SMTP id k11so4285850ioa.5;
        Wed, 23 Jun 2021 09:43:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fs5wqocEnsX9tgAffHRTk2LbXor5QUxIFTJtXjA5IEg=;
        b=XWdwZMr1Aby4hF07NCXMtzL2SleWq+lIUd1keILfCkhSoZ+FNkJuD3aRsLg9UCODOa
         YPrnbMc5l+Vr+M6iaC7N/JUmE0YfFyQsDPhBVeCvgzRB0knEhXbQ7OoOWDncLWcRA6q7
         l24Lk+npqLYsAujV/AFvMibQVtCE5R6PsfLEcoaTfgfgQVNHBRS/MBhWHxe+utsjidXM
         M3UxpkA/o3cgFpY5kwJNtRBArCmUO48EOm2C6tgg7o+mpQFhvrz9UUqlD/LQevP1W9Tm
         AO00ChZIbHQzrIa07sCDJO4p+O8srpcX5mph317XOoI6qA4ORlpNOjwqHO3HqXMtuSKF
         Lg/g==
X-Gm-Message-State: AOAM532dxVSFI8bpnjz6hhQ6tKInkPMZDWacQwN7Cgq9RPoeADmOYlUz
        BqmWJFWMoie+NdRAC1kgSNnXnND3XA==
X-Google-Smtp-Source: ABdhPJwtRJdQCc2iLaRjmdHa8/bwsCpCy5NB+RtOuhiI4r2uwcczqfYdMV7TjuZ1ybdpg0xrgpkHdQ==
X-Received: by 2002:a5d:9445:: with SMTP id x5mr407043ior.2.1624466592587;
        Wed, 23 Jun 2021 09:43:12 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.248])
        by smtp.googlemail.com with ESMTPSA id z2sm150232iol.45.2021.06.23.09.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 09:43:11 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH] dt-bindings: display: renesas,du: Fix 'ports' reference
Date:   Wed, 23 Jun 2021 10:43:08 -0600
Message-Id: <20210623164308.2570164-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Fix the renesas,du binding 'ports' schema which is referencing the 'port'
schema instead of the 'ports' schema.

Fixes: 99d66127fad2 ("dt-bindings: display: renesas,du: Convert binding to YAML")
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/display/renesas,du.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
index 121596f106da..5f4345d43020 100644
--- a/Documentation/devicetree/bindings/display/renesas,du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
@@ -55,7 +55,7 @@ properties:
     maxItems: 1
 
   ports:
-    $ref: /schemas/graph.yaml#/properties/port
+    $ref: /schemas/graph.yaml#/properties/ports
     description: |
       The connections to the DU output video ports are modeled using the OF
       graph bindings specified in Documentation/devicetree/bindings/graph.txt.
-- 
2.27.0

