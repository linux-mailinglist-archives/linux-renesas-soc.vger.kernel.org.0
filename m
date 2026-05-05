Return-Path: <linux-renesas-soc+bounces-32074-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGnmNvTk+Wn2EwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32074-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 14:39:16 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC94B4CDB20
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 14:39:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A1C7B301F231
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 12:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDB9A429838;
	Tue,  5 May 2026 12:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SCL3nz+z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F853A785E
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 12:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777984405; cv=none; b=MDBN3N2ZXBD8kCyWSNlbbv84UIKhXUPiHjgZTkcAo/AgTogI5qH0SWwwO0IgwFAgl0aHrxfGGZYv3HsN7m79lOt256wthVqs6Gq3SvJalePPtKJpflUK+A2qdsNiKNWxjhEdTejpAYmfULWdyFFQxNSob/jyGFNqKucQvfhVIh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777984405; c=relaxed/simple;
	bh=y3tW/Xv+dA6fK9zbbtZuPIX3+JTpxgxF57IG/or79zM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eImuVLK56wERqJymhN7OSISCTkHImo3Z9KS/bSB3K+zAbuK1BfoPc37sjdB1HNr2ooS0Gjk2ABDpRNQGocTCM0YYn1Tv/2DoBs5UDi3eeMvmlO5LXJO2cB3MQJ1HJNO+VTntJpkqaIozJIV+IzEVeNxMvifcS7QIFCzOn0P74BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SCL3nz+z; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b788a98557so42704215ad.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 05:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777984404; x=1778589204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DvEm19d6uRu2W3J0XJxAC912UPvSOn8nmJ7XsYfi08Y=;
        b=SCL3nz+zjo3/UeiHlEDRIj7dDByjBjyN/y79R+tK9kjDxE+BZOKQL+ZgpH3BeX3HWP
         H+CYp4Mh/ex9cIxCeqCeoX1hwzcPHYwE9k4bJ1Bk/XOAjI0T0+CwHEEXLDvIEGJtpTqJ
         6hapmV/bZAiyylRGl3RrlaSlS8cmzFDQY7ayttFVUnQzuRxOuehGJXlGqH7JaXV2bneI
         WRikYhH798nq/nwWnC67cBmNmthHMTvR/PC+b5OPoPt7ILsjY2P2qnKvCqnR+eFsfUFM
         sjgL5ZAxNh01T0iRS+PqP9Y3goQm47jyPnmsDmCE6ZihxD9Jw8KDqKriFVMJ3uvz8paZ
         US8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777984404; x=1778589204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DvEm19d6uRu2W3J0XJxAC912UPvSOn8nmJ7XsYfi08Y=;
        b=VJPWYk9IOeRhXRMBpGP+FoSHhl4RKbF7INyxZ0Y+NpadYgz6SMQVY34oaw65rA1klk
         AScHD+4MYXHDeg0ytgJdBfEl8g5pUG2bsKcMRqOv6GPwf/5zv2emsBuWGBnZnT4+nCku
         E3YoPn5tkhG2t7VHTuaVf0RqShNVX9/pjeRTzjvVF94VX38HpLMxZIOx6DdbHFkKA4AP
         PwCTFhCVRw4YTBCDxW0e6Dso8HpmO0l0CpcGTWZ+1VaCKsUxuZXJJ0B3XPkFbIfAR7R8
         jTKwgdDlQ66DhEddoO8kyoTT+rGJJoEaw8B3ljLLMREgrOoMHjVj7ezFeS4mo0lgOiEI
         o8NQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Nc8cFSxhynf5TQnKNbMRxGMigaXskHN4J8lf+YIQpPCocoXIU8Dgg6/dfmgP4t3gFLpajikQZ+zMXpj+NFjUt/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUKIZ+MCyq2vhM8sgWyMPiVaz/t9FT3T17yT3LRqz4mIaVtws8
	s4LTBD/LxUKm8EOjD/FCI1EoNPYAj2OPgf4Gs6iH4Vaoq7Oowj3lZDhyqbncPSop
X-Gm-Gg: AeBDieuB1BeGfRsIifyNF0Sd1OaDt7p9cXZwfrmadSRHH3KYN9IR2f30x1+8I3ch6sx
	vqgVEnJBSBnxvcqy13NOlsZRakC1xKQoW00Wgh2Ssih0iNUoaQGocjAbkA/cGi/swI7qiNO0HsB
	iXtRQ9jpoavgxa/0Jk9ux5UmDnVmBICZJDJa84clRjZlyNxaONk5/lFPV6QSZcPtf8uKd50nuOO
	k1VsBe+WT2NlkOFyQHiI8JIfIxDKmRiuWjwU8wb6cYCN6OWrByhc26p9vOqnX8/czQn1NObDuuY
	g0wq5sK8AsTLoiUIpO2hKlsu/nWEbZazSXmDEWzl3gE1sa9rOzkV1dl4Q70pZwJcMeXu+A1pDAI
	qvtB7YEcVxuf2odR71lvDSJ74pMQOd47hIaXnrpkcEVSa74twUPjGk0M09SALwjsv9lBUOhKgOU
	l8Z6+AniYvGW7Ks35y9mJnPLubWnse0mnNHXrqjYISyPj0/+rGtIVSpKLtfVTzd90LkL5EKCTE
X-Received: by 2002:a17:902:ea09:b0:2b9:4941:7f6e with SMTP id d9443c01a7336-2b9f256745fmr144236685ad.2.1777984403595;
        Tue, 05 May 2026 05:33:23 -0700 (PDT)
Received: from localhost.localdomain ([115.110.225.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caaaf0e5sm138853715ad.18.2026.05.05.05.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:33:23 -0700 (PDT)
From: Shitalkumar Gandhi <shital.gandhi45@gmail.com>
X-Google-Original-From: Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
Subject: [PATCH net v2] net: rtsn: fix mdio_node leak in rtsn_mdio_alloc()
Date: Tue,  5 May 2026 18:02:36 +0530
Message-Id: <20260505123236.406000-1-shitalkumar.gandhi@cambiumnetworks.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EC94B4CDB20
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-32074-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shitalgandhi45@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,glider.be:email,cambiumnetworks.com:mid,cambiumnetworks.com:email]

of_get_child_by_name() takes a reference. The rtsn_reset() and
rtsn_change_mode() failure paths jump to out_free_bus and leak
mdio_node.

Add out_put_node to drop it before falling through.

Fixes: b0d3969d2b4d ("net: ethernet: rtsn: Add support for Renesas Ethernet-TSN")
Signed-off-by: Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes in v2:
- Restore blank line between `return 0;` and `out_put_node:` label (Geert)
- Add Reviewed-by: Geert Uytterhoeven

Resent as a new thread (no code changes) so netdev CI picks it up
(Andrew).

Link to v1: https://lore.kernel.org/netdev/20260504200356.3529873-1-shitalkumar.gandhi@cambiumnetworks.com/
Link to v2 (mis-threaded): https://lore.kernel.org/netdev/20260505085840.352206-1-shitalkumar.gandhi@cambiumnetworks.com/

 drivers/net/ethernet/renesas/rtsn.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rtsn.c b/drivers/net/ethernet/renesas/rtsn.c
index 03a2669f0518..ee8381b60b8d 100644
--- a/drivers/net/ethernet/renesas/rtsn.c
+++ b/drivers/net/ethernet/renesas/rtsn.c
@@ -797,11 +797,11 @@ static int rtsn_mdio_alloc(struct rtsn_private *priv)
 	/* Enter config mode before registering the MDIO bus */
 	ret = rtsn_reset(priv);
 	if (ret)
-		goto out_free_bus;
+		goto out_put_node;
 
 	ret = rtsn_change_mode(priv, OCR_OPC_CONFIG);
 	if (ret)
-		goto out_free_bus;
+		goto out_put_node;
 
 	rtsn_modify(priv, MPIC, MPIC_PSMCS_MASK | MPIC_PSMHT_MASK,
 		    MPIC_PSMCS_DEFAULT | MPIC_PSMHT_DEFAULT);
@@ -824,6 +824,8 @@ static int rtsn_mdio_alloc(struct rtsn_private *priv)
 
 	return 0;
 
+out_put_node:
+	of_node_put(mdio_node);
 out_free_bus:
 	mdiobus_free(mii);
 	return ret;
-- 
2.25.1


