Return-Path: <linux-renesas-soc+bounces-32811-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGFKEMtsDGpjhgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32811-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 15:59:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B16CF58024A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 15:59:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8BC230D34FC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 13:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694DF3ED3C1;
	Tue, 19 May 2026 13:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nfb0Y8oN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3907035202C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 13:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779198830; cv=none; b=dAvP3Uq8HmQ0zvAz65hjEoFawx5lei+wiyYH2c4PtshkNr2pYMAQF6QvF1shzhrSaUEgqZcq5Tcc5Qq952FJMIdxLOMsMVNQ6f4bDNqpurwKNmxbqRElSjKDB65/I4PPaagLZb6ZfzNfzOlBKXUorWgZJg8cvqNVFqIvqCV3U74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779198830; c=relaxed/simple;
	bh=efMC9iHH5jBQ/HnjbZ7E3waUmvQi9RozSyYhZOA4z2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ffKmJW4Wh833/RBSfAOFXyQt5egfhpO5W+/CV4SLnAFaa3arWINrrf2eq1RDdnHiDmr2fIOGUqEcHaS05JablN4gFldDaoPH10KLWIkHQ71F0CQhdhHoeOn//TtOu6HmVWs8E6tmsRkSW/3VdTGSqX/fVw2WMJE1SuzTp3/GHh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nfb0Y8oN; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48fde648a71so26252265e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 06:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779198827; x=1779803627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SodPtCl5az/xxqbvvCj+dXcI10ggdbsgQro2yt5ReF8=;
        b=Nfb0Y8oN9M8zGfAXWSdfiPm08kH1cU+a1MDsOWavrUt3Lk8nOQU4FSU8pFSEot8vBI
         O4PJWxG9nmKhPMyKBXtG0F090GajWCl9pTcrH9SM2lAelLS5fMei2bvSAJfPxX0YRH9b
         OTe3SNigVXASEcw9gDUa6hmL378hVJo7/hk3wsQADEkjVU8O+pVjKk481l3Rg5ALtK/4
         3rFgSRu9KjFF+Td821Ig9f2Bj8TO61ujE3UihST7tjZsLu07QaJ+fvEJhg9uYRwV2vyw
         WHxSntZfuCzZ+ogOSrU4T1UTAGQ+IvsrQ0YvDaOj/KzpNL5+t5Cdqkw+HTenFc53dyps
         BMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779198827; x=1779803627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SodPtCl5az/xxqbvvCj+dXcI10ggdbsgQro2yt5ReF8=;
        b=VabI45pN3WLM7MJEO0fkUIR33TJv4zJqnOoOcCdckAyjMNFWdS/IDg3R4kcgZxTg0w
         mUigX5pefT2ESMnIzYI+iCz5dsTLXQnpa/VsfFv7c7Z963yS4elttqelcqBRu2Rdnb6r
         D2sddor3LVTlbsr/ig/XOAgoh9gcJjkYmNoJHyO5McOpXaNMSdhBUJ70eP4u3hdKKNOm
         SorVLX5kF4Msm0r3ZKqaghszZqlfgdflkbUnCpAUukWSy/JVNGiLj1BB/+cXkdtvIPVP
         7gJ3Zie9R91MkyvUGuP7lwZ9j8nuFmCHVdpGsghHi1HU02xQAw+8c9DO2nTF9FoFB1o0
         odPg==
X-Forwarded-Encrypted: i=1; AFNElJ9gVBNCO9J1ucPLo1KgTn0fgDMtTQwyNZn/wV3CVNSk0cR7pb5+Vn5ttYyjqLrszIiX7eoqn732jVXpmRl/M/ek7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yywme+eorkc5GrMDj7tYyBfjPPHLaaPHmruhUaB2DqOMguDaTRk
	C/kbZht47gyLkyWc+IZvwyAf8gD+KG6Rmtw+WBtkr/9EHAAXoYSV15oD
X-Gm-Gg: Acq92OGImIvPF3MBPVMzoe00Jc2gUPISXFDtIR1AtDtdYxvLBH1H9uDJu5K55qdAU4f
	rAH8S0MT2I99befgRo7i8H/JrqTdcS699KMNTf+YsXkLfmtym0Nr8rq5g/XVxzRhcpJte2aAnzA
	7FNOpKdTVWe5OHiDIXggJdFjrsY/YrKwI//TsgENXlbs3FRkvywDz3VGKIp5+2ZnH4WdQCcIzMm
	x4vvgJ6DXwfv2ZGplMxQHDziwtJNS88aOCuSuSMYs94I5AYSZCBD/eJdGojdgA6iV5lGAKMRlnA
	JjxfKR/gOuH4f6KnpIWiCZkMREDwUC6R/uxBX1EBgL0OK4x3BfH+gzTzWc1WQBJksLOVb7glhtg
	eLGqF6QV/Pix6JVZ10F6s8zdrX5EMLFLub1trcTvdpIzWpi2IQ32ll+o+iLCUDnFprOwpj7HPTH
	vwv6/xErzp+bK2eo4mEXr1ICUgJ9yQllDCC1thv2dOrP3IVbSHFoUQ4iV4Bh8+Ylgfypib8aKyE
	z0iexO3ytZ3yOCxWuCgM1XVRn/eOvIhYpkGDyoz8Dn+52CShiMeg+kkb5I=
X-Received: by 2002:a05:600c:8905:b0:48e:89fa:9811 with SMTP id 5b1f17b1804b1-48fd6361dc2mr303020975e9.13.1779198827492;
        Tue, 19 May 2026 06:53:47 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3f5e:825d:a98f:fd29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1a22csm44964358f8f.19.2026.05.19.06.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:53:47 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/3] mmc: renesas_sdhi: Add OF entries for RZ/G2H, RZ/G2N, and RZ/G2E SoCs
Date: Tue, 19 May 2026 14:53:39 +0100
Message-ID: <20260519135342.623943-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-32811-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[sang-engineering.com,kernel.org,glider.be,gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: B16CF58024A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This series adds OF match entries for the Renesas RZ/G2 family of SoCs
(RZ/G2H, RZ/G2N, and RZ/G2E) in the renesas_sdhi driver. By doing so,
it ensures that the existing SDHI tuning quirks are correctly applied
to these SoCs, which share the same SDHI IP as their R-Car Gen3
counterparts.

The RZ/G2 series SoCs are functionally equivalent to their R-Car Gen3
counterparts regarding the SDHI controller logic. Specifically:
- RZ/G2H (r8a774e1) matches R-Car H3-N (r8a77951)
- RZ/G2N (r8a774b1) matches R-Car M3-N (r8a77965)
- RZ/G2E (r8a774c0) matches R-Car E3 (r8a77990)

The following performance improvements were observed during testing,
on eMMC with HS400 mode, using the mmc_test module for 1000 iterations
on each SoC:

SoC      |  READ BANDWIDTH (KB/s) | WRITE BANDWIDTH (KB/s) |
         |     Before -> After    |     Before -> After    |
------------------------------------------------------------
RZ/G2H   |     42500  -> 100744   |    70109 -> 72594      |
RZ/G2N   |     46680  -> 104731   |    73393 -> 74298      |
RZ/G2E   |     159472 -> 180781   |    126355 -> 127725    |

v1-v2:
- Dropped adding entries in the quirk list instead added entry
  in the OF match table to map the SoCs to the existing quirks.
- Updated commit messages to reflect the above change.
- Rebased on latest linux-next (next-20260518)

v1: https://lore.kernel.org/all/20260514212024.1624517-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (3):
  mmc: renesas_sdhi: Add OF entry for RZ/G2H SoC
  mmc: renesas_sdhi: Add OF entry for RZ/G2N SoC
  mmc: renesas_sdhi: Add OF entry for RZ/G2E SoC

 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.54.0


