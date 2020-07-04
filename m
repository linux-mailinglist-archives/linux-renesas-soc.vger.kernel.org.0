Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8878F214725
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jul 2020 17:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbgGDP7U (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 4 Jul 2020 11:59:20 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:28307 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726638AbgGDP7U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 4 Jul 2020 11:59:20 -0400
X-Halon-ID: 4df20748-be0f-11ea-8fb8-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2eca.dip0.t-ipconnect.de [79.202.46.202])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 4df20748-be0f-11ea-8fb8-005056917f90;
        Sat, 04 Jul 2020 17:59:18 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     linux-renesas-soc@vger.kernel.org
Cc:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] ARM: dts: renesas: Cleanup ADV7180 bindings
Date:   Sat,  4 Jul 2020 17:58:54 +0200
Message-Id: <20200704155856.3037010-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

While converting the ADV7180 bindings to YAML and running the checker on 
the Renesas DTS files some issues where found. I guess all this 
conversion of bindings can pay off :-)

Niklas Söderlund (2):
  ARM: dts: gose: Fix ports node name for adv7180
  ARM: dts: renesas: Remove unused remote property from adv7180 nodes

 arch/arm/boot/dts/r8a7790-lager.dts   | 1 -
 arch/arm/boot/dts/r8a7791-koelsch.dts | 1 -
 arch/arm/boot/dts/r8a7791-porter.dts  | 1 -
 arch/arm/boot/dts/r8a7793-gose.dts    | 3 +--
 arch/arm/boot/dts/r8a7794-alt.dts     | 1 -
 arch/arm/boot/dts/r8a7794-silk.dts    | 1 -
 6 files changed, 1 insertion(+), 7 deletions(-)

-- 
2.27.0

