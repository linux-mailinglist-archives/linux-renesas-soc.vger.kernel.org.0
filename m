Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 142557E5C4C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Nov 2023 18:22:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231926AbjKHRWn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Nov 2023 12:22:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbjKHRWm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Nov 2023 12:22:42 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A296FE8;
        Wed,  8 Nov 2023 09:22:38 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.03,286,1694703600"; 
   d="scan'208";a="186045090"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 09 Nov 2023 02:22:38 +0900
Received: from localhost.localdomain (unknown [10.226.92.247])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 00BE8400294E;
        Thu,  9 Nov 2023 02:22:34 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 0/2] Enable 4-bit tx support for RZ/{G2L,G2LC,V2L} SMARC EVKs
Date:   Wed,  8 Nov 2023 17:22:30 +0000
Message-Id: <20231108172232.259301-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to enable 4-bit tx support for
RZ/{G2L,G2LC,V2L} SMARC EVKs.

Note:
 This patch series doesn't have any driver dependency as 4-bit tx mode
 works fine with the latest renesas-devel and linux-next.

=> ./test_rzg2l.sh
[   49.891815] spi-nor spi1.0: mt25qu512a (65536 Kbytes)
[   49.914237] 2 fixed-partitions partitions found on MTD device spi1.0
[   49.920756] Creating 2 MTD partitions on \"spi1.0\":
[   49.925561] 0x000000000000-0x000002000000 : \"boot\"
[   49.933242] 0x000002000000-0x000004000000 : \"user\"
EXIT|PASS|rpcif_t_001.sh|[00:02:57] ||

=>./test_rzg2lc.sh
[   48.126373] spi-nor spi0.0: mt25qu512a (65536 Kbytes)
[   48.146357] 2 fixed-partitions partitions found on MTD device spi0.0
[   48.152752] Creating 2 MTD partitions on \"spi0.0\":
[   48.158505] 0x000000000000-0x000002000000 : \"boot\"
[   48.168398] 0x000002000000-0x000004000000 : \"user\"
EXIT|PASS|rpcif_t_001.sh|[00:02:54] ||

=>./test_rzv2l.sh
[   48.104324] spi-nor spi1.0: mt25qu512a (65536 Kbytes)
[   48.127265] 2 fixed-partitions partitions found on MTD device spi1.0
[   48.133723] Creating 2 MTD partitions on \"spi1.0\":
[   48.138536] 0x000000000000-0x000002000000 : \"boot\"
[   48.147075] 0x000002000000-0x000004000000 : \"user\"
EXIT|PASS|rpcif_t_001.sh|[00:02:55] ||

v3->v4:
 * Rebased and tested with latest renesas-devel.
 * Remove RZ/G2UL patch from this series and will send later.
v2->v3:
 * Added Rb tag from Geert.
v1->v2:
 * Enabled 4-bit tx support.

Biju Das (2):
  arm64: dts: renesas: rzg2l-smarc-som: Enable 4-bit tx support
  arm64: dts: renesas: rzg2lc-smarc-som: Enable 4-bit tx support

 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi  | 1 +
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi | 1 +
 2 files changed, 2 insertions(+)

-- 
2.25.1

