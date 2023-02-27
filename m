Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8ED726A49F4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Feb 2023 19:40:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbjB0SkC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Feb 2023 13:40:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229854AbjB0SkB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Feb 2023 13:40:01 -0500
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8758F2196B
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Feb 2023 10:40:00 -0800 (PST)
Received: by mail-il1-x12f.google.com with SMTP id z5so4545154ilq.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Feb 2023 10:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EgE9qSydDheMGrlJYkywgbek+AYCNeYBDtX4hsvjRoM=;
        b=r9U+kkmdAAMTzyGiw0WfIn3mFX8/Fv6eu/sCzY0s2HgqKd2Oh/QJl83amEs/YCFEoU
         tDUMa1KBu+Thu/4Bityga9xGL1ESNCUAmuFJslh61bRO6qSes/+FSakwFLbgoIl85iI6
         j/cHqyVn8+aSC9Mn2TNDR26CFLJJpeMlGSsCm98Qtvailm0k6CrSAxyvjQa7LPUDg0Pg
         TTI6q1rHL+VVEaaLKIZFUbgUnppI69Jgw9kV93YWGGTmK8X9biG+LbfPASuqsLzIsiVS
         UqLTw2Xwmd+Z94zaxaP0ubLICqgL5XwBBPaSRPd5oEQq1JLBepEy5WVHiM4wtVlYP5Fl
         lrYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EgE9qSydDheMGrlJYkywgbek+AYCNeYBDtX4hsvjRoM=;
        b=5ebpWsvQ8uIQfyTs3Qof9eKqpg01vNoDQNFxtMYWKEXTFNSkSgx8pA9AMQK+HhBft2
         BEcq0e21OCe3fKFwKy2/A/9m6+CxMEdnTvmXTqXX+qjB/zbzhJh0wuNkPNQuMPFJ7pz4
         EXeGAebBT7Rz8f2+k+xIEHKa4NEsZhVVWnzW0/6T50f501ihXJImhaRX1LszG850j6Be
         3+ot+vje8jqrpQb0wA1FrJ+YtbEAxx/oaSF6tKXn1F33lX8rpPzD9+kP+VgvytN2P2yp
         HzTH0gBBiny8zUGWGOnieUYS/IWaayd2Mv2Akj1dlNiwH/A+b2ztIVY/dNAZSo0BjLiy
         BCyw==
X-Gm-Message-State: AO0yUKXeTFmSLmFUdONzi8BN1AmmU2W29SvLnAaeOMhujBPLUwZcvVWA
        D8jXvQi64B9fIDi8wYhh3BooFK+/TmdL30Ib
X-Google-Smtp-Source: AK7set+j6wPqEfZtDGucRfe92F3iAh+zNqa2TtXxaHNg67XyTY2jvlX3zhMZqbce6bPnkc4hhdI3mQ==
X-Received: by 2002:a05:6e02:1b89:b0:315:7911:748a with SMTP id h9-20020a056e021b8900b003157911748amr9306938ili.1.1677523199742;
        Mon, 27 Feb 2023 10:39:59 -0800 (PST)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id t5-20020a02ab85000000b003ab21c8fa84sm2331202jan.121.2023.02.27.10.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 10:39:59 -0800 (PST)
From:   Ralph Siemsen <ralph.siemsen@linaro.org>
To:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [PATCH 0/4] Renesas r9a06g032 clock table improvements
Date:   Mon, 27 Feb 2023 13:39:32 -0500
Message-Id: <20230227183937.377612-1-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series makes several mostly-cosmetic changes to improve the clock
tables for the r9a06g032 (RZ/N1). They could all be squashed into a single
commit, though I kept them separate to make review easier.

The motivation for this change is to make the register/bit numbers more
explicit in the clock tables. With the existing format, these values are packed
into a u16 value, which is difficult to understand. After this patch, the
memory format remains the same, but the tables now list the register and bit
numbers explicitly. The logic which accesses these has also been made a
bit simpler to understand.

Ralph Siemsen (4):
  clk: renesas: r9a06g032: improve readability
  clk: renesas: r9a06g032: drop unused fields
  clk: renesas: r9a06g032: document structs
  clk: renesas: r9a06g032: improve clock tables

 drivers/clk/renesas/r9a06g032-clocks.c | 726 ++++++++++++++++++-------
 1 file changed, 530 insertions(+), 196 deletions(-)

-- 
2.25.1

