Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44052136B1
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 May 2019 02:46:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726914AbfEDAqF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 May 2019 20:46:05 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55969 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726600AbfEDAqF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 May 2019 20:46:05 -0400
Received: by mail-wm1-f65.google.com with SMTP id y2so8669324wmi.5;
        Fri, 03 May 2019 17:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KuwUHQWOOly8GFk7p0yEd8RtBOjjsLVUGKjg2tkNT9k=;
        b=VmFfCj3rLEsa43520oHTqGeAcIiX9wOw5oCJU7xrvINDnYpa6xtWN0Ef2jXcMGpCLr
         GX79y/YB61BHEyQju00p16SiPrRp5xNzhn6XYjzrHgyI2QHIDPd2o/5YBf3IStDzfIu2
         IOYl36ZVwAxuFtObAb6qTp3nIdrU8Ji1G+WPusb+xQWoceT1Qa5quia3xWVPmHRn2GuU
         Nug6znuOj8pKehiU2MIP0yFrfHPWBQzSR33MvuysHJXrEm3Au+czFp3NfcJ5Ux9sYG1S
         WrimlHDQbPWwWF+FN2KkDjgAGvqS/0I/jJk3UglNkC7Iw3ZE8BAJbihKSReJdttOavgt
         lBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KuwUHQWOOly8GFk7p0yEd8RtBOjjsLVUGKjg2tkNT9k=;
        b=muO1vTEGCuT92fAOflGr5DRzuKd4jdOtJpf3yK/dhIS0u5Ls2z3yfR3oqBMXNUTOr6
         cWiPpG3Z0UyKaPlc2/k1k9pY7cFfsw0t8nlUiL1q6+NelDbZ0scEJi59ZrubZpKbSxKm
         DPceZwvP+PxAU1UUem0B8sZLQGBybR7jOJUYLSBXu4+NIhUDdsEFD9TwIZa9oJHGedBX
         wERl4iTIJPa+r1dsWeZIOFvNmWGa2yHHgwLZzSMHwJga7Himpq557XqRlPP9fGIkxaia
         5LTikLREXdREuCeRNi3/f5PzjCO2eJMHQyb+PfLeawlUPFB4JKE6awRXojcf684hRTTJ
         0JUQ==
X-Gm-Message-State: APjAAAVaaGxNJU7pt3G/TgZ7uT81yw4X7HH4p+otIRFg3ofPLsPq8X8P
        QpdvKW8xnL4uTHMJ49p5tN4=
X-Google-Smtp-Source: APXvYqwy5B09ksg2CRG1ihQkrfSJP8zikUvut2MCM8MDjWrKIKuKIq2cTRI/AfJf71T9Drgfef6nTA==
X-Received: by 2002:a1c:c788:: with SMTP id x130mr8416823wmf.118.1556930762963;
        Fri, 03 May 2019 17:46:02 -0700 (PDT)
Received: from localhost.localdomain (ipb218f40a.dynamic.kabel-deutschland.de. [178.24.244.10])
        by smtp.gmail.com with ESMTPSA id b11sm5979161wmh.29.2019.05.03.17.46.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 03 May 2019 17:46:02 -0700 (PDT)
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
Subject: [PATCH 4/6] Revert "arm64: dts: renesas: r8a77965: Enable DMA for SCIF2"
Date:   Sat,  4 May 2019 02:42:56 +0200
Message-Id: <20190504004258.23574-5-erosca@de.adit-jv.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190504004258.23574-1-erosca@de.adit-jv.com>
References: <20190504004258.23574-1-erosca@de.adit-jv.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This reverts commit 05c8478abd485507c25aa565afab604af8d8fe46.

Both empirically and based on the existing documentation, it looks like
SCIF2 does not support DMA. Let's disable it. Full reasoning is given in
commit ("Revert "arm64: dts: renesas: r8a7796: Enable DMA for SCIF2"").

Fixes: 05c8478abd4855 ("arm64: dts: renesas: r8a77965: Enable DMA for SCIF2")
Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 9763d108e183..979f14d1fcc4 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -1068,9 +1068,6 @@
 				 <&cpg CPG_CORE R8A77965_CLK_S3D1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
-			dmas = <&dmac1 0x13>, <&dmac1 0x12>,
-			       <&dmac2 0x13>, <&dmac2 0x12>;
-			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
 			resets = <&cpg 310>;
 			status = "disabled";
-- 
2.21.0

