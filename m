Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F6D737303
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 13:35:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727703AbfFFLfv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 07:35:51 -0400
Received: from sauhun.de ([88.99.104.3]:33832 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727089AbfFFLfv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 07:35:51 -0400
Received: from localhost (p5486CDEB.dip0.t-ipconnect.de [84.134.205.235])
        by pokefinder.org (Postfix) with ESMTPSA id 90A342C35BF;
        Thu,  6 Jun 2019 13:35:48 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 0/3] mmc: sdhi: improve HS400 quirk handling
Date:   Thu,  6 Jun 2019 13:35:34 +0200
Message-Id: <20190606113537.8869-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

There are some more SoCs which cannot handle HS400. Add them and clean up the
quirk handling a bit. So, patch 1 is suitable for stable, the rest isn't.

Note that I don't have that HW, so I am relying on the provided information.

Changes since v1 (thanks Geert and Fabrizio!):
	* use '[012]' to specify the range instead of single entries
	* add RZ/G2M to the list

Wolfram Sang (3):
  mmc: sdhi: disallow HS400 for M3-W ES1.2, RZ/G2M, and V3H
  mmc: sdhi: improve quirk descriptions
  mmc: sdhi: remove unneeded initialization

 drivers/mmc/host/renesas_sdhi_core.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

-- 
2.11.0

