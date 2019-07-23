Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F40F871E99
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jul 2019 20:04:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbfGWSDT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Jul 2019 14:03:19 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36749 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726535AbfGWSDT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Jul 2019 14:03:19 -0400
Received: by mail-pf1-f195.google.com with SMTP id r7so19530348pfl.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jul 2019 11:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=RAJFOsz9OoczAxl2xatH2NLu3srsG/uPtDEyqOjNBr8=;
        b=l8BAPDpKABALoy1KTX+SmGgkVRfanCGFK62s4DP7MKMpLYcMPJztOy6rTEY3N3N8B0
         vCPUf7UEFwNsPjWa6GEBIeuxIqUuvV29jXJ/7lhjIRgORcJ8S8kqs+DHOQhPW8ml0EG0
         na5I2vf6Qnc3cbPOTqHcdqIWWZAuXSxL+PgL8lHc4grjDIA/hSfawQfDUikaCfPjpIBS
         LmLS70vLBi3LdtgaDK53iOdCRYq8aFFTBTSt6QoszzsxzKGjAtFFEpsBq69PPl8fjmm5
         CuRHkn+Aq9QPZKIna0IfWE2ujbk8XJhMcRO89CHiVQyW5pFWZpZpQQOzMB2jKoDeMTyK
         nClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=RAJFOsz9OoczAxl2xatH2NLu3srsG/uPtDEyqOjNBr8=;
        b=LSPuZFaSLPKWGB/v7NomVWJx1uL0cOhF1UCPdmw++zp+7PvQRVz1AjJ44WNEzytpuS
         UeuuF7o1MnbgMjjBtZAmkzDFGZArlS4GVEGJ5me9c2GqQfTBqjST9Kj/27h3DDR7/eIg
         KqRPzu5sWvSmXJeyF4Fm6JGY49ZBPtdN5Yn3B6jdmEJIssLXBGJXnbFyy4KHTJQU0M2w
         nXYHQCAYxNSbJb4kxDTSkZ8fZ+1w1p63m/yi1KDNkpMnof6+ATA07vHMsOrEBSreOdVp
         zIYD/h6zmCyuNborhwG2SQ/hEV/61gmM85VlPuj/gHzQcBKmGtURZjBx8ZvS8mrzUHlH
         nuFw==
X-Gm-Message-State: APjAAAXnlV9MJv0zJl3tGekqh3akPIjkC+4ZrDClEh8hPJoxFD+rPphE
        LMr0bN1lInAiNQjpAYOt8M1iJwrr
X-Google-Smtp-Source: APXvYqzyoF7LJHwYrIk6oTD39PAXJ+DwGIjfsVZwZGVe2PuiXTrkSPHGW/QxkSCmb/ykNU3XQRKDRw==
X-Received: by 2002:a17:90a:8c0c:: with SMTP id a12mr83470068pjo.67.1563904998384;
        Tue, 23 Jul 2019 11:03:18 -0700 (PDT)
Received: from localhost.localdomain (KD118155013174.ppp-bb.dion.ne.jp. [118.155.13.174])
        by smtp.gmail.com with ESMTPSA id e189sm14458773pgc.15.2019.07.23.11.03.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 23 Jul 2019 11:03:17 -0700 (PDT)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: renesas: salvator-common: sort nodes
Date:   Wed, 24 Jul 2019 03:03:10 +0900
Message-Id: <1563904990-2873-1-git-send-email-ykaneko0929@gmail.com>
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

This patch is based on the devel branch of Simon Horman's renesas tree.

 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 44 ++++++++++++------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 5c2c847..902ca6f 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -87,6 +87,28 @@
 		};
 	};
 
+	hdmi0-out {
+		compatible = "hdmi-connector";
+		label = "HDMI0 OUT";
+		type = "a";
+
+		port {
+			hdmi0_con: endpoint {
+			};
+		};
+	};
+
+	hdmi1-out {
+		compatible = "hdmi-connector";
+		label = "HDMI1 OUT";
+		type = "a";
+
+		port {
+			hdmi1_con: endpoint {
+			};
+		};
+	};
+
 	keys {
 		compatible = "gpio-keys";
 
@@ -238,28 +260,6 @@
 			  1800000 0>;
 	};
 
-	hdmi0-out {
-		compatible = "hdmi-connector";
-		label = "HDMI0 OUT";
-		type = "a";
-
-		port {
-			hdmi0_con: endpoint {
-			};
-		};
-	};
-
-	hdmi1-out {
-		compatible = "hdmi-connector";
-		label = "HDMI1 OUT";
-		type = "a";
-
-		port {
-			hdmi1_con: endpoint {
-			};
-		};
-	};
-
 	vga {
 		compatible = "vga-connector";
 
-- 
1.9.1

