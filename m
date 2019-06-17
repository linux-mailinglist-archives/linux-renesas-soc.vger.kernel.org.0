Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 278A947DC9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 11:02:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727400AbfFQJCg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 05:02:36 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:42407 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726887AbfFQJCg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 05:02:36 -0400
Received: by mail-pl1-f195.google.com with SMTP id ay6so1594945plb.9;
        Mon, 17 Jun 2019 02:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=oO3bFc+gdp9gERFdk7iH9cReeATz6/49oA8+LB7vHp4=;
        b=dVYDieuCvqUGKViKtAlf6lREWuJs7JGwAQ3PSvZuOgNX8OSahASazXFNLyBlIcRYTD
         G0C6gi+2pajsYZdgktJkDpRehUxiXrvGZtXcgEnTZfDp/zyEDYizOtIidV6FRDuOT0sx
         aso/A7GZlkewGHI4LcxC8kS+H5RWCY1ss5e88Pd3yhZn4M2Q7aqIG9Af4il2+C6PSuqA
         44kV0fgO/UpROFIIC/FOGD632W3XGTywSOvO+6C84S87dCBdA+qh/3EY0VjeUEQX4VIU
         i1jhgC8d1qYRSvjgF0tgw3mNjhM0oCKvgjLLpUmQBrlJ10vQ3Llm6tu/ESDbtKq6Hnuc
         fTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=oO3bFc+gdp9gERFdk7iH9cReeATz6/49oA8+LB7vHp4=;
        b=oPmlrt5/++EY/JaxkSgL0PzZIfiD8WWNn6fw7mbg8GiIy9BaPnReE9ioLwF9gmEphN
         +IDLgfmWUU9qQbCHIbSO2M2XlFv3N7uePzLw2MliMb4lVBC3LflRNqvWPAJBWnNvvTSO
         K7uRTpSJvTYq03PgcVZREAc4w4mlBAiVRA0UmJ1/v1y6iRJWenRB/vhL+KKoU2LKwCkv
         oYAqfAcPfG8f8rFtDNoRprtGr/jfYrgLZUDqo9TF0S5QhCKkuDrYt/BHTqKz723AhNYB
         NfBBmoerYxgsq+EX73cXj5twhowTWamdwLae9ZMgd6CSqQSVyquNcPQIYk3aO0VYoG90
         Mgxw==
X-Gm-Message-State: APjAAAVcSDyZe46l3C2Hk1WSfE4vNeQapIPjTbbTNsMDQgnvyfIXWs19
        vrmg7U8UKHjpOxpXZJdcO6pWQxRt
X-Google-Smtp-Source: APXvYqwuH/AYORJul8FAaYO2BO64WGX4FDI4VpxyFKQAwLkdFE5UCttxkf3URkgzcb95GNwlK6r6Gg==
X-Received: by 2002:a17:902:7004:: with SMTP id y4mr22350122plk.31.1560762155394;
        Mon, 17 Jun 2019 02:02:35 -0700 (PDT)
Received: from [127.0.0.1] (l193216.ppp.asahi-net.or.jp. [218.219.193.216])
        by smtp.gmail.com with ESMTPSA id j9sm10994020pff.88.2019.06.17.02.02.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 02:02:34 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     devicetree@vger.kernel.org
Cc:     mark.rutland@arm.com, linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>, robh+dt@kernel.org
Date:   Mon, 17 Jun 2019 18:04:01 +0900
Message-Id: <156076224112.4736.5038116002723317642.sendpatchset@octo>
In-Reply-To: <156076216767.4736.16337667537984218274.sendpatchset@octo>
References: <156076216767.4736.16337667537984218274.sendpatchset@octo>
Subject: [PATCH 8/8] dt-bindings: timer: renesas, cmt: Update R-Car Gen3 CMT1 usage
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
---

 Documentation/devicetree/bindings/timer/renesas,cmt.txt |   26 +++++++--------
 1 file changed, 13 insertions(+), 13 deletions(-)

--- 0014/Documentation/devicetree/bindings/timer/renesas,cmt.txt
+++ work/Documentation/devicetree/bindings/timer/renesas,cmt.txt	2019-06-17 14:07:46.502422801 +0900
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
@@ -42,34 +42,34 @@ Required Properties:
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
     - "renesas,sh73a0-cmt3" for the 32-bit CMT3 device included in sh73a0.
     - "renesas,sh73a0-cmt4" for the 32-bit CMT4 device included in sh73a0.
 
-    - "renesas,rcar-gen2-cmt0" for 32-bit CMT0 devices included in R-Car Gen2
+    - "renesas,rcar-gen2-cmt0" for 32-bit CMT0 device included in R-Car Gen2
 		and RZ/G1.
-    - "renesas,rcar-gen2-cmt1" for 48-bit CMT1 devices included in R-Car Gen2
+    - "renesas,rcar-gen2-cmt1" for 48-bit CMT1 device included in R-Car Gen2
 		and RZ/G1.
 		These are fallbacks for r8a73a4, R-Car Gen2 and RZ/G1 entries
 		listed above.
-    - "renesas,rcar-gen3-cmt0" for 32-bit CMT0 devices included in R-Car Gen3
+    - "renesas,rcar-gen3-cmt0" for 32-bit CMT0 device included in R-Car Gen3
 		and RZ/G2.
-    - "renesas,rcar-gen3-cmt1" for 48-bit CMT1 devices included in R-Car Gen3
+    - "renesas,rcar-gen3-cmt1" for 48-bit CMT devices included in R-Car Gen3
 		and RZ/G2.
 		These are fallbacks for R-Car Gen3 and RZ/G2 entries listed
 		above.
