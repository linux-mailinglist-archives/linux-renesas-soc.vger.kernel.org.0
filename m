Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43FAD3A3F73
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Jun 2021 11:47:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbhFKJtW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Jun 2021 05:49:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231511AbhFKJtP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jun 2021 05:49:15 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 740CCC0613A4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Jun 2021 02:47:17 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:2411:a261:8fe2:b47f])
        by xavier.telenet-ops.be with bizsmtp
        id FlnE2500M25eH3q01lnEKR; Fri, 11 Jun 2021 11:47:14 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lrdkv-00FcQP-Pt; Fri, 11 Jun 2021 11:47:13 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lrdku-00CZr8-Qp; Fri, 11 Jun 2021 11:47:12 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 4/4] Renesas DT binding updates for v5.14
Date:   Fri, 11 Jun 2021 11:47:04 +0200
Message-Id: <cover.1623403802.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623403793.git.geert+renesas@glider.be>
References: <cover.1623403793.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v5.14-tag1

for you to fetch changes up to 972f67be8929ac095df6a8bbce738b4f39e984cb:

  dt-bindings: power: renesas,rzg2l-sysc: Add DT binding documentation for SYSC controller (2021-06-10 15:26:49 +0200)

----------------------------------------------------------------
Renesas DT binding updates for v5.14

  - Document support for the new RZ/G2L, RZ/G2LC, and RZ/G2UL SoCs,
  - Document support for the new RZ/G2L SMARC EVK board.

----------------------------------------------------------------
Lad Prabhakar (4):
      dt-bindings: arm: renesas: Document Renesas RZ/G2UL SoC
      dt-bindings: arm: renesas: Document Renesas RZ/G2{L,LC} SoC variants
      dt-bindings: arm: renesas: Document SMARC EVK
      dt-bindings: power: renesas,rzg2l-sysc: Add DT binding documentation for SYSC controller

 Documentation/devicetree/bindings/arm/renesas.yaml | 18 +++++++
 .../bindings/power/renesas,rzg2l-sysc.yaml         | 63 ++++++++++++++++++++++
 2 files changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/renesas,rzg2l-sysc.yaml
