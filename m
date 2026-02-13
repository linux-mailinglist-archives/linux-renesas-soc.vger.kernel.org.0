Return-Path: <linux-renesas-soc+bounces-28203-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Gq1KGNej2mtQgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28203-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Feb 2026 18:24:51 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EDD1389C0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Feb 2026 18:24:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4CEF7303B4EE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Feb 2026 17:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE52A35D5FE;
	Fri, 13 Feb 2026 17:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="TX2XHw3U"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D16361649
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Feb 2026 17:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771003483; cv=none; b=GOfKp0XI6XAxVPWa/5+lUdQW0RNOFUMAYq+ZAZ0LPYO9+jne+yLIV4gl/QRtmp2YLVdtDjdeV72cWkff6tKcKnh9xASa/Qx9am6J5+hMcidXNn6+RbTEDCimPwnfw2ZDpqkcwcqfXFj1z6awiNjtr/fzgR1Uk7xpjYHKgayMODg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771003483; c=relaxed/simple;
	bh=ZJTe3ERC+VD+X7F+RyeaF6x+oVdC81oxkUJxpf7zUuw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ILT8WJuHHqLOgFS5nzr05c1UNSQTP9jNJt16PHyWY4SLu2ng3oIWf3Kh4sMa9NkKoszBSedXB+hSaE4FAg1R7NCtCwGAYqZdrDfehbVBY93hL1bG45iiBVJgejVKEFw7U0/C2hPIsQrXyd5Z2+sFJHLeqEV7m/49M6v8OioD+Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=TX2XHw3U; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4359a316d89so933537f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Feb 2026 09:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1771003480; x=1771608280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1zG5+UDdMMHpsekyaasD3SxdlSC1EMGJd2kbTx0zrDE=;
        b=TX2XHw3UBKqV9yO0+BI8SxuDnlIsknR5Q/7bYaI/ePp0mCJzZqxIqsKFaXFUZA/JTD
         j/cfZn6zZa96iS5N2Ne5Y0/Xi+M04zJjCpqpjTS+9QUKSZTFiBCGNdVcvZCsdOjNYNUy
         xUGYzRDMtCUu1WIYOCqxPy/UEctT+O2o+ire2xP7TRjQbi/vaNi3r/f2lW2nJ4Sv/7lU
         F9TAJHV6fx4E2YP2gjlh46cSg+gbAY8GVbXAekMsGsf5ylJxos74xfhmUw/wyxAYOTf/
         jmLLg2dj1Aw6SBB7b99VaMuY+qCmFsKwzG9DvasFU+XWco+/92tJfick8qflcDByWxy+
         Xd9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771003480; x=1771608280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1zG5+UDdMMHpsekyaasD3SxdlSC1EMGJd2kbTx0zrDE=;
        b=e8u9WP55k2JjJuEKRYda2lBSK6eMU8xEuf5S9SmBOTf1BmFvD4xeufJihZ1yUvEmoN
         jVssF+UznGl1oPdmWWpFAnFLQu41rE8tSxJB2rUkvK9SjFnnRNkNqSKt5Q1/fuVUzyRt
         AqB4qt4PvZZHXAzcrvu1mqahzElOMpFm6gBhULAU1G0bLgS66xylgTPj9PdHBzOElLNr
         HQLUYVMgxvsj8Lei4eqZcqsahXlWG4N9hjBM/KZZA6Y6o+5XVDfF/c6wOneMPQaM3Ttw
         hp/UKiUjh3h96kEMb+2uoclBA3vwfF6M85Ue+Eeq/1cRTxXlyBRL3RsUive7IB1IKHKf
         Zi/A==
X-Forwarded-Encrypted: i=1; AJvYcCXM1XmV9A/YyLz3bOcx5MWG11aH/FYW493s/5RLwFhIxr30RHj9IT9QeRozCF4OWuTEffK3ElyO/WY6vp45SudEdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YydwCHRMOS/2Yi+n1/D0CppbSYyrlK1uoSUHxrUN41KNLPgsCf8
	enIg0YJ+bQPrk7IRUyNhjXPGj0vpcbFtB0n2GDob/puPgb6gcQkvx+tzH6Y9pK3EmcA=
X-Gm-Gg: AZuq6aK5RcMuBeJqSjlBQ4Sk+5KYqUktSrW3WJp7Ovsujky/Eppoa3N8uT4E0R2E3di
	nR/X6H3bb1bLhSqQ8dhF5AErqicBj6WEMgDKhKtLL/TaydGWLKnt8dKB6/jX2gm/0vJj/G+yPA6
	CKI3/H4DvvIQfcsm1yg4l5ZoASzF/6+kIF3jab+OPZegI2m3e3SlEknlhpp324dr91smyNNkNfQ
	/Iox8QxKHcE+UQTHfNIEPgK50rSupPq6LYAs3caHfo5tmMuNj80PgMI3zNhDAy/7lFEx6J0TX4y
	Yf6bhK8M79HSqV4Zy9Tz06bCiAtLkn6DVqME+Ugm06Wiiwv9PqQ5ouPyBUv7kUjMBNt8cAQtPSC
	DZuS97q9dx/t7y7uYUDl703vYlDfohf3YHft55O+WHIY2txGGU+N43as4r7J3LOXCtWDhApekAN
	L15syff4H5KRT1+96OXpsT2vT3KrBksJvwjLy4ewPUJBbl+z3HRuM0
X-Received: by 2002:a05:6000:2905:b0:437:6ec2:b110 with SMTP id ffacd0b85a97d-43797942efbmr4671769f8f.52.1771003480135;
        Fri, 13 Feb 2026 09:24:40 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796abc85csm6782557f8f.22.2026.02.13.09.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 09:24:39 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: claudiu.beznea@tuxon.dev,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH] ASoC: renesas: rz-ssi: Fix playback and capture
Date: Fri, 13 Feb 2026 19:24:34 +0200
Message-ID: <20260213172434.3801015-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_MATCH_TO(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[tuxon.dev];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,gmail.com,kernel.org,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28203-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: E4EDD1389C0
X-Rspamd-Action: no action

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

In the current codebase the rz_ssi_stream_get() is called at the beginning
of rz_ssi_dai_trigger() before rz_ssi_stream_init() is called.
Since rz_ssi_stream_init() sets the ssi->{playback, capture}->substream,
relying on it in rz_ssi_stream_get() is incorrect. Fix this by checking
substream->stream instead as the original code did.

Fixes: 53dfb2ad6fcf ("ASoC: renesas: rz-ssi: Simplify the logic in rz_ssi_stream_is_play()")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 sound/soc/renesas/rz-ssi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 39aa865bdca3..74e078c04150 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -180,7 +180,7 @@ static inline bool rz_ssi_stream_is_play(struct snd_pcm_substream *substream)
 static inline struct rz_ssi_stream *
 rz_ssi_stream_get(struct rz_ssi_priv *ssi, struct snd_pcm_substream *substream)
 {
-	return (ssi->playback.substream == substream) ? &ssi->playback : &ssi->capture;
+	return (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) ? &ssi->playback : &ssi->capture;
 }
 
 static inline bool rz_ssi_is_dma_enabled(struct rz_ssi_priv *ssi)
-- 
2.43.0


