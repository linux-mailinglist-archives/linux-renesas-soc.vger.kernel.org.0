Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1A371E30CE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2020 23:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389572AbgEZVBz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 May 2020 17:01:55 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:12474 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2389124AbgEZVBz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 May 2020 17:01:55 -0400
X-IronPort-AV: E=Sophos;i="5.73,437,1583161200"; 
   d="scan'208";a="47867520"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 27 May 2020 06:01:53 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8B82C40DAAC6;
        Wed, 27 May 2020 06:01:50 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     alsa-devel@alsa-project.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] RZ/G1H enable sound support
Date:   Tue, 26 May 2020 22:01:42 +0100
Message-Id: <1590526904-13855-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

This patch series adds support for sound in R8A7742 SoC DT.

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: ASoC: renesas,rsnd: Add r8a7742 support
  ARM: dts: r8a7742: Add audio support

 .../devicetree/bindings/sound/renesas,rsnd.txt     |   1 +
 arch/arm/boot/dts/r8a7742.dtsi                     | 284 +++++++++++++++++++++
 2 files changed, 285 insertions(+)

-- 
2.7.4

