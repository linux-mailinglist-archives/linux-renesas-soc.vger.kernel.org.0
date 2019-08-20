Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DE5E95EB0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2019 14:34:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729203AbfHTMeT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Aug 2019 08:34:19 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43462 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728366AbfHTMeT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Aug 2019 08:34:19 -0400
Received: by mail-pf1-f195.google.com with SMTP id v12so3306420pfn.10;
        Tue, 20 Aug 2019 05:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=n2dMRsdwfpn3m4PSgcPafEcsJ0ybsqqrm3x2kxCkFU4=;
        b=IQBdSDx5npIsXlkVKLmiajWWOdVIw0frQ2S/oR16GzVRggAWFsYEo7i1c1a/w8ZGIe
         3pl9WSI6CBmjwyyCFCJPEjsHam61G6NWkxGuLxPw7ozXZqMefmNRYED4ZniYIP8xITAH
         iv0hVbCvQi86Ti0KqgVuiiXt7srueAE1S7/WB5JIW3QjloeHFkA/Ics63cHDiwsVYo3j
         z0pODXNRhO5qV0oJjo7g7M9LKYtzyWCuNr/fRbuVXbHlM55JCCcRtz+z0HvyIzaGiX31
         KhC/O3F3xYcMAFwz6OiJvXjWWJb3s80t6H8LnG2v/kUO/bqi0evOkXoeW75bU+dCq2ri
         pd4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=n2dMRsdwfpn3m4PSgcPafEcsJ0ybsqqrm3x2kxCkFU4=;
        b=O0dAqO5LV94+Okbdd0k1D4BfSPbYpgLCmZLBNNnEdXFseQKrNxe7krcUYymWh5HXMr
         WGgP1q8YFqwg/sks9Y+DIXH/YCLmnw2foXKnk4cPtzvyUJQJi7ub5IqVe0hu2rmZkm7Q
         55oUh3Sy8X50CQAPfcirgvVNG9Vcb5jZyfVVBh8EckCgm08Sx+0itifYGNWbXqpWYBTJ
         ZIHFsS+5xYGBS8LREFiKR96Vig9IMXpS1DiVCC1mTw59e9Yl34Zgx66R7TGwFguVk7ew
         32xt/rs1f7WPg+7dIQIs0/Hl0nxon4bhFEZPqGk4HVqlpEth9e/zLPzWmxgYCyyz5p9O
         +Iuw==
X-Gm-Message-State: APjAAAUPVrs6+zy0NmqYa2uU2/ydjQWyx0UrxAKYUlZLHQ77q3dCy0he
        mIHn1P6UXFXX2D+JkE+lH2bxo33F
X-Google-Smtp-Source: APXvYqyFi0RRHyPjWyiWv37fPHVQxZrUQKPUBMvJCtdJhEQg8WDc9pQGhbvTGAbJwFG/Dm1F9/gTLg==
X-Received: by 2002:aa7:8dcc:: with SMTP id j12mr29947006pfr.137.1566304458143;
        Tue, 20 Aug 2019 05:34:18 -0700 (PDT)
Received: from [127.0.0.1] (l193216.ppp.asahi-net.or.jp. [218.219.193.216])
        by smtp.gmail.com with ESMTPSA id o3sm5104992pje.1.2019.08.20.05.34.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Aug 2019 05:34:17 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     mark.rutland@arm.com, devicetree@vger.kernel.org,
        geert+renesas@glider.be, daniel.lezcano@linaro.org,
        linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
        horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>,
        tglx@linutronix.de
Date:   Tue, 20 Aug 2019 21:35:56 +0900
Message-Id: <156630455678.17444.15308898250025256159.sendpatchset@octo>
In-Reply-To: <156630449239.17444.11157306180861080402.sendpatchset@octo>
References: <156630449239.17444.11157306180861080402.sendpatchset@octo>
Subject: [PATCH v2 6/7] clocksource/drivers/sh_cmt: r8a7740 and sh73a0 SoC-specific match
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Add SoC-specific matching for CMT1 on r8a7740 and sh73a0.

This allows us to move away from the old DT bindings such as
 - "renesas,cmt-48-sh73a0"
 - "renesas,cmt-48-r8a7740"
 - "renesas,cmt-48"
in favour for the now commonly used format "renesas,<soc>-<device>"

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---

 drivers/clocksource/sh_cmt.c |    8 ++++++++
 1 file changed, 8 insertions(+)

--- 0001/drivers/clocksource/sh_cmt.c
+++ work/drivers/clocksource/sh_cmt.c	2019-07-18 19:29:06.005414716 +0900
@@ -928,6 +928,14 @@ static const struct of_device_id sh_cmt_
 		.data = &sh_cmt_info[SH_CMT0_RCAR_GEN2]
 	},
 	{
+		.compatible = "renesas,r8a7740-cmt1",
+		.data = &sh_cmt_info[SH_CMT_48BIT]
+	},
+	{
+		.compatible = "renesas,sh73a0-cmt1",
+		.data = &sh_cmt_info[SH_CMT_48BIT]
+	},
+	{
 		.compatible = "renesas,rcar-gen2-cmt0",
 		.data = &sh_cmt_info[SH_CMT0_RCAR_GEN2]
 	},
