Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D86A2E8390
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Jan 2021 12:40:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbhAALkQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Jan 2021 06:40:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726134AbhAALkP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Jan 2021 06:40:15 -0500
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6504EC061573;
        Fri,  1 Jan 2021 03:39:35 -0800 (PST)
Received: by mail-io1-xd31.google.com with SMTP id t8so18995750iov.8;
        Fri, 01 Jan 2021 03:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ftWeC47Nf1VAJxhQpQIn3rZh7wSRhvvJHzUFZS0n3bg=;
        b=XtFIqsZk9AbBlrSJ+Es8EG5Dk9Yh6yNmkf17SPVm0EU0hUjnDpbkLKAd3cpObVD6Es
         zWHEqMb/T6kdzoJwduVUSgM8aLgKUxY8yLxnjC+JtnB0IOiO8yn5xmlc24ARkbJFjvp8
         qVsG7/EqcO31Zv4MOnbYMI/Iah3SDdZY8fJLjxD5VeddISip6Jy6n+2pgWcZ4FMUZq7H
         lNaWpkI0PAFCNatCMkgj37DoyJF5LqpOU/Sn7Kdrh6FbfTHxOB71oQqvxHvMqZ+ok51G
         gx6yynir8qrJa7MXNqotzr8G88W/cIrzri3C28BRNvAkrzQeXVwlhibdTBgerHvJ8uQd
         S/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ftWeC47Nf1VAJxhQpQIn3rZh7wSRhvvJHzUFZS0n3bg=;
        b=J9AZDsKT7kNt5xpFf1ZgD96pk9f3ROFMcSurjTR2SIuRZmcoLjr53XsNd72FPcWWS6
         b1Z69kqxU30gMTm1KOlKiY4uxb+PbgR+6t9v7LIFnClWZschXoKGDANhtmELrMIM3Chu
         yHhp43pk/FkQ+QZjiT0C8SBmbhpZbtRrZK1m2zlttgi63YyOM8HROuyXXJSc7uyBL00I
         CaxNyWmQ40LtCYgL5BqtVf+L/k+2YUY5oBFeqsUammZtvWgdn29UEEF5P01MlwcDHrb5
         de1RcjPDwWOi66ZNhAMnqyFHPR8m5+6IUMLDz8OgDClx9L21oWXbbxsqPaFtg/1VEmKJ
         6nFg==
X-Gm-Message-State: AOAM533zZ4blyRDLjiTj+/sSqoujG2mrpEEGrYsCj0NXHhoXLssgwNyj
        IH2moa0XKVk/1Zvtzo9qXIs+lEDbyRjJQQ==
X-Google-Smtp-Source: ABdhPJxCKZkXmJs3RaS4dYhxWqj8v8K7qRfZ9E0OP4PaaFeKO7usoT5JpVsSDJJZPrO09J7X2k2SjQ==
X-Received: by 2002:a05:6602:2c48:: with SMTP id x8mr50128427iov.24.1609501174077;
        Fri, 01 Jan 2021 03:39:34 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:f45d:df49:9a4c:4914])
        by smtp.gmail.com with ESMTPSA id i6sm33774172ilm.70.2021.01.01.03.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jan 2021 03:39:33 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: memory: Renesas RPC-IF:  Add support for RZ/G2 Series
Date:   Fri,  1 Jan 2021 05:39:25 -0600
Message-Id: <20210101113927.3252309-1-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The RZ/G2 Series has the RPC-IF interface.
Update bindings to support: r8a774a1, r8a774b1, r8a774c0, and r8a774e1

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 .../bindings/memory-controllers/renesas,rpc-if.yaml           | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml b/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
index 6d6ba608fd22..050c66af8c2c 100644
--- a/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
@@ -26,6 +26,10 @@ properties:
   compatible:
     items:
       - enum:
+          - renesas,r8a774a1-rpc-if       # RZ/G2M
+          - renesas,r8a774b1-rpc-if       # RZ/G2N
+          - renesas,r8a774c0-rpc-if       # RZ/G2E
+          - renesas,r8a774e1-rpc-if       # RZ/G2H
           - renesas,r8a77970-rpc-if       # R-Car V3M
           - renesas,r8a77980-rpc-if       # R-Car V3H
           - renesas,r8a77995-rpc-if       # R-Car D3
-- 
2.25.1

