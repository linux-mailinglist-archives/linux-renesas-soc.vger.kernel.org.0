Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D7012D8F53
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 13 Dec 2020 19:40:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731365AbgLMSjM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 13 Dec 2020 13:39:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730828AbgLMSi5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 Dec 2020 13:38:57 -0500
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AEDFC0613D6;
        Sun, 13 Dec 2020 10:38:17 -0800 (PST)
Received: by mail-io1-xd41.google.com with SMTP id z136so14774786iof.3;
        Sun, 13 Dec 2020 10:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xa9KSmcIOrXLckBUdZRAGZxioqxejsGUcX5WxxupjKI=;
        b=dBKuTDgJDLYQaqaycnjFNKs8HrY5SnjsecnIEsjBYK905kAVC2MUkoLqtm3Myq4iTW
         4dO+QJQo6aS1+c7EymD6168zSnZTIXx2IotLdoR6oj6DReB35vU30ua8c6CeEVEyviK5
         dARhcT9cueLh57dPw5p1jmri0aSWG57r+QF+4hsJ9qwhlqMq6I313kmv1mytk/ynmyLh
         bNYT/V/pDLar+U/PlmcB+90IZ4TXqnAqm2JZTJ8q04VxDbPF5ONDzAmyxdlqMXP01BU4
         //Cjx8cd85+K9XnXNEHT1KMjSRxjC/v1MGBbvNp/a0Sg+MHsdY7lrz5oOev2bR+YbLph
         smdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xa9KSmcIOrXLckBUdZRAGZxioqxejsGUcX5WxxupjKI=;
        b=pVrNhWgSGAjpLzrt91PM1UenjqXi1ZqcQieifHrMFp/Fdi/z3vKIByfsMqd/onsH3i
         jJpwwxUQHfuERyc/4+l34NVRTGGeqTpwm8aZL+n9pyFyYQGddE7GD2Lu7KucRX6BI212
         klXh+d4i1dP2CVzAj7rqKoptLehR4lPI2OOXYs7q8NdpujWy15yXMBq/X38IEN6wMHC6
         Hb3oxV9dYJ571DDf1IxyXGSgDqk5l/JolPWFC8Y96ie99llXZMTfowezzNW4ZRwsccv/
         YwgtDcCCHTJeZE2E87fajPOYhEM25ciekB/SYR9ApzQZFejiPeaGbk4984wC9bgqIDqk
         vDTg==
X-Gm-Message-State: AOAM5301P9xZNhIqPt2e1UKVB3HBUvCfONxkW0VP5gRB0Nd5Dgg0/m1E
        J9HrCSMC4RBqHzY36ZNTqdbmsTr9nr3czg==
X-Google-Smtp-Source: ABdhPJwVzNvySxmx66WVJ2IfQ5nbRnGyr6bqrql2Bqt4waEfGRAk5Sr+ab6xLPDgqapc/S0Y/dIJGg==
X-Received: by 2002:a02:2444:: with SMTP id q4mr14829516jae.43.1607884696206;
        Sun, 13 Dec 2020 10:38:16 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:f45d:df49:9a4c:4914])
        by smtp.gmail.com with ESMTPSA id o11sm7804532ioa.37.2020.12.13.10.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Dec 2020 10:38:15 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 02/18] arm64: dts: renesas: beacon kit: Fix choppy Bluetooth Audio
Date:   Sun, 13 Dec 2020 12:37:42 -0600
Message-Id: <20201213183759.223246-3-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201213183759.223246-1-aford173@gmail.com>
References: <20201213183759.223246-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The Bluetooth chip is capable of operating at 4Mbps, but the
max-speed setting was on the UART node instead of the Bluetooth
node, so the chip didn't operate at the correct speed resulting
in choppy audio.  Fix this by setting the max-speed in the proper
node.

Fixes: a1d8a344f1ca ("arm64: dts: renesas: Introduce r8a774a1-beacon-rzg2m-kit")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
 arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
index 449ff5937fc6..c50f8e63c80f 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
@@ -90,7 +90,6 @@ &hscif0 {
 	pinctrl-names = "default";
 	uart-has-rtscts;
 	status = "okay";
-	max-speed = <4000000>;
 
 	bluetooth {
 		compatible = "brcm,bcm43438-bt";
@@ -99,6 +98,7 @@ bluetooth {
 		device-wakeup-gpios = <&pca9654 5 GPIO_ACTIVE_HIGH>;
 		clocks = <&osc_32k>;
 		clock-names = "extclk";
+		max-speed = <4000000>;
 	};
 };
 
-- 
2.25.1

