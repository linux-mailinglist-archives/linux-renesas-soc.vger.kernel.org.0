Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97BF23B87B7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jun 2021 19:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232544AbhF3RdY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Jun 2021 13:33:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229963AbhF3RdX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Jun 2021 13:33:23 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 891D0C061756;
        Wed, 30 Jun 2021 10:30:54 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id k16so4067256ios.10;
        Wed, 30 Jun 2021 10:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZkA2kH0ir4VrYzfKw+Bnoh3SYiMrQMASYfySQrKF/+Y=;
        b=CYOWm8fCgsuyBiZmVg9VMJvz55bY0z82J8rWYnHye6VjH/XpZePZRwsGsuioKNoAq2
         E6T2ZuLyzVQ1R8v+yQcUF4S0/breKFE1hTzER5s/C6G6c2/YK/lC9FHGfybYKaL9zxAh
         NckQSaj2BM+6x7hM561eoR6YpRmdC0x3QuCdVO1oSjRtjd3fWeMC1WaC4+8hYjI6ggHN
         PSoIXhppVfuS23jYseAhBpADZtCFP0wVRgsP1wFchzmHmGx/DScmf90jJdGDn567dB5i
         71yUvhePUFXLC3QxVU/XLcyhFj2MHkTWP6wZjTY3zEIDkraxmvbH+vNo9Wj5n1ayMGJw
         D67w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZkA2kH0ir4VrYzfKw+Bnoh3SYiMrQMASYfySQrKF/+Y=;
        b=BLu3FoJ3t78C8hP8lXO+Pq3H2MTvFWWQSt6bSlt63wK6CPDizDBVPumcPFK7GtOsX9
         8AWJzUBHx3naHeDLN9Pyj0gne+/4yivn5LdstJwuFoWvD4DtMEYj0bdgADdrtouqyQhz
         x4koBhE5cqMfDF7Fl9qIQl/Hsj9sUDuKm5JZ7BR/nRoTQWQU+7tBVNLQHGsGlhuZzFAu
         d95iWCwyFap7QoJmW/IWVCxT3ryW3/H+fhtnhD2h9wYpUjvdn4ipLTuVU6qjmSK5WrvH
         7EhTE7bn/BfhoHK6iN4dbgj4p/9ejw/aW2jx4cfDA9kMDJCtFnOZr/mFJegojqaJhDPd
         eIAQ==
X-Gm-Message-State: AOAM533m5P+bRQEGzx4EtgDbuTb+0uldecQm6n5WTHrpg4UFYrxGWTYH
        urmygGYwi8ukh7BUO61lDapx6+Ua436UzWT/
X-Google-Smtp-Source: ABdhPJwhoD1OmmOWjhUbVu8iYuaFapecKT63UHWQ3u7fjWy/MwrRJmDbWqTC4dW1q1igmucH+gqYlg==
X-Received: by 2002:a6b:3c01:: with SMTP id k1mr8622401iob.24.1625074253459;
        Wed, 30 Jun 2021 10:30:53 -0700 (PDT)
Received: from aford-IdeaCentre-A730.lan (c-73-37-219-234.hsd1.mn.comcast.net. [73.37.219.234])
        by smtp.gmail.com with ESMTPSA id q19sm12207278ilc.70.2021.06.30.10.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 10:30:52 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: usb: renesas,usbhs: Support external ref clock
Date:   Wed, 30 Jun 2021 12:30:40 -0500
Message-Id: <20210630173042.186394-1-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The usbhs driver expects a fixed external reference clock, but it
could be sourced from a programmable clock instead of a fixed clock.
Add support for an optional 4th reference clock.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
index e67223d90bb7..2372d8c42979 100644
--- a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
+++ b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
@@ -53,11 +53,12 @@ properties:
 
   clocks:
     minItems: 1
-    maxItems: 3
+    maxItems: 4
     items:
       - description: USB 2.0 host
       - description: USB 2.0 peripheral
       - description: USB 2.0 clock selector
+      - description: Optional external reference clock
 
   interrupts:
     maxItems: 1
-- 
2.25.1

