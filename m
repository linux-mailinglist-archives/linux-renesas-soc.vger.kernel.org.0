Return-Path: <linux-renesas-soc+bounces-31108-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFyJCVOv2GnfgwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31108-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 10:05:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C49C3D3BEE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 10:05:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1D062300BE88
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 08:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 171D737BE62;
	Fri, 10 Apr 2026 08:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xj7/X88w"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD5132FA18
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Apr 2026 08:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775808334; cv=none; b=jTj6ZfDQ80beA3pcH2M8LlQsoQWcMskBvLeJSWicJ76KEuQC0DNvrPDND+pe388nISDBIkTkwq7DLWtqoZFsBIhS1ggGgT4MPSQNrqqK8CtCi1Dbzh+URXOxbItLSpFDmGhmB9mtU0OyrQ8L8FALT+sdZDolXAEpK00nvq5ysRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775808334; c=relaxed/simple;
	bh=vi12rUe+JRZ31B2xxgnufJ0xVUiwiUZRMYqpk7tNGWY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J1Arkx1SO/vU8f5aJeVylzUADm5wIguKFP6GtBKOdQ9FLZYRpbhX+FhO6GVMAa/fk4DhFWayMZgmPMGwQ/aLVzfcn4bkXbO37FGxY83U2tqXLpUEI1peYT6Oatw4vtIy3etEoPCc0XQZFeyKqup/CsOqgC4DnpTY1iJu+p8LK50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xj7/X88w; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so26578395e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Apr 2026 01:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775808331; x=1776413131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=em0YanQPPRlOBJZmjOVtclWSTynM2Xp9mKdluzb0Kj0=;
        b=Xj7/X88whNTvImg8ckdRXAAOgurGMLj34fnYREz2LCLUB/MzX3XtmlP1umns4T137K
         kG6bf5aJPyLp1ABEchvBub3+hZHgjmoitN6yLggwnadql3Vk+27HnUlBgcHyYZ0P90+O
         ODiHc2YLWjpVELT/glrM9NVyXo5fTZcJ3n8/gd6UCpjECHRWnOVIUlTI/6JZd2DD6clr
         JKGiW+TwT/7BLFyJip63xyz4HQLnxuGhrMoVMEJzlnaBjGimUEWr1l9c43BlUcQF74RR
         yKiiSTmRLjv8iL1oqwRA25lgDThtXR9SNDo6n8I44ODlO9AYLMk0znNvtq6xNns7yy3J
         SSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775808331; x=1776413131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=em0YanQPPRlOBJZmjOVtclWSTynM2Xp9mKdluzb0Kj0=;
        b=mJq2fqcA2rMYvFYSvP7t1EK/TfmAvGCfn3t0BmdUPGWpKpUJEXiAqXm51luR2Xepvc
         c7SJ3WdN+/ZnNQpMYdIRsQuXl0oZAfi+1oWEzVQcTXYajnQI/9slWy3ees5GRSp9eZtU
         DSuTitbCUI9CaR7BdsBl/nvKbwgQkjKVT5nEoU1QHhUk2puZfPfj4PsHZRmHjN6Ycqfd
         /Sxdct3/7OdrsD7zMa8oF0R27AZaPERMRY0dnzg2enCsli4hiMLtzO3rlGirzieaX0T8
         sGJYGDfCbh9/yI+3q8SZfKlxi9SlK4D1XtRVGEANUDn20dGOSsFv96HKJWWrSrhUQtWW
         xLTA==
X-Forwarded-Encrypted: i=1; AJvYcCX+qiFNqTHKYzDU4UprGkMObW2WrgkT9HxpoCrI6OHhi+6Q8ue7gAJ5zj0LwyMkY/5aOpeB4G+QpLs4z7Shmq3Wdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBMfjucI6Ot9cjNQANOjoiNUPL7GT843JJncU6VqgHR30+r9R+
	1tlM+bGHJJ897eCVmk7V9Y2O1x8+b+AOFldQ+OE/AwWAnmE72UTNT+Cb
X-Gm-Gg: AeBDieuZ8zpnpM9ehqjiwhbit5EF6jinaZ0tWh10oYO7SyCiGR3iyfcpQ+zfuHgRc9h
	6o3IWxb1qmDvvqpWk5OXZs5giFJq+0xrAFLswk1V+xqwQ18leZwb5eKVuJGPocN7A8fIzzsz/tm
	7Qv1z3XLcqPzEi8rFQCvIw8kl1j79rk6GD7TYnoLDze/366294ECn23uqOzx2kv9Aj/tLmMGOeQ
	wxs3JngQnj29Sqz0OmWMAhhnFmlU3SgaC73zO0Ls2xC7AucYpSFYqTAksQZMXx6XrCXA3HVCzIT
	OM0fKTib9wGKRk6gQux5TiMkDNPof+OSV4ZGOBnyO/o4pC+9veDwZMcN1W7CuDUIRnBgIfmq5Ej
	lcAq1gfhY3lF2yxR2/YQg90xJWpsptiFzq3rKX6zqMpcy+2FLSKOcHldFG0tdaZ/iUd8EDSCXja
	fCmOLwH/YlXpufdtmTQDDqBRU5rMXUWXGkimFySY2wvWLBiYm5iIQpEm8hSWuB707LyPH/a+oIP
	7eCw7eRjiKwJIIwlMgPjzQZq+MIiV/OKo5QCg==
X-Received: by 2002:a05:600c:8594:b0:485:46fd:7887 with SMTP id 5b1f17b1804b1-488d67f9a73mr16538045e9.13.1775808330989;
        Fri, 10 Apr 2026 01:05:30 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:a73b:688a:4297:c5fd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67ce3e4sm29950375e9.5.2026.04.10.01.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 01:05:30 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-spi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/3] spi: rzv2h-rspi: Fix max_speed_hz and clock configuration issues
Date: Fri, 10 Apr 2026 09:05:14 +0100
Message-ID: <20260410080517.2405700-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31108-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 1C49C3D3BEE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series addresses three issues in the RZV2H RSPI driver:
1. The max_speed_hz field was advertising a prohibited bit rate, which
   could lead to incorrect behavior when userspace applications attempt
   to set the SPI clock speed.
2. The clock configuration logic allowed for an invalid combination of
   SPR=0 and BRDV=0, which is not supported by the hardware.
3. Simplified  the clock rate search function as min/max speed parameters
   are not needed.

Note, patches apply on top of next-20260409.

Cheers,
Prabhakar

Lad Prabhakar (3):
  spi: rzv2h-rspi: Fix max_speed_hz advertising prohibited bit rate
  spi: rzv2h-rspi: Fix invalid SPR=0/BRDV=0 clock configuration
  spi: rzv2h-rspi: Simplify clock rate search function signatures

 drivers/spi/spi-rzv2h-rspi.c | 52 +++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 27 deletions(-)

-- 
2.53.0


