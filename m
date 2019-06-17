Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF99D47DC7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 11:02:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbfFQJC1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 05:02:27 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44083 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725763AbfFQJC1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 05:02:27 -0400
Received: by mail-pf1-f194.google.com with SMTP id t16so5304460pfe.11;
        Mon, 17 Jun 2019 02:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=Aju/iBsgpbdvtlxocMrEtU6cqwLlRS4JIogrfVsPRJc=;
        b=o6o4RAMzD+8GBX9+8YvI4Gi+Q7zDEQn2/3cldHCwKCzVHadGJxJD6rAJ1aqOHtK4AQ
         VlFXA0NdFSzmbCMt6XfT3CAdMwQ1DmWxgnSrXeiLqP8VCfxpSkYTlEJSqNn4GLIqVvE5
         Ca4sgtc6GsIVwfjRC3Gj8ba5BKZv2whjRFOIhzVUdjcW32QxflIiRxfniBSL6yuo6zq4
         HixY21fwWEg25RxGKT03sZH7ZxFLGmLnP5WCO5IiZGe1tFGhZLRGIINXJ3QClVqZuafW
         kLDeq1JjXGwViTI21NLw8AeHkVmQuaO2vQY6BqHSkKIZpOxUlV/pneCJyPPtpcGmBaEW
         1p/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=Aju/iBsgpbdvtlxocMrEtU6cqwLlRS4JIogrfVsPRJc=;
        b=dVSZvXjD0OAD0eyh6bsTslkweDNU6HzTyktovWv3CrXgV9klTJ+79jF2z1b+2lRvq3
         fbZsbTorVY1bmUlS5YWcyBCoGP6racdfsku4uOlXhqCRixet1CXxF+oiR24Ym2QTOBez
         uUz/6DKGMz2FZT6ueJMu/jQzcumk6C9DBjaM5GX0MM8phK0c2X7bXhs2GrW17TzyZKdg
         nZuNfFiGQyBl2E3fBZbxGOWcOWpnmk1xw3qO7LMkIpTHgqOR58pcgtFjY6sm1+ovHxtU
         psAjVRfsbV6q/hYgpMA3E/tvlWKOsE5RY+ieqTayKazBg4nYH8LjME8bpYRYVnAX7eO5
         ccqw==
X-Gm-Message-State: APjAAAVEwhuiFE4q7NCcMu4PwhuaRDTXaFZdx2Umhcu5e8E6aWbd2XfI
        GML649SJT2d3oxyr3J9SAEIbaMcb
X-Google-Smtp-Source: APXvYqwzzMeKpCCgVpFyUBRZ3sN6KqREWJyRo1n8TlqhAbFGOTWN9AVs2Fit8Z/oyV9QskmA6Nkovw==
X-Received: by 2002:aa7:8202:: with SMTP id k2mr8649388pfi.31.1560762146385;
        Mon, 17 Jun 2019 02:02:26 -0700 (PDT)
Received: from [127.0.0.1] (l193216.ppp.asahi-net.or.jp. [218.219.193.216])
        by smtp.gmail.com with ESMTPSA id j1sm12672785pfe.101.2019.06.17.02.02.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 02:02:25 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     devicetree@vger.kernel.org
Cc:     mark.rutland@arm.com, linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>, robh+dt@kernel.org
Date:   Mon, 17 Jun 2019 18:03:51 +0900
Message-Id: <156076223184.4736.11067127180512614106.sendpatchset@octo>
In-Reply-To: <156076216767.4736.16337667537984218274.sendpatchset@octo>
References: <156076216767.4736.16337667537984218274.sendpatchset@octo>
Subject: [PATCH 7/8] dt-bindings: timer: renesas, cmt: Add CMT0 and CMT1 to r8a77995
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

This patch adds DT binding documentation for the CMT devices on
the R-Car Gen3 D3 (r8a77995) SoC.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Documentation/devicetree/bindings/timer/renesas,cmt.txt |    2 ++
 1 file changed, 2 insertions(+)

--- 0012/Documentation/devicetree/bindings/timer/renesas,cmt.txt
+++ work/Documentation/devicetree/bindings/timer/renesas,cmt.txt	2019-06-17 14:00:04.813217175 +0900
@@ -53,6 +53,8 @@ Required Properties:
     - "renesas,r8a77980-cmt1" for the 48-bit CMT1 device included in r8a77980.
     - "renesas,r8a77990-cmt0" for the 32-bit CMT0 device included in r8a77990.
     - "renesas,r8a77990-cmt1" for the 48-bit CMT1 device included in r8a77990.
+    - "renesas,r8a77995-cmt0" for the 32-bit CMT0 device included in r8a77995.
+    - "renesas,r8a77995-cmt1" for the 48-bit CMT1 device included in r8a77995.
     - "renesas,sh73a0-cmt0" for the 32-bit CMT0 device included in sh73a0.
     - "renesas,sh73a0-cmt1" for the 48-bit CMT1 device included in sh73a0.
     - "renesas,sh73a0-cmt2" for the 32-bit CMT2 device included in sh73a0.
