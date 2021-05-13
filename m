Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AA0D37F70F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 May 2021 13:46:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232051AbhEMLru (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 May 2021 07:47:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231738AbhEMLrs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 May 2021 07:47:48 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4123C061574;
        Thu, 13 May 2021 04:46:37 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id p8so24559838iol.11;
        Thu, 13 May 2021 04:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=BK4qT11Jcy2nrTMBkQncpXyFc35XEEjYCK/MCqvtRuY=;
        b=jIjh5Hn+VtVG5LtWuuAqzs91VERchHii1B5R9VriyZB0old767hT16jywsD9Ix0mzr
         lj5jC/x5KdNdK/ZBZffjolitnRPVrWxZd1rKJVYumb+NCSV/r9V/Bi4qycFxrsjueoEF
         YQrIe6qKGMbN5t6nRG2c6WwbOyszZJH4EBZD7VMTQ9puazrf/o9Vh8z4EXsd7nJ/Obyo
         Y/EK1ADBXLnYbwKq16j5LQTovFJAVz0Bv7wD/hqvkpCqdfBkMi3STayOO4Kco+11VNZA
         RbsoYQd+eE3xkRFMSYx0bQCBonAq88b/kScAysihJJFkfclV9mQmLcuRVEUi9OvwXvsU
         Sk6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=BK4qT11Jcy2nrTMBkQncpXyFc35XEEjYCK/MCqvtRuY=;
        b=Se8TJoAOk7A7HW0+79YXEPXmkpbE1RudGm4O7FSjHaXkXSMgA0050KsKufvqZhyD1h
         ic7CPspctmjl9LnOq9/qaHIKfrpUlWke4rgbjuV+pGExkXysYwsxsj3RSvd6DkeLTVM1
         8jEHQfPDNAscM4mWIYPS5Ca0XuF4FgLPwKObRKJE7nct1QMlPFzudbftj1RGehZgKFuu
         C6eta6z41aOic1mSBUONogKfZIl5UX62jZrNNCEoYKt3Wi0PQnr1u6ekIBmPxURGogC5
         8wLCnA1b0K7zsFkIb/AQmDCwDBbEj3MLg8yr4DMuWbNoYZdE76awO50NQ75mh5v6gJez
         onAA==
X-Gm-Message-State: AOAM532bqwqjR4F/JbB7WBWcgnqWMqSmrZv9PqFoUOrsXoE6D4kaP7GQ
        Q3N6N0BJg5Uo2LkW8kSQfEQ=
X-Google-Smtp-Source: ABdhPJwMns8v9R5jX+V3mJ70Y1UWJL5D0BVlKjaR4sY4/Mc9zGc0VuwxuWjBBPAyjUblBtXOCsGl1g==
X-Received: by 2002:a05:6602:70d:: with SMTP id f13mr31647503iox.16.1620906396431;
        Thu, 13 May 2021 04:46:36 -0700 (PDT)
Received: from aford-OptiPlex-7050.logicpd.com ([174.46.170.158])
        by smtp.gmail.com with ESMTPSA id x13sm1298192ilv.88.2021.05.13.04.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 04:46:35 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: renesas: beacon: Fix USB extal reference
Date:   Thu, 13 May 2021 06:46:15 -0500
Message-Id: <20210513114617.30191-1-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The USB extal clock reference isn't associated to a crystal, it's
assoicated to a programmable clock, so remove the extal reference,
add the usb2_clksel.  Since usb_extal is referenced by the versaclock,
reference it here so the usb2_clksel can get the proper clock speed
of 50MHz.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
index 8d3a4d6ee885..bd3d26b2a2bb 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
@@ -319,8 +319,10 @@
 	status = "okay";
 };
 
-&usb_extal_clk {
-	clock-frequency = <50000000>;
+&usb2_clksel {
+	clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>,
+		  <&versaclock5 3>, <&usb3s0_clk>;
+	status = "okay";
 };
 
 &usb3s0_clk {
-- 
2.17.1

