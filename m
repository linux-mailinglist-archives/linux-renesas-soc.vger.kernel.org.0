Return-Path: <linux-renesas-soc+bounces-34038-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SO+4Mg4fMGrAOAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34038-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 17:49:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE7E687E10
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 17:49:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=sEsX57p3;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34038-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34038-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D03C03006214
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 15:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0433540758F;
	Mon, 15 Jun 2026 15:48:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3343FF893
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 15:48:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538503; cv=none; b=Tzk1NV2uV4MWcQ/Y6Of7l3PPu44hNYRbLbsWPHYDNwqAH7S9OLxg3K2ugSLxrZHfRE6PBXEcCW3OLCGx4Fb8CljATi/AcbUhZFyqM0utssI3XX7Q9Y8hNyDGhbAtowOk05nZkPfC6sEfNE/tZ/uHZi6X4qk08ZICurESMT3jZls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538503; c=relaxed/simple;
	bh=m4MDgDNJGJh6NUsFNjQqW0yFQBUw3oV+QM5zFXmcAFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZnHoI0SWxwkdtCRW2nfBmQdjFC+/K/7PkC+VlxetsoKP2z/2E9kifaWl9A5yTMiR8RGLQXvIpOdOKPU9Rr/ohxYytjzj0EH0jSZOZi8c5m2I3uWXeQNSg3gpxAXuusOsGNrbI3IQQYVFUkBEMGHjHAJd8FiopfZfQ+NA//koMkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sEsX57p3; arc=none smtp.client-ip=209.85.221.48
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45eecb8bf67so2913089f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 08:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781538500; x=1782143300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N45xHGzaBC8uEBeOLmM+IjqfOYO20BdZazBFDqO07Kg=;
        b=sEsX57p3U6qbYGqJ9E/t8LNvHVaYFPySd3BrjbvOdlHbS6KegTJCunI2kmHNoqf+1f
         VES6I+9A5YcOLxQnWalGVyUPbnXhFFCdtejT9SCDCPyYrIwj0XOkk61BOkrJ4Xwm20ir
         G07mTbYKaw1IY0Oi7t1RzXo8nHTAN8xTFvkKrdBPd+Iyg3GLi70QQ9mdO8DSNIB45wZ4
         xwRIbWTtXZ/00I70ZbQl5PGF+VuUi+9V3govbkIIsswprxfV76nJECgXp+4HDIe+Ejj4
         986kFFdeu56hjltso4Rd5x8Bca/bbjTtjnyhTifPz3wCGJjr1i6fKnXYR+8CRbdXKLHL
         GG0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781538500; x=1782143300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N45xHGzaBC8uEBeOLmM+IjqfOYO20BdZazBFDqO07Kg=;
        b=nOzNY7/DrVVoJxYyoJGctBJokzHZYIbR0cLPNXtk/qmHL46YZtlcHo7+7NmdxeIzjf
         qkzEpc1frQ0K3po33bHXnqLd8/Ez/gKTbeLiLCZV0W6I4keI+iEGRcj5OSRWMbGO9emu
         290YYNRrTH0T5ybh/jbir6oBp63RiN/EcxsDaKhkOarLfSZLcMQz4lRY+SkbRGAb9cOJ
         QKL+/Gtd8m3CTz1skElntZClZr/lLxcRVJxEpkUeyh6tZ1XiFb46EFyTYyPTBmMLr6mO
         Rq4ZJ6PvwRU7PVRsRnxzAFgVP6F5wvxcwi3T2jIR57sdMSIZ9XW0kIPdX+cyhifJA3Da
         HGtQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ir/N8kWODK9K1k+ZOHaB+VPISTeWAjbsWjWnUKee8yl7YxtoFQvMzpN+hDUEOiOXUoOBrohSPC1N0+bDIMWgjdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzD+R45825qaG5eTrWIiU4p5xb3H7zfKbQhuF5BHRW1K6dm9kia
	kOUhTLGxpI9gFKEF8LYc+YiAK/Rpe96YCS+gphOAg2yHoaZohLuFqQlP
X-Gm-Gg: Acq92OFeP1wY4+FyQH70CsBndToOdHtc/+LramHI0vzfMfFDcrmMpLJnFUe3pYpswrr
	+H8OhlzuN7XhUuDjcbNhrCAyG3n+zjdMuLLnki3OoIvrHyom8zxrlhs+JOFNQyx7v7MAgx1ZlKc
	fZh5PVm/W3Qklv/wFpgiwpz9iUPFORTkW6B+TiNQuxOOu/5vGvfuDUWeGevOLBADGrPIZrFU+U0
	P96rRFZmFZ5Rj/l8jWKReLdUrd5tmTc/2gGlouCIMTXG0n7EzednyDD+7n5+FWcZd2L9+SQGM+E
	o+B7nG/Wduvn0hoy23E/LfcPv/tP+raStXcUKYV/2mRvhviuRFIuw+6gtcJk35OIuW8hb5WAA/b
	pm8J3obbystFT4xGEzQpSdBEbPGZuUGAofS/EmW7oeSB9Yrgbaz29jCNZcNB4tYUtU9Oq5PG6aw
	/XNfR7UyjY9IJYmxLXR9XOnoOWuF4IM4ck56T0ILTklHBa5plk8L3EuW3UIcbTbDf7N9STyc+GN
	E7X+988a5Ihg2JC6cAbt+aVlmUvz+uI9ajb
X-Received: by 2002:a05:6000:46dc:b0:460:18cc:dcfe with SMTP id ffacd0b85a97d-4606dbba5dfmr12896535f8f.34.1781538500271;
        Mon, 15 Jun 2026 08:48:20 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm36010995f8f.1.2026.06.15.08.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:48:19 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH 02/12] rtc: rzn1: Handle EPROBE_DEFER for optional pps interrupt
Date: Mon, 15 Jun 2026 16:47:55 +0100
Message-ID: <20260615154805.1619693-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34038-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:wsa+renesas@sang-engineering.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:stable@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,glider.be,gmail.com,sang-engineering.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2BE7E687E10

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Check for -EPROBE_DEFER from platform_get_irq_byname_optional() and handle
the deferred probe request properly.

Although the "pps" interrupt is optional, an error code of -EPROBE_DEFER
indicates that the interrupt subsystem is not yet ready. Intercept this
specific error condition, assign it to the return value, and jump to the
dis_runtime_pm label to avoid ignoring a valid probe deferral.

Fixes: eea7791e00f33 ("rtc: rzn1: implement one-second accuracy for alarms")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/rtc/rtc-rzn1.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index c4ed43735457..f81d691c8b9a 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -465,6 +465,10 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	}
 
 	irq = platform_get_irq_byname_optional(pdev, "pps");
+	if (irq == -EPROBE_DEFER) {
+		ret = irq;
+		goto dis_runtime_pm;
+	}
 	if (irq >= 0)
 		ret = devm_request_irq(&pdev->dev, irq, rzn1_rtc_1s_irq, 0, "RZN1 RTC 1s", rtc);
 
-- 
2.54.0


