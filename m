Return-Path: <linux-renesas-soc+bounces-31349-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPbWHaDg4WkKzgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31349-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 09:26:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD44417E33
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 09:26:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 932A63012D68
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 07:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D351D33D4EE;
	Fri, 17 Apr 2026 07:26:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86C31DB551
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Apr 2026 07:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776410778; cv=none; b=CSm40pyByMS4KyIDOXxLQvwg9nr4qFi/1ifVwBdysYObW4yW2ym/lOH5gPNQkY7lvn3a9PV8hNtvp1lhtH66JCFx+PeH43i0sznujHyeQJHhu9qywXbJuAg4ySgjWojkMWHyVapMbOaJ4IC3Xcq3kz1T9oRW2GtZ3pK+DBMS9bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776410778; c=relaxed/simple;
	bh=a3NnvCevtSewQG0Oj/xyg6Ev7RwvAs1YGUH7obmLO9g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JP6zA672Qnu3G0/tR8A2uRQEfReLNIyBXTeYnbqIMAEQ75zo2tj5ASi828UAz3YT9SRqj8KfsM8cyWmF0MsjjUtaXSiGLfZbY7x7rRoYbwxveYChbDlyLaID3ioiOxrV8eLL7C25AoH/TnjmwiiNvfktwb+RH1gnIOg0bSRGoV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5674d8be45eso116128e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Apr 2026 00:26:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776410776; x=1777015576;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0filTeR7XuW1VhPPsFA0jH5OYwoCxnw8iV1YuSDtZA=;
        b=be8qQjAeyT2nCCCaiAzG46ii3zAd1gbdskls4vp1mDyL9XsuNsYlCvjZDbRcYTJ0Gk
         7E687EWZRVHxadcqd4ogmgjTVtkmHwvjlUJj0x70XzQMJCszpiJyEQn8PcnfKQyvTSu8
         AE2llfN9DdiW1GHRnmGcM7s/CNwaekHOq8vglQ51Db5iLtFddDpho80sGqmJW/LprdnL
         bARcZxETOoyrMMFISwW62TDBuuhub4a7HciaTXiIc8sXvt5Nc7Qgau5/fcyBvYubUr4R
         v/4pk/KQFAC07MsP4puYkDjN+WPoYegRVKHT2XXAWrxw0yIGWjxczh6PWU8HczRgEDrf
         i+OQ==
X-Forwarded-Encrypted: i=1; AFNElJ/mBeMlzDZS7CivlijiuNPvbHsYg/rgCH3UQtKVN444i3PGBsld2r1mxf1Ve1NXx81nH7yJeo6E72JCPfb+365lsg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx591Frx0to6z2q4gBxstV1B22xV77MJaxEvgSyMOI4opKte4ZO
	LwzQ8XPXrrSZsg+//xC0Q/94f2NivFiZXkN0ByB/asfYI0EWb8j2QkDnp7CncZh2
X-Gm-Gg: AeBDievp6WEuNr324nQgCXYZDiEpZ4/pNsk/bD81OF29BxkDSPd0CXGdSPMtFrnjmmi
	hJvx5psogTAaHaqYW6L3mBOeaqSVnycDYj5WnorXYi2k8y8Kavh9fIUILYyWPkEZE8PyE5oL4J2
	/223M0c9MhggLEv0BqwsG60h73eQ8fS9m1AHfs9kJht3p9OXFbTkfBhGwOwcmcQMOnmzpKruMAL
	52fJW5Ke0LiCN5btAbQorPCDirOwUHKpfvDxScMD6nSNYxzXBLuFq6npWPpBPjoDAWZvw+ciPvA
	Mfxsfo8X1oESUGg0DpEYXh0TGX7jvPJK60GXQsko2RR2sAvOJS5weZxJZ1zCuZ32GrAME0neK+C
	xwJjE+Oa+Fs9bCVq8vq9sWsJoybPZDzw2ld4JdgEEbXnCPF1rTA7+qzoq0rIfe9UrS+Aw1su22m
	GZeLCxEL0mR7QTfGRMm9WHk7UQpTzGfhgIKopRHgaCL0T7xyuHIoRTILwrSNMxPHgWu4HPKODST
	3Y=
X-Received: by 2002:a05:6122:8b10:b0:56b:5e7e:d3fa with SMTP id 71dfb90a1353d-56fa58c1168mr687337e0c.7.1776410775641;
        Fri, 17 Apr 2026 00:26:15 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa920f0b4sm426026e0c.8.2026.04.17.00.26.15
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 00:26:15 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5673804da95so128802e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Apr 2026 00:26:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/YG2soerTvfzsQy2gycyHODvkK86p3Rp+LhHwM5JntUI6W05G2D+oZix5of1j7hpmh+oVuI8KsPvSPd6vjrz2T/w==@vger.kernel.org
X-Received: by 2002:a05:6122:4881:b0:56a:e46f:2cfa with SMTP id
 71dfb90a1353d-56fa59f3567mr602125e0c.12.1776410775292; Fri, 17 Apr 2026
 00:26:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-7-phucduc.bui@gmail.com>
 <20260414-funky-sincere-polecat-20b0bf@quoll> <CAABR9nEKGSRNp=eK=ZHf6-MNsj=6cDCy1YdbzSPrHyuc3Ux0Ow@mail.gmail.com>
 <CAMuHMdVPbcz4rF8ojEcvxp1NaM2mbQ2o+HZLwnnjNnX8uHf4HA@mail.gmail.com> <CAABR9nF131G3K3-vUdaDwHuQ7MCCLd-VO5syLApE_qsn+J49kA@mail.gmail.com>
In-Reply-To: <CAABR9nF131G3K3-vUdaDwHuQ7MCCLd-VO5syLApE_qsn+J49kA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Apr 2026 09:26:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXie1HR6XzkHXAtonh2oemNxH2UZE3uSUjW3xoOmhRjYQ@mail.gmail.com>
X-Gm-Features: AQROBzD4ej1pJTTRzELIJ2wgirossSrvDsKxLrNzMC07pv8sxHPrEXyoOqf8Biw
Message-ID: <CAMuHMdXie1HR6XzkHXAtonh2oemNxH2UZE3uSUjW3xoOmhRjYQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] ASoC: dt-bindings: renesas,fsi: add support for
 multiple clocks
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, kuninori.morimoto.gx@renesas.com, broonie@kernel.org, 
	lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	geert+renesas@glider.be, magnus.damm@gmail.com, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31349-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,renesas.com,gmail.com,glider.be,perex.cz,suse.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Queue-Id: 7AD44417E33
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Phuc,

On Fri, 17 Apr 2026 at 05:35, Bui Duc Phuc <phucduc.bui@gmail.com> wrote:
> > Where does this match the driver?
> > Usually the functional clock is called "fck".
>
> Regarding the clock name "own", I used it because of the following
> implementation in the current driver:
>
>    clock->own = devm_clk_get(dev, NULL);
>    if (IS_ERR(clock->own))
>       return -EINVAL;
>
> The driver currently fetches the first clock in the list (index 0) and
> stores it in a variable named own.
> That is why I named it "own" in the DT bindings to match.

Thanks, I hadn't looked at variables names (I searched for "own"
including double quotes).

> However, I have noticed that other DTS files commonly use "fck" for
> the functional clock.
> Are you suggesting that I should also rename the variable from "own"
> to "fck" in the driver code ??

I think there is no need to rename the variable.

> For example:
>
>     clocks = <&mstp2_clks R8A7740_CLK_SCIFA1>;
>     clock-names = "fck";
>
> But from the hardware manual, MSTP refers to a "Module Stop Clock",
> not a "functional clock".
> So I'm not sure if using "fck" here is appropriate. Could you explain
> the reasoning behind calling this clock "fck"?

It is the main clock that needs to be enabled to make the device
function. This is independent from the notion of it being a
"Module Stop Clock" or not, and became sort of a convention.

> Regarding the FSI clocks, they can be categorized into two types:
> audio clocks and module clocks (which may include bus/bridge clocks).
> The driver itself does not explicitly handle the enabling/disabling of
> the module clock; it only manages the audio clocks.
> From my code tracing:
>     At boot: The kernel automatically attaches the PM domain and
> prepares the clocks during device initialization.
>     During playback (aplay): The FSI driver doesn't enable the module
> clock directly. Instead, it is handled via:
>     genpd_runtime_resume -> pm_clk_resume -> clk_core_enable ->
> cpg_mstp_clock_endisable.

Correct. On most (all?) Renesas SoCs, devices are part of a clock
domain, and their functional clocks are managed by Runtime PM.

> Since this module clock is essential for register access, it must
> always be the first entry in the clocks property (index 0) so
> devm_clk_get(dev, NULL)
> can fetch it correctly, right?

It is not strictly needed to be the first clock, and mostly a relic of the past,
when clocks weren't accessed by name, but by index.
Also, many devices have only a single clock, so don't need a name.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

