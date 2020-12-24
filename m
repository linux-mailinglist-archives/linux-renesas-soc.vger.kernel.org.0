Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3BFA2E2840
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Dec 2020 18:10:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729048AbgLXRGu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Dec 2020 12:06:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729042AbgLXRGt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Dec 2020 12:06:49 -0500
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BF2CC061796;
        Thu, 24 Dec 2020 09:05:41 -0800 (PST)
Received: by mail-io1-xd2d.google.com with SMTP id n4so2438260iow.12;
        Thu, 24 Dec 2020 09:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BZzYpN7srheW62psnaXSHx8DA2qbyyiIul6QobFgrhs=;
        b=pA0N/0So8nZP0OL+E6WO/w0EJjn7/wYuJe5u87jCnjsgkJD2CCrOLG6BYv8jmOwtLA
         HcR3U5BHSV50n8ho6a5xMTmyHZm28YRlXLXtjc8OPBI1CEYdeUxmH8WusnHzxeZzKh1n
         aDE8K/Er3iHiH8lNtPiRfXD6T3t5xPunfn1GneWzl33megee+0XRJEMy8tEJU6VfGwsM
         B+hwIzo1Zy9imgfyqHC7zog5LeoI6KWddE8mSDsi7B6Ovjm6bXh0x6R+LXljH/YBI4B1
         KCKH0fU0xQmo6WaHUrxfNIFz6FNDHNnORE3uZjzfPvCjMtQBh2Ekz34kwp7FrjRre5IV
         y2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BZzYpN7srheW62psnaXSHx8DA2qbyyiIul6QobFgrhs=;
        b=cXdMREGjvVLWVvsA/iXuB9LiZtc6eIKnQTyPpAk3lkfRxrr0ODXbZdI52uvzj2r6go
         UgP69rUZiYNHYLZJmRridM9QlSR5TpvEPiwow3h6ihn9aVlUowYVuvTr2jh2DKqDKGO8
         Y9FaAlyMMRvX4V/ZngiefTFhnsET63sTAtsDnXobJbggeu943qwjY02cHN7BePHuIbrG
         0s6OBUoixkWq2krB0U1QPuWT5lRuzoCmcUVAPw2EHMWl3WVT/wPPOSuTMvHO1p86PWkl
         2jxYJ46JuI+iDWDko810G1tOL6JkUa9xPK2ewWcH67/diysJG8Ix2onkWWLGUdOYhUm2
         jxag==
X-Gm-Message-State: AOAM531CW5+VEJVj6FyHghs0KynY8iPTH4masTffCw4lFpm6V04EAUWQ
        WmgsPhH55U1jES/iDCSf2h8p3UTzsaE=
X-Google-Smtp-Source: ABdhPJxKdqblUAPAHVgt0W7cmnN6Wfq1A83dTAVlAHe+WDwoH2mq30O52rceZwlf30PiPDWTV/t3TQ==
X-Received: by 2002:a6b:dd13:: with SMTP id f19mr26186361ioc.74.1608829540130;
        Thu, 24 Dec 2020 09:05:40 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:f45d:df49:9a4c:4914])
        by smtp.gmail.com with ESMTPSA id f20sm9732965ilr.85.2020.12.24.09.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Dec 2020 09:05:39 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V2 9/9] arm64: dts: renesas: beacon: Increase sdhi speeds
Date:   Thu, 24 Dec 2020 11:05:02 -0600
Message-Id: <20201224170502.2254683-9-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201224170502.2254683-1-aford173@gmail.com>
References: <20201224170502.2254683-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The eMMC can run at hs400 and the WiFi chip can run at sdr104.
Set the respective flags to push the sdhi faster.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  New to series

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
index b34ffa1e77fa..56bdd80e36d0 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
@@ -271,8 +271,9 @@ &scif2 {
 };
 
 &sdhi2 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&sdhi2_pins>;
+	pinctrl-1 = <&sdhi2_pins>;
+	pinctrl-names = "default", "state_uhs";
 	bus-width = <4>;
 	vmmc-supply = <&reg_3p3v>;
 	vqmmc-supply = <&reg_1p8v>;
@@ -281,6 +282,8 @@ &sdhi2 {
 	pm-ignore-notify;
 	keep-power-in-suspend;
 	mmc-pwrseq = <&wlan_pwrseq>;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
 	status = "okay";
 	#address-cells = <1>;
 	#size-cells = <0>;
-- 
2.25.1

