Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBCB047DC3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 11:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbfFQJCI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 05:02:08 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:36401 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725763AbfFQJCI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 05:02:08 -0400
Received: by mail-pl1-f195.google.com with SMTP id k8so2850057plt.3;
        Mon, 17 Jun 2019 02:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=QeKx5f6B8obGMjHnHgRc9/Rye5f2QLR71iPpT2K4whY=;
        b=F/snYSNGI3jtQmfkotthQ2l7SIEIG8TWc2IhD4JcwRSOLxgid025tD5A5sbfDKu9sS
         kuuBdZGC2ppago1BqmKUy6Nub/Kl9m/k5Rut3y0GDJcVQ2W9GBvVN3e+Cevj3iiyAu8h
         jLS6942i+0Tq94XlDSvdkz90dzXlJtPMjuQ1lAG8mtXoUWi/UMoScCeCpLPJbCA9dspq
         0uorlgOoVLZKrBAUSQOnHUg7OR4yI/KvbFTgFekWkSPAK1LgjbSqcYEToxqCwRKwFqyc
         q944LL50/m9rCwTi/2eTnLFq5ChpSLiMzSnkfA9fq+tHf91KobZZ4KFRRu0Uxoxh4sGs
         mbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=QeKx5f6B8obGMjHnHgRc9/Rye5f2QLR71iPpT2K4whY=;
        b=pW0hahArJ1D7VOISpNihLRuuozv5Bl0qOu4hwdh3Tj0k0hJDKlCq7ZWHL9dLpC9yrM
         4QY3aMoVuWlv7jvEZhyKITmI7eOQfsQDvpwMRml5u99JeRPlWr+1KLyo7dPvFYPPlKzA
         u46YH8W0skCunPkj71QIUG25jImdiAf7HRqD8eu+HAAeq6TSaZ04U318Fg6DUf5VphmF
         W2+SB3Duzv+RG/KUF6FQhQcie+reDJ48A08wJxHu5wbHeL5nmfTyWERyuLSB5y7W/TWp
         XPGpwYLoNtZ7HEj5alXcZEDi2WgQG1XhsBM/7dsxfvUCMjlCqjQ4+P2ihf4DQ1amNqhc
         x+9g==
X-Gm-Message-State: APjAAAWBdIKABpqYkZfq23YTlN6HJ+xSG0MSzn3ZMQWnIrJvQDvT7DgO
        SRw64g7tv4adY+03skc65Bznf8Ey
X-Google-Smtp-Source: APXvYqySdUB0dRxh2ukuqmPDKkp8PjH55qKayAjz42HZ5Hivj19kJCio4Nqg+c7gGlQr6+iBFWnAkA==
X-Received: by 2002:a17:902:d915:: with SMTP id c21mr40727194plz.335.1560762127338;
        Mon, 17 Jun 2019 02:02:07 -0700 (PDT)
Received: from [127.0.0.1] (l193216.ppp.asahi-net.or.jp. [218.219.193.216])
        by smtp.gmail.com with ESMTPSA id k3sm9420145pju.27.2019.06.17.02.02.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 02:02:06 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     devicetree@vger.kernel.org
Cc:     mark.rutland@arm.com, linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>, robh+dt@kernel.org
Date:   Mon, 17 Jun 2019 18:03:33 +0900
Message-Id: <156076221311.4736.11788780573341776795.sendpatchset@octo>
In-Reply-To: <156076216767.4736.16337667537984218274.sendpatchset@octo>
References: <156076216767.4736.16337667537984218274.sendpatchset@octo>
Subject: [PATCH 5/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a77965
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

This patch adds DT binding documentation for the CMT devices on
the R-Car Gen3 M3-N (r8a77965) SoC.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Documentation/devicetree/bindings/timer/renesas,cmt.txt |    2 ++
 1 file changed, 2 insertions(+)

--- 0009/Documentation/devicetree/bindings/timer/renesas,cmt.txt
+++ work/Documentation/devicetree/bindings/timer/renesas,cmt.txt	2019-06-17 13:57:59.708658149 +0900
@@ -45,6 +45,8 @@ Required Properties:
     - "renesas,r8a7795-cmt1" for the 48-bit CMT1 device included in r8a7795.
     - "renesas,r8a7796-cmt0" for the 32-bit CMT0 device included in r8a7796.
     - "renesas,r8a7796-cmt1" for the 48-bit CMT1 device included in r8a7796.
+    - "renesas,r8a77965-cmt0" for the 32-bit CMT0 device included in r8a77965.
+    - "renesas,r8a77965-cmt1" for the 48-bit CMT1 device included in r8a77965.
     - "renesas,r8a77970-cmt0" for the 32-bit CMT0 device included in r8a77970.
     - "renesas,r8a77970-cmt1" for the 48-bit CMT1 device included in r8a77970.
     - "renesas,r8a77980-cmt0" for the 32-bit CMT0 device included in r8a77980.
