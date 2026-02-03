Return-Path: <linux-renesas-soc+bounces-27859-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMdSLkqCgmneVgMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27859-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 00:18:34 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5B0DFA5C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 00:18:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 36A2B30146B4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 23:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1BAE31ED63;
	Tue,  3 Feb 2026 23:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AVtSyopb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BEC3191D0
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Feb 2026 23:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770160710; cv=none; b=SFpizVXfoB7TLEGJ1Q8m+wRFT298tKAq9nW6/+iyUISSvh/A6+ZgvX0PLHXNHQkVK0xVPlH4XaozGC2O3mF7bNWtncmQ+SvH9iSnP6RVz9lbXHJnx7bo2ZRrbcA+sTki59xdJugpiCxvIjl75DvB1eSKYRjGezvdi7g+GjX/5FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770160710; c=relaxed/simple;
	bh=SLr7nFn07Dio72zR2E1xbUE2Bla5mv63QLU63uWhJEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VOk1mTssi5FYLDrRC3cMbIbqGrU/S7Q5EAUjWyvbgYdnEPWfR29Ix4fEZ1R6AEr/Vc4xfQ9Gf0oDo3WQZYgmHBlvxyI5ktqhHmiUym3f0Xntupb9WOmCfRq5Avkp8LN1HFzhfqqCSSzIcJgnSUJaK/PFuYmUB4MmBNb8OGKVzQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AVtSyopb; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47ee0291921so58577935e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Feb 2026 15:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770160707; x=1770765507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T5YI9slHomkOa6VJZpOpRLrsH4OxDOTfp7RyOGzVpoY=;
        b=AVtSyopbWkvOf6hiKCq8P21PrS0sMaTKyY27nEy4yN3BIXGIvWIT2T2uN41mHOUpgN
         KCEQzDofNCU0AWPGSEE29aG3NbVaqJWksANt7RttKxEQK5JeKPoMoGfck3L8CBHpN1Yo
         Usyc8xsbFJju2uQqOpZOMuyobiDoCVEr032Z4PJclr0wPnR7jGOky0unAbdjkyC8kwxl
         v+rif+yvJE7L0gTvtkcqBb6MwoD463hG9LAlhuC1Lh9KYnZv+H1XeyeWe6p/BotRayyd
         Cbxxgho2Qnk7yDtO/rnggLxQNjp1mvY+uz4Br6lqk3vTl0Cfr3AFb6pfdAWatXhng3+f
         UnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770160707; x=1770765507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T5YI9slHomkOa6VJZpOpRLrsH4OxDOTfp7RyOGzVpoY=;
        b=MPd6LA+dU4NLvWQF8aW4LtcbYicJj0Tbmr06YMCzLFeFunwG9q2zdT4R9DuqEgegMj
         GGwG7aiBsF91Vr4whAXjYTpByg4NkfYBxeCr/XM0O8KHbYspnJfhOiK95YD9OSEw/8K6
         oqXU980B3Fzecz8FezEEZtUI9NW/wKx31f8VL+k9a3M+RdmFw5NVW5oTIVmQefV2s3zS
         mr+9SzKrNjNIWS898vzzrQYBTqQpEVJ2aguW0bEi3nAbv/44CWGd1chncKWLRykm+MaF
         AAGfRi4BKm7jkUNuiqXF+yiHG4tatHep7nsWX2qfD2+L5WTCd8mv1DkKE2byH/52HlH/
         vAzg==
X-Forwarded-Encrypted: i=1; AJvYcCU0bNj9tG1RPrCtAFbuLxFOrOyzomtBVF2wB9mIjafpMSX8r6T2S201JxcrXo3gMZ6Kk1jQlVhIKvPHpc6WZu7R+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnAQSQi9g8oZbAn+0SbPSQAlQvMU9ow3H6q1u6dw6EZ39t+0rO
	xp3jfsBpzEfAhLTIBOrpND0vJL33m6EkCJZ+5cLhDhnqOEWUfGMoHmaj
X-Gm-Gg: AZuq6aKuPUDRDXTEQH++4LBoXSVJBcRpJuONX39TXWM7Ld6l5/eatbYDfmiBAUjXQ2K
	HlxZauZCC5JMe6uzDIRL/dnGGJI/p662vDy2yaRv2+vV3D6h2ZAY5FsTAMLQ+HMh+tA3NeCQGDa
	LrFLry/n41Sa/zimOIFdgmwQ/8+pIGO3UTzwph+2/81xypDvXW76Qd3NajKXk4h9K0RLNik1Uoz
	QtqL53JGDjGb1YLNLdhLRi98FcxnrBcgoViOCDQ95YvDAJYRuG4wufzzB82/OzpClu8uNCEM+Ca
	r6w18K5lVzNaTmMKBTHpwWr5TyJnbUG+QIwNZyT7LsFMhvvCBcgC2JiTUnVI5tWw3hGUzKPd7qu
	1C5PFbhs+8q8QOBzqFBHvk3VjxOdFifzzZu/D75GrIeCBeeJqTaq7IaOlzkx5neQxXOGDUivsJ7
	hmiwTUffrwJajm2dRJLWQ04znuflpcheeEeyGTuswQSvKGjT3mB9vqKzVQqEkYqipE8fh+QrVta
	p7UOomKAEUx3Vfsf7EHNFlm
X-Received: by 2002:a05:600c:1d24:b0:471:1765:839c with SMTP id 5b1f17b1804b1-4830e968e31mr15501645e9.20.1770160707266;
        Tue, 03 Feb 2026 15:18:27 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:2e50:5c7f:afca:5f9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436180647aasm1739832f8f.41.2026.02.03.15.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 15:18:26 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/6] irqchip/renesas-rzv2h: Add support to handle ICU error IRQ and add SWPE trigger
Date: Tue,  3 Feb 2026 23:18:17 +0000
Message-ID: <20260203231823.208661-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27859-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,glider.be,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 3F5B0DFA5C
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series aims to enhance the Renesas RZ/V2H ICU irqchip driver by
adding support to handle ICU error IRQs and introducing a software
generated interrupts using SWPE and SWINT. The series includes the
following changes:
1. Use local node pointer
2. Use local device pointer in ICU probe
3. Switch to using dev_err_probe()
4. Make IRQ type handling range-aware
5. Add CA55 software interrupt support
6. Handle ICU error IRQ and add SWPE trigger

v1->v2:
- No changes for patches 1-3.
- Patch 4 is a new patch.
- Patch 5
  - Made CA55 SW interrupt as part of ICU IRQ domain.
  - Implemented rzv2h_icu_irq_set_irqchip_state() to trigger SWINT.
  - Updated commit message accordingly.
- Patch 6
  - Made Error interrupt as part of ICU IRQ domain.
  - Updated rzv2h_icu_irq_set_irqchip_state() to trigger pseudo interrupt.
  - Updated commit message accordingly.

Cheers,
Prabhakar

Lad Prabhakar (6):
  irqchip/renesas-rzv2h: Use local node pointer
  irqchip/renesas-rzv2h: Use local device pointer in ICU probe
  irqchip/renesas-rzv2h: Switch to using dev_err_probe()
  irqchip/renesas-rzv2h: Make IRQ type handling range-aware
  irqchip/renesas-rzv2h: Add CA55 software interrupt support
  irqchip/renesas-rzv2h: Handle ICU error IRQ and add SWPE trigger

 drivers/irqchip/irq-renesas-rzv2h.c | 336 +++++++++++++++++++++++-----
 1 file changed, 284 insertions(+), 52 deletions(-)

-- 
2.52.0


