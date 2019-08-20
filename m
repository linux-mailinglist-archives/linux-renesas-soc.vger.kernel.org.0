Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E74395EA8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2019 14:34:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729458AbfHTMd6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Aug 2019 08:33:58 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37800 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728366AbfHTMd5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Aug 2019 08:33:57 -0400
Received: by mail-pl1-f195.google.com with SMTP id bj8so2694467plb.4;
        Tue, 20 Aug 2019 05:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=9Tlc10QRrkzwPRJ8X0TkKc564s8B/22KIsVVaWaxv+k=;
        b=tDh7+hAaJvlbvYYQFCx/GssHKjMXi9/JEBVjHkk2MksjPcvLijspXFP2ctwjQOrUEc
         ADOjyRTu4Mm27mS+vB+35fySUMSge+EKr/jXLd+AolslRr5DJCuAh1Mx1zAIuB2mTfrm
         ShiWHmMINJ+gd5SmWPMsSDk6e5dcossvVZRIx2+pKuxBedBl0VRp5CivmH4M5cCEX6o9
         lkctokfDllqXY8U7d9+wmSiwj0rZPZrHpmfuHsGxAY0huL4xUBE6FOZNyQkIzT7tpTzr
         HIbCgzOU14bc8QzcipLgX8yaCn1HLB79JQxosPxPj4585zUrrCSDq3MFLPsMuR9ch9rt
         dZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=9Tlc10QRrkzwPRJ8X0TkKc564s8B/22KIsVVaWaxv+k=;
        b=q8qy5bVgo8F72axeLZkhlTbojOvhZ1tJ/NXfkZ8X6GJwRDo4/QM5UVgVWYeAl9izJh
         ymmY6wpzWIR8dV8hWeITjwVq11Ua+FwDkB+BfSfOdb7RSDRub/QyjmcZXRxxNgTsD39h
         6+/zctIIpo+/4UfwyUecJc5Pb9Mol55zOFyoZ+VVI65iP9W/N9ZZ//RQu/DExRoiGToc
         nigO89by/9ek3Fm1DoGBVlNvtwqZbIIbvkRyna2Y6Zids/DOySilPKQ7GmXQKCrJ+Z0W
         X0XSGsFxFp/zi7PjrMa2fnFXNbHovM8GAe7Ky07a5CxB+Nd2twqooiRcYEcllN6o7UY6
         jV8A==
X-Gm-Message-State: APjAAAVRHYL76UHGBXSW9xcgPayYsOzFp84uE3HOr7M2O08do/mwVO3s
        RlMREv+OsKmV0Y8x2DHQw2ZxVGmC
X-Google-Smtp-Source: APXvYqyIuB6z66x/vySh5yusevzVwaDpUL7xBnamEbAxsCrldeRnDOZt2xwk+KMYbQlfJHpfVLuG4g==
X-Received: by 2002:a17:902:f216:: with SMTP id gn22mr29295422plb.59.1566304436787;
        Tue, 20 Aug 2019 05:33:56 -0700 (PDT)
Received: from [127.0.0.1] (l193216.ppp.asahi-net.or.jp. [218.219.193.216])
        by smtp.gmail.com with ESMTPSA id z4sm19058314pgp.80.2019.08.20.05.33.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Aug 2019 05:33:55 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     mark.rutland@arm.com, devicetree@vger.kernel.org,
        geert+renesas@glider.be, daniel.lezcano@linaro.org,
        linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
        horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>,
        tglx@linutronix.de
Date:   Tue, 20 Aug 2019 21:35:36 +0900
Message-Id: <156630453593.17444.15839904958810436985.sendpatchset@octo>
In-Reply-To: <156630449239.17444.11157306180861080402.sendpatchset@octo>
References: <156630449239.17444.11157306180861080402.sendpatchset@octo>
Subject: [PATCH v2 4/7] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a77995
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
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
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
