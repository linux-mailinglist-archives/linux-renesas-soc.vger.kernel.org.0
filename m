Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC5D17DDD6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2019 16:25:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732008AbfHAOZG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Aug 2019 10:25:06 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46216 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732007AbfHAOZF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Aug 2019 10:25:05 -0400
Received: by mail-pg1-f196.google.com with SMTP id k189so15260062pgk.13
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Aug 2019 07:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=wqdfjCZelzqWnJPwgzst08AWytXH7in0noJ3iCuvlR4=;
        b=fhAdM1Lrq+9VF57MW/JL8GC6oIwqzLt7cARJMFqNwFnSYTvBmR5NTq7PO4XMRnsmDR
         bfQleWl0BQKmtb8m/TNOqK48GvEOMkNSUd01vYzfCcnNBglVYFNGgadwx876ze8xkw7l
         sCM47Xszyb20tHZV1rJ2RDW7EYTp0vMHH2kYEQRzQQY5GQEemxDziAgxWPjm4kN20z4X
         Oe0cDHxS8K2zLyevMw8acB0ZDBY4Nd0wjFQuyw/Sxz2QNHQrk5dgQqMvunGxKhHnN25P
         1V7UuqlPpQxohJ6g5ynKCvegG2BjpTWh+DWSoYde1gUtVM4AIgi9zSc2M+Mq4zVykPiY
         2ALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=wqdfjCZelzqWnJPwgzst08AWytXH7in0noJ3iCuvlR4=;
        b=G7Lnqq64u3X4EtVh2SBc8A3D7PYV3yG/kW12MWWD6COWMozXrdjztW5GgNjcA6jV4K
         Vq/vVay4fSFoZHz5K8x+cCs0RWDMxan32d2zUPSsEwmURb9SsUT6GIj3qmaohmRcj+Fd
         2MM0WkDVLSKtC/ghnCVf5V3W9ebcNgzVKRlEMZ7G6tqtOEOZatsSNhaJD09vq+MtChuS
         3XhT21iO6xG3mK22u9ly89/58upJcXIkFkzl6FUo75Kp+gBbJSRd3IkTohpKcjLgHq7e
         NJwdi8NE5KIIG8OQZnzJoHj8SZjzEViTUWEvuz6zDte278nE1NX6JtLwBAp6/TivNdwk
         HAdA==
X-Gm-Message-State: APjAAAWGgv8PHEKMqnsVmWMNjcHdXinmJNQ9ZtBx6TI+hAF4nadnbLSF
        ppnO/7e6YRp9zL4ypzKbZyn68j7U
X-Google-Smtp-Source: APXvYqxU2dGXfve+crnOEIX6KiXRUJlhkFmVEG5DRFZ5q/sJHuo6OWY0gZstO3EuHMWN1OKU1f7NoA==
X-Received: by 2002:aa7:8202:: with SMTP id k2mr54818466pfi.31.1564669504972;
        Thu, 01 Aug 2019 07:25:04 -0700 (PDT)
Received: from localhost.localdomain (p6796086-ipngn28101marunouchi.tokyo.ocn.ne.jp. [114.165.92.86])
        by smtp.gmail.com with ESMTPSA id f8sm39456311pgd.58.2019.08.01.07.25.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 01 Aug 2019 07:25:04 -0700 (PDT)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: renesas: r8a77995-draak: sort nodes
Date:   Thu,  1 Aug 2019 23:24:55 +0900
Message-Id: <1564669495-22718-1-git-send-email-ykaneko0929@gmail.com>
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

 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
index 0711170..fe14792 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
@@ -19,11 +19,6 @@
 		ethernet0 = &avb;
 	};
 
-	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
-		stdout-path = "serial0:115200n8";
-	};
-
 	backlight: backlight {
 		compatible = "pwm-backlight";
 		pwms = <&pwm1 0 50000>;
@@ -35,6 +30,11 @@
 		enable-gpios = <&gpio4 0 GPIO_ACTIVE_HIGH>;
 	};
 
+	chosen {
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
+		stdout-path = "serial0:115200n8";
+	};
+
 	composite-in {
 		compatible = "composite-video-connector";
 
-- 
1.9.1

