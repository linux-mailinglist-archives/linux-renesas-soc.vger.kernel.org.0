Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D1172EFF90
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Jan 2021 13:45:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbhAIMoO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 9 Jan 2021 07:44:14 -0500
Received: from www.zeus03.de ([194.117.254.33]:50350 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726439AbhAIMoO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 9 Jan 2021 07:44:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=Y3lXcyORMSIRm1
        IDNtQbUy1mVfRAWW/0bTlHnjmtimk=; b=A/ZdX9DFsogZjGZYTG5wq+pCKHTmNB
        SN7VQvEBGod/AdID+R1receEcqh+449kU3U//qNxLuahJXhBt0iddbbWjj2BJ6Cc
        RZv3HlW81Ib8NfspnCmIQt4DbVpy00ThK06M0BNsJABu2ZJ53kgtpq4l93Kwl9pW
        id4dUTZLxN7Ps=
Received: (qmail 1725129 invoked from network); 9 Jan 2021 13:43:30 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Jan 2021 13:43:30 +0100
X-UD-Smtp-Session: l3s3148p1@SIcmBXe4TpYgAwDPXyBeAD+yeC5KBZLe
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Robert Richter <rric@kernel.org>,
        Jan Glauber <jan.glauber@gmail.com>,
        David Daney <david.daney@cavium.com>,
        Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] i2c: octeon: check correct size of maximum RECV_LEN packet
Date:   Sat,  9 Jan 2021 13:43:08 +0100
Message-Id: <20210109124314.27466-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109124314.27466-1-wsa+renesas@sang-engineering.com>
References: <20210109124314.27466-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

I2C_SMBUS_BLOCK_MAX defines already the maximum number as defined in the
SMBus 2.0 specs. No reason to add one to it.

Fixes: 886f6f8337dd ("i2c: octeon: Support I2C_M_RECV_LEN")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-octeon-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-octeon-core.c b/drivers/i2c/busses/i2c-octeon-core.c
index d9607905dc2f..845eda70b8ca 100644
--- a/drivers/i2c/busses/i2c-octeon-core.c
+++ b/drivers/i2c/busses/i2c-octeon-core.c
@@ -347,7 +347,7 @@ static int octeon_i2c_read(struct octeon_i2c *i2c, int target,
 		if (result)
 			return result;
 		if (recv_len && i == 0) {
-			if (data[i] > I2C_SMBUS_BLOCK_MAX + 1)
+			if (data[i] > I2C_SMBUS_BLOCK_MAX)
 				return -EPROTO;
 			length += data[i];
 		}
-- 
2.29.2

