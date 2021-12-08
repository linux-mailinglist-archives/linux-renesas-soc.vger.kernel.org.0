Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4BFA46DC8F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Dec 2021 20:56:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236537AbhLHUAM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Dec 2021 15:00:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234014AbhLHUAM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Dec 2021 15:00:12 -0500
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com [IPv6:2607:f8b0:4864:20::a33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D904C061746
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Dec 2021 11:56:40 -0800 (PST)
Received: by mail-vk1-xa33.google.com with SMTP id s17so2312897vka.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Dec 2021 11:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0QynZZFugsFiBjd5RUiN/D0nDwNGP0tAW492krpmYPs=;
        b=mBjBifOdQqmyPtegFy4/EPbdj3luDB5l7QMUhi5NeBi2QdHqUhH5HAXk+LUszL8i9Z
         vYUnuBDqC94r/HAR2zsEkh4YiFtqcX9WWn+7X04rQpZfZhgf8eEJRxzS8xWIkQJ0r1FI
         jQ4tJCJSHifqeR8ldYiNaONoXjAFJZOiJjE6w1XAPPWRBytu1aW+K8OkEpRt4oMnBEpW
         qsxgXn0LsqpeAcXpLHIv0D3hwHhcSBs7ZRSg+K4zZ8zCBEhgYnxZ/HwtnYzIfyOd/aNE
         ZjMc4HiEn5crDZ6EN6vn6WrgWZt7/3pUrF/4t2cmAwfmbyDGP8XI12o0TBsI26B5lYdb
         0Bug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0QynZZFugsFiBjd5RUiN/D0nDwNGP0tAW492krpmYPs=;
        b=TW9nMhytQsLYnjnOq2+65Q6fWW5oTjmXPR9EuJnIL7CCYsRRbi+1FAX1j3zOnLioTV
         56UTex08faUQfOFNKXwmpA+MC9BRZ4PeUaz8S6stOn4UMm1cfPCkg7JlTxNra2tCXlud
         cnLZ98k2ZNRFwat92shIAco1o6auqC8lxRveBSmxZzkEXb3yD0FtlpHbgyS4xxBIoTS4
         9Ke30oy1xp0TwdBmGjb/QBNP+Ye0CecRUffcT886NXc1UKVa91t+03bOyY0udfwo2tdx
         KW3OZvPs/5dqOadU41kNALtPOiO6tMfjABMWkgff8jRqdmwUfqc9ahVMvf1mtzifUozQ
         Uj4g==
X-Gm-Message-State: AOAM532UBm74GOZw7LpyUgGwJBtRvnFvJ67c1ip/oEs7CuJQvMCuhLWA
        CKfrXbgIgFUggj2/HPYIOjA=
X-Google-Smtp-Source: ABdhPJw1STFoYDIm0eXg6rMVODFey4HErivKFYXtQwqFtj//TBAfa1xfW6hDJuaWGb1cBKOw6AHI0g==
X-Received: by 2002:a1f:c193:: with SMTP id r141mr1082089vkf.27.1638993398350;
        Wed, 08 Dec 2021 11:56:38 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:504a:c3e6:fc47:f272:572b])
        by smtp.gmail.com with ESMTPSA id u145sm2607346vsu.25.2021.12.08.11.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 11:56:37 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     geert+renesas@glider.be
Cc:     aford173@gmail.com, linux-renesas-soc@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] arm64: dts: beacon-renesom-som: Remove the 'pm-ignore-notify' property
Date:   Wed,  8 Dec 2021 16:56:24 -0300
Message-Id: <20211208195624.1864654-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The 'pm-ignore-notify' property is not a valid property and there is
no bindings documentation for it.

Drop such invalid property.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
index 0d136809eb96..17d5c4501bbe 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
@@ -293,7 +293,6 @@ &sdhi2 {
 	vqmmc-supply = <&reg_1p8v>;
 	non-removable;
 	cap-power-off-card;
-	pm-ignore-notify;
 	keep-power-in-suspend;
 	mmc-pwrseq = <&wlan_pwrseq>;
 	status = "okay";
-- 
2.25.1

