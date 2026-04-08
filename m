Return-Path: <linux-renesas-soc+bounces-31021-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6P/gJ25l1mnIEwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31021-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 16:25:50 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 027F73BDA0F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 16:25:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 918E530417AC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 14:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA3F3D3007;
	Wed,  8 Apr 2026 14:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="phAkUg1R"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333283D0917
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Apr 2026 14:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775658072; cv=none; b=uKeOIa83ssvcHrLau+YWgQ42fTid4lib7xS7bojnABryLFb51uSrwOU3wUkAhb5NRex6pfRqwiWAdRSYPYKTpRWpa1Ko2imVBESQSSUhsfhMhEqD+pPCELhyd9TWpZoNdJzpuZX2TnD7BuPue5g4PxWaEpaCwKgz/XMXUL9V69Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775658072; c=relaxed/simple;
	bh=GEsOH353p/1G/JzP0djxYvZlTie3JSvCRDJMrIeAh+s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m9w+oFvu69NAt12YSpwen25kUfTNgUZfE0b/VESyOhW2LX2VySTscrT37WNAfjtxJw4WzMudqc6XQ/251d+6BxnK7esqck24dyY9SOY9YQnoa79kZc7TZakyk1v/6yH80WeyPRnjVUH2zrFTaS2xXNK8lAdK1ZUtagzfksFKlSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=phAkUg1R; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43cf8d550bdso5827794f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 07:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775658068; x=1776262868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CMF6apjPFsM64OzbUJQDdgH7IQW/+yy5CdRNlHUwV6U=;
        b=phAkUg1RnGbO7UHtnqFdsWio3AHfh+tRYGPMEP0cwVV4GsIM43eU7bDqTGGluv7rZy
         UJ+IcLxfLmQQTRKByWo/VdVmkETTltwhI2vk5SCrbobEGu1sIH0kE11q+uLrWMAA8K2b
         i+I5yemRg4ziTvcmTkID4Cwf0bV1h6lMhkkMyTKwI+Mg+G+B/pfLEBrSGLJmvtz+lxdG
         FFpRrhr/SJ/OZgy+84Q7QdMs6S11nK1ripAA9GtvMob7AORt/6uik+jz/lgS0cwvqO4R
         2skR/oTcGsUrRk42iFW+ymG89G/Cpu9anMcShs6gpaebNxewKGOjaVyu3Va4i+jKQaJP
         O4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775658068; x=1776262868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CMF6apjPFsM64OzbUJQDdgH7IQW/+yy5CdRNlHUwV6U=;
        b=moKTh5Ksvd395bpEGxhNUNsiqzRw73enygg9VA7ORIZz5YT+qzRUjt6qsMFcsaMNwv
         yKtVgTWZiC1ZLjF2IzY1YFmCAxWOXmfRb4zkKj1JP8XqPs5yoTf2/t/CcsCmE8nKJnGO
         9gD4jktSyuTmGb1+PLNqPCJJEiBsuLcIgoqoPQb31gtAwGcBGvXlAvz2YIxOLoikXDLI
         XvJ4hmUNqA7WwPw82LBzzwEkry3MmVOmW30PEOQ4yxmSBDLxojtJfNHjfmVEEqPmuj8s
         qJfCJKmuIf1TYRQMkyyoy0hhJw9hyZRSRi34oy5dX0y9YFsnzPF18XPRxkNBBtB4sdIM
         bibg==
X-Forwarded-Encrypted: i=1; AJvYcCUHyz3nkjVnIRmhdivc58aIDs/1BgkCN3sjVOaokCDTHa2y9fqenZqaodsH0s49oyNzgzdUS9gsd7jxWYJt9MxaVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEY2IagX5XUfQBtAC1xCyt72FzAdQNp/3XL163UbwX8Ix2gWh1
	wS4JZ+foTtVctuZDE5fZ8jBZs6ER2L5WpuAhkFwYhXURNNR+/nqvo8ru
X-Gm-Gg: AeBDiesx05Hi0OCv/pjIV47ajpKeLKBgrQ+fD7/iQqK45vJF9HzIO/s865SXl3g4F7r
	YAm7BlUrngtPaBcrRZwwqrvfc3tym3loANQ3AZFViLZagGs8bPgqNhbE5oFBBD5/jF7KCEYgRCW
	ps/belZDR1XPOtrlsfm2lzm+qCf+fjNWWNdT5tHlMyjhgoqB0KeurvHsTK4TUz3hdDupCWFLTe7
	jC2gpJnj6CuZ1/uEQUEihRKuFJrBZLK7EiUyQLBbBulVrlvQ0KxfNgXSFBnaq5x7F7iyVuDS2eg
	DFF5jybu1hNLFeN+nqICevC58sfKLAtb7ubi2lTjZFLnsOWRIr0trbeJv8VtB32vAZWyY6EJE0K
	ii4ldIh7cfoWL14UQXcqn6lGSXeM6L+RbYSaALhVAvB3nreJja8Hng9fc4y43gS/7ThZb/SEqbV
	NTd0qqzrVLGS41AYdwu0/osgvgW/j/+XEYjL0aRG2efnd7azI=
X-Received: by 2002:a5d:5f85:0:b0:43c:f7f6:6016 with SMTP id ffacd0b85a97d-43d292daa51mr31326678f8f.32.1775658068345;
        Wed, 08 Apr 2026 07:21:08 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:f65c:8080:131a:202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e1fe0b0sm60474467f8f.0.2026.04.08.07.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 07:21:08 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 0/2] serial: sh-sci/rsci: Fix divide by zero and clean up baud rate logic
Date: Wed,  8 Apr 2026 15:20:57 +0100
Message-ID: <20260408142105.310210-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31021-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,glider.be,sang-engineering.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.973];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 027F73BDA0F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

This series fixes a divide-by-zero in the sh-sci and rsci serial drivers
and follows up with a cleanup of the baud rate clock selection logic in
rsci that the fix exposed as unnecessarily complex.

Patch 1 guards both uart_update_timeout() call sites in sci_set_termios()
and rsci_set_termios() with a baud != 0 check. uart_update_timeout()
divides by the baud rate internally, so passing zero causes a divide-by-
zero fault when the hardware returns an unsupported or invalid rate.

Patch 2 addresses a related issue reported by Pavel Machek: the goto-based
early-exit pattern in rsci_set_termios() was obscuring the control flow.
Since RSCI only ever uses a single clock source (SCI_FCK), the multi-clock
candidate tracking variables (best_clk, min_err, brr1, srr1, cks1) were
redundant. These are removed and the goto is replaced with a straight
forward positive conditional block. ccr0_val and ccr4_val are also dropped
in favour of hardcoded 0 at their writes.

v1->v2:
 * Add a patch for avoiding divide-by-zero fault.
 * Dropped the check (abs(err) < abs(min_err) as it is always true.
 * Dropped variables best_clk and min_err as they are no longer needed.
 * Dropped intermediate variables brr1, cks1 and srr1; results are now
   written directly into brr, cks and srr.
 * Moved dev_dbg() inside the if (baud) block.
 * Dropped ccr0_val and ccr4_val, replaced with hardcoded 0 at their
   write sites, as they were never modified from their initial values.
 * Scoped variables err and srr locally within the if (baud) block.
 * Updated commit description.

Biju Das (2):
  serial: sh-sci: Avoid divide by zero
  serial: rsci: Remove goto and refactor baud rate clock selection

 drivers/tty/serial/rsci.c   | 36 +++++++++++++-----------------------
 drivers/tty/serial/sh-sci.c |  3 ++-
 2 files changed, 15 insertions(+), 24 deletions(-)

-- 
2.43.0


