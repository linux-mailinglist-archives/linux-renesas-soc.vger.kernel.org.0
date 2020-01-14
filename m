Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40DD613B556
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jan 2020 23:31:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728827AbgANWbP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Jan 2020 17:31:15 -0500
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:65186 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727073AbgANWbP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Jan 2020 17:31:15 -0500
X-Halon-ID: 807c6717-371d-11ea-b6d8-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p54ac5d7b.dip0.t-ipconnect.de [84.172.93.123])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 807c6717-371d-11ea-b6d8-005056917f90;
        Tue, 14 Jan 2020 23:30:55 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     linux-pm@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] thermal: rcar_{gen3_}thermal: Remove temperature bound
Date:   Tue, 14 Jan 2020 23:29:43 +0100
Message-Id: <20200114222945.3128250-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

This series removes the checks that the read out temperature are within 
the guaranteed operation limits described in the hardware manual. It has 
been discussed with the hardware guys and the judgement is that it's 
better to report a best effort temperature instead of failing -EIO.

Niklas Söderlund (2):
  thermal: rcar_thermal: Remove temperature bound
  thermal: rcar_gen3_thermal: Remove temperature bound

 drivers/thermal/rcar_gen3_thermal.c | 4 ----
 drivers/thermal/rcar_thermal.c      | 7 -------
 2 files changed, 11 deletions(-)

-- 
2.24.1

