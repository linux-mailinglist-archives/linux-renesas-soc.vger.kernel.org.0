Return-Path: <linux-renesas-soc+bounces-31693-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALAMBxWH8GnuUQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31693-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 12:08:21 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9EC4823FA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 12:08:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8BF20306747D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 09:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D51A13BBA1D;
	Tue, 28 Apr 2026 09:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IHdyNAeY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1533A8748
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 09:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368716; cv=none; b=kufyW+M6fiMvAkxtQiurejT6TAZio8ncD770c/02ORR3PsykN0mPIgCapHG02tvljhlQNWjIhbYnLGfOBBRub7TbtYBj81WuDF2U3OxY0T9m9aXgl42ZAAZj56HZBFRKAYLRraYlbTm1HZzXMiMqdasf2V1gxt8eH2ZKCwMiEls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368716; c=relaxed/simple;
	bh=I92Yi+tkT9CMsn6qUnkOf841AL79dYZlftu3M2rJuaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=drQWZH084LncahAhgviBzFy6d7EacwMbH+k/ultroEKmSk4xkl2qLzUJrymXccz53Avv29KGsC7yntZkDvnnpf5jWSrPfLHJJLZaJri0anRoEma9zRdskoEPB9WcWO0KxTp10SoiVs7M+BaD++gDa2pmkXp9W/gFxC64DSJkRKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHdyNAeY; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43d03db7f87so7615229f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 02:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777368713; x=1777973513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=87wpdJkdKpucr71Tqb7S+bFMIF1JvoBzWRG4dGvBKnY=;
        b=IHdyNAeYFYTbsBLfR9uIsKPXmcwPwCg5AKWdhRjA/rlyLbybcRwFMTIIil19wdpE0R
         9NbAFp5UnY5kPReBfgt5/dXQepymeGxgC7r1cq+cESu4OMPpWHnYNhUIRHmrdoOYPbQN
         2Bg53hUvwTRsQ9cPobsRwttuK08ixS3Ft7ZLnbjm4/1ki99sWvfSmbJMRou/624YSPxk
         lF5Rr3WGBZHeVGkSRuehqfDPcRnPRbdkT75H9u8SXXX1wF+3WzshIzsJX5cJBHFbkxcb
         b2eeM1yfg/Mt/VfftG9NuGOknLytDpRXw65dW/s0VgwKn5OhDXORQoAsVecl1mL5nKkE
         tnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777368713; x=1777973513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87wpdJkdKpucr71Tqb7S+bFMIF1JvoBzWRG4dGvBKnY=;
        b=JGeAnFAkjsTFCuCWQvLvNukPLuCPLRnW3he1yg15WofJrQGakBzeSCDztd3y+U/IBB
         UnXaE/G8+biYLEXLPqouDB+GVdlYRIvjBpnVuMjM3nwaibvE9wVCUxs7DyCsZHTOx068
         E8q1HnJv5erRN9NBk/MJIUZW1MKUxE8XrpcXyiiVpgzNwvzqjNntJ+e98YhQ76YIaimK
         kUK5lrWJWja5Ea+96D6gp/M2Jxt2QjaN8OOoCljlyw8JAar4VtL6kSsNDOtiozUqTHpz
         qqRbxgg+QJ94pPCPzP8FBuAP6999E4LuEvKIUpWxREtOSIdRTMOa62FYd1FmaKjEawqZ
         XYKA==
X-Forwarded-Encrypted: i=1; AFNElJ82Iw9qOSgQVPuoT5tnLoV3WEd/0q3VlkZbpRGyoAAp5PdBRqIQ6rKVVl0yJPLISAm/lO7Qy8D8dox+M0zGDMLlOw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3zVGmTnWOHqPDryfooa9aLKgCEj/Ma0gNCxwkEgFaO/hfNekW
	x9AMDSFTd/JjfAOQGORYUa7JFHDECDoq5wcBAIn/7URBFZlwLKt+j+3Y
X-Gm-Gg: AeBDieu/rJ1ZnM3g6lhQxV/2tb8mUW9QNXyS8JOWwt65H5mlErLo2TBuSEhgWur116E
	B+aVuEr9Nu77Gwmt/LjOCd++C1PvApnJuKDUCO2mvcfUCQ53R0F1gVZqVf7rcyoefxjmM+KrNFz
	PVDBvSL7Rmgx+JVVpyfC1pDT03B7lsLzBJWqX7WVnrHXW7dCnS2AE+qCLxpnVSJ+tz6H8y6OGGb
	5ZuYP0a9xgL8cZcYNW7OucPSGjIkS3iacC24+pl9JH2ImV2loKYHzi9WH9X0j/7Lu9rltSsq9Dn
	1lyMxn1I8AJIPgP4bn03xjLDeNJ5zdKRoyUYwTTkENV8IY3sPWg5JWe4VmMdVukr5RtfGqnbgk3
	DBKlbCMWfaPu5dDG8A4Mii4ATaxlqYdIVnQ/jZEnXY1vlhgV0gmiz7r48uHh3CRbdfIKKNv0Rv2
	LInB6rIH6z3Fpj2nR+ChyJhtHyIYdAYT0CZM+ri8kclO7O/gVCFgFeEO1kghXAd0r1MkBhBebMX
	3pm8ac2raO0f/UedrGijge38b44UfF1O0eVB1hDc0oaAutqa7d89GNMl+k=
X-Received: by 2002:a5d:5d11:0:b0:43e:b0f7:9ce9 with SMTP id ffacd0b85a97d-44647dd17c1mr4172953f8f.14.1777368712974;
        Tue, 28 Apr 2026 02:31:52 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8851:8e5e:9c47:30d1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4464004ed80sm5389589f8f.34.2026.04.28.02.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 02:31:52 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 0/2] Fix clk_divider_bestdiv() to get max clk rate supported and add KUnit test suites
Date: Tue, 28 Apr 2026 10:31:44 +0100
Message-ID: <20260428093146.3171672-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1C9EC4823FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31693-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.997];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series includes two patches. The first patch fixes the
clk_divider_bestdiv() function in clk-divider driver to return the
maximum clock rate supported by the divider when the requested rate
is larger than the parent clock rate. The second patch adds some
kunit test suites for clk-divider driver to verify the fix.

v4->v5:
- Made use of KUNIT_DEFINE_ACTION_WRAPPER().
- Added RB tag for patch#1

v3->v4:
- Dropped unregister_fixed_rate/unregister_divider/unregister_mux wrapper
- Added entry in .kunitconfig file
- Fixed reverse christmas tree order in
  clk_divider_bestdiv_ulong_max_returns_max_rate
- Updated MODULE_DESCRIPTION() to be more specific

v2->v3:
- Added Rb tag
- Swapped the order of the patches
- Added the expected value in the fixup patch

v1->v2:
- Updated the patch#1 fixing review comments from Sashiko
- Added a new patch#2 to add some kunit test suites for clk-divider driver

Cheers,
Prabhakar

Lad Prabhakar (2):
  clk: divider: Add KUnit tests for clk_divider_bestdiv() ULONG_MAX
    handling
  clk: divider: Fix clk_divider_bestdiv() returning min rate for large
    rate requests

 drivers/clk/.kunitconfig       |   1 +
 drivers/clk/Kconfig            |   8 ++
 drivers/clk/Makefile           |   1 +
 drivers/clk/clk-divider.c      |  25 ++++--
 drivers/clk/clk-divider_test.c | 153 +++++++++++++++++++++++++++++++++
 5 files changed, 180 insertions(+), 8 deletions(-)
 create mode 100644 drivers/clk/clk-divider_test.c

-- 
2.54.0


