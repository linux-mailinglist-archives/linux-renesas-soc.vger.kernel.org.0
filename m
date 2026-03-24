Return-Path: <linux-renesas-soc+bounces-30169-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHFbK+ePwmkXfAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30169-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 14:21:43 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E413309484
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 14:21:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0D2A13070121
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 13:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97AF83EF659;
	Tue, 24 Mar 2026 13:05:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BB93E3C5E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Mar 2026 13:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774357553; cv=none; b=i/CHwZCZaIavYoljZcPEI2TY+iRfFIGzEUbmQfHmr14ol0IviJ850IxsjOgt7dkqFXDVaQdnaTtZbrR3s/aP8I8wdfoR20nazHVfSBf6O9+jJHZdeNVWBidbNwPDxOQrBHzztfm7XVd+8oNkG9hZCvEBVn0mk+cIxuyXP7fKCus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774357553; c=relaxed/simple;
	bh=3E0zaCBx7mSIpwWLF1RlRliMCwSqifDwNsjzLl83QiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k+v+xcWT5blAMtoc9bHzV76t1R2SSFX08aSPBuBWOztHXFm3FK5NsXIbvOzWIsugeUUhPf13v5cqgK3gL71/lpH4Id7ZDmucm/S50WiA/sRcGUVy8r6fp+zAZRU1NTH+aYw+gbbYxmsHWrIKAfsk/dWhUTyucFg1BmXKRE6ss+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-66a5d76d9e2so601631a12.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Mar 2026 06:05:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774357550; x=1774962350;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gpbsDmhCapUwh9Cve29legSkefqaTko+/wOGcVZ2UCA=;
        b=LlNI8CgUeIhVkMCDGOMRMMFY+K9Gi5qMBH8K5ZHYCK3ozCpRzm7RoBd6ZO6Hp5fp8q
         q3QXEyF7T+5ENyBGuATZ7M3309pduIFfSULKI7CDMCkIAHEduheAFBWsaDc6i9dGxjdO
         /mtprhq0gRKBms2RqfF8UX4zPZ/+wy+0HI2NnjqMpjTpW3h7mklspfcAU3u1zPxAOgeG
         mtmhRHbFgdOAAva+rpzAH4EThCnvD9qj/EnUFkXIFujvoI8ETvFwhEw8r32kKExsdr2b
         KCuO4v27moMKEYAUlPYlNdlchV9pM+ds0R46c+cEYh7ATmH1rGo0wozLoMDhRXAMwEYe
         wdsw==
X-Forwarded-Encrypted: i=1; AJvYcCXxVwfbfsV++5uCNCQkeFh3jGQQWs8NrUXwUIqN7xLYOEOFJ6MK4BumSd9h/tcEPdwrrgkIfOT183zcf9ZrgoNfAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfBoCaJ2f6ji/6+C+7vGrzHmKi+zJuK2bNMDZhdon8tfDWwkG5
	AaASuJ/cDA3/wgoZ2LA8EwtNwNnsTRRrUKp1OsBcQ3+Ef66uce0qTxKWKuSA65wcTy0=
X-Gm-Gg: ATEYQzxwsDFC6BpAziKw574P/o2g1gaVFrSulMEIV+N+2b1nxSquxVX7oR2agGKnqy6
	4NpBuqRzRrP/M7uz0k+tTKdDIqp//Qb41O8YAaiIMAB5dcWeZj+ukI7Qz5dl64GDy+d1a+4g4N5
	VotCRvp7vuEQrtStZvOwzo+dwx2cDnK5jmyb0ZI8fv2dKTU3JYegSGNQjjVgh5e9jUqcMvRsHk9
	fOLoWYPXvxsvasFjKnoUmyhvPaXQMiiyhZ3E2hyACin99f6igch7hoFCl+fvPXDM3/tzIunED+Z
	wsIEwkjA/bPlPfnY7UyO7HRBkZJjubb1VUY1tgfx0eDILZCW8YQt1XCU7/4NXNQaHOWYfZyyLDb
	PJIWW7wzr44vCnja3eSFvLH4kPim2A8iE1aClgPfD7aHH2Tokvj/mql9huSTHckyjKcS95DZ0xG
	kKPJujUd8dOof9wl8fwR+PFdjTbnAmWLgBfug7myciLulpkPYxZkXc5X3rXwvo9MioB7yXZLI=
X-Received: by 2002:a17:907:968e:b0:b98:6926:13ce with SMTP id a640c23a62f3a-b9869263220mr587625666b.21.1774357549673;
        Tue, 24 Mar 2026 06:05:49 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f440e7sm635089866b.3.2026.03.24.06.05.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 06:05:48 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b9795ca4e6dso794313966b.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Mar 2026 06:05:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWXizoLMdVKzXSJqRAYKWy6RvHj7amxcZTQuWxQ8R+7FTX2k6n1vQkN0g6vJXvxAjMlzQB8McNvT1TOd7ECjHt2Dg==@vger.kernel.org
X-Received: by 2002:a17:907:3d06:b0:b98:3fdc:150e with SMTP id
 a640c23a62f3a-b983fdc1df6mr1119666566b.2.1774357545379; Tue, 24 Mar 2026
 06:05:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324121608.3444943-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260324121608.3444943-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Mar 2026 14:05:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV_94xOmqRqDKW_e740ckmRoyW+oaHvorphNg27JNKUrw@mail.gmail.com>
X-Gm-Features: AQROBzBJaCVgwv-vRbaayLKwJjAAqLez24emj_-XOEZTvNken81UxnWww_VtevE
Message-ID: <CAMuHMdV_94xOmqRqDKW_e740ckmRoyW+oaHvorphNg27JNKUrw@mail.gmail.com>
Subject: Re: [PATCH] phy: renesas: rcar-gen3-usb2: Simplify ID/VBUS detection logic
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Pavel Machek <pavel@nabladev.com>, linux-renesas-soc@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-30169-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,linaro.org,gmail.com,nabladev.com,vger.kernel.org,lists.infradead.org,bp.renesas.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,nabladev.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,linux-m68k.org:email]
X-Rspamd-Queue-Id: 9E413309484
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Prabhakar,

On Tue, 24 Mar 2026 at 13:16, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Read the USB2_ADPCTRL register once in rcar_gen3_check_id() and reuse
> the value instead of performing multiple MMIO reads.
>
> Simplify the return logic by comparing the IDDIG and VBUSVALID bits
> directly. This preserves the existing behaviour while improving code
> clarity and avoiding redundant register accesses.
>
> Reported-by: Pavel Machek <pavel@nabladev.com>
> Closes: https://lore.kernel.org/all/acJV-Xq-2uq_JFMn@duo.ucw.cz/
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -314,13 +314,14 @@ static void rcar_gen3_init_from_a_peri_to_a_host(struct rcar_gen3_chan *ch)
>  static bool rcar_gen3_check_id(struct rcar_gen3_chan *ch)
>  {
>         if (ch->phy_data->vblvl_ctrl) {
> +               u32 val = readl(ch->base + USB2_ADPCTRL);
>                 bool vbus_valid;
>                 bool device;
>
> -               device = !!(readl(ch->base + USB2_ADPCTRL) & USB2_ADPCTRL_IDDIG);
> -               vbus_valid = !!(readl(ch->base + USB2_ADPCTRL) & USB2_ADPCTRL_VBUSVALID);
> +               device = !!(val & USB2_ADPCTRL_IDDIG);
> +               vbus_valid = !!(val & USB2_ADPCTRL_VBUSVALID);

Perhaps combine variable declarations and assignments?
The "!!" is not needed when assigning to a bool.

>
> -               return vbus_valid ? device : !device;
> +               return device == vbus_valid;
>         }
>
>         if (!ch->uses_otg_pins)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

