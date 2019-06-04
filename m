Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEBE334BBE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2019 17:15:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727982AbfFDPPk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Jun 2019 11:15:40 -0400
Received: from sauhun.de ([88.99.104.3]:47218 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727866AbfFDPPk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Jun 2019 11:15:40 -0400
Received: from localhost (p5486CF7A.dip0.t-ipconnect.de [84.134.207.122])
        by pokefinder.org (Postfix) with ESMTPSA id E0ED53E43C2;
        Tue,  4 Jun 2019 17:15:38 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/3] mmc: sdhi: improve HS400 quirk handling
Date:   Tue,  4 Jun 2019 17:15:27 +0200
Message-Id: <20190604151530.7023-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

There are some more SoCs which cannot handle HS400. Add them and clean up the
quirk handling a bit. So, patch 1 is suitable for stable, the rest isn't.

Note that I don't have that HW, so I am relying on the provided information.

Wolfram Sang (3):
  mmc: sdhi: disallow HS400 for M3-W ES1.2 and V3H
  mmc: sdhi: improve quirk descriptions
  mmc: sdhi: remove unneeded initialization

 drivers/mmc/host/renesas_sdhi_core.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

-- 
2.11.0

