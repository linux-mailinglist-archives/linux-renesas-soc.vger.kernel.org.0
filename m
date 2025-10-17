Return-Path: <linux-renesas-soc+bounces-23242-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7CCBE9ABA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 17:19:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0438835D76F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 15:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 716883BB5A;
	Fri, 17 Oct 2025 15:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IQihjODK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C155C2F12B0
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Oct 2025 15:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760714335; cv=none; b=LqHu9pt7x+nP7S1jIgSVhCx5XJkJwUG37wbdrh0VdRaF+IYOgQNZ850JpJaBD2K7Ol4LIf7mQ8EY/KzfCuXZR9uDPkTpg+DuJObEyB6EX6OXjaP93me5s2ICdzlbeJftbkXqx5uYxk+asM0+3DSBpzTMlQs+7/ikDnuUfT4n6no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760714335; c=relaxed/simple;
	bh=CZLi+sXLLQWJ1szeixL4fKYphUAlCf2Ajj9YbKRav30=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=vCif6hSFgf1XXix0+RAxbCyI3rQ4UZmbqGCQx0u8rsYEcsA/tJVdBTNAFvH/tD7FSNXygzse2+FREUi6oUFNy6oK+/VX/kyjQVo33kShuBAxNKYj7ahZV7gG9DO+dwkgVGS5J5snfajPFzEVHpElIjUXugtjQd4EoCt7rsEgCNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IQihjODK; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b609a32a9b6so1211832a12.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Oct 2025 08:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760714333; x=1761319133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aky7O16wp7MCKRn7P+HfqmW9xe7HTb5Qd8ARsCmuj+Y=;
        b=IQihjODKFDhO4uKpBjb8YYadD7C3UXztk0gWiXd9tErycbns//00PuTNCpryz6fcRi
         xpszTuHsU56UZy76t5fqLOr+scnOQUvN3EjM/bX6dotEkKrNpXOqb3R6jnqHHNBxn6cr
         tKVW1p80jRdppKubYJFwXUWxt5ENHdn60h0HXlWfZZzKe1XjAPd80yUUr3FXyWF5fEeg
         Rq+qIcj0skdnc4Aj/8CS1wwkTi8fxOCZ1HVqr8EvbWpvxnsG+JTqxiLpLNKWJTL1AkPo
         MoKpgt7E1nrFBy8wgvc/xV2eMdBPTPdkfIv9N8VAMhIHFID8yiYVEumfaqVVGAM71ltS
         TDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760714333; x=1761319133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aky7O16wp7MCKRn7P+HfqmW9xe7HTb5Qd8ARsCmuj+Y=;
        b=hcXbXvu/D61rZhjny3/sw+CQMcB41BQNhfTuBXjBDtzn3S6Ai3dI6/jT74aGopm5SV
         8C0po6DeL8Us975mXgsyPPEt6kHKVs8bSy5tBBtvcuey7RcS48WpUuy8I4HhrBiF1hRV
         0GXafSoNMGcl3jVgdCECrII7NIufBReicDtJ5Zt6RhY5DQ0H0A+FoRlBrhx8kJ0cvpwc
         gC/sDLbeXnHwLO1l8Q2v4J7KYpAfITVDk+r5EIpzlAmdxPdVm/kfFz/dc6DtrTVxDxna
         cUsBKJ2nstTCB/MkQweHgAGI9EafLesdtw7GUnAOQ55WDvvbohTdy7ZTwaOh1hLpEZFQ
         fC6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUVKZ24GISVoSlw8xwf+FaHSNosrcXEnbXPS40svkxeSaYaTxn01F3WCQ4wBbPnamOcK7zrpJY/ECDgET8Fdxln+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxyWOd9ux6GXzMYTnjR1tB0vAxeWZCiehoDNoW+BQJ/bII24bD
	zIWWTOKDLQUCjrRztTGMb5alPX8sBg8Dkt57VzPSqIu4C16YObyNwyyh
X-Gm-Gg: ASbGncuFOhyRWWShnEgnz5F064h3COJuNeXkHz0D7OviKxMO1TeXTz0lzPVHup+iJNT
	wV/2hFo/B2TFTwgqWoUgouqF/ZPxEAAZ9Cg8JjlLtYgFLs7E4SGd7iuklmodJ5PiUxPsg+MolOF
	4sY851LJqeGJvnEWySNYVPUCkmxKxbsxXY311fqdJzlaLEiVxJyr56J7c1oLeHMvEfeMqtihwwX
	j8eZqswCf2dLPlAM/v/58JNBJNsXcscMk9N9bSaEEJvrkV7L8HKBwnqRw8B+Ea3tCuMwD6HH9Ka
	c+MLzMJYxgdzbpKPBdYC3FR9FAmsi1vRVGZ4XFePrOMLwFWKDMFf6r6Qqu9rWn2opOO/5RaqPtr
	L8+r2aLvDLXf0+gbBFnWDZxQIGSWcifqIntlOHmSPz0TGxE/Q0Fcv76utIXg+31TY6krbtE2gBF
	l1FyMmEb+e8Nqp0jxAJr/Ejvihc7lpdW/XiySysfPSdBA=
X-Google-Smtp-Source: AGHT+IErUrkf0E6Co1oQ9IYvwro69w/l75nuO5GilwN7XkDgpAP+XCdmvjp8T0T5H471WqUuqlgsOg==
X-Received: by 2002:a17:903:32c9:b0:249:3efa:3c99 with SMTP id d9443c01a7336-290cba4e6cdmr51489385ad.61.1760714332790;
        Fri, 17 Oct 2025 08:18:52 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:c7d3:fdc9:5e8f:28db:7f80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2909930a756sm67193955ad.14.2025.10.17.08.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 08:18:52 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Paul Barker <paul@pbarker.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Mitsuhiro Kimura <mitsuhiro.kimura.kc@renesas.com>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/4] net: ravb: Fix SoC-specific configuration and descriptor handling issues
Date: Fri, 17 Oct 2025 16:18:26 +0100
Message-ID: <20251017151830.171062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This series addresses several issues in the Renesas Ethernet AVB (ravb)
driver related to SoC-specific resource configuration and descriptor
ordering.

Different Renesas SoCs implement varying numbers of descriptor entries and
queue capabilities, which were previously hardcoded or misconfigured.
Additionally, a potential ordering hazard in descriptor setup could cause
the DMA engine to start prematurely, leading to TX stalls on some
platforms.

The series includes the following changes:

Make DBAT entry count configurable per SoC
The number of descriptor base address table (DBAT) entries is not uniform
across all SoCs. Pass this information via the hardware info structure and
allocate resources accordingly.

Allocate correct number of queues based on SoC support
Use the per-SoC configuration to determine whether a network control queue
is available, and allocate queues dynamically to match the SoC's
capability.

Enforce descriptor type ordering to prevent early DMA start
Ensure proper write ordering of TX descriptor type fields to prevent the
DMA engine from observing an incomplete descriptor chain. This fixes
observed TX stalls on RZ/G2L platforms running RT kernels.

All four patches include Fixes tags and should be considered for stable
backporting.

Tested on R/G1x Gen2, RZ/G2x Gen3 and RZ/G2L family hardware.

Note, I've not added net-next in the subject as these are bug fixes for
existing functionality.

v1->v2:
- Split up patch 3/3 from v1 into two separate patches for clarity
  of using dma_wmb() for enforcing ordering.
- Updated commit message for patch 3/4
- Added Reviewed-by tag from Niklas for patches 1 and 2.
Cheers,
Prabhakar

Lad Prabhakar (4):
  net: ravb: Make DBAT entry count configurable per-SoC
  net: ravb: Allocate correct number of queues based on SoC support
  net: ravb: Enforce descriptor type ordering
  net: ravb: Ensure memory write completes before ringing TX doorbell

 drivers/net/ethernet/renesas/ravb.h      |  2 +-
 drivers/net/ethernet/renesas/ravb_main.c | 40 +++++++++++++++++++-----
 2 files changed, 34 insertions(+), 8 deletions(-)

-- 
2.43.0


