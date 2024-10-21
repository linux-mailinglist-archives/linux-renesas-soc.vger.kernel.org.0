Return-Path: <linux-renesas-soc+bounces-9920-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 063729A5C24
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 09:13:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B659E281235
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 07:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64B911D0E3F;
	Mon, 21 Oct 2024 07:13:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3162F1940A2;
	Mon, 21 Oct 2024 07:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729494832; cv=none; b=Xvm1SHkXSJHU0h8jiesJqTK+lT4klkr/9f7MnUveq07k6DjL4rYkNBXKYQkyz3CJDt6qOOY+jeZJgKfyL7L7MHvb1YGa4JdonHouWyX0n5vqVWpVWEDFYaW6r3+/ltuNSNGbZVVJv+etWl5kY5d8zmvu8qzjI7G9MBR9TkIbdvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729494832; c=relaxed/simple;
	bh=hFqLmHdpdtEEQjvDUF7FDux/+cwKxEKF5WctPF3sivM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tk6a0pQ2UcOV56uzL2dLRYRrH8ydmZdfh3wbJbJ/EeWI9UEtUK1OUTqgi0Qwji/A+I+vnq91RejLHRjCSPu3Z/E3Z4I0dvlxeM0SeXQrwyfqFu2fngAyuYL8yOnOnd2OBrLRfctp+JRPnZuUI8e9Cseb9Q/u3CPorCDp1bEQ/lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e29327636f3so3813245276.2;
        Mon, 21 Oct 2024 00:13:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729494829; x=1730099629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qhhC9On5seuboltYxSaYFtbhHrfoO84l8jkKrTdFswo=;
        b=p4wQlobtnzqizFoXpgzkhnZe3twjN85FHiRTKpM+WOpy6DH5bN/lSbdn48caqZjXpc
         qMpPOrbiuaJBjNOretfeRl1uGy3r3E663cgrpEt6BV4l+CmGgmCI+msH2cbFRFfjl04F
         E9kTIQwd9gbifNpXe6GRbgvpt8V4hUjGRGa6wHSHgBa629w1ybvOCZk5vXDKE7QI/40K
         tNy5jMr8Xw2G9PL2ik9N1JIGUNtK0shtjBOEcXS4sgGhIF8LGM842C/yUm/LTLLcYGV3
         xGj5sCHGEuiwzVpOcjrjgWQP+yZhEHCnHAGIGH6f3UtNMPrmUnIpWZIjqgLOsOqglZdF
         VQmA==
X-Forwarded-Encrypted: i=1; AJvYcCWCqHroYAr9EahNEhsCOzX5wn2ur9qRma2bwWIRy+xC603iTigzzpbKU2fGCh9I0f0dF7///zSK1oQJ@vger.kernel.org, AJvYcCXe97LL4KpOo9bCaEBnEom+fzWXvAWg+WXYwO/LQ1xFh6I6U+66f4WqpZiZH5OzqIJlTxSbmKq7Uv+iCbn2ZkAUdD8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmuUvLACcErSUVqCWuM8MLmUzzqz40BlK83xlzRKO8qZvNk2DL
	Np9mBOhDPVSfCLVotHXAhi2S3uPq8VK9wUDaxkczCCaAJR7zzEvw5QFDVIjS
X-Google-Smtp-Source: AGHT+IFlZwI5zR7UKkg/JlgTR9dlKF3dyxQZVJj85e2FCN0/YRLJ6EMNIjaeuQa3pmHTE0wAOSnpfw==
X-Received: by 2002:a05:6902:200f:b0:e1d:194a:51ee with SMTP id 3f1490d57ef6-e2bb11c5b22mr8630384276.12.1729494828776;
        Mon, 21 Oct 2024 00:13:48 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e2bdcb02b5csm604440276.53.2024.10.21.00.13.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 00:13:48 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e377e4aea3so36992787b3.3;
        Mon, 21 Oct 2024 00:13:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUDuSWjoF2Srj5w7sAkzyD9ZH0kr4HV3iiWLHKN8p6lJFghlILlgiKRb2wyFSHggGaYbZA+4VVXVrW3@vger.kernel.org, AJvYcCXk/zfO/SqqlIGWNhickAH4an9Lr3nIoBq0RIrLVSlX+D2yBmwAKpPwgsWO0w71ow+ijrQlpvI1ue1XPl1KEHTrEUM=@vger.kernel.org
X-Received: by 2002:a05:690c:d:b0:6b2:6cd4:7f95 with SMTP id
 00721157ae682-6e5bfee6c09mr94775557b3.38.1729494828336; Mon, 21 Oct 2024
 00:13:48 -0700 (PDT)
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
 <825e3b22-340c-4618-8d80-5d1b004fc0e4@denx.de>
In-Reply-To: <825e3b22-340c-4618-8d80-5d1b004fc0e4@denx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Oct 2024 09:13:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV9XoJHHUM42YFwackdM+oRgP4k-SwZOTwqg0RJGETViw@mail.gmail.com>
Message-ID: <CAMuHMdV9XoJHHUM42YFwackdM+oRgP4k-SwZOTwqg0RJGETViw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: white-hawk-cpu: Move avb0 reset gpio
 to mdio node
To: Marek Vasut <marex@denx.de>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Mon, Oct 21, 2024 at 2:13=E2=80=AFAM Marek Vasut <marex@denx.de> wrote:
> On 10/15/24 4:48 PM, Niklas S=C3=B6derlund wrote:
> >>> However, the reset signal may be in asserted state when the PHY is
> >>> probed (e.g. after unbind from the Ethernet driver, or during kexec).
> >>> Identifying the PHY by reading the ID register requires deasserting
> >>> the reset first.
> >> That may not be the entire precondition. For example the SMSC LAN87xx =
PHYs
> >> also require PHY clock to be enabled before the reset is toggled, but =
such
> >> information is available only to the specific PHY driver.
> >>
> >> The MDIO-level reset GPIO handling, as far as I understand it, applies=
 in
> >> case there are more PHYs on the MDIO bus which share the same reset GP=
IO
> >> line.
> >>
> >> In this case there is only one PHY on the MDIO bus, so the only bit wh=
ich
> >> applies is the potential PHY-specific reset requirement handling. If t=
he PHY
> >> driver ever gets extended with such a thing in the future, then having=
 the
> >> reset-gpios in the PHY node is beneficial over having it in MDIO node.
> >>
> >> It will always be a compromise between the above and best-effort PHY
> >> auto-detection though.
> >
> > I agree this is not needed if the PHY is identified by the compatible
> > string, but might be if it is not. In this case it works and the reason
> > for this patch was just to align the style used here.
> >
> > I'm happy to drop this patch, or send a rebased version that applies
> > since the context changed ;-) Marek, Geert what is your view? I'm happy
> > with either option.
>
> I was hoping Geert would comment on this first, but seems like maybe no.
> I think, since the PHY node does have a compatible string AND the reset
> is connected to the PHY, I would keep the reset property in the PHY
> node. Sorry.

You are inverting the reasoning ;-) The compatible strings were added
because otherwise the PHY core can not identify the PHY when the
reset is asserted (e.g. after kexec). If possible, I'd rather remove
the compatible strings again, as different PHYs may be mounted on
different PHY revisions, causing a headache for DTB management.

So, what would you suggest when the PHY nodes would not have compatible
strings?

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

