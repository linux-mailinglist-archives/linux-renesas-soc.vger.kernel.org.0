Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 899A74CC30C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Mar 2022 17:42:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235114AbiCCQmw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Mar 2022 11:42:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235120AbiCCQms (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Mar 2022 11:42:48 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5E14619D755;
        Thu,  3 Mar 2022 08:42:02 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.90,151,1643641200"; 
   d="scan'208";a="112234863"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 04 Mar 2022 01:42:01 +0900
Received: from localhost.localdomain (unknown [10.226.93.138])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B197B40178C7;
        Fri,  4 Mar 2022 01:41:59 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH V2 0/4] Add I2C and Audio support for RZ/G2LC SMARC EVK
Date:   Thu,  3 Mar 2022 16:41:51 +0000
Message-Id: <20220303164155.7706-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to add I2C and Audio support for RZ/G2LC SMARC EVK

v1->v2:
 * Fixed typo mistake in commit description for patch#1.

This patch series depend upon [1]
[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220302074043.21525-1-biju.das.jz@bp.renesas.com/

Biju Das (4):
  arm64: dts: renesas: rzg2lc-smarc-pinfunction: Sort the nodes
  arm64: dts: renesas: rzg2l-smarc: Move out i2c3 and Audio codec from
    common dtsi
  arm64: dts: renesas: rzg2lc-smarc: Enable i2c{0,1,2}
  arm64: dts: renesas: rzg2lc-smarc: Enable Audio

 .../boot/dts/renesas/r9a07g044c2-smarc.dts    | 24 ----------
 .../boot/dts/renesas/rz-smarc-common.dtsi     | 15 ------
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  | 15 ++++++
 .../dts/renesas/rzg2lc-smarc-pinfunction.dtsi | 46 ++++++++++++++-----
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi | 15 ++++++
 5 files changed, 64 insertions(+), 51 deletions(-)

-- 
2.17.1

