Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40371136AE
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 May 2019 02:45:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbfEDAp4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 May 2019 20:45:56 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41749 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726914AbfEDAp4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 May 2019 20:45:56 -0400
Received: by mail-wr1-f68.google.com with SMTP id c12so9855379wrt.8;
        Fri, 03 May 2019 17:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4mcVmLTkRSUd+7KBv/SWmh/hG34LzRqn8wCf+WbombY=;
        b=Ya2WVApmvFh+JLNizo1hCcwFuEi6SJAFdo299wTLu43p5du0ggRqVqNsUHMfN1xr3X
         Q2HaYj0IQZTdKG3xuwBJMzQ0BHoS/zdxq+rvvVpBfC4oJHwKPfI79NerYtT0OqTyTP/K
         0Fx0P7EWOElgCGEmPj6mps38RDyOIW2zdaCfVkqswmFqwnkzNyNeQOth/zagO5aNmdab
         kqwk0oILoO5sAI8+bNsjqPil4TI6M2KOtfUQ+BOAykj63wYUpR5fjPyUMkLRIPFHJ65u
         Kto39oeGs/OxeLoHVvYCpdkGQ852fPrLlMjAoaxHvRSO4u0SjlRGNrsR8DmgSU3UJDpH
         q0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4mcVmLTkRSUd+7KBv/SWmh/hG34LzRqn8wCf+WbombY=;
        b=atYP76Iw3TgToPCSNwv+jsm5JZKtksRJhCUQYmkCo0YRmwmHHca/hFVprFCqe5TZRb
         d+w/PJYrCRFH94s9IdU2E97ktVF4nf1YFSQ8kuOFrdMVbXcsg5aPkEIZDlt+W2qQK08s
         RS1tah48o1TBH0pZzXmejoj5hH5eb/rzhdaWJepexkFho6tKbi7Yxl49JZxmHqwO+9Ct
         LScQCt7vbWSE/gSezeZWfNvdzgWNkDT0pWC++ZlkCddYqa7aVRilRO6UiTWbCJ5sm20w
         tJ4WEGEa/P+fujG+yUaeovXl45/Bq/PoNfGL3+TuONS1pAjaxcyMRdTP4343gfOVCpZN
         Smmg==
X-Gm-Message-State: APjAAAXYyhmCyVPNaOZ3nH16W811t9UC9ctnd4nIjuH74wYFkC63XocD
        yRxw1AVeJKAKsTWfe6PEZIk=
X-Google-Smtp-Source: APXvYqwPWn2stQT8D9aqc92KeXI1wnbcDMFq/n7PO0d8rDanJrqvNEQ9oXDN9BSKEWY734qMVNTdGA==
X-Received: by 2002:a5d:4acc:: with SMTP id y12mr9259556wrs.234.1556930754363;
        Fri, 03 May 2019 17:45:54 -0700 (PDT)
Received: from localhost.localdomain (ipb218f40a.dynamic.kabel-deutschland.de. [178.24.244.10])
        by smtp.gmail.com with ESMTPSA id b11sm5979161wmh.29.2019.05.03.17.45.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 03 May 2019 17:45:53 -0700 (PDT)
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
Subject: [PATCH 3/6] arm64: dts: renesas: r8a7795: zap dma configuration in scif2
Date:   Sat,  4 May 2019 02:42:55 +0200
Message-Id: <20190504004258.23574-4-erosca@de.adit-jv.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190504004258.23574-1-erosca@de.adit-jv.com>
References: <20190504004258.23574-1-erosca@de.adit-jv.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Both empirically and based on the existing documentation, it looks like
SCIF2 does not support DMA. Let's disable it. Full reasoning is given in
commit ("Revert "arm64: dts: renesas: r8a7796: Enable DMA for SCIF2"").

Fixes: eb21089c32054e ("arm64: dts: renesas: r8a7795: Add missing SYS-DMAC2 dmas")
Fixes: 49af46b4095672 ("arm64: renesas: r8a7795: Add all SCIF nodes")
Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index abeac3059383..7704bd46afdf 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1323,9 +1323,6 @@
 				 <&cpg CPG_CORE R8A7795_CLK_S3D1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
-			dmas = <&dmac1 0x13>, <&dmac1 0x12>,
-			       <&dmac2 0x13>, <&dmac2 0x12>;
-			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			resets = <&cpg 310>;
 			status = "disabled";
-- 
2.21.0

