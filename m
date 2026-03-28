Return-Path: <linux-renesas-soc+bounces-30538-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFpNI7/zx2lMfQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30538-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 16:29:03 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D9834EE28
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 16:29:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6C08A300F59E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 15:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0808E33D4FB;
	Sat, 28 Mar 2026 15:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z7zVg6QC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7987F346E58
	for <linux-renesas-soc@vger.kernel.org>; Sat, 28 Mar 2026 15:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774711739; cv=none; b=rV1u9IlK+ul6n/le879gjJ4Tn1KKXmyl4QBGaKvciJaPTQq++Imp/5QKNExqv0lArxJZXgFYq/jxf4B5xjU5eJjGTMURpsrc67brPTrd669z3MsUiXuaMOWe2aAdtqsN7nwi/t9YKwIxBIj0vtHkn2kAU2veSBKry1XZEMDfQtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774711739; c=relaxed/simple;
	bh=NYjMremkzxR40KUFFuxu+YlWSBA23vvg16WaJcjSX/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fK6D5bPRHf+JfaU+saxN6ciZVh3gl0Ukz0TXUnOuLatg6NN0Ga3hf87ue9iIPuvF8H24aDz+dQ1aFdReV+YW7LY4shJ0ltE7tjcfRtOxcXiYnR8WzKjdiOXa9cqr3Ww6KoqipuGtMP5+/ULj5JsiNVZq4/nQpnZZ6ukejOlt6AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z7zVg6QC; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-65c4152313fso4058173a12.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 28 Mar 2026 08:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774711736; x=1775316536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XbYLfAmKNmTTUD71s/FLPSLIoguJuCLzImSKnE7i5Hk=;
        b=Z7zVg6QC7HiFEy9CCX4BxV9W8ewRTtAfd3r4kaX387Kdcd14Am3aHxsi4bw8Wf/U0R
         UFxEKx10vpF18AQB512/K6s1XfKT+MsqvZ4vtTaK6lsp9R+YCg/GT7p4bDHspRfjtZtr
         8w21QCkP5mcyVZ095uqBsJhqs91ve3Vw4BTSlT1tVZTZfPP83OCQUyHzXjbTFkkwHhUD
         WxewdHXTpM6Ml8WdJ/coRXa+B5pz0ac7d4EoeMCBW7ahE6oFp5Cx1N10FbjxBw1Fl4Km
         JnzwJ/oRgVSyYyRqh+2brd5VGOlVKux+BMz3Uwnw2Awf1WDd+viXrrkuuriMfyQQqxRg
         8Fpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774711736; x=1775316536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XbYLfAmKNmTTUD71s/FLPSLIoguJuCLzImSKnE7i5Hk=;
        b=dL5VQYj4KWkYCWrupjzdlQUZ13Igz/ncY/aut6MN5Fz5sAQB0QC63Ni1DCRyujAMhe
         3cV/lwmV0oJnW1U+IpuztlSWO43CfTzVsdUKOgkxUPrAliNh6f0Tq6l+LawI6B1/AeR3
         o1kk5Bd3flmRoP95JPvbtp57TmdekUWXC62/jm2OopQrP93hjBqQ+sICHQWA8ptNnuNV
         DQ0Vt/vZuha2uKRLF6LzH+q+oJOr+z+f99egSax+V7fLlVoeFNIoj3Ml70tN59IbqTUQ
         s3yCbo9m8DVRbFGDM8OALlc6Ai6PJMBPU61Wbb3BYZ1ryM65yuBAxTM80Zv8Gao8J645
         iJBg==
X-Forwarded-Encrypted: i=1; AJvYcCX/pp3EgPBQusnBR43oHR5/xNdC/kHaCUdgRAbaf4pKmKJuxwpf30EQ1LsLXRjPUwLGNhdgcOP7/o515AzIz3lyFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSxMB54TMQMYE1OEchQqBDZNuILGuzDG81dW3v2eOrZQQyCKe9
	XL/d4UbXK212PJ2GXJyy/2hCH8COjvHGRGTr1VrxptJ9c597TkYsjPLtuLe6+g==
X-Gm-Gg: ATEYQzwG7Ezn+DVCq99r/LBAyJYNmYm8sRa2YAt7w6Lj852FQ1nsVpffKg2xl04IzwN
	FWsDh6GF79bz2jvz1fKzjuqn3ucck0xYMF+5zoWrcgwP/stUMzebJ85gAV5bVDMHQDW72As+IfV
	7+50wMSRFZUDtceTumUkf6iM45LTXHzdvBF19Xs2f447szIbnMpKLBvuXiK7/Kgu1kaZGQlMPUw
	PG9xLqShVAJhOkr19vHagdnNmMM6Yid8F3XKnund6M8pej0whbXr2X1domh4a+qqcqH40dln0GG
	2IWvytmtf00JibdAzJKc1XJK/hlav9IVTu5pyMErqTi7oRcsw/Ui++5biviFXy0A4zkNJCHgqtd
	CSCfvVWd6tEphk9gZb5CKvjK10trOTWfUJMxaAhTNK1FwD/eBqRW98iGOzn/20hW4Mk27jTJTYA
	0Agd5sOKBzm2Ybxqs1jSITOoCS8aTwJbTgmpUlbHSKCQOy7s7B
X-Received: by 2002:a05:600c:6091:b0:487:13d:4e77 with SMTP id 5b1f17b1804b1-487280a9d07mr90010615e9.27.1774694007226;
        Sat, 28 Mar 2026 03:33:27 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:8a55:5310:98fe:930d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487270fd880sm42270035e9.8.2026.03.28.03.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 03:33:26 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/3] irqchip/renesas-rzg2l: Bug fixes and NMI support
Date: Sat, 28 Mar 2026 10:33:17 +0000
Message-ID: <20260328103324.134131-1-biju.das.jz@bp.renesas.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30538-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid,smarc-rzg3l:email]
X-Rspamd-Queue-Id: 30D9834EE28
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

This series contains two bug fixes and a new feature for the Renesas
RZ/G2L IRQC driver.

Patch 1 fixes a bug where the shared IRQ bit is not cleared on free.
When irq_domain_free_irqs_common() is called, it internally resets
irq_data->hwirq to 0 via irq_domain_reset_irq_data(). The fix caches hwirq
before calling irq_domain_free_irqs_common().

Patch 2 simplifies the locking logic in rzg2l_irq_set_type() by replacing
the open-coded raw_spin_{lock,unlock} pair with guard(), and adds the
missing cleanup.h header.

Patch 3 adds NMI support, introducing a dedicated IRQ chip with EOI
handling, trigger type configuration, and suspend/resume support.

NMI Testing on RZ/G3L SMARC EVK:
:~# cat /proc/interrupts | grep NMI
 59:          0          0          0          0 rzg2l-irqc   0 Edge      NMI

Pull down GP_INT# line on green pack device by I2C command
:~# i2cset -y  -f 0 0x38 0x30 0x00; sleep 1; i2cset -y  -f 0 0x38 0x30 0x18

:~# cat /proc/interrupts | grep NMI
 59:          1          0          0          0 rzg2l-irqc   0 Edge      NMI
root@smarc-rzg3l:~#

Biju Das (3):
  irqchip/renesas-rzg2l: Fix shared IRQ bit not cleared on free
  irqchip/renesas-rzg2l: Replace raw_spin_{lock,unlock} with guard() in
    rzg2l_irq_set_type()
  irqchip/renesas-rzg2l: Add NMI support

 drivers/irqchip/irq-renesas-rzg2l.c | 105 +++++++++++++++++++++++++---
 1 file changed, 97 insertions(+), 8 deletions(-)

-- 
2.43.0


