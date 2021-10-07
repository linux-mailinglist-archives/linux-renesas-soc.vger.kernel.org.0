Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE81642572A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Oct 2021 17:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242117AbhJGP4v (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Oct 2021 11:56:51 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:1473 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232589AbhJGP4v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Oct 2021 11:56:51 -0400
X-IronPort-AV: E=Sophos;i="5.85,355,1624287600"; 
   d="scan'208";a="96455056"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 08 Oct 2021 00:54:55 +0900
Received: from localhost.localdomain (unknown [10.226.93.49])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id DD586400F5C6;
        Fri,  8 Oct 2021 00:54:53 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/3] Add eMMC/Micro SD support
Date:   Thu,  7 Oct 2021 16:54:48 +0100
Message-Id: <20211007155451.10654-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to add eMMC/Micro SD support on RZ/G2L SMARC EVK
platform.

This patch series has dependency upon [1]
[1] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=559045

Biju Das (3):
  arm64: dts: renesas: r9a07g044: Add SDHI nodes
  arm64: dts: renesas: rzg2l-smarc-som: Enable eMMC on SMARC platform
  arm64: dts: renesas: rzg2l-smarc: Enable microSD on SMARC platform

 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    |  32 ++++
 .../boot/dts/renesas/rzg2l-smarc-som.dtsi     | 145 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  |  62 ++++++++
 3 files changed, 239 insertions(+)

-- 
2.17.1

