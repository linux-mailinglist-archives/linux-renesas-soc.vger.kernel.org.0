Return-Path: <linux-renesas-soc+bounces-28756-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNneBpYYqGmgnwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28756-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 12:33:42 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 061951FF04B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 12:33:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 29B013012E41
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 11:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A37237C937;
	Wed,  4 Mar 2026 11:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZF/Vxqvp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E119258EE9
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Mar 2026 11:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772624003; cv=none; b=QwwWbIx8AHuZsn+tklu+bJGgqtEXyLtDgd9D/Tk1JQHfPE0UGUcuwfEFQIrYFIPBvtMwLLxeolnZfNnMvMOj3XVVKuqGJTN1CHPWdsMQQzz2haTVqjASOOLHNlVvOw9+kfZqkpkThRG4DPriXkVMh1PpfrNINHSvyuU0I2mYeFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772624003; c=relaxed/simple;
	bh=s6u79hu5TG7LrxduCVv1+ShFy/u33BANogMkjzvcQAo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gLkEA2WvSHkmgQ4DimjUdr/bX92UZdKJX0GMLg5aUIFRs1HOiS3fO5/tnViD1snNO4M/PRDtOQz7xBjzuMH+ApJw8ND4VzF7BgRXU14WpmoThSDmJn78/piIYAza37ZenOhn9Qfm806bDgpyhDpgSEz9kEpKQq1gTZFd7YCBt/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZF/Vxqvp; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4836f363ad2so78963155e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Mar 2026 03:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772623999; x=1773228799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LCMZuWYhdcgVvbB15NSFZelU750MTeWHKGgIh2wYoUM=;
        b=ZF/VxqvpV2gjz245pwN8RqEammAbDAHY6iFO0bxuacWL1YMaLF06YDm/ZJCqNUDNQv
         Me1uVyk+Y3BqfJHqlJkU44QvJqltVrZArbWD3XkkntGlQ0KOi8o7rbLT+rvHVCoYO7xV
         OKC7bH7mzsPk9scxI1VmmwDzUtBtH/srOBP5dG+e4g6hjraxCNrQ+ISEO7I/kP6ja5bd
         jpwgY0wV2MH1pP+OmjKPv67P8b/xL6XyAOT31Si74An0JcKTDvou1bDnhjNtzbpNubCk
         7G6HGHfe2IV4LTFijH1cBnCski4oeC5zAKAipshmVTRT7DHDzqLX1f9Nb9YAixwzavoE
         6KyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772623999; x=1773228799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LCMZuWYhdcgVvbB15NSFZelU750MTeWHKGgIh2wYoUM=;
        b=Ww9AHkkq+0AshH6zOr6Azc+PKQdRYNJ2JV7kF2x2cdEoO/eYS5yi1SQwR/lQeppOVB
         OHCOnZ+oEN9pc8LJNNq6l4w0b6iMIlnJsdipgHtqmDaXEy52indL4/nLY2BogXU74iEP
         ZOnyAMPlg+DQGDcZlKMNvUNIu8CpHY6lk3KPfFdYD3pvEYPrsE4pzGnrI/Mt8Lf3qt/c
         4MPS7CY1lx438eHIg5zXr1/GWW1UhF+AntJEnSq0QVafT4Uf3w54aukDXfq6fTvpaDyv
         737avkznFnSqBVgDaW1mTE00JF/5nWthjGaN3DU3DQAQRSqvidW6stUKSRi39x7EhgZb
         8i1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWbWUbHITaM5Fst8E+KtdxKVHRvz7+T5jcJJ80j4KrNadb+SqtkkEgXcI7PU8qJgj329tA8muuJLrAs+AN0OwSDzw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7FLmTAeFeV/bEmeYofs9L3SpCkuTJJxOlf763dGtzzfVDV34o
	XkU/20ugllvrX46X4uQjufSPQ5CGJWemWtalHdPcJak6YXpuWBx1/cjZ
X-Gm-Gg: ATEYQzyefsfsUtIq/KEGHc4y9ckL8AK5zqAYRCJwM7B4gqdKKpfSpujsgRoJz9IDFce
	0jjzX3x1j+pQvwjVnC9bBzjsIW0FfPdgHLIfpd7vbAQUZkBz0vQZcm0M9SQ3leJfWG5PF/VL52Y
	HIhzBcazCHUeSGMovv6STNTLmxWkQEZH1K3oJCqKtUUF4GjegVltqmUEKHHng7ErBEG9We1fEPH
	xptOTAlPt5K3XkSflzQjImLl+ZegWhEejGa60cJ5R025h+hdSGytCL8PMEzgx6U+sX7OTQgzxWL
	tongtMvjZODgLg0yXLbz1vCCC57lj+gC9so6GmZX5cyLlMleoQVf0FMUCyQYHxCD5arB2N2Z0YQ
	N2zRqJFLKIc8oG7DMRnkfsHUsIBwkTGVEHn/hMiBlwWD1cwuQIz5qJqcG5Hvvt8fnq54PNefLxH
	EGROSlg1iGn2gBEMZOawy53kRVcmoUBQCopeA/80sdm8xyE6SV5Qy2znJ9xv15RsJ8HQmptKa/q
	xZXnKIqw5tdKLlbCFgq+aUuGcxMdZW8nNdbQVOAIZ486cIsbQyDfrqCDw==
X-Received: by 2002:a05:600c:4e8b:b0:480:1d0b:2d32 with SMTP id 5b1f17b1804b1-48519847bb7mr27785885e9.12.1772623999245;
        Wed, 04 Mar 2026 03:33:19 -0800 (PST)
Received: from iku.example.org ([2a06:5906:61b:2d00:bddd:d1ed:d1ee:a876])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b03db76bsm27345379f8f.18.2026.03.04.03.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 03:33:18 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 0/7] irqchip/renesas-rzv2h: Add support to handle ICU error IRQ and add SWPE trigger
Date: Wed,  4 Mar 2026 11:33:10 +0000
Message-ID: <20260304113317.129339-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 061951FF04B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28756-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,pengutronix.de,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
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

v4->v5:
- Rebased the changes on top of next-20260303
- Dropped scoped_guard arround single writel
- Used scoped_guard in rzv2h_irq_set_type/rzv2h_tint_set_type to ensure
  irq_chip_set_type_parent() is called without locking
- Dropped gaurd from rzv2h_icu_swint_set_irqchip_state() and
  rzv2h_icu_swpe_set_irqchip_state() as we just did a single writel

v3->v4:
- Made a separate irq chip for tint/irq/nmi.
- Added new patch for tint validation in irq allocation.
- Made a separate irq chip for CA55 SWINT.
- Made a separate irq chip for CA55 SWPE.

v2->v3:
- Updated the check in rzv2h_icu_alloc() to ensure hwirq is within the
  TINT range when extracting TINT information in patch 4/6.
- Replaced pr_debug with pr_info in the SWINT handler in patch 5/6
  and 6/6 to ensure  visibility of the message.

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

Lad Prabhakar (7):
  irqchip/renesas-rzv2h: Use local node pointer
  irqchip/renesas-rzv2h: Use local device pointer in ICU probe
  irqchip/renesas-rzv2h: Switch to using dev_err_probe()
  irqchip/renesas-rzv2h: Clarify IRQ range definitions and tighten TINT
    validation
  irqchip/renesas-rzv2h: Replace single irq_chip with per-region
    irq_chip instances
  irqchip/renesas-rzv2h: Add CA55 software interrupt support
  irqchip/renesas-rzv2h: Handle ICU error IRQ and add SWPE trigger

 drivers/irqchip/irq-renesas-rzv2h.c | 474 ++++++++++++++++++++++------
 1 file changed, 376 insertions(+), 98 deletions(-)

-- 
2.53.0


