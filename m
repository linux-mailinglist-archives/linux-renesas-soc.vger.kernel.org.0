Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61C8879F303
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Sep 2023 22:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232603AbjIMUir (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Sep 2023 16:38:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232525AbjIMUiq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Sep 2023 16:38:46 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BABD1BC6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Sep 2023 13:38:42 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-41501ffb771so1191511cf.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Sep 2023 13:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694637521; x=1695242321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zwVOfYwHpMwktmYsXHkpEkdKer4I1SfhoGgmDQcwfcA=;
        b=DkUODoeoutX+fnNWGpq84ZK2tTioQ3MzRtj6VbRrtDrZ6nAUubNJDEIDlYCQ6CxABj
         vhQuHi/1smrA9X238eSKybfeJIU/DDRZx/RgXY4r0HNyXwV1C8jZQZmYwnzixbFHh9qb
         H61Ysf81rbKAMBMkr3Yasn1tQzpsnHjXrCQqtsUwP/28+BDtnfSbOzrOSW0JEjNQqaRQ
         D53ZEE9lmKVh4ER4jM0ymn0VNkTy8KnejIcdDb07NyksWAbBhYIASxsjoaxdjanRpry0
         1igu8lGpSM6g4xVkKmkODy2fm+OHnmpCMzK8uCFnAuwe3qCQoSXS3gzES1wKlGY1C6o/
         bq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694637521; x=1695242321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zwVOfYwHpMwktmYsXHkpEkdKer4I1SfhoGgmDQcwfcA=;
        b=jBSzzEZ2oM/yc6hBGimd2BROyv7YzO+cI6ity2Jqaj9q9PDnFdGN1ph3r2OLzoDova
         0MpUu6CQ/cJa0hJz6we1uTL9t0hvsg18jJEvrFmtno/EpazStYg4AtFIP+lgl6LmVAUN
         ZwMWoR7GiXM6Ghyiw4hdYcEmtZ0CZdSu3dtgMP/qz5kX4PmH+M+Vct6U3pljCItsvoWY
         39cJ0C48Xr4djoB32GijXkDyJEeMhO/JUt42dAgJFj0iPrh6il1FJk783FFurwXgDvRp
         NTxl5gCuh5EEkj/xpO+PPpzhHvCRJCIDUYNu+P//q8fUSJIS45u39L7GdmuyGO6jxYg8
         4J4Q==
X-Gm-Message-State: AOJu0Yx3BqnP9QI4uGO/cYf3GgYk/CAJwyc9g9j456ddM5CWKsJG/p+V
        0PctWFE2UQ+QQq+MPiNVnzYH3w==
X-Google-Smtp-Source: AGHT+IH1ZDZfWwx8ZsEmLQw8AjRhhAy9QDYEdCvB0mO045R5lZFLCXc9qs+DfLxBtLvaL0Kn+ok1hA==
X-Received: by 2002:ac8:75c8:0:b0:416:6663:3812 with SMTP id z8-20020ac875c8000000b0041666633812mr1808568qtq.35.1694637521530;
        Wed, 13 Sep 2023 13:38:41 -0700 (PDT)
Received: from maple.home ([174.94.49.189])
        by smtp.gmail.com with ESMTPSA id j6-20020ac85506000000b0040f200feb4fsm24203qtq.80.2023.09.13.13.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 13:38:41 -0700 (PDT)
From:   Ralph Siemsen <ralph.siemsen@linaro.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ralph Siemsen <ralph.siemsen@linaro.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v2 1/2] clk: renesas: r9a06g032: fix kerneldoc warning
Date:   Wed, 13 Sep 2023 16:38:04 -0400
Message-Id: <20230913203805.465780-1-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Mention the 'dual' structure in the kdoc. This fixes the following
W=1 warning during build:

> drivers/clk/renesas/r9a06g032-clocks.c:119: warning: Function parameter or member 'dual' not described in 'r9a06g032_clkdesc'

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202309101314.kTRoxND5-lkp@intel.com/
Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
Changes in v2:
- split the warning fix into separate commit
---
 drivers/clk/renesas/r9a06g032-clocks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index 55db63c7041a..aa00543fe865 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -109,6 +109,7 @@ enum gate_type {
  *             must be in ascending order, zero for unused
  * @div:       divisor for fixed-factor clock
  * @mul:       multiplier for fixed-factor clock
+ * @dual:      substructure for dual clock gates
  * @group:     UART group, 0=UART0/1/2, 1=UART3/4/5/6/7
  * @sel:       select either g1/r1 or g2/r2 as clock source
  * @g1:        1st source gate (clock enable/disable)
-- 
2.25.1

