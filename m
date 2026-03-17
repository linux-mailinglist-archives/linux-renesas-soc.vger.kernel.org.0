Return-Path: <linux-renesas-soc+bounces-29589-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOn6HTkquWkAtAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29589-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 11:17:29 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5751F2A7B3D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 11:17:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2E7C1302C282
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 10:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770693A759A;
	Tue, 17 Mar 2026 10:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UaJ72JIp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34243A6EF0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 10:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773742601; cv=none; b=bp5VCNysRmTA0foRcYldu8TABhsCwiahf/8hiTAeRa2F75vHUXOs6T5KZQK0honE0hIJE0yGoADH/t4rmO8qIFTK2GlunELBP2mWGgxnI6UmiRydLnKbb2gwUGBB2ExZw+0FPHgAIVytLw9bUOR+sGb6L9DN7mQV7ntWs9d3s6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773742601; c=relaxed/simple;
	bh=qlhz/VGAv1fkGq+e51RGRR7QoBeYCZLOXn2/9ebF4NM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BuRfbI6YT/viEfNwekZNp8XfI5CxkjeJpmi0fryNxjBZnLz7KVxVCYQTpO/X5PU2pLeVkbMoDCRT7OryG/BBGLdQUvNZhmB6O9VnnxApgSYjl5m7XEK19bUo+txhvTKn+0EEUEJ+/Ef58Q15BosLqfnsjsYagNwXljJ1DvGzhgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UaJ72JIp; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-486b9675d36so2570865e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 03:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773742598; x=1774347398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Z8ZDIaZ3WlvwN975EDjweAwKFPsqMXnqigrqm2JI8U=;
        b=UaJ72JIp9JYk70LYwEErkYSDaQC2tjHBE/T9+rsgDEaOmMw9G+bjLOPeu/LqUjeRSq
         L5JM68KfGfXSKf/X9JElGs2n1XDqqp7kEbHB/fw+8RlhGKhKz8IDBwMdA3cADi3MbElV
         Tu+z36ps4BOEYeCrO4y/h0EIgfeF/IgbAY+ffuyJBBM3Hkxiup/YIYloFz7NcyBrvjbo
         QSDucL+JWVa3Dw7WG/i6glHMXI8lZ3NE43/CqfVVRlBpx8G8QV/nr2nuJwOH5iou0+kq
         26Rlv6S+o4FW452Jw4cKF8O7iQBzWD9heNcCYwHTHqLmgkwGc3sMPdiCxcadx+JwNOMP
         jXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773742598; x=1774347398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Z8ZDIaZ3WlvwN975EDjweAwKFPsqMXnqigrqm2JI8U=;
        b=Ge+Uh1q5hwvEqXsisjvXSNSjgpAjvcYXD8Ba0UhRsOK5wOtQN5m3SKqYePgLEtE3Q6
         bEI5dqNWkB7p2MqFF15Pmuuv5CjvuBXNO5kjKc7Fz2iBkSWuiTAUFwhS/ZhZxFbPkPJz
         RL7iRBWp2W0enV9RYl8ZiSdUvpsogeZ5Fmd1F+r++YfjYHh8wd2ggRFzlzhosZXXMSPe
         fAnJr+WkTkh1l+Rj//7+QcnffR8EPxqXpZhWprDUXBYzVHPnn2JfVXmMr3/aD4nuOJ+t
         8NyDSW7N/jNkPOVl1MmwWOuGDRmqHgA6AFzzf9oWS1+sfMgRnSA2+y9Pe6uFLutz/SPq
         B6xw==
X-Forwarded-Encrypted: i=1; AJvYcCW91vNw0DLl0g8zhsaXPJqQzz5k6M1i82NB2qRwR5dfovC9QVKnf+6/UBVNuoZ4+bluKOC5uasYzrVrh9FnAS6NFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmzP6f9CfIYQHhpJeYLP9YoURvWyBvZv9MhgTNYO1xB/mvo/lB
	blGrxK1n9rFoH7IIWvv4lKaNYPZHItaevck1iR7ne5rQd/tbsZboTk2A4DDagg==
X-Gm-Gg: ATEYQzymucAR7k6WdwkUFNaXOXHgpEJoJD5NyGTgJ5lEqlBBVQK/Z6JaHSjXInwR4S5
	A3gUTl72+G5CaraJMtAFXJYuSMSzd+K8UJ2CGhBRjd602FBlJgtLNFjRN6jNbmFOPH76whQ92yJ
	1wMnBn/CCujWL+efJHdmKf/1BzSsKYLt9tooXT8w+r5AKoavLtG1h/8sqiuh1eZ9xYDNNAMnjRh
	0wJMh8bVx8jGP7xf1FMhnbBGMeorSgFaPEbZPh3euhxqZhar4vZE1l+thk1Se+tVyHhKcARfvLk
	cxC85UghRswYhD8Q+gsUALAbd3QNcl8mxGI4H8f7OMwZflHOPXHZIOf80/KkAAsNeFYkeFj8e/f
	Nz6ARbodzkMHr2oKFMo2UqZWMrpid0oJWfgSL5EIp9OJtpCoB7PahHBhgHD0qR0csNt9dFob1l6
	+vhM2sqiwutddHSv92IubKNG383hTJiixE6m4y53fhi0/d6aKs
X-Received: by 2002:a05:600c:8b55:b0:485:3f17:425 with SMTP id 5b1f17b1804b1-485566fd0dfmr262350405e9.21.1773742598015;
        Tue, 17 Mar 2026 03:16:38 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e16b:fc56:e220:9aa9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856eaee510sm53903275e9.14.2026.03.17.03.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 03:16:37 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 7/8] pinctrl: renesas: rzg2l: Simplify rzg2l_pinctrl_set_mux()
Date: Tue, 17 Mar 2026 10:16:20 +0000
Message-ID: <20260317101627.174491-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317101627.174491-1-biju.das.jz@bp.renesas.com>
References: <20260317101627.174491-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29589-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 5751F2A7B3D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The port and function selectors are evaluated multiple times
in rzg2l_pinctrl_set_mux(). Simplify the function by dropping
dupicate evaluation storing them in local variables.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3:
 * New patch.
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 7677751aafd4..3cef8a8d3712 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -681,16 +681,18 @@ static int rzg2l_pinctrl_set_mux(struct pinctrl_dev *pctldev,
 	for (i = 0; i < group->grp.npins; i++) {
 		u64 *pin_data = pctrl->desc.pins[pins[i]].drv_data;
 		u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
+		u32 port = RZG2L_PIN_ID_TO_PORT(pins[i]);
 		u32 pin = RZG2L_PIN_ID_TO_PIN(pins[i]);
+		u8 func;
 
-		ret = rzg2l_validate_pin(pctrl, *pin_data, RZG2L_PIN_ID_TO_PORT(pins[i]), pin);
+		ret = rzg2l_validate_pin(pctrl, *pin_data, port, pin);
 		if (ret)
 			return ret;
 
-		dev_dbg(pctrl->dev, "port:%u pin: %u off:%x PSEL:%u\n",
-			RZG2L_PIN_ID_TO_PORT(pins[i]), pin, off, psel_val[i] - hwcfg->func_base);
+		func = psel_val[i] - hwcfg->func_base;
+		dev_dbg(pctrl->dev, "port:%u pin: %u off:%x PSEL:%u\n", port, pin, off, func);
 
-		rzg2l_pinctrl_set_pfc_mode(pctrl, pin, off, psel_val[i] - hwcfg->func_base);
+		rzg2l_pinctrl_set_pfc_mode(pctrl, pin, off, func);
 	}
 
 	return 0;
-- 
2.43.0


