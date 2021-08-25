Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B4773F7510
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Aug 2021 14:28:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240418AbhHYM27 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Aug 2021 08:28:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240650AbhHYM27 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Aug 2021 08:28:59 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5B85C061757;
        Wed, 25 Aug 2021 05:28:10 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id v16so23771138ilo.10;
        Wed, 25 Aug 2021 05:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iHmtl3F0eyaFlaZbvlgPj3YVfSdNpBevH3LP4tVAhn4=;
        b=HFyzYw2YU8BN2yx48lCVksgb/CJJk50CMV2mfjxTNoNQ8lMoCkZRAPmQiJTxhfQLJl
         RHAbAlZJk7I6Vu53w0hCQJdWpxRNEoZRrLZ5Mei5pKNYH6B3sBAggiWOYDy5qqjtQEWk
         x9IK6H3AW3byZ+/RIFdpln5Jly8C6UqyUHTH++qy+Fa1iapG7ceZrkbOx1+APq3DHfg2
         UiLKs+0y2uboylTLDzL7MN7vlGz1fdR5XuwAMkVB2h4Wmu1A7BGG267yiv2lr0WWxAbb
         dAyZXY319KqDP5SMbTZlDWym+swfIc84v+PeJGxzNT0HkwPjaP/gPYYdiuKXffybNGfX
         Ln9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iHmtl3F0eyaFlaZbvlgPj3YVfSdNpBevH3LP4tVAhn4=;
        b=en8RhVOW5CyxLoBIWhKKCx9n3+xSIXNpbkABQrbGhbkPQxRnELsLW6hcgLM3QuiQmE
         GI/eoXl4sqSl4pD0egZgYA7WeDWJZxPfhoZy4YJF51C0FAB9FR8nacK6hl9N/GjQia5+
         2Ml49N1pn/oWRFJaaB2rWXvvILAXp0s5KexooaraFnvb+6BEpjkmPmQwb2ENQfWTfuWQ
         N3BXoi2XMwXSIRX+d9AODWOgnuK9fZj8BNhMRpZ7ZqzMLUJNVzP2cfoMoPaIHBhWXPco
         Y8SYuZ+hBahw4uVI9eLU1hAjERPwHXl9PFTZU7CkydGQWfIdJlSZYYjS3bWWPLm+75k7
         wSiw==
X-Gm-Message-State: AOAM531JxZNx/2q2KKqSi/lVxPkJr0OiL6d9OCLrjLd9gDn1Pv/5GCs0
        53+jkIHtHqeHZIcVt1P+uYERE1Z30g3ToQ==
X-Google-Smtp-Source: ABdhPJyEen6CiA/2N2A3REKPlfsj5Y/T32FiQnHjq8tNKga8U3oCXSxfs/XKZ/Y65mgLI2bdDU8bBA==
X-Received: by 2002:a92:3012:: with SMTP id x18mr10220927ile.249.1629894489534;
        Wed, 25 Aug 2021 05:28:09 -0700 (PDT)
Received: from aford-IdeaCentre-A730.lan (c-73-37-219-234.hsd1.mn.comcast.net. [73.37.219.234])
        by smtp.gmail.com with ESMTPSA id u7sm12058612iog.27.2021.08.25.05.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 05:28:09 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     geert+renesas@glider.be, devicetree@vger.kernel.org,
        Adam Ford <aford173@gmail.com>
Subject: [PATCH] arm64: dts: renesas: beacon: Fix i2c2 speed calcuation
Date:   Wed, 25 Aug 2021 07:27:57 -0500
Message-Id: <20210825122757.91133-1-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The desired i2c2 speed is 400KHz, but when measured on a scope, it
is incorrect.  The driver can use the i2c-scl-rising-time-ns to help
calculate the proper setting to get exactly 400KHz.

Fixes: 900d9fc3bece ("arm64: dts: renesas: beacon: Correct I2C bus speeds")
Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
index 2692cc64bff6..987357c58390 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
@@ -328,6 +328,7 @@ &hsusb {
 &i2c2 {
 	status = "okay";
 	clock-frequency = <400000>;
+	i2c-scl-rising-time-ns = <50>;
 	pinctrl-0 = <&i2c2_pins>;
 	pinctrl-names = "default";
 
-- 
2.25.1

