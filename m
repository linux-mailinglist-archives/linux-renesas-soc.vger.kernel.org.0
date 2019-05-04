Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7FEF136AD
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 May 2019 02:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726847AbfEDApq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 May 2019 20:45:46 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41738 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726654AbfEDApp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 May 2019 20:45:45 -0400
Received: by mail-wr1-f66.google.com with SMTP id c12so9855119wrt.8;
        Fri, 03 May 2019 17:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=60g1iATd2Ji9UNIIxjfzFEhqI7afmYF8Ktl39ggIO1g=;
        b=J9AJicIIzmrZS1RV8A8ApEXFDYgYFZmy0gPimbONo0WZ0Uxbyav1EqCO29lQngw46o
         jk1MNFTosFJYIz5DYFMKX2uIhgnYQZDcIvmkrG7f7enEzPiBLnwlikHGrl0ZJYKQKBfN
         1T2mLDjBZTxfBUQJnqWBjAkq8XmeLS8WgLR7w0MNCKiSeIafs4ED1BluZfeQTnJPvKNT
         dfntUN8thFKYbrjZIsuksPmj3xJKCrJwj3f1hWA+JijOQXfBj1z1uzUC5KwDCwoFwtc1
         eoeJ6Jw1QveNwKTMSvmY9gzodU540QNrpb7O6VfOTXfLfsd5hgjUCbxt/aEwr5QnCMqj
         o4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=60g1iATd2Ji9UNIIxjfzFEhqI7afmYF8Ktl39ggIO1g=;
        b=G53uT7dGgpeff81BhdGvWipNk+NL0d48CrE8TbFAvqVuLL4kH/TVa/NR05WCvtyDxX
         S1wWhsEX0cFkZMXNNJfkioydx7GlmgKZVXtGYurWIY6+GeVoaOYvheke6p6BKHNcSbU0
         Dd889fIL9xcVErHgt0oFXkRlyUUtQQQVbdri26Io82iwJGZtP1yDvc0L7KjGGU0H4dQx
         BOZd1ry/7Dg6r452eE6gmATp1MZ0/BTj5ZWriLs1bRPwupLd45/fMwTIg2+H1nUWT8g7
         U3fvoZqSdSXJT1jhxSjtY4Tp/nojHjqI2pF57TkCkv99IrRPBvxbwa9qDeinPr3eBC6j
         /0LQ==
X-Gm-Message-State: APjAAAUMo9vaFMBoKOznydnHaMAB+Wj6VeU/d3blyfAvHJFLRiE6w4p+
        sdM0JdGFGnWob/sM2XtP+FE=
X-Google-Smtp-Source: APXvYqxSm+06HZWrUqJh5A7hSOZ1iUk7orZqT5brMqjy+4kBrsKsgSVdZeE6p6zdgfyM+ChLr0aa0A==
X-Received: by 2002:a5d:654a:: with SMTP id z10mr9405038wrv.153.1556930743313;
        Fri, 03 May 2019 17:45:43 -0700 (PDT)
Received: from localhost.localdomain (ipb218f40a.dynamic.kabel-deutschland.de. [178.24.244.10])
        by smtp.gmail.com with ESMTPSA id b11sm5979161wmh.29.2019.05.03.17.45.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 03 May 2019 17:45:42 -0700 (PDT)
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
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Michael Rodin <mrodin@de.adit-jv.com>
Subject: [PATCH 2/6] Revert "arm64: dts: renesas: r8a7796: Enable DMA for SCIF2"
Date:   Sat,  4 May 2019 02:42:54 +0200
Message-Id: <20190504004258.23574-3-erosca@de.adit-jv.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190504004258.23574-1-erosca@de.adit-jv.com>
References: <20190504004258.23574-1-erosca@de.adit-jv.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This reverts commit 97f26702bc95b5c3a72671d5c6675e4d6ee0a2f4.

Here is the story behind this revert.

Mainline commit [0] landed in the stable tree as commit [1], from where
it reached us in the form of regular stable update. After that, Michael
started to report occasional (30-50%) freezes of serial console on
booting M3-ES1.1-Salvator-XS. Same happened on M3-ES1.1-Salvator-X.

Every time the issue occurs, the serial console outputs below [2]
before becoming totally unresponsive and printing nothing else:
  rcar-dmac e7300000.dma-controller: Channel Address Error

Git bisecting shows that the problem is contributed by commits [0-1].

While we can't be 100% certain (since we don't have the SCIF design docs
revealing its internal implementation detail) we think there is plenty
of evidence to assume that DMA is not supported on SCIF2, hence should
stay disabled on this specific channel:

 - Excerpt from Chapter 17. Direct Memory Access Controller for System
   (SYS-DMAC) of R19UH0105EJ0150 Rev.1.50:
   ---------8<---------
   [H3, H3-N, M3-W, V3M, V3H, D3, M3-N, E3]
   The following modules can issue on-chip peripheral module requests.
   [..] HSCIF0/1/2/3/4, [..] SCIF0/1/3/4/5,
   ---------8<---------

 - Excerpt from RENESAS_RCH3M3M3NE3_SCIF_UME_v2.00.pdf (Yocto v3.15.0):
   ---------8<---------
   DMA Transfer:
   - Support: SCIF0, SCIF1, SCIF3, SCIF4, SCIF5
   - Not support: SCIF2
   ---------8<---------

 - Disabled SCIF2 DMA in official Renesas v4.9/v4.14 kernels, e.g. see:
   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/commit/?id=e79c418fda8c

Based on the issues generated by [0-1] (reproduced on H3, M3 and M3N)
and the doc statements presented above, we think it makes sense to
disable DMA on SCIF2 for most/all R-Car3 SoCs.

[0] v5.0-rc6 commit 97f26702bc95b5 ("arm64: dts: renesas: r8a7796: Enable DMA for SCIF2")
[1] v4.14.106 commit 703db5d1b1759f ("arm64: dts: renesas: r8a7796: Enable DMA for SCIF2")
[2] scif (DEBUG) and rcar-dmac logs:
    https://gist.github.com/erosca/132cce76a619724a9e4fa61d1db88c66

Fixes: 97f26702bc95b5 ("arm64: dts: renesas: r8a7796: Enable DMA for SCIF2")
Reported-by: Michael Rodin <mrodin@de.adit-jv.com>
Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index cdf784899cf8..23de63f3d6c3 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -1262,9 +1262,6 @@
 				 <&cpg CPG_CORE R8A7796_CLK_S3D1>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
-			dmas = <&dmac1 0x13>, <&dmac1 0x12>,
-			       <&dmac2 0x13>, <&dmac2 0x12>;
-			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
 			resets = <&cpg 310>;
 			status = "disabled";
-- 
2.21.0

