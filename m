Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DD211A4560
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2020 12:47:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbgDJKrn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Apr 2020 06:47:43 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:28960 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725955AbgDJKrn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Apr 2020 06:47:43 -0400
X-IronPort-AV: E=Sophos;i="5.72,366,1580742000"; 
   d="scan'208";a="44372300"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 10 Apr 2020 19:47:42 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 93F0642105A8;
        Fri, 10 Apr 2020 19:47:42 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC 0/2] arm64: dts: renesas: add some device nodes for r8a77961
Date:   Fri, 10 Apr 2020 19:47:12 +0900
Message-Id: <1586515634-28095-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series is based on renesas-devel / renesas-arm64-dt-for-v5.8
branch. Since the dt-bindings for these device nodes are submitting now [1],
I marked RFC on this patch series.

[1]
https://patchwork.kernel.org/patch/11483041/
https://patchwork.kernel.org/patch/11483045/


Yoshihiro Shimoda (2):
  arm64: dts: renesas: add PWM device nodes for r8a77961
  arm64: dts: renesas: add PCIe device nodes for r8a77961

 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 114 +++++++++++++++++++++++++++++-
 1 file changed, 111 insertions(+), 3 deletions(-)

-- 
2.7.4

