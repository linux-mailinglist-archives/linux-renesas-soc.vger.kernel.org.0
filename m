Return-Path: <linux-renesas-soc+bounces-34307-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7NuXAw45OWpUowcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34307-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 15:30:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A97C6AFDE4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 15:30:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34307-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34307-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8CABF3019832
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 13:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8E3C3B42FB;
	Mon, 22 Jun 2026 13:30:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF413AFAFF
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 13:30:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782135035; cv=none; b=pfjxrz25zEnrKD2jNhR1/3BIQbrcmO11gxspQf9oWUjIDQ4hoRSfAsHpNg1Kqu9SXjk8uZ06akdwHtrbLG99yivEQS9A/+GGxQLb39QteYFwJsmwWfcGgwjdYGIkHOgeVChnsSxL6XyfWb4Yz1lSxHPxc586/zD1P6FEC8P840U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782135035; c=relaxed/simple;
	bh=vzLRtnv22ER0/UohF++cnZhpzbMw45oj9pfL63dLXr0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=guLfemCJTe8riDiY8YTw52ZLwVqNG86XrQOeUejKHhU7AnheVTpr3bnXgv+KiwhM8tqcnm9jUsNIAgvowPfz9ljDWAiLIggy9IXWMiNtniN8OWk/tX8DMsrZVD9Z+HBzKvVVPTCVjSXnrzMbDxTAWENmTstWDoxzT2gjXM2yD5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.49
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bec450b950dso623860466b.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 06:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782135031; x=1782739831;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t2I4psQ/SeYFsD2MIipH2FieIrt9XHXfl8UEpdC8jGo=;
        b=mi4BYm9vxfI5jN0S2acOJdMDV+CvT6qKWHA06HLCj3LAC8f2YzwV+I/VwdLBfj8RuA
         mPPQZD4JvW8rx5zo38SUBSgpVZZySuzCQMcDI1MDe4+1EPKa4sUDR4l8fZ80CTnNCVNl
         MmEBpVU+w39p35jy6sjDXeX4lznLYzORQSIsOya8HAKP52Kt2Id71c1ZU/jozEM+wSOZ
         oKiLsbuvuWK/lYactr9o7J/McEEVI8olm+FaSB1cpGGDNYBfCc2ZaNtGQnrsL2L3qvOD
         whCwHrb3UOiSH+l0GRK0nl7ebAV24DtTuYcC/Kn2cLNKW4UCx8cVyYiVj+idy8bhljwX
         E39w==
X-Forwarded-Encrypted: i=1; AFNElJ9dlOWEbfGQG6hc66BT4Ua5ar1sRGZGGLCEJ+LC2RS7gm3wP13Pum7ILOhg1tvLytED66dmBUte4g7wT4QU3ADQSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaT8FzHljGP9LfTfOEhq7Sy+f0gCuAcNzkTBVdUkitKz1W7LuB
	mO55dVe5KaPHNPlXDt81GgdFXHiXpFkXhATbq8KUh5WM9XXo4iImViqyoMpiWx/wRas=
X-Gm-Gg: AfdE7ckD+BUGbn/wn/nAsjI1Eu6y4O2sT4hF8GgmhYBjOmDcSj22vEZgsfLy9pGIwHc
	f8wNQzg8u9IiIPNnOBIhir20ishhKveCjEdAnmKFDTeZk+pCLZ6U68fRV/BhQ6U6jcb9njxSrM4
	gJwCiuWjoIsIfYWnfAkGb+QfTsp8F6sGQaZ8fnK1zHyRtRFwYcQfV2fWn7KUVk4cxnrH+2j/C47
	oYe1A1a62LmJiZVzhqmyGbmQQPYcdBkRbNRg6p+LaySO2gBIvPOhKoteAZ+ZfgHBoyC74woqGHw
	QfAch8yTh25+m/5EuXvaXD+5m1uN7fyIyED5bx7OazbUNeHHFY6xgO4DQkbzUvXyvG7d2HSXmXe
	pEmpCnUeNGJO2bnEzT8QH3Bih9SG+mPyln0lo8nuchPZbRjzDPVLIqNGyk6lPF3uo6Q5i5iMZHP
	qIhFmO9HLunCGxqEMPfk9ORpPOF4EwSTLR/gnV0j0YGwLgQTIDcw==
X-Received: by 2002:a17:907:1c94:b0:bed:8f7e:d85b with SMTP id a640c23a62f3a-c0b75082dc2mr645708866b.42.1782135031381;
        Mon, 22 Jun 2026 06:30:31 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c616175c2sm360579966b.61.2026.06.22.06.30.27
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 06:30:30 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-697b8540279so1161609a12.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 06:30:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8HIqBJeXv/Y6pYW21R/CQGWfN1ZyFSlWIkIG2tRS/SlUxlMllBOafPqD0/8425z9uxoRTubchdG0cAAHEV+Aq/aA==@vger.kernel.org
X-Received: by 2002:a05:6402:3819:b0:696:759e:1c78 with SMTP id
 4fb4d7f45d1cf-697568758e9mr5777653a12.13.1782135027554; Mon, 22 Jun 2026
 06:30:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260619083951.3777556-1-john.madieu.xa@bp.renesas.com> <20260619083951.3777556-4-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260619083951.3777556-4-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 15:30:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXOSPmfbOf-BukgVX8E9wDV86Pyq0Tvy7nFrHfCY6wVdA@mail.gmail.com>
X-Gm-Features: AVVi8CcZ4z2limMP1SVfMoz2DZk0QXMVfO_Dh1mo06V_qNFIYC2QivU0_Ycz6e4
Message-ID: <CAMuHMdXOSPmfbOf-BukgVX8E9wDV86Pyq0Tvy7nFrHfCY6wVdA@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] arm64: dts: renesas: rzg3e-smarc-som: add audio
 pinmux definitions
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	john.madieu@gmail.com, biju.das.jz@bp.renesas.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34307-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:john.madieu.xa@bp.renesas.com,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:john.madieu@gmail.com,m:biju.das.jz@bp.renesas.com,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:johnmadieu@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:from_mime,linux-m68k.org:email,vger.kernel.org:from_smtp,renesas.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,glider.be:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A97C6AFDE4

On Fri, 19 Jun 2026 at 10:41, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Add pinmux definitions for SSI3/SSI4 audio interface on RZ/G3E SMARC SoM:
>
> - sound_clk_pins: AUDIO_CLKB and AUDIO_CLKC clock outputs
> - sound_pins: SSI3_SCK, SSI3_WS, SSI3_SDATA (playback) and
>   SSI4_SDATA (capture)
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>
> Changes:
>
> v6: No changes.
> v5:
>  - Rename the sound_clk / sound pinctrl node names to use hyphens
>    instead of underscores.
>  - Sort the sound pinmux entries by GPIO number.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

