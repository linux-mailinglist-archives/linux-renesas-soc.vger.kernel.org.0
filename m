Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C5FFEC63C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Nov 2019 16:58:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbfKAP67 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Nov 2019 11:58:59 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:45780 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726710AbfKAP66 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Nov 2019 11:58:58 -0400
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id Lfyu210115USYZQ01fyuaP; Fri, 01 Nov 2019 16:58:56 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iQZKA-0002ri-BY; Fri, 01 Nov 2019 16:58:54 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iQZKA-0008Ci-Ag; Fri, 01 Nov 2019 16:58:54 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 6/6] Renesas DT binding updates for v5.5 (take two)
Date:   Fri,  1 Nov 2019 16:58:42 +0100
Message-Id: <20191101155842.31467-7-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191101155842.31467-1-geert+renesas@glider.be>
References: <20191101155842.31467-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 4d3cae42544775c71521e8ed5adb64c1839036b9:

  dt-bindings: reset: rcar-rst: Document r8a774b1 reset module (2019-10-01 09:52:34 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v5.5-tag2

for you to fetch changes up to e7f1eb321b1a8497c5ddd59303c18864a95ab8bd:

  dt-bindings: power: rcar-sysc: Document r8a77961 support (2019-11-01 11:54:01 +0100)

----------------------------------------------------------------
Renesas DT binding updates for v5.5 (take two)

  - JSON schema conversion,
  - Core support for the new R-Car M3-W+ (r8a77961) SoC,
  - Board compatible updates.

----------------------------------------------------------------
Geert Uytterhoeven (5):
      dt-bindings: arm: renesas: Add R-Car M3-N ULCB with Kingfisher
      dt-bindings: arm: renesas: Document R-Car M3-W+ SoC DT bindings
      dt-bindings: arm: renesas: Add Salvator-XS board with R-Car M3-W+
      dt-bindings: reset: rcar-rst: Document r8a77961 support
      dt-bindings: power: rcar-sysc: Document r8a77961 support

Simon Horman (1):
      dt-bindings: arm: renesas: Convert 'renesas,prr' to json-schema

 .../devicetree/bindings/arm/renesas,prr.txt        | 20 -------------
 .../devicetree/bindings/arm/renesas,prr.yaml       | 35 ++++++++++++++++++++++
 Documentation/devicetree/bindings/arm/renesas.yaml |  8 +++++
 .../bindings/power/renesas,rcar-sysc.txt           |  1 +
 .../devicetree/bindings/reset/renesas,rst.txt      |  1 +
 5 files changed, 45 insertions(+), 20 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/renesas,prr.txt
 create mode 100644 Documentation/devicetree/bindings/arm/renesas,prr.yaml
