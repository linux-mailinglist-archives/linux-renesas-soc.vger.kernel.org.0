Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2F832F847
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 May 2019 10:08:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727448AbfE3IIJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 30 May 2019 04:08:09 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:10400 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726945AbfE3IIJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 May 2019 04:08:09 -0400
X-IronPort-AV: E=Sophos;i="5.60,530,1549897200"; 
   d="scan'208";a="17162390"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 30 May 2019 17:08:06 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4AAB94005E32;
        Thu, 30 May 2019 17:08:04 +0900 (JST)
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
Subject: [PATCH 0/2] Fix SDR50 on iwg20d and iwg23s
Date:   Thu, 30 May 2019 09:07:53 +0100
Message-Id: <1559203675-19675-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dear All,

SDR50 has been broken on both the iwg20d and the iwg23s since
commit d6cd33ad7102 ("regulator: gpio: Convert to use descriptors").
Other Renesas' platforms may be affected as well due
to the lack of property enable-active-high.
This patch series fixes the problem with the iWave platforms.

Thanks,
Fab

Fabrizio Castro (2):
  ARM: dts: iwg20d-q7-common: Fix SDHI1 VccQ regularor
  ARM: dts: iwg23s-sbc: Fix SDHI2 VccQ regulator

 arch/arm/boot/dts/iwg20d-q7-common.dtsi   | 4 +++-
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.7.4

