Return-Path: <linux-renesas-soc+bounces-3332-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B30A86C788
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Feb 2024 11:58:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4B06289623
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Feb 2024 10:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71D2B7AE5B;
	Thu, 29 Feb 2024 10:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="YdJSz+rp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603007A727
	for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Feb 2024 10:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709204326; cv=none; b=lgSr/0euoQaRBnY/2nSMtp+CbFoQ01G7SfNFuIxdnMqykRZge9ehn7bcVWX0kQLCZc2gyWT6CsBQBL+dlVPAtz2+4DcwWYAXEDRajN9VnQO0sIHq9FYVxLOYj11TWcT/rSmUK9ccqquQkICdD8Purlli3kfaXHZN6DclzW3h518=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709204326; c=relaxed/simple;
	bh=4sd9fX38+0z52dugV8+bmNK8bTTLEY/RwiQhB+Ew+3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K925ZWOH1GqNoupxcuyvPXGg0T9e2SqGvaAWDSAnUsXFKLlWPVtL7YTyFnGKNEAgTigVN79pUeA1OJh2yhlhd1XPdRA1zAw1usXPnqJLhXixDI1rTGryqgORGLWioHIcpPHJQsXLkWNx4vo4rIrZ4jSeTbCUFFturF+bXO9qcOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=YdJSz+rp; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=/y+V+1tDgCSb4ph0B2hx85t2I6GTJ/+BzAqonnhqTB8=; b=YdJSz+
	rpcAmXCgqbn1v1cUEbTTDDpOgjF7pnjkR8hkIsu5mNBTXNXUYRpf5s5wM9QK5L5D
	deKqAOGQj7PrasgO0ICEidD8sNay1Jg9vrUK8A6JinY2ztncHFzIJsM0PR98u8V1
	Se0qT9pJyX8jYhxYRNaxLvHalG/guPXYlvLhLwxnXzhQjtRGXqIV/IDw0d35Zr5f
	F2s5sdfGw4n3kb+hY4XryMu2spb+G1uetsmT2ndWEALt/1mHxX7MM3vqSX1MGtYD
	4kpIlhGX8CdXIx3fknrmoksOlKyAUe+6rszMxZ5s66MAgldFV0CuqMuNNvvy1yzo
	8B+n54pmGeXUcowQ==
Received: (qmail 2278070 invoked from network); 29 Feb 2024 11:58:42 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Feb 2024 11:58:42 +0100
X-UD-Smtp-Session: l3s3148p1@8KB2JIMSfDttKPFZ
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Rob Herring <robh+dt@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFT 2/3] i2c: mpc: use proper binding for transfer timeouts
Date: Thu, 29 Feb 2024 11:58:12 +0100
Message-ID: <20240229105810.29220-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240229105810.29220-5-wsa+renesas@sang-engineering.com>
References: <20240229105810.29220-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"i2c-scl-clk-low-timeout-us" is wrongly used here because it describes
maximum clock stretching not maximum transfer time. Additionally, it is
deprecated because of issues. Move this driver to the correct binding.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-mpc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index e4e4995ab224..0b4de9e569ba 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -844,14 +844,14 @@ static int fsl_i2c_probe(struct platform_device *op)
 			mpc_i2c_setup_8xxx(op->dev.of_node, i2c, clock);
 	}
 
-	/*
-	 * "fsl,timeout" has been marked as deprecated and, to maintain
-	 * backward compatibility, we will only look for it if
-	 * "i2c-scl-clk-low-timeout-us" is not present.
-	 */
+	/* Sadly, we have to support two deprecated bindings here */
 	result = of_property_read_u32(op->dev.of_node,
-				      "i2c-scl-clk-low-timeout-us",
+				      "i2c-transfer-timeout-us",
 				      &mpc_ops.timeout);
+	if (result == -EINVAL)
+		result = of_property_read_u32(op->dev.of_node,
+					      "i2c-scl-clk-low-timeout-us",
+					      &mpc_ops.timeout);
 	if (result == -EINVAL)
 		result = of_property_read_u32(op->dev.of_node,
 					      "fsl,timeout", &mpc_ops.timeout);
-- 
2.43.0


