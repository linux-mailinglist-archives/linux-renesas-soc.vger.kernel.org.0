Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 952B54A01FF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jan 2022 21:38:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237297AbiA1Uim (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Jan 2022 15:38:42 -0500
Received: from mxout01.lancloud.ru ([45.84.86.81]:37002 "EHLO
        mxout01.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231166AbiA1Uim (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Jan 2022 15:38:42 -0500
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru 2894C20AB5F2
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, <netdev@vger.kernel.org>
CC:     <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH 0/2] Kill some dead code in the Renesas Ethernet drivers
Date:   Fri, 28 Jan 2022 23:38:36 +0300
Message-ID: <20220128203838.17423-1-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Here are 2 patches against DaveM's 'net-next.git' repo. The Renesas drivers
call their ndo_stop() methods directly and they always return 0, making the
result checks pointless, hence remove them...

Sergey Shtylyov (2):
  ravb: ravb_close() always returns 0
  sh_eth: sh_eth_close() always returns 0

 drivers/net/ethernet/renesas/ravb_main.c | 4 +---
 drivers/net/ethernet/renesas/sh_eth.c    | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

-- 
2.26.3

