Return-Path: <linux-renesas-soc+bounces-27213-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJoCAtz9cGmgbAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27213-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 17:25:00 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF5159DAC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 17:24:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6562C72C6A7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 15:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93A054B8DF1;
	Wed, 21 Jan 2026 15:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RUw5xN9r"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6417E4B8DD3
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jan 2026 15:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769007723; cv=none; b=o5sgmMcNaaCKaGBRjDFXkJwM6q5jnlU25TETv+3KJU3dKHK2qfk81yN4FpuceX6FG7EYHwHKt8j+nQz84Cvm9rA3nESaX0JlFsTpr3YRvOwWguTD4kwWDuggZqINuFV9hdfa1rwbHG3Z1uRF97hSA0KlerAXcTgipZ+BhW37xGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769007723; c=relaxed/simple;
	bh=WEUr572bemRD/PCsTF0v79zIBnpAtF0PcMVYQ9ek/KE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rq6maGGXsYrH8arzlUD8BuavhYXLY8t8MpJdFN9pbxP4INi1Ua9FjBRiaEhAMAoUZTaFB7bpQXcZqJ1jmnMvGqzrigbdUoq21hpBjURZja1bcXxWyf1eZ66pxz8pw0fVl2lUyB/2E5S8hWSIlh6IWUAxhitc+WBpAA3+tTxlYcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RUw5xN9r; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-47d6a1f08bbso25284705e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jan 2026 07:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769007719; x=1769612519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kdwe6zKjL1wvqm8jrpX494VL40XG7wHSgEylhfestXg=;
        b=RUw5xN9ruL0d7cJGI2dffExqh+Y9K3eaSDUHpXBVJ8eovRp241yQ8bUImmdBdrqX/T
         U9IuohDNj4RKWfzHiE2hZhnQ8zFQg9+z08ur1S44/kfZGLGLUweBYWK7czJBWHNvzT6d
         C24v3kvzpI8tKu9fmVmUE/q/GYzlQe/Cet4WfwHTx+QSgQ0Nzxc9eTXoRde4dwxAyvi2
         ABVwQqUe/Ec+VZl/lffHFjg0hiIvrjXCEx40mo3qgh6zXZAh+L1QzGc6NLWHl3OsxC9v
         0rz/PIhZ/VFAELfPs3+V4ZxFtdcf6hmSQ2EVJsNUMre/YYtjX56tZGWQkDum1U8gzgFR
         DFaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769007719; x=1769612519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kdwe6zKjL1wvqm8jrpX494VL40XG7wHSgEylhfestXg=;
        b=cA0BYVhDYwyTdiPYREh9hilJVOuNYEJOoVdUlIi5FDuJOIeTCIGMYWR6Tf+f6ZwrUg
         apv06Dw9uIEa8fd20C0ZMOSxnhHSrdMZWKzgeikJb/PkGLvQG6bWYXlFVWWbN9OML2fb
         wem5uf0SxtlmuhN6bs/uuGvDu+kAX7OMV13ndw/1cpuzeseIlnEtDOpWDvZdqIjnhkQS
         4SUkO52ufg+qSYkoIeOyYJKs312K1ggxfZhWVZaGF3FdoKUvsIz0QPI93iiEKgXgU74i
         rJdcD0f6as9CKflm6cOexoKocHw8wlh77pw/Mg9tH+XrrLpFYIyVn/BttGY5j2BqtxAS
         zj9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWt0EszkUJex14T3dGewSOkm6YTfr7RAgJVioYUvnDReEXAldcQ80rGpuEO3jbiMRvlp6Eg5qPIj8/3S7n2k/hP/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGz3gdeh6cQIepHBvQZaOY0nVZamxwvv3I/qNuJ/Mthf1+rdjh
	BrEQe+SYPGTJI0spNebeCVKmAMCl/BiMyYz8WauceLCnBgSLjSZvaQGh
X-Gm-Gg: AZuq6aLdi/blUMTOXdBGYBrJc5r+1DzTi4V/DWxRSZSAfkmmUzm5V+81vVtyvpKwQog
	osJg+vSIRgZcaFVB9xG2LtT4ocrXd0bb91Iv3MxEDUlsy3PM+K24dg/NNGiqeX9kqSQV2SZ50Ze
	W2GNG9mxiAcKfpgGtvUvODikgq9VciFKPwuvhKIRk93NZV/cYk4Ax7lD/DPieABLtvBFEIn97+J
	Nb9dNw/1fOpFr51Vw0h1DLy5ITgB/tqgE/lSU+Qok4BFoSOs6j6U3F/H4a2dGuLMVhiSZDLgGl5
	WSghOFILrOPZXdBaJWTiOrBICdwWOWGPJo6EMlamvvG7fzuSz+uJTM8FtZw287dRlyYd/D0U8Lu
	u3bwFbl1uTACqkcyoGNgLCR7Jkh/mNIn/hAL2Yc7B56o4TZ+22Hnnty7LKd1gym+JOnIH3bvH/N
	iXZhoxfjFdd/rcvfuXUtqKdy0QDAv2aaBvcq9WTb5UmzwQeE0abo9QoykI0FKLGkmiooAG7IF4a
	Un2C0UfNXYfIA6b1r9xwbWOjleQR9+jsmebnSz7/J8=
X-Received: by 2002:a05:600c:c0ce:b0:47e:e78a:c834 with SMTP id 5b1f17b1804b1-4801eb14ffbmr179897085e9.34.1769007718410;
        Wed, 21 Jan 2026 07:01:58 -0800 (PST)
Received: from iku.example.org ([2a06:5906:61b:2d00:3190:c653:bb13:4ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48042b6a3e2sm24787585e9.1.2026.01.21.07.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 07:01:56 -0800 (PST)
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
Subject: [PATCH 6/6] Documentation: ABI: Document rzv2h_icu debugfs triggers
Date: Wed, 21 Jan 2026 15:01:37 +0000
Message-ID: <20260121150137.3364865-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260121150137.3364865-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260121150137.3364865-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27213-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,glider.be,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: BFF5159DAC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document the debugfs interface exported by the Renesas RZ/V2H ICU
driver to aid bring-up and debugging.

Describe the write-only swint and swpe files used to trigger software
and pseudo error interrupts.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../ABI/testing/debugfs-renesas-rzv2h-icu     | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/ABI/testing/debugfs-renesas-rzv2h-icu

diff --git a/Documentation/ABI/testing/debugfs-renesas-rzv2h-icu b/Documentation/ABI/testing/debugfs-renesas-rzv2h-icu
new file mode 100644
index 000000000000..8e97f35c3fea
--- /dev/null
+++ b/Documentation/ABI/testing/debugfs-renesas-rzv2h-icu
@@ -0,0 +1,24 @@
+What:		/sys/kernel/debug/rzv2h_icu/swint
+Date:		Jan 2026
+KernelVersion:	6.20
+Contact:	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+Description:	Write-only debugfs file to trigger ICU software interrupts
+		(ICU_SWINT) targeting CA55 cores.
+		Writing an integer CPU index 'N' causes the driver to write
+		BIT(N) to the ICU_SWINT register, which triggers the hardware
+		software interrupt routed to CA55 core N via the GIC.
+		Valid values:
+		  0..3  - trigger SWINT for CA55 core0..core3
+		The driver validates that the requested CPU is online before
+		triggering the interrupt. Writes for offline CPUs fail.
+
+What:		/sys/kernel/debug/rzv2h_icu/swpe
+Date:		Jan 2026
+KernelVersion:	6.20
+Contact:	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+Description:	Write-only debugfs file to trigger ICU software peripheral
+		events (ICU_SWPE).
+		Writing an integer index 'N' causes the driver to write BIT(N)
+		to the ICU_SWPE register.
+		Valid values:
+		  0..15 - assert SWPE bit 0..15
-- 
2.52.0


