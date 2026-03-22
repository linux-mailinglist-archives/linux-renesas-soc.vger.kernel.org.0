Return-Path: <linux-renesas-soc+bounces-30059-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAM5On7fv2ml9wMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30059-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 13:24:30 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC922E9257
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 13:24:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0AA6430071F4
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 12:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5ADA33F5AB;
	Sun, 22 Mar 2026 12:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CjeWGCW3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB2B2AE68
	for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Mar 2026 12:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774182267; cv=none; b=JguPJFgHhj3+CEcBwtjIMs8NY9IZzdwwEGtLaTf4R+HW8CNgbnUBEHWIkaWhGBGSUwz8mwIn4h3YmIZY91s85H+6oLDZTb2uYyklm/3nGWMGw1NRord7sFTRdKhWSTX/n+Oc9ePdEMSBRV/p+PJSvoVRttcza1Eu7AcwAtEds4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774182267; c=relaxed/simple;
	bh=musAk/qhzMJd3NSR5QbpBdsSTXqUIq0fWGe9YDSsWn4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f3Y+Fh42Q7XaQdtEpHVP41z78zsPN7BgdqTeYQnRccVgEZ8tV1Se1RUDuAAMELChKNy9HaSvpQTsIHsbyMToYStltP0ZtvLz61HIjU6ufNOKoqBxezToSxmiCb/n2tVB+pYKiiVDXcrjy9h1x6ADNngSfX4F4KvyfobVo0Swow8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CjeWGCW3; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439bc14dcf4so2966161f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Mar 2026 05:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774182265; x=1774787065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9O4doJHQlRMiWHjTHq2qiNGSAkVKz7skExRq4N6TybM=;
        b=CjeWGCW316vHxaJrYAoy5aHX9jluEQqj/x7QB8r4tX41Kisi0nmqgMHdsShmG73aG5
         5w5JBiXYZDGJFTwbqZT+1nSUHETqdcUBJPr8ESDN3rWGybBfqtPw7skOgKbVGaISNdfL
         L12NFhUJ70P7uVtW+8dHvOO1+0ablnjDGbqaf40AodUHzyz0ySi/32frHSVpHQF55Hum
         IRfscO59rZpqURRaOI30NagAbWXEK3/gznyh0OZJVRFSqXyL9ORifDQr2EWXIvQcJjGW
         H3ZluqytL4AxX6M6vxVneCr8/Kx41H+TgggYKC9VSeNpLtjE0V0iYE5fMDLruXdvTRNi
         RHgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774182265; x=1774787065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9O4doJHQlRMiWHjTHq2qiNGSAkVKz7skExRq4N6TybM=;
        b=U10v/QMzy6upzvO6Ij+WGhUGOR7/Jo+R2cRsJxNK6dvMw8/itM6t5Y65dH3lJq33pn
         PIDjpnRh4MbiNWsSE+phiMjrrE3/aTeEqBbsbBwS7Zc1UWeQYKUy38n615t9YVoZAYOZ
         ETXRlxoWzlp0lScebKAGMSNrGltDNs47Ddy32mQrkRPsiRZEii0q/YghBNAR+3KM0O+o
         oN9poa1b1OO8leth4f5jZUoz+UndNV5Z0Ap+VlZP2dMLlnyasQjaT2D6f4fkN11aPGoB
         8ZV2g2SqI3rXiisEkJ2K/mIEcllassODWZPmHEqrH4iqTywRP46iHtyGNtZZ7G1Obg3x
         C3XA==
X-Forwarded-Encrypted: i=1; AJvYcCXPk8/aFa+MZAwCOuVB4/xrM/GuU/f/n30qG5ba/98aYN6rP+I2kf1DnDUYe6UQB8siaomOrOLR9Y6SurGqr5v1BA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvAt8JsvAOFc0UmJ0q2fJRjveaenlUcH+lFdNUr9PY4iJTW9V4
	iopnJlY7Y8JL8Zo+eDNx9APgvTMrJJ6VMAqelXQOcq515IaS92m4juua
X-Gm-Gg: ATEYQzyeWysKyx7Osxzr/5dQNI6V60yhnqNd/lvY/HaDvZQ1ROhy5vu5jrwyr0ddWl/
	3sSt6aLTdQriB6U2hd2SWpY2gxKyYD1lJ42/rTv0NtN7LrXLgpNcbijuAuU4dfYyDS/+Szjynqs
	7UoTNmxi7YQi/G2qtVcbO4KMJ8P4OcY4xt0M1aMg1BRtcod8nJNsM+Mpm3rMpeFf6FJ87dS8kKP
	lU9ABdgY+sIGoNkqnXaoXDcCftvTDnvJV4ME1w5+wpmB0//T36mhKOs/54ioH/3Vw6lcjCSLFSI
	H8Y102pq3yAnzNcoJ9Wqk1e21pbxJev5wT9QrCkJI7AB98VzWusOgH+aNTRnVlir3+nzxyjWarc
	P7Pso7CuedsCN1dHfuO+mm+Qtjs5kAoj1ikiTj1eAzY9ASEgFXThh+dVwO3j/ZsJamZkvmvMOdQ
	8r4xV8Vljtat9AzfTXyzlO9JIHzVsx+W6xTpSc7Ku15Tka3XSC
X-Received: by 2002:a05:6000:2d86:b0:43b:5557:ed9d with SMTP id ffacd0b85a97d-43b5772991dmr13745396f8f.25.1774182264370;
        Sun, 22 Mar 2026 05:24:24 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1bdc:7f84:18bc:1e56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703343sm21072695f8f.19.2026.03.22.05.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 05:24:24 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v6 00/15] Add RZ/G3L IRQC support
Date: Sun, 22 Mar 2026 12:23:43 +0000
Message-ID: <20260322122421.132474-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30059-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4FC922E9257
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The IRQC block on RZ/G3L SoC is almost identical to one found on the
RZ/G3S SoC with the difference like it support more external interrupts,
GPT error Interrupts and also has additional registers for GPT/MTU
interrupt selection, shared interrupt selection between external interrupt
and TINT.

It has 16 external interrupts of which 8 interrupts are shared with
TINT[24:31] and are mutually exclusive. The external IRQ/TINT interrupt
selection is based on a register in the ICU block.

Ref:
  v5: https://lore.kernel.org/all/20260311192459.609064-1-biju.das.jz@bp.renesas.com/
  v4: https://lore.kernel.org/all/20260227140316.308106-1-biju.das.jz@bp.renesas.com/
  v3: https://lore.kernel.org/all/20260206111658.231934-1-biju.das.jz@bp.renesas.com/
  v2: https://lore.kernel.org/all/20260204180632.249139-1-biju.das.jz@bp.renesas.com/
  v1: https://lore.kernel.org/all/20260204142320.103184-1-biju.das.jz@bp.renesas.com/
v5->v6:
 * Collected tag for binding patch#2
 * Updated commit description for patch#5,#7,#8,#9,#12and#15
 * Simplified rzg2l_irqc_{irq,tint}_eoi() by replacing raw_spin_lock
   locking/unlocking with scoped_guard().
 * Updated the variable type of offset, tssr_offset, and tssr_index to
   unsigned int, in rzfive_irqc_irq_enable() as these variables are used
   only for calculation.
 * Simplified rzfive_irqc_irq_enable() by replacing raw_spin_lock
   locking/unlocking with guard().
 * Simplified rzfive_{irq,tint}_endisable by replacing raw_spin_lock
   locking/unlocking with guard().
 * Updated the variable type of offset, tssr_offset, and tssr_index to
   unsigned int, in rzfive_tint_endisable() as these variables are used
   only for calculation.
 * Dropped stray newline in rzfive_tint_endisable().
 * Simplified rzfive_irqc_{irq,tint}_{mask,unmask}() by replacing
   raw_spin_lock locking/unlocking with scoped_guard().
 * Updated the variable type of titseln, tssr_offset, tssr_index, index,
   and sense to unsigned int, in rzg2l_tint_set_edge() as these variables
   are used only for calculation.
 * Switched to using irq_domain_ops::{alloc,free} callbacks for mutual
   exclusion between external interrupts and GPIO interrupts as using
   irq_{request,release}_resources() leading to irq storm()
 * Dropped irq_{request,release}_resources().
 * Replaced the macro TINTSEL->INTTSEL_TINTSEL
 * Added macros INTTSEL_TINTSEL_START, IRQC_SHARED_IRQ_COUNT and
   IRQC_IRQ_SHARED_START.
 * Added used_irqs bitmap to struct rzg2l_irqc_priv to track allocation
   state of shared_interrupt
 * Added rzg2l_irqc_set_inttsel() for configuring INTTSEL register.
 * Replaced irq_domain_free_irqs_common()->rzg2l_irqc_free() as 
   rzg2l_irqc_domain_ops::free() callback.
 * Replaced the 8->IRQC_SHARED_IRQ_COUNT in shared_irq_cnt varaible as
   the same macro used in bitmap.
v4->v5:
 * Added support for separate interrupt chips so that the decision is made
   at setup time and not at every interrupt delivery in the hotpath.
 * Dropped the hw_irq range check involving info.{num_irq,tint_start,
   irq_count}
 * Updated rzg3l_irqc_probe() for supporting separate interrupt chips.
 * Added callback irq_{request,release}_resources() to both irq and tint
   interrupt chips.
 * Dropped SoC dtsi patch from this series, will post later.
v3->v4:
 * Collected tag from Rob for binding patch#1
 * Updated commit description for binding patch#{1,2}.
 * Updated commit header for patch#3
 * Replaced IRQs->interrupts in commit description
 * Fixed the typo Dynamicaly->Dynamically
 * Updated commit description IRQs->interrupts in patch#4
 * Replaced the variable type for num_irq in struct rzg2l_hw_info from
   u8->unsigned int
 * Replaced the pointer variable info from irqc_priv and instead embed a
   struct hwinfo into irqc_priv and copy the data into it at probe time.
 * Replaced the check 'hwirq > (priv->info->num_irq - 1)' with
   hwirq >= priv->info.num_irq
 * Updated commit description 'this differences->this difference' in
   patch#5.
 * Updated tint_start variable type from u8-> unsigned int.
 * Updated commit description IRQs->interrupts in patch#6.
 * Updated variable type of irq_count from u8->unsigned int.
 * Updated commit description IRQs->interrupts in patch#7.
 * Updated rzg2l_disable_tint_and_set_tint_source() for making
   tint assignment very clear in the code.
 * Formatted rzg3l_tssel_lut as table format.
 * Updated commit header irq->interrupt in patch#8.
 * Updated commit description IRQs->interrupts.
 * Updated shared_irq_cnt variable type from u8->unsigned int.
v2->v3:
 * Dropped items and instead used enum for single compatible values
 * Add minItems for interrupts and interrupt-names properties of 
   the RZ/{G2L,G2UL,Five,V2L} SoCs
 * Replaced maxItems->minItems for interrupts and interrupt-names
   properties of the RZ/G3L SoC.
v1->v2:
 * Simplified the binding by using pattern for intterrupt-names
 * Fixed the binding warnings reported by bot.

Biju Das (15):
  dt-bindings: interrupt-controller: renesas,rzg2l-irqc: Use pattern for
    interrupt-names
  dt-bindings: interrupt-controller: renesas,rzg2l-irqc: Document RZ/G3L
    SoC
  irqchip/renesas-rzg2l: Drop redundant IRQC_TINT_START check in
    rzg2l_irqc_alloc()
  irqchip/renesas-rzg2l: Replace single irq_chip with per-region
    irq_chip instances
  irqchip/renesas-rzg2l: Split EOI handler into separate IRQ and TINT
    functions
  irqchip/renesas-rzg2l: Split set_type handler into separate IRQ and
    TINT functions
  irqchip/renesas-rzg2l: Replace rzg2l_irqc_irq_{enable,disable} with
    TINT-specific handlers
  irqchip/renesas-rzg2l: Split rzfive_tint_irq_endisable() into separate
    IRQ and TINT helpers
  irqchip/renesas-rzg2l: Split rzfive_irqc_{mask,unmask} into separate
    IRQ and TINT handlers
  irqchip/renesas-rzg2l: Dynamically allocate fwspec array
  irqchip/renesas-rzg2l: Drop IRQC_NUM_IRQ macro
  irqchip/renesas-rzg2l: Drop IRQC_TINT_START macro
  irqchip/renesas-rzg2l: Drop IRQC_IRQ_COUNT macro
  irqchip/renesas-rzg2l: Add RZ/G3L support
  irqchip/renesas-rzg2l: Add shared interrupt support

 .../renesas,rzg2l-irqc.yaml                   | 157 +++---
 drivers/irqchip/irq-renesas-rzg2l.c           | 461 ++++++++++++++----
 2 files changed, 412 insertions(+), 206 deletions(-)

-- 
2.43.0


