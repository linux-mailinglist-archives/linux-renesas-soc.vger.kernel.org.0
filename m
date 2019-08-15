Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A62028E4D1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Aug 2019 08:14:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725977AbfHOGOJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Aug 2019 02:14:09 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:34461 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725681AbfHOGOI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Aug 2019 02:14:08 -0400
Received: by mail-pl1-f196.google.com with SMTP id i2so739039plt.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Aug 2019 23:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gl+BErSj03gaep8VqCMADzAf+FeyIXcEU3AoVi0xztA=;
        b=G8eZfY0hGz3DzOYhJTsOZAPPdlDiz3t21rRLXCKG/KWvesNCStis7sRyD7EHpFdI8F
         tyQhtebh9Ir8vw+qEWjavs0Fe8joBqWEqaLMjUqILg8RNxrgt68nNiEgFc80VT+H2Ypd
         BPkY8NqdDNNPc6d6JhYXJmQ3WzBg5WgdrvqtMC49Ogh1PPR8vYzxf5rEWjvSWhOPMDFn
         hCYO1/cXHFXPjyUt8hffCWxTcbAjBWMPeIa6NC+TkTi0H0yzOQ5REOO/HlMxT0nkAun4
         P9eQXTJfxkBZUiJBv8WcbCEQpb64riW2FH+R14MDJsftxaRdonhn6cvStDtnjOZlf6Uc
         2zNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gl+BErSj03gaep8VqCMADzAf+FeyIXcEU3AoVi0xztA=;
        b=cyPkH95/anqayFUt+oJxkN+izgovBV3/7iLuAGpTQQGmJr1MteUQnYNd5oChqdB7D2
         i62/ifb5aG3ySFIkVBlB7afL8pXUoDUgcrI5z+ynSI7RJVE6NVoPNnXRrmqpIt156a6r
         LsMAF2s5gpyEbuSH++jGRhgi/BiInYZoxLBOLyepOgnK5iYd9e2crSn8y9bJJ520gbsC
         RQs9tusDj4zsxS2Ytcw+Ud1PTQPXzTXVNZ++2ObfncrO5TEXiXkgJn7mdPAMWwKJDI4c
         c90kW7vC54OJvCoo4TyxRzhHFKhfxDe3APANfBrU05fA1yPjwIiSjKBwRTVD92PuUMAp
         ef3w==
X-Gm-Message-State: APjAAAX+v9Btx28MNplqRT4L/VdM5VEHqiTCmhilmBzhFGMLkQleFZmr
        uk9NDVnnfcv9btqn7wi+2Wg=
X-Google-Smtp-Source: APXvYqyqmk8p7g+Qz03SATLO0dnD5+myxeagA2Jb9dhfKXNF8WNoSHVAmfO4C3KO6hsCDVssgj33ow==
X-Received: by 2002:a17:902:2ae7:: with SMTP id j94mr2949937plb.270.1565849648294;
        Wed, 14 Aug 2019 23:14:08 -0700 (PDT)
Received: from localhost.localdomain ([110.225.3.176])
        by smtp.gmail.com with ESMTPSA id b6sm1348521pgq.26.2019.08.14.23.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2019 23:14:07 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     horms@verge.net.au, geert+renesas@glider.be, magnus.damm@gmail.com,
        linux-renesas-soc@vger.kernel.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] soc: renesas: rcar-sysc: Add goto to of_node_put() before return
Date:   Thu, 15 Aug 2019 11:43:54 +0530
Message-Id: <20190815061355.4415-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The local variable np in function rcar_sysc_pd_init takes the return
value of of_find_matching_node_and_match, which gets a node but does not
put it. If np is not put before the function returns, it may cause a
memory leak. Hence, remove the return statement that does not
immediately follow a putting of np. Replace it with a goto pointing to a
pre-existing label that first puts np and then returns the required
value.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/soc/renesas/rcar-sysc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rcar-sysc.c
index 0c80fab4f8de..8a53f18d0429 100644
--- a/drivers/soc/renesas/rcar-sysc.c
+++ b/drivers/soc/renesas/rcar-sysc.c
@@ -346,7 +346,7 @@ static int __init rcar_sysc_pd_init(void)
 	if (info->init) {
 		error = info->init();
 		if (error)
-			return error;
+			goto out_put;
 	}
 
 	has_cpg_mstp = of_find_compatible_node(NULL, NULL,
-- 
2.19.1

