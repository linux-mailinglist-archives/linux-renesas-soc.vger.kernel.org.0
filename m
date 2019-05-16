Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DB1020228
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 May 2019 11:06:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbfEPJGs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 May 2019 05:06:48 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:58069 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726537AbfEPJGs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 May 2019 05:06:48 -0400
X-IronPort-AV: E=Sophos;i="5.60,476,1549897200"; 
   d="scan'208";a="16122335"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 16 May 2019 18:06:46 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 45AB642BEB8E;
        Thu, 16 May 2019 18:06:44 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 0/2] Add WLAN/BT support
Date:   Thu, 16 May 2019 09:59:24 +0100
Message-Id: <1557997166-63351-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This series adds WLAN/BT support for the CAT874 platform.

This patchset is based on renesas dev branch.

Biju Das (2):
  arm64: dts: renesas: r8a774c0-cat874: Add WLAN support
  arm64: dts: renesas: r8a774c0-cat874: Add BT support

 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 57 +++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

-- 
2.7.4

