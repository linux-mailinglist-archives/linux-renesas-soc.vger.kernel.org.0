Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93B20240A87
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Aug 2020 17:43:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728181AbgHJPW3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Aug 2020 11:22:29 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:5536 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727801AbgHJPW2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Aug 2020 11:22:28 -0400
X-IronPort-AV: E=Sophos;i="5.75,457,1589209200"; 
   d="scan'208";a="54088449"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 11 Aug 2020 00:22:27 +0900
Received: from localhost.localdomain (unknown [172.29.52.120])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 539274001958;
        Tue, 11 Aug 2020 00:22:23 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Maxime Ripard <mripard@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 0/3] Add optional regulator support for LVDS codec.
Date:   Mon, 10 Aug 2020 16:22:16 +0100
Message-Id: <20200810152219.6254-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series add support for enabling optional regulator for LVDS
codec bridge driver that may be used as VCC source.

Ref:https://patchwork.kernel.org/patch/11705819/

Biju Das (3):
  dt-bindings: display: bridge: lvds-codec: Document vcc-supply property
  drm/bridge: lvds-codec: Add support for regulator
  ARM: dts: iwg20d-q7-common: Fix touch controller probe failure

 .../bindings/display/bridge/lvds-codec.yaml   |  3 ++
 arch/arm/boot/dts/iwg20d-q7-common.dtsi       | 14 +++++++++
 drivers/gpu/drm/bridge/lvds-codec.c           | 29 +++++++++++++++++++
 3 files changed, 46 insertions(+)

-- 
2.17.1

