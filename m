Return-Path: <linux-renesas-soc+bounces-31400-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGxlM+AE5mkIqgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31400-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 12:50:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 787D042998D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 12:50:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0634D3070F19
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 10:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F8239D6F1;
	Mon, 20 Apr 2026 10:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qrELNSXo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8282339C015
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Apr 2026 10:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776681824; cv=none; b=erkEYUu9+FO731ktETlyl646o7OSN5rUJZ+AuN04yeeB1Z/hqWwFgXgtXaCd6KcKcEkg20iKbGZBUf+CWLUGDURLr3tnu48Jxf2rWbUYjnR3iKqdcjWt05jkjceeup3nfOxiS8jNaam0eZ1nkuDPnGx6L8T6CkO/RDt2i/FUX7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776681824; c=relaxed/simple;
	bh=V6vPZIO14rznHl4RSRcL1gjxUChfhoafHLXw4fi8css=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OVSl/Q4dRerW8MuEl2VNlw0wHljJ/tyXl+5Xi6QEY2P70eV7Up7AeJsaEpgMmmjwI+Qjrk2wZ/qJuWuNDKMCkrny8KIHq59RAyTKPvv7xgMf0EtzaOvN4ehWlEE3wLl6ecOrJdHV/G3ms4S9gSaLsmKUdduz6Pw2gWpWwA8fCyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qrELNSXo; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d0deb7ad5so2253259f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Apr 2026 03:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776681821; x=1777286621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdTM6lxXBPg35ylfZyqHqOCqKgb9cxeDIMetQfd6nAs=;
        b=qrELNSXogwaUF9nnsxcGOC8ZbOIwdjSg6KGzByj3eWxQOx5CxwaXBgiKRS4TpaeyOv
         DxUv7ECn10X5DvKQotVCGAabW0rtPUTP+eRVuCJ/yJGaaS7p/vVfLqsOf4GTchEdgINb
         DcynT8Y2Ghb/1L3DfgoIHYbNM+3Pxnm926XF1cLxbkfMd0YXF7u2xbxeuFS8VHH7bFAI
         I+Bqie6zUOFHM1KZpFn09ITEzPK87ebMz+AlURnzwahQuLw1bBX2xqlyaIBw6rwrA3o6
         jZGNJX0Fnf5XJwm7We2hGvcAJ4cMsmxERG6KRbRkkIa/Zz1y/YXlQOQgH+VVnaHZcXT2
         nBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776681821; x=1777286621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bdTM6lxXBPg35ylfZyqHqOCqKgb9cxeDIMetQfd6nAs=;
        b=V7wpHUR8VC48pswai+gFNVfjWgt0xFJOBkFSJ6ZTaryQ9Ah07P1PoKPu01984zpgQq
         V3jrE1DSps7BGQwSX+O9Esbdz2pdWshrAJ2VLJf7rDW1RzdyeHhUd1uXqxC25uNaBrdg
         /E9rLk02kLerCVHdwL87Bc8as3De9f5Ss14g7iOGLOeeNWO1b4JbOB8x75aKxiR9OzcU
         QEoTtm1EICpbx/5D72CHAyauu6jxEEkBgq7+OEQ2B3MfsGcTNcQZZgJ773zNn6n/SiQq
         xeu/vfh7sll7yJR5aCPH04Nm1O3itK8MZuflkJM1oQenrD4UMxSlQ/quviz7HMOEErCY
         2C+A==
X-Forwarded-Encrypted: i=1; AFNElJ+qZK2YvhkX05tQnw6MXraG3cM2AS0eZn1KJWikdcN78+jcS0hQRaYF3IueNWWG+l1FpRk1c1+MiA5OokeV2d+Weg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6IS54tLphDAGIo3XGK42U0fNSZkXYbqIlD3eb8TFxi82UtS7K
	l5oQbNQmBILM3wKHCi1XRBul/QcN6MfHmlr8Y0iX8yZ8UwLwCkSE1xYm
X-Gm-Gg: AeBDiev9n+rL71IyuzecKWOU/QPab+ukWzce5BbfQ4V0AqLcJ74YpKzb8vtwiKUGmF3
	EJKfpv9gztLZ6sdTV4TimZnZiDJxzEkhRfXOnfnCdAn/Auc9EEDAHHqmJLz4VD9EojXQL2o+Q8N
	9RFB0FjVD+lRRf1uW6VIGna6cc0l0A9QyEksIKwB9rvxiQVBaftvOQlxre5yWmoZyUdlZECo5oJ
	tKhCSOUqG6k9t9JbkdYtToD9YhM3Nauve1GDs9yhMiTVcXhVbg5U/R75RCoSA8z+gYgjNGzH8yP
	cWbKJuWbNvrtbI/Y9Ezb2n/1kw5xbXN85xqQW1hde+BXm4ozDf8OkLkEdUeDRT7I2FuFPpoudmZ
	nOBJBRyNcJbx35cH8aELt1FDLpRdPV8utHcysDrwF5UzuO8+E2H10p79XPPwURoihoJj0UJOzl1
	zV6+K+N+qYVEv8krd+X7lWtFmhgPkPQvc8U6B7PiK9p7ImBOG839wWc+FdT5tYfXtFzLxDGg==
X-Received: by 2002:a05:6000:26cf:b0:43d:6787:992f with SMTP id ffacd0b85a97d-43fe3db2d27mr20233365f8f.10.1776681820855;
        Mon, 20 Apr 2026 03:43:40 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:5f3e:f914:6f8c:72c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4c221cdsm28038301f8f.0.2026.04.20.03.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 03:43:40 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v5 6/9] pwm: rzg2l-gpt: Add prescale_mult variable to struct rzg2l_gpt_info
Date: Mon, 20 Apr 2026 11:43:23 +0100
Message-ID: <20260420104332.153640-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420104332.153640-1-biju.das.jz@bp.renesas.com>
References: <20260420104332.153640-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31400-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 787D042998D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

RZ/G3E GPT IP has prescale factor power of 2 where as that of RZ/G2L is 4.
Add prescale_mult variable to struct rzg2l_gpt_info for handling this
difference.

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * No change.
v3->v4:
 * Updated commit header and description
 * Renamed prescale_pow_of_two_mult_factor->prescale_mult
v2->v3:
 * No change.
v1->v2:
 * Collected tag.
---
 drivers/pwm/pwm-rzg2l-gpt.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
index af594c1ce536..4324ffc8629d 100644
--- a/drivers/pwm/pwm-rzg2l-gpt.c
+++ b/drivers/pwm/pwm-rzg2l-gpt.c
@@ -92,6 +92,7 @@
 
 struct rzg2l_gpt_info {
 	u32 gtcr_tpcs;
+	u8 prescale_mult;
 };
 
 struct rzg2l_gpt_chip {
@@ -234,6 +235,7 @@ static void rzg2l_gpt_disable(struct rzg2l_gpt_chip *rzg2l_gpt,
 static u64 rzg2l_gpt_calculate_period_or_duty(struct rzg2l_gpt_chip *rzg2l_gpt,
 					      u32 val, u8 prescale)
 {
+	const struct rzg2l_gpt_info *info = rzg2l_gpt->info;
 	u64 tmp;
 
 	/*
@@ -243,15 +245,18 @@ static u64 rzg2l_gpt_calculate_period_or_duty(struct rzg2l_gpt_chip *rzg2l_gpt,
 	 *     < 2^32 * 2^10 * 2^20
 	 *     = 2^62
 	 */
-	tmp = (u64)val << (2 * prescale);
+	tmp = (u64)val << (info->prescale_mult * prescale);
 	tmp *= USEC_PER_SEC;
 
 	return DIV64_U64_ROUND_UP(tmp, rzg2l_gpt->rate_khz);
 }
 
-static u32 rzg2l_gpt_calculate_pv_or_dc(u64 period_or_duty_cycle, u8 prescale)
+static u32 rzg2l_gpt_calculate_pv_or_dc(const struct rzg2l_gpt_info *info,
+					u64 period_or_duty_cycle, u8 prescale)
 {
-	return min_t(u64, DIV_ROUND_DOWN_ULL(period_or_duty_cycle, 1 << (2 * prescale)),
+	return min_t(u64,
+		     DIV_ROUND_DOWN_ULL(period_or_duty_cycle,
+					1 << (info->prescale_mult * prescale)),
 		     U32_MAX);
 }
 
@@ -262,6 +267,7 @@ static int rzg2l_gpt_round_waveform_tohw(struct pwm_chip *chip,
 
 {
 	struct rzg2l_gpt_chip *rzg2l_gpt = to_rzg2l_gpt_chip(chip);
+	const struct rzg2l_gpt_info *info = rzg2l_gpt->info;
 	struct rzg2l_gpt_waveform *wfhw = _wfhw;
 	bool is_small_second_period = false;
 	u8 ch = RZG2L_GET_CH(pwm->hwpwm);
@@ -299,8 +305,8 @@ static int rzg2l_gpt_round_waveform_tohw(struct pwm_chip *chip,
 		}
 	}
 
-	wfhw->prescale = rzg2l_gpt_calculate_prescale(period_ticks);
-	pv = rzg2l_gpt_calculate_pv_or_dc(period_ticks, wfhw->prescale);
+	wfhw->prescale = rzg2l_gpt_calculate_prescale(rzg2l_gpt, period_ticks);
+	pv = rzg2l_gpt_calculate_pv_or_dc(info, period_ticks, wfhw->prescale);
 	wfhw->gtpr = pv;
 	wfhw->gtccr = 0;
 	if (is_small_second_period)
@@ -309,7 +315,7 @@ static int rzg2l_gpt_round_waveform_tohw(struct pwm_chip *chip,
 	duty_ticks = mul_u64_u64_div_u64(wf->duty_length_ns, rzg2l_gpt->rate_khz, USEC_PER_SEC);
 	if (duty_ticks > RZG2L_MAX_TICKS)
 		duty_ticks = RZG2L_MAX_TICKS;
-	dc = rzg2l_gpt_calculate_pv_or_dc(duty_ticks, wfhw->prescale);
+	dc = rzg2l_gpt_calculate_pv_or_dc(info, duty_ticks, wfhw->prescale);
 	wfhw->gtccr = dc;
 
 	/*
@@ -582,6 +588,7 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
 
 static const struct rzg2l_gpt_info rzg2l_data = {
 	.gtcr_tpcs = RZG2L_GTCR_TPCS,
+	.prescale_mult = 2,
 };
 
 static const struct of_device_id rzg2l_gpt_of_table[] = {
-- 
2.43.0


