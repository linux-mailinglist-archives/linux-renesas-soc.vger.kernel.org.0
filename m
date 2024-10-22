Return-Path: <linux-renesas-soc+bounces-9962-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DEA9A9B3D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Oct 2024 09:39:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 218E42807AF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Oct 2024 07:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2482B14F9E7;
	Tue, 22 Oct 2024 07:39:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF9213D882;
	Tue, 22 Oct 2024 07:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729582752; cv=none; b=kJoAG7YQ6ujd7HwBzDDifRX2giaMZ4od8eljJCK2XoPTkGYDPjns7xrfCO+RLATEtIB4gajDMi74guJPGEE7T6BDTjiGwlc+e5tyJMg/qa3+f/5CazplCFpFMPyqK80cl2+8IAqlYKVWEqi5HulPMSI55tiDVeNAYBKhGlQgWm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729582752; c=relaxed/simple;
	bh=Ikm13DpJkWGybjKwMgPWan+NZEi+FDDxCMEwIYjZme8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GtjjNo5TtCd4kiGbmg9NL6+WjdEGHq2dcblKf2lr83CxUD/aDsvets28dryAGucIbHEy9rGltfbArf1iihohhWGwo1uQzz+v8FGdFEhqHKhjjoIIbWgOWi7/IsNzgbAsxyKscXACF3RtXa2IFmunZS8ERIUiH1av+Vn+8vgG3zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e290d5f83bcso4785419276.0;
        Tue, 22 Oct 2024 00:39:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729582748; x=1730187548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JD8rI0o/+MxBekDfHEFiHdt2uGE4wyA7esrBVKYniH4=;
        b=DLljbUb1a3Dz0PU40sfG6cpmub3we82GRW4tpMxJ/YOJuxO+58QqKsG9wXGOvdFgsM
         vfc7fp+vZusqMuEmUzfFYjayeubOyqGfrpKJsUPUkpQJlZ1ZtePiAVNlPSKPrGLLY+Xa
         wLJbMAOLQKSiztH8wTInCd2EeNUZ1SqXxPBF7f4JPfZLcS828/+70ru80VzXIGvUDkb/
         e0VixL9tfLa+UOPJrbHoJReO5GkOGSF/YsUtHB+cMukLvkL2BLXEOV3kEmhv1acZeYSR
         6WOgcZ0VEKpGwI0EQyapFT9Cub8w/9PR2gRqrJZw2nzbNBojqaoQPtOB30n0una/s5lC
         HySg==
X-Forwarded-Encrypted: i=1; AJvYcCWblEKRwM8qK8iWdDkaL4itgALmtk/GHouHklmR1GCgfyM3xHU3a8TRk1zZUzlyag3cy0WjLtQ/U/SF9xb/ef80e/0=@vger.kernel.org, AJvYcCXY1BypzIdGfM7sMyL+L93EcQaweNCzVG9UElRxgfsZQc/jIS7Mpj04AOF1apC9XbWBYtTurGJuSC0j@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0qJ+HfKVXe6Y5qk79HHKDUXN4+k+DlIKNuRHSs4QNWUcg4rmP
	dz71cprUTa9xGV8uadGf4WI0VNUoyRWF7s+NFhn32H/vfPaIHaAj6qSVd62Z
X-Google-Smtp-Source: AGHT+IHJp3fkssoLJw/z6Fxebpt7zbI6ja3hPThCz4NoAMZhkdqrRCEHbKeEiYGO+6ex3yYBnRbsoQ==
X-Received: by 2002:a05:6902:2512:b0:e28:6b10:51b4 with SMTP id 3f1490d57ef6-e2bb16c37fcmr11031555276.46.1729582748620;
        Tue, 22 Oct 2024 00:39:08 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e2bdc96ae00sm1024663276.9.2024.10.22.00.39.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 00:39:08 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e29327636f3so5208684276.2;
        Tue, 22 Oct 2024 00:39:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVY4DbG0odOBLn8u/e9ZQZEVmFeTJmpgQBRzy5PW6tCM8DvwYwKsZy9681s/rnHHU5AdU6wK/dMVInA@vger.kernel.org, AJvYcCVwQXJT3DyLDq2T1VU10jR94Adk7y4XLBfIm4/BnPiSQDLz+FNcBL2o29gATgBhuTTzFiaFSJpfXmg5y2mq+b4qydM=@vger.kernel.org
X-Received: by 2002:a05:690c:39d:b0:6e7:e3b1:8cc7 with SMTP id
 00721157ae682-6e7e3b19d2bmr4479407b3.22.1729582748107; Tue, 22 Oct 2024
 00:39:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240704152610.1345709-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdUZAVAkPVus2T_O3sWT7f1PciRYjxm6ecLy0QUyh50OEw@mail.gmail.com>
 <d1b36858-da21-4e2a-bc54-175524a7d3b4@denx.de> <CAMuHMdXRhUr1My-w0+hoAhQKgOq9iwecjow4iZTh82ED5DEfdA@mail.gmail.com>
 <50b37c36-643c-4307-9d4e-ad49b306ba8a@denx.de> <20241015144810.GD2838422@ragnatech.se>
 <825e3b22-340c-4618-8d80-5d1b004fc0e4@denx.de> <CAMuHMdV9XoJHHUM42YFwackdM+oRgP4k-SwZOTwqg0RJGETViw@mail.gmail.com>
 <d6b35a1b-3f42-4071-99c1-dc87999c5cce@denx.de>
In-Reply-To: <d6b35a1b-3f42-4071-99c1-dc87999c5cce@denx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Oct 2024 09:38:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXW332YZahLw=vzfB6fZwc_9jL8uY-Uxj=Qyfov5vYQFw@mail.gmail.com>
Message-ID: <CAMuHMdXW332YZahLw=vzfB6fZwc_9jL8uY-Uxj=Qyfov5vYQFw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: white-hawk-cpu: Move avb0 reset gpio
 to mdio node
To: Marek Vasut <marex@denx.de>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Tue, Oct 22, 2024 at 4:07=E2=80=AFAM Marek Vasut <marex@denx.de> wrote:
> On 10/21/24 9:13 AM, Geert Uytterhoeven wrote:
> > On Mon, Oct 21, 2024 at 2:13=E2=80=AFAM Marek Vasut <marex@denx.de> wro=
te:
> >> On 10/15/24 4:48 PM, Niklas S=C3=B6derlund wrote:
> >>>>> However, the reset signal may be in asserted state when the PHY is
> >>>>> probed (e.g. after unbind from the Ethernet driver, or during kexec=
).
> >>>>> Identifying the PHY by reading the ID register requires deasserting
> >>>>> the reset first.
> >>>> That may not be the entire precondition. For example the SMSC LAN87x=
x PHYs
> >>>> also require PHY clock to be enabled before the reset is toggled, bu=
t such
> >>>> information is available only to the specific PHY driver.
> >>>>
> >>>> The MDIO-level reset GPIO handling, as far as I understand it, appli=
es in
> >>>> case there are more PHYs on the MDIO bus which share the same reset =
GPIO
> >>>> line.
> >>>>
> >>>> In this case there is only one PHY on the MDIO bus, so the only bit =
which
> >>>> applies is the potential PHY-specific reset requirement handling. If=
 the PHY
> >>>> driver ever gets extended with such a thing in the future, then havi=
ng the
> >>>> reset-gpios in the PHY node is beneficial over having it in MDIO nod=
e.
> >>>>
> >>>> It will always be a compromise between the above and best-effort PHY
> >>>> auto-detection though.
> >>>
> >>> I agree this is not needed if the PHY is identified by the compatible
> >>> string, but might be if it is not. In this case it works and the reas=
on
> >>> for this patch was just to align the style used here.
> >>>
> >>> I'm happy to drop this patch, or send a rebased version that applies
> >>> since the context changed ;-) Marek, Geert what is your view? I'm hap=
py
> >>> with either option.
> >>
> >> I was hoping Geert would comment on this first, but seems like maybe n=
o.
> >> I think, since the PHY node does have a compatible string AND the rese=
t
> >> is connected to the PHY, I would keep the reset property in the PHY
> >> node. Sorry.
> >
> > You are inverting the reasoning ;-) The compatible strings were added
> > because otherwise the PHY core can not identify the PHY when the
> > reset is asserted (e.g. after kexec).
>
> ... or because the PHY requires some complex sequence to bring it up, it
> is not just reset.

That is your hypothetical case, but not the reason behind commit
722d55f3a9bd810f ("arm64: dts: renesas: Add compatible properties to
KSZ9031 Ethernet PHYs").

> > If possible, I'd rather remove
> > the compatible strings again, as different PHYs may be mounted on
> > different PHY revisions, causing a headache for DTB management.
>
> Will that ever be the case with this hardware ?

Dunno. It did happen with the Beacon boards.

> > So, what would you suggest when the PHY nodes would not have compatible
> > strings?
> I would suggest keep the PHY compatible strings, because that is the
> most accurate method to describe the hardware and fulfill the PHY bring
> up requirements. If the PHY changes on this hardware in some future

That issue is moot for KSZ9031.

> revision, we can revisit this discussion ? Maybe bootloader-applied DTOs
> could work then ?

So, what would you suggest when the PHY nodes would not have compatible
strings?

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

