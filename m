Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D205296AAF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Oct 2020 09:56:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S369877AbgJWHz4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Oct 2020 03:55:56 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:6879 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S369745AbgJWHz4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Oct 2020 03:55:56 -0400
X-IronPort-AV: E=Sophos;i="5.77,407,1596466800"; 
   d="scan'208";a="60599238"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 23 Oct 2020 16:55:54 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0271640083E0;
        Fri, 23 Oct 2020 16:55:51 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH 0/2] RZ/G2x add optee node
Date:   Fri, 23 Oct 2020 08:55:28 +0100
Message-Id: <20201023075530.19295-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

This patch series adds optee node to HiHope RZ/G2{HMN} and EK874 boards.

This patch series applies on top of [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/
    renesas-devel.git/log/?h=renesas-arm-dt-for-v5.11

Cheers,
Prabhakar

Lad Prabhakar (2):
  arm64: dts: renesas: hihope-common: Add optee node
  arm64: dts: renesas: r8a774c0-ek874: Add optee node

 arch/arm64/boot/dts/renesas/hihope-common.dtsi | 7 +++++++
 arch/arm64/boot/dts/renesas/r8a774c0-ek874.dts | 7 +++++++
 2 files changed, 14 insertions(+)

-- 
2.17.1

