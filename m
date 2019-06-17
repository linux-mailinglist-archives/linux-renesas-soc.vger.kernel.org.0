Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6ABE747DBB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 11:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726225AbfFQJBc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 05:01:32 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:37199 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725763AbfFQJBb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 05:01:31 -0400
Received: by mail-pg1-f195.google.com with SMTP id n65so980012pga.4;
        Mon, 17 Jun 2019 02:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=ybbY1Dpks8zCn0/qN5aCubNoEg8FHHCejP80vfW4G0Q=;
        b=nTgxVDOBKHoHQjT0X0rxIFi+OAWlRSEiRnVeBioTimTN0YLf7dO+6xl9GZXCJUs5C2
         a6Ek9S9eYdlOL0Yb5WigjQAbrfFnnadYZ+y/YhtYG24EVBlcKjSp/T7oPJORutY80+OP
         F05K61hvhwUN6/osCimNsl/JhFkvpYUDMsvX48ZvMk7WUwWORJBCtnAP1i+tdlZU/OZ5
         qb1P6QC2xi5ulAZuxA6JMWuJBO+ZZxAbVIVWfcZ7qoX2HUiLO7l5c3NQPtgZwDbGBwcz
         e3ZjlWpPyXP+N907qV0gAMU9b+Hy9r2N5LiSNK+ToTbWIJ/yU0J1f5DKp0CUF141PaeP
         MeHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=ybbY1Dpks8zCn0/qN5aCubNoEg8FHHCejP80vfW4G0Q=;
        b=GpkIA31KedV/QMiLFW3CEZ64WludX5/WqBbpmFNY9DL+z5cKrGqcErJIpT5ldwN8pD
         9F1TE3Jkah+f13e35qdiNMYrnulTbtehyC7IbPPBDPwl2V3TWzf91yz+KYqJef+SyT9b
         LoRM9lvJ3aHVlqL2HdQqKTtbWGgGbE2UKwALAz/FZ3aH7asKwfkIrdF+mVDoO+l14FqY
         /E9yGr5cNkmNjO6c72iqsNRotws3jC6N8+mf8PlV5z6pl5hnlRJdENX4vQQSaljtjRH1
         e1jldWHQ5mt0TLSJCrpUamGYqGsGyUfO1hbiuIlz2mDyra7+XGgvStBFKkgrqqSzMwvA
         J7+g==
X-Gm-Message-State: APjAAAWOHj7QuQGUyMvQfFQ6Y0KyogSObmobZ6CpMCqG9xmYl5hkOp5r
        YXgIZEHZEPjUUktAxl2D8eHm+sn8
X-Google-Smtp-Source: APXvYqwb/DBDTvpO6yQWf+hkB2BMQFgya/a0YAsM51FfploIfvCY7XF8bk5aAYF1fpHS8/zANF3Wuw==
X-Received: by 2002:a62:ce4f:: with SMTP id y76mr29627038pfg.21.1560762091010;
        Mon, 17 Jun 2019 02:01:31 -0700 (PDT)
Received: from [127.0.0.1] (l193216.ppp.asahi-net.or.jp. [218.219.193.216])
        by smtp.gmail.com with ESMTPSA id y1sm10115154pjw.5.2019.06.17.02.01.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 02:01:30 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     devicetree@vger.kernel.org
Cc:     mark.rutland@arm.com, linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>, robh+dt@kernel.org
Date:   Mon, 17 Jun 2019 18:02:56 +0900
Message-Id: <156076217672.4736.6510117188637868943.sendpatchset@octo>
In-Reply-To: <156076216767.4736.16337667537984218274.sendpatchset@octo>
References: <156076216767.4736.16337667537984218274.sendpatchset@octo>
Subject: [PATCH 1/8] dt-bindings: timer: renesas, cmt: Add CMT0234 to sh73a0 and r8a7740
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Document the on-chip CMT devices included in r8a7740 and sh73a0.

Included in this patch is DT binding documentation for 32-bit CMTs
CMT0, CMT2, CMT3 and CMT4. They all contain a single channel and are
quite similar however some minor differences still exist:
 - "Counter input clock" (clock input and on-device divider)
    One example is that RCLK 1/1 is supported by CMT2, CMT3 and CMT4.
 - "Wakeup request" (supported by CMT0 and CMT2)

Because of this one unique compat string per CMT device is selected.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Documentation/devicetree/bindings/timer/renesas,cmt.txt |    8 ++++++++
 1 file changed, 8 insertions(+)

--- 0001/Documentation/devicetree/bindings/timer/renesas,cmt.txt
+++ work/Documentation/devicetree/bindings/timer/renesas,cmt.txt	2019-06-17 13:26:56.325963995 +0900
@@ -22,6 +22,10 @@ Required Properties:
 
     - "renesas,r8a73a4-cmt0" for the 32-bit CMT0 device included in r8a73a4.
     - "renesas,r8a73a4-cmt1" for the 48-bit CMT1 device included in r8a73a4.
+    - "renesas,r8a7740-cmt0" for the 32-bit CMT0 device included in r8a7740.
+    - "renesas,r8a7740-cmt2" for the 32-bit CMT2 device included in r8a7740.
+    - "renesas,r8a7740-cmt3" for the 32-bit CMT3 device included in r8a7740.
+    - "renesas,r8a7740-cmt4" for the 32-bit CMT4 device included in r8a7740.
     - "renesas,r8a7743-cmt0" for the 32-bit CMT0 device included in r8a7743.
     - "renesas,r8a7743-cmt1" for the 48-bit CMT1 device included in r8a7743.
     - "renesas,r8a7744-cmt0" for the 32-bit CMT0 device included in r8a7744.
@@ -48,6 +52,10 @@ Required Properties:
     - "renesas,r8a77970-cmt1" for the 48-bit CMT1 device included in r8a77970.
     - "renesas,r8a77980-cmt0" for the 32-bit CMT0 device included in r8a77980.
     - "renesas,r8a77980-cmt1" for the 48-bit CMT1 device included in r8a77980.
+    - "renesas,sh73a0-cmt0" for the 32-bit CMT0 device included in sh73a0.
+    - "renesas,sh73a0-cmt2" for the 32-bit CMT2 device included in sh73a0.
+    - "renesas,sh73a0-cmt3" for the 32-bit CMT3 device included in sh73a0.
+    - "renesas,sh73a0-cmt4" for the 32-bit CMT4 device included in sh73a0.
 
     - "renesas,rcar-gen2-cmt0" for 32-bit CMT0 devices included in R-Car Gen2
 		and RZ/G1.
