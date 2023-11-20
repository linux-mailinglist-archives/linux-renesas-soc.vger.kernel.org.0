Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0862A7F1810
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Nov 2023 17:03:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233672AbjKTQDc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Nov 2023 11:03:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231486AbjKTQDb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Nov 2023 11:03:31 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A60110E
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Nov 2023 08:03:27 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40806e4106dso11964935e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Nov 2023 08:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20230601.gappssmtp.com; s=20230601; t=1700496206; x=1701101006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XA6mQ0Heysdt/s0uOB81NZYsQSV3L653pd5bRqGdzZY=;
        b=Ypo+4VkIFvVxqRvPxw9kYOf1j6KbIYcVACwj1wTYYqemSmehHfLqJShYrstIdaNqmk
         dDDc6ozt8qL9YEtLqJCjUJOInP9UAooLv8ZUig9EmscsobsFzZ/oopZOI8HrjhKbC2kg
         ONJEK+P2VT6n56eAVfc1I+2Xiewvd0J90TeIeAuq/KoFtf2wQHtpT3L5HhyqW5X9QEwm
         zJLAZXkLRIqJvWlbLkHf+P4ym9sENFsiexhwT1vkTUJVoyXyzLAPb7KxqHd1xvriOzBs
         w74Bw7lZHp2JaubIIh60obw+1OOXH+nk0mRfmTZhiwTsXlwOyAP07S2jh2b2Wjye+k81
         7IFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700496206; x=1701101006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XA6mQ0Heysdt/s0uOB81NZYsQSV3L653pd5bRqGdzZY=;
        b=syURNkj+v03YyPUJUtR0xtLJMGmUE7Ca6swvjkOg26Xb6//nJ//4PT6cb1tmas7n4e
         /43ifU22GF5wh/YkzkrFyLRl34XvUpha8LLBbDXSjecEezR8JvwJWKYPGQIBYoxliQ5/
         vhG2ZyKvUIwjVFnX2tefL7zBxojovUWJrRZ5X/7M13dPhVKvCf2RkZsb5u7xwc+7p1wQ
         s/z9NvS+UosgwY0N1HqnfKLSI24W+nVcW2/HP8hZqldEqCNkJu7gScja3VCZE2hZCU18
         hENLOua7Ih0KL5mhEOS4CxAff7rCcMlLzfhTbxyzjGQ3yvPUvC0NRkcT6xQOw5jAcLqh
         awrQ==
X-Gm-Message-State: AOJu0YzxBa2eirkTIgHjfG6AGkSsbJbFHHI88KrsXWRRSB1OWHTQdaXB
        8LDZ1yhifN57UIHU2A3RpbwbJw==
X-Google-Smtp-Source: AGHT+IFp6EIoX/+fBggjSUuEeNmuwT8XdZsBgwUHT9n/J9oSUS1P8tlqt937kSAYnNU4ybAc9QvgeQ==
X-Received: by 2002:a7b:cd86:0:b0:405:3ab3:e640 with SMTP id y6-20020a7bcd86000000b004053ab3e640mr11048501wmj.20.1700496206005;
        Mon, 20 Nov 2023 08:03:26 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8a96.dip0.t-ipconnect.de. [79.204.138.150])
        by smtp.googlemail.com with ESMTPSA id m21-20020a7bce15000000b004080f0376a0sm13564631wmc.42.2023.11.20.08.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 08:03:25 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Richard Cochran <richardcochran@gmail.com>,
        netdev@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next v2 0/5] net: ethernet: renesas: rcar_gen4_ptp: Add V4H support
Date:   Mon, 20 Nov 2023 17:01:13 +0100
Message-ID: <20231120160118.3524309-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

This small series prepares the rcar_gen4_ptp to be useable both on both
R-Car S4 and V4H. The only in-tree driver that make use of this is
rswtich on S4. A new Ethernet (R-Car Ethernet TSN) driver for V4H is on
it's way that also will make use of rcar_gen4_ptp functionality.

Patch 1-2 are small improvements to the existing driver. While patch 3-4
adds V4H support. Finally patch 5 turns rcar_gen4_ptp into a separate 
module to allow the gPTP functionality to be shared between the two 
users without having to duplicate the code in each.

See each patch for changelog.

Niklas Söderlund (5):
  net: ethernet: renesas: rcar_gen4_ptp: Remove incorrect comment
  net: ethernet: renesas: rcar_gen4_ptp: Fail on unknown register layout
  net: ethernet: renesas: rcar_gen4_ptp: Prepare for shared register
    layout
  net: ethernet: renesas: rcar_gen4_ptp: Get clock increment from clock
    rate
  net: ethernet: renesas: rcar_gen4_ptp: Break out to module

 drivers/net/ethernet/renesas/Kconfig         | 10 +++++
 drivers/net/ethernet/renesas/Makefile        |  5 ++-
 drivers/net/ethernet/renesas/rcar_gen4_ptp.c | 40 ++++++++++++++++----
 drivers/net/ethernet/renesas/rcar_gen4_ptp.h |  9 ++---
 drivers/net/ethernet/renesas/rswitch.c       |  4 +-
 5 files changed, 50 insertions(+), 18 deletions(-)

-- 
2.42.1

