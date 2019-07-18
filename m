Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B471E6CD94
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jul 2019 13:43:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389956AbfGRLna (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Jul 2019 07:43:30 -0400
Received: from mail-pl1-f173.google.com ([209.85.214.173]:39266 "EHLO
        mail-pl1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727816AbfGRLna (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Jul 2019 07:43:30 -0400
Received: by mail-pl1-f173.google.com with SMTP id b7so13777489pls.6;
        Thu, 18 Jul 2019 04:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=tPePu7pSpTPNOXIejkRoYY8GOOyZlXM/IzBHuBk3B3g=;
        b=N96848BJBSzFJUeK5OtYubF/48VDV6scGTObyO76Zsyq/Q7czfeEVKcwSGiNQiU+yw
         XNMBwiT6XdwcwZjRnWxw+XEGSj1TIZTOSwgFTPrLd/i3iuDUxY5tCtUX6C9hwBKisyGz
         YoyblvqwYh4TnNexMaDFSi1n+VWUdptMULkHB5dXWCJ82vRmRoqN5tC3/JiBh4RNdbIB
         +FwZnH2HL0eKOyg0OLB98ZxjEOB5rp1jlkrK28NDS4LSzGbv2OkLKRkeIk1CTthy4qBK
         hdzN06o5aJfqpK9pzMJqLRjq5JfUMntXvRRd+ue8syvEjSKO8E1bhnJbrU0YhijxENR9
         LMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=tPePu7pSpTPNOXIejkRoYY8GOOyZlXM/IzBHuBk3B3g=;
        b=GRRODX9jbE6fe00l1xFmdoWCQMOI1ORnIhMMyH9R6aOrEgv2KK7pEhhkcoPrloRdwo
         gFCDgRipnBtsxW/tWgbJuW8PM6NOOVKTzXteQ9Wky2eBiem6quOPTO7XQ2kWI680ha90
         WT3S7zjwPVIMsh4UWN5HGwR+RY0QuaRpjAJXOSmX74BCJDMjErH9rNkx6iAToY3zqE36
         OP2au7DBHttSJIqLcVO9Ztrx5DChKCI8pYP2PSuebiVKwDYWEAUyYtT6LVGue/ivpDxW
         TnUAKySWFD9+NO/s1CAydm8ScLD1fTf1ADRg4YAZ73qHGjNVRYGHNyE1Ft20QirnwUZL
         C1fg==
X-Gm-Message-State: APjAAAUYZ/lg5Jhv/gA02oQLAr3jDpRI81szpiKbgMRo04sKSrrXa0AD
        AmkUJ9WNMbBxez26Ie0xZtVXUxCR
X-Google-Smtp-Source: APXvYqx5cB9psRdWqvSaNPzT1VMaszaZ19aUpmz+gk+vl60WQsCY+xUmzn91Xq0QA+mCSyQDSuz7jQ==
X-Received: by 2002:a17:902:20e9:: with SMTP id v38mr50187014plg.62.1563450209272;
        Thu, 18 Jul 2019 04:43:29 -0700 (PDT)
Received: from [127.0.0.1] (FL1-133-202-12-40.iwa.mesh.ad.jp. [133.202.12.40])
        by smtp.gmail.com with ESMTPSA id r6sm51105864pjb.22.2019.07.18.04.43.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jul 2019 04:43:28 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     mark.rutland@arm.com, devicetree@vger.kernel.org,
        geert+renesas@glider.be, daniel.lezcano@linaro.org,
        linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
        Magnus Damm <magnus.damm@gmail.com>, tglx@linutronix.de
Date:   Thu, 18 Jul 2019 20:44:53 +0900
Message-Id: <156345029298.5307.13303613183227788698.sendpatchset@octo>
In-Reply-To: <156345023791.5307.6113391102648394591.sendpatchset@octo>
References: <156345023791.5307.6113391102648394591.sendpatchset@octo>
Subject: [PATCH 4/7] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a77995
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

This patch adds DT binding documentation for the CMT devices on
the R-Car Gen3 D3 (r8a77995) SoC.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Rob Herring <robh@kernel.org>
---

 Documentation/devicetree/bindings/timer/renesas,cmt.txt |    2 ++
 1 file changed, 2 insertions(+)

--- 0006/Documentation/devicetree/bindings/timer/renesas,cmt.txt
+++ work/Documentation/devicetree/bindings/timer/renesas,cmt.txt	2019-07-18 18:25:04.331001914 +0900
@@ -53,6 +53,8 @@ Required Properties:
     - "renesas,r8a77980-cmt1" for the 48-bit CMT1 device included in r8a77980.
     - "renesas,r8a77990-cmt0" for the 32-bit CMT0 device included in r8a77990.
     - "renesas,r8a77990-cmt1" for the 48-bit CMT1 device included in r8a77990.
+    - "renesas,r8a77995-cmt0" for the 32-bit CMT0 device included in r8a77995.
+    - "renesas,r8a77995-cmt1" for the 48-bit CMT1 device included in r8a77995.
     - "renesas,sh73a0-cmt0" for the 32-bit CMT0 device included in sh73a0.
     - "renesas,sh73a0-cmt1" for the 48-bit CMT1 device included in sh73a0.
     - "renesas,sh73a0-cmt2" for the 32-bit CMT2 device included in sh73a0.
