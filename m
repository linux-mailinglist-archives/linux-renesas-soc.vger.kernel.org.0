Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFEF96CD93
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jul 2019 13:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389994AbfGRLnM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Jul 2019 07:43:12 -0400
Received: from mail-pg1-f181.google.com ([209.85.215.181]:36155 "EHLO
        mail-pg1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726608AbfGRLnL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Jul 2019 07:43:11 -0400
Received: by mail-pg1-f181.google.com with SMTP id l21so12786490pgm.3;
        Thu, 18 Jul 2019 04:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=lHm/SnAy3z7GpF51kHy6TrQ8kpH1638yiyjDOGq15/Y=;
        b=PPiVFn6CGKhqfkX7njs3mE+1vNFJWNvSKB7nECzgWnVF+Dtot3jDXUySnQyHFzhIwl
         TnlxI3tzatI2j6WKibZGz9vlhY/w9lvFqJ5XpI4f+DH+wvumuhX4AwuqQ4tE9X1cdIqL
         FpvPbum/2hWZDw3FURLuQltgsn4yFkuLXf7CsvQjGBwwozcmP8OYvgbZ7AMWuvD3asL7
         wlVAsvS5yCQR1j2meM3XC2L2L2mJ+TgGKzJ40DXZqzMhEa2OrsdIQxaaDUvZILTdkN0c
         D9tQzad62uhiOEndNCtZTqba1VrEpru7ieSjnP39x8X5EXevJ4wAisFvMPanfaGg/rMa
         x5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=lHm/SnAy3z7GpF51kHy6TrQ8kpH1638yiyjDOGq15/Y=;
        b=FgTyG/knW+3WKRS1JZAGcPS3U9ElS7hxLAB9DGAtoVGM4opeppkik31J0+Fb7Z78QC
         joLmXK0f+of9Ll7FZvV8+LOJJFYxLCMvnKL6ijbCxcFtM9scrvS4p+svcdrER8UfbHZ9
         iZAjXCkJ7WmdfOHTxGFmKDIipx2gWHZZNMX008DCHFjgKP1jduxpREgU2YoMd4TjcF1Y
         4hrmpTOoesugpDNnjSx6WqqS1dViN49ihKQne3qeTkANi7umXJZKf582Yby4LrxIjIiO
         x+QBa/NiHCoe6jYXkDhRXRikDy5/xSew8FYhCsZ0zVnx2yc7TJiyxdBBKqtJ8HOWLiTI
         mPcw==
X-Gm-Message-State: APjAAAVX01LbgstGkzEdRirzr8rxHLrP+oBP4Lh9DaUWQx4uUlelNQBY
        rAG+X366ZF/mdhQNenfoMfCfP+Zd
X-Google-Smtp-Source: APXvYqy5uxWCqnR38AUskc5el0oSCe8s0o21ANA74xpa8c4PVSgcg2QO6yC8EPmnkvmsBQQaDFLGtA==
X-Received: by 2002:a63:d603:: with SMTP id q3mr1397852pgg.0.1563450190669;
        Thu, 18 Jul 2019 04:43:10 -0700 (PDT)
Received: from [127.0.0.1] (FL1-133-202-12-40.iwa.mesh.ad.jp. [133.202.12.40])
        by smtp.gmail.com with ESMTPSA id c12sm11443410pgb.83.2019.07.18.04.43.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jul 2019 04:43:09 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     mark.rutland@arm.com, devicetree@vger.kernel.org,
        geert+renesas@glider.be, daniel.lezcano@linaro.org,
        linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
        Magnus Damm <magnus.damm@gmail.com>, tglx@linutronix.de
Date:   Thu, 18 Jul 2019 20:44:39 +0900
Message-Id: <156345027946.5307.6314778386600420219.sendpatchset@octo>
In-Reply-To: <156345023791.5307.6113391102648394591.sendpatchset@octo>
References: <156345023791.5307.6113391102648394591.sendpatchset@octo>
Subject: [PATCH 3/7] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a7792
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
