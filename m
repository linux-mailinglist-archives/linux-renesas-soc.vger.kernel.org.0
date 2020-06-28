Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16A3A20C7BE
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 28 Jun 2020 13:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbgF1Lwz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 28 Jun 2020 07:52:55 -0400
Received: from www.zeus03.de ([194.117.254.33]:42036 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726359AbgF1Lwy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 28 Jun 2020 07:52:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=tcl7AyfYqvD7eV
        gjYV2i7spnfipWj8AtxgY5Q1vqJWw=; b=2wEJnFncX4/+K08pBhVqXL++O1FViw
        fM8zhikVxrAVfHjNr7rnouG7BwRBhBD47fcAklGaJPCXbsSIScFIUr1GraaSXOJB
        t1BrYpSKJMORkfpQyXn3XSo303hgz0Zb8cyUhd8S94ULSPY07G8MUgoBvHmgKyLl
        UMMPrWCIMVMMk=
Received: (qmail 1708559 invoked from network); 28 Jun 2020 13:52:51 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Jun 2020 13:52:51 +0200
X-UD-Smtp-Session: l3s3148p1@Nw36lCOp6sogAwDPXykLAJ34nb66bSnN
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Vadim Pasternak <vadimp@mellanox.com>,
        Michael Shych <michaelsh@mellanox.com>,
        Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/2] i2c: mlxcpld: check correct size of maximum RECV_LEN packet
Date:   Sun, 28 Jun 2020 13:52:44 +0200
Message-Id: <20200628115245.9638-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200628115245.9638-1-wsa+renesas@sang-engineering.com>
References: <20200628115245.9638-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

I2C_SMBUS_BLOCK_MAX defines already the maximum number as defined in the
SMBus 2.0 specs. I don't see a reason to add 1 here. Also, fix the errno
to what is suggested for this error.

Fixes: c9bfdc7c16cb ("i2c: mlxcpld: Add support for smbus block read transaction")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Only build tested, I don't have the HW. Please let me know if I
overlooked something, but to the best of my knowledge, this +1 is wrong.

 drivers/i2c/busses/i2c-mlxcpld.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mlxcpld.c b/drivers/i2c/busses/i2c-mlxcpld.c
index 2fd717d8dd30..71d7bae2cbca 100644
--- a/drivers/i2c/busses/i2c-mlxcpld.c
+++ b/drivers/i2c/busses/i2c-mlxcpld.c
@@ -337,9 +337,9 @@ static int mlxcpld_i2c_wait_for_tc(struct mlxcpld_i2c_priv *priv)
 		if (priv->smbus_block && (val & MLXCPLD_I2C_SMBUS_BLK_BIT)) {
 			mlxcpld_i2c_read_comm(priv, MLXCPLD_LPCI2C_NUM_DAT_REG,
 					      &datalen, 1);
-			if (unlikely(datalen > (I2C_SMBUS_BLOCK_MAX + 1))) {
+			if (unlikely(datalen > I2C_SMBUS_BLOCK_MAX)) {
 				dev_err(priv->dev, "Incorrect smbus block read message len\n");
-				return -E2BIG;
+				return -EPROTO;
 			}
 		} else {
 			datalen = priv->xfer.data_len;
-- 
2.20.1

