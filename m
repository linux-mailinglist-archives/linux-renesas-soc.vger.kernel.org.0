Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC7AB923F9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2019 14:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727128AbfHSM4l (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Aug 2019 08:56:41 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:37824 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726987AbfHSM4k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Aug 2019 08:56:40 -0400
Received: by mail-pl1-f193.google.com with SMTP id bj8so942101plb.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Aug 2019 05:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=sgqmuCj/RwhLpjh12R7Oi6YVLgqjrWGfEXOYIrwgtrM=;
        b=UH/1fWczGCdO5dJrAJAP6YmwlhLfkOgoA61Yyk9krS+9Ei3i80MDb0oA5yLo9AZiY/
         OjHG0/bAFVgRC9XuWn2Gbu2UQc5SdcL4ES3I/+d01bs/u0R0eNnwKnVbNb9+ndj0CODC
         abTzKmjT5WG6trBZZpilvVATB81eDC/pRTZcs3JJwogEcrAOb3g0Qd7dJ0YT3F8QGPDM
         mbM1LwEhHSBo+zsKVILFWocpoCXqVkzsofCpedwBZ10JXK/qTYyUjX8yt8vXDYH23QtE
         DNCxFRvsKtReyvfteCK/mklIXuceJDVTu1YbroLVbcf1NAe2+D1mks75vpxNkXELrn2d
         tR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=sgqmuCj/RwhLpjh12R7Oi6YVLgqjrWGfEXOYIrwgtrM=;
        b=A41IHsvnyRg7VbIwUB0fnYbDUtGhi9WWv+okJgKfrcoZJx3/0ixzc2jRdmPSt+aXXn
         T4D61qvPeKPXxw+f0sj1kcB4JPW/fTkc/0/gT5tvaPJlkHT+FbmbiN8B63UxwA9jij+A
         puVoL0IagsR18QTnOIRA3x7NjY2UwDxzuPVdFv/W1iI+kdbJl4BpsbcRAueF4m9fwJ04
         lQVtGhbiPYUpwYwonYqXk2q5aILSxqFth3LytvCLuG4l+5SdSfKDDuqlZdSYiISDrGwa
         7+U4J1PSnXTYsX5aIH1HU9iDNBRU67uJkaeWKU1N06I1f3lRyfvoHw+gzTo9kt/ltYQ3
         cv7Q==
X-Gm-Message-State: APjAAAWNDRZr4zkknRK9pNjouRcTzFHjPhs3f56ekyNG4+sReJTXvUZO
        MAt1UTnzm7A4fVlpnX82KEX/S9At
X-Google-Smtp-Source: APXvYqzYLkdTbN0UkgR6Eg4+Vq25pGo+EN5gWXENY2VnbQb+MP9zToGQ3A4yfugtgM3gZ/RpAOa52Q==
X-Received: by 2002:a17:902:7c8a:: with SMTP id y10mr21969083pll.65.1566219399375;
        Mon, 19 Aug 2019 05:56:39 -0700 (PDT)
Received: from localhost.localdomain (p6796086-ipngn28101marunouchi.tokyo.ocn.ne.jp. [114.165.92.86])
        by smtp.gmail.com with ESMTPSA id d189sm16646707pfd.165.2019.08.19.05.56.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 19 Aug 2019 05:56:38 -0700 (PDT)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: renesas: r8a77970: sort nodes
Date:   Mon, 19 Aug 2019 21:56:33 +0900
Message-Id: <1566219393-23169-1-git-send-email-ykaneko0929@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Sort nodes.

If node address is present
   * Sort by node address, grouping all nodes with the same compat string
     and sorting the group alphabetically.
Else
   * Sort alphabetically

This should not have any run-time effect.

Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---

This patch is based on the master branch of Geert Uytterhoeven's renesas-devel
tree.

 arch/arm64/boot/dts/renesas/r8a77970.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
index 5b6164d..0cd3b37 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -1181,6 +1181,9 @@
 			polling-delay = <1000>;
 			thermal-sensors = <&thermal>;
 
+			cooling-maps {
+			};
+
 			trips {
 				cpu-crit {
 					temperature = <120000>;
@@ -1188,9 +1191,6 @@
 					type = "critical";
 				};
 			};
-
-			cooling-maps {
-			};
 		};
 	};
 
-- 
1.9.1

