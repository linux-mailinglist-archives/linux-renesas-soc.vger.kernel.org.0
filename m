Return-Path: <linux-renesas-soc+bounces-31422-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GP18O59A5mlutgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31422-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 17:05:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F6D42DC6F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 17:05:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4D2BC30A0112
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 14:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5521D3630BA;
	Mon, 20 Apr 2026 14:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l6rLKudc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72A8363094
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Apr 2026 14:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776693872; cv=none; b=Efa8Fa+HjziKWKUvAXyAnSg5wxjliMoBZ/PSvFKoq0pSPf7oPQTguhzdvr2X8E3sF+sp9HojUyHP2ga9aUzPcLBvr+2/ht57aRGhq/Of3oVvfAn6wwb2J+G4zjU8rAht6IMp4PAfreHkXnPUrdrh8kBul11CdjavWLZiF638rsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776693872; c=relaxed/simple;
	bh=iIZjlaEpH3IaeaBP0OeSJtw3RsevAJcckKTLZcxEn5I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cPUYE6l3bpwWqUsl4mv7vp9HqfVXdy5mmalMakNiAXX/wxTfnXc53IJJqNqSXeAObjsQsBHvLoJJj2n4E3fh/PY9uJDirvb9US+nTX7p5hdRZk2yZXi9ORcMAzXYjvzdtNG5ho2j2ZSDMBeQ1dCs6bnAC0fwTnPJTzRbtWSLUDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l6rLKudc; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d6fbd0954so2620102f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Apr 2026 07:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776693869; x=1777298669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zCQTEi8y0iS44jkCVEZLALmk/wH8gE9Ak1V9UeMwaJs=;
        b=l6rLKudcEKTevaybzudK2Zi3kjt5xLHwS4vhWMrbh7mKBXkzosF235P61EtyrRIYSA
         EezOqZ59YyRpHzTAZgx/reXoBnwVdjJqJlRDpmiZ2XzNHzfecKzalqj0kgQ4RE1Q9gl9
         5fwu8tCH58Q9jebzbIo2hM00e05ibAFtbg/dEYJBRUEdPvNhL59UcUwhoF4K4wECnu6i
         rGfEa96pltenpc4QToQS7bJnE+2B9x7xe+WJOM3KNMbA3/SzmEQWUPk5xm85mfM7qVCd
         oMaWtTwCp8H9uj9T3LjJpIISh8hG27sg0Mru0cyZj8dzJ6qJvwDU1eSDyK3CR3e/xkV3
         /1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776693869; x=1777298669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCQTEi8y0iS44jkCVEZLALmk/wH8gE9Ak1V9UeMwaJs=;
        b=c5gp84Q5AgDnkto27SdCegkdczHO+nDsQdF92Dap9YB2Yd1htjxdlVuL43d6jEzu20
         zLRY7Clr7VKvcgV1xyFz4t4rABLu5usFhUjyXXcDdSEBaW2aQjjvFI8machE5k4/hatY
         +elE5p0eGA7bpCvRQvYdx9BDU7G0HqstD8UJRwrChGXbZO12YSXYyUIrGL3BhJIqjqtM
         U4xCx5Yhz0rXRFCFWjDYX2K30DsqZoOi4lNFEPPvHnt8mGZ+NpEtQvKXtCa7XKxxkDlN
         rjOJ/eHQ092KC8GqlJucYmTrwx7eDd1VTgHqJFhcdadjkHXN6hEFZV5p88V1HdC3niFb
         mvzw==
X-Forwarded-Encrypted: i=1; AFNElJ9jGUrJvUKyrDi7Ka0bvlpiRMLh/u9jT2Gylfq1k9aSVbzQwtEwVBeo8eN4D6tv0VCx7a5DxV35Be3XiQKWQTFYeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMR7S+QFCJZIzZjmedjYBne83ez8o8oKsJgNABO9e/Dbe0BRSx
	5bS59PBQRri4qHK75rh1W+9IHQh09b5FD7zMxZH1zPjOpGwCDPBJfgHr
X-Gm-Gg: AeBDieuFNGDwda95fJ/+SyhkEmBx+5/7oeWipcjMnSE12cH8hnJs9107T8aNbkEMXm4
	hyfpNCQGOLrn129GsE2D+pKEhd5WAF7sftp186zOQqPhzRMoLhVuRGNhgbNzPefEysE6ofzpJjD
	yUy8nc7ZSKyqhNNFkCSN9gXt1on3TUbMagjd63j/l4EBdEIfCCLhcu5nbJNwUuTBR7Z5HrA75tn
	AwKdrHAbsbl0yJZgZMXzMb8N+kwWNUEU5i++IVM5QBNmZjsfkoL8+8h5nzY0fTsk2jBv3OK2wUR
	ltO4nhMetTleWovz2/MczJIgHVJ2LFFIj71q5GITV8UYjuQRcimCSyn4k/rY2U93+GaTzAFgUA1
	UocXmKP4WF6lqNq+u3kiIA1HuLzbWpA6v7tVpAnXq4MNc63O2NRoVCskTKuVw3bn2RG8Or/ylum
	zkygKwnxV5G6zLGMhSNM6KY2Ipqe50/MxnkZtrmNqvI5PFpnaxDdlElkIX3WNyTRtXp84Hhw==
X-Received: by 2002:a5d:5f47:0:b0:439:b55d:b0e5 with SMTP id ffacd0b85a97d-43fe3dfbfdfmr21692332f8f.28.1776693868847;
        Mon, 20 Apr 2026 07:04:28 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:5f3e:f914:6f8c:72c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4d525sm28377778f8f.31.2026.04.20.07.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 07:04:28 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 0/3] serial: sh-sci/rsci: Fix divide-by-zero and clean up baud rate handling
Date: Mon, 20 Apr 2026 15:04:20 +0100
Message-ID: <20260420140426.237865-1-biju.das.jz@bp.renesas.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,glider.be,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31422-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 90F6D42DC6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

This series fixes a divide-by-zero fault in the SH-SCI driver and cleans
up dead code and redundant variables related to baud rate handling in both
the SH-SCI and RSCI drivers.

Patch 1 fixes a divide-by-zero fault in sci_set_termios() where the
expression (10000 * bits) / (baud / 100) could divide by zero if baud is
less than 100. The expression is rewritten as (10000 * bits) * 100 / baud,
which is algebraically equivalent but eliminates the intermediate
division.

Patch 2 removes the dead zero baud rate guard from both sci_set_termios()
and rsci_set_termios(). On DT systems, uart_get_baud_rate() never returns
zero, making the if (!baud) goto done; check and its associated done label
unreachable dead code.

Patch 3 refactors the baud rate clock selection in rsci_set_termios().
Since RSCI only supports a single clock source (SCI_FCK), the multi-clock
tracking variables are redundant and removed. ccr0_val and ccr4_val, which
were never modified from their initial zero values, are replaced with
hardcoded 0 at their write sites.

v2->v3:
 * Added a patch to rewrite rx_frame calculation to avoid divide-by-zero.
 * Added a patch to drop zero baud check from sh-sci and rsci drivers.
 * Dropped reported by tag as the goto statement in rsci_set_termios()
   removed in the previous patch.
 * baud check removed by previous patch.
 * Added missing macro CCR0_RE while dropping ccr0_val variable.
 * Updated commit description for patch#3.
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

Biju Das (3):
  serial: sh-sci: Avoid divide-by-zero fault
  serial: sh-sci: Drop check for zero baud rate from
    uart_get_baud_rate()
  serial: rsci: Refactor baud rate clock selection

 drivers/tty/serial/rsci.c   | 34 ++++++++++------------------------
 drivers/tty/serial/sh-sci.c |  4 +---
 2 files changed, 11 insertions(+), 27 deletions(-)

-- 
2.43.0


