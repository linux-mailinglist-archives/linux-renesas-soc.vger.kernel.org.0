Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73025222FC
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 18 May 2019 12:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729140AbfERKCs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 18 May 2019 06:02:48 -0400
Received: from mail-pl1-f173.google.com ([209.85.214.173]:42113 "EHLO
        mail-pl1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbfERKCs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 18 May 2019 06:02:48 -0400
Received: by mail-pl1-f173.google.com with SMTP id x15so4478738pln.9
        for <linux-renesas-soc@vger.kernel.org>; Sat, 18 May 2019 03:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=EqrbC7i1HOa+LJfF+UuZYb3SuR3y3UUf8fqTVYo4Eyc=;
        b=pZVAdvgewwk1sL6VY+LZtJ9jw/MwRxrgQnh/lqG8pnG5CKVqZ5xl/r+WYlBJR8i5jp
         Zi+0BnU8tf2DE+BE9JyyecyYTvLWrS+dm7TsmuimItKRKps+D8anyoRNUYHqp5XDq7Px
         dgpzpOzhqtkluXg3/NUFcFaAcLlvK49G+gR7z/KtrK1b/IH5941R9J4VfXVDU8yOLoSS
         fmR3oUmvZ9BYZtldc/OdEM2bYDqVsAcoiKXlkPh4AdOFPyLSiwH/MNmgE2iAwQ+nHLvN
         ltHhJZ2jOFIzxc3Y5twJhtV9VPKaUEYeN060DPusIFC/6pkQQgvKI/oSweT47qYdnbN8
         QMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=EqrbC7i1HOa+LJfF+UuZYb3SuR3y3UUf8fqTVYo4Eyc=;
        b=r9gyEIqzuiPKV2o44GcWoawwSxl/JPb4a5RtbcAmy9DfxrbsQAew/80IhtB1R+Sdp9
         4TquN+93CNnaNCmduhTM/HIxNMiZW5SVMl1M2jRO0MywsWmDoXyNkT7XEvauaI9/TQAG
         aREnDlWs8tjscSLIIR+2n+p8+Vhl0+BxLrzb2J81J/VD7qSYr7EacUQkR71h0KDPuje1
         r1v/R1cwkOConTbqEPjZtzAeJqKZGr3Ujh1N0+Ms0cKOQ+PLQdN0QRg94UcSO7GhWEbF
         ODwbJPLjtolLktiDAeWX3+MJP55YdrCZe3AVsaHLlgWCio7+7agNAoOJniB4QnPlrTFX
         stZQ==
X-Gm-Message-State: APjAAAVhGZ38ANqP953DWSBfAYWT8O41X0rqjANCNKu8S/+Tf1hEbTcR
        aIycsYMpP2/tkOewsmRfu2d6jwEg
X-Google-Smtp-Source: APXvYqwpf3YHRvK+Woomf/ih5p4l3t1MbDRrZI2MJx7ffw8Frat490/dWVtPNw43qDlPYtm9wvB9vw==
X-Received: by 2002:a17:902:2c01:: with SMTP id m1mr58214509plb.108.1558173767688;
        Sat, 18 May 2019 03:02:47 -0700 (PDT)
Received: from [127.0.0.1] (l193216.ppp.asahi-net.or.jp. [218.219.193.216])
        by smtp.gmail.com with ESMTPSA id e5sm22543663pgh.35.2019.05.18.03.02.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 18 May 2019 03:02:46 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Sat, 18 May 2019 19:04:06 +0900
Message-Id: <155817384629.14383.16827320626614039363.sendpatchset@octo>
In-Reply-To: <155817382883.14383.9127828804463512592.sendpatchset@octo>
References: <155817382883.14383.9127828804463512592.sendpatchset@octo>
Subject: [PATCH 2/2] arm64: dts: renesas: Use ip=on for bootargs
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Convert bootargs from ip=dhcp to ip=on

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts  |    2 +-
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts   |    2 +-
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts   |    2 +-
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts   |    2 +-
 arch/arm64/boot/dts/renesas/salvator-common.dtsi |    2 +-
 arch/arm64/boot/dts/renesas/ulcb.dtsi            |    2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

--- 0001/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
+++ work/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts	2019-05-18 18:31:14.742837630 +0900
@@ -19,7 +19,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:115200n8";
 	};
 
--- 0001/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
+++ work/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts	2019-05-18 18:31:32.523769858 +0900
@@ -19,7 +19,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:115200n8";
 	};
 
--- 0001/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ work/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts	2019-05-18 18:31:43.015319912 +0900
@@ -19,7 +19,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:115200n8";
 	};
 
--- 0001/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ work/arch/arm64/boot/dts/renesas/r8a77995-draak.dts	2019-05-18 18:31:52.798832831 +0900
@@ -20,7 +20,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:115200n8";
 	};
 
--- 0001/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ work/arch/arm64/boot/dts/renesas/salvator-common.dtsi	2019-05-18 18:32:01.375282492 +0900
@@ -39,7 +39,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:115200n8";
 	};
 
--- 0001/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ work/arch/arm64/boot/dts/renesas/ulcb.dtsi	2019-05-18 18:32:09.131689147 +0900
@@ -26,7 +26,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:115200n8";
 	};
 
