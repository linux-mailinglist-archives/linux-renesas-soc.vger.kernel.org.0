Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC73BAC792
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Sep 2019 18:15:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436492AbfIGQPs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 7 Sep 2019 12:15:48 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36703 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388922AbfIGQPr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 7 Sep 2019 12:15:47 -0400
Received: by mail-wm1-f65.google.com with SMTP id p13so10213133wmh.1;
        Sat, 07 Sep 2019 09:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P5jJRRtYTE008nOkCo0ZKY8Vz2tSW7iUhmee1EWlxJY=;
        b=oogxiWB3cw2wooFVTa2Sf7qnSVV9UM3CMcJtSZqg59Q58F2LJK0uj8BB2Wt4oXQ9JT
         4gHw8Y6NOtu2gBghhX6hf8uCDXVvc9YEJ7sI0YCRq0FNrGl7XwtWZe54nSnhwxWfA+KB
         cxioFpm7AmfBsLJCIEWH1HtyEuGDZmNlCgVhavotk6xNsn7AWFb5D79sclVG7+vKhxs3
         FL7vEHgT+e6M8WfAoQe9xxMVT8waxteEprC4keQPquAW20QjEjlwI9zdb69nDpQx7YnN
         zuO7SJ4lVHstm7wOH0yuKLqsCGoBQGxWNtT/JfVfWb70ZegSudOjHMC6Ff+saA/pGQ4z
         6w1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P5jJRRtYTE008nOkCo0ZKY8Vz2tSW7iUhmee1EWlxJY=;
        b=Q2Y7JYuLviSZkZBNaEcar2WFPu8lxrYSjB3G+zEh0ynTe73viH2UaOJCmwQ6GE/2SI
         IHxGJSvYthkDZE9JnZ0oV2MWuWrzaJN7NqIo2yHaS4lSGAeoAYBFsF/HfUpONQrXRAHA
         Qu41Kxdk4o6IZohHsrF9eB2lhtJ2wb8HUA6jUB2D2i718iz5KCGD6GGuyREJPfQ8Gu1V
         bLEIqNqQIu00O8XsoEQZ6z3aILQcfryY9K+txvIggipbzNUD7x4HGqEr5FPZXx7ryqUF
         Zzlntd/n9YEHfELTG8COnrOeMCR4g4f2hZKFDZWJ7z6/H+igsLCT3g6YPC542R7lnOjT
         460A==
X-Gm-Message-State: APjAAAWPngt+J/C3MxV8PPgDyWmZ17rQU0ZpofbWxmIsAYXdHU/JXMoE
        myOvgxzpAj6+T6p2UuQVaOqBe3vE
X-Google-Smtp-Source: APXvYqy4uqK6Sh2wbfnOFIgfQPH3heNDaL+T6yvk/6pqhDcnWloav+98sNccTR95Rdf6xvGhVBqNGg==
X-Received: by 2002:a1c:1f4e:: with SMTP id f75mr11372265wmf.11.1567872944273;
        Sat, 07 Sep 2019 09:15:44 -0700 (PDT)
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz. [86.49.35.8])
        by smtp.gmail.com with ESMTPSA id y13sm18789388wrg.8.2019.09.07.09.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Sep 2019 09:15:43 -0700 (PDT)
From:   marek.vasut@gmail.com
To:     devicetree@vger.kernel.org
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH V2] of: Fix of_empty_ranges_quirk()
Date:   Sat,  7 Sep 2019 18:15:37 +0200
Message-Id: <20190907161537.27258-1-marek.vasut@gmail.com>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Marek Vasut <marek.vasut+renesas@gmail.com>

The of_empty_ranges_quirk() returns a mix of boolean and signed integer
types, which cannot work well. Replace that with boolean only and fix
usage logic in of_translate_one() -- the check should trigger when the
ranges are NULL and the quirk is applicable on the hardware.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org
To: devicetree@vger.kernel.org
---
V2: - Rename of_empty_ranges_quirk() to of_missing_ranges_is_ok()
    - Move comment into the of_missing_ranges_is_ok() function
    - Make of_missing_ranges_is_ok() a bit more readable by adding
      a variable marking the quirk_state as initialized.
    - Reinstate check for !of_missing_ranges_is_ok() in of_translate_one()
---
 drivers/of/address.c | 47 ++++++++++++++++++++++++--------------------
 1 file changed, 26 insertions(+), 21 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 978427a9d5e6..df82ef88823f 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -473,21 +473,42 @@ static struct of_bus *of_match_bus(struct device_node *np)
 	return NULL;
 }
 
-static int of_empty_ranges_quirk(struct device_node *np)
+static bool of_missing_ranges_is_ok(struct device_node *np)
 {
+	/*
+	 * Normally, an absence of a "ranges" property means we are
+	 * crossing a non-translatable boundary, and thus the addresses
+	 * below the current cannot be converted to CPU physical ones.
+	 * Unfortunately, while this is very clear in the spec, it's not
+	 * what Apple understood, and they do have things like /uni-n or
+	 * /ht nodes with no "ranges" property and a lot of perfectly
+	 * useable mapped devices below them. Thus we treat the absence of
+	 * "ranges" as equivalent to an empty "ranges" property which means
+	 * a 1:1 translation at that level. It's up to the caller not to try
+	 * to translate addresses that aren't supposed to be translated in
+	 * the first place. --BenH.
+	 *
+	 * As far as we know, this damage only exists on Apple machines, so
+	 * This code is only enabled on powerpc.
+	 */
+
 	if (IS_ENABLED(CONFIG_PPC)) {
 		/* To save cycles, we cache the result for global "Mac" setting */
-		static int quirk_state = -1;
+		static int quirk_state_initialized;
+		static bool quirk_state;
 
 		/* PA-SEMI sdc DT bug */
 		if (of_device_is_compatible(np, "1682m-sdc"))
 			return true;
 
 		/* Make quirk cached */
-		if (quirk_state < 0)
+		if (!quirk_state_initialized) {
+			quirk_state_initialized = 1;
 			quirk_state =
 				of_machine_is_compatible("Power Macintosh") ||
 				of_machine_is_compatible("MacRISC");
+		}
+
 		return quirk_state;
 	}
 	return false;
@@ -502,25 +523,9 @@ static int of_translate_one(struct device_node *parent, struct of_bus *bus,
 	int rone;
 	u64 offset = OF_BAD_ADDR;
 
-	/*
-	 * Normally, an absence of a "ranges" property means we are
-	 * crossing a non-translatable boundary, and thus the addresses
-	 * below the current cannot be converted to CPU physical ones.
-	 * Unfortunately, while this is very clear in the spec, it's not
-	 * what Apple understood, and they do have things like /uni-n or
-	 * /ht nodes with no "ranges" property and a lot of perfectly
-	 * useable mapped devices below them. Thus we treat the absence of
-	 * "ranges" as equivalent to an empty "ranges" property which means
-	 * a 1:1 translation at that level. It's up to the caller not to try
-	 * to translate addresses that aren't supposed to be translated in
-	 * the first place. --BenH.
-	 *
-	 * As far as we know, this damage only exists on Apple machines, so
-	 * This code is only enabled on powerpc. --gcl
-	 */
 	ranges = of_get_property(parent, rprop, &rlen);
-	if (ranges == NULL && !of_empty_ranges_quirk(parent)) {
-		pr_debug("no ranges; cannot translate\n");
+	if (ranges == NULL && !of_missing_ranges_is_ok(parent)) {
+		pr_err("no ranges; cannot translate\n");
 		return 1;
 	}
 	if (ranges == NULL || rlen == 0) {
-- 
2.23.0.rc1

