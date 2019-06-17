Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2047E47EF6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 11:59:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728025AbfFQJ7H (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 05:59:07 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34111 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727693AbfFQJ7H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 05:59:07 -0400
Received: by mail-pf1-f195.google.com with SMTP id c85so5416672pfc.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2019 02:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=w9wxYyEXoG1MY0ay6SzpNCSRZGH/oQNtZGpYDDUuWiU=;
        b=nXbM+wHeXPDVryEGwFN0YmQUXAdfh/4fJzelnZbF7VqaTyLopvEiGIHNKqSDc80WVA
         ZSFuczfS+ccjtQzB4qrc+m2d/kjnpg5oPlGM3Lrh2Bn7dlyAQiz/nk+KRiqr/vNDO0+y
         Ugq52c7WyewfTmjOqST9SeXFunHW73Vgm2yHR8iW33p0Olj/F9lgLdPS8muj0EOThtNt
         rHswucajP7P53Ba97KR4wg0HCL8HLhzerzLdrirm93baHT9wE61gjSUNNFNzPzIt0ALE
         BqAQuJ86Dy4bZf+7mLfYslS3D0vDTZjzd6V6/tizUjLqfCJ7HbazfnFwrjvgZNqT5bV5
         ExqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=w9wxYyEXoG1MY0ay6SzpNCSRZGH/oQNtZGpYDDUuWiU=;
        b=Tm/vETKUkrYXseCJujK4AlYUoHwOuhOWmcO99pQP0W4iTO6kdT4uW9MUtcBDhupgGz
         Ldl+hqmEQ66qZ7T5SfDbEn9EkO/XEOyrr1akU8QajNdyhCAm+w5OkGyv4LQbT/d5Jno2
         /zzkAz5gV15iS7u1FwYLaTdIJeDp8hXH7/2K9jxkipV71QUbOvDQeTViJc4Kzm+9UTRB
         ZjrusncUWdbvTCj02ogWB+Gj/Qi1I9WitG3iv2wSY32a1rrGq68vULtBkbhV+Lqfxeye
         5QwXDzWhzn0r67fgzjlyTAtv/PxIes8xZTzdywvPzB5V3oy6jEn8ugfaj9SdusYGGJ2n
         LlGA==
X-Gm-Message-State: APjAAAU6ZkZl5QP5OhYghBi1sS4wJkPXhet6aRQQqySG21sqXGhbRq//
        kvm3KbKyXUMUGHwXVKMgi+pvVaan
X-Google-Smtp-Source: APXvYqwnchOPJ1xv+42YK6etfKTNoySeXKP5ZXk97CmqEMBOcfPaA69FuwBz8xaYB0NJ6iTrWSUb0Q==
X-Received: by 2002:a17:90a:f498:: with SMTP id bx24mr25786162pjb.91.1560765546785;
        Mon, 17 Jun 2019 02:59:06 -0700 (PDT)
Received: from [127.0.0.1] (l193216.ppp.asahi-net.or.jp. [218.219.193.216])
        by smtp.gmail.com with ESMTPSA id a21sm11086007pfc.108.2019.06.17.02.59.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 02:59:05 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Mon, 17 Jun 2019 19:00:32 +0900
Message-Id: <156076563276.6960.9613487456512544267.sendpatchset@octo>
In-Reply-To: <156076560641.6960.5508309411424406087.sendpatchset@octo>
References: <156076560641.6960.5508309411424406087.sendpatchset@octo>
Subject: [PATCH 3/3] clocksource/drivers/sh_cmt: Document "cmt-48" as deprecated
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

The updated SoC-specific DT bindings are documented in:
[PATCH 2/8] dt-bindings: timer: renesas, cmt: Update CMT1 on sh73a0 and r8a7740

 drivers/clocksource/sh_cmt.c |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

--- 0029/drivers/clocksource/sh_cmt.c
+++ work/drivers/clocksource/sh_cmt.c	2019-06-17 14:47:46.179233988 +0900
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
 		.compatible = "renesas,r8a7740-cmt1",
 		.data = &sh_cmt_info[SH_CMT_48BIT]
