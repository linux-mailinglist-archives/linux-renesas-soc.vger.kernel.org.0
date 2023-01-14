Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B3F166AE5C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Jan 2023 23:57:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbjANW46 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 14 Jan 2023 17:56:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230281AbjANW4y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 14 Jan 2023 17:56:54 -0500
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58CB07689
        for <linux-renesas-soc@vger.kernel.org>; Sat, 14 Jan 2023 14:56:53 -0800 (PST)
Received: by mail-io1-xd2e.google.com with SMTP id z194so241501iof.10
        for <linux-renesas-soc@vger.kernel.org>; Sat, 14 Jan 2023 14:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2zPy6hJ4YvPWHcOdVuznT1E5h241ZpRz7QxmBndMiU=;
        b=eZXqzknbH06vFSX8a+Rh+HND5XinsHAnptV3oVErx1dhWd5sXEE1/1AqN3Inq/uGRL
         k13ctW4pa97idwjHvAc8q9rwk8ZsgELnEK8972g0nXxK1ZiOXZMo9fZVhu0gKysN6RTD
         nyi8Y0XJ9GPwpXoC83fipGhZipL81Rno3IQ631djtaw6tTh5eUc0SW/D45FE6eYmtdq2
         KhJcTwtX0X35t/Y3u4TOSKcOeInn6j42FAhfdRFzpLG0xGp79tTtV5L+ppFXaFLxzIGE
         wl+AesxxIUZ5QJDoFnK1Y1Hq5XNitd4Wrbo+lxrf3o75XzfvCEa+1ToXEcssksjIOmlH
         5C1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d2zPy6hJ4YvPWHcOdVuznT1E5h241ZpRz7QxmBndMiU=;
        b=v4tir/MLohyZCIb5bO5XXy0HP5bOO42zKBu8AbfqNMCjbyzIyVYNZYi2Gk2ZO1ch3A
         aanVfo8oarKNOXCxQzqURFA46X3YLD7HFqFUzZmCpaMdgqen8nmdeHqBHfVQP0HrEJMf
         qxf/wwl9RRTQB2EyIlLE9UQepl/sClJaUF7jSf61aaY6xIfjm3oRxnpHZlrmugrv9r19
         mB2BYGx4YskQf4r5beDyp5qETEZxECvZ0RBfzb+0CvVJws+7n2n9iCzvwMGZv2qv2/KU
         ffiU8PoMtdKNrOheerK/P+vygQ2erQnYVT6d03j2986QMA2NxFV9uQQTheigAZCJNsSi
         SikA==
X-Gm-Message-State: AFqh2koBq0PHKzsOF+N2a5c1igPyfXLxtzOjIxEDhdRB6peF/7FbA7EI
        1KVPUlxw3g7tJDb+UOG1OQeV3ifacRk=
X-Google-Smtp-Source: AMrXdXt5+KrUOBS0uckAvBasFIadbAPvN3ygw6C+yghfSVSxFS+bwbUSC81ga2hR3HfQc8lUUaP1Uw==
X-Received: by 2002:a6b:8e83:0:b0:6de:9711:9962 with SMTP id q125-20020a6b8e83000000b006de97119962mr10262779iod.5.1673737012408;
        Sat, 14 Jan 2023 14:56:52 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan (c-75-72-166-104.hsd1.mn.comcast.net. [75.72.166.104])
        by smtp.gmail.com with ESMTPSA id c8-20020a6bfd08000000b006bbfb3856d6sm8374519ioi.5.2023.01.14.14.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jan 2023 14:56:51 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     geert+renesas@glider.be, aford@beaconembedded.com,
        Adam Ford <aford173@gmail.com>
Subject: [PATCH 3/3] arm64: dts: beacon-renesom: Fix some audio messages
Date:   Sat, 14 Jan 2023 16:56:47 -0600
Message-Id: <20230114225647.227972-3-aford173@gmail.com>
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

The WM8962 is configured so the SoC is driving the clock, and it's
currently set to 24 MHz.  However, when playing audio it shows the
following message:
    wm8962 5-001a: Unsupported sysclk ratio 500

While not harmful, a better clock ratio is 512.  It makes the
message disappear, and it still plays sound.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
index 518885cb1e7e..e0b9aee8e181 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
@@ -367,7 +367,7 @@ versaclock6_bb: clock-controller@6a {
 
 		assigned-clocks = <&versaclock6_bb 1>, <&versaclock6_bb 2>,
 				  <&versaclock6_bb 3>, <&versaclock6_bb 4>;
-		assigned-clock-rates = <24000000>, <24000000>, <24000000>,
+		assigned-clock-rates = <24000000>, <24000000>, <24576000>,
 				       <24576000>;
 
 		OUT1 {
-- 
2.34.1

