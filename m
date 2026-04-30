Return-Path: <linux-renesas-soc+bounces-31781-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEMdAR4j82nIxQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31781-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 11:38:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED3349FF0C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 11:38:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D84703067CAE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 09:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 194B63A63F9;
	Thu, 30 Apr 2026 09:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mUZlAghV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8115A3A6B99
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 09:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777541676; cv=none; b=PIq6XswXP2Pr54CVao9FkoBmFjXSMMl9fR/luDRhEs2f3RIOWWbk3W1TMFCliaDEqW8AJ3LE8GG49n6AdByZGeAq8VOpgsXiHWxftpg3Ehhgh2O/2UnsjbXo/wsb/ZqOGMDVuLV0jDfY1QOBaxAiGuJeOnwPnXPOXmTbxq9Idro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777541676; c=relaxed/simple;
	bh=pT4vlRF+WTam/ZKzQMnbpk8803cXtcadIPthrcyiQug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bUTkMekZvySl1VWknKoZbeUSviFXRi2u9z5qtUTZCZy5NX3YPQ6OsVmzd3rnk2MfFOqcuNRfD3kANQAEhkdf5cpqTEMsfpg58FMCF5yGV/u4TGqFwTyNI95Jwjv+sCENOo9tsIRFE4KQOKPY0AMli6sJlJwXqRXh0bfyQ+GsqT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mUZlAghV; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-449e96a8a80so33615f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 02:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777541672; x=1778146472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/8sLHc9W5tl1EvtfSg0BszVcVjlDsk9IiIlQDWOyFU=;
        b=mUZlAghVi7jtwP77dbSHVcC4Hte47yLkAJbssNX0zSwrU5I7wVgEpZai5CTC0n1FjS
         yjfGbzESDwnewdhns1GNU1O3GAs7nYoNinlR0KwA2cyNMzBjqCexXib4XqZWiYB7hG4/
         Qj3A5eBAhRPT1qwksd/guAFV111h9zEi0fT0BxKi1sgsbM4cz2NxaZXA2VBGxyP7QMrG
         8ozTpbcMjJTjwE/BzaHvBzmQ7GlNMd7Az4B8cFrrucdchblP+9WwoaynbBBslKjYaJB0
         6hFT3e76Kj+wEHuHwEosESkk/1nLPgtpTh14Q5v0D7C9n0gMIHxRUFXn1SplEOLdaGQz
         rcAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777541672; x=1778146472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p/8sLHc9W5tl1EvtfSg0BszVcVjlDsk9IiIlQDWOyFU=;
        b=YqPZMtJ1ImcJv4uBawhF54VSS9tHGbn9PNjTQnDfzCqsaDwoD0anwfP6GAfpcaPXQg
         8bI3Yv9TJGatw2iVfblXBOceN1vAt+NDs5nsMsib4a4XAUoSzM7MLuwTjbd948jCGLT/
         iomYLjURlc+WXxoeHhzTWsSJ76UV9Lq6SqXL0VzDkmR5inCF5flIeg2bMSPpxDa4c019
         r3p6A9ZvPNdHSw4ynGgSui9FwqSzh1h52AmZj5JnQKLokfBYWBTELRe2hiyY9QBbAVYG
         ookBUA/Rv3Wxv3as+K8wvyfSVHSh7Y58X4TXNi76I157TXJQwvwLXNjdr0sO2g3VxvQk
         WLWw==
X-Forwarded-Encrypted: i=1; AFNElJ/rqT/GUKSL0ckvbCi3OJZhmLqAFIPzZonAv/nv3dB1JiGczttsNzcXRJPuBKsLowJCaUhVLUuoUYaRaFlMLD2kMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yze58InZgjLChs5RVs4oYCdfU9M7mhedBSRHZKNgDcPa7wCDAyx
	Mc/Z5kIRZl38nzAuvOCABvEMJ3pTTTHFaQktjFIgikTEN7rzeQ/wYWdk
X-Gm-Gg: AeBDies5MT+aH0tGSDDh0Xo2/RvxDyd5lNaLAd4v0RAdcdQkKynoGVZvaNPSQ9fGfv5
	LIBJ5u7l1m4TVSkcU63aTx8peoxiK3od+4Vc73s3xzWltYCyrqpGG6RsVj+L6Tf4JBj0Sj7vIKY
	QH0gvg875guRTYBt/5JVNXiI1VxNdWm96SSMKtwxHv4gCQ0nifw5LSk+AiIhqkt7dchP0hTVWwY
	RQtyB/vl9VqL6TlZFNvCawJdkYw/V11Ah+fe+uy9hoXT0KV8VfnefLBkFlMqn2/8K/95t9vd7Y8
	kXX/A2zbiLc76mW/XaHKO+iWlTqQ+wBhCJy42DExyMrHXkO+X/1yCNDLND3K0/0V1UUD93c5Ohw
	AIP2jG6gZ8byIvV2bIhIOP50qGSF3v8/iuuQaQDMuKP+HaPWeaviLo72CDi2rrZRMGYE2agrKZz
	x1UBAwxFbe1KSt5WYBc6lsDw0rtF9E/Zc22YtF+kfTkkWRNOoOzLL09FLh
X-Received: by 2002:a5d:5f47:0:b0:43c:f1a5:56f6 with SMTP id ffacd0b85a97d-449401ba950mr3616456f8f.43.1777541671742;
        Thu, 30 Apr 2026 02:34:31 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:342:901:e785:f7d2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5c22sm11953913f8f.28.2026.04.30.02.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 02:34:31 -0700 (PDT)
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
Subject: [PATCH v4 6/7] pinctrl: renesas: rzg2l: Simplify rzg2l_pinctrl_set_mux()
Date: Thu, 30 Apr 2026 10:34:11 +0100
Message-ID: <20260430093422.74812-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430093422.74812-1-biju.das.jz@bp.renesas.com>
References: <20260430093422.74812-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2ED3349FF0C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31781-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,glider.be:email]

From: Biju Das <biju.das.jz@bp.renesas.com>

The port and function selectors are evaluated multiple times
in rzg2l_pinctrl_set_mux(). Simplify the function by dropping
dupicate evaluation storing them in local variables.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3->v4:
 * Updated the data type of func varaible from u8 to unsigned int.
 * Collected the tag.
v3:
 * New patch.
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 004096d5d1d1..eff5fc081ec8 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -687,16 +687,18 @@ static int rzg2l_pinctrl_set_mux(struct pinctrl_dev *pctldev,
 	for (i = 0; i < group->grp.npins; i++) {
 		u64 *pin_data = pctrl->desc.pins[pins[i]].drv_data;
 		u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
+		u32 port = RZG2L_PIN_ID_TO_PORT(pins[i]);
 		u32 pin = RZG2L_PIN_ID_TO_PIN(pins[i]);
+		unsigned int func;
 
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


