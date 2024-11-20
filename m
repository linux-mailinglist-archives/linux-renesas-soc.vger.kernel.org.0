Return-Path: <linux-renesas-soc+bounces-10632-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 573F89D37B7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 10:58:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0CB41F22DB9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 09:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B67419DFA2;
	Wed, 20 Nov 2024 09:56:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331DE19CC31;
	Wed, 20 Nov 2024 09:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732096595; cv=none; b=qkP7qGxJGMwP67SKIng1EzawOdzLOgEZ7yXnzRHYSB/Kmeq05v8XF5lbcfrBk5n15GZU94pOSMU5TbFt28zt5dYZpmTCRGbn1f2GdoTWHuxvLVfBqNkt7TNf2xpO9IqgbprVTP0IWbx5YzX9rhfM+UxjdOuwQHrMO/I96fBgCMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732096595; c=relaxed/simple;
	bh=/VnuBJlRoD7yGW7Ah3qj7m0/3CiNQpz09NWLnjiF2pA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rCHqkUw7EdljGYnvRajUyagNGtiXGwrJVeLwWVdJDRErTge5qU2pKYXpdAcrydiIKcMQGZu6pTDvdgk5vNxB0zjWUGt7OejEnDD6N/UNosRocecz3mVesd6JR1XN5842cknhFGPzMlqaoriSoVexCpRkqWF8facH54ISPv7XFHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6ea053b5929so32294987b3.0;
        Wed, 20 Nov 2024 01:56:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732096592; x=1732701392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QGnnuWLft9gPt9iQid5eRFtLRo666jTs1KuWBf79PQU=;
        b=on8lmLGZHtKyg1FQi5URYwfK+ATUkbWX8UeHQQlJjolm1+etmvLGqZfD9VV6kdWX+b
         JXjdifswObao8wHKB5MZ2hx2psvnoKJRV8+zDOFoZOB3xjRt01ykybrSMqb0oeDBUz5u
         gumT9MDMB6NfkzhrXApNQ/L7KpEIY9DCORuYK+WGtVVzHNNPVWRoh+lhIn40fFKnSt6x
         5m9fGt6igP2bW+W7szqiDXD2d0N8UOE73zHScRR8Y4qZZ1ZgU35unCQ3GBRryhUvlDO4
         kSsSah2M6FTOEZUy6EuoZogvlWXAl407CMevvuU08WIXdnHI16y05cvYlh/4kLdzsa75
         uOgw==
X-Forwarded-Encrypted: i=1; AJvYcCVK2QXtwhc1yQHH1mdGI7YJGZiPIi0pKVSkKxu25xboz+IniihtzjNjsW2OO5ARcTfQKYpsPsFeI9o5nXg=@vger.kernel.org, AJvYcCVVHf2vlxgGpsSV2zjw75uQakQCNJhG9Hr9f+T21EectVwLz0cOwr98b8wb6XJ3n9z1cxLuoZ6J9pjkUZHpwaqCxxY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3hRLVJZVLDwgaOi3EVq+5CeEjDqzL0XxpWnU33FrY86sByCZ9
	8Yk5OcwfRRec303Loe2M/gpdHS8Jg7uE0E4ipx7nP7eMIYijyPOS4noSGa/u
X-Google-Smtp-Source: AGHT+IGdELDX891XBdgSIcMQqTMRH3y63upDtDsXPtGVqYrM8/E3os/YupsPLIiedSUG9Z2HaPJwEA==
X-Received: by 2002:a05:690c:6a02:b0:6ee:8363:96d3 with SMTP id 00721157ae682-6eebd2a5d1amr19184937b3.27.1732096591736;
        Wed, 20 Nov 2024 01:56:31 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ee71278542sm21816907b3.24.2024.11.20.01.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 01:56:30 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e2e41bd08bso48943807b3.2;
        Wed, 20 Nov 2024 01:56:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVJoGB8Ji0vhQMtrTCy3DyBrrzCDLzEzZJThwhlwjumrmO0v0siqQfWx0WNVoPIfwYRU/UgR/U4mQynEHg=@vger.kernel.org, AJvYcCX5VSMhdu6M9yZ29J3xrsW56p616FW8pLyzm0Hdld9I6538IcVLkPPNuXDGVh5Xph4cqs07yhHZdLdbAwB5okU/GwU=@vger.kernel.org
X-Received: by 2002:a05:690c:3391:b0:6e3:bbc:338c with SMTP id
 00721157ae682-6eebd0e6530mr23720667b3.6.1732096590401; Wed, 20 Nov 2024
 01:56:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241108160717.9547-1-00107082@163.com> <4ce18851-6e9f-bbe-8319-cc5e69fb45c@linux-m68k.org>
 <5ed0a36f.1698.1934737447d.Coremail.00107082@163.com> <710d6832.1f29.19347541394.Coremail.00107082@163.com>
 <CAMuHMdUGt-8onJqKbai9Uc+Vb-YHXKx_ggMqyURJp5btuf1v_A@mail.gmail.com> <613460f0.9d25.19348ee14f1.Coremail.00107082@163.com>
In-Reply-To: <613460f0.9d25.19348ee14f1.Coremail.00107082@163.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 Nov 2024 10:56:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVpCFzXD-OFydjhgD3J4kdJKO5BeK6nCf77gMVE=V_GTg@mail.gmail.com>
Message-ID: <CAMuHMdVpCFzXD-OFydjhgD3J4kdJKO5BeK6nCf77gMVE=V_GTg@mail.gmail.com>
Subject: Re: [PATCH 01/13] kernel/irq/proc: use seq_put_decimal_ull_width()
 for decimal values
To: David Wang <00107082@163.com>
Cc: tglx@linutronix.de, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Wed, Nov 20, 2024 at 10:36=E2=80=AFAM David Wang <00107082@163.com> wrot=
e:
> At 2024-11-20 17:00:38, "Geert Uytterhoeven" <geert@linux-m68k.org> wrote=
:
> >> Several drivers use dev_name as format string for seq_printf,  would t=
his raise security concerns?
> >>
> >>        drivers/gpio/gpio-xgs-iproc.c:   seq_printf(p, dev_name(chip->d=
ev));
> >>         drivers/gpio/gpio-mlxbf2.c:     seq_printf(p, dev_name(gs->dev=
));
> >>         drivers/gpio/gpio-omap.c:       seq_printf(p, dev_name(bank->d=
ev));
> >>         drivers/gpio/gpio-hlwd.c:       seq_printf(p, dev_name(hlwd->d=
ev));
> >>         drivers/gpio/gpio-aspeed.c:     seq_printf(p, dev_name(gpio->d=
ev));
> >>         drivers/gpio/gpio-pca953x.c:    seq_printf(p, dev_name(gc->par=
ent));
> >>         drivers/gpio/gpio-tegra186.c:   seq_printf(p, dev_name(gc->par=
ent));
> >>         drivers/gpio/gpio-tegra.c:      seq_printf(s, dev_name(chip->p=
arent));
> >>         drivers/gpio/gpio-ep93xx.c:     seq_printf(p, dev_name(gc->par=
ent));
> >>         drivers/gpio/gpio-aspeed-sgpio.c:       seq_printf(p, dev_name=
(gpio->dev));
> >>         drivers/gpio/gpio-pl061.c:      seq_printf(p, dev_name(gc->par=
ent));
> >>         drivers/gpio/gpio-visconti.c:   seq_printf(p, dev_name(priv->d=
ev));
> >
> >In theory, yes. But I guess it's hard to sneak a percent sign in these
> >device names.
>
> Yes, it is just theoretical... (Would be a wonderful story if someone man=
age it somehow :) )
> Anyway, I send out another patch for further discussion.
>
> >But given the above, all of them should probably be updated to print
> >an initial space?
> >
> Oh, no, I did not mean to adding leading space for those in irq_print_chi=
p()
> I mentioned those just because of the format string thing.
>
> Add leading space in those irq_print_chip() is kind of strange...
> With Thomas's patch, irq_print_chip() needs not worry about the leading s=
pace issue.

Sure, but there's still a slight misalignment if you have multiple
irqchips of different types:

153:          0          0 GIC-0 300 Level     feb00000.display
155:          0          0  da9063-irq   1 Level     ALARM
183:          1          0      irqc   0 Level     ee700000.ethernet-ffffff=
ff:01
184:          0          0 GIC-0 197 Level     ee100000.mmc
185:         52          0 GIC-0 199 Level     ee140000.mmc
186:          0          0 GIC-0 200 Level     ee160000.mmc
187:          0          0  gpio-rcar   6 Edge      ee100000.mmc cd

I have just sent out a fix for another preexisting misalignment on ARM
https://lore.kernel.org/96f61cafee969c59796ac06c1410195fa0f1ba0b.1732096154=
.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

