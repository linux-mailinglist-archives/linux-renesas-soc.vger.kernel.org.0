Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BAE2617FA7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Nov 2022 15:34:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbiKCOez (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Nov 2022 10:34:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbiKCOew (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Nov 2022 10:34:52 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 088EF10F1
        for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Nov 2022 07:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=ciSh6lQm8MgpqvLKv1wKNl7An8s
        XlSLNbGZ/CsYKPxI=; b=G/A9gwUOsx9403U9Idfdw5ogHZ3ZQ/hFIZuXwhB3ORG
        lyZmF0GYjbX3zP5YB8SKtMsYx7udpbXJIV06+Zh769/73iWjOtjgQDHpLAuMy6Td
        KteozZipmVRZYPaP8xjjCIhp6XJWkqYXM6JBa42PMxIwlO9sm13ezHsVFZcDTRc8
        =
Received: (qmail 2669677 invoked from network); 3 Nov 2022 15:34:46 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Nov 2022 15:34:46 +0100
X-UD-Smtp-Session: l3s3148p1@4sDZ25HsPLUujns0
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/4] r8a779f0: update SCIF parent clocks
Date:   Thu,  3 Nov 2022 15:34:36 +0100
Message-Id: <20221103143440.46449-1-wsa+renesas@sang-engineering.com>
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

Similar to what Geert found out for V4H, adapt the (H)SCIF clock parents
and baud rate generators to the parents mentioned in the updated
documentation. Slightly tested with SCIF on the Spider board in Kieran's
lab. But the HW engineers already confirmed Geert findings.

Wolfram Sang (4):
  clk: renesas: r8a779f0: Fix HSCIF parent clocks
  clk: renesas: r8a779f0: Fix SCIF parent clocks
  arm64: dts: renesas: r8a779f0: Fix HSCIF "brg_int" clock
  arm64: dts: renesas: r8a779f0: Fix SCIF "brg_int" clock

 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 16 ++++++++--------
 drivers/clk/renesas/r8a779f0-cpg-mssr.c   | 16 ++++++++--------
 2 files changed, 16 insertions(+), 16 deletions(-)

-- 
2.35.1

