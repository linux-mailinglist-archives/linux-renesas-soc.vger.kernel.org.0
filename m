Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D42639BD63
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jun 2021 18:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbhFDQku (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Jun 2021 12:40:50 -0400
Received: from mail-ej1-f53.google.com ([209.85.218.53]:34681 "EHLO
        mail-ej1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230465AbhFDQjL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Jun 2021 12:39:11 -0400
Received: by mail-ej1-f53.google.com with SMTP id g8so15482350ejx.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Jun 2021 09:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hmysv7a9uwPwQNbREOH2krp23T9dJn3Iq9cIImmKCLQ=;
        b=m9jtZO3yG6ZEMJNeajliOsgZjkEB78LTWXPNYYz6IVpAPZNTC8nQgEuzGUIHvZRR3B
         U3R6NqKCGOaGHfFlFLn4rsD92BNBUIuB1Wcw6nfz+OUgaHa5aO3HpzU/DFBxuqTHDOkC
         jnFYU39MD50BFi2SUAK+m+I2X7/wzjp1EZ0BfrZoo9Vzx5yfVD0QTGzvB1DWnSjPGPVJ
         hRWfNcQyHYCZmliU91TsGSJRkynAxwxE65AKTcJHbvjYM/9+oDd5ptmqyBEgGO7+mj7G
         AZxf2EID/PcmSoZYAE6sRWx0nrvkuxqB2bFsJeKTelGfkJwOEz3nFJIe0DYe01740CTC
         jvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hmysv7a9uwPwQNbREOH2krp23T9dJn3Iq9cIImmKCLQ=;
        b=AHT1sjTV7DF31v2ZnX0I1OTjKzVF44dVD97QYYMqe91tKv15qQgoKuQOqFsiN78gwD
         fOMJGLu3Q5fYp6aSI0PobV8LM8SixF/AfSLEcOPnsC38qjz511of6nl6Jsrrh8QX9XPm
         W53W04KTmEXnQVV4mEaG4Gr0VmubEhitp57EVFpOwDwCnXMLT0k35pwykmcZXlh85fz6
         tuU97UkVLLXZM65DEEqJyhsk4W33mZGZrwI76SnekVutOqNKlS+KrlL7HLjDj6QG4rYM
         qTlxFY9zlWV+hdbOFoDIg0RTJM4mhbjU0LrbLbRG+4m2p2RJK/Slek5hl0Xx8oQ1D8j7
         0OTw==
X-Gm-Message-State: AOAM531ZwzTHEECzI7jK7dLx0AzBW2YUoM9cXvxR8bjFrhXCR/iYAUQ5
        cKFW3af8LluwhqyC8dl+EHzJhQ==
X-Google-Smtp-Source: ABdhPJxG1LwD1PKOobDKiRS7DLdpIjSMKjOEJnoyI3Qkk8BlTuXYX0b/0nu/AlvRZdPdb2OX2DJw5w==
X-Received: by 2002:a17:906:8a55:: with SMTP id gx21mr5045362ejc.179.1622824573803;
        Fri, 04 Jun 2021 09:36:13 -0700 (PDT)
Received: from bismarck.berto.se (p4fca2710.dip0.t-ipconnect.de. [79.202.39.16])
        by smtp.googlemail.com with ESMTPSA id p10sm2959576edy.86.2021.06.04.09.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 09:36:13 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     devicetree@vger.kernel.org, linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2] media: dt-bindings: media: renesas,csi2: Add r8a779a0 support
Date:   Fri,  4 Jun 2021 18:35:49 +0200
Message-Id: <20210604163549.2871010-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for R-Car V3U.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/renesas,csi2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,csi2.yaml b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
index 23703b767f5b66f4..e6a036721082cdec 100644
--- a/Documentation/devicetree/bindings/media/renesas,csi2.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
@@ -30,6 +30,7 @@ properties:
           - renesas,r8a77970-csi2 # R-Car V3M
           - renesas,r8a77980-csi2 # R-Car V3H
           - renesas,r8a77990-csi2 # R-Car E3
+          - renesas,r8a779a0-csi2 # R-Car V3U
 
   reg:
     maxItems: 1
-- 
2.31.1

