Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45F4295E9E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2019 14:33:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729842AbfHTMd0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Aug 2019 08:33:26 -0400
Received: from mail-pg1-f176.google.com ([209.85.215.176]:45383 "EHLO
        mail-pg1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729137AbfHTMd0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Aug 2019 08:33:26 -0400
Received: by mail-pg1-f176.google.com with SMTP id o13so3168333pgp.12;
        Tue, 20 Aug 2019 05:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=S32qZ7XdO5r2dv+B4HOk2JeOvdYbAozdIuuwCf7sti8=;
        b=F7dgwzvwRzwC8dfYziXXjVhC18h5NoVV9F+4fZQph7PCaQnEuNUsqrbtK10afywKUZ
         wX8r1gTgmQtZmCOTEsafas9R/yA/y9awJerXj5Vbfs244LeRLnTFVCzgyU4rGPanGt+J
         eo5nq2YtkRqs6paFryQAMwuMfgOzUcgueipM+dYMv5hyTJxZuPEED2lTVMwSmkaBaaJV
         wGRIvwdgDKEEQvCiuF6f4Kmg0BhTmEmN7fDJLZzkFkdgJRpkbqFzrTU5T1zRO5/b2pw4
         kE8JZENlhB5NoWs4jrdM5svzSTzv3pqk3wJoXWo0D2T0gULIaYjRkFraBwitpkstrcxz
         A2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=S32qZ7XdO5r2dv+B4HOk2JeOvdYbAozdIuuwCf7sti8=;
        b=ingJMq3vwZSbNz+2N7tJVpWNhihfI1KG3YZ1bb7KhuljQpi7FuRjqtcT4c/i0SB1Sm
         OUKSsYMD/Lbx7kvBqT73kbKhXsyxwGhItjf9F2pX98X0IaY4+l1O1BMiB8gAbjcEXwa3
         lrid/oQ4xBx7MpgCscqlhI9iuQynGkvhBkagABNPc521MwzLNBLNb4h6e/HrP7E8qK0P
         fOHsaX2R20246V3mcdbwYR0QVeu8oWtFKoyYcfLWr+idjug1wDe8mfidiY056KvE7YvD
         FZV8baQhM0TtYINREKyhdCXlnH2fhccenO1wq0el70O2B2SPMY32O1vHSOOQCWAMMnnF
         XphQ==
X-Gm-Message-State: APjAAAV8hrmaossjsS81la7RBdhodmWlYqK1YMFrGYnGezX1Bm7oPihU
        3CUMgJJ4BTWxebCE25avx58aiR2b
X-Google-Smtp-Source: APXvYqzTGgLOPzi1SyQRiFX0+hK1/ORpjhZH2ZEfm2b6ed9+KwUCFUX4DWfb7zNhG+YK+mC0CxUNGA==
X-Received: by 2002:aa7:93c4:: with SMTP id y4mr30117289pff.39.1566304405396;
        Tue, 20 Aug 2019 05:33:25 -0700 (PDT)
Received: from [127.0.0.1] (l193216.ppp.asahi-net.or.jp. [218.219.193.216])
        by smtp.gmail.com with ESMTPSA id x2sm20517773pja.22.2019.08.20.05.33.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Aug 2019 05:33:24 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     mark.rutland@arm.com, devicetree@vger.kernel.org,
        geert+renesas@glider.be, daniel.lezcano@linaro.org,
        linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
        horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>,
        tglx@linutronix.de
Date:   Tue, 20 Aug 2019 21:35:03 +0900
Message-Id: <156630450374.17444.10813153921641289392.sendpatchset@octo>
In-Reply-To: <156630449239.17444.11157306180861080402.sendpatchset@octo>
References: <156630449239.17444.11157306180861080402.sendpatchset@octo>
Subject: [PATCH v2 1/7] dt-bindings: timer: renesas, cmt: Add CMT0234 to sh73a0 and r8a7740
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Document the on-chip CMT devices included in r8a7740 and sh73a0.

Included in this patch is DT binding documentation for 32-bit CMTs
CMT0, CMT2, CMT3 and CMT4. They all contain a single channel and are
quite similar however some minor differences still exist:
 - "Counter input clock" (clock input and on-device divider)
    One example is that RCLK 1/1 is supported by CMT2, CMT3 and CMT4.
 - "Wakeup request" (supported by CMT0 and CMT2)

Because of this one unique compat string per CMT device is selected.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---

 Documentation/devicetree/bindings/timer/renesas,cmt.txt |    8 ++++++++
 1 file changed, 8 insertions(+)

--- 0001/Documentation/devicetree/bindings/timer/renesas,cmt.txt
+++ work/Documentation/devicetree/bindings/timer/renesas,cmt.txt	2019-07-18 18:19:43.196165331 +0900
@@ -22,6 +22,10 @@ Required Properties:
 
     - "renesas,r8a73a4-cmt0" for the 32-bit CMT0 device included in r8a73a4.
     - "renesas,r8a73a4-cmt1" for the 48-bit CMT1 device included in r8a73a4.
+    - "renesas,r8a7740-cmt0" for the 32-bit CMT0 device included in r8a7740.
+    - "renesas,r8a7740-cmt2" for the 32-bit CMT2 device included in r8a7740.
+    - "renesas,r8a7740-cmt3" for the 32-bit CMT3 device included in r8a7740.
+    - "renesas,r8a7740-cmt4" for the 32-bit CMT4 device included in r8a7740.
     - "renesas,r8a7743-cmt0" for the 32-bit CMT0 device included in r8a7743.
     - "renesas,r8a7743-cmt1" for the 48-bit CMT1 device included in r8a7743.
     - "renesas,r8a7744-cmt0" for the 32-bit CMT0 device included in r8a7744.
@@ -54,6 +58,10 @@ Required Properties:
     - "renesas,r8a77980-cmt1" for the 48-bit CMT1 device included in r8a77980.
     - "renesas,r8a77990-cmt0" for the 32-bit CMT0 device included in r8a77990.
     - "renesas,r8a77990-cmt1" for the 48-bit CMT1 device included in r8a77990.
+    - "renesas,sh73a0-cmt0" for the 32-bit CMT0 device included in sh73a0.
+    - "renesas,sh73a0-cmt2" for the 32-bit CMT2 device included in sh73a0.
+    - "renesas,sh73a0-cmt3" for the 32-bit CMT3 device included in sh73a0.
+    - "renesas,sh73a0-cmt4" for the 32-bit CMT4 device included in sh73a0.
 
     - "renesas,rcar-gen2-cmt0" for 32-bit CMT0 devices included in R-Car Gen2
 		and RZ/G1.
