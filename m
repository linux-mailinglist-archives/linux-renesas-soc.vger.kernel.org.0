Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A29B27107DD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 May 2023 10:48:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240425AbjEYIs3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 May 2023 04:48:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230396AbjEYIs2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 May 2023 04:48:28 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39AC19E
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 May 2023 01:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=96ak6vdBrvXkxNL/0l5VlKNTwmB
        h4lVq2W3TR2qJDm4=; b=B3NRGAJp9nB5NzzC1Fz/+SYU0pgIVzGgq72FyfHMWBY
        AYezpdTXo55gH9U1oF+n3ucZoaCzkRHTFKK7tGQ8+DP5eOUR2X0SvLG8b8JzBJHe
        hznEV1c3i+MqyYpmYNN2zpAYoQKM8MXzNT+ais3zjXKGTxkbp86g0nJZy3Pc7BLk
        =
Received: (qmail 3453207 invoked from network); 25 May 2023 10:48:25 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 May 2023 10:48:25 +0200
X-UD-Smtp-Session: l3s3148p1@ZhL8roD82LsujnsI
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 0/2] KingFisher: fix SCIF1, add HSCIF1
Date:   Thu, 25 May 2023 10:48:21 +0200
Message-Id: <20230525084823.4195-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Changes since v1:
* split into two patches
* added Geert's tags (thanks!)

Wolfram Sang (2):
  arm64: dts: renesas: ulcb-kf: remove flow control for SCIF1
  arm64: dts: renesas: ulcb-kf: add HSCIF1 node

 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

-- 
2.30.2

