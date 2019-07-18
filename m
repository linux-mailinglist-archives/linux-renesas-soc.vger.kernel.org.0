Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A0596CD8B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jul 2019 13:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390212AbfGRLmo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Jul 2019 07:42:44 -0400
Received: from mail-pf1-f179.google.com ([209.85.210.179]:42414 "EHLO
        mail-pf1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389994AbfGRLmo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Jul 2019 07:42:44 -0400
Received: by mail-pf1-f179.google.com with SMTP id q10so12499438pff.9;
        Thu, 18 Jul 2019 04:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=pA1p9SQmsthhyvWExkbUHd//8HZUcj8m/l7tDDbT0MM=;
        b=pe1VaIKbRCZ9wydTjHetPd5GXaeXZmJJ5LSXTi3f8Eb7DHxKVU4sUM5qjJDhB4GsX3
         I0KZmRYLGBoAj3tME8k/JuXBxdjN5zipJLHPDceqTPZ8V2LMrZ4IyaP/3pT5Sa7oqKIJ
         R4vAztZnWJlKcjj74sA7vG83KgdQPLYqc1yfGcr0djhPiZ00tMWOSkaFhWh/gPKq7DJk
         iA8s38EeAN7qcReyXNIsqPAGaSn4UtGguOkt2cO5dYwsSmZlw4A9kQK5GdGWXZWgNT23
         lWEabiyv9omCkUKRWRQvrYmIftNUyLCm41rXPEgPI7mwDL0XgpM4VZydnG8IkEvwsVa8
         Ck3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=pA1p9SQmsthhyvWExkbUHd//8HZUcj8m/l7tDDbT0MM=;
        b=s5M4vG6cMGOdrXykxJ1brkVnHZWrLJ7F0prYUi258iSTFwYBVSeQKpL8AYK3rUF1w1
         6MUJ8FgVxULjnSVS6sQU3ZaWoOD30btkREXCsZaSeVaFLeJLaBXBAehNtdbJXmK+7GXY
         G2EqFNIW8SoaKOfpD8A87LOlRq0uxkIFOFw0ZGCzEbOypw4gke2Yr1C/rS6IM9+tyC7g
         qsEj1xZ2Gwqeh0J6aUQ6PZsD2TS+XnWqY6zFBzk5de+uuK/1p+CjxhtmhuvuoMrLPEDg
         vvmjiG2wfiuuOR+yP8X52BdgZZ2PyX9PT27zbyjMC+QFc860zCRpvOLlVOWSH5M5Mf+M
         lykg==
X-Gm-Message-State: APjAAAU4vefI+0lAmUU0e68xQQcFtZJEJNkWwJTYa21oGY2x9zSU8A6v
        BKT5qqYPsANuo85MO9xiIraZiUwl
X-Google-Smtp-Source: APXvYqwgZ72B5yzDiWFdF/vhhUSMlGG3jVVcE/1sJM4mls2IIPD41T5i/b/aXHaG8fDJC/4NB5Ba9w==
X-Received: by 2002:a17:90a:7788:: with SMTP id v8mr20475991pjk.132.1563450163197;
        Thu, 18 Jul 2019 04:42:43 -0700 (PDT)
Received: from [127.0.0.1] (FL1-133-202-12-40.iwa.mesh.ad.jp. [133.202.12.40])
        by smtp.gmail.com with ESMTPSA id r188sm44533047pfr.16.2019.07.18.04.42.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jul 2019 04:42:42 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     mark.rutland@arm.com, devicetree@vger.kernel.org,
        geert+renesas@glider.be, daniel.lezcano@linaro.org,
        linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
        Magnus Damm <magnus.damm@gmail.com>, tglx@linutronix.de
Date:   Thu, 18 Jul 2019 20:44:12 +0900
Message-Id: <156345025207.5307.17135263586186534810.sendpatchset@octo>
In-Reply-To: <156345023791.5307.6113391102648394591.sendpatchset@octo>
References: <156345023791.5307.6113391102648394591.sendpatchset@octo>
Subject: [PATCH 1/7] dt-bindings: timer: renesas, cmt: Add CMT0234 to sh73a0 and r8a7740
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
