Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C511895EB5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2019 14:34:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729383AbfHTMea (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Aug 2019 08:34:30 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:46267 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728366AbfHTMea (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Aug 2019 08:34:30 -0400
Received: by mail-pl1-f196.google.com with SMTP id c2so2685844plz.13;
        Tue, 20 Aug 2019 05:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=VvukjUY7yhh1mplnuU0GBYTFIC/QRKOm4rOEw/3nSUA=;
        b=QtvAZcslZsb3YgxB3Sj3yEhNi5/efLxNzCNroLsr7WgbWDAaiXEsyKWXwNFoqvBVb4
         D6XeDlKWLc4YhwO5ngEkyMAVv26w55aUM/wMRfCDtZ4gPjLZ5bE9QjtXDTeAfibYZYkv
         719vVeOG5NROCmxaERsw6JE0bgxYe64HG6cAaXfOLWpbSrx04T6zL0GyE1hmnsby9RkT
         MCwWhUbPkayXJH3PQjNlHe47OPsQECMycxZU4kf7a8xp1wXZcgDwxR3BPV2xB8+wkXiV
         jUGrNbdIKslkwNuUfQ0paJva6enwDphiyZzAcJ7woUd1XdWEoaNN945g8S50NJ6NweVt
         +sTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=VvukjUY7yhh1mplnuU0GBYTFIC/QRKOm4rOEw/3nSUA=;
        b=uQvVbYfolojxceWW8fJceN5PW73Z6ANzxoMKdnFPnypovqt2q2PRL4iUcVFVg/a7Z4
         QY6JMgYtpVAWz8tYG62fM4lKmQ78uyKdsw2nXY2rlYIU+yNDgDk7uaMCisoFmUPghjRJ
         92GcIvxIlhnDyIByxkkSB2T4KUhUm6iO1fpd9rDpXs5YV6mLaOprugipEPVEpCoSdKWq
         L1CQD/U26ktz9EDH4XCPH63W3fEq3Ss3aAOUqug1fIpJkKLjiqfomxZ2WFAXoY6BtkuY
         Au+uyIrUbh75RCFhXL4L3WMNpJMzhiwcJyziIUrAy10fUNsQ7YahOy5K3arYngnKVDht
         OkmQ==
X-Gm-Message-State: APjAAAUN5QGEo4kGxkPmpHd21xwsG+mH1HppjNKKBfYph3fS5fCyUW7M
        wiIxQjdJO4sIaAZcXPCgQpM1OgvU
X-Google-Smtp-Source: APXvYqy4E2YYJ4bEXvIkA7jnUAYC58RuMccVQk/GnVbuRj6M4HygK8Pgt9JTX7vBHz56zHSU5X58+w==
X-Received: by 2002:a17:902:1e8:: with SMTP id b95mr6254023plb.28.1566304469216;
        Tue, 20 Aug 2019 05:34:29 -0700 (PDT)
Received: from [127.0.0.1] (l193216.ppp.asahi-net.or.jp. [218.219.193.216])
        by smtp.gmail.com with ESMTPSA id s3sm17522204pgq.17.2019.08.20.05.34.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Aug 2019 05:34:28 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     mark.rutland@arm.com, devicetree@vger.kernel.org,
        geert+renesas@glider.be, daniel.lezcano@linaro.org,
        linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
        horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>,
        tglx@linutronix.de
Date:   Tue, 20 Aug 2019 21:36:07 +0900
Message-Id: <156630456771.17444.15687151782258703992.sendpatchset@octo>
In-Reply-To: <156630449239.17444.11157306180861080402.sendpatchset@octo>
References: <156630449239.17444.11157306180861080402.sendpatchset@octo>
Subject: [PATCH v2 7/7] clocksource/drivers/sh_cmt: Document "cmt-48" as deprecated
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
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
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
