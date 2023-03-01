Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF7B96A7678
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Mar 2023 22:55:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbjCAVzp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Mar 2023 16:55:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbjCAVzf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Mar 2023 16:55:35 -0500
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95C35303F9
        for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Mar 2023 13:55:26 -0800 (PST)
Received: by mail-io1-xd34.google.com with SMTP id q6so6001656iot.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Mar 2023 13:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677707726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5lG8sR2zrlTlvAovPadHdYghd1Y5ULssI2+Ll/R8Rio=;
        b=jdOGBhTnNOxEAP6g/g5bJfhRD4BRuHQZfQgAzjsSuZyhnxOtmkvR2VD39MpQ7jiq2s
         h4x8f8h01erxsyCCO1qM/mVUkB2xdCkYJKBT2grcZ0VUmOZTBz+Vl2CLkFuiCyreqzfo
         9wnl/NkmCHiXJWyniVl6jIBJEXAEE5bUUleGNS6CXS+rSK/1jL5nYVAayD6FV5PAi9Ug
         7QtrN+8MxkNGYT9iDiSpnkzuyOd2vUTAykbGbZzf7cI013WhvpuQymi4PzCQ0fFRh8tl
         GNlgp+hlWTsUpYHziPXn8cpdIxZcaPpjinrlhrnWR/KBk5Uvtp+2ObI8UNCIYgNoCO+s
         7z1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677707726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5lG8sR2zrlTlvAovPadHdYghd1Y5ULssI2+Ll/R8Rio=;
        b=QNnJ8eNe/0cd4cvcvAi3ZyqtatznLk5fO2lLhkQwoldJv6wxr2vSYriy2QFR24pP+I
         tSNol01IW5Jh18YAdjoRyoj+tsfz+NZNH3zqRmzQc306YkLlKWdyG+F0uvR6Uk5y3gaB
         hxy15ojK7flnQ8rKAH63+D33UgHUgW3Bd21bKhGTWl7el6rG5KC3gPBPALCWTi3bLcw/
         iour56NYN8NWsLFxUEMe7iERE7WudMFuBuRWgT+DpqZ9MepUT06kb9bmV3O1cjXFiFi7
         UUjnn5wJEwErj0Ro/IeqUtDDoeFYQFuLZu6prn0MC0hYqZPqAZE4YpPXEsyS9ouwqCd0
         6vRQ==
X-Gm-Message-State: AO0yUKU8wwGhEG2FwurH1rKKAatDtrYOy8WFSJ7ne6S0xv0/N5+9WkOt
        mTVERprxSxCpI6oIg46lNwcRGAQ2s5AxLLNw
X-Google-Smtp-Source: AK7set+2lp8Fz67z5vy+bFHe8PVqWYA/4iE5cONp2shJ7qmNyfT50k1Yxotn3NCQWo8oWl4ukMSUSQ==
X-Received: by 2002:a6b:6e12:0:b0:74c:b436:4a9e with SMTP id d18-20020a6b6e12000000b0074cb4364a9emr5488198ioh.16.1677707725932;
        Wed, 01 Mar 2023 13:55:25 -0800 (PST)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id v11-20020a5ec10b000000b0074c9a4bb374sm4173479iol.11.2023.03.01.13.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 13:55:24 -0800 (PST)
From:   Ralph Siemsen <ralph.siemsen@linaro.org>
To:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [PATCH v2 0/4] Renesas r9a06g032 clock table improvements
Date:   Wed,  1 Mar 2023 16:55:16 -0500
Message-Id: <20230301215520.828455-1-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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

Changes in v2:
- Address reviewer comments
- Replace register shifts with multiply/divide
- Unify the reg access in clk_rdesc_{get,set}
- Restore the WARN_ON() check for clock gate
- Swap field order in struct regbit, to exactly match the u16 values

Ralph Siemsen (4):
  clk: renesas: r9a06g032: improve readability
  clk: renesas: r9a06g032: drop unused fields
  clk: renesas: r9a06g032: document structs
  clk: renesas: r9a06g032: improve clock tables

 drivers/clk/renesas/r9a06g032-clocks.c | 736 ++++++++++++++++++-------
 1 file changed, 541 insertions(+), 195 deletions(-)

-- 
2.25.1

