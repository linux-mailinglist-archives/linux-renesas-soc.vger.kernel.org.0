Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69AC2187038
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2020 17:39:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732144AbgCPQjN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Mar 2020 12:39:13 -0400
Received: from sauhun.de ([88.99.104.3]:54440 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732044AbgCPQjM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Mar 2020 12:39:12 -0400
Received: from localhost (p54B334BA.dip0.t-ipconnect.de [84.179.52.186])
        by pokefinder.org (Postfix) with ESMTPSA id 3535D2C0887;
        Mon, 16 Mar 2020 17:39:11 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dave Airlie <airlied@redhat.com>,
        Francisco Jerez <currojerez@riseup.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] drm: encoder_slave: some updates
Date:   Mon, 16 Mar 2020 17:39:05 +0100
Message-Id: <20200316163907.13709-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

While converting I2C users to new APIs, I found a refcounting problem in
the encoder_slave implementation. This series fixes it and converts to
the new API.

Based on linux-next and only build tested.

Wolfram Sang (2):
  drm: encoder_slave: fix refcouting error for modules
  drm: encoder_slave: use new I2C API

 drivers/gpu/drm/drm_encoder_slave.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

-- 
2.20.1

