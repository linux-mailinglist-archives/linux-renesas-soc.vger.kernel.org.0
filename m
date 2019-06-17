Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE46D47DC1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 11:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726434AbfFQJB7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 05:01:59 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:46318 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725763AbfFQJB7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 05:01:59 -0400
Received: by mail-pf1-f193.google.com with SMTP id 81so5301206pfy.13;
        Mon, 17 Jun 2019 02:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=Fyw6fGR19Y3g9L2tNHwdSj3i4w1QJeuIIljQdE4u4oU=;
        b=gNaEt0xEcs3BZCMW+sDWrmweIUnPnDR0ilRRUqlOxOofq1fodf4MjP6JalCkFndvWw
         Tc9bQeICz3bPgEg3Tl3EhR/YN9Rv3HhcGp70701wbBdcu9J1UYtFBiJvZ02wSj0cHyJJ
         PYvXfeb9/qHerTQQ+Gdg+XRrwB4acHd/ceknQ21vGt/RE2EDpsSg/j3zqThqW5URepsL
         d21F+c6lfUBjh8f9s0mzPqxF3MkMdwGzT7vzBa1INpAuX1d8c6E7+b1v13pEPYeK72g8
         14f64Bnw065KpAd2eeDnDm7qSVVigeKRdihkw7BEdKD7V0aOfb+PHMwW4GC7q//2IEHY
         LWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=Fyw6fGR19Y3g9L2tNHwdSj3i4w1QJeuIIljQdE4u4oU=;
        b=DWobcsOyOBomy6Audz1PSblvTLi0p5SZL00UPiHpyirLQ9otKwMDR1tR3JtfPZsFrU
         mP7va5WszM0+0JKA4Opge5wnCFjKSLaia2JHwyzJbRXFQZbkGQdDQf55LPAJa4R7e30X
         q5JDNxZnFkhgm+sC6F+x2fV6k/c6252/P2x5nl/TEQgdkmmL8HJa5fksmtqDjOk9Vhiq
         oU9QObD9LmRDN1DbxdMoShwybKmmxI990a14MlXFTiLH3EEfY5HANrxH67qKX+7bB2JI
         ay5UDrKKToFcAjlOUxp23bnqO18RJZLIIda8xBgi9MN8AJJl7qOV3Liri7Si+zmb0AuP
         k9cg==
X-Gm-Message-State: APjAAAXntF40h2bcdi78LCxVuXTxza8D8/8W6mKO78fg49PnamYLLgUZ
        NzgQv0Av6MGjt5SklFfhXUBWYIWh
X-Google-Smtp-Source: APXvYqwgeRmRzJeKuYpjvUdLYGSpMvFVMUT82ZMuBDbvce+hybhXEJi+Euvm0TfKq3/syk8bf54bjw==
X-Received: by 2002:a62:a511:: with SMTP id v17mr109711830pfm.129.1560762118379;
        Mon, 17 Jun 2019 02:01:58 -0700 (PDT)
Received: from [127.0.0.1] (l193216.ppp.asahi-net.or.jp. [218.219.193.216])
        by smtp.gmail.com with ESMTPSA id y21sm7547003pfe.172.2019.06.17.02.01.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 02:01:57 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     devicetree@vger.kernel.org
Cc:     mark.rutland@arm.com, linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>, robh+dt@kernel.org
Date:   Mon, 17 Jun 2019 18:03:23 +0900
Message-Id: <156076220389.4736.5742093495634461883.sendpatchset@octo>
In-Reply-To: <156076216767.4736.16337667537984218274.sendpatchset@octo>
References: <156076216767.4736.16337667537984218274.sendpatchset@octo>
Subject: [PATCH 4/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a7795
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

This patch adds DT binding documentation for the CMT devices on
the R-Car Gen3 H3 (r8a7795) SoC.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Documentation/devicetree/bindings/timer/renesas,cmt.txt |    2 ++
 1 file changed, 2 insertions(+)

--- 0006/Documentation/devicetree/bindings/timer/renesas,cmt.txt
+++ work/Documentation/devicetree/bindings/timer/renesas,cmt.txt	2019-06-17 13:53:43.252212551 +0900
@@ -41,6 +41,8 @@ Required Properties:
     - "renesas,r8a7793-cmt1" for the 48-bit CMT1 device included in r8a7793.
     - "renesas,r8a7794-cmt0" for the 32-bit CMT0 device included in r8a7794.
     - "renesas,r8a7794-cmt1" for the 48-bit CMT1 device included in r8a7794.
+    - "renesas,r8a7795-cmt0" for the 32-bit CMT0 device included in r8a7795.
+    - "renesas,r8a7795-cmt1" for the 48-bit CMT1 device included in r8a7795.
     - "renesas,r8a7796-cmt0" for the 32-bit CMT0 device included in r8a7796.
     - "renesas,r8a7796-cmt1" for the 48-bit CMT1 device included in r8a7796.
     - "renesas,r8a77970-cmt0" for the 32-bit CMT0 device included in r8a77970.
