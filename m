Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 336322D8F76
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 13 Dec 2020 19:46:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729216AbgLMSpm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 13 Dec 2020 13:45:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732005AbgLMSjg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 Dec 2020 13:39:36 -0500
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7017C06179C;
        Sun, 13 Dec 2020 10:38:22 -0800 (PST)
Received: by mail-io1-xd44.google.com with SMTP id z5so14759848iob.11;
        Sun, 13 Dec 2020 10:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IaTw/CoXTEDe2jdjMYJgtS7muhBT7sMsP2gQ28UOtHY=;
        b=l+VEMmGMLuuv9oP3vzKGKPva9hQYPU0U363al+8kPVaiSmIBpKER6ssi/aAKUQ2GdR
         pPD3mUo4+JJu1tqOLCyPOgE/CFpri/StpoG+8fEG2v7ippmhQQRCYSmukTzNgoMXjxAO
         ZwtuHV2sNFt+QCLnBQXgSmzD5eXIAqbRMa9oCA7dl2PHLUSEXXbK9oaNzEM+036U37h6
         d4Npp9xAEJeSLpVCAOOzDCtaaxKRNz38l/rr8PfRqtNnbGMT26TI0xO5+p51Ob5AQOsH
         MfwI6OXFRpKXDjA71BRq9L4Zl85LaxGJx1+2h3j3yrR3Uoa/HponG6PEuX7hYRcps5GV
         l2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IaTw/CoXTEDe2jdjMYJgtS7muhBT7sMsP2gQ28UOtHY=;
        b=HWeWgBIMcfeEDgkYei7sAZcrmdALECZO8oC0c4FNI7dHuLZ3mca6GvQ7QLpjKVSI11
         jKJiJrnrJmvNXZq7YDhT/de/1U+V8uQIAI2w0Vlm2i/zE+zswvHWulJdcKigCdbxvXED
         n/m0JZas2psT/LozbhdQLWxp3EbH47bJOkc90Hho66SdP4Vyh7VrZ5WPuii4J5aSUa2w
         3s0QoWim3Jnp7NQ0dPohVdUd2594Qbk+6mDYgTMm31SUM4rntnEfZZ3Nq3+sPtvfOnb0
         dJoaaL4LR6AF1QlAA9rjMAPBmPVFbax3ztk2zrsfKDnjqmXUnqWXSkqSjtymSWj6GfYx
         bFOA==
X-Gm-Message-State: AOAM533byFaLV/Dx17St5ALVpdsMWFKCL12n+6hXHv6iTM4xbobF52Ha
        m0sCfNKoryqw5cCemNYwBPUvwrbL6L1CfA==
X-Google-Smtp-Source: ABdhPJwUSNR4r6DcUg1Hysup9rEq6RnKVxA7vVIr/U1JzElcqjxx9gkrUCKcxnLTDJdCWcoqznJSBg==
X-Received: by 2002:a5e:8d13:: with SMTP id m19mr26302068ioj.169.1607884701976;
        Sun, 13 Dec 2020 10:38:21 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:f45d:df49:9a4c:4914])
        by smtp.gmail.com with ESMTPSA id o11sm7804532ioa.37.2020.12.13.10.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Dec 2020 10:38:21 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 05/18] arm64: dts: renesas: beacon: Fix audio-1.8V pin enable
Date:   Sun, 13 Dec 2020 12:37:45 -0600
Message-Id: <20201213183759.223246-6-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201213183759.223246-1-aford173@gmail.com>
References: <20201213183759.223246-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The fact the audio worked at all was a coindicence because the wrong
gpio enable was used.  Use the correct GPIO pin to ensure its operation.

Fixes: a1d8a344f1ca ("arm64: dts: renesas: Introduce r8a774a1-beacon-rzg2m-kit")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
 arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
index 5c09e64001cc..ee7809e8db07 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
@@ -151,7 +151,7 @@ reg_audio: regulator_audio {
 		regulator-name = "audio-1.8V";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
-		gpio = <&gpio_exp2 7 GPIO_ACTIVE_HIGH>;
+		gpio = <&gpio_exp4 1 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
-- 
2.25.1

