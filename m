Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 842852F3224
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Jan 2021 14:49:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729208AbhALNrJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Jan 2021 08:47:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726594AbhALNrH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Jan 2021 08:47:07 -0500
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD74AC061786;
        Tue, 12 Jan 2021 05:46:26 -0800 (PST)
Received: by mail-io1-xd30.google.com with SMTP id 81so4006809ioc.13;
        Tue, 12 Jan 2021 05:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1pgvXSz+KcenK/bUkD4kOy3ITrvA2LEnG5WD/C+xaN8=;
        b=m0uJtE8mA8oMPNJwIRj9LZjcexO19wC4Ka1Z2BK8C4cYfvcNS27VpMmuR47LBEgmWv
         DsCb2GG5iZjeQDGxcxAv3Roxa3nZKXychQZqq/TmEV/SNFrELmyPbx/j3N8g1ofxeO+C
         8/6Df+XPW7dpCqko5jTJrYdtPQ3RNC+/107m6h6uF15xDblzql3bs66C7myKrfoO2f6l
         K1RiugHps6hkzrx/fAw99sEt/1ExVw8uKj+Cc1RGzstrwSqg+rfFj5pt7Yc/0KGCXefL
         XBn1r97dWYXQ88yNZTxLZh6iKErJDK2rdL9veRpsgOdAouVjrooTbWsd8mc+qObKEIz4
         lL5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1pgvXSz+KcenK/bUkD4kOy3ITrvA2LEnG5WD/C+xaN8=;
        b=uPBZeQOy+CCirUr/ccJClKIaWiLGUf9ehgKMSEAAtMhl1cE2gzMg1j2ZmcE8eM8iNp
         Hl8pa1oSyiPe9o6qu3H5lEFOYRkU+BGblq10JKgsfHHbVwAwAvuyBV/XOKSj6by42jzG
         Z3HXjre9EcdMeJ81rJI9+vecyVujDBu2Et2GmWaBHOl41M50IUFLGd8Kjz/CShHHVT2k
         +4DKIr03IHfrXGmMajEUnKTYM6oCfdq4PVMHvoAyl7OKdnyEdS+8vfo5yWyBR2TIlR0x
         hkRMaPSK2b4Wo4RgsPjgt7JhWsR+i0Sc0tXCXPDDVT+HIWPskxEDeImFIfCm3EsWOilB
         zOoA==
X-Gm-Message-State: AOAM531aGFhn6zJkZKv6bzx/HwFNh+7a6kV5GMHswQ68Yg7TcSXSy3jK
        pD4XHeu1cUeJcoSTrCo817SYfk3QuYPIig==
X-Google-Smtp-Source: ABdhPJx+ZVFrlKLsqIXZy1NhMJ3xAUjhzNEqaJ8Bc8mSEg6NIGWdUZA9VE/+OUXu/NFftueRZseJkA==
X-Received: by 2002:a6b:6f07:: with SMTP id k7mr3333360ioc.48.1610459185714;
        Tue, 12 Jan 2021 05:46:25 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:3cd8:1112:d064:7fb2])
        by smtp.gmail.com with ESMTPSA id r9sm2598116ill.72.2021.01.12.05.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 05:46:24 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     geert+renesas@glider.be, aford@beaconembedded.com,
        Adam Ford <aford173@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: defconfig: Enable CLK_RCAR_USB2_CLOCK_SEL
Date:   Tue, 12 Jan 2021 07:45:55 -0600
Message-Id: <20210112134555.1787924-1-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The RZ/G2 Series has the optional CLK_RCAR_USB2_CLOCK_SEL.
Enable it by default.  It's disabled by default in the
the device tree, so it should be safe to enable it here.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 838301650a79..84fcfa7a1865 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -932,6 +932,7 @@ CONFIG_SM_GCC_8250=y
 CONFIG_SM_GPUCC_8150=y
 CONFIG_SM_GPUCC_8250=y
 CONFIG_QCOM_HFPLL=y
+CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_ARM_MHU=y
-- 
2.25.1

