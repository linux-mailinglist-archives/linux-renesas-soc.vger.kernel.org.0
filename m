Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA6BD95EA5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2019 14:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729913AbfHTMdr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Aug 2019 08:33:47 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34245 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728366AbfHTMdr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Aug 2019 08:33:47 -0400
Received: by mail-pf1-f195.google.com with SMTP id b24so3322218pfp.1;
        Tue, 20 Aug 2019 05:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=2OniBu/IvTb/n2Hc5EWkIP9jtRjD6Kd2174qWP69kZA=;
        b=VUujqLe4B4DPUouqETpSI24k1HGY5GtUhMI89gCNLQ6gBFNlLaVMV0i9LacdXe636f
         UMU/npAnWQxHRCW5hENbF7QOsSWhwK6kdCqyUWY+scaI9W50fYDEuM3gjPEHJQm1/lRT
         8TIOCYYhPNlbxbZmCzQA6kQziqAhas8NlrYE5gSgC5aalzaIM9Cofde7GeNFr1MCXRLy
         NUcqGk4fCFj0qVSlr9rY0Az9ofuOIMPvbqmWFOLb4eKofkqehv90iuA20X/McjfP1MUZ
         hTrP6jt9XInH6CxkJRPGKyjdGLFfS8cBwWsRFi9JlFiKlrjFcR3sJ6FFRRP/YVjDLRDJ
         LJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=2OniBu/IvTb/n2Hc5EWkIP9jtRjD6Kd2174qWP69kZA=;
        b=Xw/Eh14wujbpS0f6/dt/+LDebxz4SuC95HzeJtllYGoiIIkC5P/r+jBoJTliyPbtbg
         sv82YvjdrznkW/vX6Wcucv1/R/pAhVTVzZ9X/4CqDybLvnVuXDeKSwjOzZrubmmjIQur
         T4nIaJSWmoJEs3bus3049mndQ+DVDs6JS8QZGILnmgaMhh/rFmQuSTNal8naw+cBiBPh
         dgRuY65JOl+LspDEE5bvyCZ4aPx8lLGk0VtoyS9/5NtU9BOWiaB14JEnLJse9vgvcKRR
         96NxuUxXIMZP6zTq20ztRyaiYRmYrDtqtTtgsvMmvVf9187sTWaF7jWIlmR03LVqHoFS
         xFjw==
X-Gm-Message-State: APjAAAWhK4nx+b4TEIQBRP6mGYy1YAQj28xCBLqnBwgIkJCSBms/pOkE
        85xF1bN6cDZWMISH22lsI4cIzKLw
X-Google-Smtp-Source: APXvYqyl2Z3dCSiM20Mgs8l622OtGUEx88W4nrneL8zk0MfP9qiW5O/SdJtJqWvaOoby5pmPuAyYew==
X-Received: by 2002:a63:6106:: with SMTP id v6mr24155403pgb.36.1566304426544;
        Tue, 20 Aug 2019 05:33:46 -0700 (PDT)
Received: from [127.0.0.1] (l193216.ppp.asahi-net.or.jp. [218.219.193.216])
        by smtp.gmail.com with ESMTPSA id d12sm18788077pfn.11.2019.08.20.05.33.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Aug 2019 05:33:45 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     mark.rutland@arm.com, devicetree@vger.kernel.org,
        geert+renesas@glider.be, daniel.lezcano@linaro.org,
        linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
        horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>,
        tglx@linutronix.de
Date:   Tue, 20 Aug 2019 21:35:25 +0900
Message-Id: <156630452545.17444.4277682052018128256.sendpatchset@octo>
In-Reply-To: <156630449239.17444.11157306180861080402.sendpatchset@octo>
References: <156630449239.17444.11157306180861080402.sendpatchset@octo>
Subject: [PATCH v2 3/7] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a7792
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

This patch adds DT binding documentation for the CMT devices on
the R-Car Gen2 V2H (r8a7792) SoC.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---

 Documentation/devicetree/bindings/timer/renesas,cmt.txt |    2 ++
 1 file changed, 2 insertions(+)

--- 0004/Documentation/devicetree/bindings/timer/renesas,cmt.txt
+++ work/Documentation/devicetree/bindings/timer/renesas,cmt.txt	2019-07-18 18:23:48.256013425 +0900
@@ -35,6 +35,8 @@ Required Properties:
     - "renesas,r8a7790-cmt1" for the 48-bit CMT1 device included in r8a7790.
     - "renesas,r8a7791-cmt0" for the 32-bit CMT0 device included in r8a7791.
     - "renesas,r8a7791-cmt1" for the 48-bit CMT1 device included in r8a7791.
+    - "renesas,r8a7792-cmt0" for the 32-bit CMT0 device included in r8a7792.
+    - "renesas,r8a7792-cmt1" for the 48-bit CMT1 device included in r8a7792.
     - "renesas,r8a7793-cmt0" for the 32-bit CMT0 device included in r8a7793.
     - "renesas,r8a7793-cmt1" for the 48-bit CMT1 device included in r8a7793.
     - "renesas,r8a7794-cmt0" for the 32-bit CMT0 device included in r8a7794.
