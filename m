Return-Path: <linux-renesas-soc+bounces-32642-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPpeOvM8BmqmggIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32642-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 23:21:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5864254700D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 23:21:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1436B3055403
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 21:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA9103CC7C6;
	Thu, 14 May 2026 21:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eb5PJTr2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AA23B38A1
	for <linux-renesas-soc@vger.kernel.org>; Thu, 14 May 2026 21:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778793632; cv=none; b=HlGmYMwX7M7JGjvbzOKZcZN5qSvj394WTKKm2At45lI1tBFUqqOBn1ikcyiWzYuYwBiPv63UXm8jbmegkz+psYV5vV+ev7HRsNUEDspSGoaV0nedJRuG3YPsuCYiTUSN1fIe+Cv54mXSgxCTzy2ZQWcJxoiLsHT29X93aTquwVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778793632; c=relaxed/simple;
	bh=GQ8KFtIPt1cBh3YWlA+1MNGvUA29zra7wGm26s9hJeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NHC3rvfEEnyyuWzeLfrefihtYxy8JVdlGxrL6EODVeGcrrZsoVai9kM0lX+3Zg+Td6akDmbMxZa5ZeO/aRgfQyEOZkEXbvF8SJYZLHYW9SB3vOiLC8GKP/KKPUiOnKoBfi0I0Js5GAVcgmfD53hX1x5g2zK1YwJsIWEkoHFzSw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eb5PJTr2; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so1490365e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 May 2026 14:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778793629; x=1779398429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fE/j4rv7wciqnS+bDA3iYPyjHebH0y7y55zTma9ff+Q=;
        b=Eb5PJTr2uzr6RSY8x/jFYliqNs4QfkN1pG0Zj5LzYtsusLgF1eMZPGQo67o/alJLSX
         VuZioO3pYZHy27WpKJ5Tw4bqjOXHm9iAIQPblbJyNqwex8TW2aZcHYg12uChIeVcUkXN
         gdH1dlaPNju2Gz3yc6M9HdYxe2XFyOjLS7iq9fj1sxffHUNtibPl9BAF8wdYeYnLWUDG
         vprt0tkR0DchrxrL+WBp7WAIRl/XzeW73yY5X4fDDn8VTvNb3Rv3KdHNuSKjwENmLvMX
         Mnt/F4zQbLYJtwEZpke7PMxlEoCWE78NsfT/D3X2kXejus2NIYIGcXD4RcdccX0iayae
         olQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778793629; x=1779398429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fE/j4rv7wciqnS+bDA3iYPyjHebH0y7y55zTma9ff+Q=;
        b=NCgqJ2a/FIjLHdUn0Q7TvMx29aLu3zwWI0t4iWbxSZqUOV42U3X7S3L0ahR9PkSdqk
         5t10Yz8ZH0cqPVxogJvo2S9LngjHMU9G7zZJig6e9Wy8Ps6/lRcfhQz5D3eUIDwB+pJu
         jYwAnyYEfSt6gAC9EmnIrOzMG9Hu20ohAPq04fp4I4/dXOFrThC+/qEBiFk+RNHUU/aV
         CYPaWpFEAgElJ7ZfnAUvhAq3vyodleyflM+ifNeJxusNzIdLq1zygf2pPxUOMuJmfbT8
         swpcuq+HR7g42NOhI6YwMHPB3757rIaftIpasU68aCzIRd2Mv+BPm/TB8Iw6zVFKLiie
         JXdQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ouicy7i1Kbyfc1uFfodZdOtrc2iUPGCj70S/UHShqFrIE/cT/o3o7xbzfjvhchU9UpKKupN6aVrtl95ygeyCPCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFkBHjiYkQAmVAsIonIx6yER+bZ0sGGKXYfg1m7IZq1jAPU9kW
	mtSLCrs328U8mOSdd4YcN7IaxiFRBiR2yZdVubyVVNOujLVGsIx6AkPs
X-Gm-Gg: Acq92OEa9ykmE6hIzyOOxI0WBDHH2TU/2z+fCsmwiPld0LcXOabLczMrHx2Eqv2W9lh
	tXnApjyd1DteBvOoH2DNQlfUSfYByWxrWgv9nHKyHiIFqFt/CbdgIPJlDPgLJdHW6QknVwgQ1d3
	h0fzEfn/58tW/9KYpd9QXZnUIpVFQI+sCMhWNb2X3AUgCUAuKWjFB+VBH1mK5jRU7+na4iYTuQN
	yin9hfw43nj5e0FRdCidqSzUH2jJHZdI6ec3tw4kbOnxLtnxamZ953WVXdmWZrSPmVtEVj9rwC+
	rgzU2Nbv/Wipb1ThUBIg3T41FXt/8yf71rltTuD7D7RIng/X+hCYrlKN54xh0c5c1M0QaGNq3hw
	vT1OQ+3KYPmAzaVt+cUGIhOygZMSqEw6NrHv+uOakrMWOZyga1+osMYUPkBzoIAVYa96TAXE7Lj
	tE1D+Lci9BS4MoGKpJaAXvVd6a+WP/NoFQJ4yZl8e8b6CxSbi1axfYPwvn4FZoglKmdxYl56LAO
	Be1WgioBmRFK1XB+ECFXFRZCaLn4AzesgMN7Q==
X-Received: by 2002:a05:600c:6d83:b0:486:fcc7:6811 with SMTP id 5b1f17b1804b1-48fd635966cmr61352925e9.10.1778793628752;
        Thu, 14 May 2026 14:20:28 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:4d56:d792:6583:2fd5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe13a7sm10216038f8f.29.2026.05.14.14.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 14:20:28 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/3] mmc: renesas_sdhi: Add SDHI quirk for RZ/G2N
Date: Thu, 14 May 2026 22:20:23 +0100
Message-ID: <20260514212024.1624517-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260514212024.1624517-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260514212024.1624517-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5864254700D
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-32642-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/G2N (r8a774b1) is identical to R-Car M3-N (r8a77965), so apply
the same sdhi_quirks_r8a77965 quirk across all revisions, as is already
done for R-Car M3-N.

Fixes: c9af138c42f0 ("mmc: renesas_sdhi_internal_dmac: Add r8a774b1 support")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index e5aae7fce1cb..b915e2e11d04 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -224,6 +224,7 @@ static const struct renesas_sdhi_quirks sdhi_quirks_rzg2l = {
  */
 static const struct soc_device_attribute sdhi_quirks_match[]  = {
 	{ .soc_id = "r8a774a1", .revision = "ES1.[012]", .data = &sdhi_quirks_4tap_nohs400 },
+	{ .soc_id = "r8a774b1", .data = &sdhi_quirks_r8a77965 },
 	{ .soc_id = "r8a774e1", .data = &sdhi_quirks_bad_taps2367 },
 	{ .soc_id = "r8a7795", .revision = "ES2.0", .data = &sdhi_quirks_4tap },
 	{ .soc_id = "r8a7796", .revision = "ES1.0", .data = &sdhi_quirks_4tap_nohs400_one_rx },
-- 
2.54.0


