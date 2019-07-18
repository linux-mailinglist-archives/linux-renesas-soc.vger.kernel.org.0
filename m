Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8A426CD97
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jul 2019 13:43:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727882AbfGRLnn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Jul 2019 07:43:43 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:33221 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726715AbfGRLnn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Jul 2019 07:43:43 -0400
Received: by mail-pf1-f196.google.com with SMTP id g2so12518745pfq.0;
        Thu, 18 Jul 2019 04:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=0uFR2lJJHAQXqBn4mBCze4q72PnDPTYuv0ecU5Uw7sQ=;
        b=VKQ4wXQXhFTrGD0EtuGQOAqQOtV4g0I4DIxlZMtFmrSq0r7MnxHoxxCyWZUR5ezUmI
         He42Hkh4Fe1CBLCWhYfeXvdhlKKXJuxaddXZJsk8A7EDpnWB9vuJhV7mI/gd8FdtBPsY
         iNav4jErZufz3wGFGPi63EKZqyTp487wkMSRwNnVtklUuJQJ8ygj+N6QRJVPzzF5CS6N
         VviUxGquCTIss347lVzuHD0dcy4A8PkErgd1MdEBp+WjrWzDK0JVRG6gcewkwjUGm+K0
         GMrNlHwIA2fLkpYC3CgJcVmAVZddnOL5sqam7n+iQRoOsiUfLGREXAEjFfEGhkHSkHsr
         Ouvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=0uFR2lJJHAQXqBn4mBCze4q72PnDPTYuv0ecU5Uw7sQ=;
        b=pKtiTMSI8Y09bE3Cg/0xBGIduOym6gSYxUZOYWXjwf2AzgldBhvKU5ZbjKyAsAcy6Y
         6xClKMfPCrm0cDwK0SnCsK+jAduf0RFUPDvoDlAj275HMgEo5xVkgACrXye5Yo6t5WZh
         Us7Z6KLC1OzvbnVcSmwRme8+wc1xnyeIFSHLRusUE+hX+NvUd8uMCFwT78ZFTnIgcag5
         UsUdPi5GwPD376HrSFoF1MavHd1XjFRPYCSxvi6l9ycPBZY1RvvSXZif0SZZ3vPr7GZ/
         JWIlYeJbxNyIUxb5sv8emb9A38ITsZXM9jpNGuqvYHafvelSM0V22v+01sKZD1TT4xIY
         A2LQ==
X-Gm-Message-State: APjAAAXL+3H6G9NRLlhzP0oolz0KNokhHc7AmIFwO/XVOD98w0uDDVez
        4psUuEuRy1LqZGxucYowIoIbT5Uj
X-Google-Smtp-Source: APXvYqx6bxEFHCw9GHz9AL2aZa31wQvU4mp+dWDRUjtLvTYN6lC4B72MY/vTMVGKMhkJMF9gzV3Trw==
X-Received: by 2002:a63:b46:: with SMTP id a6mr36867501pgl.235.1563450221781;
        Thu, 18 Jul 2019 04:43:41 -0700 (PDT)
Received: from [127.0.0.1] (FL1-133-202-12-40.iwa.mesh.ad.jp. [133.202.12.40])
        by smtp.gmail.com with ESMTPSA id j15sm30169776pfe.3.2019.07.18.04.43.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jul 2019 04:43:40 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     mark.rutland@arm.com, devicetree@vger.kernel.org,
        geert+renesas@glider.be, daniel.lezcano@linaro.org,
        linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
        Magnus Damm <magnus.damm@gmail.com>, tglx@linutronix.de
Date:   Thu, 18 Jul 2019 20:45:11 +0900
Message-Id: <156345031152.5307.4388075759256453367.sendpatchset@octo>
In-Reply-To: <156345023791.5307.6113391102648394591.sendpatchset@octo>
References: <156345023791.5307.6113391102648394591.sendpatchset@octo>
Subject: [PATCH 5/7] dt-bindings: timer: renesas, cmt: Update R-Car Gen3 CMT1 usage
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

The R-Car Gen3 SoCs so far come with a total for 4 on-chip CMT devices:
 - CMT0
 - CMT1
 - CMT2
 - CMT3

CMT0 includes two rather basic 32-bit timer channels. The rest of the on-chip
CMT devices support 48-bit counters and have 8 channels each.

Based on the data sheet information "CMT2/3 are exactly same as CMT1"
it seems that CMT2 and CMT3 now use the CMT1 compat string in the DTSI.

Clarify this in the DT binding documentation by describing R-Car Gen3 and
RZ/G2 CMT1 as "48-bit CMT devices".

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Rob Herring <robh@kernel.org>
---

 Changes since last version:
 - Use "devices" for fallback entry - thanks Geert!
 - Keen to Gen3 so removed out-of-scope Gen2 portions

 Documentation/devicetree/bindings/timer/renesas,cmt.txt |   20 +++++++--------
 1 file changed, 10 insertions(+), 10 deletions(-)

--- 0008/Documentation/devicetree/bindings/timer/renesas,cmt.txt
+++ work/Documentation/devicetree/bindings/timer/renesas,cmt.txt	2019-07-18 19:24:05.195643742 +0900
@@ -28,9 +28,9 @@ Required Properties:
     - "renesas,r8a77470-cmt0" for the 32-bit CMT0 device included in r8a77470.
     - "renesas,r8a77470-cmt1" for the 48-bit CMT1 device included in r8a77470.
     - "renesas,r8a774a1-cmt0" for the 32-bit CMT0 device included in r8a774a1.
-    - "renesas,r8a774a1-cmt1" for the 48-bit CMT1 device included in r8a774a1.
+    - "renesas,r8a774a1-cmt1" for the 48-bit CMT devices included in r8a774a1.
     - "renesas,r8a774c0-cmt0" for the 32-bit CMT0 device included in r8a774c0.
-    - "renesas,r8a774c0-cmt1" for the 48-bit CMT1 device included in r8a774c0.
+    - "renesas,r8a774c0-cmt1" for the 48-bit CMT devices included in r8a774c0.
     - "renesas,r8a7790-cmt0" for the 32-bit CMT0 device included in r8a7790.
     - "renesas,r8a7790-cmt1" for the 48-bit CMT1 device included in r8a7790.
     - "renesas,r8a7791-cmt0" for the 32-bit CMT0 device included in r8a7791.
@@ -42,19 +42,19 @@ Required Properties:
     - "renesas,r8a7794-cmt0" for the 32-bit CMT0 device included in r8a7794.
     - "renesas,r8a7794-cmt1" for the 48-bit CMT1 device included in r8a7794.
     - "renesas,r8a7795-cmt0" for the 32-bit CMT0 device included in r8a7795.
-    - "renesas,r8a7795-cmt1" for the 48-bit CMT1 device included in r8a7795.
+    - "renesas,r8a7795-cmt1" for the 48-bit CMT devices included in r8a7795.
     - "renesas,r8a7796-cmt0" for the 32-bit CMT0 device included in r8a7796.
-    - "renesas,r8a7796-cmt1" for the 48-bit CMT1 device included in r8a7796.
+    - "renesas,r8a7796-cmt1" for the 48-bit CMT devices included in r8a7796.
     - "renesas,r8a77965-cmt0" for the 32-bit CMT0 device included in r8a77965.
-    - "renesas,r8a77965-cmt1" for the 48-bit CMT1 device included in r8a77965.
+    - "renesas,r8a77965-cmt1" for the 48-bit CMT devices included in r8a77965.
     - "renesas,r8a77970-cmt0" for the 32-bit CMT0 device included in r8a77970.
-    - "renesas,r8a77970-cmt1" for the 48-bit CMT1 device included in r8a77970.
+    - "renesas,r8a77970-cmt1" for the 48-bit CMT devices included in r8a77970.
     - "renesas,r8a77980-cmt0" for the 32-bit CMT0 device included in r8a77980.
-    - "renesas,r8a77980-cmt1" for the 48-bit CMT1 device included in r8a77980.
+    - "renesas,r8a77980-cmt1" for the 48-bit CMT devices included in r8a77980.
     - "renesas,r8a77990-cmt0" for the 32-bit CMT0 device included in r8a77990.
-    - "renesas,r8a77990-cmt1" for the 48-bit CMT1 device included in r8a77990.
+    - "renesas,r8a77990-cmt1" for the 48-bit CMT devices included in r8a77990.
     - "renesas,r8a77995-cmt0" for the 32-bit CMT0 device included in r8a77995.
-    - "renesas,r8a77995-cmt1" for the 48-bit CMT1 device included in r8a77995.
+    - "renesas,r8a77995-cmt1" for the 48-bit CMT devices included in r8a77995.
     - "renesas,sh73a0-cmt0" for the 32-bit CMT0 device included in sh73a0.
     - "renesas,sh73a0-cmt1" for the 48-bit CMT1 device included in sh73a0.
     - "renesas,sh73a0-cmt2" for the 32-bit CMT2 device included in sh73a0.
@@ -69,7 +69,7 @@ Required Properties:
 		listed above.
     - "renesas,rcar-gen3-cmt0" for 32-bit CMT0 devices included in R-Car Gen3
 		and RZ/G2.
-    - "renesas,rcar-gen3-cmt1" for 48-bit CMT1 devices included in R-Car Gen3
+    - "renesas,rcar-gen3-cmt1" for 48-bit CMT devices included in R-Car Gen3
 		and RZ/G2.
 		These are fallbacks for R-Car Gen3 and RZ/G2 entries listed
 		above.
