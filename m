Return-Path: <linux-renesas-soc+bounces-8488-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1BC9641FD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 12:35:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48212287F99
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 10:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A1918F2EF;
	Thu, 29 Aug 2024 10:27:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4327D18F2FA;
	Thu, 29 Aug 2024 10:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724927232; cv=none; b=JsrshJV2vCk1seui7qBlwRhFC9fdVMmd8zdYjH4mUyVgH2iI4245+toB1FtgUqm/r1LK9xf7Ui8YCxDh/KRNr8EkoiZSmPjiznGYLuR/y77l7YENQTS+qwX9hke/aKg3UE/jrbJDYsp8XxVJpxQF0b5qbudF03QBTN/gxUfl2ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724927232; c=relaxed/simple;
	bh=nSOeCjYFLP1a1Q6F8fSE9UvZeS67keHfkU8HyzR1AGQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bEswdygKKVTSZpt1Ba8sEfMkgf6nH6iTIP6fh/JoDgskG6h8PQPETqOpuKSYXt61faOq5L9/2eMWq4TllnxHxZa4V99brVkG2IN/b4AqHfFIidq64RboaQUnYeT84BZJyLjWKgCoEX4vDIjW0TkQAUs0Q4HXqfA0sF3BzWhcUKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e13e11b23faso513864276.3;
        Thu, 29 Aug 2024 03:27:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724927230; x=1725532030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kD6Ij+Kujn02NkbhTilILjyqQv+yMwvVr1OG8VToVgQ=;
        b=p4dHjz98wVcAKqV9cr5V39y9zPwUIrd/8ywHulagr680mCo4yzzETRanYkQTiikeTL
         B2uVwyufM/R86OjmwZax8MsWpkAE+LuCxArdK73R4S59mHcvletSh3HuSvo/Aywi2Lap
         HNsnhqHrxxmL3shzazATtkZgrgtAtYiLxquD3aezAtN8FUoyusPrB7q8bw57exLne6kz
         neN7pJ5CAYUYz4XYgx+uAZ7vZch2Na9vJn+81s405Yz78JYxo8vBXB4FW4Z5HsYsWQ7l
         scHdLPsV7xFkndTMlWMGbizYMJUjeduQ1MZwnc/X0J6LDHNO3jF5piWWr6jMlvMrYK33
         HU0w==
X-Forwarded-Encrypted: i=1; AJvYcCVCth1kDxMRx1QHu4mraXRrEqLzurhJO9+PR5Qf+TuleJoznkQE6nXqeMbswE7qAWga6DDJB3yK/g2J@vger.kernel.org, AJvYcCVinqINQ5TbxGZlhqMSNIMsnO5BgvCGZDPTo/khGidVzZkLlf8RudPRqFfZlPNGh5Y8f6ySOsXAG1SOISD7@vger.kernel.org, AJvYcCXjel8oOPeYPqeZBOaIz681dtAwECBIFJ0zitL3JaSo6G+kJEaPVQmhlxaWufgyhLJlz0FL615iJZdo6s36YDWYus0=@vger.kernel.org
X-Gm-Message-State: AOJu0YybRWJi8nuLpTfj1EMdpzPuW8LJ+q24gLYB20j7xP9W1vy4BlGa
	LYEtuy1QLtQIcPAVmwvTVbugRS1UFk9KyX0Qz6xF1VTPqdD2WssCOo+Ws0ui
X-Google-Smtp-Source: AGHT+IErZBEP2ZD6Jy8mOHymIyXk/HqOIbOoPKsX3NUgDfJFNno/p/6SdU+vhPRTBSS1LCa2rZfSJw==
X-Received: by 2002:a05:6902:2204:b0:e11:7349:c842 with SMTP id 3f1490d57ef6-e1a5ab88c81mr2197817276.15.1724927229719;
        Thu, 29 Aug 2024 03:27:09 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e1a626e4917sm182941276.52.2024.08.29.03.27.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 03:27:09 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6c0ac97232bso4096287b3.1;
        Thu, 29 Aug 2024 03:27:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUKGMGaLsBz4MXAA1i4Y1V8is/OZWFeq+2/WjbUzITuTA6FtOuLko+eU90eSdvZaTxBcAMKwDv1zwdp9c3D@vger.kernel.org, AJvYcCV2LfKoZhWV2tpThGIX0F1gh/+JdVz2vqd/DEUgQY15EHi5IzY9aw0yJztnZJydtQPUFSPNYvWoc5ZbKTetgRPIDis=@vger.kernel.org, AJvYcCVIpQaElRDrodm1hgHavAPMK6aIs7Qpgs0qIXHXDYdFTrdWy3Ptt5k0hbASpfCUByxivB1naRyPTact@vger.kernel.org
X-Received: by 2002:a05:690c:82:b0:6ad:9550:7617 with SMTP id
 00721157ae682-6d277879faamr29316627b3.32.1724927227880; Thu, 29 Aug 2024
 03:27:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240828124134.188864-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240828124134.188864-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240828124134.188864-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Aug 2024 12:26:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVX217UjEPaZSMJUPUjGXXLz8orz=c2mTmLL-Vko4XmAA@mail.gmail.com>
Message-ID: <CAMuHMdVX217UjEPaZSMJUPUjGXXLz8orz=c2mTmLL-Vko4XmAA@mail.gmail.com>
Subject: Re: [PATCH v4 7/9] arm64: dts: renesas: r9a09g057: Add WDT0-WDT3 nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 2:41=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add WDT0-WDT3 nodes to RZ/V2H(P) ("R9A09G057") SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3->v4
> - Used hexadecimal values for clocks and resets
> - Sorted nodes based on nodes index

Thanks, will queue in renesas-devel for v6.12.

> --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> @@ -201,6 +201,50 @@ ostm7: timer@12c03000 {
>                         status =3D "disabled";
>                 };
>
> +               wdt0: watchdog@11c00400 {
> +                       compatible =3D "renesas,r9a09g057-wdt";
> +                       reg =3D <0 0x11c00400 0 0x400>;
> +                       clocks =3D <&cpg CPG_MOD 0x4b>,
> +                                <&cpg CPG_MOD 0x4c>;

This fits on a single line, so I will reformat while applying.

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

