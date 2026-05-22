Return-Path: <linux-renesas-soc+bounces-32924-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIT7OucdEGrqTgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32924-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 11:12:07 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C755B0EC5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 11:12:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1F43E301CD88
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 09:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4BB13B95F2;
	Fri, 22 May 2026 09:11:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA409364038
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 09:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779441112; cv=none; b=FdDCZ63esa9Dh2LXJmfvsTsIHcFo+K7ZbGdzAIc5mpXOoeN4BcGJVk3Yedxd6UNxLAZYlnK6oUQZSPRUDgcbisG2LuF7j43qb2YMaMVFRdKLYjBPrEW1fyEfHtTbdyqlC6J5TTtQ11WqlnTNrShHXZa4O6Q0p8yQmDcAead/98g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779441112; c=relaxed/simple;
	bh=tAi5UeQ8Wn/ZsGeuB5ybx0KShfl8F3H/Z/vQg1bKe9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qL1+AOV0G9IIIVU+p70pVtz8itLTf6Rom9k6mHnef4tf38KswejZWafyBUdfBmSMPur5oiCmYVZeqKZ6H6vM8UXgHdLBzwGDYWNRlNH53owmh+yOLmZxTXx/9ygrEsq06wT0S9HaVuX4FLAgzNXP5z/jITeygcxtRfEc4XUjM70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-95699e8e26aso2337433241.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 02:11:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779441102; x=1780045902;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=euPMq2UyJF5E3NPJ82QmWExcUbi1ANEh3LXTW7bdXbw=;
        b=R35rCMwfvj8TF8i3fIwQRL1oUd97yg7JIcDGJGOCrqMQXT0qTejJDzPoGR719pYDsA
         j0/auJqM9otve33hawzUoD2GQKq2pay+077joimlOmZwbELu8XsMo6Udu2bqWQM+V7Yv
         VuNbMC7OkGrtms5K8LyXmqPkHugA3VvriNM707Kce1U8OrKgLAJmL81uYeiqGWOkB5wH
         MBatVpWswLbf+KLjxJzmmo9obAsjpwuMWnfJwkkQLxUH6+opcOMNLWOvXeL5cX3fN+6h
         6QmafYGSyrT4W+7ev/dPw/YfrJyZ3YcriGWsbGl8rXKhXS7pCYHig0oC4RbJTzxW1Cpt
         dYWw==
X-Forwarded-Encrypted: i=1; AFNElJ+NYC6bJM3o4ZWVt89Klst/qlSjf6e2ZJekESxN3CGBEn3xq87U3KANalTxKvLQYkuUrMFMJCPQwYrNX4FURvWu/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5sHIevvAk7tFIijhDpJlJ9Zdov9X46p3lGkp89vIzGiWNTGXy
	oRXY1ragq9rdMAQF7gFc5PVwBsDsPbgJDzbEdHFo77tfIcEjRYVnamGKKfkC0/zG
X-Gm-Gg: Acq92OGxlcmzbeh3Bxtwm+em5DPJOSPSWLutAaLOieOEeUMbTxv5R+ZCbpKAirDDIlW
	vZJki3GzYPpBdcyWQIY5frRjRyFrv/042RjniT5/QB90/Qs14e2azfvvKon3CwdgvaJ9kE9OXaH
	Mfw/QYR3BHg7VVD0K+9m2PSMtFIo0Q0b2gUxpledpkjLulX/Sxo2gqlFyPV90VQoWb87uhaYl3T
	6+JQTgVTXKJx2NKyTByp7xMEWA84eW65+AETzXjrqy4Eq4JA34a7b4LNXM0v1wSCBBNR6ZEXe9O
	3oF0qYABikhO6/Y0Vlvu/VRgY6EGptCt7SuBOwFMG9ZsuAUJADhpSgYWbTlpfEgOLlFzybSVnLP
	3P8/7nWU9FG7uHbJrcuC5DKOf1QadxYTixrScIEXUlJ2krwbH4bQwJbVoD+VzL+E9Z6ZLimMj/o
	Goc1QIdoXyMUms6Mc8/q7Z3gzT80lSaKu9dkowEZjwhwxEykf6ACN6+EmUhosm
X-Received: by 2002:a05:6102:3a0a:b0:632:e359:6c02 with SMTP id ada2fe7eead31-67c8dbfb85cmr1002056137.22.1779441101642;
        Fri, 22 May 2026 02:11:41 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96173afdb54sm896676241.8.2026.05.22.02.11.40
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:11:40 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-95699e8e26aso2337428241.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 02:11:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/qEoTYcqYC/+F/BsOccZIcvRLqofx4RpE7SveDS6rXLQLp7oMRL/t73Wycdo7EJMF749YI/pABDbPtrgG2cUMhGA==@vger.kernel.org
X-Received: by 2002:a05:6102:f93:b0:660:e01d:d684 with SMTP id
 ada2fe7eead31-67c7e1209e2mr1145939137.3.1779441100124; Fri, 22 May 2026
 02:11:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515124008.2947838-1-claudiu.beznea@kernel.org> <20260515124008.2947838-2-claudiu.beznea@kernel.org>
In-Reply-To: <20260515124008.2947838-2-claudiu.beznea@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 11:11:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVK7Wu=Lv1Qhu0+CMCQSXv6Lj6BoTdzVoW1K5Z=kgecag@mail.gmail.com>
X-Gm-Features: AVHnY4Iw_vr8Guqtk2YAOmBMghsTC9zOxmpEROEYDnyaYtfvfPRQWvVAvaAm2po
Message-ID: <CAMuHMdVK7Wu=Lv1Qhu0+CMCQSXv6Lj6BoTdzVoW1K5Z=kgecag@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: renesas: rzg2l: Use -ENOTSUPP instead of -EOPNOTSUPP
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: linusw@kernel.org, brgl@kernel.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, biju.das.jz@bp.renesas.com, 
	claudiu.beznea@tuxon.dev, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32924-lists,linux-renesas-soc=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email,linux-m68k.org:email]
X-Rspamd-Queue-Id: 62C755B0EC5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Claudiu,

On Fri, 15 May 2026 at 14:40, Claudiu Beznea <claudiu.beznea@kernel.org> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The pinctrl and GPIO core code make exceptions for the -ENOTSUPP error
> code. One such example is gpio_set_config_with_argument_optional(), which
> returns success when gpio_set_config_with_argument() returns -ENOTSUPP, but
> reports failure for all other error codes.
>
> Returning -EOPNOTSUPP from the pinctrl driver on the unsupported pinctrl
> operation may lead to boot failures when pinctrl drivers implements
> struct gpio_chip::set_config, the system uses GPIO hogs, and the
> struct gpio_chip::set_config implementation returns -EOPNOTSUPP for the
> unsupported operations.
>
> Return -ENOTSUPP for the unsupported pinctrl operation.
>
> Fixes: 560c633d378a ("pinctrl: renesas: rzg2l: Drop oen_read and oen_write callbacks")
> Fixes: c4c4637eb57f ("pinctrl: renesas: Add RZ/G2L pin and gpio controller driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.2.

I guess drivers/pinctrl/renesas/pinctrl-rzv2m.c needs a similar patch?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

