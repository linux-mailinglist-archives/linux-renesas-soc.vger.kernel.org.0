Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9919A2403E7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Aug 2020 11:22:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbgHJJWN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Aug 2020 05:22:13 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:35017 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725846AbgHJJWN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Aug 2020 05:22:13 -0400
X-IronPort-AV: E=Sophos;i="5.75,457,1589209200"; 
   d="scan'208";a="54286650"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 10 Aug 2020 18:22:11 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id DDF1E41EF40F;
        Mon, 10 Aug 2020 18:22:09 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] r8a774e1 add FCPF, FCPV and VSP nodes
Date:   Mon, 10 Aug 2020 10:22:06 +0100
Message-Id: <20200810092208.27320-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

This patch series adds FCPF, FCPV and VSP nodes to r8a774e1
SoC dtsi. Patches apply on top of series [1].

[1] https://patchwork.kernel.org/project/linux-renesas-soc/
    list/?series=319563

Cheers,
Prabhakar

Marian-Cristian Rotariu (2):
  arm64: dts: renesas: r8a774e1: Add FCPF and FCPV instances
  arm64: dts: renesas: r8a774e1: Add VSP instances

 arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 130 ++++++++++++++++++++++
 1 file changed, 130 insertions(+)

-- 
2.17.1

