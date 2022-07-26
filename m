Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE804581B71
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Jul 2022 23:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231566AbiGZVBR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Jul 2022 17:01:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbiGZVBQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Jul 2022 17:01:16 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BA692CE2D
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Jul 2022 14:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=QXnGtQ/K4FpSY//VqmUS1zeITEL
        3oYvripN4NVFm8Tw=; b=CMo5XUTu9QVi6FaNrYNhtdAHjoIs8VuqZY47zTtFoc6
        JAzomQT8Cxxb0ETINIz/x2m4F8RGm8XGtqL6vCxZnjj9S0/PahmnMiBjaUvzx03n
        B90n6WZzkxJO4ySNOiFEbo5JrmVc1ZjWy+rfQu2RgC+gNct4Ou+NGgKDZizmsJho
        =
Received: (qmail 2810214 invoked from network); 26 Jul 2022 23:01:13 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Jul 2022 23:01:13 +0200
X-UD-Smtp-Session: l3s3148p1@AcG1mbvk4GNZzIts
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/3] r8a779f0: enable TMU
Date:   Tue, 26 Jul 2022 23:01:07 +0200
Message-Id: <20220726210110.1444-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Here are the patches to enable the TMU on a R-Car S4-8. They have been
tested with a Renesas Spider board using Kernel timer selftests on top
of renesas-drivers-2022-07-19-v5.19-rc7.

Wolfram Sang (3):
  clk: renesas: r8a779f0: Add TMU and parent SASYNC clocks
  arm64: dts: renesas: r8a779f0: Add TMU nodes
  TEST: arm64: dts: renesas: spider: Enable TMU

 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi | 20 ++++++
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi     | 65 +++++++++++++++++++
 drivers/clk/renesas/r8a779f0-cpg-mssr.c       | 10 +++
 3 files changed, 95 insertions(+)

-- 
2.35.1

