Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 119342C3A3C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Nov 2020 08:42:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727952AbgKYHmP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Nov 2020 02:42:15 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:28181 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726985AbgKYHmO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Nov 2020 02:42:14 -0500
X-IronPort-AV: E=Sophos;i="5.78,368,1599490800"; 
   d="scan'208";a="63606756"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 25 Nov 2020 16:37:10 +0900
Received: from localhost.localdomain (unknown [10.166.15.86])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id CF09E400964E;
        Wed, 25 Nov 2020 16:37:10 +0900 (JST)
From:   Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
To:     linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Add PCIe EP to R-Car H3
Date:   Wed, 25 Nov 2020 16:33:01 +0900
Message-Id: <20201125073303.19057-1-yuya.hamamachi.sx@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patchset adds support for PCIe EP nodes to Renesas r8a77951 SoC.
This is based on patch series "Add PCIe EP to RZ/G2H [1]".

[1] https://lkml.org/lkml/2020/9/4/400

Yuya Hamamachi (2):
  dt-bindings: pci: rcar-pci-ep: Document r8a7795
  arm64: dts: renesas: r8a77951: Add PCIe EP nodes

 .../devicetree/bindings/pci/rcar-pci-ep.yaml  |  1 +
 arch/arm64/boot/dts/renesas/r8a77951.dtsi     | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)

-- 
2.25.1

