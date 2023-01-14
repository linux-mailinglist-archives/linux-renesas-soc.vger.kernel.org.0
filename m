Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C509566AE5A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Jan 2023 23:56:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbjANW4z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 14 Jan 2023 17:56:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230257AbjANW4x (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 14 Jan 2023 17:56:53 -0500
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ECB69ECF
        for <linux-renesas-soc@vger.kernel.org>; Sat, 14 Jan 2023 14:56:52 -0800 (PST)
Received: by mail-io1-xd29.google.com with SMTP id i70so2835496ioa.12
        for <linux-renesas-soc@vger.kernel.org>; Sat, 14 Jan 2023 14:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gh4/Cvauln6ubM4PdywsyUq3SXw7FEjozwVveTYHbQg=;
        b=CdyrpP2GCoxymehGInK7r+oagXZ79i3T9vRUrI0Tiq3xGOSqXlqhWb1Mi2L6Op3Pau
         Y4Z6hmpNLNSLUiDYmPhd4xTff5FvtJMwIknOQXqvEeN3nPOqO0Kc5e4iNT0euZE29XjB
         jtHXaWB2nJBmlPKzGPlu3AsXKeJ2c0W4khHQegm48EU4ikTHfEPIiL0uPaWYk6tOtreb
         SWHqy3yJdmBj3Skbfqft9nDK8mpEFiT+NPUQN/wcRqzga4RPLpJZukcD9BoeDH/0TGwM
         zhbX+IQtc1KscM3iJGsVeigQvOGjDGzPTsJ1TTb8Jg3tqnC7wsgmfsnRPv17p/qme3wc
         YAvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gh4/Cvauln6ubM4PdywsyUq3SXw7FEjozwVveTYHbQg=;
        b=rJ4LssCh/MsyC5pz7jCwWh+HkqUJU9TSGGTigmc2a2tqM7ZTr/e3InwA4EaOm6SFq+
         XPS8rgoYhIQvkg2c18pIpg+NO6yZjjanp648ZkSneY8ORwGs61zToA1Li9n62TpgGrKp
         S5d+7TnsOO4DGCbvS/NdLAlt94houfxOAE4G8BHSuZe2tt7PosVReoNAQ3PYgPZc/Lii
         zzQiI9NI+pRkpeSlYo1sr6Ps+yX/iAqqY3Kyop3FhdkTGWA0NKYMxySmPaQDSpwQTiPC
         i/wGR5mEQFJ69zrl+07Udb94EEhIjrSjMap4swBZREDJaYUq6aigltLOp/wmuUyThIro
         FFVA==
X-Gm-Message-State: AFqh2krWP8PJCo9B1DE8ap42MS791k1Akqg5ZIWMJn4XncAqsXWyyvAc
        w+d6gg0otf2//5TFZZE7OhKvLuHJgvk=
X-Google-Smtp-Source: AMrXdXsVVLhSlWusBw18G3Ch56lQinJSHI1HKWnx0O4Hy5voX9gLNIH6zRTPCJkSFGtWGYrIR1Kw6A==
X-Received: by 2002:a05:6602:2bc4:b0:704:939a:dc3f with SMTP id s4-20020a0566022bc400b00704939adc3fmr4235884iov.13.1673737011304;
        Sat, 14 Jan 2023 14:56:51 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan (c-75-72-166-104.hsd1.mn.comcast.net. [75.72.166.104])
        by smtp.gmail.com with ESMTPSA id c8-20020a6bfd08000000b006bbfb3856d6sm8374519ioi.5.2023.01.14.14.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jan 2023 14:56:50 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     geert+renesas@glider.be, aford@beaconembedded.com,
        Adam Ford <aford173@gmail.com>
Subject: [PATCH 2/3] arm64: dts: beacon-renesom: Update Ethernet PHY ID
Date:   Sat, 14 Jan 2023 16:56:46 -0600
Message-Id: <20230114225647.227972-2-aford173@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230114225647.227972-1-aford173@gmail.com>
References: <20230114225647.227972-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Due to the part shortage, the AR8031 PHY was replaced with a
Micrel KSZ9131.  Hard-coding the ID of the PHY makes this new
PHY non-operational on newer hardware.  Since previous hardware
had only shipped to a limited number of people, and they have
not gone to production, it should be safe to update the PHY ID.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
index d3fc8ffd5b4c..a302f0ea8a48 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
@@ -59,7 +59,7 @@ &avb {
 	status = "okay";
 
 	phy0: ethernet-phy@0 {
-		compatible = "ethernet-phy-id004d.d074",
+		compatible = "ethernet-phy-i0022.1640",
 			     "ethernet-phy-ieee802.3-c22";
 		reg = <0>;
 		interrupt-parent = <&gpio2>;
-- 
2.34.1

