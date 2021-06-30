Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAB9A3B8817
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jun 2021 19:59:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232409AbhF3SCM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Jun 2021 14:02:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbhF3SCM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Jun 2021 14:02:12 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78A06C061756
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Jun 2021 10:59:42 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id g3so2251857iok.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Jun 2021 10:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B2W+rdZ95QsTDAS96oMr23pSeTULwSn38jwx9emmGEw=;
        b=KHBZX2VgP6/tQKoSlPc8Px5XBfShXdkYuqPlw3HQjiJkZHbi8CXglVfRk++JHE4c4M
         /bsRi7aDBh1mcpYWseDYuGoIiTVqa6KL6qauu0c+Dl8yGeJqGr0VXLR+27qM+LR2bnfz
         nhNaRbtWYcQIlGrxu2RyJPfx7jEfuIQnjNkyP/0gQDMCkFWAB+uYwGuyqXlYe5xcfQRw
         S08tYEiDnXcgJRzJ2XFkZpOXYC/LgFILCClDG+x86SkwDll9iOUgWyCsCDnfJ4D5CRlo
         kwe6mFGN2/q1zdEsFtxjq4Ji8yHoVjz8kClskkqZzh/Gg7sp7zUjbecRHi7WGyl2VKGT
         ePMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B2W+rdZ95QsTDAS96oMr23pSeTULwSn38jwx9emmGEw=;
        b=rG93eOs9kTUiyHbnUGQc5g4+hTONpdHLDqphlx+SDHTLq8CA8Un0UPodc7V5J5mB6Y
         HQwbXsdiuMssvX31z8aw6kDWOU5O5eJMDU0R3QVl1+eAGQSN4KlmNuRlFp5DE/lF2b0D
         DxLp2o6CILsMzueJCJsxNCqYUW5X5TKZpuMRGZ1v8EeevXdIVUoIuK0En3HnRs41h3s2
         s/yP7KqDw6j9k6XC+/tT2kySAx6bXY6p6rgpwd2GXN8QqveAGbYOf60L9GmCuxlPMx53
         8b1nk1DVayhvXhwtRE7ZMeAky6NLivIpOA3pS1GX0t+DE3WXP8JnvBEDhuwQh9Tl+osw
         Y/Ig==
X-Gm-Message-State: AOAM532Ssjyk770uokd4n0ux3P5MF6bjAyq/sYQF9UThCCqLdRsvd+FY
        h5Qaqpjvy8iFSuy70vPISRf41s4kUvSprw==
X-Google-Smtp-Source: ABdhPJwgBbD+Uoe32hrMiAR8GmZ4pgCm0NjQXoAgDJsJZgLCqBRXbXN3Tff3zlq1CugaVJPuFfz11Q==
X-Received: by 2002:a05:6638:bc6:: with SMTP id g6mr9716834jad.76.1625075981184;
        Wed, 30 Jun 2021 10:59:41 -0700 (PDT)
Received: from aford-IdeaCentre-A730.lan (c-73-37-219-234.hsd1.mn.comcast.net. [73.37.219.234])
        by smtp.gmail.com with ESMTPSA id h19sm10394267iow.1.2021.06.30.10.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 10:59:40 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     geert+renesas@glider.be, aford@beaconembedded.com,
        Adam Ford <aford173@gmail.com>
Subject: [PATCH] arm64: dts: renesas: beacon: Enable micbias
Date:   Wed, 30 Jun 2021 12:59:35 -0500
Message-Id: <20210630175935.189454-1-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The IN3R is connected to an analog microphone, and it needs the
micbias enabled in order to power the analog microphone.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
index 4d135bcc2f18..e9a80c26b1bf 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
@@ -197,6 +197,14 @@ sound_card {
 		compatible = "audio-graph-card";
 		label = "rcar-sound";
 		dais = <&rsnd_port0>, <&rsnd_port1>;
+		widgets = "Microphone", "Mic Jack",
+			  "Line", "Line In Jack",
+			  "Headphone", "Headphone Jack";
+		mic-det-gpio = <&gpio0 2 GPIO_ACTIVE_LOW>;
+		routing = "Headphone Jack", "HPOUTL",
+			 "Headphone Jack", "HPOUTR",
+			 "IN3R", "MICBIAS",
+			 "Mic Jack", "IN3R";
 	};
 
 	vccq_sdhi0: regulator-vccq-sdhi0 {
-- 
2.25.1

