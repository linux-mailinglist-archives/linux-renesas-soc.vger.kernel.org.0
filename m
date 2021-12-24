Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44BCD47EB94
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Dec 2021 06:23:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351336AbhLXFXp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Dec 2021 00:23:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351317AbhLXFXn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Dec 2021 00:23:43 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E738C061759
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Dec 2021 21:23:43 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id bp20so16899991lfb.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Dec 2021 21:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8p5cAhIlsS0RVNWJwJlMF76TH5CwTtvB0RF/Dz+Mi38=;
        b=baDEms+uzCHi3HYHok74MXuUK46KTsfuP+YqAZsGbvywpwmxu85G64pCns3LNg5DMj
         KvYpjVmlpfJIVLW+YVLOUBXNMPFfjT+Mso/TSTweOI7XL4chwg7e5beZKzLhRebQsfel
         MeMg5iU6Kt6QLWm9UIruT5H32QK0aZ5y6Fqa51RxIi4hH4zr9zn514OqyJR/2TQJy0Mp
         F1Wei/sB1BvZe7YoM5YxUqL47A9uZ+/T6vrw9VXwjVTweXHkyF9v6sqEGfjg7cVGlDmI
         L8SlMVzOCw+M6puwGUckor6tOuzmGewZ9wwWJdOl7fIgfoqCJ+FkloY386QdSKQupmOg
         QkHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8p5cAhIlsS0RVNWJwJlMF76TH5CwTtvB0RF/Dz+Mi38=;
        b=8Gmn3kNycmDexQ4ABzFwziSB5j2OYCuRqkkskuNRAppkKZHwHb0gAjL1Mvs16So+DH
         TI6hVGxauzXKdCJHfdN8OV+uStxSFK8dKMhS5Gc5k2Zd/OUZFPDulxmasKTgJ9JZ6y0i
         d63P1ovTOj3sLMVLi7eP/HaUnYmBl9fJDQ3LtZi9bovXLw+W+2kuIuvukax6eIMq1Tlg
         iEWdEtDgX8CDsuXpRXp3SRQxS4Ems2fNsOtoRY+uvvn6wzKWPmAry8LRnKz35f/OLs7u
         hIDUQvYL6cMgxZWgx9V2omcdEuVq8NPmlzDKHXJ6QCfy2H65BaQbhvrp+VxNfky6M+RL
         Ol9A==
X-Gm-Message-State: AOAM532P6xPX/r7ER2iWRuTH8OfovWe+ys9dLm37V9gMyNUjsdxBy2B1
        1pDA9nRubiQhts8/bNwoLejxcQ==
X-Google-Smtp-Source: ABdhPJy+HN9Nf9T96QkeX0cpn8ucbeHE1l2R9SUX2XR+Qg6BdgeJDGp6k+PB5axfuBITIXZDhvTjTA==
X-Received: by 2002:a05:6512:15a7:: with SMTP id bp39mr2903128lfb.363.1640323421226;
        Thu, 23 Dec 2021 21:23:41 -0800 (PST)
Received: from cobook.home (nikaet.starlink.ru. [94.141.168.29])
        by smtp.gmail.com with ESMTPSA id e13sm702858lfs.306.2021.12.23.21.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Dec 2021 21:23:40 -0800 (PST)
From:   Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH 2/3] arm64: dts: renesas: r8a77961: Add lvds0 device node
Date:   Fri, 24 Dec 2021 08:23:08 +0300
Message-Id: <20211224052309.1997096-3-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211224052309.1997096-1-nikita.yoush@cogentembedded.com>
References: <20211224052309.1997096-1-nikita.yoush@cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add the missing lvds0 node for the R-Car M3-W+ SoC.

Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 27 +++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index 86d59e7e1a87..a34d5b1d6431 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -2718,6 +2718,33 @@ du_out_hdmi0: endpoint {
 				port@2 {
 					reg = <2>;
 					du_out_lvds0: endpoint {
+						remote-endpoint = <&lvds0_in>;
+					};
+				};
+			};
+		};
+
+		lvds0: lvds@feb90000 {
+			compatible = "renesas,r8a77961-lvds";
+			reg = <0 0xfeb90000 0 0x14>;
+			clocks = <&cpg CPG_MOD 727>;
+			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
+			resets = <&cpg 727>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					lvds0_in: endpoint {
+						remote-endpoint = <&du_out_lvds0>;
+					};
+				};
+				port@1 {
+					reg = <1>;
+					lvds0_out: endpoint {
 					};
 				};
 			};
-- 
2.30.2

