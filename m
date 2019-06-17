Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69A9C47DC5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 11:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbfFQJCS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 05:02:18 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40248 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725763AbfFQJCS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 05:02:18 -0400
Received: by mail-pg1-f196.google.com with SMTP id w10so792777pgj.7;
        Mon, 17 Jun 2019 02:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=KoRrrA2ZZKSQ7TfHbKGeznltuFGwMIp5syDEqkwMgVU=;
        b=r1ICiitGRK2/tKzPhAs1sDUSGY3rW8ImcuUTKlyhoTOeB/jn8bumzUH9lCsf4zAS0I
         U1Ga+T4YlcoGFoVnBNVe3jGPKBqCJjzmqEp9Yqi5FtRNa/YwTjmOMg0baIlF+0CyXhSF
         yktwHGdJ9xuPfTGxuLN5EBk71qX0GiHDgmX3pyah0QNCrqLVjfW1bCCPBP1H1HCPO/yD
         D+8kVTsFE2H05nmkpPvHyZItwwKYLBCz4pZJVKeC4LUA0dSl3rJRRqceaS7bMZbxNul+
         hMGuK833ZDB76mtTSyRGVU3Wv4xGtz2gOTBwnR+Ms5liqS5y0017lrcGv/4LHOfG/qVD
         bypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=KoRrrA2ZZKSQ7TfHbKGeznltuFGwMIp5syDEqkwMgVU=;
        b=f65R02bHHuJcB27mk+tjcZb2pHYxPYPZtCBCL03zXyYzxV7bPllCZoO71nvE4YHTiZ
         3mczAL0+vg/U3JnipzlSka9FqXWTLfNvFvYqBZouIcocTB/0t8PK3KRbN+rGWGEEqsTV
         QGP0L2yYoi30Sr1WR3S5ZWOdtgabDuQvb1DtuG+Npa+GjF/rpJcF03Q3vPjv8PCoJLrh
         /2WFFOFX9MXjDl2BwNAKBgZ0VkOV/Fn7RziLyzLrWP0IKVztwTT2EjwfT7RQPpZsCOGw
         BprV+bBF1DW0GMdnScM9/DA57InV6uuBWK0nbwmRnmkqrLM7SA0Kghug78PXK16I/8Gd
         dJuA==
X-Gm-Message-State: APjAAAUuBwGq4dBd37ONErp7GIPVx4zrHHifvrUBNxaBwpY5uCzNupEc
        WW74J9O+jni4woRs3B7WtvgJKj2X
X-Google-Smtp-Source: APXvYqxesfXxDXsqI41DmJ7R25b4uBEl+461j/H7tv4roX8a5U5S9Ya7nDZJQJSA8+o+PK93MHKTow==
X-Received: by 2002:a17:90a:2228:: with SMTP id c37mr25526009pje.9.1560762137113;
        Mon, 17 Jun 2019 02:02:17 -0700 (PDT)
Received: from [127.0.0.1] (l193216.ppp.asahi-net.or.jp. [218.219.193.216])
        by smtp.gmail.com with ESMTPSA id y5sm10588764pgv.12.2019.06.17.02.02.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 02:02:15 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     devicetree@vger.kernel.org
Cc:     mark.rutland@arm.com, linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>, robh+dt@kernel.org
Date:   Mon, 17 Jun 2019 18:03:42 +0900
Message-Id: <156076222206.4736.3009593403446400658.sendpatchset@octo>
In-Reply-To: <156076216767.4736.16337667537984218274.sendpatchset@octo>
References: <156076216767.4736.16337667537984218274.sendpatchset@octo>
Subject: [PATCH 6/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a77990
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

This patch adds DT binding documentation for the CMT devices on
the R-Car Gen3 E3 (r8a77990) SoC.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Documentation/devicetree/bindings/timer/renesas,cmt.txt |    2 ++
 1 file changed, 2 insertions(+)

--- 0010/Documentation/devicetree/bindings/timer/renesas,cmt.txt
+++ work/Documentation/devicetree/bindings/timer/renesas,cmt.txt	2019-06-17 13:58:48.559219302 +0900
@@ -51,6 +51,8 @@ Required Properties:
     - "renesas,r8a77970-cmt1" for the 48-bit CMT1 device included in r8a77970.
     - "renesas,r8a77980-cmt0" for the 32-bit CMT0 device included in r8a77980.
     - "renesas,r8a77980-cmt1" for the 48-bit CMT1 device included in r8a77980.
+    - "renesas,r8a77990-cmt0" for the 32-bit CMT0 device included in r8a77990.
+    - "renesas,r8a77990-cmt1" for the 48-bit CMT1 device included in r8a77990.
     - "renesas,sh73a0-cmt0" for the 32-bit CMT0 device included in sh73a0.
     - "renesas,sh73a0-cmt1" for the 48-bit CMT1 device included in sh73a0.
     - "renesas,sh73a0-cmt2" for the 32-bit CMT2 device included in sh73a0.
