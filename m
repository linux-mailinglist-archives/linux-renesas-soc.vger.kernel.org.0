Return-Path: <linux-renesas-soc+bounces-32812-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOeAONtsDGpKhgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32812-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 15:59:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D326580266
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 15:59:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2945F30DF57E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 13:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C5B63ED3CB;
	Tue, 19 May 2026 13:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bH83+fwQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E153ED3A7
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 13:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779198831; cv=none; b=HldTrlLvvI27iasVb8Mnf/f81Tw5gGb9oFvzILG98Y/mKsZROEIJ4XDShkXQ/9r+xj4vMVugxpOVSWjPN9xFuGaWysQM3XmVmgQ7J3ub7FLjeQiPufmZeibrJ1v+TOt6j1M2OEGQORytUmD67ZMoAaCvfkawJELPgWiD+EVAT/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779198831; c=relaxed/simple;
	bh=sH5CAXuX43myBAnxxruPGpAWjzBS8NW4KkHXNjYDiac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cm1URf5OoGmuB3v/Y8maf079wKiOSAaZNn7ity02931zy9lmzPo/GjkDsIkYFHwnDx0R9bEapsGQMPbfdlv3evkedBTzFut70UD08xqDPEwzCDjew7IONjr2buyJlpZTYTlGKdCgwe1QgLWv7lH3piNhX8uGxgQ0uhcztuV7IcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bH83+fwQ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-441209fb77eso2176689f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 06:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779198828; x=1779803628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wBE0iiYvBm5N+5+htIhA2pkzu0VOJpuxuzRwd/BpEvQ=;
        b=bH83+fwQY8o3JL+MI0OGq7U2ktU67YffxzYQhwglaRJ4v/4Bha8X/hQlx1AtRvxoET
         V0gtd9GAKQTME0I8AR+/0dHuTL85WnRRBQ/RTLAvhwIV/AKUGvp/Kx/gdFCxpZkNwlz6
         Vzw3hni0ud3JtAvPtBieBynxAKRpzESVRwnNvVuFjAC22sbhImcKDAl3cpkzr1+o3mqy
         0Eda14Kk3fSg3l6Bubb0PC+lf0A0mFu/UH3asvqSxxTTdaP4QbhNVkFXTd6mjx5IDhUh
         EmLuY48vscmEYLEBthJJumEN9DOgkNLPlytm3Bla4G8rpnx2AbSKP1Lov4+bRU4Yp+By
         nSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779198828; x=1779803628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wBE0iiYvBm5N+5+htIhA2pkzu0VOJpuxuzRwd/BpEvQ=;
        b=slDtxIuwHKAtrKmys3EULdjFAsvlegvjNH8bqToNCOolDd/NxCf91QlKSlODT61KwY
         P2W6+95/i8a7ucZKft6NsMokBtrskvf5bs0pTKgNK3JkTIqwtaw/NyZ2TrMyi4nzvn5/
         9ZNCbL8b7Ivn8/fea2tjgXh9dBSiPFuoQYDWEVF9Rg8RVy2vEA5PFXzpYLAUc3sWEteO
         kv8UjRq7T3t0/CF+kpAHdnT01azUY/b1IhgObnBxTV306k6LL98vm0ryNJ3R+jD7oSEN
         Lgst6FqnGWQp0KayNRd9RvNigmf+JawPIpanyeiKClO0v6rtkXSniuZAqoEBjtr7EWQk
         tWkQ==
X-Forwarded-Encrypted: i=1; AFNElJ+yK6SQ9EOKniy5SLsoWFxoH42O2wFgAYmsrKSRK0YCpv98uE7qMjR0NCTjMsNrEk+kEQcLldfPacQ+FhAn8lxKzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsHeKZfb7bLy3qEAkJ1zc7tZGL1Sf51QnOQj96t51uxtJM8Gqg
	V1eppXOAiI22Ukb6etd/70zmGGa545inA2Dx+4QQUJgFt+FsZGLUytcn
X-Gm-Gg: Acq92OG5w0doGIPqNfRkxvRV8Vz8QHQoP0tpU8BO2f5zSNKi4wzPnBauwssUtlRA0dE
	mSxGiAtTViCt0luy9HYJXSzDkgw+tCPyq5t1U33LicKlMgztrCw3Es3siXLG2m48spStHkIBOGf
	aKjyllZKJFBMQI/A+QmIj+/gbGyWV1F8sbgjli7g5H38W56kUqGmzjj++lidvlV9k/r+IeXOj+L
	c+OiPuQyD8FTOuprOVk4/ulCQEtOXNedGo9CFDlllAYkRAPAdSnM6iarTEwqVMB1ajoTvViHVZ7
	2iZChv3YzSe+2723OnDSth4Je15eb2Qfe72et50peTfFEbE8bye7931SWVQH5lSNCsI3285uZHO
	1PW8e1E6LyFZH+K0Hl4kJJ6xa+7HcUhKXF9itol/4Tqc2usVIBYUzxgHs9QVjwMRg1OoOXWxn8K
	3i+tDZ21u6Eb/pa6FRX8AYse+v5Kj9SfgYQukEjBsxXVIqQoKiSaUGux0+AvPwx7NIa6zxsWiqX
	t9cGSnS6939C8C2BbBNZiaDaqJ/Pn/6s4XuDCq98yz/CF1I
X-Received: by 2002:a05:6000:21c3:b0:44f:b82f:2d18 with SMTP id ffacd0b85a97d-45d90f619eemr24723326f8f.11.1779198828040;
        Tue, 19 May 2026 06:53:48 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3f5e:825d:a98f:fd29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1a22csm44964358f8f.19.2026.05.19.06.53.47
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/3] mmc: renesas_sdhi: Add OF entry for RZ/G2H SoC
Date: Tue, 19 May 2026 14:53:40 +0100
Message-ID: <20260519135342.623943-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260519135342.623943-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260519135342.623943-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32812-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[sang-engineering.com,kernel.org,glider.be,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 8D326580266
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/G2H (R8A774E1) SoC was previously handled via the generic
"renesas,rcar-gen3-sdhi" fallback compatible string. However, because
the SDHI IP on RZ/G2H is identical with the R-Car H3-N (R8A77951), it
requires the specific quirks and configuration defined in
`of_r8a7795_compatible` rather than the generic Gen3 data.

Add the explicit "renesas,sdhi-r8a774e1" match entry to map it correctly.
Note that the DT binding file renesas,sdhi.yaml does not need an update
as the entry for this SoC is already present.

Fixes: 31941342888d ("arm64: dts: renesas: r8a774e1: Add SDHI nodes")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Dropped adding entry in the quirk list instead added entry
  in the OF match table to map the SoCs to the existing quirks.
- Updated commit messages to reflect the above change.
---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index b716a518f265..1d3cd4c3da1f 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -279,6 +279,7 @@ static const struct renesas_sdhi_of_data_with_quirks of_rza2_compatible = {
 static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
 	{ .compatible = "renesas,sdhi-r7s9210", .data = &of_rza2_compatible, },
 	{ .compatible = "renesas,sdhi-mmc-r8a77470", .data = &of_rcar_gen3_compatible, },
+	{ .compatible = "renesas,sdhi-r8a774e1", .data = &of_r8a7795_compatible, },
 	{ .compatible = "renesas,sdhi-r8a7795", .data = &of_r8a7795_compatible, },
 	{ .compatible = "renesas,sdhi-r8a77961", .data = &of_r8a77961_compatible, },
 	{ .compatible = "renesas,sdhi-r8a77965", .data = &of_r8a77965_compatible, },
-- 
2.54.0


