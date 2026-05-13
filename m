Return-Path: <linux-renesas-soc+bounces-32566-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDeFLEtmBGqXIAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32566-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 13:53:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0C2532976
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 13:53:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0ED6F30285FE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 11:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47A6401494;
	Wed, 13 May 2026 11:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sacaO8BL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4654C3FFAB1
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 May 2026 11:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778673201; cv=none; b=p9EO51JHnqnzh245GEgdN5mEHsr1/X4G9HxpesyEQpz0HZw7JhVOgITCKDicojk5E33ztd+SzeOXx+GiqFRFfTYYcZYlcMnlgxxVlFSAiQPaqFn8jx8Z2bEWRP0bWmoUoKaSzvWpFE8tu5lfBe/lumu8oFfcc0+uUPYMa4RXCPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778673201; c=relaxed/simple;
	bh=wd7K+rVMSTZERWCQyiRXKMRy+tlsG+IybU2O7dvOLz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HxuwwdTaUbf2BDIfIdfB/lA5A/GzB2Gy5pGufheJ7DYz6MHnVAO0XfQuImzsil/uw1qUwZTjo747954hmIqqKkL4DNK4VRmDF2xDiGlW0VQp/fBseO2BJ087GPUUXvH3nHfULWAr8rezbOOR2RnJSXCoy0ExuCyDhrIIuDURv7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sacaO8BL; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-44a5174670eso3745942f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 May 2026 04:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778673199; x=1779277999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0epLdr6Sz9bYkE7idxtlbU5atEv15BhKtp2tZA62k9s=;
        b=sacaO8BLnL2OKTW6tnv3yx9+A3z58+26xN6bjTXmSXwfuLRD88W8KS52u6+sJz6fkO
         P+ftIi4oORBkiJEZEEDF7JzYEqhx11N0z6gvx+wEydbKOw3VToJiUGMoBvmj4o0/Wknx
         KbwAwL370PysVgDRks1N30PgKU+QYcPOzweWDHMk6kCHgwfLrK2V0heXynqS1JhaIoK0
         eyWeKVqGkzrp+Zg+ld3lvALoDADiBMqnhcmOy4OSy5TOUlw4lPJcEuNOH5ZPIVIp3mE3
         8r9wjnT5YoQymqsEokYq8MwyKF77Oa0YKPImPg06rJNO9Ov4vqaqHz8Mrc5MKoqhShDW
         Y4CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778673199; x=1779277999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0epLdr6Sz9bYkE7idxtlbU5atEv15BhKtp2tZA62k9s=;
        b=KAlpe6NyfsBfJ5cPF/cNsxfcp61BX1kQKJHnYHrpqQTErx6vJpcrJlAMUZn7EuJn3y
         2x18c3n4hPoNerrLHpRPjJ4qc7gz9qFu2UmPgJ7rZP791VE4mPZglkLoaQNfwkrmKqfI
         IU0qrCLnoiBm1zgM9VKeoOrMJuqKc0AT0aZi0eX+PJztQMnqb33v7C1/CEKAvpP4rGGi
         XSN9R3Tkujng0hp4L+J4Cv3QTRJ/WTpDjTXPRrOFcahV9uBr0bVK7Te+l/OfQHKHOnbM
         V6RfpyJrqbmEKtK0TO8St8xNYr315ERMnNYXW/eD0IxfdpxxaSBb0IDTnmS+K5tWa6tx
         111g==
X-Gm-Message-State: AOJu0Yx3UU92Q7Cca6tFcAAzFuSPBdQbmjUkrkuxp7Ru9o/cYRBEKS6h
	Yz8a/Tzgn3fdXXiC3DDpHiTTwOMgG3M6PO71RVel1Y6Jdfkg6GR0QWNj
X-Gm-Gg: Acq92OEHUutUFNTwhu/BO+MFkjkMSo09V8GOWCqM3RpJm4oKFqo/PdvXYA3GdxLhzIs
	YLcZ9zTMptkf21EjZKZnsWhm30kK5rJIZlXDrs+VZtfI+0KbhlKXVHMPMeTwUbKwvGdLsGwBIYe
	PevLTUrhBPibl7xW2euKka/zhhbj8Tt+AZc/393A0VDPFdOQPPOKm+ijgKHK+CJ6JhF0UTgmo8f
	kkdEcPuVT1aEDEv9FrdVUBSbzm0LSqzHv8LGOeutiTJzsKo2ZKwgSf7XZxV3PXasFMVwu9cnTvv
	UpCRK0+n/PKATF8KNWdDj5t2ySMFIqkTZVRAQZxs/pHPhNCkqygDTvEYJFEL82hZblVwr4j7LB9
	r0ImHicL58NrPc/ZPzXGdG93koTVFy/dGHr+xd2/j5kPntjEUu/StD5qODtYH4JIBTPcao+LnjZ
	J/dhUPqi0o3+2SrCUjanEpoDP+HvwbuSyXNyN3itx+S5QJvtsYAqhBgK/zre/5zQEYfj+1Whef6
	1xfwplGSYcaRnrf0sddCA31AsPWvi839nOUKw==
X-Received: by 2002:a05:6000:1a8a:b0:452:c246:ab6a with SMTP id ffacd0b85a97d-45c79f29761mr4062284f8f.26.1778673198667;
        Wed, 13 May 2026 04:53:18 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3e5f:9005:e5d2:460e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6aea4sm46402603f8f.10.2026.05.13.04.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 04:53:18 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] pinctrl: renesas: rzt2h: Skip PFC mode configuration if already set
Date: Wed, 13 May 2026 12:53:12 +0100
Message-ID: <20260513115312.1574367-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513115312.1574367-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260513115312.1574367-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5F0C2532976
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-32566-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

In rzt2h_pinctrl_set_pfc_mode(), read the PMC and PFC registers upfront
and skip the pin function configuration if the pin is already in
peripheral mode with the desired function.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzt2h.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzt2h.c b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
index 4b790fa72b49..3945c891248b 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
@@ -188,8 +188,18 @@ static void rzt2h_pinctrl_set_pfc_mode(struct rzt2h_pinctrl *pctrl,
 {
 	u64 reg64;
 	u16 reg16;
+	u8 pmc;
 
 	guard(raw_spinlock_irqsave)(&pctrl->lock);
+	reg64 = rzt2h_pinctrl_readq(pctrl, port, PFC(port));
+	pmc = rzt2h_pinctrl_readb(pctrl, port, PMC(port));
+	/* Check if pin is already configured to the desired function */
+	if (pmc & BIT(pin)) {
+		u8 current_func = field_get(PFC_PIN_MASK(pin), reg64);
+
+		if (current_func == func)
+			return;
+	}
 
 	/* Set pin to 'Non-use (Hi-Z input protection)'  */
 	reg16 = rzt2h_pinctrl_readw(pctrl, port, PM(port));
@@ -200,7 +210,6 @@ static void rzt2h_pinctrl_set_pfc_mode(struct rzt2h_pinctrl *pctrl,
 	rzt2h_pinctrl_set_gpio_en(pctrl, port, pin, true);
 
 	/* Select Pin function mode with PFC register */
-	reg64 = rzt2h_pinctrl_readq(pctrl, port, PFC(port));
 	reg64 &= ~PFC_PIN_MASK(pin);
 	rzt2h_pinctrl_writeq(pctrl, port, reg64 | ((u64)func << (pin * 8)), PFC(port));
 
-- 
2.54.0


