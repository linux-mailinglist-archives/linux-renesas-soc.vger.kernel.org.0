Return-Path: <linux-renesas-soc+bounces-9982-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD89A9AC0A0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2024 09:48:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EC6A284C9B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2024 07:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2BCF15573D;
	Wed, 23 Oct 2024 07:47:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE28C154C04;
	Wed, 23 Oct 2024 07:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729669669; cv=none; b=PJvSGT5AKGF4RHSUxODfnAr1/mVdm6y6w/aCsMMS+cgNScOl7iglrczNIrmVybnYcsJWURa+wKn6jhjG+zlskIucuyFidsJMZwhn09J5EjfRwoAUTtIldrmyh0TcavPVScMU1WtCjUjhZzPNHsEjHCM9aWRXp8dy0t6UgAtvYDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729669669; c=relaxed/simple;
	bh=hje37w5GlG4zb995G+tSIlCuLyDpD9klUquLHKvOjAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MJJmbwfLW/Z+n6aOX6JP//e+8MeZ4YY/ljwytgXK0yh1fGALmmwaUjAncYX7L5+fyGeGVefX7rPtBXnm1QQZ5qoWl0tXV7UMX4z3fFu265jPdxeGbNpiBzpZ+GaE51e0Y1yHYoE5lJq6RxMIxPXHD4iUBprhgv5G/+iZXGMlaBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e5ef7527deso38412227b3.0;
        Wed, 23 Oct 2024 00:47:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729669665; x=1730274465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bFGmSYy1t5GtQ3H3kIdCv+hqQA3VsubJAy/VDAQgpnI=;
        b=AVHFZvKzyuacO/1ACyK1eJAl0zwfEZei4xMaKxfIAzWcObR7dvjRdbFtz417BqroWY
         sWJ0TIwxocg3tU4iK3qYWImD+nN7tuOUFPC+hYfsVxxXKm2bMoclisi8eAmH0VQrOMCj
         zuCAs4li+UcY4iZJe79FYQDG1smCPbrfxDuyjfJ8pGEpjs8SGjOLxpmqpmGFyfEDOKP4
         38AOYz6BkmZME6dcGApe80klUUAH4WKIzy17yMvwcMJ1A9CP5o6jof11b9VDQbHj7MY5
         7sn0Sc3AEbRSlTtM5gRSweanVjP4hqHhwglkErYaaLl+/QGdx+8hh2IpHvHI7P65xm0w
         0+Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVban7mgLUoB3CE/bBsQznSpfE0cDZmBC+leD/DR0s/blzUP6oPD/TGpvqeshtZIGRtyJiNUaeijnsUubE=@vger.kernel.org, AJvYcCX1DVG+8l3HP4Xq8HUr6VeCYK4JMKH+eH+iXUMQpza9lKt2+qVW0akVhzYURjqp/Sf4heWrkzv0dB0d8yOqlEZ5HN8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzuu5RKZ8m4P0JkvFq7oe0iE3mD+/hrx/36HI2+y3cRnsWttv46
	k6wVQujBqGYaxhKPI4nidoOFOv5stWKkEYSM4EGpmOKlg2IsvPAi95TYX1Qr
X-Google-Smtp-Source: AGHT+IEwja2ail0XCsqXKKUoJvvIAc+pMZhHFtx5RHpZzGZBPxK6MegIfU3veZpg+S4Xgc5RAEyMbQ==
X-Received: by 2002:a05:690c:2c0e:b0:6e3:252c:408 with SMTP id 00721157ae682-6e7f0e41616mr11828657b3.20.1729669665364;
        Wed, 23 Oct 2024 00:47:45 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59fc68asm14155577b3.21.2024.10.23.00.47.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 00:47:44 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e5e5c43497so30320977b3.3;
        Wed, 23 Oct 2024 00:47:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWmfZvRtcTVCGx7sqd1TUPdKU/BgGI5Va6uFzj2Z3lxB81363C+9M5GLhZHjmUdfWJ5lxMgNmGWeXztehw=@vger.kernel.org, AJvYcCXokzTf9hPON0RvQIWfXntHayLW4gCyoEMblqu9MDYWicBejnAZ2I/m3apzPDlq57ahmGrG9RMsXwq5EJ60qP41gbo=@vger.kernel.org
X-Received: by 2002:a05:690c:60c6:b0:6e7:d974:8cee with SMTP id
 00721157ae682-6e7f0dbbfa5mr20504037b3.7.1729669663771; Wed, 23 Oct 2024
 00:47:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022201629.139244-1-rosenp@gmail.com>
In-Reply-To: <20241022201629.139244-1-rosenp@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Oct 2024 09:47:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU7_6oDv1DKMAeCMoGWkakBn_vHpHsyvpjzUF3iaoJ=+g@mail.gmail.com>
Message-ID: <CAMuHMdU7_6oDv1DKMAeCMoGWkakBn_vHpHsyvpjzUF3iaoJ=+g@mail.gmail.com>
Subject: Re: [PATCHv2 net-next] net: dsa: use ethtool string helpers
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Kurt Kanzenbach <kurt@linutronix.de>, Woojung Huh <woojung.huh@microchip.com>, 
	"maintainer:MICROCHIP KSZ SERIES ETHERNET SWITCH DRIVER" <UNGLinuxDriver@microchip.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	George McCollister <george.mccollister@gmail.com>, Simon Horman <horms@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rosen,

On Tue, Oct 22, 2024 at 10:16=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wro=
te:
> These are the prefered way to copy ethtool strings.
>
> Avoids incrementing pointers all over the place.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> Reviewed-by: Kurt Kanzenbach <kurt@linutronix.de>
> ---
>  v2: remove curly braces from rzn1_a5psw.c

Thanks for the update!

> --- a/drivers/net/dsa/microchip/ksz_common.c
> +++ b/drivers/net/dsa/microchip/ksz_common.c
> @@ -2113,8 +2113,7 @@ static void ksz_get_strings(struct dsa_switch *ds, =
int port,
>                 return;
>
>         for (i =3D 0; i < dev->info->mib_cnt; i++) {
> -               memcpy(buf + i * ETH_GSTRING_LEN,
> -                      dev->info->mib_names[i].string, ETH_GSTRING_LEN);
> +               ethtool_puts(&buf, dev->info->mib_names[i].string);
>         }

This location could benefit from a similar change.

>  }
>

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

