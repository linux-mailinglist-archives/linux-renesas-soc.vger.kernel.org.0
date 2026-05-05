Return-Path: <linux-renesas-soc+bounces-32020-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLMgM52x+Wld/AIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32020-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 11:00:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A9C4C9083
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 11:00:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BCA40301DE57
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 08:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 862973D300A;
	Tue,  5 May 2026 08:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dPNbfl+m"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2B030E82C
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 08:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777971588; cv=none; b=g4AGQxoVlvdV1skeLp3qpDPtXRXHyV45eDfWR7E4M9RkJreHxEj98yRc7P04VcGNkFK/IoZsM7PLrCK+89/1TfrLan8iPd0IxjMuXTD408ykDxvqieX3OOkt+b+hoQ/i6S/1BuH8uhbtLcGwP+73HaudCHqFZGFlJtz/u5oOZd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777971588; c=relaxed/simple;
	bh=GtnmXgWBnlVbum8VU82XoIoP2qzEtwowPEy/lSbUNBc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rj2NgbW+m3Cx4eh1+8QtspAgYLyQM/ixmmj4dXBa/LOcW7y2rOk4CbFAJWtv5mpWetf2QrMbT8cxb4KSMfmhSnhEpgiWD6qbAskSYOBcarOJLb57/Mgk7PU1lWta9EKhaxwZBgcOT+QnBgJFOlb9QPvyiYXhJ3XFacn0fEk1ME0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dPNbfl+m; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-364eef1891dso2536888a91.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 01:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777971585; x=1778576385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=scgXwfpWRTztGmGbOBFzi2/rYTv6bkNqRVNUxAo7T3c=;
        b=dPNbfl+mQfuF5iFuA4h/oDLdV+N6e39r4NeGUMHjBrQ8VpddRgowN/3bUgf73Xz0UQ
         +EivlcGMfx2NMdJnxbGnkfZKH0oKpKd9lH1O3zEBueWHipWF2LW2vFu22kzwLD0xZXCE
         IjJnS6mzDEEZzDHqrJoW5Aj/3PYMRO+qtiuEO6ffgCbeyFGftbbfiZt/EcrajVgrdfoO
         Xp0d34QjvfonJnfdtp/ZvU6L6+bDDnUwlC+dkvCKnMlNaZ1iDDMD+53SECpP+oI8AWFH
         kGywZY4KHbkQRd4O6AQ9XPx8fmIQcmu0NCE3B5Z6VEw+wk0N+CXbSk8bskdQcO9Dc9Fd
         REnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777971585; x=1778576385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=scgXwfpWRTztGmGbOBFzi2/rYTv6bkNqRVNUxAo7T3c=;
        b=rDU+izTCI9RNxa5oE7xBxDvfkRUir5qD1lDAaM+lxYRUGmoUN/01Himz0hcIky/X0/
         vZhxp1UH+R5l9mlwzeN5riU2X5SaXSIGT19Ofkz5eleXZC7+Z6+qde58ETbK8E4uiXCG
         XIUSLHfL9yC28S2ii5vZ3Nyl7oUffCQ5gK1d4FkQwW6y7DdtP6zoSFovfQzGTD97z11C
         MO5SS4cRERBvM3eaf8E0o9uIIJCTcNAd84aX6470iN719sMW5GNhd0vOIF4g8QgBpVvu
         hrz403QJToQ/8HJyF3fLr9csQTzjuQI9GC4ObH5UAW6DFAsxyriHcHRxBqTM9GT8awMV
         2c2A==
X-Forwarded-Encrypted: i=1; AFNElJ8Ve89N+PtJrFr7qOuFJ7Kv/fX6/YL7qS1UrHMkzm5clBeubDBCkyCJ15uKs3WwrqzI5RTxVrd7Isoizze7Ldg4tw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyybbzuWK14j1sJq3GC5YXooXmctbxoX4+Qvo32qD5NX4Gmlvt
	wwLNNELW2oFwYRvyBA++ry2Te9HfF8JpEsQkNYitd/JghQFXz94On+mB
X-Gm-Gg: AeBDieuHHRfmjxt+usVjRVLzoYg33lcqROH0uMrVF13jJOdJoW6G/MuJgmvBTdI/GFR
	D77OZmPrAby6z3frwz1ErdbhqSKNcBCp1eW3lLI6GiROacpowsiSGHy5WJQFI7YC8J2654X/OXG
	oNIK45kuzI+odv3tXkbWb1UX6oxcigDD0CbskXxp5xRc5VsV9FGOChKFayWTHoPovbN+jJv4Y9r
	EyKVqvLdErE9fZSvhdmKfg6PaYJxBWSH25xlDNqy+vrcujRunxTpC4343nhbQNbiNggJgdm57w9
	gJPCta2nOuQRrdQJe7nMpdZVwOJT9y8leFnwCSB0L0qkg1HSruS/30zAGv255eLBurZj/eILG//
	oL4fPgCWLEFxQQwi691+vaJ8uHVkcDseTtJgCbOV9EGJdMbeC0DXwa/1JU5keFUcUl+iVAS68/W
	h8zYAezbmZ8xRnxXqPkr5z5gqHV51H1c8MGlvgZpM0h6wedsJASH3JTG0EMofMXmKf13uYAv+h
X-Received: by 2002:a17:90b:17d0:b0:35a:cf:64a6 with SMTP id 98e67ed59e1d1-3650ce552camr13753846a91.23.1777971585283;
        Tue, 05 May 2026 01:59:45 -0700 (PDT)
Received: from localhost.localdomain ([115.110.225.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364dbeb2db0sm19293267a91.10.2026.05.05.01.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 01:59:44 -0700 (PDT)
From: Shitalkumar Gandhi <shital.gandhi45@gmail.com>
X-Google-Original-From: Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
Subject: [PATCH net v2] net: rtsn: fix mdio_node leak in rtsn_mdio_alloc()
Date: Tue,  5 May 2026 14:28:40 +0530
Message-Id: <20260505085840.352206-1-shitalkumar.gandhi@cambiumnetworks.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260504200356.3529873-1-shitalkumar.gandhi@cambiumnetworks.com>
References: <20260504200356.3529873-1-shitalkumar.gandhi@cambiumnetworks.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 77A9C4C9083
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32020-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shitalgandhi45@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]

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

Link to v1: https://lore.kernel.org/netdev/20260504200356.3529873-1-shitalkumar.gandhi@cambiumnetworks.com/

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


