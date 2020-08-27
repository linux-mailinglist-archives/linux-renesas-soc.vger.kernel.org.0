Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1BD02547B3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Aug 2020 16:53:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727963AbgH0OxZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Aug 2020 10:53:25 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:3877 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727980AbgH0OxV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Aug 2020 10:53:21 -0400
X-IronPort-AV: E=Sophos;i="5.76,359,1592838000"; 
   d="scan'208";a="55482013"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 27 Aug 2020 23:53:18 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 840DB40065C9;
        Thu, 27 Aug 2020 23:53:16 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH 0/2] r8a774e1 add fdp1 and cpuidle support
Date:   Thu, 27 Aug 2020 15:53:13 +0100
Message-Id: <20200827145315.26261-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

This series adds support for FDP1 and cpuidle support to R8A774E1
(RZ/G2H) SoC.

Cheers,
Prabhakar

Lad Prabhakar (1):
  arm64: dts: renesas: r8a774e1: Add cpuidle support for CA5x cores

Marian-Cristian Rotariu (1):
  arm64: dts: renesas: r8a774e1: Add FDP1 device nodes

 arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 50 +++++++++++++++++++++++
 1 file changed, 50 insertions(+)

-- 
2.17.1

