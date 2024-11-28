Return-Path: <linux-renesas-soc+bounces-10754-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E117F9DBA5A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Nov 2024 16:18:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 576EFB22EEA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Nov 2024 15:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CCD51BCA05;
	Thu, 28 Nov 2024 15:17:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0E51BBBC4;
	Thu, 28 Nov 2024 15:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732807041; cv=none; b=hIeGR4yuOHhn1pQK7QIciUNUeyPQAQYKqFZCLXIRW91AbeOmQ+V8Otmg+1zHCtRLmv9+zeVzxsPyrc9msZGmSU3rBrHbKZb6+El+FITo3PegEh6gjJifQ8hRiQnqpDKbgv4r7GpwG4vjmOpQxEvg1Tc0HP2qIrtwPSUFEkMU+F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732807041; c=relaxed/simple;
	bh=uHVXp1lCi0mfmgi9kc+IJW5MLMJHm0E3czWl1oMlKoo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=njKxAGMy56l1pqorq2EgK0gtvS1FigrRPETZxJk98dlm9AyOjtVjOEWxWp1lPK22v01UesfAN9x4kttqRXFLiI8+SugPtBxmGY2P56FuZGQzbHuR0/TQoRvntSiDtYtFAtNxgGK7PMDY4WiPhCRqo/dKszMsRJUML9rSWELAWYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5cf6f804233so1017153a12.2;
        Thu, 28 Nov 2024 07:17:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732807036; x=1733411836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xpOqJtapJKr2nmzp6tbpwS+L3Zut8QyciQBvDh30p6c=;
        b=hxU/d6Ex4bTJDfhM77hgxZZCnNxpQ6im8gTjMttWfO0v6cRYZvHec6m60uh3+7wlqo
         BO4Wl/gIx0eHAwW5wdj5g/C0Sb5XFtmQUEY0nq+ZYUE77jG122oOl756D8y54cI2yr3i
         ft9hyukLdwSI/c6Abm+W4P9N4sktnv+CE1S+tmcr4aMtdpLRNsjTCRfe0/wwPFWov797
         tf3QgJCMs9/vRowUJv7mTN7nSUa95FEuvrwb0fSqnvOKeWW5LYG6MgZbE4GRq4onYfJd
         sS7bjTYX0DhsSR2ty3WRSGXTcTZh0UHa8PN1zazXmN+58WXUXMoUq5ssUOrLH8udWOua
         GEKA==
X-Forwarded-Encrypted: i=1; AJvYcCUMkixmBEu6yjTkigebzWg5FBlT4FWT3pforLf5ulVmYvWnGbdTGWGJbu3YlK53YoT6DF/+b5YyC2Eu@vger.kernel.org, AJvYcCVi8XMvWO28aIhIMtfE59fqK5H01qSbJxACxzsa2sbQc8nxLDsMhO3uPZwnO/kfxbx/SfCf/Y18YL+4O13MkUkRoM8=@vger.kernel.org, AJvYcCWS0qIYNmIbkb3wfl6IH6QkRuVHKSmWao5KSGdY5KYwI3TToYv5nevkRmHPbw0I6RLysBOp4aa1Oult@vger.kernel.org, AJvYcCXHUntvJwXiZWeBLY8ofv7Eq4G7vQo/l4TVG4LTACB5tOtU5e6grdWpQu//Qk9IXiXQVUZ9Hvs+MVwI7N3y@vger.kernel.org
X-Gm-Message-State: AOJu0YxmOQ/nO+mj7ElR7UdFnkhMoqFkoBjLnisXr7QVLHZkK6a1mhHz
	Wo12Fs+SQgEYaRWMYHe0F+lEF9Ch17gjDjf5mQmdpjjTCSn5VQr3qy65wBYaItc=
X-Gm-Gg: ASbGncuMdnLJagkIHZJQ5nFuJCfxpthpby7u9NKEyYtPq1/6R6OWPFZdrATqko2nN4r
	QWY9r+HwwNBvqGkHzBAVCZKfGsBMX3AN3EXTS2VIFHfJQQxFlNtASWKSVIWxW8pz+3+uTDyksJq
	f34cPLSY73ZD0vx0e8VsrkSDMkqWgFA/QDKEMuBiD4juD3aJmznY05DrjGCYZQgkq/mt/ygT5wX
	Znjnr2L2vznPASzxxLNQ6/MksmeCVUL4jaFTlRHZCDFUhUw8CWBnqNcmfuJ20kqR3o/k5n6/Wtl
	1SvlCzh/s0vL
X-Google-Smtp-Source: AGHT+IHBfYwMZh6ZevmM/W7aEk/qprH29V2yB0NqtU8IU/9U7mGi2/GLJSOl6Ze1EWn/8+dY7yKDSQ==
X-Received: by 2002:a17:906:314b:b0:aa5:3705:2dc with SMTP id a640c23a62f3a-aa58103c65emr546094466b.45.1732807036239;
        Thu, 28 Nov 2024 07:17:16 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5998e6345sm76845766b.109.2024.11.28.07.17.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 07:17:15 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aa5366d3b47so131319966b.0;
        Thu, 28 Nov 2024 07:17:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVCL/HaP7ifYuwSJeuH6gtXEjDiXCiNF0MXXiN8FQUQON6KVOXHNbd65tvsuH+4Ovb3PGw5DpVs9O5LKYxB@vger.kernel.org, AJvYcCVv/OF2MVVVY6PHsElvkJk5he3+J/jswrYvveQK9WR3/q/eTPdl5YicWUewXA3o62//zQA0GyPsVVA6IVMmySqrtyI=@vger.kernel.org, AJvYcCVw5iKR96Pr5l3W61Y9ylJsknoo31+Xw5HUbFfhvnT41UkDdW0wFLeL5IDzY14Oirwv1j22GbBxvvL7@vger.kernel.org, AJvYcCWo9lGCcVX/o6p0gxJ/SU0ZV28VAG/QFBqqaydf5Qyp9ktk+THY+4xA85FwnaCE79vJiaBOf3f+dPm4@vger.kernel.org
X-Received: by 2002:a17:906:329b:b0:aa5:241a:dc75 with SMTP id
 a640c23a62f3a-aa58103b03amr618001666b.41.1732807035249; Thu, 28 Nov 2024
 07:17:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com> <20241126092050.1825607-13-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241126092050.1825607-13-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 28 Nov 2024 16:17:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWadox27_HYhijdOCdd==4P=-C0moFFAFUmCKupcSBjGA@mail.gmail.com>
Message-ID: <CAMuHMdWadox27_HYhijdOCdd==4P=-C0moFFAFUmCKupcSBjGA@mail.gmail.com>
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

Hi Claudiu,

Thanks for your patch!

On Tue, Nov 26, 2024 at 10:21=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev>=
 wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The system controller on RZ/G3S can provide control access to its signals=
.

Actually all SoCs from the "RZ/G2L" family...

> To enable this, add the #renesas,sysc-signal-cells DT property. Consumers
> can use the renesas,sysc-signal DT property to reference the specific SYS=
C
> signal that needs to be controlled.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v2:
> - none; this patch is new
>
>
>  arch/arm64/boot/dts/renesas/r9a07g043.dtsi | 3 ++-
>  arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 3 ++-
>  arch/arm64/boot/dts/renesas/r9a07g054.dtsi | 3 ++-
>  arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 3 ++-

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

