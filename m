Return-Path: <linux-renesas-soc+bounces-31229-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIxLMqLA3GkaWAkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31229-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 12:08:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C40A13EA409
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 12:08:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 08C1C3007A70
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 10:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB62F3B895E;
	Mon, 13 Apr 2026 10:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o0IVQzUJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A6F3B7B98
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 10:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776074862; cv=none; b=OpgUNXtVyVdQqi/GWa8dRxLHZJ7UxF16QkB2aDDlOhJX9ZWcWeJWinD3GLEsYv1SkA8WU9ycpxg+MsK9bh2yq0E5LM1yNQ6a3E4bjll9HCHmZmOjm2VYzIC+/GPRxhj8eUcsRVHIfqOykVjYUCLOiseKNRX61F7ibHziMKX5HFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776074862; c=relaxed/simple;
	bh=D+s8GVQ/QM2vK0xezQUADaOx11u8s9xPf3kKowcoFZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W08skXcFENOXFjmNBf/bvkfOAnJI4DyydLm+A9TMBEuqGnBCXc/dDJvfTNRbrUFpYAY4nvqoG1AtAwxvdLNKWPPdczYG45hw6vI7Y+4e+UDikU232Y0FKePOf9zDA1DW1IWu6zimybsjxuQBXkBVyYSxzUtm5U6H2vZiJMOD6EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o0IVQzUJ; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82f37c09352so572101b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 03:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776074861; x=1776679661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2PgkH4WVSPSDvO10sNeJhrjoQgLFADjIHpjqVVMmPg=;
        b=o0IVQzUJsIVAaREADYj0S7ac0lmYXDnHZx8vYYm1XtLq3Ofx6yoILvwfUGf2mkwTcs
         irpZhMIJNC3J3uUn8dUtG2j2epBKl4uLaO5YEEPnlRI7lniPL16MNfEMPJAnsT5KaLlu
         HwKmTI/9y2ms8Ej5iCcKA843LWhJByN0I2td/Z8P7wvystKVZ87uF5/HtwP0aMcRiL9C
         42Q0P5/36HdYb9Cr4ZLAl7SeQpXw9Jf3CAdXwUF5s8qiU7NQlfgy9J66cHZXPlI+Iwsm
         G4j2Klj5jvPSiAatde9C/ZfLeCH1iA4KnH3Fn6lGGbPIWvHEa3fJ+3qg23W30kV8nlPy
         wBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776074861; x=1776679661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m2PgkH4WVSPSDvO10sNeJhrjoQgLFADjIHpjqVVMmPg=;
        b=b9eAiQeA+FSpuTnPpcwfu09ANJfwTsw5AeYjt79FFw020Jhs1JDnmtrQJgC/CiITZS
         QXlExP320M9BvvZuFfJkElofmkNQVUfoW+X/+T5RdYLOI/PTpH0o5Rl7tl5drz9LvmRA
         5Ldk4lFpQUfVS5UqFf/Zu6Fkmueq+ykG2rMuy/WOHP4muIzuRgEQY6MLjYJ6PmDuLKN1
         3bJ4EGojJaWderXUUWpOMLswscvZdhjRWoSQENFYiPEUGqrJs/BHsqmx+4WWjhFhlCrG
         tmOET4A04gaMsw26M+017LaHsSEC4et8YAVEZiujHJyauTKvLQtg7nKMNPUmznSwHR0C
         ebOA==
X-Forwarded-Encrypted: i=1; AFNElJ+VzqvX+vK/QQ2YDW+42/aGTRbHH4O+a2u9TtwI49aA9fb81GmxT8j2X0nsaTOxkJfYCrs0UaSXCq1C+E6PvNU/ZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxE1M4Nr42uF4KbOFEPlkErgho3Bz3KjJrnS6j+H/LmYxGdSTdv
	kvjTKNX/PygTX2VQ0pHhnUHhcoG8wIaOT9FrgfmQXwF/O8G7sasjTruN
X-Gm-Gg: AeBDieuPf7Ud2gj2t0V9zK0QeWsgetmZpqiPSOruqwHA5E5+dU9/E7SYipfaV+xhpH5
	ohn+RgAiaM7nkWfTeLFPqst32udW16OIqv08URrChoxpCKaoDDO6lzA+Fz5iV/XwtGHWRVYdelW
	orumkazIQ4dkEnEwfKR6RW3jnf7XvqKCLhLUZKSy6tZcs1LhaRpysjuUof19OzIe4l7ZTHI9B++
	SC4mv2zJK93ahiDzJhyCul1gM0WTSYiK4hbmfQOhSFTq6KU3Z4GQL0Mhj9Z/iuiE0smiOqBOaBU
	uFVZO9zFYSAoReHr65BFtSZOtO28uiZlML1mHB536ql6agT+LpV7q43fOJkF45d2fUP1FZyJmis
	Exz7P9rSjV3P59cl3DOL/NjT3nY/DoEGFrfyPDLVOH1dOKvxjhGxf3u7cSvYN1fcWjFAXd9bzN6
	bQulkPnXsSoRrUuQmCfYt8jqsTi3ji36UeLd/T+eaVDHe9VQbNj8j5FU14CQ==
X-Received: by 2002:a05:6a00:4218:b0:818:1e8c:a513 with SMTP id d2e1a72fcca58-82f0d1ec525mr9578297b3a.17.1776074860694;
        Mon, 13 Apr 2026 03:07:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50a8f7sm10232140b3a.56.2026.04.13.03.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:07:39 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 3/6] ASoC: renesas: fsi: Fix trigger stop ordering
Date: Mon, 13 Apr 2026 17:06:57 +0700
Message-ID: <20260413100700.30995-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413100700.30995-1-phucduc.bui@gmail.com>
References: <20260413100700.30995-1-phucduc.bui@gmail.com>
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
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,glider.be,perex.cz,suse.com,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-31229-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: C40A13EA409
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: bui duc phuc <phucduc.bui@gmail.com>

Reorder calls to execute fsi_stream_stop() before fsi_hw_shutdown().
This ensures that all register accesses are completed before the clock is
disabled, preventing the system hang observed on r8a7740.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/fsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 109e06b5f32d..9df3e91ac79c 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1606,9 +1606,9 @@ static int fsi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
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


