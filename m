Return-Path: <linux-renesas-soc+bounces-10929-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B109E46DF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 22:37:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 446A0B26E0B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 19:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABA1C1B4130;
	Wed,  4 Dec 2024 19:21:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479AE24B26;
	Wed,  4 Dec 2024 19:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733340064; cv=none; b=GJtllBfIO7+uNqSOwXikrJc7pb0uN9SjxtwNSCLQ4Cc3x9itg/Q/rulR+Et912AEQDnjetfRtFGtCpmeUM+KGLhXENySUzq2ByU6yP54fxuTGtHebgBk2+Z2+uoesbAGsG5YFb+Q/MAYkemmM5OUTv1TSY7YkY2ilCNW82VI8QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733340064; c=relaxed/simple;
	bh=rYhegL9//2A2bkxLAO5La3avhpkdVv+Y03oZNvQdDP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bc6zr5E7Oi7fiXFSE4iASTjfoGtsEfOoKzES0DHnClSFtpiw6hKNa7+CU3j7Ua5QbMHJ01uk24+4iiN+FNj3BwGJACOzP9hjd1lViOCALq6F3xGjX2FY1ad3vGtCGHdcbomEFeBfGAGoOCKh0JT9Px/TevFNFsPgyra60malhfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4afab735b6cso19566137.1;
        Wed, 04 Dec 2024 11:21:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733340059; x=1733944859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=inT4fZZhlTH1i9AqeiQIOnUqbVGNn3i6ScA8tNJSX0o=;
        b=rrkn7jUWaqqnkKTtqBrX2IvTkz2PXyTF6diWFK/ct9Y/JCkB9aGR4NxsDm9N1tjhWH
         LK/5vYPXyj+H9d2rFS7c9OnD3i2vb/Utc6YbNbxo/hne5ZoB2os3AT7huJEQaz1UK90y
         Plvb+/JrJIOSNoQ5ITLetg7kXXJrOdcRCiLdbTMZgCwkwCmuVe1fX9ONszOzBJKsYgfJ
         oDGE/2V9mK4F7uauuhmLm0U/zkLHXTa6yf4M0+aYMSQLrncR04/0gCmfB7nkCeZohelt
         DYZOB5XuWcTJEkHMPv3qiwB7bv9+dQnVxyC/MAPOiMp3oC/7pNWl3Fv6d2p2bRlADbPX
         DI3g==
X-Forwarded-Encrypted: i=1; AJvYcCUXPoLigzQVvMSJvZvtbyCTlnGX0n6x2+jHvE9ZHqM+WtVLYBf2F0PSmB1fy54gTbuw42EycCeDdL6I@vger.kernel.org, AJvYcCVYOvfRoh4+L2p2C608m268ImPoyUHN9BOBntDnicmP6YDKM5i+qfobTTrJCBHEOPNtXRuzY1wqzax+PnPS@vger.kernel.org, AJvYcCWNWEPbx+4YvN6NVpCRio1/h9/h9X7joyDkxdnCtmXNyDeDmrd50ffFQUgxYPlJniFL2fqBpyTQ2540@vger.kernel.org, AJvYcCWn4nV109sYQJVkhMIr4yhccoDMOLyVOW2P2UvV8JkAOGwaxX962wSv3clAF0VZXl7xmiJcbeKh9JE72DeFlbmClXI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUf8ZUjpNXEpQhBMpqjIdMFOwdBRgbR6Yhat04VYhRCovp3pw/
	qLAQ9jcOQkZ546naGU0W5GXWDtkLS+LdtF5aEbRG7BGGWK+XrMszz+LZh1dY
X-Gm-Gg: ASbGncu3p6Wu1R6PTbBHvAyr24hB4aDkf32XNPwAVmsAl2rSjqwmkKLzMQEQxZXyEvy
	kIqZLA3LQbyr3UnFwkaLMKNCwUWjiOggeZ4a8FAr/WYeC8f4/edBseopk2WeCneaLcVQjUwsyUY
	OYMvqBV+Go4oml8RxTn7X9si6iLdmBGcvJLXlSLll0YbvrqxwHTGHWnHP+tvznavfg/W7kJ4ioa
	/ygag2fDG4WKipwzRFwW1yqYX64ZKTrEFySCkqXCWoIrtC6AOl6Akq9eJHj9q0O0y8p+Snbp31i
	SbTrcpVOCZKV
X-Google-Smtp-Source: AGHT+IEEIZ8CorMuYzHXaNNDh4cSOaq176oWOIGGNawbSdY8MvMyxV6s4iJqrQL2TWN1aWVXKhUqVw==
X-Received: by 2002:a05:6102:3f53:b0:4ad:de0b:fe11 with SMTP id ada2fe7eead31-4af97375fe1mr11646918137.17.1733340059620;
        Wed, 04 Dec 2024 11:20:59 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4af9d9d123bsm514620137.5.2024.12.04.11.20.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 11:20:57 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4af4575ec4cso15593137.2;
        Wed, 04 Dec 2024 11:20:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUPrrvZ8v+6dfnyZKo4pWLdfNW7h7MV8OuCzV8XtjwuFLEIBpoLITAVB3ZJWfjQR0z0okdEjvuz5ftd@vger.kernel.org, AJvYcCUZpo6TKX9cgxUAGbf0KOQlo9+u19Rh00BlwO0lDQuhA47/hCX6lrvHiTjw6GVJJIr50SSIQTIlxHkFW04V@vger.kernel.org, AJvYcCUkj812aZHMW674kbnLGjZBDuAdh0pphw11QDE7UHj2EI67e+TlnwqbuaC/MiJonr0DBF80ZOY9luqPY1o2aowmuQ0=@vger.kernel.org, AJvYcCUz/hv9SWDFCfR44n6VBDZHTfDxnwjdXN651PuDbPGARcZitfpb9WyiFrcPko2iWUwdsf6+gyqyoi1D@vger.kernel.org
X-Received: by 2002:a05:6102:3054:b0:4a4:8d45:6839 with SMTP id
 ada2fe7eead31-4af97268516mr11708144137.13.1733340056024; Wed, 04 Dec 2024
 11:20:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
 <20241203-rcar-gh-dsi-v1-8-738ae1a95d2a@ideasonboard.com> <20241203093703.GL10736@pendragon.ideasonboard.com>
 <b9a07779-34c3-496f-ac04-d7f6e1e61d82@ideasonboard.com>
In-Reply-To: <b9a07779-34c3-496f-ac04-d7f6e1e61d82@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Dec 2024 20:20:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWa0frtVLJcoz7QRe=ZHa24K9MxyV5-_Ce4AUJo+LDEGA@mail.gmail.com>
Message-ID: <CAMuHMdWa0frtVLJcoz7QRe=ZHa24K9MxyV5-_Ce4AUJo+LDEGA@mail.gmail.com>
Subject: Re: [PATCH 8/9] arm64: dts: renesas: r8a779h0: Add display support
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tomi,

On Wed, Dec 4, 2024 at 5:04=E2=80=AFPM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> On 03/12/2024 11:37, Laurent Pinchart wrote:
> > On Tue, Dec 03, 2024 at 10:01:42AM +0200, Tomi Valkeinen wrote:
> >> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >>
> >> Add the device nodes for supporting DU and DSI.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com=
>
> >> ---
> >>   arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 77 +++++++++++++++++++++=
++++++++++
> >>   1 file changed, 77 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/bo=
ot/dts/renesas/r8a779h0.dtsi
> >> index 12d8be3fd579..82df6ee98afb 100644
> >> --- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> >> +++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> >> @@ -1828,6 +1828,54 @@ csi41isp1: endpoint {
> >>                      };
> >>              };
> >>
> >> +            fcpvd0: fcp@fea10000 {
> >> +                    compatible =3D "renesas,fcpv";
> >> +                    reg =3D <0 0xfea10000 0 0x200>;
> >> +                    clocks =3D <&cpg CPG_MOD 508>;
> >> +                    power-domains =3D <&sysc R8A779H0_PD_C4>;
> >> +                    resets =3D <&cpg 508>;
> >> +            };
> >> +
> >> +            vspd0: vsp@fea20000 {
> >> +                    compatible =3D "renesas,vsp2";
> >> +                    reg =3D <0 0xfea20000 0 0x8000>;
> >> +                    interrupts =3D <GIC_SPI 546 IRQ_TYPE_LEVEL_HIGH>;
> >
> > The documentation lists this interrupt as being LevelSensitive and
> > Negative. I wouldn't expect the VSP to work at all with a wrong polarit=
y
> > in DT, so the level may get inverted somewhere.
>
> Indeed... It's the same for V4H. And it also has IRQ_TYPE_LEVEL_HIGH in
> the dts. I tried changing it to LOW on V4H, but:
>
> genirq: Setting trigger mode 8 for irq 91 failed
> vsp1 fea20000.vsp: failed to request IRQ
>
> I didn't dig further yet.

Yeah, I don't think the GIC supports anything but IRQ_TYPE_LEVEL_HIGH.
Which brings us to the two ISP nodes on R-Car V4H and V4M, both using
IRQ_TYPE_LEVEL_LOW.
Niklas: looks like drivers/media/platform/renesas/rcar-isp.c doesn't
actually use the IRQ, so I guess that's how this could slip in?

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

