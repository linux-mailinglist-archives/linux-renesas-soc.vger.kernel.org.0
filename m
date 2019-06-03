Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDE5832D34
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2019 11:53:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbfFCJx7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Jun 2019 05:53:59 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:23805 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726025AbfFCJx6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Jun 2019 05:53:58 -0400
X-IronPort-AV: E=Sophos;i="5.60,546,1549897200"; 
   d="scan'208";a="17681638"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 03 Jun 2019 18:53:56 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 89E52424237D;
        Mon,  3 Jun 2019 18:53:54 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v2 0/2] Fix SDR50 on iwg20d and iwg23s
Date:   Mon,  3 Jun 2019 10:53:50 +0100
Message-Id: <1559555632-2258-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dear All,

SDR50 has been broken on both the iwg20d and the iwg23s since
commit d6cd33ad7102 ("regulator: gpio: Convert to use descriptors").
This patch series fixes the problem with the iWave platforms.

v1->v2:
* Removed enable-active-high property

Thanks,
Fab

Fabrizio Castro (2):
  ARM: dts: iwg20d-q7-common: Fix SDHI1 VccQ regularor
  ARM: dts: iwg23s-sbc: Fix SDHI2 VccQ regulator

 arch/arm/boot/dts/iwg20d-q7-common.dtsi   | 2 +-
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.7.4

