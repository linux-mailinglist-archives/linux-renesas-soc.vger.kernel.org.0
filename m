Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F320706AA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2019 19:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731247AbfGVRWm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Jul 2019 13:22:42 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:34512 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728233AbfGVRWm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Jul 2019 13:22:42 -0400
Received: by mail-pf1-f194.google.com with SMTP id b13so17700351pfo.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jul 2019 10:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=3876AKAsZGX63Axh00T2Gm59IDW3banJe4ryUn84tiA=;
        b=NQFtRY9MZNMNPg6S5CgEKrvuQRExfM4wbSegsLo2rdM9cKgEOrERmb4fwAvvjfo1IN
         vF8E/7Yvn6YapYEtC5gmooBWVSptCPLYzLG2FO3VEb2iaxu6CUWamED9YY1QhFdtoP3U
         uHKb8Njc3t3gUwLQ+cFi/qz/7Nk4oxsfyI321vuEr0qznCQfDwE+IoI0RHwJRwaXc6ex
         VOf5j/mqW8oyF4l9k/DYG3Z7JT7lvjJ8oKXV1sPntAwuPm1f1v+qXL0eYADfBRpQLwjG
         hzE0g6Nws1GnjNS5QftuvdRD2JM1DVRblP18YqAHnb56nDWT4TM7S4o3ix2BzzhWix1R
         66Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=3876AKAsZGX63Axh00T2Gm59IDW3banJe4ryUn84tiA=;
        b=gP9ddcFoZCt5wtsQH2xXBJSHRyyHC6e6YoXZeHf7/L41r4tNoGNsrOJH96DIbzo0p8
         9wrYIxmRLW9lHObd3d/360IvdoIeFq/+3Wg09fyjP5cqhoBKKqOhKlUXt1Ip73acAsBg
         njhyvqqppWmTTuzEG3rVR4AnDbcxWTCAuLVu2YmeFZ1MiuqKaFmKW3mQut1BwPQ0g6TT
         32zncCCbzuepqXZK2aveP0CTBd6NuqYJXpMqXpbg0ie7hvZXoRK/9Vp28xL4FBmGIRE2
         CGEakwXhsUOxgVRn9gmtZ9UpBIbhNW1PjyECo3ropAhaeck9Q4llTP19T7O+T7ZObI+E
         b16Q==
X-Gm-Message-State: APjAAAX0HlUYLqT74bri0pHE0euDCZKDX5CTmzp2BkEq51R7lWxB4ZYw
        W7HaVG/lwT9RjxAw85ixSxrkfukh
X-Google-Smtp-Source: APXvYqzvENzFTEG6YT3zLFXjaovEUj0OUeVKwVnsTlCJkv/e4F1BwCfx3+YyUzcZEWDXi/MDZLTtWQ==
X-Received: by 2002:aa7:90c9:: with SMTP id k9mr1253443pfk.171.1563816161294;
        Mon, 22 Jul 2019 10:22:41 -0700 (PDT)
Received: from localhost.localdomain (KD118155013174.ppp-bb.dion.ne.jp. [118.155.13.174])
        by smtp.gmail.com with ESMTPSA id w16sm48195445pfj.85.2019.07.22.10.22.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 22 Jul 2019 10:22:40 -0700 (PDT)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: renesas: r8a7795-es1-salvator-x: sort nodes
Date:   Tue, 23 Jul 2019 02:22:21 +0900
Message-Id: <1563816141-17805-1-git-send-email-ykaneko0929@gmail.com>
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

 .../boot/dts/renesas/r8a7795-es1-salvator-x.dts    | 26 +++++++++++-----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts
index c1a56ea..c729686 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts
@@ -52,12 +52,6 @@
 	status = "okay";
 };
 
-&sound_card {
-	dais = <&rsnd_port0	/* ak4613 */
-		&rsnd_port1	/* HDMI0  */
-		&rsnd_port2>;	/* HDMI1  */
-};
-
 &hdmi0 {
 	status = "okay";
 
@@ -108,6 +102,13 @@
 	status = "okay";
 };
 
+&pfc {
+	usb2_pins: usb2 {
+		groups = "usb2";
+		function = "usb2";
+	};
+};
+
 &rcar_sound {
 	ports {
 		/* rsnd_port0 is on salvator-common */
@@ -138,17 +139,16 @@
 	};
 };
 
-&pfc {
-	usb2_pins: usb2 {
-		groups = "usb2";
-		function = "usb2";
-	};
-};
-
 &sata {
 	status = "okay";
 };
 
+&sound_card {
+	dais = <&rsnd_port0	/* ak4613 */
+		&rsnd_port1	/* HDMI0  */
+		&rsnd_port2>;	/* HDMI1  */
+};
+
 &usb2_phy2 {
 	pinctrl-0 = <&usb2_pins>;
 	pinctrl-names = "default";
-- 
1.9.1

