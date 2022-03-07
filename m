Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B49D4D079D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Mar 2022 20:24:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236484AbiCGTZg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Mar 2022 14:25:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232064AbiCGTZg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Mar 2022 14:25:36 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4B70347054;
        Mon,  7 Mar 2022 11:24:41 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.90,163,1643641200"; 
   d="scan'208";a="113628960"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 08 Mar 2022 04:24:40 +0900
Received: from localhost.localdomain (unknown [10.226.92.211])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id C354A40DBADC;
        Tue,  8 Mar 2022 04:24:38 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/4] Enable RZ/G2LC OSTM, QSPI0, RSPI and Voltage regulator for GPU
Date:   Mon,  7 Mar 2022 19:24:32 +0000
Message-Id: <20220307192436.13237-1-biju.das.jz@bp.renesas.com>
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

This patch enables OSTM, QSPI0, RSPI and Voltage regulator for GPU
on RZ/G2LC SMARC EVK.

This patch depend upon [1]
[1] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=620047

Biju Das (4):
  arm64: dts: renesas: rzg2lc-smarc-som: Enable serial NOR flash
  arm64: dts: renesas: rzg2lc-smarc-som: Enable OSTM
  arm64: dts: renesas: rzg2lc-smarc-som: Add vdd core regulator
  arm64: dts: renesas: rzg2lc-smarc: Enable RSPI1 on carrier board

 .../boot/dts/renesas/r9a07g044c2-smarc.dts    |  6 --
 .../dts/renesas/rzg2lc-smarc-pinfunction.dtsi |  7 +++
 .../boot/dts/renesas/rzg2lc-smarc-som.dtsi    | 61 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi |  8 +++
 4 files changed, 76 insertions(+), 6 deletions(-)

-- 
2.17.1

