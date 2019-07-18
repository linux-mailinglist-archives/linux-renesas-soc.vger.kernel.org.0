Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E0586CD8E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jul 2019 13:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727914AbfGRLm6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Jul 2019 07:42:58 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36287 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbfGRLm6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Jul 2019 07:42:58 -0400
Received: by mail-pf1-f195.google.com with SMTP id r7so12510956pfl.3;
        Thu, 18 Jul 2019 04:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=5Hwya+Wwg25VnCncH+8OKitD1ukfwLEFFxcSbFbJqkg=;
        b=mZSJIysQLYlHpV2TFVwv3SFVKuNFJjKBnMpOf7HkCRwag/rztCSCIgQZoWNDvWSj3v
         foU3KqCPRdx81EbGvHDb6qLPFQ0l6OyCVGePpBHKnzLZ0aCAaP/KVz7K/r8xOP0AuerS
         fwv1lVD/hLFdQ1fKU8jPFHY28+4JG+4hadAIjl2yaBK4I+ns8J5nWM2BU/jKNtgQFY07
         oA764nz2tJCf9TjFu6frXUhekC0DaF21pGNhZWXZOs8obcA4d04OxZnvS0k/Eom+KdQp
         SlVcS3MqKTfH8i18JpjZt/t4JW/VPI6e+cBRISE96q3pAYv1mL4Hiw80ML7QZ6Je18s8
         Bxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=5Hwya+Wwg25VnCncH+8OKitD1ukfwLEFFxcSbFbJqkg=;
        b=dD4HLoN+9CfAA9Ver+YLnS2RyaOi6l6itiD96ngjQYtZrxejMQ3jLT5cdVy07/WnHc
         EYpd8oPEshmyQXFs+GC1mNLgSb9SLsCECWn3VDkSFz/l9Bm+Js8AMPR0JKexBEkiXD5Q
         XOoYSq4X9FW/TV2SxrF1q9kjC9gRjJqzLMrcW51nQ5Ngu+7gO9jExAcBSu3d7tOvaLPp
         qWHDxEAwMWaXZMHota9L9bjDMBGTuNeUJBS9+E8wtBXEuRoCH5UtS/6UKz7rZcIFhRNt
         hgQrWmplTfqO5axwEQMJ47BcCN1dj3nk/wTiFe1fh3285pByt8FWt/qaPqbO7FCKrPGp
         8qvA==
X-Gm-Message-State: APjAAAUBWoezQJoplihg3LuJQTqa94kpwsxndLAzuWdXToOQUx3tn+Hi
        5kmufWbbdj4bXePqt0xQ7vyD/7IT
X-Google-Smtp-Source: APXvYqysYbJ5rimAhnv0tnpMVkuC6Ue1IatcAOSeQ6GTQeJPhS72UvlqNygBxLShLbeKIOhx/9X5sA==
X-Received: by 2002:a65:4841:: with SMTP id i1mr47001893pgs.316.1563450177159;
        Thu, 18 Jul 2019 04:42:57 -0700 (PDT)
Received: from [127.0.0.1] (FL1-133-202-12-40.iwa.mesh.ad.jp. [133.202.12.40])
        by smtp.gmail.com with ESMTPSA id 143sm43840115pgc.6.2019.07.18.04.42.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jul 2019 04:42:55 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     mark.rutland@arm.com, devicetree@vger.kernel.org,
        geert+renesas@glider.be, daniel.lezcano@linaro.org,
        linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
        Magnus Damm <magnus.damm@gmail.com>, tglx@linutronix.de
Date:   Thu, 18 Jul 2019 20:44:25 +0900
Message-Id: <156345026539.5307.17098096827162445534.sendpatchset@octo>
In-Reply-To: <156345023791.5307.6113391102648394591.sendpatchset@octo>
References: <156345023791.5307.6113391102648394591.sendpatchset@octo>
Subject: [PATCH 2/7] dt-bindings: timer: renesas, cmt: Update CMT1 on sh73a0 and r8a7740
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

This patch reworks the DT binding documentation for the 6-channel
48-bit CMTs known as CMT1 on r8a7740 and sh73a0.

After the update the same style of DT binding as the rest of the upstream
SoCs will now also be used by r8a7740 and sh73a0. The DT binding "cmt-48"
is removed from the DT binding documentation, however software support for
this deprecated binding will still remain in the CMT driver for some time.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Reviewed-by: Rob Herring <robh@kernel.org>
---

 Documentation/devicetree/bindings/timer/renesas,cmt.txt |   10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

--- 0002/Documentation/devicetree/bindings/timer/renesas,cmt.txt
+++ work/Documentation/devicetree/bindings/timer/renesas,cmt.txt	2019-07-18 18:21:59.453309074 +0900
@@ -12,17 +12,10 @@ datasheets.
 Required Properties:
 
   - compatible: must contain one or more of the following:
-    - "renesas,cmt-48-sh73a0" for the sh73A0 48-bit CMT
-		(CMT1)
-    - "renesas,cmt-48-r8a7740" for the r8a7740 48-bit CMT
-		(CMT1)
-    - "renesas,cmt-48" for all non-second generation 48-bit CMT
-		(CMT1 on sh73a0 and r8a7740)
-		This is a fallback for the above renesas,cmt-48-* entries.
-
     - "renesas,r8a73a4-cmt0" for the 32-bit CMT0 device included in r8a73a4.
     - "renesas,r8a73a4-cmt1" for the 48-bit CMT1 device included in r8a73a4.
     - "renesas,r8a7740-cmt0" for the 32-bit CMT0 device included in r8a7740.
+    - "renesas,r8a7740-cmt1" for the 48-bit CMT1 device included in r8a7740.
     - "renesas,r8a7740-cmt2" for the 32-bit CMT2 device included in r8a7740.
     - "renesas,r8a7740-cmt3" for the 32-bit CMT3 device included in r8a7740.
     - "renesas,r8a7740-cmt4" for the 32-bit CMT4 device included in r8a7740.
@@ -59,6 +52,7 @@ Required Properties:
     - "renesas,r8a77990-cmt0" for the 32-bit CMT0 device included in r8a77990.
     - "renesas,r8a77990-cmt1" for the 48-bit CMT1 device included in r8a77990.
     - "renesas,sh73a0-cmt0" for the 32-bit CMT0 device included in sh73a0.
+    - "renesas,sh73a0-cmt1" for the 48-bit CMT1 device included in sh73a0.
     - "renesas,sh73a0-cmt2" for the 32-bit CMT2 device included in sh73a0.
     - "renesas,sh73a0-cmt3" for the 32-bit CMT3 device included in sh73a0.
     - "renesas,sh73a0-cmt4" for the 32-bit CMT4 device included in sh73a0.
