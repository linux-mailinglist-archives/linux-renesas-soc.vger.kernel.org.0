Return-Path: <linux-renesas-soc+bounces-32881-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJCKOJ7nDWrO4gUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32881-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 18:55:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D589592ABF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 18:55:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6BEC3306907C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 16:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD3C736B059;
	Wed, 20 May 2026 16:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DfKLfiyX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B0738F945
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 16:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779295755; cv=none; b=JadsDOT6t1KAgQJQtjw5TeWB0/Ywaj45eHR+K0d3K78YtzhodJTrilcmSjkF3vCsAuTfizXdlxX7NmHk5tHJ4vdOiNXcmQpdFJi0ALFb9ULPxEN7bPB3Ghvi9kl9iit++70Vw5DxE9klQI6et9AK82CF/wrRkusws8xHoQ3T9wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779295755; c=relaxed/simple;
	bh=1wdbQGuw6HvmZIeFn+pMLa4ccPKyAcHlFLo3mDEmmuU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=exvA0Ij+FkjlMCFo6DcjvcE9WIRwrJhhYvc7HEwB1wKT5CCW1UhoffMiU4C3+4NJw8lBp0W67M6C+wOBoROLIugBbAihrDO4L+T4pXQl0b4i3WJRcDT6E5eEHmBesHY0VDb8ytpFri3kq9EZMwrg7K7qy+7cZgn04uoEcqKmE7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DfKLfiyX; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48e6db3ff7eso26552885e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 09:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779295751; x=1779900551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I9V3EBCqEjOEBqzqMBD7+ufR2GQPQMJRKrFaD0tdiJU=;
        b=DfKLfiyXIgG1aD37LJUqaHfLFOJZ4FGIixMlYb3lhoElmalo7j92dDiIPq6z1mCox4
         8zsZ6j1vRBaYTp0BELd6E4COLwbIilwmjuXzQdYiwkI1Y1UmP/QuIvjMESlNuLFSIOuO
         UL5LCuPIrhJJP9ybzR3WjOMikMt1SP6/RVsP7wEyDtvBO3bgBOEEDr3U26xTXuNO8WN5
         SVX4sYKWHcKoR2PzGxx9XiCGEiFqDJjkhwYSGIMufoifkU9ZDCr1zl2CaRTcpRT0PHpG
         g+1HDIfjNT6r9KaXuZCk8Vn21v/GOAGfnYG7w+OPmG3hYJMEczEJCklQnLcPzfMNLKOC
         JrqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779295751; x=1779900551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9V3EBCqEjOEBqzqMBD7+ufR2GQPQMJRKrFaD0tdiJU=;
        b=DtFMG8hR9AIVRpl9dNvzmCMObgO7XINzR2Xv5w6cddNuR+4h2FL5Ansf1enLCNiKZg
         weyXkZZmbLydyOQsbauGs2hCuHh4FwQ02HjYi8suoRmL+nQ/gAkG5d3PFsqZQlKcrgxw
         dCsmfDGSpweoAA4T5QRcDatexpU4JrvER1LRjAHC7mqa97pmjspSUWfe/MmNCemjPLMe
         SrczLH90+M4f4LItrXJH4DuE8BiPAAx7NnrXes7+PPsMqVYVaTpFrXk8PDVmqgGes3Tb
         2B11C9jXgrGjNHL+TylwNdvCMYOMlVYUZi6JPceo2OjZJEJBm4VE9d2vlc8OTjKb2lMv
         CBgg==
X-Forwarded-Encrypted: i=1; AFNElJ/ZvGTcpxu4swBTffxmXhWN8MTPZPrqHEaBuD6lkCTuwU3KKocdbX7zebLACwvYWhZtVEYQ3FFoJWXw+O1FKqK2Iw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1dCBbV9RcSmBiNJ6gRpoZ9pbtylG9bR8sAjwsReSfDAS8/rZd
	KuhOUsuuhwkZO5DE163bY7LZM5yuvD8L6d1AJWRExVc+sDRPONXYAnpA
X-Gm-Gg: Acq92OFYHnjM30xGh82Wqv1u/de9iLQ5mwDQaKNbD3YuQjYDyoAuOr+xXcPh3gKQo65
	wthsinPE1EsIHnrFOFs8BWKo9X5aeCYcfEqLvZMut8tqBCF/oA3F9Dw4zkBhljKsWKtYY181zz0
	Rr065DKeNnf1uXBSrbXdLJEjXBG8aK24YXsnGnui2tNQaKANHdQyBFiK9N6lQ+QezyWPAsXJQMv
	TbKqXXN9yfpVljudG6eWLMoU+blY16JRHWeJmZ7qAfH792+vW5MAoDG7ZSDuvYVPzYIvExmxX/O
	09Oxk4RELZge9ASYW2xb2TakeDVnVwy/yJil1OTk6JtkZYNqF3spZnVRDOL8ZCEVP1qtHuoRWqt
	AAONn7nE2XoQnmri0JIEhhWuyIxVSkjKATdIvATx7weKoMKv/0CDEpjLIgmC20tzneisUuZ8pBB
	OfaxA0lK+hS1MJxa/DGO7G0lQSLG8JgO2NSLJrCe84z1Z8YjuIpgTBq98ODczc2LerNSUnyaalD
	Reb4mCsNncSmG5q/gHYM/uwr5LfWwuC8Vx/YAb8+/vLL1A=
X-Received: by 2002:a05:600d:8:b0:488:904b:f31 with SMTP id 5b1f17b1804b1-48fe6325213mr316461235e9.22.1779295750801;
        Wed, 20 May 2026 09:49:10 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:dcb8:81c1:dc9e:cd68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033d8e71dsm3110285e9.9.2026.05.20.09.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 09:49:10 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 0/4] Add PCIe support for RZ/V2H(P) SoC
Date: Wed, 20 May 2026 17:48:19 +0100
Message-ID: <20260520164823.436992-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32881-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FREEMAIL_TO(0.00)[kernel.org,bp.renesas.com,google.com,pengutronix.de,glider.be,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Queue-Id: 5D589592ABF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This series adds support for the PCIe host controllers found on the
Renesas RZ/V2H(P) SoCs. The RZ/V2H(P) controller includes additional
features for PCIe lane control and supports multilink operation with
two independent controllers.

v2->v3:
- Dropped using linux,pci-domain property.
- Switched property to phandle-array for renesas,sysc
  to support multiple controllers with different SYSC register sets.
- Parsed controller-id from the "renesas,sysc" property instead of
  using linux,pci-domain.
- Updated commit message for clarity in patch #1

v1->v2:
- Dropped RZ/V2N DT binding patch as it has been merged in the
  pci/dt-binding branch.
- Dropped un-necessary new line in schema.
- Renamed RZG3S_PCIE_CHANNEL_ID* to RZG3S_PCIE_CONTROLLER_ID* for clarity.
- Added locks to protect shared lane configuration state and
  prevent concurrent access issues during probe.
- Added cleanup action to release lanes on driver removal.
- Reconfigured RZG3S_SYSC_FUNC_ID_LINK_MASTER in resume path.
- Renamed num_channels to num_pcie_controllers for clarity.
- Updated commit messages for clarity in patches 1-4.

note, the patches have been rebased on top of next-20260520.

Cheers,
Prabhakar

Lad Prabhakar (4):
  dt-bindings: PCI: renesas,r9a08g045-pcie: Add RZ/V2H(P) support
  PCI: rzg3s-host: Use shared reset controls for power domain resets
  PCI: rzg3s-host: Prepare System Controller handling for multiple
    controllers
  PCI: rzg3s-host: Add support for RZ/V2H(P) SoC

 .../bindings/pci/renesas,r9a08g045-pcie.yaml  |  34 ++-
 drivers/pci/controller/pcie-rzg3s-host.c      | 232 ++++++++++++++++--
 2 files changed, 246 insertions(+), 20 deletions(-)

-- 
2.54.0


