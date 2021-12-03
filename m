Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C88994676BF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Dec 2021 12:52:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380581AbhLCLzZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 Dec 2021 06:55:25 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:36104 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231944AbhLCLzY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Dec 2021 06:55:24 -0500
X-IronPort-AV: E=Sophos;i="5.87,284,1631545200"; 
   d="scan'208";a="102706750"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 03 Dec 2021 20:51:59 +0900
Received: from localhost.localdomain (unknown [10.226.93.66])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id DF7CD40165B1;
        Fri,  3 Dec 2021 20:51:56 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/6] Add Mali-G31 GPU support for RZ/G2L SoC
Date:   Fri,  3 Dec 2021 11:51:48 +0000
Message-Id: <20211203115154.31864-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

RZ/G2L SoC embeds Mali-G31 bifrost GPU.
This patch series aims to add support for the same

It is tested with latest drm-misc-next + mesa21.3.0 + 
out of tree patch for (du + DSI) + mesa configurtion for RZ/G2L.

Tested the kmscube application.

test logs:-
root@smarc-rzg2l:~# kmscube
Using display 0xaaaadb6e7d30 with EGL version 1.4
===================================
EGL information:
  version: "1.4"
  vendor: "Mesa Project"
.....
===================================
OpenGL ES 2.x information:
  version: "OpenGL ES 3.1 Mesa 21.3.0"
  shading language version: "OpenGL ES GLSL ES 3.10"
  vendor: "Panfrost"
  renderer: "Mali-G31 (Panfrost)"
  ....
===================================
^C
root@smarc-rzg2l:~# cat /proc/interrupts | grep gpu
 84:          8          0     GICv3 185 Level     panfrost-gpu
root@smarc-rzg2l:~# cat /proc/interrupts | grep panfrost
 82:     587287          0     GICv3 186 Level     panfrost-job
 83:          2          0     GICv3 187 Level     panfrost-mmu
 84:          8          0     GICv3 185 Level     panfrost-gpu

root@smarc-rzg2l:~# cat /sys/class/devfreq/11840000.gpu/trans_stat
     From  :   To
           :  50000000  62500000 100000000 125000000 200000000 250000000 400000000 500000000   time(ms)
*  50000000:         0         0         0         0         0         0         0         0        72
   62500000:         0         0         0         0         0         0         0         0         0
  100000000:         0         0         0         0         0         0         0         0         0
  125000000:         0         0         0         0         0         0         0         1        68
  200000000:         0         0         0         0         0         0         0         1        68
  250000000:         1         0         0         0         0         0         0         0        84
  400000000:         0         0         0         0         0         0         0         0         0
  500000000:         0         0         0         1         1         1         0         0       736
Total transition : 6
root@smarc-rzg2l:~# kmscube
Using display 0xaaaaf7a421b0 with EGL version 1.4
===================================
EGL information:
  version: "1.4"
  vendor: "Mesa Project"
  .....
===================================
OpenGL ES 2.x information:
  version: "OpenGL ES 3.1 Mesa 21.3.0"
  shading language version: "OpenGL ES GLSL ES 3.10"
  vendor: "Panfrost"
  renderer: "Mali-G31 (Panfrost)"
  ......
===================================

root@smarc-rzg2l:~#
root@smarc-rzg2l:~#
root@smarc-rzg2l:~# cat /sys/class/devfreq/11840000.gpu/trans_stat
     From  :   To
           :  50000000  62500000 100000000 125000000 200000000 250000000 400000000 500000000   time(ms)
*  50000000:         0         0         0         0         0         0         0         1       144
   62500000:         0         0         0         0         0         0         0         0         0
  100000000:         0         0         0         0         0         0         0         9       524
  125000000:         0         0         9         0         0         0         0         3      2544
  200000000:         0         0         0        11         0         0         0        46      3304
  250000000:         1         0         0         0        33         0         0         0      7496
  400000000:         0         0         0         0        16        19         0         0      2024
  500000000:         1         0         0         1         8        15        35         0      4032
Total transition : 208

Mesa patch for RZ/G2L
---------------------
src/gallium/targets/dri/meson.build
+               'rcar-du_dri.so',
src/gallium/targets/dri/target.c
+DEFINE_LOADER_DRM_ENTRYPOINT(rcar_du)

Biju Das (6):
  clk: renesas: r9a07g044: Rename CLK_PLL3_DIV4 macro
  clk: renesas: r9a07g044: Add mux and divider for G clock
  clk: renesas: r9a07g044: Add GPU clock and reset entries
  dt-bindings: gpu: mali-bifrost: Document RZ/G2L support
  arm64: dts: renesas: r9a07g044: Add Mali-G31 GPU node
  arm64: dts: renesas: rzg2l-smarc-som: Add vdd core regulator

 .../bindings/gpu/arm,mali-bifrost.yaml        | 32 +++++++++-
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    | 64 +++++++++++++++++++
 .../boot/dts/renesas/rzg2l-smarc-som.dtsi     | 13 ++++
 drivers/clk/renesas/r9a07g044-cpg.c           | 19 +++++-
 drivers/clk/renesas/rzg2l-cpg.h               |  4 ++
 5 files changed, 128 insertions(+), 4 deletions(-)

-- 
2.17.1

