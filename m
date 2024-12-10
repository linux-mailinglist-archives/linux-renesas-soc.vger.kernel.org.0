Return-Path: <linux-renesas-soc+bounces-11162-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BA79EB4FA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 16:30:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3117D16C224
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 15:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E31D81BD9C6;
	Tue, 10 Dec 2024 15:30:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE151BD004;
	Tue, 10 Dec 2024 15:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733844605; cv=none; b=rPruQcg5zU0ORSF986m3HP7Ab80kxbWuPt+aH/9oegLujPzOYbosGlElXwLrJqa/6hikKCLoBs9wBG/ldMtZ+d7Cn5V6xQTEbPnYO/rzbkLSIMOotVndWCl1TitloaJU0h4w4ouNBz5QEAZWFcyQQb3kJqL3OBLLzbn2YwSgldU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733844605; c=relaxed/simple;
	bh=NKYSE0hYhqNBcRcstGzRG4B2A6nIAw+SbDQFV64uPy4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FmnlPZo2bH7sI6pEnKSjubKRG5Mc7PsLPeeB0zUxzV4ZinOxuJnaJBDKjWsjd3GJo3oeCFTtqCUi2gsZJkY92a3iiUDBEUSR7qkak4o/D4zZkSDX880TG21mLmJeA/2IXv6AV2OyZ79vQE4ex/FyvXU3kICullEjDfptglL+IJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4afdf8520c2so1200536137.2;
        Tue, 10 Dec 2024 07:30:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733844601; x=1734449401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nows2fY7KpTxx9Yz85WglsRNdxHW6s0rEzYJK1Gzq/4=;
        b=umh0lJvogsrwLHqm2FV7+4WtMBuUbIYUanQXy6ZpmO7oV0pWeMf0RV3OID5Z5LFuPD
         FWjz1cXlKPhJSLyZcqzq5MWY/q319FQcsPzwr073YBekoivdRszzym5zAb8gxpqhIyN3
         FvCZ8OwRhjTGdHC9EujZgRFqpYG8fhT2H5Lcm3R+F0JAaiqmPN2kHftMWlUBHF5mylUs
         y3xL5OvYRWdysfl0/XbTrNZszGmIW0dU/Pws8/vwPub+Cj/qY+aVEzJ61rhFpMpkWhZV
         iZhlQa2APohqtIdhozSdpFeGNVYd0MJwitj28w5YHroaOiGCRCjcAZ4Opo/VGYIdxYgC
         8xCw==
X-Forwarded-Encrypted: i=1; AJvYcCVii6ZrX1rSmTBtC1yGDp+UFnFA36v4UXoldhfXlGDWowj3au8vD/tSufg2BK1DNPLX0CRncaQgURZ3@vger.kernel.org, AJvYcCVmKgmVUnsZztVp1YDiJI5kmnKukVVnhZjLJxNe7xJCRG08MnW8jcuuoG3wEwJq2cHA93+et+HLj/Ubk+k5@vger.kernel.org, AJvYcCWsjgGYS9XKS3m8ZXLhsJAZ5YGCnNYBiXj/7iXdzs2pUc0xjvc3rdeksnHUQDMqp+t6N+hSch2FzcNZW59cZJIJJPI=@vger.kernel.org, AJvYcCXOJd+r4diJ9dF/+2+oKZP2PHPp1GOCxJLCaNqEy3/r1YPAdqLSQyq7BwryRx3Kt1kbQQPtIap6VsCo@vger.kernel.org
X-Gm-Message-State: AOJu0YwLwGKsJtrCcdFdcIn2OHAU66FRfw9OUt2v3PwxvFzAS+MvDuPl
	HMIuwRmKiWKTHNhgq5VN8GmWMzxIl40FMJsMmFm8BRRfcWVpHiBghZG8NGan
X-Gm-Gg: ASbGnctU/mEjaVi6aIt8QZ8GqdW7CFb0UOOgRtLq1RUaRI9QQN8s1uXrKXFHP3NI4UR
	1l5rdacw20jH38uHU9Q3hEWIXrxw3yilJAC5jBb3xcI1uE0xHk5BEj601CqVuyK5fFXg/WCoW9A
	4tlub8okKATKwsN1saA4K2qaVUIPV2XADRLk8rD3Y5Vm8rcrHfxGnWLkk8880wNTv9C2rXh+yOC
	somWRgkFa1pTT9MZcWM++uEP1SyJWlXlYmuOLDelX1MM2/oN23Xew7D4Rq1poQwgJcvjgW1VWgk
	DeEMDjkoLdhEFp0Q
X-Google-Smtp-Source: AGHT+IFMXE1tQik7UYO7d3m9vr78jRleSq9a1wfH+sI1ksZTh6nckb1cq7E2noFj63QWN5ThCpoBRQ==
X-Received: by 2002:a05:6102:3587:b0:4af:bc0b:735b with SMTP id ada2fe7eead31-4b11627d3c9mr5390074137.26.1733844601199;
        Tue, 10 Dec 2024 07:30:01 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85c2bcf2f69sm1535109241.27.2024.12.10.07.30.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 07:30:00 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4afe1009960so977664137.0;
        Tue, 10 Dec 2024 07:30:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVFrDQpshszJQNIiJWqxM2DLKzE8ZPqVuSmvTLmHTOFA348G6FpVfMj11A1LDzArIHbpevLQI9hTryXvwMJ3Dwmc9g=@vger.kernel.org, AJvYcCW9NEHc8AEFZxVqxI24vgHaaI6DJehd5HViUc1si5dNh62PyDtkBH9CHHOmFxmH91c+HYgI1O9dpcUg@vger.kernel.org, AJvYcCWfv3sZpHuTslJ62Ve4qMJdoXV/RVbUyuWkt7EryA++xTbNbB7R2bO4yK4zTpXp27IrVH8JLw6svTO49pIw@vger.kernel.org, AJvYcCXJxN7n+zKz2kHgY5QaNZn29K1HT6MOcxen8JtaMIJ/o9+PqtnW9ux03RoJmfDbPtnOEucD7TQULioK@vger.kernel.org
X-Received: by 2002:a05:6102:418c:b0:4b1:101f:a5a0 with SMTP id
 ada2fe7eead31-4b1160c1b5cmr5478389137.5.1733844600027; Tue, 10 Dec 2024
 07:30:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com>
 <20241126092050.1825607-13-claudiu.beznea.uj@bp.renesas.com> <CAMuHMdWadox27_HYhijdOCdd==4P=-C0moFFAFUmCKupcSBjGA@mail.gmail.com>
In-Reply-To: <CAMuHMdWadox27_HYhijdOCdd==4P=-C0moFFAFUmCKupcSBjGA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Dec 2024 16:29:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV_jSMeP9OAj5Z9HvP6_7Yd7b=JvEj+-LOVHXj0TQxHsA@mail.gmail.com>
Message-ID: <CAMuHMdV_jSMeP9OAj5Z9HvP6_7Yd7b=JvEj+-LOVHXj0TQxHsA@mail.gmail.com>
Subject: Re: [PATCH v2 12/15] arm64: dts: renesas: Add #renesas,sysc-signal-cells
 to system controller node
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de, geert+renesas@glider.be, 
	magnus.damm@gmail.com, gregkh@linuxfoundation.org, 
	yoshihiro.shimoda.uh@renesas.com, christophe.jaillet@wanadoo.fr, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-usb@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2024 at 4:17=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> On Tue, Nov 26, 2024 at 10:21=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.de=
v> wrote:
> > From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >
> > The system controller on RZ/G3S can provide control access to its signa=
ls.
>
> Actually all SoCs from the "RZ/G2L" family...
>
> > To enable this, add the #renesas,sysc-signal-cells DT property. Consume=
rs
> > can use the renesas,sysc-signal DT property to reference the specific S=
YSC
> > signal that needs to be controlled.
> >
> > Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

With the patch description updated:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

