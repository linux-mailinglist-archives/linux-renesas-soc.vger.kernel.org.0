Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4BA145634B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Nov 2021 20:18:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229644AbhKRTVe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Nov 2021 14:21:34 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:15992 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229632AbhKRTVd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Nov 2021 14:21:33 -0500
X-IronPort-AV: E=Sophos;i="5.87,245,1631545200"; 
   d="scan'208";a="101066051"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 19 Nov 2021 04:18:32 +0900
Received: from localhost.localdomain (unknown [10.226.93.19])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2B4DD40104F8;
        Fri, 19 Nov 2021 04:18:29 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/2] Enable RZ/G2L OSTM support
Date:   Thu, 18 Nov 2021 19:18:23 +0000
Message-Id: <20211118191826.2026-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to enable Generic Timer Module (a.k.a OSTM) support
for RZ/G2L SMARC platform.

This patch series is depend upon [1]
[1] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=579383

V1->V2:
 * dropped patch1 as it moved to [1]
 * Changed compatible string from rzg2l-ostm->renesas-ostm
 * Added Rb tag from Geert for som dtsi

Biju Das (2):
  arm64: dts: renesas: r9a07g044: Add OSTM nodes
  arm64: dts: renesas: rzg2l-smarc-som: Enable OSTM

 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    | 33 +++++++++++++++++++
 .../boot/dts/renesas/rzg2l-smarc-som.dtsi     |  8 +++++
 2 files changed, 41 insertions(+)

-- 
2.17.1

