Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83FFA7A67D8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Sep 2023 17:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233060AbjISPUB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Sep 2023 11:20:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233054AbjISPT6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Sep 2023 11:19:58 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E736FBE
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Sep 2023 08:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=from:to:cc:subject:date:message-id
        :mime-version:content-transfer-encoding; s=k1; bh=OCZPftvkzvatgO
        mljvXbeKw2v10l+VXjgJq5aQ5kchE=; b=kisbrGeE6jwvux9GXxkqFN/H0jxagY
        Gf1kSh+5Cy6Wl/9eVNFqzuqFgZEBSzr5go/iRK3A8rwR3rbMENnirc6NrLX/vk/S
        Pwr27bOLBjPyz1HVelXUiq9LoVO1aJ9yti7PDjVtoed2Dpj+/InqcEMORLAVnAVv
        zdv5YUPqoOCs7oNVlAJRApflhJ4YzGiJz5Ls4dpT9HuLYm3PzlcnFyyvhDWNsmC7
        eqcPSJ97LSZHymehNdcCHwd+dI+dp/lisf/3+dn0zCregspAlgq52J3pP9nmA6j3
        gcdJ5MUIYYTj5LlJUVO/QwlvHE8M52734LEBxi4GiJHqIySWvJMllFsA==
Received: (qmail 255774 invoked from network); 19 Sep 2023 17:19:50 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Sep 2023 17:19:50 +0200
X-UD-Smtp-Session: l3s3148p1@SGkwyrcF8GIucrQg
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] i2c: rcar: improve Gen3 support
Date:   Tue, 19 Sep 2023 17:19:45 +0200
Message-Id: <20230919151948.21564-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Here is a series paving the way for Gen4 support. This time we properly
apply the Gen3 specific features. See the patch comments for further
information and changelogs. This has been tested on a Renesas Falcon
board with a R-Car V3U SoC at various bus speeds. Because the
calculation formulas are crucial, testing on board farms would be much
appreciated!

Thanks and happy hacking!


Wolfram Sang (2):
  i2c: rcar: reset controller is mandatory for Gen3+
  i2c: rcar: improve accuracy for R-Car Gen3+

 drivers/i2c/busses/i2c-rcar.c | 150 ++++++++++++++++++++++------------
 1 file changed, 100 insertions(+), 50 deletions(-)

-- 
2.35.1

