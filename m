Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A906144ECBF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 19:44:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235456AbhKLSrM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 13:47:12 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:46808 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229892AbhKLSrM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 13:47:12 -0500
X-IronPort-AV: E=Sophos;i="5.87,230,1631545200"; 
   d="scan'208";a="100101562"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 13 Nov 2021 03:44:19 +0900
Received: from localhost.localdomain (unknown [10.226.92.48])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id B3D9940D5E9A;
        Sat, 13 Nov 2021 03:44:16 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 0/4] Add RZ/G2L OSTM support
Date:   Fri, 12 Nov 2021 18:44:09 +0000
Message-Id: <20211112184413.4391-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to add Generic Timer Module (a.k.a OSTM) support
for RZ/G2L series.

OSTM modules needs to deassert the reset line before accessing
any registers.

v2->v3:
 * Added Geert's Rb tag
 * Make RENESAS_OSTM symbol visible.
 * Added reset_control_put() on error path.
 * enabled suppress_bind_attrs in ostm_device_driver structure
v1->v2:
 * Added of_reset_control_get_optional_exclusive API
 * Updated dt-bindings to use renesas,ostm
 * Added reset handling in ostm_init

Biju Das (4):
  reset: Add of_reset_control_get_optional_exclusive()
  dt-bindings: timer: renesas: ostm: Document Renesas RZ/G2L OSTM
  clocksource/drivers/renesas-ostm: Add RZ/G2L OSTM support
  clocksource/drivers/renesas,ostm: Make RENESAS_OSTM symbol visible

 .../bindings/timer/renesas,ostm.yaml          | 20 ++++++++--
 drivers/clocksource/Kconfig                   |  3 +-
 drivers/clocksource/renesas-ostm.c            | 39 ++++++++++++++++++-
 include/linux/reset.h                         | 20 ++++++++++
 4 files changed, 77 insertions(+), 5 deletions(-)

-- 
2.17.1

