Return-Path: <linux-renesas-soc+bounces-32813-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAVzIHxrDGo8hQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32813-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 15:54:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5705800FC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 15:54:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CAB54303BC29
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 13:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27AA83ED3D4;
	Tue, 19 May 2026 13:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lE+0/lPq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901A83ED3AF
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 13:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779198833; cv=none; b=dy0FCRWihhvbbK5qPVrv46q1RDI41oXgJH7ingLXfHF9QBvM1XNZUcvE6kDF05/AM7z1cYdtjyRjJW80wDkVbv3MTVBKACcP4WdPDgRvqkFsnlpjPiTnLkCZwOjHRdeP8toKcLktsc9h4khrGhk8yn82+q5DLG0nA1KYcCWVFWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779198833; c=relaxed/simple;
	bh=xJpuMTaDbA9LXDWF/oGtQaPWOiaWcrGe4Ff+XI4HlSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JFlvxznxVFFBFJmjsxHZtLSE3p38CmwrNTcnbKybRmjl2Opxa4rW3g4Pa8hIpOxCNmFVqI62snk/eH/6gzY20pd+jnibwpGS5ApIP3GWYhivOD0Q4ZdiqHz8TlR9lKLXAPAoLYWJzOz+sWw0px0py5Bwxx5egfYiBzmsbPHzAhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lE+0/lPq; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488ad135063so28528375e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 06:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779198829; x=1779803629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HR2OQSk/qx2maEw4uKeRFFzQuuuI1K0XxJerSkSW2y8=;
        b=lE+0/lPq4wwxNIBa9n7+qr09kOyvxuT/22NnGA5JKd8Qy6kXqMjWi4ADhN9xc8+aar
         fzM6SuOND/5+ffoAF6oP1Kr6dSdFOtNYb3ty3yExJUecHZlMRBRyOdwTwTQGbjtE6tG/
         xSRJT168nHCnnuyqypX0XcoLBbaY8JNKS/VmjeYZacT6+SCbU2wfE9b+4N5enVMDounD
         d6PAdqElV6jWvAlflmR1WGQu+H31ypWw5WFdCH8RdA1aFrRMbjr1mvUlIA3bNLKliQtZ
         O3jFV8gZRu2guM62lL5z1xOyCn3hVA6/65wH1ZB7qAen0heS8/Ohgf2wKM1luxisdOn4
         nQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779198829; x=1779803629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HR2OQSk/qx2maEw4uKeRFFzQuuuI1K0XxJerSkSW2y8=;
        b=WOKjfxaWQUu60aJMEVxycI4pesWfFjVucHSf/ORV/cRQf060ZrtO02CYz1iSWfmFp6
         vJI74d5Zzthy0rais8zxn1LOP5lGjc3T7be8tUhmT3QHFOwPN++rRqX5OEMiXXSWmoul
         YbFKfQkdouWRjjgkQZpm+Fkz1tOj0SHIWu2nPmmqOYU2eS/B15t9spb+w8EZPIl2nn0z
         hTYgeXscqgVT2mf19INI9MgFtpn6CvCECVyjYCwpUFvb+IkbKX56QE5vz5pRj0x4gPgB
         favtk4SqVbDg1OgrTZhEhPv5qgnGDOeC4CtmmNsUn3FbKv9bKQa1sB1vt1P7lWV+W4oh
         LwTQ==
X-Forwarded-Encrypted: i=1; AFNElJ/3kqFZJwXz595sqMLTDSz3GS6WALQxqVNCVg9z2ChHdE7Otxkb3luLDIcm1udtA1AXpxm/7blOJEP9Ksrd341VkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGIYmZ0xf88tP+UuvKjULhRIjrOJaepO/92DHcaadk8MR8/LgP
	E7k9EeINlFf8cPPzqmjGxLa+CvKuECn9uqV1WdfzZJWEy9GW9T2jIEgC
X-Gm-Gg: Acq92OEgmo14O54aSSrwbFSFQ1XuoyNYZj40o9aWprewIWa67FcQhVE0jxCQQoDU+KP
	6I1jjLoHf2gmKVCSdocBuVMHE3kFjHZGTjJM7AqzLsJpC3G7wLnntTxpZ7ygAPkdSl7/enOeOmP
	ZtoFceU88HlXMaGyrDuUzN7tIG7lAnEEJXfWw2ROlDEgyZChhp9vaLaZJ4Q1nIaMufnPQk2FbZc
	zszAtgp2aTDl/nBsXuGVlRK56yTqEPBr2H4t7gPP5mZb0C9zv9BSc3txpMdakaao933Upnj8KI2
	M6pp+/QOXbjHziC5aPyygLxR1nCftpdJF+9WSIquA4u0OAekMFg7DXfiTi+DYklmhTa7Z4awAbQ
	iZqTusC4UhT7BcNxNWwmk7rLC8lqu9kSsRdke3hCQUV4nVEGGNW+90+fuTUOcJ6219jOznZZEoe
	/Oj3NkQCS8tegS5etIbbztxyw7qYDE60UvDpRMXaHZcEfeXIxvh4wI5SDDw9jgWk8OwGrdQjujS
	Xo2XpuHucBRuYQUR3kM99nZuKSV+/rnLFXCl/YqC9tPTawqXHCgGr3zu8A=
X-Received: by 2002:a05:600c:c10c:b0:48d:35e:84a0 with SMTP id 5b1f17b1804b1-48fe651cc11mr221487455e9.28.1779198828695;
        Tue, 19 May 2026 06:53:48 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3f5e:825d:a98f:fd29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1a22csm44964358f8f.19.2026.05.19.06.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:53:48 -0700 (PDT)
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
Subject: [PATCH v2 2/3] mmc: renesas_sdhi: Add OF entry for RZ/G2N SoC
Date: Tue, 19 May 2026 14:53:41 +0100
Message-ID: <20260519135342.623943-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-32813-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[sang-engineering.com,kernel.org,glider.be,gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 3E5705800FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/G2N (R8A774B1) SoC was previously handled via the generic
"renesas,rcar-gen3-sdhi" fallback compatible string. However, because
the SDHI IP on RZ/G2N is identical with the R-Car M3-N (R8A77965), it
requires the specific quirks and configuration defined in
`of_r8a77965_compatible` rather than the generic Gen3 data.

Add the explicit "renesas,sdhi-r8a774b1" match entry to map it correctly.
Note that the DT binding file renesas,sdhi.yaml does not need an update
as the entry for this SoC is already present.

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
index 1d3cd4c3da1f..93470aea21df 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -279,6 +279,7 @@ static const struct renesas_sdhi_of_data_with_quirks of_rza2_compatible = {
 static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
 	{ .compatible = "renesas,sdhi-r7s9210", .data = &of_rza2_compatible, },
 	{ .compatible = "renesas,sdhi-mmc-r8a77470", .data = &of_rcar_gen3_compatible, },
+	{ .compatible = "renesas,sdhi-r8a774b1", .data = &of_r8a77965_compatible, },
 	{ .compatible = "renesas,sdhi-r8a774e1", .data = &of_r8a7795_compatible, },
 	{ .compatible = "renesas,sdhi-r8a7795", .data = &of_r8a7795_compatible, },
 	{ .compatible = "renesas,sdhi-r8a77961", .data = &of_r8a77961_compatible, },
-- 
2.54.0


