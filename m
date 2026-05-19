Return-Path: <linux-renesas-soc+bounces-32814-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kP83OCZtDGpKhgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32814-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 16:01:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B2B5802C8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 16:01:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CC2E30F3B33
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 13:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F7B03F1AC5;
	Tue, 19 May 2026 13:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q5WoMklK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C10A3ED3BA
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 13:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779198833; cv=none; b=OYjMalIVC4jbbi659dk4I+glO51cOE7wC89XUzaUK/d0pjGBAZLJ2Bf9SnXYNhbxs2xBKieP1CWiXW88JYBS0Yfwk2h9jOMeMO0pBIns5RyO2rTb4KLqgAbe5gbU345DZK4Utgh8kc4rrJ9waQDpyb3WI9XXp5QmLGAdif6j7sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779198833; c=relaxed/simple;
	bh=+N/cTOh9PaLsivS583WGbxA3pgcSpJLIPQde1c/4q+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EtlSt6pUmxM+jJmylvpizTpKj47xfBhlTCTxFxjD3bSa99Ylb06BTrcAqE4RAEOInLEqWu+BD0I4cOQPFdBiQQAL5xhDpVkte3pIuhdKb1UqZ/Dwea1q4kX166Ho2TAtdgCorGn4IFSnmTeVBzg3TUZbZj3mf1hJzPTwtA/13jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q5WoMklK; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-44a5174670eso2021954f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 06:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779198829; x=1779803629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VHzAkzrfCiVchyzTJLUD/adMJOXHeiF4YfLqfQ5QQIQ=;
        b=q5WoMklKSBGv8RLK7KCrUg3SFwmjxdFOXFXEtcgT/iX7J3oigcgwfJMASOF8y8HZ+0
         2d2FBfJZfk/g5VTHDuwRyNxkx2M6WQtg38tnajmo3DsPeAn1T9EdsD0AFDzq9cFLTS7k
         n1Gsn43WYC2sy3G++xDiNl2gwMGMDVh8Knm8mrRgPjrHJmJVB+8VyYAgGjw0hCcMuNcF
         EYujheMA/dzGvD5mlAfHJoIwm2Jij0QcIpF1SNmOp93PHCuv7/GIJ5nX5U2vgcgW1O+P
         U+EGMyOYizImhzAdJRCAhElPrE/Mb05wu0o6kGwb+hHU6B4mbIaVBM5LCCjKGRDYtcec
         7G4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779198829; x=1779803629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VHzAkzrfCiVchyzTJLUD/adMJOXHeiF4YfLqfQ5QQIQ=;
        b=St38axPBemEUaUO5ANvm9XPeIFwiURhatLH3Qafh/kGQdUc1zdsRwf8GNxdJV+XZma
         fslfw31wUq3FtSv451O6lAjFiLp1QLo+oSyvMPzsXnOCX08/cCSfoGwWtALM81ShYF/1
         74bmXnqh1hbPNaXh9BS/qsXAwawLZaAo87+Bv96ddh8t4aTfGld8BCXPL8fkgzvCG7Wa
         MtKF0WfPllKpilYjrfiOB496MTPq5YLNnXRQcVRT+i0DOeRf8xxmGfKYcsEYhIKXIvqZ
         d5g7hpfly5VkyX0gen01Ps+P9ObkWlOanleghXCtatFGgYHXygWZ1rgOr1GiGE5YKqWe
         y0yg==
X-Forwarded-Encrypted: i=1; AFNElJ+HAVmtlsTpVzkXVa5+2zCytvghDRY8Q2Xq5yBGXo/qta2+8Mi6MtsYYF7vnJs5JEV/sRRbrnc4kpYiQsKb6hxv8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxlCBILdJdL9Ma9n5kwB8a7AyTcX7dW+EosO8BV/nrFjfOvkyi
	00Okbwb7P5fTPXcczBO6Ru6xtiAh5BYbyGNpbD2xw6xRmVv3CiySdTPX
X-Gm-Gg: Acq92OHOiawhs+hwbeOtTjo3bmu5OzAv/9RQVAJBkkUtvVkPx2tW2rRmibHSMapM9qU
	Rw/guseIKA6SzG/KM4Yh56bmvS7e5J7GLQ6Mci5iKA+LpjEUvgyY5SAMNcNYaveiBnEXpQ9c0BG
	CBebBNzdIPkJMD/cpyYgK6adtAN1uGQi2ohkn+68FaNiKV3fB65JmhBhIhYfVGcRGLxknL7zWq5
	DqDPXFGU5ZYusL59Xy9VMZDC7Wue2BBfEJlZBrnUiJcbwytPeE7+a2FQsWlGBYYZNfgIALjzxMe
	tSAdTXQ/0klUjgZqwrAAkzaEZo8+whXpxRhreykNff5Gret6zJifcfPf87zyblqxntSXbgg5mqo
	GAVq2Ff2RDZN865uHr7lXJsluC5hXCuZ8hbQsw8+jyMiI8M4kY5vxXt4JdHR2+1LzirSep36On2
	VI0tmEh6jQ1+mM0DYGXpKkyLD0j5yf2njz2PniYRXcl7r/PKKeavP8kzGTsyzcy6OinBWuLKOsQ
	PlXW+QY7he47mtgn12QpVwOD7P3OVWWq3KbANgn8rxPUmZy
X-Received: by 2002:a05:6000:4210:b0:43b:4f86:e985 with SMTP id ffacd0b85a97d-45e5c5dd47amr30667307f8f.33.1779198829241;
        Tue, 19 May 2026 06:53:49 -0700 (PDT)
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
Subject: [PATCH v2 3/3] mmc: renesas_sdhi: Add OF entry for RZ/G2E SoC
Date: Tue, 19 May 2026 14:53:42 +0100
Message-ID: <20260519135342.623943-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	TAGGED_FROM(0.00)[bounces-32814-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[sang-engineering.com,kernel.org,glider.be,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	RSPAMD_EMAILBL_FAIL(0.00)[prabhakar.mahadev-lad.rj.bp.renesas.com:query timed out];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Queue-Id: 94B2B5802C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/G2E (R8A774C0) SoC was previously handled via the generic
"renesas,rcar-gen3-sdhi" fallback compatible string. However, because
the SDHI IP on RZ/G2E is identical with the R-Car E3 (R8A77990), it
requires the specific quirks and configuration defined in
`of_r8a77990_compatible` rather than the generic Gen3 data.

Add the explicit "renesas,sdhi-r8a774c0" match entry to map it correctly.
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
index 93470aea21df..024edc4e5fe6 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -280,6 +280,7 @@ static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
 	{ .compatible = "renesas,sdhi-r7s9210", .data = &of_rza2_compatible, },
 	{ .compatible = "renesas,sdhi-mmc-r8a77470", .data = &of_rcar_gen3_compatible, },
 	{ .compatible = "renesas,sdhi-r8a774b1", .data = &of_r8a77965_compatible, },
+	{ .compatible = "renesas,sdhi-r8a774c0", .data = &of_r8a77990_compatible, },
 	{ .compatible = "renesas,sdhi-r8a774e1", .data = &of_r8a7795_compatible, },
 	{ .compatible = "renesas,sdhi-r8a7795", .data = &of_r8a7795_compatible, },
 	{ .compatible = "renesas,sdhi-r8a77961", .data = &of_r8a77961_compatible, },
-- 
2.54.0


