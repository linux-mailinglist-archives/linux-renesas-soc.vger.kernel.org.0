Return-Path: <linux-renesas-soc+bounces-33613-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oj1uNvDAImrYdAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33613-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 14:28:32 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D530364820B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 14:28:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=JoyrZdZJ;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33613-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33613-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3CD31305C353
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jun 2026 12:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78591357D03;
	Fri,  5 Jun 2026 12:20:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A3C4CA299
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Jun 2026 12:20:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662031; cv=none; b=MENxYb3FsYbFl4sgYwvsBCR2vkbbA51u3ErEw2Gxh+DeZMaEGXsRT0ghyxRwkQ8Zl3BSGw14/bwzK8h8wr2zlDiOzq0A35mHRvlouEwtxxOszTY8yCQcTLK42WOofoltyOAx1/qLCAJcxBoXZq4x4TRA/5Gir1Xe8+fKV+u1hYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662031; c=relaxed/simple;
	bh=3GFYui5kLq2EPiPzoe/M8PI+Cp/RAZZ4lW+BTGGq+Mw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s2kylMuDzICth7opksLfmJULnOvGPUodFbwmBAeTFlaO7/s9jH6517Rp6/YZwDvmTiKwzrV4AjKcZGRLixGUlUvjVI17CIfvKg9x1K9ts4ID4fPX9wnOz8cIYcc/sBFeMmHhT7H2lhhHcrgktawh06b0/TvDR67bGauCfvzxH/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JoyrZdZJ; arc=none smtp.client-ip=209.85.216.47
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36dd65b95f2so1294589a91.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Jun 2026 05:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780662029; x=1781266829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D54NjRtBiVnrkV6UxtLEigo2q3b/zdX4gpDk/FWxcIk=;
        b=JoyrZdZJTYhx7vKXz+rSHnM47/Q1UP5z/goI1JJOwb1mwEF1hVuvD4tX06BUl7V22s
         9UyiwjPfE6rbJwgGL520fvsdg2K9vVG3o/mmObeQe5cPW0uk5PMyw9d0/D24T1/eGGaQ
         w4uFrakrfPX4G+rN0hof7zugWjteRhk3fSFLdZJvlEDDyyG4oejcjUTLbMatrqjWQbxv
         a22vWshJWo/OmLQlL19LsJ+D77OdeOTOO32rCbDURPjgIr8a1CGaWvOv3RcfN1DC7LgU
         uOPYn6v4E1EBha/B9SmnSuyI4M3qOcVxgTXfFQYaDRGB7QDDy4B7WLqMZME009MjbGRm
         riVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662029; x=1781266829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D54NjRtBiVnrkV6UxtLEigo2q3b/zdX4gpDk/FWxcIk=;
        b=FKGHRR5tB4QyLSkpiJ4KRMnq2lDtTOPFdpc3YSV/fan50L8OL7pHWz06f0uO5UOpJR
         ei/GoaJ/H4TXHelplB0JbFzIy/DKevGps5CKmp5/8lJCccOmvS3cb1txVcOwMsYxcMPQ
         Xz0IwXVFCc4kNZNdct+S3F3IfX7556BjK4v82gBBMh/DaZDSBWl9Zi5eSxaAtHBbXT5f
         JGuDdntDX6SFtyesoAY6FvDze7rgukfW08q6scm+z/574v7b5z0GVu4vBWPvf9Vb80l5
         XdnavT6GQeLyJKX5QDu3qzIN9pJXqjCCbE10S7CbyjHqaWn3c2B1Ze0IUyitLN6fnpy3
         McbQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Ytwmoz3iVBEzdrn8JXg3TaM7y+CknU1eFpP08f/oaYD+H63glc95BWgfhHypE0BXFavB4vAcvbNPWUBU3Yc1mgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzplYWlisK2TPvWZy+PsxhJmWHmspTQ0ty6ZgVveUAI+FIgQ8DR
	buG9d2B9OeihXqHW/vQZZhPzh/3/r1g0Sw2/77+ybGERIUtg7rFvS/HE
X-Gm-Gg: Acq92OG0C2F7fSvubgcR4M+U0zTH6rUDaccHo4BTf6flKUImqb0Tglrjtj3efxfimHD
	JFXfxbVPNUMqem0rwAEVuP2AxuTBDYmuP97+XbSpEJ5TYC7Jm8ouWu+vJCgPluF55MKg1NHXJop
	1VDHXg1yGQOS5Ai+23MF3xbRlGmqTJcFjXOr/a/HDuGDdACeZnQpfyE7KrBUu7fJbmfBoNMU2f9
	9x645tYt0JuyoqdwmOH1nu02DVPdjHMSfH+2iv/eUPqLd4IoAp8y8l6X+1VRY3JyOdosE+fSO6s
	AjomXiTq3u4RUXCPn6KTID78bcbGmRXPzhlrAroFa1ORBIo+TPOJcE7Af1F2clI/20gnqUTeUku
	uOJM5Ja8g2DUUXRaKuqL0rs7U7xHGeHK5Q+Oml7AphN3eeBsOz106UqE8AhSoXxB2MYYMG5K2jP
	faJc2EYCadSJ2OUyUJfXZFHzhW5ml1fg04K032yy34Db+ilmkIuUxgGRR9G2rryBom9XOU
X-Received: by 2002:a17:90b:2f0d:b0:368:3830:a8bd with SMTP id 98e67ed59e1d1-37131041514mr2123116a91.7.1780662029184;
        Fri, 05 Jun 2026 05:20:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221059sm8594381b3a.7.2026.06.05.05.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:28 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 03/10] ASoC: renesas: fsi: Fix trigger stop ordering
Date: Fri,  5 Jun 2026 19:19:47 +0700
Message-ID: <20260605121955.105661-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605121955.105661-1-phucduc.bui@gmail.com>
References: <20260605121955.105661-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-33613-lists,linux-renesas-soc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kuninori.morimoto.gx@renesas.com,m:broonie@kernel.org,m:geert+renesas@glider.be,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phucduc.bui@gmail.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:phucducbui@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D530364820B

From: bui duc phuc <phucduc.bui@gmail.com>

Call fsi_stream_stop() before fsi_hw_shutdown(). This matches the existing
order in the suspend path.
This change ensures all register accesses during stream shutdown are fully
completed before disabling the clocks.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v4:
 - update commit messages 

 sound/soc/renesas/fsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 8cbd7acc26f4..94ab2e490810 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1586,9 +1586,9 @@ static int fsi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 			ret = fsi_stream_transfer(io);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
+		fsi_stream_stop(fsi, io);
 		if (!ret)
 			ret = fsi_hw_shutdown(fsi, dai->dev);
-		fsi_stream_stop(fsi, io);
 		fsi_stream_quit(fsi, io);
 		break;
 	}
-- 
2.43.0


