Return-Path: <linux-renesas-soc+bounces-32925-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLkwBFgeEGrqTgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32925-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 11:14:00 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B43895B0F38
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 11:13:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 813033051FEF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 09:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 030F03BE643;
	Fri, 22 May 2026 09:12:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA203BBA01
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 09:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779441143; cv=none; b=qL2e3E8qcQghsNxDA+aIzXADT769edT3ojHCTUqAV3JyfLEY0bOBlsvXoLWyEH+aj/Ana8gyWzB/5fPeG7/5b35+G3teLX6SEqMu5GPIBNg6t7YIn4yUdWZbuf4VW8eLLpT5OypUDFiqKsFHqisLtmpv/I9OtBimLbo9DJzurOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779441143; c=relaxed/simple;
	bh=+UJzkg48lMkoSQyNJu94NJ5U0X3TUzcERqMbRbzsVRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nnFF0H1eWjCvLukGzQJeAOvRm3F9kfu74AdG/LVGE9UWQ/2phkPYQVVtFdBPKkSu83Ibmib0IGKMWCTxQAQgNOzCsAJEIEPdhe+OcI9KngFiE1uYMgdBoB2r52UCfhLX98Sgaigv404A8oejwhGexoo3HzIhdkLwfC/DY4x4hOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-57611a6a69eso2090955e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 02:12:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779441137; x=1780045937;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7lSGt0XkeFIiWkTNBDsqiKTBjOhow5nFx28sgXv7vGk=;
        b=atVxfTF8l9M3odkaNiPe+xvEfqzH1HGhFFpoGLrnPEk0l0zAOzgIR3f+WKawcbn+hR
         /d5T2xx/99qDBUuNvjj1BVWNT7AkDZQq3cAf784paebVKpRLBzXKj3S9qEBX6FjFXVxt
         pbQG0suwpXEELVv+EMNGPq5UoYcqs23L82/tfpAh1H53Y+cPiEPtafKi3/m/20FB+FHn
         YR+llQdj7uqIKtrTMBmG8irfrgZVFe/Cl5AxcKjT0F1JRu2eC+rILpiAN3vYHtVg8wiL
         QDDwn5L+v8IZxApyWwk/NjTMu7M664hB66xY6xJpDQsm4QJHjyE5ODIdfhBcv6R9yQ18
         zAiQ==
X-Forwarded-Encrypted: i=1; AFNElJ9djZXWZeNr069n7hV3jly+rA6J5IkmH84P82kyxtG0LgKABdSf15ddRUC8u3ZdyvWFYHl/+ZXtARLdXvYER8YQqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfmdoLZkvXmn4wnaj4aavg1kVJpXjC/8msyGK4yhpxaAfJIY9o
	gK807oQXzwHoKJi9gWocEb4qvp/9VRDgZ+TnnaeIh8nnQ5GxsKhDXygu0Zac9n7R
X-Gm-Gg: Acq92OH7lseeiK2Ocjey8Ep0QxjSTXXRfxfRcZpCCUe5auWNJLeAjCXxSeZHIxaNnSL
	hNUOEK8vgsqep+y2hnzSjJfgaOqnacbx0SN6T0/m2J7g/zk4qhMgOS+FKSfEJlrR7jrX68v7Iwk
	qCB5tqiBFg9hZVX3ix0cCIn55u5tzGAH1f6ZwKL+tRuOdXGPtmoK6iOEiZY2+6TG4elOWLp7RkZ
	XcetfXLlR2Ac07RPxQqBzZ/CTAwtTEG/9IKtkre/+TMenEDVFmfJ52R+i0UlZtMditRSO2tvRhQ
	CMyKgq02MRjs66+mL8qUit6Fr/XMOQcCVC3vdvTiWCcP+pefxiGQzHbi4/29F5+JBF54VvBAnsl
	z5wnJ7o33d1gRtwsBlchU7ImxuoVKxf51/MX8kGR8aQqNTZM0WafQLAoTODqnGn9URyC9FYApTe
	G2lqtfIJ5X3rtizZ1NYuFKekjxtuBehxD8OXAWBJZ7dgQeRyajjll4Hr/49CrE
X-Received: by 2002:a05:6122:2896:b0:575:24a9:78da with SMTP id 71dfb90a1353d-586626beb3fmr1335883e0c.11.1779441136956;
        Fri, 22 May 2026 02:12:16 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f23ee3adsm1448476e0c.2.2026.05.22.02.12.14
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:12:15 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-95d439bd3a5so1741270241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 02:12:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/odfZa3yqCiZKxMnCk9l79QUgavuqPgTOLT/A2qxO6vxJSNB2Sn3axX75A2aOIu6z3vg4euXh7p0DyPckn4A96Jg==@vger.kernel.org
X-Received: by 2002:a05:6102:15a1:b0:622:702c:fd3f with SMTP id
 ada2fe7eead31-67c835b842cmr901643137.21.1779441134377; Fri, 22 May 2026
 02:12:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515124008.2947838-1-claudiu.beznea@kernel.org> <20260515124008.2947838-3-claudiu.beznea@kernel.org>
In-Reply-To: <20260515124008.2947838-3-claudiu.beznea@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 11:12:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUEeo-aCgopHt8CVkdedqd11S98HE6Ckkqk49Bj0LrxuA@mail.gmail.com>
X-Gm-Features: AVHnY4JnKZOmF5oPEGearuYvmvs7T4LU-ClYXmPyGIj8obiKu4rAdqagY3X8Tg4
Message-ID: <CAMuHMdUEeo-aCgopHt8CVkdedqd11S98HE6Ckkqk49Bj0LrxuA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: renesas: rzg2l: Populate struct gpio_chip::set_config
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: linusw@kernel.org, brgl@kernel.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, biju.das.jz@bp.renesas.com, 
	claudiu.beznea@tuxon.dev, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32925-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linux-m68k.org:email,mail.gmail.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: B43895B0F38
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 15 May 2026 at 14:40, Claudiu Beznea <claudiu.beznea@kernel.org> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Populate struct gpio_chip::set_config to allow various GPIO settings.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v2:
> - used gpiochip_generic_config()

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

