Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 222032D8F4A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 13 Dec 2020 19:39:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728355AbgLMSjG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 13 Dec 2020 13:39:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730855AbgLMSjB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 Dec 2020 13:39:01 -0500
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CD37C061794;
        Sun, 13 Dec 2020 10:38:21 -0800 (PST)
Received: by mail-io1-xd44.google.com with SMTP id i9so14776818ioo.2;
        Sun, 13 Dec 2020 10:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R39Rwz4DdlZNbxK0NlR+QqP+ugFFGtu+dGWo7hlUUtM=;
        b=B/ncj1YbKpSLNRe4bjzanj92gLsIyL9UHz5JeSE7i/3AVH7OE1cCZZ7PZaKJ7tvUHe
         PXlEjilKjx1PcVtdIcgS83cGZm/3rnMrqc9NWLxZEV2GgY1KWdyYKclJobEgncNQDvbe
         RXRrrVcwL3detrRCG9OiFZOi/ykKyzxGKbuWLlFe2Gktc8cHhs8RhRZU49ncbW7+ptbq
         /4u/eXWj6yjnEZn6JpoGfAkMlxh9+9IMvb9xv2otW9b7qX2w0V4bGGc9GZOp45SaKKd8
         E3/tqxXQFyxUzlDwWQ1AiHIoBYBPsEv4jqBAHz9SgSUyEC6AGSeleD+vBKRbWQ2M+YLy
         k04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R39Rwz4DdlZNbxK0NlR+QqP+ugFFGtu+dGWo7hlUUtM=;
        b=UaZEvjau6Cq4mfxwEeNBCMU2X5kWq/OgL3C3jJNx4gbvDSDB2UUj3LKUNm71KCp2MB
         tpyzmLZIyusWKMWaamp08kYQsGADiWJi0f3PIUcH3pDynLHmEMkJ+8VkijxnQ59rUe9+
         CuZrElsa1pKz2AK62tyWr6b+vr4lmvaTowfWK5P60asmdbD7ziPa1hvj9N+hOUP7XKO7
         2AdvIq8MBpMLfr3acU5I4uKIHAx7a16XpupwO9zsZBqHeOX2ZPm8ZV93mRqIMGKKW/5B
         gKutoD2hxxgFs9N7x1rwMEWB2ATGPHJ7VjNXVhotzAFkkPpZVEO857gkgesprNov/ne6
         FtjA==
X-Gm-Message-State: AOAM5312VbHVf9H5bx4bBb/EcH1ZyAtNQy6fIE+K6vm4H/NDnBIuvWGG
        SHuX3I0i6Q8maN+CBP5pZthi1CfFYzUiKQ==
X-Google-Smtp-Source: ABdhPJzyegeJcyjn3ooQOokSHbBZ1dfTN30TM29clG8CYpCeTLYbcHf+6dIg8TtxT/d6I0tXItRguA==
X-Received: by 2002:a5e:dd0d:: with SMTP id t13mr216306iop.132.1607884700132;
        Sun, 13 Dec 2020 10:38:20 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:f45d:df49:9a4c:4914])
        by smtp.gmail.com with ESMTPSA id o11sm7804532ioa.37.2020.12.13.10.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Dec 2020 10:38:19 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 04/18] arm64: dts: renesas: beacon kit: Fix Audio Clock sources
Date:   Sun, 13 Dec 2020 12:37:44 -0600
Message-Id: <20201213183759.223246-5-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201213183759.223246-1-aford173@gmail.com>
References: <20201213183759.223246-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The SoC was expecting two clock sources with different frequencies.
One to support 44.1KHz and one to support 48KHz.  With the newly added
ability to configure the programmably clock, configure both clocks.

Beacause the SoC is expecting a fixed clock/oscillator, it doesn't
attempt to get and enable the clock for audio_clk_a. The choice to
use a fixed-factor-clock was due to the fact that it will automatically
enable the programmable clock frequency without change any code.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 .../boot/dts/renesas/beacon-renesom-baseboard.dtsi    | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
index 3c84e060c69f..5c09e64001cc 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
@@ -250,9 +250,12 @@ ss_ep: endpoint {
 };
 
 &audio_clk_a {
-	clock-frequency = <24576000>;
-	assigned-clocks = <&versaclock6_bb 4>;
-	assigned-clock-rates = <24576000>;
+	/delete-property/ clock-frequency;
+	#clock-cells = <0>;
+	compatible = "fixed-factor-clock";
+	clock-mult = <1>;
+	clock-div = <1>;
+	clocks = <&versaclock6_bb 4>;
 };
 
 &audio_clk_b {
@@ -591,7 +594,7 @@ sound_pins: sound {
 	};
 
 	sound_clk_pins: sound_clk {
-		groups = "audio_clk_a_a";
+		groups = "audio_clk_a_a", "audio_clk_b_a";
 		function = "audio_clk";
 	};
 
-- 
2.25.1

