Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FB2747EF2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 11:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727774AbfFQJ6u (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 05:58:50 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38938 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727518AbfFQJ6t (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 05:58:49 -0400
Received: by mail-pf1-f194.google.com with SMTP id j2so5404361pfe.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2019 02:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=rBkEnkJ6ImtWF0KwahOamX5gecdJRBV0BRkWSWBrLjo=;
        b=qHWW3XMqfoFXN1Pr2VhWbLMofONQ0h89fUKtnAsJYz7t5PdCtfHNGwSL2qxC2ZrYXb
         BpymVhVyXlutRSwz7DwKUE8t2cfpkwqZrIpnL2U4oDPX43uHGe+sb3GvrWOyEgBnfxfz
         7DROA/dMDGmihJWd0dBeX7rcAQwJLBCfW+MGwM8Lt86xTg762SgOxoI7XrsxeMOmV7lz
         4SaCvfpnL+1hf8hHEvi/AJCXFIYE7jI3aRuue0lMgblhSvs28aVP7i8KhdIr7kOZ86mL
         kBNtrvHBNDHgNTwVtvidD8EBWmUEgECnbwROJXIplXCCMCcLuzbfpjR8I4NrxXiT8Jb0
         F29A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=rBkEnkJ6ImtWF0KwahOamX5gecdJRBV0BRkWSWBrLjo=;
        b=Ox4TmiZb3JPKabgdH/sl9Q3NppO+4qSvGkzxiHNZMyTfOZGRZzUHPBJI5Q5y77fwH1
         dSyi9vEnMQPPJL6n/j4ccD0AobGk4KOeHly+RGd9eFr1CBP/fzlbkJwc9t+pgJdwFO4x
         4bGlMLX6hfgmMcWB0apCWEe4rawGfKxEz4TJYVGJfdPfR7Oz7lLI+xDs5lCUVlPY65Oj
         idmS22WpehX/3Hmlhv094tJ4fMsxF9EC4DsB/Fvx1oc9HxPY0ClGBYmIfCiM2D364sDg
         SxuU7V093mQWFGzGEUbwIfakGg9+BCML1dhC8m8vKS8duOz9ikuJAhXD+4ilgFPklATy
         7/Zg==
X-Gm-Message-State: APjAAAUqK9qiRtJ6XrApZJ7UgK05vcESlNwq/03EHRI2G3xDuGjFJNJI
        F9a/Nt+BpkEuAso0f94pBimZjL5b
X-Google-Smtp-Source: APXvYqyhoPG82P8cQ78d9Z606NKQYJETTZ/SEbm6uSezOwvZhuRNbIYTKikYkLrFgluH+adYf8xxdg==
X-Received: by 2002:a17:90a:9289:: with SMTP id n9mr25578755pjo.35.1560765528869;
        Mon, 17 Jun 2019 02:58:48 -0700 (PDT)
Received: from [127.0.0.1] (l193216.ppp.asahi-net.or.jp. [218.219.193.216])
        by smtp.gmail.com with ESMTPSA id 188sm15206040pfe.30.2019.06.17.02.58.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 02:58:47 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Mon, 17 Jun 2019 19:00:15 +0900
Message-Id: <156076561505.6960.6769412761253363711.sendpatchset@octo>
In-Reply-To: <156076560641.6960.5508309411424406087.sendpatchset@octo>
References: <156076560641.6960.5508309411424406087.sendpatchset@octo>
Subject: [PATCH 1/3] clocksource/drivers/sh_cmt: SoC-specific match for CMT1 on r8a7740 and sh73a0
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
---

The updated SoC-specific DT bindings are documented in:
[PATCH 2/8] dt-bindings: timer: renesas, cmt: Update CMT1 on sh73a0 and r8a7740

 drivers/clocksource/sh_cmt.c |    8 ++++++++
 1 file changed, 8 insertions(+)

--- 0001/drivers/clocksource/sh_cmt.c
+++ work/drivers/clocksource/sh_cmt.c	2019-06-17 14:42:26.019448534 +0900
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
