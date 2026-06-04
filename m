Return-Path: <linux-renesas-soc+bounces-33572-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ITRlMPtNIWqeCwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33572-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 12:05:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DDE63ECBF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 12:05:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=HGoR38PT;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33572-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33572-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 69BDA30CCF2D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jun 2026 09:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EE9D3F1ADB;
	Thu,  4 Jun 2026 09:56:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7363F4110
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Jun 2026 09:56:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780567018; cv=none; b=WZTWXvq37JJS/tukqI8Eomp9tk0Zv3TGdWjxEYygA1mdUhf8ae1OkUjY0nguJPsWeiMYG9vyvrug24AqkrR4G8251Zajj2wFatvnA137/f6bM0cxPABbbzpyGKyHkUJyPbUDa4kUboMrT42d+Dpk2aaNgfOuaAbUVN2jH15SNs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780567018; c=relaxed/simple;
	bh=NlDkVlMm1JuUzeAtDRZB+Iz/R/2FhoZf5pp2LkeDlno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rFl/iJ9y9Q4toHSTuD15746muQlZTMmogSggBBcIEQDvpY6HgbPWeGcLjWlWubJPf9wKuOmlLxj1NO44Ywy2EL8p1gJqo344N9CZBlkTT95w7qGu4L6WVXxvtVLmKj15XDMfcMwFaYl0MF1j1ZNaWh5ZYbDY7ZNM+hQnRDRZEO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HGoR38PT; arc=none smtp.client-ip=209.85.221.48
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-46013161068so237692f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 02:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780567015; x=1781171815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DgXQ8Wjt8CwTPh1rq91BMMsmDAAHzwhsHaimZBrxe6g=;
        b=HGoR38PT4SbCSDnTWDUJ+y+snwDBzNTyuUIL8FK+/zdIlga+C6kBvrXlMGfNk5UE9E
         C6BG8vjw/a7PuzGSAUbbba0u/8kTTDd/uBYkvbgzp/Ceh27JUX/Bzr5njo9uSnNaFNZw
         FYaTmn6S4IUiQKCJvAbmWhpeigXKAfPqxP42coNOmtmOJrlmmEoJUu4jZVKgGahpNt7C
         S0C6e/3pP/SIOf6PgnYVml5fXyFIySzNgboi5Nn2ZJve1FPAaB29nfrBggt/c5NdHrFQ
         vGH9D/PKa/KrQu+w4Bcww1wZKioOaSbSMb3p0Uz7+jRxEypgkX74wM3VWLcYD500ocv+
         YdIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780567015; x=1781171815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DgXQ8Wjt8CwTPh1rq91BMMsmDAAHzwhsHaimZBrxe6g=;
        b=ZT794hwypRbczLPQdBaHYYN76wdHSUN9JQGQxBFJiFFEWYXp/oK2BTUj7vaHHG/wIF
         lENJz28IG6VG+OjIVhysUbAaXgv/jkFuyee0b4VNlXf7duNvSxOullykblSnD4tYQq5B
         uyoeQmeSRIdF8XV+M9K692OEsPq6GTZN77hRlobVh6JMoATD77k2nWT6nceoEB0yinBU
         CtJYOAn3rur7fWW9sDm4O1R1kwKprbmIx178vc7nHb63SB7BPTqqLav6RZI8jj2SlhnV
         wS9y4s4GGc4vkHCUiyfH5xKgPegVi4shx6+aKH6ayk43oNi4bp7/QI2Im/1aN9iB+cu1
         jIpw==
X-Forwarded-Encrypted: i=1; AFNElJ8ao8Tj9ghEG5WRqcLMqZeVF8/+Vq6WsocDkIgUuENRuW4ideCjSJEFNb6x9qiYgDUu/ZfdS8uDFSoFVSzs3oQ55Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNA1hQmkJnPVA6nwgPxrLVFzH1mGgOjeacDh39p9O6q0G8btn4
	4IxJmGluPWwd9LYtB6aoiulD+qD75kXcMLYsx1ipBXh3Ij6a+a5jAHiw
X-Gm-Gg: Acq92OHZGI3qsXsZrwDPgJOp7tgJQFjlClhY3FE/qHikOl9Bxa3PXoK770LsfdtupJ2
	B1JbPtDvhKyRq0vUYtSX0TqDyoqQTZi8FZ2xbWNP8gEIuLrlTJsb8DbuIN9atgDrHAZPY6Na24G
	6HScluh9JuwYh+Enn51DF7X/sXheKlUJHHNt/vZmARlLmMfIqm7cvaovRLyPb58vl/VwKiFXtkr
	jJZ81EpwE2uY8UeJ3vSif9JEdQPZdUkItykvSdaykEoElPXsxkST8+LzX9w5Z3rCillXJ88TGZ5
	n19EzIOYMc+16aIhe2fWKmMyYUvxrm9gFCO6CUEicgrnEaaCshuvYSPQA4KPjKhujnMH4ILuew4
	1lE1cYng4IgYqD8BMLzwWtJ6XtP1ehsfaCUnfCT8QsOqcIngPpppAfl/NnM5cvdDWddamSXzuFr
	AUnNlU7eMAqinivYCuDoJH1dmeBgUFZkH3qgT3TpV0bwRcdI9vhHbnJunmhWU=
X-Received: by 2002:a05:600c:8b01:b0:490:6237:5200 with SMTP id 5b1f17b1804b1-490b5d36863mr117178755e9.10.1780567014917;
        Thu, 04 Jun 2026 02:56:54 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:1615:3574:e0c0:837d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490be1f69bcsm38037335e9.8.2026.06.04.02.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 02:56:54 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v6 05/11] pwm: rzg2l-gpt: Drop unused rzg2l_gpt_chip parameter from rzg2l_gpt_calculate_prescale()
Date: Thu,  4 Jun 2026 10:56:35 +0100
Message-ID: <20260604095647.108654-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604095647.108654-1-biju.das.jz@bp.renesas.com>
References: <20260604095647.108654-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-33572-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ukleinek@kernel.org,m:biju.das.jz@bp.renesas.com,m:linux-pwm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:geert@glider.be,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid,renesas.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 38DDE63ECBF

From: Biju Das <biju.das.jz@bp.renesas.com>

The rzg2l_gpt parameter was passed to rzg2l_gpt_calculate_prescale() but
never used inside the function. Remove it and update the sole call site
accordingly.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
 * No change.
v5:
 * New patch.
---
 drivers/pwm/pwm-rzg2l-gpt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
index 47c6c2eb3067..49b95e53ad83 100644
--- a/drivers/pwm/pwm-rzg2l-gpt.c
+++ b/drivers/pwm/pwm-rzg2l-gpt.c
@@ -132,8 +132,7 @@ static void rzg2l_gpt_modify(struct rzg2l_gpt_chip *rzg2l_gpt, u32 reg, u32 clr,
 			(rzg2l_gpt_read(rzg2l_gpt, reg) & ~clr) | set);
 }
 
-static u8 rzg2l_gpt_calculate_prescale(struct rzg2l_gpt_chip *rzg2l_gpt,
-				       u64 period_ticks)
+static u8 rzg2l_gpt_calculate_prescale(u64 period_ticks)
 {
 	u32 prescaled_period_ticks;
 	u8 prescale;
@@ -300,7 +299,7 @@ static int rzg2l_gpt_config(struct pwm_chip *chip, struct pwm_device *pwm,
 		}
 	}
 
-	prescale = rzg2l_gpt_calculate_prescale(rzg2l_gpt, period_ticks);
+	prescale = rzg2l_gpt_calculate_prescale(period_ticks);
 	pv = rzg2l_gpt_calculate_pv_or_dc(period_ticks, prescale);
 
 	duty_ticks = mul_u64_u64_div_u64(state->duty_cycle, rzg2l_gpt->rate_khz, USEC_PER_SEC);
-- 
2.43.0


