Return-Path: <linux-renesas-soc+bounces-31298-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGZ/A8qJ32l5VAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31298-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 14:51:22 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2DF404811
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 14:51:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 35AA7310A4AE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 12:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A16AB37B41B;
	Wed, 15 Apr 2026 12:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pOT800eY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528E43314D9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2026 12:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776257270; cv=none; b=onwUbhH9urJr4n1LQAUOn3eJOaXbnhAVKg5HLfhygRKQISYSgPc4TZI0JuSEg47NEu7CgB3ScoT/E22MkH66ESn+HbDREbEnPmMgnXqVj9ixFg8xPn4DZkyd9gihivdl4exrM/uyMMQfnWHf7oZHKQ9Y/StdI/+Fx2PX4aNzlJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776257270; c=relaxed/simple;
	bh=jEQUdAtH8yE5mBvf4ytaTJJnGJ58WWs9SMxtTW7gBUg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W7IodxB3wqD1vvaPxtyFXoHjoqKXzl8DbdSiV51Rux2PZ8esJLkJyl9ky21FXGY0JXDffBnfqTku5LGI/uJWeXzncqOwFHDtdFLZs1BVuajEMicwNiyFcQRZWNHGmyHl1TNsvag/sSAgaDbJ6B2Us0AuY0Poh+ZRI38lnNQT4FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pOT800eY; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43cfce3a195so4200448f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2026 05:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776257267; x=1776862067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bzcOCyQLNmU8cBIifwv6HJp2UvPykwfLFilqam8mArk=;
        b=pOT800eYk1HANo1s6Jv49cU/Aj3dWRzvCsbG099gjq75vYWtjkC5uzR2/FYYqb5yiI
         sXWGfI0HMaQ4CtP7Ah06ftVkap+YvMDq2TuEpN8riwTPE0l3joQJwUl0uJF9XQl1eiyJ
         b0DhiN6O5zrmZVk0NqyxJHuk+O6UJ4bgS+nCa76bmUHjUTju4Sv3wrmDtpRuRb6xC/HP
         y3B+XtANE1MFDyT5NYEljd49rLst9rNUaTk1mZSJ2VkvPAVXDViakJmqQzU6+bW7u9Nr
         WogIEhstTcN/OTZidJ28nRiQGLffEd7P1LJbAFwHFbb5eBCtFvStP6/Zq/kSbo6jcSoF
         qaAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776257267; x=1776862067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bzcOCyQLNmU8cBIifwv6HJp2UvPykwfLFilqam8mArk=;
        b=C5IEfsnhIGbvwfWtecJ4IrmMWVdlwDX3H9WTDUeD0x1RN7/1i7oizJ68Q5qfuob4JJ
         57ODysqEi3BlVYx1lTCTVXMo7r0EbvPgc+dLTxng97yyPAPQzYXl8UqP3GstONmXJHxB
         hzbQkwp8Y8DoYfUGfyDt0iQSDNG/ACyKDvKdAr9fuBNWeFsxX5V8UQ7/z8FrQlXTzl6w
         pS10UYpJAzKe7OUR5XQFxRgxupw5HIeRwr6/4IzCQWm/wKaNbtvHcCm5sqx6gDKOIxTB
         5ZlCmEjBKKj+5vutLjSXZpyvv2eFcgB8T1Z0fMkwafdL820lf5qjV7LCvfoLm31l4ZpX
         gZeQ==
X-Forwarded-Encrypted: i=1; AFNElJ+2C22Pl455BG7bzaYzLYl1y6N6Te6vL8tEaRyJ+mZyVE0bYdmqyWgcHa3QIhg5ZSN4E083jywWAG3nqREjmoG4Mg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0f42oCxtvMuFJrOaeBfMAuV/dvKL4ohHRjA4wL9/bsvzX1pGN
	UFnh1t1R0RGdaQI6t0VRp4KH5fXV94gUS7d6F0uU9lkug1fjIbgfu4B+
X-Gm-Gg: AeBDies6DNncU5bmd1T0tzK5wLXc5xLB0/wgf71lbjkG8VzyB2sCy1V4UV9eRKcJB/M
	INMvDmgh8Dyu4LHjvI99DbGBwE52AUpujTz4Z7+54s8csJvkElu7/hsVSeizYegiymnrRRwmIUj
	4AnuoYcNTIZTczekZJyFkgnfe3TBvrxpXJJoOIC1JM7T6dZQwnGVAG1NNTS2yCKx44LWduOG/zl
	zdOxjyIlp2OmlB5NET16SKj3O9SHQEomu7ZuFcFnNpPGeqOQVnYazkrm1KSajzPZZ/TlHFQZgyL
	MyKaojRAA0HHW7EfF+QJmGIKPCldMQ1cflXYIYc+paRx7ej55yQ70jxH9xc7woEhEU2mf3CMAW0
	TyyQxOamsrmRNByaSyrvldrRb+f5d7eIPlDO62p4F648QEIE6H5W8Bjxt228YZ3X/G3HhYng9a6
	xHd2y1cxlHbYKVhPBYhtTWIgqv8OvCNWTyqUAwzA==
X-Received: by 2002:a05:6000:2081:b0:43d:6ff5:3a2d with SMTP id ffacd0b85a97d-43d6ff53ad1mr19853081f8f.10.1776257266466;
        Wed, 15 Apr 2026 05:47:46 -0700 (PDT)
Received: from localhost.localdomain ([2001:41d0:406:c100::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead356616sm5123319f8f.13.2026.04.15.05.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 05:47:46 -0700 (PDT)
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
Subject: [PATCH v5 10/14] ASoC: rsnd: Add ADG reset support for RZ/G3E
Date: Wed, 15 Apr 2026 12:47:27 +0000
Message-Id: <20260415124731.3684773-11-john.madieu.xa@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31298-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.984];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8A2DF404811
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

RZ/G3E requires the ADG reset line to be deasserted for the audio
subsystem to operate. The ADG module clock is already managed via
rsnd_adg_clk_enable/disable() through adg->adg, so no additional
clock handling is needed.

Add support for the optional "adg" reset control on Renesas RZ/G3E SoC.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v5: No changes

v4:
 - Collapse dev_err_probe() and rsnd_mod_init() calls to single lines

v3: No changes
v2: No changes

 sound/soc/renesas/rcar/adg.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/renesas/rcar/adg.c b/sound/soc/renesas/rcar/adg.c
index 0105c60a144e..813ad5eabba6 100644
--- a/sound/soc/renesas/rcar/adg.c
+++ b/sound/soc/renesas/rcar/adg.c
@@ -771,6 +771,7 @@ void rsnd_adg_clk_dbg_info(struct rsnd_priv *priv, struct seq_file *m)
 
 int rsnd_adg_probe(struct rsnd_priv *priv)
 {
+	struct reset_control *rstc;
 	struct rsnd_adg *adg;
 	struct device *dev = rsnd_priv_to_dev(priv);
 	int ret;
@@ -779,8 +780,11 @@ int rsnd_adg_probe(struct rsnd_priv *priv)
 	if (!adg)
 		return -ENOMEM;
 
-	ret = rsnd_mod_init(priv, &adg->mod, &adg_ops,
-		      NULL, NULL, 0, 0);
+	rstc = devm_reset_control_get_optional_exclusive(dev, "adg");
+	if (IS_ERR(rstc))
+		return dev_err_probe(dev, PTR_ERR(rstc), "failed to get adg reset\n");
+
+	ret = rsnd_mod_init(priv, &adg->mod, &adg_ops, NULL, rstc, 0, 0);
 	if (ret)
 		return ret;
 
-- 
2.25.1


