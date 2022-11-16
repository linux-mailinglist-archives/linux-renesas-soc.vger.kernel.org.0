Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2E4B62B7BB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Nov 2022 11:22:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233389AbiKPKV6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Nov 2022 05:21:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232702AbiKPKVr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Nov 2022 05:21:47 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3095724BF8;
        Wed, 16 Nov 2022 02:21:46 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,167,1665414000"; 
   d="scan'208";a="140240143"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 16 Nov 2022 19:21:45 +0900
Received: from localhost.localdomain (unknown [10.226.92.242])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8FB5040029A5;
        Wed, 16 Nov 2022 19:21:42 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v4 0/3] Add SoC identification support for RZ/V2M
Date:   Wed, 16 Nov 2022 10:21:37 +0000
Message-Id: <20221116102140.852889-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to add SoC identification support for RZ/V2M.

v3->v4:
 * Added Rb tags from Krzysztof and Geert
 * Fixed the example indentation from 3 spaces-> 2 spaces.
v2->v3:
 * Renamed the binding file based on the compatible
 * Dropped quotes from id and schema
 * Updated binding description
 * Renamed device node from system-configuration->system-controller
 * Renamed label name from sysc->sys
 * Fixed the indentation in example
 * Updated commit header and description for SoC dtsi
 * Updated label and node-names for SoC dtsi
 * system-controller is enabled by default as it do not need external
   resources from board. 
v1->v2:
 * Moved the binding file from arm->soc/renesas
 * Updated the binding example
 * Removed config from patch#2 as it is already present
 * Removed extra space before 'else if' statement

Ref:
[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220321154232.56315-3-phil.edworthy@renesas.com/
[2] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220321154232.56315-8-phil.edworthy@renesas.com/

logs:
root@rzv2m:~# dmesg | grep "Renesas RZ/V2M"
[ 0.119196] Detected Renesas RZ/V2M r9a09g011 1.1

root@rzv2m:~# for i in machine family soc_id revision; do echo -n "$i: ";cat /sys/devices/soc0/$i; done
machine: RZ/V2M Evaluation Kit 2.0
family: RZ/V2M
soc_id: r9a09g011
revision: 1.1

Biju Das (1):
  arm64: dts: renesas: r9a09g011: Add system controller node

Phil Edworthy (2):
  dt-bindings: arm: renesas: Document Renesas RZ/V2M System
    Configuration
  soc: renesas: Identify RZ/V2M SoC

 .../soc/renesas/renesas,r9a09g011-sys.yaml    | 43 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi    |  5 +++
 drivers/soc/renesas/renesas-soc.c             | 22 ++++++++++
 3 files changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g011-sys.yaml

-- 
2.25.1

