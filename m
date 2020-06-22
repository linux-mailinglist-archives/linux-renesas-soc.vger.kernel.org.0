Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80163203743
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2020 14:51:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728085AbgFVMvj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Jun 2020 08:51:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727979AbgFVMvj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Jun 2020 08:51:39 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F2BBC061794
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2020 05:51:39 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id d12so1552678ply.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2020 05:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:subject;
        bh=kLpRTdtCS1jI8ypODI0Dc1KkKDHCGe+xoE6NZxA4z1g=;
        b=DlogWzSVibYL3Lav32srao8mU4NZyW6VxEP2o9NTc8ADQQjKKDx7dyeIN/LkIb0UBM
         yst26kKmPZD7eVtCjlVk0TapIeWsKyKSmeHF2bqOfhEGish/MvxzdVWo7bLI/JARIBA7
         irBdgJfYwGz5IsWZRFL17k+GDec9dx8occfqlFKNMxHtW6kWbasbmdXQbkZ0VeD+quf4
         CYXKk7Au6nduz+lueYI1CCldN4XWJnTrfeYcRaPJQruzozmyY0Rd++HM6fH0Yn3FAqOc
         R8wQ42zJhfOQ2G+YLmbWkX9YzE3lJVetWv2ndK1cmBxdrUFOfd+UDoOWP8KPW9wqXnKu
         gCVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:subject;
        bh=kLpRTdtCS1jI8ypODI0Dc1KkKDHCGe+xoE6NZxA4z1g=;
        b=Q5KK92GxQdbX8AHiC1nU0uRlJLoA2enFvpypmmFj0YkADSBhQu7GgD7yrfdNknsJgY
         kf3pUp7iksT0RjBL253M1FCQ491sgXMXnLcJxTgkGhXX6t9ao3pKkTrvt2hM0FXaoVRH
         VNqSWlluWuaYI8w+GrxoQHWoy7LOY/xDBU5pHE6LGOFg80deuwUlgG+UA6rBR5LptHXO
         wI1n8ee8g9G+tpd4xsA68iHQ2wl9papPj4OpzXBZ8M76FDFM51Iuc5h5Cq25lAiwwBwo
         OB6KZoPn/Q53/hOMvWs/2+rIlJd1ibv/w0J4SWItHe/5DDpLB/st2YXWgKzaB+peiLQm
         gQhg==
X-Gm-Message-State: AOAM533XeQQaSOGgVSVtXtNUDlFN73aAb4ziaV7N3ezI3eCyCi7jcrGn
        GYt3wJVqOck21Rx0W58+czFPwjGUFOg=
X-Google-Smtp-Source: ABdhPJynO3/dUWkpC6SYsLG/tYtCUOPYPZBpjeCR7QmPqMFGxA6oCuHG+zsF/h9cKVHDvsd4arln3w==
X-Received: by 2002:a17:90a:c70d:: with SMTP id o13mr17900507pjt.73.1592830298528;
        Mon, 22 Jun 2020 05:51:38 -0700 (PDT)
Received: from [127.0.0.1] (FL1-122-134-243-221.iwa.mesh.ad.jp. [122.134.243.221])
        by smtp.gmail.com with ESMTPSA id q129sm13293923pfc.60.2020.06.22.05.51.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jun 2020 05:51:37 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>, geert@glider.be
Date:   Mon, 22 Jun 2020 21:37:09 +0900
Message-Id: <159282942947.12451.16657662841957319548.sendpatchset@octo>
Subject: [PATCH/RFC] arm64: dts: renesas: r8a77995-draak: gpio-leds prototype
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

This patch adds support for a couple of LEDs on the r8a77995 Draak board.

It also ignores the issue that push switches are also used on the same GPIOs.

The approach is the same as in the earlier posted patch for other boards:
[PATCH/RFC] arm64: dts: renesas: salvator-common: gpio-leds prototype

The limitations of DT bindings and kernel software support remain the same.

As Geert pointed out we need to extend the software to allow sharing of
GPIOs somehow. On this board and several others the GPIOs used for LEDs
are also used for push switches. Both DT bindings and drivers need to
be extended, most likely together with the GPIO subsystem. And to make it
more fun it is probably possible to get interrupts from these GPIOs as well.

In the patch the LED order and the GPIO number assignments look quite random
but match the schematics.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a77995-draak.dts |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

--- 0001/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ work/arch/arm64/boot/dts/renesas/r8a77995-draak.dts	2020-06-22 21:00:20.000000000 +0900
@@ -91,6 +91,20 @@
 		};
 	};
 
+	leds {
+		compatible = "gpio-leds";
+
+		led13 {
+			gpios = <&gpio4 7 GPIO_ACTIVE_HIGH>;
+		};
+		led12 {
+			gpios = <&gpio1 30 GPIO_ACTIVE_HIGH>;
+		};
+		led14 {
+			gpios = <&gpio4 25 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
 	memory@48000000 {
 		device_type = "memory";
 		/* first 128MB is reserved for secure area. */
