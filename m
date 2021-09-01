Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 590C83FD880
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Sep 2021 13:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241796AbhIALOJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Sep 2021 07:14:09 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:19484 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S241803AbhIALOJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Sep 2021 07:14:09 -0400
X-IronPort-AV: E=Sophos;i="5.84,369,1620658800"; 
   d="scan'208";a="92601866"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 01 Sep 2021 20:13:11 +0900
Received: from localhost.localdomain (unknown [10.166.14.185])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id A1F1F44258F1;
        Wed,  1 Sep 2021 20:13:11 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] arm64: dts: renesas: r8a779a0: Add initial IPMMU support
Date:   Wed,  1 Sep 2021 20:13:03 +0900
Message-Id: <20210901111305.570206-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch add initial IPMMU support. The dt-binding doc for
renesas,ipmmu-r8a779a0 is under review now [1]

[1]
https://lore.kernel.org/linux-renesas-soc/20210901102705.556093-1-yoshihiro.shimoda.uh@renesas.com/

Yoshihiro Shimoda (2):
  arm64: dts: renesas: r8a779a0: Add IPMMU nodes
  arm64: dts: renesas: r8a779a0: Add iommus into sdhi node

 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 98 +++++++++++++++++++++++
 1 file changed, 98 insertions(+)

-- 
2.25.1

