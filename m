Return-Path: <linux-renesas-soc+bounces-9961-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 881DF9A9B0C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Oct 2024 09:30:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 298AAB20FCE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Oct 2024 07:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7ECB14D6E1;
	Tue, 22 Oct 2024 07:30:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18200142E9F;
	Tue, 22 Oct 2024 07:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729582254; cv=none; b=JMLjEXTyw/2lHtwNPTWzbYQyJPgxqNBx1hDRnItLmMPhfhMUOHGQrSrRvK59U60fHh4c0QZ7EIZUIIbKG5LTShUqVtfnBZ5+97I3fGTxsevPkPoBq/2BonmGS1ntHeqxPG1auiFDTHIjkGWNTFLMyeKXkvaqLrVydTMJM/w2EEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729582254; c=relaxed/simple;
	bh=LCCgvALBtVJtoQAVEBfKrxNBsvLpoL4jYbU/bNJVzKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J6RY3V8CgGmor0nYwP3tYetU4UMLEjj5SY+tswKqEZBRvwFU8g/HqSmjQPMfhu8kGF7C6CNmwgwomUL6EfIdFIXuML1ioOXZy4WieVviM9dNQ2oc/KXbJj+/aJ51Qh57aWgtje/GBw4b6I59zMynKM7L1AtxWGgmOcXvH+PDO1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e28fd83b5bbso5247249276.0;
        Tue, 22 Oct 2024 00:30:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729582251; x=1730187051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HwVqq851J3GCQKvQLMtlo3IDhb4HTESD1/H77NNSSlk=;
        b=HaHZz6DafardEkRCKIxJ/SvzpIQwCOXonGoZ964g2USBhEQsfnMo5cz4j5UtxsccsY
         De835jeTmT3kQg0ivMn9vpaS44A9tSeN+W8Qb9NxuzSuHd1Hk+UxgoacPg2rX2I46OS7
         uPsVkSitqGvIqWXsq+30DHnepAFRzVW62DY0BLw/WXcrjO5ZFo6PF6SJrPHssv9WOOhe
         4hgc/vFBEI5QsLeqaejk77hO5g/Ri3t28v9t+LCda7QeUdvZdLbg2t2iOFZOT1dGrpaH
         9SFdbU85uYA7tjq1I7+0C65mp5okZfjNutvzJV9DfnZmL9b5gi4Zu5sF7aqeLuRWscar
         8yzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBJdJxQ11OMKufRWqW1y8r9fk9gB2QWnaRE2O0WN1KtRlBmTOfzSrbBPcVRy4+EmXpdeNBq/3hYwAG8s21wbQB5i4=@vger.kernel.org, AJvYcCXBsJN6KbKggWJ/WayZPyhMOqMajeKYY8zPjITbQM1Ek+FuDsAlpYZswK9+VtuY1mFOeKeKs0xmWO0NPAw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyc2+GOQk0NF/LB/MAJp2YnRrW14OgPnMZ2Rz/OgjD4Dh9TJ1N
	O8Xgg/wGI/UG46ooN2IHWH71KupSwjzoKqy+lv2quVdU7w6wk7L8n8aH7KW7
X-Google-Smtp-Source: AGHT+IGYz3TNvwFYbviUtlfL2p16+NnfVagkeM+ZAxeRFNLU607TSq/jPZCPE5umPx2aUAbaxfRQTw==
X-Received: by 2002:a05:690c:eca:b0:6e5:d1df:af with SMTP id 00721157ae682-6e5d1df1541mr105077447b3.4.1729582250916;
        Tue, 22 Oct 2024 00:30:50 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5ccb75fsm9848627b3.90.2024.10.22.00.30.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 00:30:49 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e5a15845easo46060017b3.0;
        Tue, 22 Oct 2024 00:30:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4rzm/TO+rzf9zGBkXw70EULjj4yKWu5Jkmmw/eWX+K+JQmfxClzLc8uD/bnTh3NGOjgApHoLnG2uzgkc=@vger.kernel.org, AJvYcCWHUxJy1aYlA5zp0Q1SaGnj3U2PMWw7bvFQlHtg9jJj763xtsrySGRBsrNgIvXZvGmBAhmPksJkhF9xd3DnAixDeIo=@vger.kernel.org
X-Received: by 2002:a05:690c:6186:b0:6e3:3227:ec64 with SMTP id
 00721157ae682-6e5bfc0c79dmr139997027b3.35.1729582248743; Tue, 22 Oct 2024
 00:30:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241021235535.603253-1-rosenp@gmail.com>
In-Reply-To: <20241021235535.603253-1-rosenp@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Oct 2024 09:30:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWgJJngTnhB8dFrEH-19br=YmQJgZNnv7S9HffMqDZfWw@mail.gmail.com>
Message-ID: <CAMuHMdWgJJngTnhB8dFrEH-19br=YmQJgZNnv7S9HffMqDZfWw@mail.gmail.com>
Subject: Re: [PATCH net-next] net: dsa: use ethtool string helpers
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

On Tue, Oct 22, 2024 at 1:55=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrot=
e:
> These are the preferred way to copy ethtool strings.
>
> Avoids incrementing pointers all over the place.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Thanks for your patch!

Only looking at the Renesas RZ/N1 driver...

> --- a/drivers/net/dsa/rzn1_a5psw.c
> +++ b/drivers/net/dsa/rzn1_a5psw.c
> @@ -803,8 +803,7 @@ static void a5psw_get_strings(struct dsa_switch *ds, =
int port, u32 stringset,
>                 return;
>
>         for (u =3D 0; u < ARRAY_SIZE(a5psw_stats); u++) {
> -               memcpy(data + u * ETH_GSTRING_LEN, a5psw_stats[u].name,
> -                      ETH_GSTRING_LEN);
> +               ethtool_puts(&data, a5psw_stats[u].name);
>         }

Please remove the curly braces, as they are no longer needed.

>  }

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

