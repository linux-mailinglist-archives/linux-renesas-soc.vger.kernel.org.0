Return-Path: <linux-renesas-soc+bounces-12368-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 94482A1A001
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 09:38:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FA823A50D2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 08:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9E5F20C033;
	Thu, 23 Jan 2025 08:38:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0F320C023;
	Thu, 23 Jan 2025 08:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737621527; cv=none; b=FqFRXrBcbSEuFfXRKyjBfYhATQPiY47DgUofi0irBjOEEOUS7J3O4Cw7wnLqCboQIejBTcSDJEHyhPuCgdXEglAGZlZ7wc+Iuleq72QILvmxRAuHd7LZEAa9DLMZgQHAnBN1UpWR4e0BQS0O5DboZEzKOGm+ViMlZPy0AxKM+ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737621527; c=relaxed/simple;
	bh=MgRruCyZIpg1hbNzgzKNaagVQSI1te/n2s5cZA2cKv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pYvXQKmFq6PsjlZvDOoykqLKAvDFMJgwtKywFuACB/sOT8A2Fvg5AUxRj55CDbKifpKU9zeMSDSVMR9Fh9z3kxFwzUcylkzWvgH5+WmfASfjrio8/MaE13dih7RI0VnbRPgRHxJEYmlMVdt/6nOCcOCo1reo/clL7O94Xg+7hHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4afdfd3124dso180122137.2;
        Thu, 23 Jan 2025 00:38:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737621524; x=1738226324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mwQHsW4zwmLnjFYZmDHAoZyaz6EGWkjalGwPU0GkznM=;
        b=skRyHmfaX/3rMo/QMxcZfe31XD9OmIGnheDManOhi5obr4ZBhepqlfaLpLuWgxxQnU
         c8WHk55e4/vl2LFxKcduuYthB5fB7x2RyTYNRGdzmbFV/OSq1GkPyBZWbC70h6BbGcSe
         wKXwi72fFhHDZLqvVtZPMTtsTo38kXiHNgqOUGtIs9f8ImQTySXmUY6+YLkvlcGP4ICe
         N1Yh1V3weNactjZu8OTsrdlQnjWmMHR33NlbN23uJreLjVzWisU9I5dtgGK3uM9zWMxR
         GpT/lSPcvSW2MkbIn+3c1EFOzWpmFSYqGolqovwQrYpmD2LeWVJ3lt+1vVD7p6FN/Vv1
         TBQw==
X-Forwarded-Encrypted: i=1; AJvYcCU7bT/MQBbu7HLUXj4zceQTQXbgQRnB/x9+xVSgA/24Oy6k2q55NHSZNBf12fS7EeTmIJOLvARWhQoM@vger.kernel.org, AJvYcCUNp2uqKNGWrVJL63SO0W+Xv4rzKKUMTQTh7z3czZYE6DaLx3HlmgplbAvWuGhRk03Q5qb71gcbeVRhd7w=@vger.kernel.org, AJvYcCV4eLN5XmY6bfdesW/PeJNHLbYXnn9hroimi9OGtezGAGySQlaWJkVw0WRz7PISQHyPIRk/pwsYMMt3fF3K@vger.kernel.org, AJvYcCVgm8PKxNx1DgzHblbqMcTO2KJOoCfpoeCVUyeVQSjelcneW3SyCLjUc2Qxe58vP8e/YkUC2tOCw05hKP5fTg68QxY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz10Ct+VaK09gF9MTeU69aL62xCAYkyZEm8ErSIgENNQmTlFE8+
	yWnPLM2r5y59fjsiDNHomfcCrv66/lPJXFpvq64w+s8k+ngXuHZZjcJBKoMj
X-Gm-Gg: ASbGncsKHI3kvERB/o1H/knD6DFV5ngegQGNdIMe7rFscU9DJs+9G07xqkA1AxET6wj
	TQjvijTLnmg2hFSM2yR5DSv7y/uSLgdqs+vbp1WGnV+AFZqbBtVU2WM8kb1vVQOk79y/hHoCINZ
	TzOWfrruhKEaVF+WZLKPvbCZKoBSXC8gCic6FmJfumcH8b6SHcegb4BKJnu+ho1i0SkJmC6++SI
	usLm0MmnLSARZJPMQUXFqoIeAWRgaC4UVwkwjSm24MHIHFcrHjsJ0hx6lgJAx/1vmyY4axWoE6z
	6xHeVDyQQNnQXYsPQHn/0pEWK1ImuMMwxgKZH5sb1IPTjeI=
X-Google-Smtp-Source: AGHT+IFdpDkGm0xkEAAJKxaSQwlecO+O6PouOTcvg8n2/rojfW6rrTQaUzrPkdOd2nCgb0RD9+fYwg==
X-Received: by 2002:a05:6102:5486:b0:4b2:5d10:2cc6 with SMTP id ada2fe7eead31-4b690bbbc2emr18524414137.6.1737621524175;
        Thu, 23 Jan 2025 00:38:44 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b68a3191f4sm3063397137.20.2025.01.23.00.38.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 00:38:43 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5187f0b893dso217338e0c.3;
        Thu, 23 Jan 2025 00:38:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVYEsOAd0a80ciVDFy90x1o9lon+uLzLIPLiSZD1Nr7K1t1ALwtQLipuUNGYl/3acZAmG7jbE1ptxOG@vger.kernel.org, AJvYcCVYdJ+dpSPxuK86a+G6wdL7z+5MhkeqnBcr9Q+ITA1KyTiRT3DbT5+iT2t8FEWACw5kbnPaJrTyBtRoMQoYSqXJszk=@vger.kernel.org, AJvYcCVppp+ZSvyqLPUsfO2/BpXBJ2G/ZpFwyePzGIsnEbDaCitC6cR4uJ95LlbpsLBL2az58/40kOJFce6U9D0=@vger.kernel.org, AJvYcCWTvR8CBHqs9k5/X97GjL1CW6nBlM7NgHzMv0X0WOkO/dPGpGOenGikDlbScURNUVZ3lAtuzM/9S/aZOvtZ@vger.kernel.org
X-Received: by 2002:a05:6102:570d:b0:4b6:d108:cac1 with SMTP id
 ada2fe7eead31-4b6d11811f8mr11475580137.9.1737621523558; Thu, 23 Jan 2025
 00:38:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <db10e96fbda121e7456d70e97a013cbfc9755f4d.1737533954.git.geert+renesas@glider.be>
 <87wmem76u4.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87wmem76u4.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Jan 2025 09:38:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWpxKgSGGJb9Oy4Bzy7y4zPxVve=0_mCWE0G1d4njCJ+A@mail.gmail.com>
X-Gm-Features: AWEUYZlhVs-YS2W8tu6wHQ2P2ZBc9pMgHx0iSkPnWdB8Tka2A9Xe1rKavB5lPTg
Message-ID: <CAMuHMdWpxKgSGGJb9Oy4Bzy7y4zPxVve=0_mCWE0G1d4njCJ+A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: soc-core: Stop using of_property_read_bool() for
 non-boolean properties
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san,

On Thu, Jan 23, 2025 at 12:43=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > On R-Car:
> >
> >     OF: /sound: Read of boolean property 'simple-audio-card,bitclock-ma=
ster' with a value.
> >     OF: /sound: Read of boolean property 'simple-audio-card,frame-maste=
r' with a value.
> >
> > or:
> >
> >     OF: /soc/sound@ec500000/ports/port@0/endpoint: Read of boolean prop=
erty 'bitclock-master' with a value.
> >     OF: /soc/sound@ec500000/ports/port@0/endpoint: Read of boolean prop=
erty 'frame-master' with a value.
> >
> > The use of of_property_read_bool() for non-boolean properties is
> > deprecated in favor of of_property_present() when testing for property
> > presence.
> >
> > Replace testing for presence before calling of_property_read_u32() by
> > testing for an -EINVAL return value from the latter, to simplify the
> > code.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> (snip)
> > -     if (of_property_read_bool(np, "dai-tdm-slot-num")) {
> > -             ret =3D of_property_read_u32(np, "dai-tdm-slot-num", &val=
);
> > -             if (ret)
> > -                     return ret;
> > -
> > -             if (slots)
> > -                     *slots =3D val;
> > -     }
> (snip)
> > +     ret =3D of_property_read_u32(np, "dai-tdm-slot-num", &val);
> > +     if (ret && ret !=3D -EINVAL)
> > +             return ret;
> > +     if (!ret && slots)
> > +             *slots =3D val;
>
> Looks good to me
>
> Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you!

> If my understanding was correct, old/new code should have same behavior.

Indeed, that was my objective...

> But because of the original code, new code looks complex for me.
> The case which this function return error are
>
>         (A) if property does not have a value
>         (B) if the property data isn't large enough
>
> I think "DT checker" will indicates error for both case ?

Correct, of_property_read_u32_array() would return -ENODATA resp.
-EOVERFLOW.

> If so, we can simply ignore these 2 cases. Then, the code will be more
> simple
>
>         ret =3D of_property_read_u32(np, "dai-tdm-slot-num", &val);
> -       if (ret && ret !=3D -EINVAL)
> -               return ret;
>         if (!ret && slots)
>                 *slots =3D val;
>
> I think this should be extra new patch (if people can agree about it).

That would be a change in behavior. Probably it would be fine for
existing users, though, as no existing DTS should cause these errors,
else sound wouldn't work.  For a new DTS, it would silently ignore errors.
You are in a better position to make that decision, though.

BTW, is there any specific reason the code always checks for the
presence of "dai-tdm-slot-num", even if slots is NULL, and the result
sn't used? I.e. would

    if (slots) {
            ret =3D of_property_read_u32(np, "dai-tdm-slot-num", &val);
            if (!ret)
                    *slots =3D val;
            else if (ret !=3D -EINVAL)
                    return ret;
    }

(perhaps dropping the else, as per above) be acceptable?
Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

