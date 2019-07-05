Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 903F560451
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jul 2019 12:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727907AbfGEKUh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 Jul 2019 06:20:37 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:60230 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727723AbfGEKUh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Jul 2019 06:20:37 -0400
X-IronPort-AV: E=Sophos;i="5.62,454,1554735600"; 
   d="scan'208";a="20644599"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 05 Jul 2019 19:20:35 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 5899F4004BA7;
        Fri,  5 Jul 2019 19:20:33 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 0/3] Add WLAN/BT support
Date:   Fri,  5 Jul 2019 11:15:17 +0100
Message-Id: <1562321720-18735-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This series adds WLAN/BT support for the HiHope RZ/G2M platform.

This patchset is based on renesas devel branch.

Biju Das (3):
  arm64: dts: renesas: hihope-common: Add PCA9654 I/O expander
  arm64: dts: renesas: hihope-common: Add BT support
  arm64: dts: renesas: hihope-common: Add WLAN support

 arch/arm64/boot/dts/renesas/hihope-common.dtsi | 78 ++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

-- 
2.7.4

