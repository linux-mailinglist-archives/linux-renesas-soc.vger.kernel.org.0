Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91EC62D8F70
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 13 Dec 2020 19:44:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403823AbgLMSoE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 13 Dec 2020 13:44:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388379AbgLMSjl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 Dec 2020 13:39:41 -0500
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E99D0C061257;
        Sun, 13 Dec 2020 10:38:38 -0800 (PST)
Received: by mail-io1-xd43.google.com with SMTP id i9so14777338ioo.2;
        Sun, 13 Dec 2020 10:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tu42vVD5H5wJbLGf/v+cEoWU/HtuQydQvHqelvZXFl0=;
        b=HNNW7zkzPgwt73Q3y+vPUovdvU1GGH9aZwSGtrz3p4V2juPiHTaQUqeE3rznRi2JKU
         eUdSiLcEQebecny32wTGQGKOXhbHQFw7RTzqv1YASLmz3jEXIAelALZfPvVoRG68eBzY
         Na6WOgxGvl6G4H28hBWt++z0MHFlNsn1xK1LBGf41TStYCb/bVr1vwrnNaKMQ2+bSwhp
         n9fdhRYau00P03+jLRdh0TLkA8sNjRLxh7sxrx8KO8cMdGoQt+i1NYg9VxghM8d2Vgy4
         zdy/jzxdPCnWTh7sQJroY86QT2pvK4UZu6ONqhRtXHO8eHmkNCFj5oZzycQJrCPR2E37
         9B3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tu42vVD5H5wJbLGf/v+cEoWU/HtuQydQvHqelvZXFl0=;
        b=nUVTYxb82xFUkSNMrNseuN3fVX/VOCL8dHpdExthaJIlGvviaLq1TjgZfl0q1xMNb/
         moGo9UxU7FRb+Ts7txdY+tqM9IK3DYu8yqq0MMH3YtfeHZR1ednhhIHksTOGQ8nnSey5
         ihtkTTbLNJhkz+z3Fezqe8u2WMxx74ijmST2RCPtWtS5ogNwY63p9wxq9tjyq5xNxfOh
         tS8qydmQqn9jnLnhUMpEZlTa/PRV2bubCbso1D7acYk3EvfbS317xBBh6w5/Pc2uydyn
         LJxk2Jw0cGglehAIZ1h0j1fNOU1buEoHHWRa24KDgt7UZ+fhz5z+5+KWPk1sEAsnSWuC
         rIwQ==
X-Gm-Message-State: AOAM530B4Hs024hVGP2Ds8eSmrs90KM6rk0JsgVxit5O53dS2pNCU/rz
        J3b1xekmBqG/HP7B+vizLeiSuydIG4WAmg==
X-Google-Smtp-Source: ABdhPJxL0kKsTibrxUxVBaW/LQux6q+2TYXMKtMu3WTi1qGbKnGuePcjAPYkjaNn73ehPTH36n+2ug==
X-Received: by 2002:a02:b02:: with SMTP id 2mr28342075jad.15.1607884717904;
        Sun, 13 Dec 2020 10:38:37 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:f45d:df49:9a4c:4914])
        by smtp.gmail.com with ESMTPSA id o11sm7804532ioa.37.2020.12.13.10.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Dec 2020 10:38:37 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 13/18] arm64: dts: renesas: beacon: Enable SPI
Date:   Sun, 13 Dec 2020 12:37:53 -0600
Message-Id: <20201213183759.223246-14-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201213183759.223246-1-aford173@gmail.com>
References: <20201213183759.223246-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The baseboard routes the SPI to a header which can/will be configured at
either the kit level or using device tree overlays.  Because the baseboard
be supporting more than one kit, enable at the baseboard level rather
than a bunch of duplicates later.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 .../boot/dts/renesas/beacon-renesom-baseboard.dtsi   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
index db3ef33faac5..200236b6e0ef 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
@@ -512,6 +512,13 @@ lvds0_out: endpoint {
 	};
 };
 
+&msiof1 {
+	pinctrl-0 = <&msiof1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+	cs-gpios = <&gpio3 10 GPIO_ACTIVE_LOW>;
+};
+
 &ohci0 {
 	dr_mode = "otg";
 	status = "okay";
@@ -565,6 +572,11 @@ led_pins: leds {
 		bias-pull-down;
 	};
 
+	msiof1_pins: msiof1 {
+		groups = "msiof1_clk_g", "msiof1_rxd_g", "msiof1_txd_g";
+		function = "msiof1";
+	};
+
 	pwm0_pins: pwm0 {
 		groups = "pwm0";
 		function = "pwm0";
-- 
2.25.1

