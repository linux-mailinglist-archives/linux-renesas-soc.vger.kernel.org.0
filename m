Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6FF0564BF1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Jul 2022 04:56:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbiGDC4i (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 3 Jul 2022 22:56:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231138AbiGDC4i (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 3 Jul 2022 22:56:38 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4212A655E
        for <linux-renesas-soc@vger.kernel.org>; Sun,  3 Jul 2022 19:56:37 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id j12so616732plj.8
        for <linux-renesas-soc@vger.kernel.org>; Sun, 03 Jul 2022 19:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CDpJpm0cFQqsGudcSEw+7H8LVRQ+ZQveBCZPoAZN3eE=;
        b=rfKXhN/RvJLdlvVPE8uPEWKRbr/B7/66H+dHinpLVsTNlqahX4qClbOjZkJ3Ks67ey
         MEDrtsRk9vdB0LH0T5ZEwbtZarxwAMWMjZ30bsFWcQ/menhF8FJlMA3+ncbETi7PEkkN
         YA5buu5DnWr9pZy56bRwFRQNi6uekCZhcVRCNFWOc9LbECg05FFcoVhBGXNr4vSoGlKE
         AgSjbr3UpFimeZpLcJj4PRM41YNmbG9XUbRH72SRbqKJPlMSjD3xxH2MzzweVYgcw0e8
         I82KI6M1VbKWppEotpzb14Pii+/zs/wZikIIhP7soGdCQLm3cep21VwzCPbg4Mfoibud
         QNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CDpJpm0cFQqsGudcSEw+7H8LVRQ+ZQveBCZPoAZN3eE=;
        b=ZTnbqsjQY0Mq9Lp9BYymMkMdroZufGY6JJ9HxdTuaexeZU2SPLHrajk9n6lnvoWhwl
         0u0YlfvKkHU6ccT4vbWr9z+yCGcc7U4foYkd9Wnci5ZJESCRY+rUYUo91PoJNzc92o3/
         OfEsnHmOiFI8seWYvwK+qklXRf9eI8/PMm/FzxBfd3lrJVzWg86MYp9jMfbNACRqWGXV
         QAf6OkMd9QFet3RIPC+6LQOsrKS424RzPvcnV1Erb5c5RVdMvXbbZX/9RlKYuBOonoqX
         fu6zmQqjc+ZE5d37LGOt+TPjiJNNUw9rUkamp6oc6n7PK952r9yu/pARf322twlsJ8d/
         yn0Q==
X-Gm-Message-State: AJIora9oHD9JSap2jrleEicImoLfQeNDEdDnf6wtiLxMf1OjmxPxdJO1
        zzQ8SmDTwWBJPBnQGccrm67UyLXuHeQStWs5
X-Google-Smtp-Source: AGRyM1sZ0XtY+mM3M5iAP4xAEepFO+OfaaEw0vUmcGumlKN+Hvm7OvOX6T+S2Lv2Ycs8y0ynlFBLpw==
X-Received: by 2002:a17:903:2012:b0:16a:856:96a7 with SMTP id s18-20020a170903201200b0016a085696a7mr34859740pla.109.1656903396396;
        Sun, 03 Jul 2022 19:56:36 -0700 (PDT)
Received: from taki-u2.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
        by smtp.gmail.com with ESMTPSA id q10-20020a170902f78a00b0016b80d2fac8sm14283887pln.248.2022.07.03.19.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 19:56:35 -0700 (PDT)
From:   Takanari Hayama <taki@igel.co.jp>
To:     linux-renesas-soc@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com
Subject: [PATCH 0/3] Test pixel blend mode
Date:   Mon,  4 Jul 2022 11:56:29 +0900
Message-Id: <20220704025632.3911253-1-taki@igel.co.jp>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

This patch series extends the kms-test scripts to test pixel blend mode.

The patches are based on series of patches posted by Laurent ([1]).

[1] https://lore.kernel.org/linux-renesas-soc/20220609234031.14803-1-laurent.pinchart@ideasonboard.com/T/#t

Takanari Hayama (3):
  tests: Support enum property type
  kmstest: Support specifying pixel blend mode for planes
  tests: Add pixel blend mode test

 tests/kms-test-plane-blendmode.py | 100 ++++++++++++++++++++++++++++++
 tests/kmstest.py                  |  16 ++++-
 2 files changed, 114 insertions(+), 2 deletions(-)
 create mode 100755 tests/kms-test-plane-blendmode.py

-- 
2.25.1

