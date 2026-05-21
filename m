Return-Path: <linux-renesas-soc+bounces-32904-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aM/3B7jTDmozCgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32904-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 11:43:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8C85A28B3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 11:43:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6B08308065C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 09:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 444FF3612E2;
	Thu, 21 May 2026 09:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="koyJbRb2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3F429C327
	for <linux-renesas-soc@vger.kernel.org>; Thu, 21 May 2026 09:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354783; cv=none; b=WwwV7NarpUQWUQWVaSpdZOB2ylEF5VC6PneZzklqYJz60xsRQnPciy+1VYnS9v+F7Gke0yEilJxayMONcTO3mkw2ppV2PIAaiq4VdyjrahgHU3niOXGOZ821jRukstDAIZAMNT0BpKZsw5VE5+jLc524l5BSKQHswBGhN8pH95U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354783; c=relaxed/simple;
	bh=nw+AbDWSkF/0mQVIA+TV4A4Ed65ipc2EyE1oFsQt/LU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PTm37GSxhcNkwd10k8Y5drd7Juz6lXjA3uKX97u+2Ch5XvgfFAL52f7vqx+CZ4y1/PBVnR3bw3G79LQY47scwwy33TyVTd9GrDPsyoa0AjuhtNqDFnz58kp56sFWv6TN+Plvs58B8kAZvIfAMVDmo/zLQDgwpvbXtomwzKLbU2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=koyJbRb2; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43d734223e4so3877509f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 May 2026 02:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779354780; x=1779959580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eKdwRFTM7NQFW2q3Gwv2bxtOXYeZ9TnQRhzY2TP3tE8=;
        b=koyJbRb29+xoYIYqccjyNlgNSr8neQz9QFTmHO6qhhUwR4FKMfMbyGngLjTuwabuwS
         iFTqTESa6hSVPcP3jRrc6bia7NtgUq4yJwJ9z17ZNUH19MlE+f324KQWymSrRJ/NJK1J
         SMOXE4SmsCr2lV0gX/7oJrSKxVGDKei29bn7IMqcKFSMoJDKYj6vVNuOQ47K/xBXDIAB
         b23P48sS2AkwfnoPx9XFfe0sVE0A7r2wkkvIE2dg0WfjYS7fg7lVFoXudxb3HjCa5Sj+
         HjmuhIC4OATXXbnp/p/3lwcyBoVUWkHZ/x5qG/C/BjUx1S8q585IccOdr3FgTtimquSY
         vMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779354780; x=1779959580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eKdwRFTM7NQFW2q3Gwv2bxtOXYeZ9TnQRhzY2TP3tE8=;
        b=awOLgTzwo9kxy9oy3DIBA6cc6JgG5aiJS2baF9nKaWfftzBeXItjiq+hSSvf4CpgiN
         GsD94ss/3DEvwkYMd5M/Rz3GqNxs5u7CJy7T7poHqjHh8eD9DGd/5hvPM+iB/eLobuZX
         1hryxVNQbL5ypQtJ//qTL1IJRIuHC3yMTPkmUEaa9LAiy78lp5o1j75OIaHnQ2vz08kq
         msuQqqlCLFINLkgDqr79TzXCwNrl5nhZ3WaRMnzumrWHnmj/WCkHm/zxAy/H1oSe2nj3
         ZM60BKXzsY31kbIz2QbHfZGRrHB4tlO7zTSw1Vfdn70+JmFZbF9eAcSYhJGTr40CQcBz
         WsxQ==
X-Forwarded-Encrypted: i=1; AFNElJ9vwODb/1Z0z1OTll9to4HRtzsSsHbgDz4DtYJwj8NZnP8ypC2Fl75uJshsR97IxJTY5DWyDaWiTuLPTxBWjQvE6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIjfCZuKOj7EVTIQYvfwmglofsegejLLwwtie+I8XK9mVuaVjf
	zDU4oecRXUCn9ElOoiuX5BpJh2twYzeu0QKbAoHNhuDqViPZtRFk6QPj
X-Gm-Gg: Acq92OHYbs7tjj4t6OGIXkrRNmzqUQ56tQf27ZVxq6eJtXBrXaT06N3U32AqR7JK9W5
	oGvj3LuG94a+JXtZI5x3ptRBXE9nq2JYyvCmoBFj16OrBf20gz3FTTO+wHBawhRgKmGD8xuOI+6
	Hn58nM4wSiBeNeQvDIv3KzroZaZl9mgS2ZJyca0qJMvrH4v3n4RQ/AhNsGkO78v4qvNdzOuVFj6
	U9D312L9X2B5OvKDlkRRpgBH5Lronmu8HEpHGgxSWp8PX5cEzePvinI6mQ7qW6BCRy1pfnUGazo
	B8Uy/Vpz7rYM/XPyQAmhpNAeoGL5HQ3IVS7Pd2LiMtH0qGIC7zPxFB14xjSIekk9A+IZZzYsaWb
	DHWfmg0VNq1eg7MYV37xbDmrpD/LgdGR8bcwlLs+IuvmfT7+WE3a/Cbb6HlvQ6vlJnaN60aiG31
	wNfA0DhUUaO/metEkhmCU3eSD4lKoUyfQo5Hmbm1InsVw7ST1a5Z8qSk5xZ2ZabhVBKRnI9p+2x
	e7lTDL5mr3qVaIaSW4mXsCBMh9Pnp5jhpnGas0FKifyGTdm
X-Received: by 2002:a05:6000:2388:b0:45b:d872:592d with SMTP id ffacd0b85a97d-45ea349a320mr2805009f8f.10.1779354779965;
        Thu, 21 May 2026 02:12:59 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e184:549b:e5bf:ab7f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7cf58fsm1955940f8f.3.2026.05.21.02.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 02:12:59 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2] PCI: rcar-host: Remove unused LIST_HEAD(res)
Date: Thu, 21 May 2026 10:12:56 +0100
Message-ID: <20260521091256.15737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32904-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[mailbox.org,renesas.com,kernel.org,google.com,glider.be,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mailbox.org:email,glider.be:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 7B8C85A28B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Remove the unused LIST_HEAD(res) declaration from rcar_pcie_hw_enable().

The macro instantiation defines an unused 'struct list_head res' variable,
which conflicts with a valid resource loop-local 'struct resource *res'
declaration further down in the function, triggering a compiler variable
shadowing warning:

drivers/pci/controller/pcie-rcar-host.c:357:34: warning: declaration of 'res' shadows a previous local [-Wshadow]
357 |                  struct resource *res = win->res;

Fixes: ce351636c67f75a9 ("PCI: rcar: Add suspend/resume")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
v1->v2:
- Updated the commit message to include the warning.
- Added the Fixes tag.
- Added Reviewed-by tags for Geert and Marek.
---
 drivers/pci/controller/pcie-rcar-host.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-rcar-host.c b/drivers/pci/controller/pcie-rcar-host.c
index 213028052aa5..cd9171eebc28 100644
--- a/drivers/pci/controller/pcie-rcar-host.c
+++ b/drivers/pci/controller/pcie-rcar-host.c
@@ -346,7 +346,6 @@ static void rcar_pcie_hw_enable(struct rcar_pcie_host *host)
 	struct rcar_pcie *pcie = &host->pcie;
 	struct pci_host_bridge *bridge = pci_host_bridge_from_priv(host);
 	struct resource_entry *win;
-	LIST_HEAD(res);
 	int i = 0;
 
 	/* Try setting 5 GT/s link speed */
-- 
2.54.0


