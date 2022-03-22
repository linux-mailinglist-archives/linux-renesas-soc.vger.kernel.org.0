Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D727B4E3BFB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Mar 2022 10:55:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232053AbiCVJ4x (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Mar 2022 05:56:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232184AbiCVJ4v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Mar 2022 05:56:51 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BAB26B0BA
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Mar 2022 02:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=hIBXvjRtM+O6zbhw1CD3K6cWpqM
        Hd07unUt7YREof/M=; b=qhsZLiQLVGZKscYIZUdxX9cXtcv2ts9SRdXt/4tN39C
        wv60zOenVVXLrUJmqgMBjUo/06tJ74zP4XuV6SO4t1n+LhbJeZ81yaaXfFStuL4C
        6i8wjOm/fub9f6FLcFd7XhaVRs/x3wTGAuydD05rDJjv78Hzw1rxLLLobH+rijBM
        =
Received: (qmail 1276037 invoked from network); 22 Mar 2022 10:55:19 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2022 10:55:19 +0100
X-UD-Smtp-Session: l3s3148p1@RdIRnMvaPusgAQnoAGKBAIBddhzCa5pi
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/5] dts: renesas: add interrupt property to the watchdog nodes
Date:   Tue, 22 Mar 2022 10:55:07 +0100
Message-Id: <20220322095512.4707-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Driver doesn't use it yet, but let's describe the HW properly. Based on
renesas-drivers as of today.

Wolfram Sang (5):
  ARM: dts: rcar-gen2: add interrupt property to the watchdog node
  ARM: dts: rzg1: add interrupt property to the watchdog node
  arm64: dts: renesas: rcar-gen3: add interrupt property to the watchdog
    node
  arm64: dts: renesas: rzg2: add interrupt property to the watchdog node
  arm64: dts: renesas: rcar-gen4: add interrupt property to the watchdog
    node

 arch/arm/boot/dts/r8a7743.dtsi            | 1 +
 arch/arm/boot/dts/r8a7744.dtsi            | 1 +
 arch/arm/boot/dts/r8a7745.dtsi            | 1 +
 arch/arm/boot/dts/r8a77470.dtsi           | 1 +
 arch/arm/boot/dts/r8a7790.dtsi            | 1 +
 arch/arm/boot/dts/r8a7791.dtsi            | 1 +
 arch/arm/boot/dts/r8a7792.dtsi            | 1 +
 arch/arm/boot/dts/r8a7793.dtsi            | 1 +
 arch/arm/boot/dts/r8a7794.dtsi            | 1 +
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 1 +
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 1 +
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 1 +
 arch/arm64/boot/dts/renesas/r8a77951.dtsi | 1 +
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 1 +
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 1 +
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 1 +
 arch/arm64/boot/dts/renesas/r8a77970.dtsi | 1 +
 arch/arm64/boot/dts/renesas/r8a77980.dtsi | 1 +
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 1 +
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 1 +
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 1 +
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 1 +
 22 files changed, 22 insertions(+)

-- 
2.34.1

