Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3094D222FB
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 18 May 2019 12:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729218AbfERKCk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 18 May 2019 06:02:40 -0400
Received: from mail-pg1-f175.google.com ([209.85.215.175]:36275 "EHLO
        mail-pg1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbfERKCk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 18 May 2019 06:02:40 -0400
Received: by mail-pg1-f175.google.com with SMTP id a3so4478517pgb.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 18 May 2019 03:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=NHvDhk7j3qFX43krqFlpdoiB9I3UsO9aNkX8Ku+++l0=;
        b=grkOwYyXpVXkajF9b5uM5/nF7IK4F7v+33eSfXhETLKEu7HQ0dKBGpr61reckUWXDq
         ICAEksTim3UZfRtJiL1hyh49sGs0S9wY2byxur9zObqRvrTYAmQVlOq8KbBUJZ8FQyHQ
         SAyq3YfT7ah2FtgdD86S3yMXShYeyW0nUMDjn1MLq6pfCl7szGA8ZlD9pV1M0uRWPavW
         IRCuqP0WmnmVLqwe5Zea6WN/eyhjXUrbKFfEBRlS7HmSPyPDDzbIATJu5CBxdXxLiNf9
         p9Myb9scPTeHtuvPcb18kiXIb21Dev8SJh15t3Sn5Yb1QnvouUe4J3UTv0sRSxsHMV9A
         UXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=NHvDhk7j3qFX43krqFlpdoiB9I3UsO9aNkX8Ku+++l0=;
        b=GbbX9YzHq9gnUF4Pwj4VZstLt9OXudhdkM7UpWKRRC+tVA9q60M804CxBFB+OcgrsF
         04HpwK/ihzcRD0ispyBZsXWp9ESWH6XOIo7wKvwWw3aSiHYfm8K5BhpcSZGmc+lyf/0X
         hmCSBE4iYTS5+kED7gDlvjQGWJ1QraAwSKdRo7y6RBZpTgAVgtPqa/WLtvfuJgyM9NxG
         lzLiD7iARpCumNO826XJJ1uz1OIcRMkcKRJZ6MDjXfwq8i88nSKw+y7M6aK11XwBQtkU
         sEG/t5Z6bPiobsLdX9AHMctaHou2WJPlhSfg1A7Zse+rWi0SzthSpfg1Sbmu6XnaNWs4
         Pc5w==
X-Gm-Message-State: APjAAAWeNmqhJXhM46zIQ93TffXBFsBDNay6dNufSh7yVAJEhoGvxlZT
        DyQz6xhgPnN3uSPz9NodjeFPdYd2
X-Google-Smtp-Source: APXvYqwWdEfDgdovQIHCcJHNnIIw0EnhL799uSi0pKvQBAVXHJQK6hVn0rUTnD9VqfiP1hZqROXOuw==
X-Received: by 2002:a65:64da:: with SMTP id t26mr62250035pgv.322.1558173759193;
        Sat, 18 May 2019 03:02:39 -0700 (PDT)
Received: from [127.0.0.1] (l193216.ppp.asahi-net.or.jp. [218.219.193.216])
        by smtp.gmail.com with ESMTPSA id c23sm24199534pfp.0.2019.05.18.03.02.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 18 May 2019 03:02:37 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Sat, 18 May 2019 19:03:57 +0900
Message-Id: <155817383762.14383.11863551376377895395.sendpatchset@octo>
In-Reply-To: <155817382883.14383.9127828804463512592.sendpatchset@octo>
References: <155817382883.14383.9127828804463512592.sendpatchset@octo>
Subject: [PATCH 1/2] arm: dts: Use ip=on for bootargs
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Convert bootargs from ip=dhcp to ip=on

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm/boot/dts/emev2-kzm9d.dts             |    2 +-
 arch/arm/boot/dts/r7s72100-genmai.dts         |    2 +-
 arch/arm/boot/dts/r8a73a4-ape6evm.dts         |    2 +-
 arch/arm/boot/dts/r8a7740-armadillo800eva.dts |    2 +-
 arch/arm/boot/dts/r8a7743-sk-rzg1m.dts        |    2 +-
 arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts   |    2 +-
 arch/arm/boot/dts/r8a7745-sk-rzg1e.dts        |    2 +-
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts     |    2 +-
 arch/arm/boot/dts/r8a7778-bockw.dts           |    2 +-
 arch/arm/boot/dts/r8a7779-marzen.dts          |    2 +-
 arch/arm/boot/dts/r8a7790-lager.dts           |    2 +-
 arch/arm/boot/dts/r8a7790-stout.dts           |    2 +-
 arch/arm/boot/dts/r8a7791-koelsch.dts         |    2 +-
 arch/arm/boot/dts/r8a7791-porter.dts          |    2 +-
 arch/arm/boot/dts/r8a7792-blanche.dts         |    2 +-
 arch/arm/boot/dts/r8a7792-wheat.dts           |    2 +-
 arch/arm/boot/dts/r8a7793-gose.dts            |    2 +-
 arch/arm/boot/dts/r8a7794-alt.dts             |    2 +-
 arch/arm/boot/dts/r8a7794-silk.dts            |    2 +-
 arch/arm/boot/dts/sh73a0-kzm9g.dts            |    2 +-
 20 files changed, 20 insertions(+), 20 deletions(-)

--- 0001/arch/arm/boot/dts/emev2-kzm9d.dts
+++ work/arch/arm/boot/dts/emev2-kzm9d.dts	2019-05-18 18:17:13.186716193 +0900
@@ -25,7 +25,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial1:115200n8";
 	};
 
--- 0001/arch/arm/boot/dts/r7s72100-genmai.dts
+++ work/arch/arm/boot/dts/r7s72100-genmai.dts	2019-05-18 18:26:08.516782691 +0900
@@ -20,7 +20,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:115200n8";
 	};
 
--- 0001/arch/arm/boot/dts/r8a73a4-ape6evm.dts
+++ work/arch/arm/boot/dts/r8a73a4-ape6evm.dts	2019-05-18 18:18:11.874793108 +0900
@@ -19,7 +19,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:115200n8";
 	};
 
--- 0001/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
+++ work/arch/arm/boot/dts/r8a7740-armadillo800eva.dts	2019-05-18 18:18:32.557877498 +0900
@@ -21,7 +21,7 @@
 	};
 
 	chosen {
-		bootargs = "earlyprintk ignore_loglevel root=/dev/nfs ip=dhcp rw";
+		bootargs = "earlyprintk ignore_loglevel root=/dev/nfs ip=on rw";
 		stdout-path = "serial0:115200n8";
 	};
 
--- 0001/arch/arm/boot/dts/r8a7743-sk-rzg1m.dts
+++ work/arch/arm/boot/dts/r8a7743-sk-rzg1m.dts	2019-05-18 18:18:55.635087394 +0900
@@ -17,7 +17,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:115200n8";
 	};
 
--- 0001/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
+++ work/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts	2019-05-18 18:19:21.798459106 +0900
@@ -42,7 +42,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial3:115200n8";
 	};
 
--- 0001/arch/arm/boot/dts/r8a7745-sk-rzg1e.dts
+++ work/arch/arm/boot/dts/r8a7745-sk-rzg1e.dts	2019-05-18 18:19:32.556023101 +0900
@@ -17,7 +17,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:115200n8";
 	};
 
--- 0001/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
+++ work/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts	2019-05-18 18:19:50.642971371 +0900
@@ -18,7 +18,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial1:115200n8";
 	};
 
--- 0001/arch/arm/boot/dts/r8a7778-bockw.dts
+++ work/arch/arm/boot/dts/r8a7778-bockw.dts	2019-05-18 18:20:04.843715886 +0900
@@ -25,7 +25,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:115200n8";
 	};
 
--- 0001/arch/arm/boot/dts/r8a7779-marzen.dts
+++ work/arch/arm/boot/dts/r8a7779-marzen.dts	2019-05-18 18:20:19.340475932 +0900
@@ -21,7 +21,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:115200n8";
 	};
 
--- 0001/arch/arm/boot/dts/r8a7790-lager.dts
+++ work/arch/arm/boot/dts/r8a7790-lager.dts	2019-05-18 18:20:36.468373925 +0900
@@ -56,7 +56,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:115200n8";
 	};
 
--- 0001/arch/arm/boot/dts/r8a7790-stout.dts
+++ work/arch/arm/boot/dts/r8a7790-stout.dts	2019-05-18 18:20:45.435844071 +0900
@@ -19,7 +19,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:115200n8";
 	};
 
--- 0001/arch/arm/boot/dts/r8a7791-koelsch.dts
+++ work/arch/arm/boot/dts/r8a7791-koelsch.dts	2019-05-18 18:20:54.972344059 +0900
@@ -56,7 +56,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:115200n8";
 	};
 
--- 0001/arch/arm/boot/dts/r8a7791-porter.dts
+++ work/arch/arm/boot/dts/r8a7791-porter.dts	2019-05-18 18:21:11.540212688 +0900
@@ -31,7 +31,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:115200n8";
 	};
 
--- 0001/arch/arm/boot/dts/r8a7792-blanche.dts
+++ work/arch/arm/boot/dts/r8a7792-blanche.dts	2019-05-18 18:21:25.739957158 +0900
@@ -21,7 +21,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:115200n8";
 	};
 
--- 0001/arch/arm/boot/dts/r8a7792-wheat.dts
+++ work/arch/arm/boot/dts/r8a7792-wheat.dts	2019-05-18 18:21:49.436199510 +0900
@@ -20,7 +20,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:115200n8";
 	};
 
--- 0001/arch/arm/boot/dts/r8a7793-gose.dts
+++ work/arch/arm/boot/dts/r8a7793-gose.dts	2019-05-18 18:22:00.131760261 +0900
@@ -52,7 +52,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:115200n8";
 	};
 
--- 0001/arch/arm/boot/dts/r8a7794-alt.dts
+++ work/arch/arm/boot/dts/r8a7794-alt.dts	2019-05-18 18:22:09.908272826 +0900
@@ -22,7 +22,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:115200n8";
 	};
 
--- 0001/arch/arm/boot/dts/r8a7794-silk.dts
+++ work/arch/arm/boot/dts/r8a7794-silk.dts	2019-05-18 18:22:26.100121738 +0900
@@ -34,7 +34,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:115200n8";
 	};
 
--- 0001/arch/arm/boot/dts/sh73a0-kzm9g.dts
+++ work/arch/arm/boot/dts/sh73a0-kzm9g.dts	2019-05-18 18:23:20.243960419 +0900
@@ -36,7 +36,7 @@
 	};
 
 	chosen {
-		bootargs = "root=/dev/nfs ip=dhcp ignore_loglevel rw";
+		bootargs = "root=/dev/nfs ip=on ignore_loglevel rw";
 		stdout-path = "serial0:115200n8";
 	};
 
