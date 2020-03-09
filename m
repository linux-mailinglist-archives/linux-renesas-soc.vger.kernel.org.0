Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D953B17D96C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Mar 2020 07:49:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726071AbgCIGti (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Mar 2020 02:49:38 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:39043 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725796AbgCIGti (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Mar 2020 02:49:38 -0400
X-IronPort-AV: E=Sophos;i="5.70,532,1574089200"; 
   d="scan'208";a="41144967"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 09 Mar 2020 15:49:36 +0900
Received: from localhost.localdomain (unknown [10.166.15.86])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8803A4004BB3;
        Mon,  9 Mar 2020 15:49:36 +0900 (JST)
From:   Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
Subject: [PATCH 0/2] arm64: dts: renesas: Add support for M3ULCB with R-Car M3-W+
Date:   Mon,  9 Mar 2020 15:44:23 +0900
Message-Id: <20200309064425.25437-1-yuya.hamamachi.sx@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patchset adds devicetree for new M3ULCB board equipped with R-Car
M3-W+ (R8A77961) SoC.

Yuya Hamamachi (2):
  dt-bindings: arm: renesas: Add M3ULCB with R-Car M3-W+
  arm64: dts: renesas: Add support for M3ULCB with R-Car M3-W+

 .../devicetree/bindings/arm/renesas.yaml      |  1 +
 arch/arm64/boot/dts/renesas/Makefile          |  1 +
 arch/arm64/boot/dts/renesas/r8a77961-ulcb.dts | 31 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77961.dtsi     |  1 +
 4 files changed, 34 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77961-ulcb.dts

-- 
2.25.1

