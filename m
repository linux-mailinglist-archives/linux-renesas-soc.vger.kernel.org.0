Return-Path: <linux-renesas-soc+bounces-32064-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHDqDWfT+Wk1EgMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32064-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 13:24:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFFD4CC8AA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 13:24:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 678143006B4E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 11:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E561C38A726;
	Tue,  5 May 2026 11:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mwHI6KAw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D810D38655D
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 11:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777980254; cv=none; b=cpaDVwCO84oI0/een0Px+wUu4Anb4KbNRn1kHlp3OEWs/kjsInvXwImZR0ndgR4oR6gwa1q1s0oP3noGYr1xVQZ6+FmnGJa/C5tUZrPe1iVfeD4aAOcTcqUlmWMw4P2XPO4iAVoxvu9jsP5qETEa7cJomlAlVlkxLCIyDj2zbio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777980254; c=relaxed/simple;
	bh=wlOUMAr04Y0D3+DvEw5/WiNQrz8mKbWoLCQpnqCgMAI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F2kpxDGGY9i5QyH7eJZ5qw92aekfUGOOrJxCe2h8WokkIPI1a9ZMzTPB7lHecM7m/jDT2NPYh4Pswsoi1PpticZiY2v+xpLGS2HJLTwZPsFd3MvrDZ5P6JXDWdZWRzP00rOIhXxhMWA9Aq1VaD4scc0kB1RaP9aqfokCeCXbLHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mwHI6KAw; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso41826495e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 04:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777980251; x=1778585051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LcSpXr1Lc9I+nk5j4oXPdbeYrk4B6zy+S8hJA3qHTEg=;
        b=mwHI6KAwu9GHaB0XUCKKpUnlOMkzOxggaHJgeo24Unh6CIycCVq+v1e3FsibeUb4R6
         8w/AJfusBjQSYQYTXnrmJO3x8z8DQmtwz/ER/9/7EPj3tiGAsZJ5K6kskVGyDQ66QWbk
         uzc7HZT72bVxkNYgKk2HPi51E0bUvpB0kLVWvShJ8j+yYpyI6BS/Xv5sEUfpTQgsaa6u
         S8Z7Lr3f1KhPGjlCsOmKz6S+Ljub7Xhl+kkAnN/QHe4kjIAgCQvz9cKn1opA+fbROOrD
         kKSJH5rjSAgAMSmez/dnK3EyQabQ/RIpvSiUBlkoez25/JNGAIVEHTGYaZJ2CyI4soAy
         0TwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777980251; x=1778585051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcSpXr1Lc9I+nk5j4oXPdbeYrk4B6zy+S8hJA3qHTEg=;
        b=TjIIrm9UXL3egT3oaE273I4Oa6xiaxGLtRwO/SAdLyhmNBmRAcMNeqwUpQlSIWF0j8
         k0UklQLzcrmTXibm26U/7qWtDYvIId/nf2IyF/azfbV4JyszJ30r8StiuIeSCYDw8Jnm
         uxuLl84TBJkYc7E//NZN+T6FTYzPNDTzSdvyBsDV4mr+WLVa+rOpAsFj6J+uRd5LhcMp
         ZULTK9Phfyz8nqOs1NtDNGybSj0Io1RYV+z5GPb0Dqd+BsaFof/UMCpobHiMH3NGo3/x
         p6Aq6VzJ5h3VpSttIdtetgsZHySTKuTrEP9Ciaz8uRiGeo0wMkcXq4lULX/Q21TEEhd5
         waYA==
X-Forwarded-Encrypted: i=1; AFNElJ+CIm1lpUwvPqQmy7n9QGx6EWcsbmgJuQgURk/4jMqxVX6Rt/Pp2FZvDb//xpbFZwC0l5JMJ/paqtqmHN/jwYRUIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXYBrYTBdS6EEpqCln6YozcKFQcqTCqGAa/5bN1wVNL5a3GHuR
	BQZb+nfUCpPH8NheLl2w+hIU3Uu8GRO8TVxNUyQAuDOTCye6LZgNBFZaM4NxE7vT7AU=
X-Gm-Gg: AeBDiev1als3x5UU8hnZeu3+YGyW1JJiiaVYJ4pjgpoCE4HbYv3aRpL4/Jzvc8vGrMS
	d0UOzgOnGCtQpFqmFr9lP02a/rRmgTXpSzBiJ4qPoID/8+EGUoLY30OyU8ucE27GF7OJnBMfxYS
	05Nm8NU52g4GmayoUQ6Ty4u0ty2owYHXu4kikTAw9UP1xG3tpb9TPEhtCCcC27JfRNYCb/jcWce
	Gj6Vq7umZdr7nG0N/JBt/AF1h2l9+Ar2GwjB2L9jrfL8muxsMD6rHP6uWgrSxQ3m0qcLe/71tK9
	TcEORSz/3yt6nOd+4jT9TG+AnQyKQxRGo/9ep2ORN5enVVLpXA4KSXjDxGHuutMqkJ7jV/Sujx/
	I5rwTGS6YdfpIzTLp7XMEzzTG7hiONw/hdPzHIcp613WDrqvhRHtycCHcxbUt/ytddtTwg/rcap
	qL7l8rusz3hjSKf+RshFPGrEiuRbQQixfL0xqOozWu1P1vslJf/uZGlzAtOx+unbvAtcH8mHeRs
	9f68m7LGKzhSgNMo3GPt9ItNFJ9fPtC2wFwmy9Q91dGlRQdYScdLK2nZQ==
X-Received: by 2002:a05:600c:c0c5:b0:488:a977:8de with SMTP id 5b1f17b1804b1-48a9865e95bmr185083715e9.16.1777980251078;
        Tue, 05 May 2026 04:24:11 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:7d2a:9b5b:a191:3b81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eba8487sm339946455e9.11.2026.05.05.04.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 04:24:10 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 0/2] Add xSPI support for RZ/T2H and RZ/N2H SoCs
Date: Tue,  5 May 2026 12:24:03 +0100
Message-ID: <20260505112405.667796-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1CFFD4CC8AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32064-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,sang-engineering.com,bp.renesas.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,renesas.com,bp.renesas.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:mid]

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

Add support for the xSPI (Extended SPI) Interface on Renesas RZ/T2H and
RZ/N2H SoCs. The xSPI IP on these SoCs is identical to that found on the
RZ/G3E SoC.

v2->v3:
- Used RZ/G3E comptiable as a fallback compatible for
  RZ/T2H and RZ/N2H SoCs since the xSPI IP is identical.
- Updated commit message to reflect that the xSPI IP is
 identical between RZ/G3E, RZ/T2H, and RZ/N2H SoCs.
- Dropped RB tag from Rob for patch#1.
- Dropped driver changes for RZ/T2H and RZ/N2H SoCs since
  the xSPI IP is compatible to RZ/G3E.

v1->v2:
- Add RB tag from Rob for the dt-bindings patch.
- Add RB tag from Wolfram for the rpc-if duplicate device name patch.
- Added xspi_info_r9a09g077 for RZ/T2H with type XSPI_RZ_T2H instead
  of reusing xspi_info_r9a09g047 with type XSPI_RZ_G3E, to allow for
  better differentiation in the future if needed.

v2: https://lore.kernel.org/all/20260327174245.3947213-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
v1: https://lore.kernel.org/all/20260310212927.3372410-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Note, patches apply on to of next-20260326

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: memory: renesas,rzg3e-xspi: Add RZ/T2H and RZ/N2H support
  memory: renesas-rpc-if: Fix duplicate device name on multi-instance
    platforms

 .../renesas,rzg3e-xspi.yaml                   | 56 +++++++++++++++----
 drivers/memory/renesas-rpc-if.c               |  2 +-
 2 files changed, 47 insertions(+), 11 deletions(-)

-- 
2.54.0


