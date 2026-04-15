Return-Path: <linux-renesas-soc+bounces-31290-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANGEOwSJ32nSUgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31290-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 14:48:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C6B404713
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 14:48:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B2C74300E18A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 12:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 260A833121C;
	Wed, 15 Apr 2026 12:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/jItQsr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3AE324B23
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2026 12:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776257261; cv=none; b=FgIT1Y15/hpc4VeoQWJYpSxpCnYV9DvnIODah9xxa185CE9juatmNHQfkNnnSyYbiGC5KzGqqjc2FxbnL+EHc+r9RSVPkP/xsh4HDnhztFc7HeQuVWb525rN64f0i2FvcWc+RJE45AfaM8Zb+HPTNh6RmARqX6Wkin+kQI5vYBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776257261; c=relaxed/simple;
	bh=v2J167Kc+xj+F1x7h/z4+g6abS0dMZHD0H2l9g42OPw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T4qhSV2/QgX3UBV4ogH9lWKKhEryiY6XaXD5bZ+7AcAVM9o3mo+MENNDJdQ67gBdaLFfnl5m5hJTPEorPqxZ0CmLJwBN3W7RDHcZbPCl7B8KwaDrGo6UBUHrQqpp+z+LuO4I6EpAZ8Vq1XC3xBxndcrp7Y9OB5vzyMluEo/PJ3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/jItQsr; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43cfd832155so4677180f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2026 05:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776257257; x=1776862057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5dBl/BdaawfmZOHNCX+Y8+cGAmr1wgVLSp+xT2/nrk0=;
        b=H/jItQsrOtLvlZYAx0pjpYLsNzjfMMBwH5LDpJdcW2R1LfVik2smzIro3RDlVKZXx2
         Sw0el3dpbo6syk/CVzvoLlcvqnZSmyUESe+iq+J+PoBdF7MQ2vp4gKddWHtjdp5qKRhK
         yJm65VOu3kV1i+9SbLQNO5id/tnCsEDkxQwLdqXiG66NQDtKYO5xWuISUKNbBJ0c8+r3
         mU8DObU+/NItbFQ/NcXz4GR/DTzn5eUskqOAp4mPreGCSiVFCVWo6d+6dU7ML+rHCeJG
         jLlC8JFGeY+WuPp8GCzeoGu51gGSir8N9hb0K5FlD+clPSIh1o4ZC8D85E0defmeD3ko
         RgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776257257; x=1776862057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5dBl/BdaawfmZOHNCX+Y8+cGAmr1wgVLSp+xT2/nrk0=;
        b=A4QtklWglU+19S8EapwWunoN2JqdCeiCjE0p1rGgXqVawCtR1HFPDkD5BpPn8Ktbd7
         bEQaP7/JcfHhq3sgZTj1rhrsFgpCd1J5YrhneckcIK3ZNYwB5cR8HCfhneh+tiCnRCrz
         4v912AYO640LVSwN2HUO86766gLXLG+RCjnf3w3+ubL6nPiI2+OH3l6fa5FUpAnVLt1w
         4SnqDm/UP1thckS/05pLpBqo+SGkfEZoSIPK6kKjaM+jQwNpntFsA9OW6hd8R92PtI5e
         HjiOnDZSYMSDkzhd/hFmlalQ/QKpvhtwpqq+WZsEsvZE2OUNVD8wf8qkGhOWSu4dz9q7
         oXVw==
X-Forwarded-Encrypted: i=1; AFNElJ/BqjdJLJ4LGHXzTyJWkpqYVwI9cxuQsKOr2VUt+w/rClQzsVuqbd8IZ2EcNniRc6MevE51l88A8fnjxjcD24a3KQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOV/JWF9DuFpaYg6kgXqb2L+2p/T4gXh6f9zjtKErDdN7gd3Y0
	uwSmOM0tABiqoFTECh4VrIemQn7ln8fELUQU3HJTc2KrlsRmEzklChn0
X-Gm-Gg: AeBDievFGFSypSIbsTlOYblzRfcOtionWdd6bkA2zzFWEMpR4Vd05GIPIEqnw/ZynqP
	BgOmB0lvioK6V7ELo9nv5cxloz+2H2GGz47YHD8zB1wRvgquF83n4g6sNDXmcHIBwuCb6QK8wGJ
	VoSAu9fRkIKuvTmvpM9aOxutkEodUJS10ed2AYxhTuNu/DW1LWCGRdrvma68szJT60TNlG4Fpg7
	Gn0sUSx5/glXdP+nyvfaDn0l/xgfc4zxMxXx5qdwlGE51FSHjhCN/hhmmPjqgq0Uja1dp9txGMI
	3KGG/lxzZi3JyYTphrILApfKbW/4MAHKG2v3Jotfak4Yv6USEMjSO/c/vhmGssmNbOrCJ77gQxM
	k3LrObe6oJcA1Kaw77m6uiED+nf4Go3g1cfVUAYfx95kwlx5qfwL9FtTEmWhJ1+M9kQvya28ve2
	L9g87IGC+dNz0qK0B+n4a7iuIK95haQGfUaR+Cng==
X-Received: by 2002:a05:6000:144d:b0:43e:a69b:d805 with SMTP id ffacd0b85a97d-43ea69bdab4mr9541704f8f.27.1776257257303;
        Wed, 15 Apr 2026 05:47:37 -0700 (PDT)
Received: from localhost.localdomain ([2001:41d0:406:c100::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead356616sm5123319f8f.13.2026.04.15.05.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 05:47:36 -0700 (PDT)
From: John Madieu <john.madieu@gmail.com>
X-Google-Original-From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	john.madieu@gmail.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v5 02/14] ASoC: rsnd: Fix RSND_SOC_MASK width to single nibble
Date: Wed, 15 Apr 2026 12:47:19 +0000
Message-Id: <20260415124731.3684773-3-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260415124731.3684773-1-john.madieu.xa@bp.renesas.com>
References: <20260415124731.3684773-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31290-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,perex.cz,suse.com,glider.be,gmail.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johnmadieu@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.989];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E2C6B404713
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

RSND_SOC_MASK was defined as (0xFF << 4), spanning bits 4-11. This is
wider than needed since only nibble B (bits 7:4) is used for SoC
identifiers. Narrow it to (0xF << 4) to match the intended single-nibble
allocation and prevent overlap with bits 8-11 which will be used by
upcoming RZ series flags.

No functional change, since the only current user (RSND_SOC_E) fits
within a single nibble.

Fixes: ba164a49f8f7 ("ASoC: rsnd: src: Avoid a potential deadlock")
Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v5:
 - New patch
 - Extracted as a standalone bug-fix patch per Kuninori's request
   Previously embedded in patch 04/12.
 - Add Fixes: tag referencing the commit that introduced the mask.

 sound/soc/renesas/rcar/rsnd.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.h
index 04c70690f7a2..3e666125959b 100644
--- a/sound/soc/renesas/rcar/rsnd.h
+++ b/sound/soc/renesas/rcar/rsnd.h
@@ -624,7 +624,7 @@ struct rsnd_priv {
 #define RSND_GEN2	(2 << 0)
 #define RSND_GEN3	(3 << 0)
 #define RSND_GEN4	(4 << 0)
-#define RSND_SOC_MASK	(0xFF << 4)
+#define RSND_SOC_MASK	(0xF << 4)
 #define RSND_SOC_E	(1 << 4) /* E1/E2/E3 */
 
 	/*
-- 
2.25.1


