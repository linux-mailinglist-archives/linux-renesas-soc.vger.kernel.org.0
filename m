Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F33D8223A77
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jul 2020 13:24:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726233AbgGQLYs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jul 2020 07:24:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726229AbgGQLYs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jul 2020 07:24:48 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 137D1C061755
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jul 2020 04:24:47 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by xavier.telenet-ops.be with bizsmtp
        id 4BQk2300C4C55Sk01BQkxg; Fri, 17 Jul 2020 13:24:46 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jwOTs-00026L-Fh; Fri, 17 Jul 2020 13:24:44 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jwOTs-0006nV-E9; Fri, 17 Jul 2020 13:24:44 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/3] Renesas DT binding updates for v5.9
Date:   Fri, 17 Jul 2020 13:24:27 +0200
Message-Id: <20200717112427.26032-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200717112427.26032-1-geert+renesas@glider.be>
References: <20200717112427.26032-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v5.9-tag1

for you to fetch changes up to 8210a6c057703b15d75f6bb841e7611726c4a551:

  dt-bindings: arm: renesas: Document beacon-rzg2m (2020-07-16 10:25:24 +0200)

----------------------------------------------------------------
Renesas DT binding updates for v5.9

  - Document core support for the RZ/G2H SoC,
  - Document support for the HopeRun HiHope RZ/G2H, and Beacon
    EmbeddedWorks RZ/G2M boards.

----------------------------------------------------------------
Adam Ford (1):
      dt-bindings: arm: renesas: Document beacon-rzg2m

Marian-Cristian Rotariu (4):
      dt-bindings: arm: renesas: Document RZ/G2H SoC DT bindings
      dt-bindings: arm: renesas: Add HopeRun RZ/G2H boards
      dt-bindings: power: renesas,rcar-sysc: Document r8a774e1 SYSC binding
      dt-bindings: reset: renesas,rst: Document r8a774e1 reset module

 Documentation/devicetree/bindings/arm/renesas.yaml          | 13 +++++++++++++
 .../devicetree/bindings/power/renesas,rcar-sysc.yaml        |  1 +
 Documentation/devicetree/bindings/reset/renesas,rst.yaml    |  1 +
 3 files changed, 15 insertions(+)
