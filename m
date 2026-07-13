Return-Path: <linux-renesas-soc+bounces-35095-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TbUuHfytVGpjpQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35095-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 11:21:00 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB087493D8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 11:20:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35095-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35095-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 24C04302D18C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 09:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA613E0C50;
	Mon, 13 Jul 2026 09:20:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20F93E0725
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 09:20:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783934419; cv=none; b=Qx3tZtuyzlpPic3Dvo3BEt4norofu3kmVsCtW49nqRdE5XX9h6+KMguaSWg+hexGWNKgtpW6cztXHP7mYQ9EfTTHqrvUJree+poU6qOTcjokY2yfsL8QWT8W/Bb8oRBNJ1aApqDzcJiaEi3zpuGy3E4e0Bn8joLZUcOuZVntZRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783934419; c=relaxed/simple;
	bh=zgIM9UCa3XkWmd6kqFFWou+UXKAbWYBBdjA28fRvpGw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VTwCoBQuHgQKG1sN5qg7bISW3VJIq8nOik3XkHHKpl0PaPEOgMyoHemhoM8ymDEbWCHEBPWHtrbTacQWPDc14fo/qlBnjEq7+kFNd6RisRDAw5OIDNVDwgfppBpJFJ2Ga7NuDC2G6q9P12Z/riSUBFDhF9CuQ1dTsCbA2aGlH0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5bdc6c65e90so1670426e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 02:20:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783934414; x=1784539214;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FudjopChxRShNl2EKXmfpQ4D5dQDLukS5DHJwD71hIo=;
        b=DaM0rU/ZgTWVy+/wcyrPArsrJSWcp3T7H52pOw/P21stROLd6VduUFuD/ORRF0ghPf
         z21VNAI3JmUhmATCx+4Q2g46P7+B/Qhaj20hzBc2Q3bd6HBvmEW4A6HfRgnJpLERm7Qc
         hc9kC116HfBrGLN8hRiB5pNg6Zzh80b4spn9DZgThixHPlOXUY1y8iml+TSxC+qr+2BE
         UQifiV3mENNcEFDMF92tiCrz43v/T88x2f4FNdl6NwPWTTwFBeMOuA3ApVbDd3DvO9Uk
         7ifZXEw03f2hJNB4PNmxv73Im9/OP92yXDD8w+VVNlSnslLOK6k4jA2WWDopgCUV1G/3
         q4dg==
X-Gm-Message-State: AOJu0YyMKMEYvsB3HaYqBOmNAe/BSZKFE9eyKfCnotodIATyh5NmHjmf
	GdnzaDL2Jj5dbenPw/k5VIdVQzltt8afOL9VWlC2zg4HSzQ1wN22UnVpXyAK2HX0
X-Gm-Gg: AfdE7clSw0GwbwS0/RL0S+YRodM8fqemPjRIFIMI5clMwiWfymQkp6rAqVDpeMmv1jQ
	R0msqqjA6F01hM9Yz1sFxE9cyO/pmhTnpG2Gn3WIRP7H3pDME8NkP2hncxGitOpecmipIYm1UH/
	WMWkTBhkuoWMduwyk1a/AoQ/syhIlqvfxgnFXWTcbNg+vojaKwtoVUS2dPOCzGYxqvmX/qtJebE
	10VBIi6LKzS5NNI2hkNV/Xsh3rh0k4wjgPUcU4E2eS2fLct1HHE6vHUAkeXUZDUf8uDtYMQeHj5
	OxprnzAWcx92UhAsITDaRG+z0/mK1lsp4gmxkQojoBUoaV5cNH9JzV80LIyrEs83XaX5DeMW8yx
	thZKekdD2pT66c2Pt2Cbh8albUhC8xWiL76P0KNJqG+bQCPWYvDARgh4CtbyIh02vApwEOg376R
	FsCwVK6b+0OT40gQT+K2j6eAiaTXh8fQ8UWCQSumdODt4SMtyLiRJ6ydpJtlW4
X-Received: by 2002:a05:6102:5a9a:b0:727:fb8:f269 with SMTP id ada2fe7eead31-74533e17c26mr5384644137.22.1783934414451;
        Mon, 13 Jul 2026 02:20:14 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96ed25847e5sm7429866241.2.2026.07.13.02.20.14
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 02:20:14 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7396940aebcso2208372137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 02:20:14 -0700 (PDT)
X-Received: by 2002:a05:6102:5a88:b0:737:8ff4:147f with SMTP id
 ada2fe7eead31-74533d96437mr5149659137.17.1783934414002; Mon, 13 Jul 2026
 02:20:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260712093148.21446-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260712093148.21446-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Jul 2026 11:20:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV415V23a9E2QM77iQdGePOoZYNk=+v0Hms6uxugKBu5g@mail.gmail.com>
X-Gm-Features: AUfX_mzy589jps_1O1AtmCocHbl-UiTW35zpb0NKjYk3J02kC89IR38oMnQCTrQ
Message-ID: <CAMuHMdV415V23a9E2QM77iQdGePOoZYNk=+v0Hms6uxugKBu5g@mail.gmail.com>
Subject: Re: [PATCH] gpio: sloppy-logic-analyzer: add a comment explaining the
 buffer init
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Abdun Nihaal <nihaal@cse.iitm.ac.in>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35095-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:linux-renesas-soc@vger.kernel.org,m:nihaal@cse.iitm.ac.in,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-m68k.org:from_mime,linux-m68k.org:email,sang-engineering.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DFB087493D8

Hi Wolfram,

Thanks for your patch!

On Sun, 12 Jul 2026 at 11:32, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> To avoid more false positive reports of "leaking memory" when
> fops_buf_size_set() returns an error.

But who is freeing priv->blob.data when fops_buf_size_set() succeeds?

>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> --- a/drivers/gpio/gpio-sloppy-logic-analyzer.c
> +++ b/drivers/gpio/gpio-sloppy-logic-analyzer.c
> @@ -237,6 +237,7 @@ static int gpio_la_poll_probe(struct platform_device *pdev)
>         if (ret)
>                 return ret;
>
> +       /* Initially allocate a buffer. It currently is NULL */
>         fops_buf_size_set(priv, GPIO_LA_DEFAULT_BUF_SIZE);
>
>         priv->descs = devm_gpiod_get_array(dev, "probe", GPIOD_IN);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

