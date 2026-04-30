Return-Path: <linux-renesas-soc+bounces-31779-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPzjCDMi82nIxQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31779-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 11:34:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAAA49FE20
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 11:34:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 25B50300AB33
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 09:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EB2B3A6B68;
	Thu, 30 Apr 2026 09:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZENjqUB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9FD3A5430
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 09:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777541673; cv=none; b=WOUSoKH+kD0ISToTowoCDErcY2ddS3pj2hyxTrYcNr6eHlAW2S28oFRgKbdh/IBbXqOb9iOIzwfQHUdey2IdUqSODHuJLd9/gisn/hGC6yXRSjYto/1PVMpIaG2IqX30gNGf63q6MDEE4ZbhCRTVjH0vzQPQ3ED9fCqNmqM3VM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777541673; c=relaxed/simple;
	bh=JcDxBvVYuzHTM0pBmSHEbRu5yB+4Iol+TmC03eQIgL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HABjWARZt6RmKezFFugr4uyITD+SefAPNK9MKJ6YCd2thmyH3NhiEnb67ZEw42Wz0yNCewo9CZs34g1ErwyBnIwY35Xguz4U5B6ou88KZWnibWf4I3Tej4vva67vtGpSVU9mI0tJ+YpOhQ706DG5AHbo56UKKLMhZqgKoXVEjmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NZENjqUB; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-449d6c68ed8so104675f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 02:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777541670; x=1778146470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bGpoI1aZ4hWunrNAuGb7QzS+oVWyQAHR2Jm1DddCfOY=;
        b=NZENjqUBKEUt9EE+HYL9e7mdnGSvUZ8+W2eQXPDYhG4iLJyvdy4yCmfnqo6v+z0cBH
         XfhbqITYDfjH1KPja2YlR3k+w+EQEHr1Z7qLVHqDoPbEwXOzFpAREmSrTmg7S/vaNX7s
         VeccxZPvEY5OuT4w8+ZAXFkDOnfs/8AYCRmfC3VPCSQmtHzV+F9JIpAAVBs+sgGOES1+
         +YaBAhkBZG1WF00/u5QPpY2yl3WhoC6udK4pdERpEwnTrKeAEvoapbWCG+efV6b3QOW7
         3NDv4eMQMTR6E6dKwlb+B2ov8B2YGOpid0KiRUBDVIytdcJmfgzH6w53YV0lG9x+8JfG
         hOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777541670; x=1778146470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bGpoI1aZ4hWunrNAuGb7QzS+oVWyQAHR2Jm1DddCfOY=;
        b=KyeIUj0HUVMdu9zAY8KyGnjW8zMxH1VPq0k4wle8954O+XrgBFufmHJU/7U/OaTALS
         PnLDWR7doE9bCgUcPBTClYAL8lUD3YpDoyJ118c/PNeeaZtkgwyNx9yfoOZHdK6RlPEt
         KTRZFn6eWx+Uvnbj/Ab2llMCbG7gvChZ1KNFqTUb5KKh0w3PC0saH3QintFxrxPkdbMf
         iu3+vS7uq4rOS8JZIohZTa/xUOOrJL3wyyAedwVr+0kUq+6gd+zgU5ASaCoWDmgJ0SsK
         bxPFj+xvMyp1xhO/kysKaC8w8NQj3TUEBlu9LH28dTequ6XfUAAZvKBRm9FA9hnZHk+y
         tfHA==
X-Forwarded-Encrypted: i=1; AFNElJ/nQ9NQsWxXc4COmRihz5NctpA9P/PzXPEUhrSfbDHc6kFjSIvLaH7mnw2mUfR8jYOu/5+taWTDDL8/aohh0Lr74g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzexj5iHbQlgdVrd+7DrlWLvo/uZQGP/O9xXlObw8Avpn78p14B
	UKDGK0nDwtSzYelcajL2KWVUAnIMa4QOttGyvqhBF/fzsZZCW2LWntBi
X-Gm-Gg: AeBDiesPruAhHi+SiCf3poa2TAw4+nPG+cGPqWYt2iEHckJOkAOG1vKnrrSxvj9YTWn
	vjIhaMhSVaupjbC346YM4O7aImdGiFA7xLOJjn52ansQ+O4hlUo2h3sgCVEb3wBDRln9oMW02lJ
	x+adrQ2ycLrjfK4jL+fx1wsWZRSJ6EhJ4I9TlGYwdH7Vq02FKCEnCsEdunww4fdwB0ixkJLqTab
	mwjBgXO5PRHJphfboPouKt0z2y1K2HadzX0YKTmNADJS/8esG5NjSzWq68adrV7avZRA5e/8XKg
	MYqMT65nlAThVfjQA5f2tXNscMhtMplGCvq0JOkBPAeHUCpyjwaerdiPwuO22QmlSZPdx6xl8K9
	SIDzstTiaNUA9vWtG20GOvswvE+YhSD00S/3JZQeWiMWX+LnWEp7GBG13Q3nR0FOSvPbBIG++yh
	gwsEmRLBXPqbTDc19zuFxJ6DX3cYxokInC4QkRpmkDsjCBQM9n3u5r8ts5
X-Received: by 2002:a5d:584b:0:b0:43f:df1b:9e07 with SMTP id ffacd0b85a97d-4493f03b2d1mr3377278f8f.42.1777541669905;
        Thu, 30 Apr 2026 02:34:29 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:342:901:e785:f7d2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5c22sm11953913f8f.28.2026.04.30.02.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 02:34:29 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 4/7] pinctrl: renesas: rzg2l: Update OEN pin validation to use exact match
Date: Thu, 30 Apr 2026 10:34:09 +0100
Message-ID: <20260430093422.74812-5-biju.das.jz@bp.renesas.com>
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
X-Rspamd-Queue-Id: ECAAA49FE20
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31779-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G2L SoC uses pin 0 from a port for OEN while RZ/G3L uses pin 1. The
existing greater-than comparison against oen_max_pin in
rzg2l_pin_to_oen_bit() would incorrectly accept any pin below that value
rather than enforcing the single valid OEN pin for each SoC. Replace the
range check with an exact equality test so that only the designated OEN
pin is accepted.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4:
 * New patch.
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 7b1bb66d4ff6..2a46ba7b3709 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -1124,7 +1124,7 @@ static int rzg2l_pin_to_oen_bit(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
 	u64 caps = FIELD_GET(PIN_CFG_MASK, *pin_data);
 	u8 pin = RZG2L_PIN_ID_TO_PIN(_pin);
 
-	if (pin > pctrl->data->hwcfg->oen_max_pin)
+	if (pin != pctrl->data->hwcfg->oen_max_pin)
 		return -EINVAL;
 
 	/*
-- 
2.43.0


