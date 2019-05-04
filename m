Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE735136B4
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 May 2019 02:46:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbfEDAqN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 May 2019 20:46:13 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35465 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726600AbfEDAqM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 May 2019 20:46:12 -0400
Received: by mail-wr1-f68.google.com with SMTP id h15so4161017wrb.2;
        Fri, 03 May 2019 17:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tZ3Gtl5w/Eg0LvXW6tqh/QnbgWobUfKgk0BmiGgfmCA=;
        b=UDZx03gxehpzCpAWsCHVoeC6EbHypcLT2kR6aJXqIkje9qML115ZI/XBofgo/qgqgr
         Nfsg610K4ZXBN48B4fG6D3nbIhat+1SuV6B9XWnFBEZHjRbWTFSV3xN4zZ5J/qDY9JM5
         JBe8bDJ36V8fmiacVSpByzpbAY4Hf2/2WE/dsSuZLzWu0cfOZ2KfYyaUmAVUizbAhHKb
         nrhZ0EUnUQSeYrtEtKmAkw3cyLkn8q9d8bywtBwwV7KrGWyTWGMN8qV1CG9ahisNw+rS
         3Q5zNTaLtSpgnBcZQyXYklrm6q2148myeZt2CkVa+DNiPvTCl4gOcpvNT46kViwY1vsA
         ZLXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tZ3Gtl5w/Eg0LvXW6tqh/QnbgWobUfKgk0BmiGgfmCA=;
        b=VSmaf5eJh5fYwOXnrA0JXiDFVupIptvENYpU6prLcWWw4ZQonvIrcAEghGEE1qirTO
         hrjTi+WMbXtmpUjWCLzo5bUt6Tndv8nyfmuU8W6+VkxFI/BQKAJ1ZV8yW3/30uprfqFd
         aN5OaNQgjVH8p1rOjyRQu7cMgNujheu/TnKTk6SiiDrgSYx4LUpjzjh4H49WC0m/WCXx
         mRHld4ZbCflpIFSmPgRD78MsCVhRUKZ6dauZuDUSscryIKoXJX77R+/QMo5QByH1fhHD
         aZxYOZceVhzyUC9QCjmPCE4eVtaTjKsriLS1jGtyaPTZp4p4uzP7lKiZzgyos4WF9JHf
         x1yA==
X-Gm-Message-State: APjAAAVFKWa5QmBLKAPFiLr21HbENBQ5of/A9UMCItdJ0JmoujvwmFgT
        2PVUYbhtdwGQQzgWm3t1vqw=
X-Google-Smtp-Source: APXvYqwbBHsaTX9SOOE4rBk5ZgiLoUDGCJYNmgRvGEn8zVqkCXmUoKxi1H7uV0i1uL/AGHbNvEQ9jw==
X-Received: by 2002:adf:dcd1:: with SMTP id x17mr8669435wrm.91.1556930770539;
        Fri, 03 May 2019 17:46:10 -0700 (PDT)
Received: from localhost.localdomain (ipb218f40a.dynamic.kabel-deutschland.de. [178.24.244.10])
        by smtp.gmail.com with ESMTPSA id b11sm5979161wmh.29.2019.05.03.17.46.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 03 May 2019 17:46:10 -0700 (PDT)
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
Subject: [PATCH 5/6] Revert "arm64: dts: renesas: r8a77990: Enable DMA for SCIF2"
Date:   Sat,  4 May 2019 02:42:57 +0200
Message-Id: <20190504004258.23574-6-erosca@de.adit-jv.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190504004258.23574-1-erosca@de.adit-jv.com>
References: <20190504004258.23574-1-erosca@de.adit-jv.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This reverts commit a99de47921565c233092b0d3c4652b3a10e715ec.

Both empirically and based on the existing documentation, it looks like
SCIF2 does not support DMA. Let's disable it. Full reasoning is given in
commit ("Revert "arm64: dts: renesas: r8a7796: Enable DMA for SCIF2"").

Fixes: a99de47921565c ("arm64: dts: renesas: r8a77990: Enable DMA for SCIF2")
Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index d2ad665fe2d9..4bf32bfaafc0 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -1018,9 +1018,7 @@
 				 <&cpg CPG_CORE R8A77990_CLK_S3D1C>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
-			dmas = <&dmac1 0x13>, <&dmac1 0x12>,
-			       <&dmac2 0x13>, <&dmac2 0x12>;
-			dma-names = "tx", "rx", "tx", "rx";
+
 			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
 			resets = <&cpg 310>;
 			status = "disabled";
-- 
2.21.0

