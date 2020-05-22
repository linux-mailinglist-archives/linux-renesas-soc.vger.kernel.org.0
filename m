Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E285F1DF18F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 23 May 2020 00:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731144AbgEVWBN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 May 2020 18:01:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731051AbgEVWBM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 May 2020 18:01:12 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A2DCC061A0E
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2020 15:01:12 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id e125so7367803lfd.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2020 15:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=md669RdBclbFrXrZGK1KdT+qBRfYNiaWb1iEVBI1beg=;
        b=O3LrhJktEL7Hmmhz9eoMNBvf4alk7CuPA/mqmRwrNJXClKBP/hiLxnSYI82JMvkd9M
         CE8Vk3YWbxplpNff0Vh0kj8u5msHJkSIfo/zSu58I2kT1j6pm60beY2WxJnAmubq7TxD
         Ul7on5MazciqobgfNChHR8awKuMqMCsyTPpYuq0mtt2R5huM2VakzeURcdAmImpumqjE
         qFFpNeP3orI9t4TRD3WO6mTl6qpDG3RDJZCI00s53H1grPGYTPDAoL2I/KFRTsTIP93N
         LLg8W1E7++J9viaffLMmdpz5DufdtIiF2bdh/NhPpI+gVyU1+bhpzBxsZPpuvPtaY+o7
         vFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=md669RdBclbFrXrZGK1KdT+qBRfYNiaWb1iEVBI1beg=;
        b=blMMNzMSONtBXarnWDb82NgGFTnusLI/PoqcD66UGhMswa98bevRqN92fCj/aMzy4k
         bELyyXPC2nss172cbZCBungwFMFOkRYysglTTbA5KWsTebMvfnijsBspew/pudY+GbRD
         sV85ZXLnKtyVvVprtucURDw8hTP42V45vePrRjFmGwwvgE19pn4Lnq/XKUmmrWV5GVM3
         8413K2J4IrDs/MoGoaOntf3Ss+MZ0GPeWqkHOJSSmb426lbyuRTdfawpf6aBb8Uudq+D
         /pmhd4wGx61lL2roKTghQvuNS+nfAI1+DuK5tX0bWUvaAU4rnRbYq0NYjxAPegBsEwUU
         PqkQ==
X-Gm-Message-State: AOAM531S7VcSkARfrZgGNZo31aKRsMtMPqno7bQVrUHCQtn9oiLkpku+
        Rx6wcCAO6nmTC7QZ9srTmvYrPw==
X-Google-Smtp-Source: ABdhPJzeYBhUtxPWro/qvZH9BEjTSufpaypnpYfAOF5uuan0+SD/Bbf7uY/faxjADzmJj7aZsSw2rQ==
X-Received: by 2002:a19:be55:: with SMTP id o82mr2269419lff.168.1590184870680;
        Fri, 22 May 2020 15:01:10 -0700 (PDT)
Received: from localhost (c-8c28e555.07-21-73746f28.bbcust.telenor.se. [85.229.40.140])
        by smtp.gmail.com with ESMTPSA id j10sm2543885ljc.21.2020.05.22.15.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 15:01:10 -0700 (PDT)
From:   Anders Roxell <anders.roxell@linaro.org>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org, sre@kernel.org, robh@kernel.org,
        linux-kernel@vger.kernel.org,
        Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH] power: reset: vexpress: fix build issue
Date:   Sat, 23 May 2020 00:01:03 +0200
Message-Id: <20200522220103.908307-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

An allmodconfig kernel makes CONFIG_VEXPRESS_CONFIG a module and
CONFIG_POWER_RESET_VEXPRESS builtin. That makes us see this build
error:

aarch64-linux-gnu-ld: drivers/power/reset/vexpress-poweroff.o: in function `vexpress_reset_probe':
../drivers/power/reset/vexpress-poweroff.c:119: undefined reference to `devm_regmap_init_vexpress_config'
../drivers/power/reset/vexpress-poweroff.c:119:(.text+0x48c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol
`devm_regmap_init_vexpress_config'
make[1]: *** [/srv/src/kernel/next/Makefile:1126: vmlinux] Error 1

Rework so that POWER_RESET_VEXPRESS depends on 'VEXPRESS_CONFIG=y'.

Fixes: d06cfe3f123c ("bus: vexpress-config: Merge vexpress-syscfg into vexpress-config")
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 drivers/power/reset/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index 4dfac618b942..f07b982c8dff 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -191,7 +191,7 @@ config POWER_RESET_VERSATILE
 config POWER_RESET_VEXPRESS
 	bool "ARM Versatile Express power-off and reset driver"
 	depends on ARM || ARM64
-	depends on VEXPRESS_CONFIG
+	depends on VEXPRESS_CONFIG=y
 	help
 	  Power off and reset support for the ARM Ltd. Versatile
 	  Express boards.
-- 
2.26.2

