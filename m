Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 524592306C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 May 2019 11:35:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728000AbfETJfH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 May 2019 05:35:07 -0400
Received: from sauhun.de ([88.99.104.3]:49542 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725601AbfETJfH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 May 2019 05:35:07 -0400
Received: from localhost (p54B333DA.dip0.t-ipconnect.de [84.179.51.218])
        by pokefinder.org (Postfix) with ESMTPSA id B95CF2C2761;
        Mon, 20 May 2019 11:35:05 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-kernel@vger.kernel.org
Cc:     Mark Brown <broonie@kernel.org>, linux-renesas-soc@vger.kernel.org,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH RESEND 0/3] regulator: da9063 updates
Date:   Mon, 20 May 2019 11:34:43 +0200
Message-Id: <20190520093446.30895-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This series removes the unused pdata interface and moves some defines
from the pdata header into the driver. Last time, a similar and bigger
da9063 series was meant to go in via MFD. This resend, however, was
rebased to v5.2-rc1 and regrouped, so it can go in via the regulaor tree
directly.

Wolfram Sang (3):
  regulator: da9063: remove platform_data support
  regulator: da9063: move definitions out of a header into the driver
  regulator: da9063: platform_data is gone, depend on OF

 drivers/regulator/Kconfig            |  2 +-
 drivers/regulator/da9063-regulator.c | 61 ++++++++++++++++++++--------
 include/linux/mfd/da9063/pdata.h     | 49 ----------------------
 3 files changed, 45 insertions(+), 67 deletions(-)

-- 
2.19.1

