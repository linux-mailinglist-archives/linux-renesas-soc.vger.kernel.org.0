Return-Path: <linux-renesas-soc+bounces-32128-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LLpFOhT+2n+ZQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32128-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 16:44:56 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9266A4DC7D3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 16:44:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8AE973029E4D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 14:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A84F48122F;
	Wed,  6 May 2026 14:29:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F95D480DDE
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 May 2026 14:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778077762; cv=none; b=hEpb3bSbVaAiDj7lGynhXymmyjA9L1OfboGisiNsxGZ68rSshlcyEPzQR2EuDeOqqGhqGT46v1wXXFi+vZb+4wapbYnEtvJo2IR8t2783q8XRK4gZIPMv14v01xdpS8iYxBo9vwha1dRrp5gDfTWaqXerBgJoYdC650c4mbOTyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778077762; c=relaxed/simple;
	bh=xSCqnnA7WW1S8JqkwXiyfL/AUeV8+187ca45KJ5fOts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XwUDpglpBnN5Fwd78EjJzc1L+XOBM1HkOwqFX6hYuePcC7wAOztJKVJexrwy0l2+FPc4U0ixzC+MPzyg7xYY2FVWg4/44vd2eLaC0wWuC1ifWcCrOz5la4GNrJGdJafLGXNp+WhmgQ8iCkYLuyd9oWyyvXCu10bd6eY4IrOc7FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ba60d78aff3so928013766b.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 May 2026 07:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778077759; x=1778682559;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WY7IqF7EZtPFbGXc2uDLUDmZ5A2gxJRq1XnzXcjisJQ=;
        b=hTOEM6asmeHaiHHKr1esUwaCUh/xSXD7h3XUbL43UeqnRCnOK03EAmcBm3HV6SD8f+
         f64QK/126SycKs7Z8QucIvm6/R1sCP7obI2dT7kcg5RVRljFgrmCS+D7muhmwtwIsZCa
         VB17VuW6hyZ2JePSJoPWTLikp7iiV1+mmbYH5h47dnkv1RbtYCnfRBYZC10YCmaaiVJc
         HFluU4Foii29OnHgLkyWFbJEtz7+zsZGV3rjSwmBC3gX1scQBb+5BFdLdUBEy626nIhS
         Kax1Bd7EmKDHMmdk4ahvZW6yPoBzgdJ8px5xoFrezVwBAR5AcXE41k9ogEPs5736gGIe
         zP3A==
X-Forwarded-Encrypted: i=1; AFNElJ8oNQkMRUa91GCcUlP++SQivtt4uSg5Ar+rADPJuBDYSHNwB5UiFv/+0oSOx9658gfkzWNHJTNH9NCbzz9CuBLZ2A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7AWhQmwIZzNj/BeKZcWcuz9wtpqvE075IV0VizNtMDX7SsIr+
	Yzugh5x5JtnCnFb843mBivIGl6H+AEHneI18nwyNge9Xr7oX48np3QMkTZ7Ed2+jlv8=
X-Gm-Gg: AeBDiev72jciFShzDtxobh5y2fcojGrpfODVpyPaSIOpnQPEYRQHS+xpsNi25RWtavQ
	5kTrQAWEQtTUTtnCseSp2xSQ6ZF9tl2PsGWZw/69fE9ugkYGpIlWJ78KwhmOG2x7BdUdnPwvCwA
	cSN8uFbus8jo6+DMzM2ywB+Oc93klnmhVSbuJbm+iF56YSreS9fElUIYWqjX8gm9kB3fpmk73sd
	K/7em+iMrznnClwyMjQSROVgVTReWHoAUjc3iebd6g7z7jS71Yhbgx4/x3id9WWNPif/mFlBKBk
	ft7xtg6KZPTRE6QLf0WKIMKyLw+c683ccDOiqIRqPw4Qjkjpo8uOzzwdw0bsAIWOnK8ChqLadqh
	wdEDrNIK6eCdB9CPIV1edusxXmyIJ5wOyunqHdSuwlmSHNCiPZgXhxh064hLZbQxCeKc8NIoZXh
	aeW353wVczhkVv/5Eo2o2bWz3CjSmNAMdBHpD/90rHuVPlDTyiJOozVhHv5w6IZvCf9GemHqk=
X-Received: by 2002:a17:906:f049:b0:b9e:a26:4b2e with SMTP id a640c23a62f3a-bc56cd314a5mr181053766b.32.1778077759349;
        Wed, 06 May 2026 07:29:19 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc55b58fbfbsm96028266b.23.2026.05.06.07.29.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 07:29:18 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-67bce1840f1so7661302a12.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 May 2026 07:29:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+YGBBjJbXxy1mvPQenUQvuBfKvyJOOoVPf1DCL1Zj5iE2HLhsR9pbrzR/4D6MYPucUHNwPjewjv766atTkMg+Hpg==@vger.kernel.org
X-Received: by 2002:a50:ed10:0:b0:67c:4e1b:9131 with SMTP id
 4fb4d7f45d1cf-67d6489a2acmr1189650a12.21.1778077757174; Wed, 06 May 2026
 07:29:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430100838.157306-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260430100838.157306-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 May 2026 16:29:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXUWDPcHb28riZ6Uj2aN-BtgGxazu1A7ocZymVL8wYGEg@mail.gmail.com>
X-Gm-Features: AVHnY4JIWsfX3RObNxzzkQIdZ2g2nyGfjaY6a3VREMXWQFxMgdRXrU8sBjv2LdU
Message-ID: <CAMuHMdXUWDPcHb28riZ6Uj2aN-BtgGxazu1A7ocZymVL8wYGEg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a08g046: Add IA55_PCLK to critical module clocks
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 9266A4DC7D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-32128-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[]

Hi Biju,

On Thu, 30 Apr 2026 at 12:08, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add R9A08G046_IA55_PCLK to the critical module clocks list to prevent
> the clock from being gated during suspend, as it is required for the
> interrupt controller (IA55) to function correctly.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a08g046-cpg.c
> +++ b/drivers/clk/renesas/r9a08g046-cpg.c
> @@ -312,6 +312,7 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
>
>  static const unsigned int r9a08g046_crit_mod_clks[] __initconst = {
>         MOD_CLK_BASE + R9A08G046_GIC600_GICCLK,
> +       MOD_CLK_BASE + R9A08G046_IA55_PCLK,
>         MOD_CLK_BASE + R9A08G046_IA55_CLK,
>         MOD_CLK_BASE + R9A08G046_DMAC_ACLK,
>  };

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.2.
Or is this critical, and thus a fix for v7.1?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

