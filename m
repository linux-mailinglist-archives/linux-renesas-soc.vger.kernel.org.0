Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0093F37F70E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 May 2021 13:46:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232005AbhEMLrt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 May 2021 07:47:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232079AbhEMLrr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 May 2021 07:47:47 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58F32C06174A;
        Thu, 13 May 2021 04:46:38 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id h6so22753165ila.7;
        Thu, 13 May 2021 04:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YWflmdmJROYCQ/WWF6G14ySD96EARIxVpZed3YC02QM=;
        b=GTynuP3ATFH2UNurhyElbfUGJz6ocQH8ANB2j8yMKo/o3JwBjaDePB8CV17RHpbL4F
         gCn/64Q99jZWD8tBt00pck/Kz2j+7DfgDCZe07jAHswUPasG2f3EdR3SxFL10JPQvzS4
         dNrSvXf3uXBwZsgU2t60+TnbJninUH80TvlmgnWO0SvSTEfVu/4TnC4dcKnpVPqouoFz
         KMyfWdYn0BG8I6WYTvinFqwmPpR9+k7G0vYuXxh84FsBW1oCkoBIbMqlGpJUp/dxzVDh
         JKbqGK7C1NPjhmTNrgLeUwgXHhFeIlAEG3+P/YR0+/GFRtIa2mi/n9u+s+P3Fpk8uM6F
         6wtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=YWflmdmJROYCQ/WWF6G14ySD96EARIxVpZed3YC02QM=;
        b=jNYD3c4hodAC7syzbssodnWc346ZjKewBz/u8NbOUr9mBjMR6taTbbCSPXCF1tqzRG
         9NVhkuqa/pW1Xw74wdOzLF3KWWBfQfc/UPV0GErvqe374PqsRaNbxeUOZo2Dy5wc7pni
         fFOokw9Z+h2E1vPgEX2TuHAVZxtgKDjJKcj3Av2WMCmO/Yi+pR9tdCEZAqAd3pyjNnLS
         1FBxkxNWNc9GamJG9/nZIChliNRRd3bGXRY68h6SzR0PsFzwxc9YCkmJfsnCxLffo12D
         MjPVeu0wS8XZyR+Oi4jQQtyuwOHLnawv5OnI2lxzR95cZd7O86kwir3FqodBgDNSuglA
         MALA==
X-Gm-Message-State: AOAM5322tLxLFf8DwxN9xNgEaGsnzQl7idenvluEiKo1jPjWPaIP5XRy
        g1S3fhaz2Uol5rh8/trnHl3ParTD7COCkQ==
X-Google-Smtp-Source: ABdhPJwNMPENaPPMMzaTIrTBV5CMY//WPW2NZLDEFjSOzRIxzVF0pNdioqH9niLxDAdMwDrO0OCpyw==
X-Received: by 2002:a92:6b02:: with SMTP id g2mr17449240ilc.23.1620906397710;
        Thu, 13 May 2021 04:46:37 -0700 (PDT)
Received: from aford-OptiPlex-7050.logicpd.com ([174.46.170.158])
        by smtp.gmail.com with ESMTPSA id x13sm1298192ilv.88.2021.05.13.04.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 04:46:37 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: renesas: beacon: Fix USB ref clock references
Date:   Thu, 13 May 2021 06:46:16 -0500
Message-Id: <20210513114617.30191-2-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210513114617.30191-1-aford173@gmail.com>
References: <20210513114617.30191-1-aford173@gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The RZ/G2 boards expect there to be a external clock reference for
USB2 EHCI controllers.  For the Beacon boards, this reference clock
is controlled by a programmable verasaclock.  Because the RZ/G2
family have a special clock driver when using an external clock,
the third clock reference in the EHCI node needs to point to this
special clock, called usb2_clksel.

Since the usb2_clksel does not keep the usb_extal clock enabled,
the 4th clock entry for the EHCI nodes needs to reference it to
keep the clock running and make USB functional.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
index d8046fedf9c1..e3c8b2fe143e 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
@@ -271,12 +271,12 @@
 &ehci0 {
 	dr_mode = "otg";
 	status = "okay";
-	clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
+	clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>, <&usb2_clksel>, <&versaclock5 3>;
 };
 
 &ehci1 {
 	status = "okay";
-	clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
+	clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>, <&usb2_clksel>, <&versaclock5 3>;
 };
 
 &hdmi0 {
-- 
2.17.1

