Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C70682D5D69
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Dec 2020 15:24:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388187AbgLJOVM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Dec 2020 09:21:12 -0500
Received: from mail.iot.bzh ([51.75.236.24]:60213 "EHLO mail.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725947AbgLJOVL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 09:21:11 -0500
Received: from localhost.localdomain (lfbn-ren-1-2120-93.w92-167.abo.wanadoo.fr [92.167.199.93])
        by mail.iot.bzh (Postfix) with ESMTPSA id 122104009A;
        Thu, 10 Dec 2020 15:20:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; s=20180822;
        t=1607610030; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=chnL/ruqvm825+be/IcC17WsGiLu5ArAFnvu83FNCm4=;
        b=s/q21vbdXhW1O73i7I9EkENru+2mk5+2L/lAzRJwX0xDT2jcNfjULJLB6yayn7+9js2tJU
        VcJBQfS6zFkdz2BSDSXStIbARez1I0inBMVeVOoHWsu/9qlV0+zvMgxY4cm2eZZ9CQIjvR
        RaJFJWh7r+zdzO5Hh1eEu0l+yJxyrYY/I6Pz+H/pZvjkV4Zy+/5rjlH99XYrFbRWXCjTTH
        t4W8cz6yg1HXJQkOSFvBFJOuMc4xG/MBCTqzOQRkP2GS+t08Bc3Dlg7jIHrcLag+fCyam6
        b8fw56tGdWnevWkReXhFuFqzNN3IDEBXly+hSlLAr7vL39wwqI1ErgztN6pG+A==
From:   Julien Massot <julien.massot@iot.bzh>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Julien Massot <julien.massot@iot.bzh>
Subject: [PATCH 0/5] clk: renesas: Add MFIS clock
Date:   Thu, 10 Dec 2020 15:20:16 +0100
Message-Id: <20201210142021.163182-1-julien.massot@iot.bzh>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This series adds the missing MFIS clocks for most Reneas R-Car Gen3
SoCs. I have tested this series on E3, M3, and H3 based boards,
I don't have access to D3 nor V3 boards.

Julien Massot (5):
  clk: renesas: r8a7795: Add MFIS clock
  clk: renesas: r8a7796: Add MFIS clock
  clk: renesas: r8a77965: Add MFIS clock
  clk: renesas: r8a77990: Add MFIS clock
  clk: renesas: r8a77995: Add MFIS clock

 drivers/clk/renesas/r8a7795-cpg-mssr.c  | 1 +
 drivers/clk/renesas/r8a7796-cpg-mssr.c  | 1 +
 drivers/clk/renesas/r8a77965-cpg-mssr.c | 1 +
 drivers/clk/renesas/r8a77990-cpg-mssr.c | 1 +
 drivers/clk/renesas/r8a77995-cpg-mssr.c | 1 +
 5 files changed, 5 insertions(+)

-- 
2.29.2

