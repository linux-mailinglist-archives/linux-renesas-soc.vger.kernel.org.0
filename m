Return-Path: <linux-renesas-soc+bounces-31181-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BC7J4g02ml9zAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31181-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 13:46:16 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 810B03DF94D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 13:46:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C41C0303E5BF
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 11:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F6C835E944;
	Sat, 11 Apr 2026 11:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FMT5r8zZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC6835CB89
	for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Apr 2026 11:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775907819; cv=none; b=PnhlQOGG/gnyEhBeDGGEPuJRyvC+qaho3nKKCVHqm6zb22KlVmiP0EDOq2/BBIV51DwTLG0GfJYvkLBa0HWbwBx08dwhIVWxc9qhtDNZFgDusKJQtLsyNumtcMSvqO9ATl3zle7Vv5+8UYqKUWSPiVB8/Z+Iw17Ux3ln4CRIoUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775907819; c=relaxed/simple;
	bh=FpCWJ1/MY4BN1v1ry6eYA3qXFhCvUdewz0pHLK1RDgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sHW0AqFWp+pfnJixlTTClUx+suPe6jCUHPF+JmhC7JFgs74nnUUjgnjk9h2XpzjlsDG9uvNm9sBE3Ai6hHP5XNrCKNc5DL/i/fAf7BR4dj3mpguaEHEi1BvZLJ2RJqSnMORbFkaVO7uJpjG7DHBlksB90qEhuJmP9kqB8lcbPmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=FMT5r8zZ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43b8982c2f4so1721757f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Apr 2026 04:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775907815; x=1776512615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=278h+cjHuGOS99RHJ8gfM7jOA+QjEIxjWNs1as6pY7E=;
        b=FMT5r8zZ0GqmJhNImWqWntYRSQ08KRs/R1J8N5YJFZTjn+Gxnrg1hZihd6x35QHH6/
         SHkVjUPupmo8meiRrsdzhGQbx7eSk91bUKdJyjmb/lh+jO3j+SumlwN/KU0DyE9+/j8i
         lKligzr6mZWbk9UdW9f/ggQA+lLwq/tMpxH5PMR480uXF3OLwfFgNHkjKAZ2FkKhr6Oy
         AhO8vWrz5qPOrQ/+y1m2bxEhm7z/SK+eTvwq0siJGjkrskbgtGSKs67u9E/H31NxAHvw
         LIZfREL5VtlXnYigoxcekg5KLayyvO6CiF506yVKv7ukjbngUMun2q2xDUQ/+wPM8hiM
         J6UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775907815; x=1776512615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=278h+cjHuGOS99RHJ8gfM7jOA+QjEIxjWNs1as6pY7E=;
        b=Kot+DlyQcyLDM2jb9E+JwmUtDFMQlf5ejs02tpfuyQmzY2PnHy/K8WBMAcwPVCcG+j
         LLzQ2gEu+GkVLJSnVlSRTh93zVveoufJJuIsCPeoV/lqFSem9BUlbEB6KreX11cuHBnt
         b4AEadG8E1pvakZ7C3fPRFdeBAX7Pa3/VIF/v7J1NOTaIuVe/OZmG1dmCvoovM7sNsQW
         tS6bWMgtMwCv8T3vxb52SWxeEKJAe/nfUMJeZRP1LCPBRZ8yjVRwqH75xysAaxkjgyAs
         /4nKldDYhpvPWE6SxQpy7WVFWxMOQVYB9UjdqJfVhIf41MWnf+wADoM7epa161NPAQwA
         6muQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJryc91ZdcbeEkAbCPfSqvkE/T2MMTBKfi8awHL+X2lef7lidS8/iBmk5tAQYesUvHa++tDzvTDZ5/DldORqHhcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVYu9jJAvglN2ZhT8amrhatVuSVrlDLi298WJOJ8B8Pl16DmbM
	yA6jTsJZTJvrn36Umqc7rsqmWCj76XgeizphxGw65BWFu/yw5D9DlD0R6ERngokUUss=
X-Gm-Gg: AeBDiesAEVyoXMc5Ue+InPwzbB/9aO4IvkoFksNOR3RKDqSen9hH00Laj0RzSCRPo/c
	QDUJ/AdKzZhqxvkW/UCPF/RWH8+mcvMrYYPrvcoIfVnYFFUfk3kSbfLeZQL+qDPxw+JI+XU7R8d
	GEOhOhWhnVGIrHovIYEw2EIDLtYQvSR/E397h3tV1v+KemZlc5XfRwqftGPA3Q6p5+sf69QfuWz
	8LYoGCYpRF2s5gQrF5pZsaNdmAKP3TMN+kz6H8fdfSJlpMzfi8VczHFYNt4MBlGV9MQ8pYRQv/d
	cmKrK/LegeCSsGOACkCkEX2uUQZSoWkDi/PgScrLbjJV0wkN5b7YrEQoiuxglGDhgmGJnMuNI25
	gQANRIcwtoJ6NAxd8oUxXhJzDte1rFNqkcebQ3FzoKTwRD/A+OplIyg0CwoDgV0fNMk5+CgWF8H
	AwauJSi7xuN5Xa3ayZNpc2kBN7vaI0V//mN4g8EgR/GPdjslTyMaS6
X-Received: by 2002:a05:6000:18a9:b0:43c:fde6:212e with SMTP id ffacd0b85a97d-43d642b8ebemr10073612f8f.24.1775907814878;
        Sat, 11 Apr 2026 04:43:34 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm15776447f8f.33.2026.04.11.04.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 04:43:33 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	fabrizio.castro.jz@renesas.com,
	long.luu.ur@renesas.com
Cc: claudiu.beznea@tuxon.dev,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 15/17] ASoC: renesas: rz-ssi: Add pause support
Date: Sat, 11 Apr 2026 14:43:01 +0300
Message-ID: <20260411114303.2814115-16-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260411114303.2814115-1-claudiu.beznea.uj@bp.renesas.com>
References: <20260411114303.2814115-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31181-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[tuxon.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,bp.renesas.com,pengutronix.de,glider.be,renesas.com];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:mid,tuxon.dev:dkim]
X-Rspamd-Queue-Id: 810B03DF94D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add pause support as a preparatory step to switch to PCM dmaengine APIs.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

Changes in v3:
- none, this patch is new

 sound/soc/renesas/rz-ssi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 71e434cfe07b..d4e1dded3a9c 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -847,6 +847,7 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		ret = rz_ssi_trigger_resume(ssi, strm);
 		if (ret)
 			return ret;
@@ -888,6 +889,7 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 		break;
 
 	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		rz_ssi_stop(ssi, strm);
 		break;
 
@@ -1054,7 +1056,8 @@ static const struct snd_pcm_hardware rz_ssi_pcm_hardware = {
 	.info			= SNDRV_PCM_INFO_INTERLEAVED	|
 				  SNDRV_PCM_INFO_MMAP		|
 				  SNDRV_PCM_INFO_MMAP_VALID	|
-				  SNDRV_PCM_INFO_RESUME,
+				  SNDRV_PCM_INFO_RESUME		|
+				  SNDRV_PCM_INFO_PAUSE,
 	.buffer_bytes_max	= PREALLOC_BUFFER,
 	.period_bytes_min	= 32,
 	.period_bytes_max	= 8192,
-- 
2.43.0


