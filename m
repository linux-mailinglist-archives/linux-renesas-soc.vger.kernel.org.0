Return-Path: <linux-renesas-soc+bounces-32155-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCxHIyJn+2llawMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32155-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 18:06:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC7A4DDD9D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 18:06:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0FBDF3050E94
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 15:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF8EF4963AD;
	Wed,  6 May 2026 15:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJQEDCNP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F07492186
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 May 2026 15:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778083109; cv=none; b=PHWX17VnFLsnCJSvtNvExaqKSLs7UiH0A0um7uDnjRRpJs3C5ANhYVAIqf+T15zof6yuZt8slA7iW13SF7xEJ+ofRXegdbNlcdWrRvUHm6dYyM99EEzi6Uo0sGy6Y+iPpB7UKwa7svgHRaF+syp31MTNbBY82/wKJ1h2Tpkjoqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778083109; c=relaxed/simple;
	bh=FEMjP15F1NE/spmUFlsCVx8qm11wUKk+yt3CUZmgn6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dSX00MdqkDxvg4iU07GX+t7OXJ5V+CfkCNKt2NSNP3C9NayUBRQ1jp3xuJaPMC0NksHn69bwrTuUwuNXE1c5lPxjfSmJqKURYbFZzVIoR/88YkuCg/OlQsGll/A/igJm+eIVNDiGjoPglf7knZ/Pdve01hE9qZHZuXZDkeN7TNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJQEDCNP; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so35252445e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 May 2026 08:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778083104; x=1778687904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+ZRECmPK08nEy/eAWzo3z4IcBQY4aiQeVyCDa18Fp4=;
        b=HJQEDCNPa3AC9ykdq1Iv0m/1WaatgmbDix/vqmA6ZkBpx1TfhBOqpJGqRAKeaa0XaE
         hWEknRiv3vXh4U7iV+edNCAFVprbd1Jm5pbPkjnNOTk3IWWxAMm4cI94IdmmBww3TBOF
         /Y/Hsp9wpbJMXxb6dQtYSr/HCIFnz76CI3yQwYp0bXnPZkpaEtgJN7eII6l1h5/xuV16
         u7CGCgK3jonVnxC0zmEV18WxFgfQguPpVJuQl5hp89d4GkwdqQAsmsPwCyxni5pSYbPh
         TWWKwPbbEIH29GpvfY140eBxdm27WQ4Ve87Q8klqfcIvMUCLfBeDBNSV7WnMVIjlqH6d
         eO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778083104; x=1778687904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5+ZRECmPK08nEy/eAWzo3z4IcBQY4aiQeVyCDa18Fp4=;
        b=tG89/Fk2DNQ0O51deQnfCucrk9TcZI1Wj0wuAr+lWRqwIGRbZq4t4/t8T7xHJpNg8U
         SUKMeCyp6bM1MVZEsU0dohWhJLlF/llOXkaj5QMTvytOjbLdiG2ezkgjPR8LWP+W3vzL
         GBt7CK7sfh4rj1GiNvduxg/9UILnEiaRKfk62xfMuikpRr99xe+ZUqylZ7pJxAUHa1vW
         QpW+3Ccc4b00q2mdrptu5e85WJl8PQGgzdVa1Gm5QhvWzDN878LWdRzjrGy4bQ9x57bP
         iT3AkHjo1h+69oVTWRwyCD/38LnzqLV8hgBBJoyzz83zq9Jevnxk89HhBaDE93UphqIC
         hITA==
X-Gm-Message-State: AOJu0Yzal+4TR3PzL7glMs+nACquj5CZqC12Arv+DzuOECOqi0rvkb/n
	RftQv9fr6pwsLe7RUr0a8KQe7ahTcysRXDGtOWpwxbxfZ0AK6Llkoj+H
X-Gm-Gg: AeBDievq9JCdVhKF3olM53+zPdJXHT0Wq0rXPNkygJQYmianRrCZVQCJbxzy0jjiC/6
	nZciMM97671xhXdDk7yc/WIysNrXpPzRq6hEDoldW8wf8H5dW7qgRlfAYTnjTZualoP3sRoAhfg
	uj2w5B2WJVY+94hF0JCKiXUkeBs3UK5iG2lb/9nPz+JTXqspMdBc9x2HlVjqwyS6YS74e2GEdBc
	8IDC5QhFBtZb3+pqyA32F0s0xFDqAL9nlC4mr/mydliPHqH1rSUuYkaywFB7nOhEPULT1JhUBhW
	eKefE9QF1eg13dMTHMVGAQ/UXYVBjgD3YzJfqv9XkebcmcdCN3IXGWYiVSSEekUZn6c9vai+LrA
	oisWoOty9bXueYSs/hSU8VDjMAato5hycg4CKEyGoW0V2WFqnOAt00ApAwk9wOk8tYy5vF8MM1q
	vv8CmCNqLebRTOsEBoeabdyaoRl7RUVFkRdR+DQOa0hp2ZkULN8ZLrBOh0SCh2AM+RQl7o8LDVy
	BPfEQB5+L5Yq0kbsMcSAr53Cwj4locwTH/f900Oaigflj0JKimpyhLaKg==
X-Received: by 2002:a05:600c:17d8:b0:488:a797:f0ac with SMTP id 5b1f17b1804b1-48e51f46abemr36488075e9.28.1778083103372;
        Wed, 06 May 2026 08:58:23 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3dcb:40a8:a5b9:2327])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530b2039sm21345205e9.5.2026.05.06.08.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 08:58:22 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/2] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add alias for on-SoC RTC
Date: Wed,  6 May 2026 16:58:03 +0100
Message-ID: <20260506155804.3984418-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506155804.3984418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260506155804.3984418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4FC7A4DDD9D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32155-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid]

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/V2H SoC provides an internal RTC, which is enabled in the DT.
The RZ/V2H EVK board also includes an external RTC in the RAA215300
PMIC.

Add an "rtc0" alias pointing to the on-SoC RTC node to ensure a stable
device numbering.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index bd69109a5086..3c1ddacc0944 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -27,6 +27,7 @@ aliases {
 		i2c7 = &i2c7;
 		i2c8 = &i2c8;
 		mmc1 = &sdhi1;
+		rtc0 = &rtc;
 		serial0 = &scif;
 	};
 
-- 
2.54.0


