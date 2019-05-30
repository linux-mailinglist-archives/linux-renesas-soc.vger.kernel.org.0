Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B91EF2FED7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 May 2019 17:05:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726045AbfE3PF2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 30 May 2019 11:05:28 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:52746 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725440AbfE3PF2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 May 2019 11:05:28 -0400
X-IronPort-AV: E=Sophos;i="5.60,531,1549897200"; 
   d="scan'208";a="17188366"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 31 May 2019 00:05:26 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id AE6DD4289E1C;
        Fri, 31 May 2019 00:05:23 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>, xu_shunji@hoperun.com,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 0/3] Add basic HiHope RZ/G2M board support
Date:   Thu, 30 May 2019 15:57:43 +0100
Message-Id: <1559228266-16724-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The HiHope RZ/G2M board from HopeRun consists of main board
(HopeRun HiHope RZ/G2M main board) and sub board(HopeRun 
HiHope RZ/G2M sub board). The HiHope RZ/G2M sub board sits
below the HiHope RZ/G2M main board.

This series adds the device trees to describe the HW configuration
of the HiHope RZ/G2M, with some basic support.

This patch series based on linux-next next-20190528.

Biju Das (3):
  arm64: dts: renesas: Add HiHope RZ/G2M main board support
  arm64: dts: renesas: hihope-common: Add pincontrol support to
    scif2/scif clock
  arm64: dts: renesas: Add HiHope RZ/G2M sub board support

 arch/arm64/boot/dts/renesas/Makefile               |  2 +
 arch/arm64/boot/dts/renesas/hihope-common.dtsi     | 53 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi    | 55 ++++++++++++++++++++++
 .../boot/dts/renesas/r8a774a1-hihope-rzg2m-ex.dts  | 15 ++++++
 .../boot/dts/renesas/r8a774a1-hihope-rzg2m.dts     | 26 ++++++++++
 5 files changed, 151 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/hihope-common.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m.dts

-- 
2.7.4

