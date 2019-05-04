Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5618A136B7
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 May 2019 02:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726700AbfEDAqT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 May 2019 20:46:19 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55983 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726846AbfEDAqT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 May 2019 20:46:19 -0400
Received: by mail-wm1-f66.google.com with SMTP id y2so8669734wmi.5;
        Fri, 03 May 2019 17:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T1a5j4wQOMQ4OWB49dqiWbDIfmn+ssi4ipxGaHFRYmU=;
        b=J8SSYCiqRozdI7bSGvGOYhm1x7ax0w1b7LaVJmoQVUj+4hhgjbD9miaTBZ5Q+jvmeq
         fpw8ctvkhxGct9JcLtKw3McSO+cNxEPuDf8OCF/GoeI6dgl6pJvuAH3p6VKrsp9QX8s/
         ieLzkHQWxnxeDWyBbjJMTPJNlvEvglCT3Lo3wJBCpy21Ir5cChJjOpcEHdh440djHoIt
         1QDVmQ9qbrQBRflEoFQ7c+wWDZD0dV8pCBu9ngRMao/XS6Y+ROcBIuUDC5+gTbUNj1nC
         yEG+zX832CoZ2CEc0qP8vUEm7J9L/F+ZQADT/BT5IKeEcNVf8SyPTYSknsCV4SA6uISs
         3CLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T1a5j4wQOMQ4OWB49dqiWbDIfmn+ssi4ipxGaHFRYmU=;
        b=PsM6nnRHjRACSoZpVrKZEw+n3KByh0R8VqgIPnvPwOJiXFtsfcXuplMLhTBmPGTOI3
         ed5D5ejrQphlMhWsNXc5K/gGgttSEAfzI05wrVpNkbAeLRz2kKqW8x8ZkuiaoNLr++xC
         L1hFHt1c2YgypiL0RSzRJuRG69k7uRv7F6vKqnQPTAljGNLcGjIjzBXgvEejWiMSj5dG
         tQSXjklaj9b+veYtrhNJJCfETpOIldxeaU0zZFI6HI839ejIjB3D1SLCAysk8EuGDZ4x
         7nWXjSExO5hQ9dIwgQHmTR1QY0V2cse9dmkcBjBttJ2p9LTEkjkSaeVrXi/qj5QCWGft
         VcLg==
X-Gm-Message-State: APjAAAXL7XamNCbVwaF5bMA69pyuJOqZaB39xHafcyf/o6UbAYk3Rt3T
        fWA4xLKtKOyjAf872UUI6ac=
X-Google-Smtp-Source: APXvYqx3TIhVvijrJC3CKiX/ezPH1vUd+L8XwrYGDTC+bcLqV8SpuMTT8tYKf7mYCbmo63u5XCOdLA==
X-Received: by 2002:a1c:1a90:: with SMTP id a138mr8239064wma.81.1556930776662;
        Fri, 03 May 2019 17:46:16 -0700 (PDT)
Received: from localhost.localdomain (ipb218f40a.dynamic.kabel-deutschland.de. [178.24.244.10])
        by smtp.gmail.com with ESMTPSA id b11sm5979161wmh.29.2019.05.03.17.46.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 03 May 2019 17:46:16 -0700 (PDT)
From:   Eugeniu Rosca <roscaeugeniu@gmail.com>
X-Google-Original-From: Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "George G . Davis" <george_davis@mentor.com>,
        Andy Lowe <andy_lowe@mentor.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: [PATCH 6/6] Revert "arm64: dts: renesas: r8a77995: add DMA for SCIF2"
Date:   Sat,  4 May 2019 02:42:58 +0200
Message-Id: <20190504004258.23574-7-erosca@de.adit-jv.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190504004258.23574-1-erosca@de.adit-jv.com>
References: <20190504004258.23574-1-erosca@de.adit-jv.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This reverts commit af2ea3df851ffa68ad07ff59d4dabadbf33b45ef.

Both empirically and based on the existing documentation, it looks like
SCIF2 does not support DMA. Let's disable it. Full reasoning is given in
commit ("Revert "arm64: dts: renesas: r8a7796: Enable DMA for SCIF2"").

Fixes: af2ea3df851ffa ("arm64: dts: renesas: r8a77995: add DMA for SCIF2")
Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 5bf3af246e14..bd3ac5d00b2e 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -740,9 +740,6 @@
 				 <&cpg CPG_CORE R8A77995_CLK_S3D1C>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
-			dmas = <&dmac1 0x13>, <&dmac1 0x12>,
-			       <&dmac2 0x13>, <&dmac2 0x12>;
-			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
 			resets = <&cpg 310>;
 			status = "disabled";
-- 
2.21.0

