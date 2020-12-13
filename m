Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40F672D8F6D
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 13 Dec 2020 19:44:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389478AbgLMSoD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 13 Dec 2020 13:44:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388412AbgLMSjl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 Dec 2020 13:39:41 -0500
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0ACEC0611C5;
        Sun, 13 Dec 2020 10:38:40 -0800 (PST)
Received: by mail-io1-xd44.google.com with SMTP id q137so14746724iod.9;
        Sun, 13 Dec 2020 10:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DJdpaqMBlNikuEdPXn/eL3iojeQgmfhPrjnI1eDSeVQ=;
        b=SfdGP/OwdOx+LIPwT4gcBnYk7SIIozSe61B4OzITV/IvG5twbrzmS5W4CVSoNwIyLZ
         VYqhE3wlZe3TbHfbKFT/K2fReGdSgn7jO4W5B+jX5vZvY1m1cRKpAW8E67199TSi3B6b
         KjSPa2JHogUKTLY47quhTBUTbL2PXkMwSOmOWDpYqUERP/kKhKOZyDo8GNGiF4kUgWW0
         mFieOORfodVV6gwaRQJXkkGgYlkuExpFDNPP/O3TgNhBjAWQK5kn5lXVGBgiK4DWtcdi
         3gkn5gQcsS7xhgGwsJiECUQzNPDGckYAHCI7G8ToPnrh29xsfQREQh2c0EiQm0WYpvmX
         qE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DJdpaqMBlNikuEdPXn/eL3iojeQgmfhPrjnI1eDSeVQ=;
        b=CxSP9vpUgjv/JVfezlON6V1mkMykgTP/4or2Ir2W5eTAarcjIXq34ByuKNhr6//X91
         d1nOq3ZMueOCyZh2XCaTnz4x2RmgQSWaIRNw/Gyw6ppdc83yuH8hlsixREkixUbql36k
         enHQzAP4YLx3KZO0/RMXVWj1pbeuKUkFvv69fIoJdG+5MQ/i4DI3+MotFQUFOEM7cMEz
         IA/oHKkxumZKCHfm5zd9vhCbLnol0bMeGsxOEjQmbSL9IiMRQnK2EIg3VQ9yt8EROgNM
         vsvk1XdWdM2TAhezeWjhBmXuk5yqHxMtsXygK6S8JHkPuTJzmMEd2cTpthwOVkvQqgYz
         R9Gg==
X-Gm-Message-State: AOAM530pzf1eF7byPNoFM+OcZVbTfrY/i80aVThw4dAD/Cx4HrSO4eLK
        1sxRejO6gwglKs0wUbaeLpHedi7GyqGU/g==
X-Google-Smtp-Source: ABdhPJyswJzkI+2ilE+ogkjq+qt38sSCnuqIFBMa2wf9mu9tmGsWctE9Bt2Y/NtxN0cgiD4I46jWyg==
X-Received: by 2002:a5d:8793:: with SMTP id f19mr27609789ion.106.1607884719910;
        Sun, 13 Dec 2020 10:38:39 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:f45d:df49:9a4c:4914])
        by smtp.gmail.com with ESMTPSA id o11sm7804532ioa.37.2020.12.13.10.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Dec 2020 10:38:39 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 14/18] arm64: dts: renesas: beacon: Correct I2C bus speeds
Date:   Sun, 13 Dec 2020 12:37:54 -0600
Message-Id: <20201213183759.223246-15-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201213183759.223246-1-aford173@gmail.com>
References: <20201213183759.223246-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

For greater compatibility with upcoming kits that will reuse the baseboard
and SOM-level files, adjust the I2C speeds to make it the most compatible
with all devices.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
index 200236b6e0ef..7f499282f851 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
@@ -343,7 +343,7 @@ &hsusb {
 
 &i2c2 {
 	status = "okay";
-	clock-frequency = <100000>;
+	clock-frequency = <400000>;
 	pinctrl-0 = <&i2c2_pins>;
 	pinctrl-names = "default";
 
diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
index b093a34b0fa0..b5ba45261c0b 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
@@ -110,7 +110,7 @@ &hscif2 {
 
 &i2c4 {
 	status = "okay";
-	clock-frequency = <400000>;
+	clock-frequency = <100000>;
 
 	pca9654: gpio@20 {
 		compatible = "onnn,pca9654";
-- 
2.25.1

