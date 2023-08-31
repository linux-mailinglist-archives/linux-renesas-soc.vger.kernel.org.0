Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 683F978E69C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Aug 2023 08:36:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245306AbjHaGgw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Aug 2023 02:36:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245305AbjHaGgr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Aug 2023 02:36:47 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9BA52A4;
        Wed, 30 Aug 2023 23:36:44 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,215,1688396400"; 
   d="scan'208";a="174568736"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 31 Aug 2023 15:36:43 +0900
Received: from localhost.localdomain (unknown [10.226.92.179])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id F0C4E418875D;
        Thu, 31 Aug 2023 15:36:39 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/3] Enable 4-bit tx support
Date:   Thu, 31 Aug 2023 07:36:32 +0100
Message-Id: <20230831063635.2816-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to enable 4-bit tx support for
RZ/{G2L,G2LC,G2UL,V2L} SMARC EVKs.

v1->v2:
 * Enabled 4-bit tx support.

This patch series dependupon [1]
[1] https://lore.kernel.org/all/20230830145835.296690-1-biju.das.jz@bp.renesas.com/

Biju Das (3):
  arm64: dts: renesas: rzg2ul-smarc-som: Enable serial NOR flash
  arm64: dts: renesas: rzg2l-smarc-som: Enable 4-bit tx support
  arm64: dts: renesas: rzg2lc-smarc-som: Enable 4-bit tx support

 .../boot/dts/renesas/rzg2l-smarc-som.dtsi     |  1 +
 .../boot/dts/renesas/rzg2lc-smarc-som.dtsi    |  1 +
 .../boot/dts/renesas/rzg2ul-smarc-som.dtsi    | 44 +++++++++++++++++++
 .../boot/dts/renesas/rzfive-smarc-som.dtsi    |  4 ++
 4 files changed, 50 insertions(+)

-- 
2.25.1

