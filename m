Return-Path: <linux-renesas-soc+bounces-31292-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iP8UBFaJ32kHVAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31292-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 14:49:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0854340477B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 14:49:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0D5863036BE1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 12:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85CE0342146;
	Wed, 15 Apr 2026 12:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fg+QJ1jd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA88335568
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2026 12:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776257264; cv=none; b=pH9AS4e21hZNma5AEu0wrbvEfnE8dwkeozTM/6FqYEUcXPXwOzniSPZLQNfdgY7O28YQvRNhIE89aZeayZM4Z2UwqQkb3gAynEhz6Q/mlzvR8PM6tJObfC66GGMhWAjPzA/RJ2HScuAzAVB25GU/k9Ou4f5LehRbt1k7to4ErTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776257264; c=relaxed/simple;
	bh=1i4vtlL/MuJz61IDw0/C+/bm5U9XK4wosBXKE8p2dsI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sBAw0EtK46Ca0LHMQa0jWKeRMNE6uSm8RUeTNzXRdpKAmP2gl8jCZguUwt+5SSaUDzKPoh6YO1f1fxxbc0PF2mo75Z9ErWZK1B45+CW+V6bsTm//8eYhrZlKCuZ138AqzDY6W2UQMAOIhLezEbIi7xH6oAGuCgIX3hYKCZhFfdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fg+QJ1jd; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43cfce3a195so4200362f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2026 05:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776257261; x=1776862061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UnajQ8XOv4b8ZHbW7mJFy+SmDdF5Y0rpVZJX4dT/uKs=;
        b=fg+QJ1jdM1U+9JYftr9loCH3r5mAtsgqj0+5v+OOWqvHHH3rhGeOqAvteX++tUIBrL
         E21eC5OHDssiSOnOAvitUfnfP/+nexA26iYnanGNYrzibO0Yzx2flRqaYDiogsXh/4lJ
         fShN2ML2ge7ihW5VbCw04DhVuaCUNPxZ5rP6CFWmM9KIynB0TKMiPu85dJEzmIOTra6q
         xYaFuVjLO1FJT/Op927wqSfVWNHYffWlHj1L+53Z8UG7Ogi3vMpXIHeapTR81qHSSJ0h
         p09B6+z+zdgl7B9ZMf23WMwHesq32Xagb/CmBxi+6W4iopZdxbh/6u1STe0lhttTbKYE
         +JEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776257261; x=1776862061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UnajQ8XOv4b8ZHbW7mJFy+SmDdF5Y0rpVZJX4dT/uKs=;
        b=om8VIkRCtKaL2YiueHM6xHsX9nXBMMwczpmAwiQ1UhyUfsH6UQv5pnp7dig3QYfLPU
         cIRNJ4DMxAnSoXHMR0xIRcUnkQce2lbaJCn/61zeLo077jEixqetqtvYMHtwtzki4cfj
         NG5T6WQ8//Mw3ld9VbTXrwjALbXnKTedhYCeDbVNExKEXwOHCcmm9n0KsnWzzxCcufF3
         va5QefQDr/gsO39wI9F3gEeddTh3AmgE9ZzM4QXhZydP5tjZNOYxjgFsV7H4D0PIJxx5
         qX7hkWFzNcL2YGzr20YfrwP4xBk/ui/OjY8qAJzSGny64lq6kIArtbjZK+TyxGF/n7a2
         BDCg==
X-Forwarded-Encrypted: i=1; AFNElJ/y1VLcacmxfvCaUmUF64xhXaApZxdwoPTvpBqxP0AWEb3wqfnSGfNGN5q2gncjm9JZJOjNh+SW/Wr4/ogCuLsiIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YysYcdhbUjzoWyJ2zczOkukImjV76/dyz4ylylHo+rqpy6//weU
	yplMdR6+PSMGj7mh8VRkZ/WclEG7i2U2dYYbqyPFtD2Y3zB6+jcvgpXp
X-Gm-Gg: AeBDieutJRnHds0/BakzD2rA4qLSAW7QPbN9WvhX60gV4U9T9NIUwjnpkLN3fygYrwN
	1GNsiJvCJ4GtUBQM/OSLQfs+FfKC9OMsfNUEYPFWrVE4dO8p5n7IcLi6G7rkYQZw9r5bUApn9LS
	9/84fTmkooOGRDO6qjL9WsnrnmVwkfJzrZn7F0LXXz3nYtjBoFfNZrIQwf6LhKP2e4ACmilFaqe
	QfufTHeh3whkxTOkyU75JaF0g8HjRcsuihnPp8mpiRqusLtxsUqmSKdkIDpRr5pdkaqdm06BTOS
	wfmZbJsdg4ZXRh6nWBfvaw7poQrAKia+MCfdvyfXBbmieQl/Tzb1deFtzNN3zKIb8rIBnHvOTzu
	jxt2TuPPubQjowazKhxmq8eTPG9XrE4iWluJqxHZmGz2VNhnj8U0j8nH9mNVmXWqJ4+H0k2FRrH
	YQRNVIDFgjv69bmZZFfu3yFxJg6ydsG0QW6h3qQ4hqwS6I5boG
X-Received: by 2002:a05:6000:40cb:b0:43c:ef4f:79e4 with SMTP id ffacd0b85a97d-43d642b461cmr31372573f8f.37.1776257260716;
        Wed, 15 Apr 2026 05:47:40 -0700 (PDT)
Received: from localhost.localdomain ([2001:41d0:406:c100::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead356616sm5123319f8f.13.2026.04.15.05.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 05:47:40 -0700 (PDT)
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
Subject: [PATCH v5 05/14] ASoC: rsnd: Add audmacpp clock and reset support for RZ/G3E
Date: Wed, 15 Apr 2026 12:47:22 +0000
Message-Id: <20260415124731.3684773-6-john.madieu.xa@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31292-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.985];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 0854340477B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

RZ/G3E requires additional audmapp clock and reset lines for
Audio DMA-PP operation.

Add global audmacpp clock/reset management in rsnd_dma_probe()
using optional APIs to remain transparent to other platforms.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v5:
 - Add comment on audmapp clock/reset acquisition clarifying these are
   optional and transparent to platforms that don't have them in DT,
   per Kuninori's request
 - Drop spurious blank line added to struct rsnd_priv in rsnd.h

v4:
 - Move audmapp_clk and audmapp_rstc from struct rsnd_priv into
   struct rsnd_dma_ctrl

v3: No changes
v2: No changes

 sound/soc/renesas/rcar/dma.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/sound/soc/renesas/rcar/dma.c b/sound/soc/renesas/rcar/dma.c
index 68c859897e68..ab9694589052 100644
--- a/sound/soc/renesas/rcar/dma.c
+++ b/sound/soc/renesas/rcar/dma.c
@@ -47,6 +47,9 @@ struct rsnd_dma_ctrl {
 	phys_addr_t ppres;
 	int dmaen_num;
 	int dmapp_num;
+	/* RZ/G3E: Audio DMAC peri-peri clock and reset */
+	struct clk *audmapp_clk;
+	struct reset_control *audmapp_rstc;
 };
 
 #define rsnd_priv_to_dmac(p)	((struct rsnd_dma_ctrl *)(p)->dma)
@@ -864,6 +867,24 @@ int rsnd_dma_probe(struct rsnd_priv *priv)
 	if (rsnd_is_gen4(priv))
 		goto audmapp_end;
 
+	/*
+	 * Audio DMAC peri-peri clock and reset for RZ/G3E.
+	 * These use optional APIs, so they gracefully return NULL
+	 * (no error) on platforms whose DT does not provide them.
+	 */
+	dmac->audmapp_rstc =
+		devm_reset_control_get_optional_exclusive_deasserted(dev, "audmapp");
+	if (IS_ERR(dmac->audmapp_rstc)) {
+		return dev_err_probe(dev, PTR_ERR(dmac->audmapp_rstc),
+				     "failed to get audmapp reset\n");
+	}
+
+	dmac->audmapp_clk = devm_clk_get_optional_enabled(dev, "audmapp");
+	if (IS_ERR(dmac->audmapp_clk)) {
+		return dev_err_probe(dev, PTR_ERR(dmac->audmapp_clk),
+				     "failed to get audmapp clock\n");
+	}
+
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "audmapp");
 	if (!res) {
 		dev_err(dev, "lack of audmapp in DT\n");
-- 
2.25.1


