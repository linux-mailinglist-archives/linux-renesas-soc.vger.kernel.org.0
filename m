Return-Path: <linux-renesas-soc+bounces-30272-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPhQEIw2xGnkxQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30272-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 20:25:00 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DA65632B2A1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 20:24:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 340AA3019CA5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 19:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF363542E5;
	Wed, 25 Mar 2026 19:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jL/d57Za"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1BB34D389
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 19:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774466697; cv=none; b=CnJekLv4nAG+Lb7zRpNeI5srSSx0Hts3OG/UAgNT79E8Af3/JkXzR5WX2rbAG17o34t3j4THgbHu/KbWWl2/JDI/RCRS4uu12V6eZlsG+F5Kd3SPtB/hmQuKVHthXE5Rhd1DyRTzFFjmLIrFLBdkz16txofyDJaJG+juEHLFqEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774466697; c=relaxed/simple;
	bh=VbqBtIe2JkzltHurJdvmEzwt6bh5/sPk47WfnAxxcAw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m0YzR5y3r+XC15HXPoByR4cNhYF4WJil4RP7rcaVwRKpZYXYd8hIdzsIT+8Ij3kwhL/z+Q73qAwZlsjtGe0zGdHuI++kau/h5d9ZHID3lShtppJY5wjRE64138PBXkF4U+4A5tcwT+eZM6uB6U+1DJ97SInNZMgMBCrHkY/EMFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jL/d57Za; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-486fb14227cso2514775e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 12:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774466694; x=1775071494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wv2eGtbacvBrapR1sRFeEUHNUf8aZYxNpSAbuo4Z8W4=;
        b=jL/d57ZaaVqEaeqqUvaCWL0+b7vHfxIAcChnEPHBnkv6KWoqogJ0LT7mi7veT4MUGq
         ZPWmQKI5oASkuN7ggzBZ+tHX8nO8/SdKlooPE6S00O2/g9MGpY2QXGaM2TT2AzgpulVB
         /CQH+dGkxsNDA+tdHrBqnur5lfGCW5JC6dNsPZp+ceohK5e8mzSuEqajcbkSRSEEjgck
         llDPng+P4DbWwnmvLPTKe1AJPhuYQ6JJB33M3/2dHmuDUCRq8EojZHJBJI3AGQKnfxZ+
         QwIaeGyWw+/biKqg8Zn/vsj33NNW3NQ4oXyhOHEUFWePbNpZRgqwboPD3qX8ZYqXZEeE
         o3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774466694; x=1775071494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wv2eGtbacvBrapR1sRFeEUHNUf8aZYxNpSAbuo4Z8W4=;
        b=LYBEwWgMFYAew4YCsz0FfcU/zKDUiG55qVDWVqE+BKsLLFDEtibG9SUXdAhMAl8XZI
         xaVsV2JH6maSXdMLpKKxrtYg9xWuTEL2yP2c7vFSVqxY2z60UpqQOD7INAoiCsfd6vZb
         Dxn+lMB1n2BVlPBe1PvDDiQt2ji8V9pZRDc3SvFLHgrkhQRYzW4H7xBZ45D+iYtcPRyg
         f9vrD6icFnhNTCd7RU5Xwg7L28Q421K7T+UUcfQ6CcNtWTWijIRc8K+novFJXjseooc+
         qxGED25Qa3pq9+3wzCfz8h8gi6qH7ymED4TpU59KgT4+w2XEo9jpwv6BkybQn6X6M0kF
         JmTA==
X-Forwarded-Encrypted: i=1; AJvYcCXWP9zcazsJLRxCAXx3Fhg4R9xQpP6rKf6jDV1khFFvHEjzqiDjscf8Hd3md5KD2JU2WhOuk+7nvOnt+xoYaR89Fw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3nU3Jx4pQMcXc8qxoXPY0XwSYY+JI9ZX9ufXB7dO4QUyyCTSI
	I4XiMPttNWtsPOXaKp29ilSUj9mrZX+Zr6SII7zwVFsFhF6oRzAiPOsa
X-Gm-Gg: ATEYQzyRPz0uNm1e+74jpez9EzyKeo26mMnBooNaygTKsVzLeEW3big0dreW9T5RJ9N
	v2UMy38iDblN5LiBgHu/BGKeubZxwZNE3jT7I9EkybS5m6u8lTcEaeVXDGXFKqRnZn+PD9tgfoU
	LHJeTqpeRIzcVi0fcrNPdBj48ElsV7276iir2TnTGO1f3we64IEGEDczcyH8EbnqUeZgxriiSiT
	jv0qPP47xb6ClpKzpHwoSgU7xahTWOh74jZ1W09yXXSgDAbLdSi57JJm6LGgts2w2UHsvghisPb
	ZhjXwrhE3Rbl01IQ5eoAsIXRkHcCll1Mbs+Je7sZQQ7Rx6P0JUrOzYChksjFgKXr/uNevXIQbUY
	d1CBvceiE6M+aANKrpg2DaDUpbfFEt4IlpgQjXDLDokgVhTtBhyrR78qYykqmRrTjglI6dYKzJp
	ubsNo2bX9N6sYUzYyT0AhIMb8wM1+ebL6pzBVI6CCJtaIEn8cQ
X-Received: by 2002:a05:600c:8283:b0:485:3a22:69b9 with SMTP id 5b1f17b1804b1-48716099758mr67938595e9.29.1774466694017;
        Wed, 25 Mar 2026 12:24:54 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:8138:17e4:88b1:468c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e533sm2464485f8f.2.2026.03.25.12.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 12:24:53 -0700 (PDT)
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
Subject: [PATCH v7 00/16] Add RZ/G3L IRQC support
Date: Wed, 25 Mar 2026 19:24:15 +0000
Message-ID: <20260325192451.172562-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30272-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: DA65632B2A1
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
  v6: https://lore.kernel.org/all/20260322122421.132474-1-biju.das.jz@bp.renesas.com/
  v5: https://lore.kernel.org/all/20260311192459.609064-1-biju.das.jz@bp.renesas.com/
  v4: https://lore.kernel.org/all/20260227140316.308106-1-biju.das.jz@bp.renesas.com/
  v3: https://lore.kernel.org/all/20260206111658.231934-1-biju.das.jz@bp.renesas.com/
  v2: https://lore.kernel.org/all/20260204180632.249139-1-biju.das.jz@bp.renesas.com/
  v1: https://lore.kernel.org/all/20260204142320.103184-1-biju.das.jz@bp.renesas.com/
v6->v7:
 * Added a patch to fix error path in irq_domain_create_hierarchy()
 * Replaced variable type of iitseln, sense, tmp in rzg2l_irq_set_type()
   to unsigned int.
 * Replaced rzg2l_irq_*and_get_irq_num()->rzg2l_irqc_*and_get_irq_num().
 * Replaced raw_spinlock->raw_spinlock_irqsave in rzg2l_irqc_set_inttsel()
   to avoid possible dead lock with the consumer driver probe and eoi
   handler executing on the same cpu.
 * Updated error handling paths in rzg2l_irqc_alloc()
 * Added missing colon reported by the bot for 'struct member 'used_irqs'
   not described in 'rzg2l_irqc_priv'.
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

Biju Das (16):
  dt-bindings: interrupt-controller: renesas,rzg2l-irqc: Use pattern for
    interrupt-names
  dt-bindings: interrupt-controller: renesas,rzg2l-irqc: Document RZ/G3L
    SoC
  irqchip/renesas-rzg2l: Fix error path in irq_domain_create_hierarchy()
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

 .../renesas,rzg2l-irqc.yaml                   | 157 ++----
 drivers/irqchip/irq-renesas-rzg2l.c           | 481 ++++++++++++++----
 2 files changed, 427 insertions(+), 211 deletions(-)

-- 
2.43.0


