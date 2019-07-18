Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B13ED6CD9D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jul 2019 13:44:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390030AbfGRLoJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Jul 2019 07:44:09 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43592 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389994AbfGRLoJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Jul 2019 07:44:09 -0400
Received: by mail-pf1-f194.google.com with SMTP id i189so12507554pfg.10;
        Thu, 18 Jul 2019 04:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=DeKDZOFHUlI3nMz/EaT1o5xWxfybZf2zd27CHn8oOdg=;
        b=r+zSM5opOHjy7dH4d7v0u+BRJBKTy02dx42DCYFCSSgH5tsJvbfd/kPkhrAfVOLScA
         YfBoN6vWyD1zEBAobw/aSdJX6ulvvpLC1aBNxZn0uvt8eGc8Vb8OC90ekh4DX/iOYKIw
         +H/nrgue0rfam/MkX1gLpzub/79AepLYPWrr9oDTNFEKu07KQG5g45aRcB8nBfUvnYBQ
         iPE6PR9DkS7hQ3uqDJdTwzRsdNcGS6SUabUDUgHv91VCXIigIxnNeG+QMsBzs2ZcSMiM
         YeT2Zv9Ozqukq7Wxagdfgs3wXc6ixzvXjlgHG3E9wJQTnq1/nYjtDatSlHctEqau8o2C
         IjMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=DeKDZOFHUlI3nMz/EaT1o5xWxfybZf2zd27CHn8oOdg=;
        b=mJ9DAxRnw8AdqEZfvZjtX3GyYbyqDECxKYqutYHbuZZzlhZwZ8IYteohP5xSbxOzP/
         JtJ16Hz/EapcemsHoEaMT8BPoW+O+tvoQ/S3bj/5CUA2WsWZYIY8uddjz3QV7wthiRBm
         oJl/nponhVIAQnzUSgig1iaHjeupP28kf4Z5gbFT7a2MeIuQH4wigKz1vRIRVy/mNyKP
         NI9t8lJ9yfPKX+qA3YiutSevlDmDuGNwm3NiVCFdwQ69s4p3pB20PxRbJlWtHBqHLBed
         IgId0ZSxZKUXDaEltsIlQqtUwS3iSVXZ4KycokloZH9EQh8Ok7xKnkXSZkoMJTi2eaPT
         69fQ==
X-Gm-Message-State: APjAAAXGqwfA3inLr+OI5NgFd+E5hT0Zy1khsxxbLMNvWWTMsfd1GlKf
        k13TQMlugDH9JfzO6MyyxGDp1Zxl
X-Google-Smtp-Source: APXvYqyF+H2dhW1xjuLVeOTGT0sUgQRDWKxiKNoilbEq5kT1jdbnra2GxR7P7K2S2nrCzL4vBkFmUw==
X-Received: by 2002:a17:90a:db52:: with SMTP id u18mr51038726pjx.107.1563450248226;
        Thu, 18 Jul 2019 04:44:08 -0700 (PDT)
Received: from [127.0.0.1] (FL1-133-202-12-40.iwa.mesh.ad.jp. [133.202.12.40])
        by smtp.gmail.com with ESMTPSA id b136sm26298472pfb.73.2019.07.18.04.44.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jul 2019 04:44:07 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     mark.rutland@arm.com, devicetree@vger.kernel.org,
        geert+renesas@glider.be, daniel.lezcano@linaro.org,
        linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
        Magnus Damm <magnus.damm@gmail.com>, tglx@linutronix.de
Date:   Thu, 18 Jul 2019 20:45:38 +0900
Message-Id: <156345033835.5307.9206628986166423962.sendpatchset@octo>
In-Reply-To: <156345023791.5307.6113391102648394591.sendpatchset@octo>
References: <156345023791.5307.6113391102648394591.sendpatchset@octo>
Subject: [PATCH 7/7] clocksource/drivers/sh_cmt: Document "cmt-48" as deprecated
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Update the CMT driver to mark "renesas,cmt-48" as deprecated.

Instead of documenting a theoretical hardware device based on current software
support level, define DT bindings top-down based on available data sheet
information and make use of part numbers in the DT compat string.

In case of the only in-tree users r8a7740 and sh73a0 the compat strings
"renesas,r8a7740-cmt1" and "renesas,sh73a0-cmt1" may be used instead.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 drivers/clocksource/sh_cmt.c |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

--- 0011/drivers/clocksource/sh_cmt.c
+++ work/drivers/clocksource/sh_cmt.c	2019-07-18 19:31:01.917491800 +0900
@@ -921,7 +921,11 @@ static const struct platform_device_id s
 MODULE_DEVICE_TABLE(platform, sh_cmt_id_table);
 
 static const struct of_device_id sh_cmt_of_table[] __maybe_unused = {
-	{ .compatible = "renesas,cmt-48", .data = &sh_cmt_info[SH_CMT_48BIT] },
+	{
+		/* deprecated, preserved for backward compatibility */
+		.compatible = "renesas,cmt-48",
+		.data = &sh_cmt_info[SH_CMT_48BIT]
+	},
 	{
 		/* deprecated, preserved for backward compatibility */
 		.compatible = "renesas,cmt-48-gen2",
