Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 875B33F8A0A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Aug 2021 16:25:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242787AbhHZOZt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Aug 2021 10:25:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242840AbhHZOZt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Aug 2021 10:25:49 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3B98C061757
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Aug 2021 07:25:01 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id e186so3925026iof.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Aug 2021 07:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tKe1o3gYhY/D2BAcYMJPxMKCoPzi44h6lHisP1ipvck=;
        b=JlqjTm6pXGivxN+uu//uXTQjVAvJ4vo5bje/DtL8T7Hbw+x4emoBgaqb+fvxdg3jHf
         TJJ8M8qdUupOa43UyyDCZo4Gi4hbayBOrwpmOFupc3LThBBNu0mNjy29N07F9La/99EF
         fcXSdgUKNRy6EOoPYBhedpg/1ARmVvCgIYe3Og3fMRpiqm3TkdrDV3DsCKmx6cLUnqa2
         dPUQ/levTdnUGsRZIkx957asFaOSRDOlBYyUEBbNQ1eyK0llJ5vIBVagY8HjoLFLZwGD
         EtwTORQIxC+ON06sGC4d2bfh4IxW11RjlhlNmTCOu0IV+Go9ILAuXkURgOex/5v9LCjN
         YZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tKe1o3gYhY/D2BAcYMJPxMKCoPzi44h6lHisP1ipvck=;
        b=fx2wd+bYcHPb4ivHT36BUwsQLFzriFQQTxHWwI0dWIjBXCK6SG4FVWYpN+XHUR+Wzl
         m4iCwNQjSEM0MP1KD7XDxr2OgBVU8ZjQy+UaRHPlEcfFqVvM7PVAnQXxFQgHLeb9dX3t
         yiBo5Jaf/gVOiIvx6ZfyZOdO/rL/2eQaWyLtPgKMUnb1T9ZhYYfzCIqUd6yvho9eLaeF
         4uMNTU5FSyMGzifk4/QqRwCjeZD/RBAvil/Mc/8ST93TB/0m3ECdkS9P41SrJ3PY0Wy9
         Xh6xhnSySHbC2Wf3+y1aCpo0pJSUg7sRWpa23l+1y8AoBXkpYD7olFLJFGnGJoQGAs9/
         0BwQ==
X-Gm-Message-State: AOAM53190sP6Dfa1Ad39+wAe6HWZcijssyFK/1nYJoC5/hv88ZV1/B8v
        ON1UWhZQU13QrObkvRutjGZxbK4anfMbTQ==
X-Google-Smtp-Source: ABdhPJw/dvi+xcnmE7WT/IiQ1su7kuIh2yxymg9DjaL+pDgBU114UG0QngvM/X1Sq6poPEFSgumZxQ==
X-Received: by 2002:a02:708f:: with SMTP id f137mr3697041jac.68.1629987900967;
        Thu, 26 Aug 2021 07:25:00 -0700 (PDT)
Received: from aford-IdeaCentre-A730.lan (c-73-37-219-234.hsd1.mn.comcast.net. [73.37.219.234])
        by smtp.gmail.com with ESMTPSA id c16sm1822789ilh.50.2021.08.26.07.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 07:25:00 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     geert+renesas@glider.be, magnus.damm@gmail.com,
        Adam Ford <aford173@gmail.com>
Subject: [PATCH] arm64: dts: renesas: beacon: Fix usb2_clksel
Date:   Thu, 26 Aug 2021 09:24:51 -0500
Message-Id: <20210826142451.495578-1-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The clock driver only sets the bit when extal is available and
xtal is not.  Remove the xtal references to properly set the
clock selection bit.

Fixes: 56bc54496f5d ("arm64: dts: renesas: beacon: Fix USB extal reference")
Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
index 090dc9c4f57b..9908ad90d398 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
@@ -323,7 +323,9 @@ &sdhi3 {
 
 &usb2_clksel {
 	clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>,
-		  <&versaclock5 3>, <&usb3s0_clk>;
+		  <&versaclock5 3>;
+	clock-names = "ehci_ohci", "hs-usb-if",
+		      "usb_extal";
 	status = "okay";
 };
 
-- 
2.25.1

