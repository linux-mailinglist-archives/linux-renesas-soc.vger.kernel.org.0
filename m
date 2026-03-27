Return-Path: <linux-renesas-soc+bounces-30430-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAXsBSNdxmm+JAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30430-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 11:34:11 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7329D3429E1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 11:34:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB6B93003316
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 10:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E815E33ADA7;
	Fri, 27 Mar 2026 10:33:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454FE283FEA;
	Fri, 27 Mar 2026 10:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.43.8.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774607597; cv=none; b=t9oHaICZnsRNLO7GOYnhXX7L8V+T1THmuMEa3+Zrv9CdqvxFKc5UeHWVDR6hSOITSqSP8P4TQZmhC0IntEcijtL+qepMdnQv9IO05tlXQGb73IEfH5WFx33DM44tRLKteGRTe3NsmlXJ7F/VbHrbkxJb1SwjnVeZ+MV9NkwM2Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774607597; c=relaxed/simple;
	bh=Gw2PRfbrSUg2/Hcpk+ygsAvymLMZcQ6uodTILtfVlMM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c/JVlVrs+UDNJn9e4ByI4nyyJMh3+qlXrj7IlOAAqH5KSuRsPk8m6P8utwTgSeIuOM+aA/U8EwEjrUdvrxfFBU8r80/tHYuGgyTzESzFnqPXSMU/J0nwNpPAsn+LmOqa+yUUqI2c7VW6N8razuO6oxSC6MWpbcVS/8TaQ3o8FfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=193.43.8.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from boringlust.malta.altlinux.ru (obninsk.basealt.ru [217.15.195.17])
	(Authenticated sender: rastyoginds)
	by air.basealt.ru (Postfix) with ESMTPSA id 814C3233A9;
	Fri, 27 Mar 2026 13:33:12 +0300 (MSK)
From: gerben@altlinux.org
To: kuninori.morimoto.gx@renesas.com
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] ASoC: rsnd: Fix potential out-of-bounds access of component_dais[]
Date: Fri, 27 Mar 2026 13:33:11 +0300
Message-ID: <20260327103311.459239-1-gerben@altlinux.org>
X-Mailer: git-send-email 2.42.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,suse.com,vger.kernel.org,linuxtesting.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[altlinux.org];
	TAGGED_FROM(0.00)[bounces-30430-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NO_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gerben@altlinux.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxtesting.org:url]
X-Rspamd-Queue-Id: 7329D3429E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Denis Rastyogin <gerben@altlinux.org>

component_dais[RSND_MAX_COMPONENT] is initially zero-initialized
and later populated in rsnd_dai_of_node(). However, the existing boundary check:
  if (i >= RSND_MAX_COMPONENT)

does not guarantee that the last valid element remains zero. As a result,
the loop can rely on component_dais[RSND_MAX_COMPONENT] being zero,
which may lead to an out-of-bounds access.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 547b02f74e4a ("ASoC: rsnd: enable multi Component support for Audio Graph Card/Card2")
Signed-off-by: Denis Rastyogin <gerben@altlinux.org>
---
 sound/soc/renesas/rcar/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rcar/core.c b/sound/soc/renesas/rcar/core.c
index 69fb19964a71..2dc078358612 100644
--- a/sound/soc/renesas/rcar/core.c
+++ b/sound/soc/renesas/rcar/core.c
@@ -1974,7 +1974,7 @@ static int rsnd_probe(struct platform_device *pdev)
 	 *	asoc register
 	 */
 	ci = 0;
-	for (i = 0; priv->component_dais[i] > 0; i++) {
+	for (i = 0; i < RSND_MAX_COMPONENT && priv->component_dais[i] > 0; i++) {
 		int nr = priv->component_dais[i];
 
 		ret = devm_snd_soc_register_component(dev, &rsnd_soc_component,
-- 
2.42.2


