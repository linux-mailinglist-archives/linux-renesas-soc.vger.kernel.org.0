Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AC042E2835
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Dec 2020 18:06:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728864AbgLXRGM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Dec 2020 12:06:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728817AbgLXRGL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Dec 2020 12:06:11 -0500
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E95B9C061757;
        Thu, 24 Dec 2020 09:05:30 -0800 (PST)
Received: by mail-il1-x136.google.com with SMTP id q5so2420143ilc.10;
        Thu, 24 Dec 2020 09:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kMu0V0XfARwBi9aJHQmsTWP3xxgAO07/j8cH5gKT7As=;
        b=CfJRRBpqMzgTU1oPORrpjPnbsZyj5NvD+X1KhT/2T2hhh7p3UfVouKH+Zyvg6KTNUj
         zaHPbAyzql8AUSf6pEkNOpB3iLhNz52jUD46fn474ALPLTmYBiOmPH8Tt1F0upklDRhr
         ZyamkFnTA6DL4eTh8Lj8kExW0IuZKLEr/Aoy39+d3NO6T1GJIYtjnzmJH9F7fgKdy7Qw
         7UnC70PkpyWMmdygjaPdL2pUbf0UcmzOkobOKjIwrVd4rra6b4AD7azBX9lzNCoZWFja
         AMuWEQdNnm9AULSFQQvC8iHqjrjFCfdl4UtAjO8qLYwKxF7PXBK0iR/SzDCnxMFWXR4m
         mZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kMu0V0XfARwBi9aJHQmsTWP3xxgAO07/j8cH5gKT7As=;
        b=otnsJqYNzRglY7OjckmVXsR900K0ClC8dF8YAo2I/48935+/DP9ItfbotpVwryDWdy
         KWrv21U4reFIWOaECdqOBgMNurcy36tGF0ot/+jaYnnxMLHJ/+uLkAvvaJn0rfUrS7AI
         aQ/bpcK+tDXGZ5KkGND7J24P7jAqxA/TaX2smrdDNhCtZC7moCrUdcwfTgI53WyvrnOt
         t7Uo2XntIIxW72xV3oxRhRkFkfej0aKVu2Q1Q73i8ZpS7CW13spL+ULGs67pMGF2OBlL
         CD1HKfQJ1ztr8w6mvCpNO5UpDfWDV1aqDy9eTn8yVR4nLbeGVUDtRXPzIH1qZkJiQNKt
         3jSA==
X-Gm-Message-State: AOAM533+lY8MsPrBAJN19qQCuP1JWWeetGZJJRRQ7/ofc6IEFRyfEGfy
        Uhpp97/zUqudsx0o6G3o+Ipi59NlnjQ=
X-Google-Smtp-Source: ABdhPJwHvXS1PiJasUu21iUGHH88seD2pI6GNjQmXzcQVU9jn6XU+VFJuIJsPls35lmQils/+doZfw==
X-Received: by 2002:a92:9153:: with SMTP id t80mr30232754ild.216.1608829530000;
        Thu, 24 Dec 2020 09:05:30 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:f45d:df49:9a4c:4914])
        by smtp.gmail.com with ESMTPSA id f20sm9732965ilr.85.2020.12.24.09.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Dec 2020 09:05:29 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V2 3/9] arm64: dts: renesas: beacon: Configure Audio CODEC clocks
Date:   Thu, 24 Dec 2020 11:04:56 -0600
Message-Id: <20201224170502.2254683-3-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201224170502.2254683-1-aford173@gmail.com>
References: <20201224170502.2254683-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

With the newly added configurable clock options, the audio CODEC can
configure the mclk automatically.  Add the reference to the versaclock.
Since the devices on I2C5 can communicate at 400KHz, let's also increase
that too

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Remove the un-used clock-names reference.
     Base on: https://patchwork.kernel.org/project/alsa-devel/patch/20201217162740.1452000-1-aford173@gmail.com/

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
index 4e86d308d07e..dc5e05d7a792 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
@@ -385,13 +385,14 @@ &i2c0 {
 
 &i2c5 {
 	status = "okay";
-	clock-frequency = <100000>;
+	clock-frequency = <400000>;
 	pinctrl-0 = <&i2c5_pins>;
 	pinctrl-names = "default";
 
 	codec: wm8962@1a {
 		compatible = "wlf,wm8962";
 		reg = <0x1a>;
+		clocks = <&versaclock6_bb 3>;
 		DCVDD-supply = <&reg_audio>;
 		DBVDD-supply = <&reg_audio>;
 		AVDD-supply = <&reg_audio>;
-- 
2.25.1

