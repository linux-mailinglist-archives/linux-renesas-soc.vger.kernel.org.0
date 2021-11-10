Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE7AB44BCEA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Nov 2021 09:32:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbhKJIeq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Nov 2021 03:34:46 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:41185 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229930AbhKJIeq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Nov 2021 03:34:46 -0500
X-IronPort-AV: E=Sophos;i="5.87,223,1631545200"; 
   d="scan'208";a="100084941"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 10 Nov 2021 17:31:58 +0900
Received: from localhost.localdomain (unknown [10.226.92.40])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B6E6040062CE;
        Wed, 10 Nov 2021 17:31:54 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Chris Brandt <chris.brandt@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/2] Add RZ/G2L OSTM support
Date:   Wed, 10 Nov 2021 08:31:50 +0000
Message-Id: <20211110083152.31144-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to add Generic Timer Module (a.k.a OSTM) support
for RZ/G2L series.

OSTM modules needs to deassert the reset line before accessing
any registers.

Biju Das (2):
  dt-bindings: timer: renesas: ostm: Document Renesas RZ/G2L OSTM
  clocksource/drivers/renesas-ostm: Add RZ/G2L OSTM support

 .../bindings/timer/renesas,ostm.yaml          | 29 +++++++++++---
 drivers/clocksource/renesas-ostm.c            | 38 +++++++++++++++++++
 2 files changed, 62 insertions(+), 5 deletions(-)

-- 
2.17.1

