Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E5B53B87BE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jun 2021 19:31:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232865AbhF3Rd3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Jun 2021 13:33:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232802AbhF3Rd1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Jun 2021 13:33:27 -0400
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18C10C0617A8;
        Wed, 30 Jun 2021 10:30:57 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id h3so3625754ilc.9;
        Wed, 30 Jun 2021 10:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3KbPgH3Xk8vzy7N0rAGS5ZuHlPaO+BHPUcyIIVc3h3I=;
        b=u8HkHov21WA1HExul/8zyGWEsbf1N/U5ZMyWGWWpgejRWaeGKJT+r3zuHbAbzOtMnM
         +lbI3Eym1qhs8PFQ21FppbrjBC/jqwdr0FxownqnwE8vvztzUJudox3sJFUPczhtmJnn
         iRl6xvPqRP4GARFP1jPMJ9hZoRBIyrKrjAcAIxOs3vQPAX47OxhW1mnCLp2Z94ufA4Da
         dbwriB8AeK6tBe8V6l1yl4L8RaZ0B17+2DHEP5XaUrPnR8jPwJm4YctnNpduPfepQV2H
         KA8qGmWkeWRkiuBE8VyRuyB+M6qtfZRakkGlwHJZevmG9+drbNW0HwMvJ1uC0aHPVb/2
         MkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3KbPgH3Xk8vzy7N0rAGS5ZuHlPaO+BHPUcyIIVc3h3I=;
        b=dhv2ecpqs+Sbytcvxtwi4KHr4V1JOcpISAGHXLrfpo9G4Xzx1WD1wp1fV+ys7Y/wIy
         7XGA/5cE1ZcNhZQ29PaCOxK64o56YXnafQBLyS0hjm99fvKnPmlkKP7pzn9vi+7iCbIE
         drSSQLYQDZUOVWbsaPkz0uhgF/0/LhfStcG9lIAUtKvgXxcOrUTF6oPdKGj4VdpRjlOd
         qusTmNMzm8xboN7wkx+jWzpzZYhWQBUox7XAE2fGPfQMnFUn5rFg0XJLyv+IBm9l3BPE
         WVz6r3bf29eqkT/Fe0Dxy4nHtX0Jjl8AKJCrBpruetWc0kxEu8gtm44TBezA0GOJrz24
         GV0g==
X-Gm-Message-State: AOAM533m/HAM/+wu3e74GYjx8jvDjT8a99BLJDpV2vMg/oijmBbPCM5g
        1Feqc9MXgfotOCNNSD/ToDOEyNBq/AxGemVU
X-Google-Smtp-Source: ABdhPJxkQ7etaWYt01MmObyEx/AcGL616JW9qRgYnObv+//ZvlM0vNWrHrAk86WLeywUHb7iZNF4BA==
X-Received: by 2002:a05:6e02:1d04:: with SMTP id i4mr13985844ila.149.1625074256038;
        Wed, 30 Jun 2021 10:30:56 -0700 (PDT)
Received: from aford-IdeaCentre-A730.lan (c-73-37-219-234.hsd1.mn.comcast.net. [73.37.219.234])
        by smtp.gmail.com with ESMTPSA id q19sm12207278ilc.70.2021.06.30.10.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 10:30:55 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: renesas: beacon: Fix HSUSB ref clock references
Date:   Wed, 30 Jun 2021 12:30:42 -0500
Message-Id: <20210630173042.186394-3-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630173042.186394-1-aford173@gmail.com>
References: <20210630173042.186394-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The RZ/G2 boards expect there to be an external clock reference for
USBHS controller.  For the Beacon boards, this reference clock
is controlled by a programmable versaclock.  Because the RZ/G2
family has a special clock driver when using an external clock,
the third clock reference in the USBHS node needs to point to this
special clock, called usb2_clksel, and the 4th clock is the versaclock.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
index e3c8b2fe143e..bcbf7eb5195b 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
@@ -313,6 +313,7 @@ &hscif1 {
 };
 
 &hsusb {
+	clocks = <&cpg CPG_MOD 704>, <&cpg CPG_MOD 703>, <&usb2_clksel>, <&versaclock6_som 3>;
 	dr_mode = "otg";
 	status = "okay";
 };
-- 
2.25.1

