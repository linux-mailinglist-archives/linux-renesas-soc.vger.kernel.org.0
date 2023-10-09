Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E3637BD752
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Oct 2023 11:39:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345972AbjJIJjw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Oct 2023 05:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345978AbjJIJju (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Oct 2023 05:39:50 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDDDEA2;
        Mon,  9 Oct 2023 02:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1696844384; x=1728380384;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZRuE2tSMRuMJGGwfwdNw7XZT5KskCOTB/yFjYNEOofk=;
  b=1+ZHjXBdCcQskbYR7U5zn3sbfyzY5o7SGXRI3iQTBiJHo6V8HXF6/M5g
   sVlD57zHsHNcgPLY9/FAhrDEahj4QKObT87mnSo0QEaQ0nV/DLhLGumfV
   gFMJuHlzZo32uwFzDNZi+lvCWvTrzX+0AnQCxhZjaEkqjKX0W8qVjPWzz
   AEwBgJq9wNjFUwzRPDrN6Szl4HcOBgN334fzpU09u08yf3mAz8sYkEnKm
   Vyeab4D1yFbBzhxs0s7HJclK6uEXWDyNPi3Uw97HuYAk48Ot5uQ5/LDvR
   8oVwkIgQozKv5otFod6Fs14IU+AY6XQH97ZNj2UMnyLakI3CLxpkAuzUZ
   w==;
X-CSE-ConnectionGUID: K9WVynclRKmZ6/s6ZtJcJQ==
X-CSE-MsgGUID: XkssOkC9QNO6ufR14eLWEg==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="9639644"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2023 02:39:43 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 9 Oct 2023 02:39:43 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 9 Oct 2023 02:39:38 -0700
From:   Conor Dooley <conor.dooley@microchip.com>
To:     <linux-riscv@lists.indradead.org>
CC:     <conor@kernel.org>, <conor.dooley@microchip.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Paul Walmsley" <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Chen-Yu Tsai <wens@csie.org>,
        "Jernej Skrabec" <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "Emil Renner Berthing" <kernel@esmil.dk>,
        Jisheng Zhang <jszhang@kernel.org>,
        Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-sunxi@lists.linux.dev>, <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH v3 0/6] riscv,isa-extensions additions
Date:   Mon, 9 Oct 2023 10:37:44 +0100
Message-ID: <20231009-approve-verbalize-ce9324858e76@wendy>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2459; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=ZRuE2tSMRuMJGGwfwdNw7XZT5KskCOTB/yFjYNEOofk=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKnKJ1+YKRm3TZbcu+zn6U3vXaa0zL/3fPKtO/kZT/7M1L2u /Pjp245SFgYxDgZZMUWWxNt9LVLr/7jscO55CzOHlQlkCAMXpwBMZG4Cw1+5ROlyZoWrsxIPLw9g7k 8IWbBImnFj0vbZnLwVMnXvrdQY/mmsfVrxujRg2duifs4tPX9PnTogdpr/0ief7d9NJPI0MpgA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Now with the RFC tag dropped. There are no changes here from "RFC v2",
other than the addition of tags that were provided along the way. I have
not added "Zfh" to the T-Head based stuff, as I can't actually read the
documentation that would show that they're encoding-for-encoding
compatible with the standard extension, since it is apparently only in
Chinese.

The canaan stuff is absent here, mostly because I don't actually know
what to do with it. They don't actually implement the same versions of
the F stuff as everyone else (Stefan O'Rear pointed that out to me
somewhere recently).

Cheers,
Conor.

CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Albert Ou <aou@eecs.berkeley.edu>
CC: Chen-Yu Tsai <wens@csie.org>
CC: Jernej Skrabec <jernej.skrabec@gmail.com>
CC: Samuel Holland <samuel@sholland.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Magnus Damm <magnus.damm@gmail.com>
CC: Emil Renner Berthing <kernel@esmil.dk>
CC: Jisheng Zhang <jszhang@kernel.org>
CC: Guo Ren <guoren@kernel.org>
CC: Fu Wei <wefu@redhat.com>
CC: Chen Wang <unicorn_wang@outlook.com>
CC: devicetree@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: linux-sunxi@lists.linux.dev
CC: linux-renesas-soc@vger.kernel.org

Conor Dooley (6):
  riscv: dts: microchip: convert isa detection to new properties
  riscv: dts: sifive: convert isa detection to new properties
  riscv: dts: starfive: convert isa detection to new properties
  riscv: dts: renesas: convert isa detection to new properties
  riscv: dts: allwinner: convert isa detection to new properties
  riscv: dts: thead: convert isa detection to new properties

 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi |  3 +++
 arch/riscv/boot/dts/microchip/mpfs.dtsi       | 15 +++++++++++++++
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi   |  3 +++
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi    | 15 +++++++++++++++
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi    | 15 +++++++++++++++
 arch/riscv/boot/dts/starfive/jh7100.dtsi      |  6 ++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 15 +++++++++++++++
 arch/riscv/boot/dts/thead/th1520.dtsi         | 12 ++++++++++++
 8 files changed, 84 insertions(+)

-- 
2.40.1

