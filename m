Return-Path: <linux-renesas-soc+bounces-23130-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C10BE221C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 10:23:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7139F19A36F6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 08:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4324B303A18;
	Thu, 16 Oct 2025 08:23:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EF72DF3EC
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Oct 2025 08:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760603003; cv=none; b=VJd509X6Eco5VnrPBdzwUyQbobo+3TbsufjdQBVoNHdMkRfqFCYt7jHXt/f/LxgpAQlPj9DzBLe4f7sx4EIBcGu33RHfvp2/VY6oEa7CcaLmIugDCw+xG4uFb1XiolTc1G1EuOZ5vHwKR0XgsBJ8YgmlYdbiUgsUdvcUw1TsVt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760603003; c=relaxed/simple;
	bh=oDTYKk+av1YH4ibweUEEkTl0eDngTbPpDkqpzwGoZzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ghG7cC+W5VA1aVJFHK/4tUBEL5Ka6Sg17QsUsOFIifCff7AUrJTtW6HccagACse939mZT8C3pXGzOUilZYZhJvuUjcKPCYVb0r/S71WcJsDJVJpdRyf39c0heTRPzkMxVA3QnUOMqZEmZ7MkEMAgBINvGTJbV6jFZCx7TDgsLS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-54c0bac7d6bso315713e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Oct 2025 01:23:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760603000; x=1761207800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xR7pvs4sY0VZXb71oeLpqLl5nfCodgR8zUuBqvOj1Tc=;
        b=TkMIwbAe3kHIQq4EU/kCVk9zDfC8uoAxrDdV310SoD0RbdVVi4BkziZnlC118JpybC
         MXkXXftkAdCeUA244396fV5LLrBmJ6QduXrBbgJmJ5JTe+Natj3q8ISsyJP3AyaYlrdY
         izVQUp/6zhwk+oRfRgx0VCxTG09VQu065LWo+ZgnQpS1HCxKo5PmRc26wXNkmfLv2O2U
         jQCzkkwShhdOIpGI68YNgR9lhOjymW/co55ZGCMhZyL0lFs7fYQADdifm6WUvCGTvec9
         iJNALyEhDe4OINrLGtrxdW6DYVn+mO8SAmhCVgar+d3L92eG3wxSKRseDClGb2Ck596A
         r8TQ==
X-Forwarded-Encrypted: i=1; AJvYcCUK1YIMD/QRy8fD3ofp0+JXJS2uj/1SNTd5cMTfdVVMdsaV6eBIstyeohmyH/fSQ260wT+UPD9CPvEKUHpX2Eh2bw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhQv6a4nRlrDdVyfURKPcM5fDUisWN4y0UqeAQRjk/gdpTNcjR
	0xdXF1oRR1RLPndf856Qin0laM+EgEl8oiTGyu/yM8ZOJXeeJmYzPewqeTuUl7Gg
X-Gm-Gg: ASbGncudPPqmrulPBx4TPHAuCwiCykKdXuX8y/lbASzP2WDYQuBQUe5HDWlGutoF61X
	5BpwQtUZtbNVT3J8GRj2C/2GZ8Gdn8e6WR822aokSjDewU3RjhtYwvS8IctETihKuPdQ1Ujc0w5
	F/wTn/65c8/Gjz2+UUItkMpVmPS71Vc+6l+iDMcpwJl1NCsio81sw20xj8Zwq4sN+c2S7K/Ripr
	xs+vXhVZlSF0ezdgOYAJpZFTnTHc/DYyHa8otYv6GXTY3lT6coSOu3cl/OnTLCWSIhSMHADzk0p
	1sCAYbLfFUO9CE6PmHEllGa6KtmuQFvSC6YzwoeqMKFT+MZAMS+zT8/7qmpWUaqOZ/QJBfEEOte
	yjyJRWgj537pSSfCo4PHE1Fp69MlEQkpNPfG4SZrMg4kCtQfx1zHSvFQk2ZWagcOc95Cy+QYCdJ
	doK+hipAXy29/tmLQbHSZEBD69dGpbcyIYfDUv2lKUbcvOIAsw
X-Google-Smtp-Source: AGHT+IE91vpazXPoxUxIkuaTg5nIqEYjGbpF1h/hzrulJuXlqljywPmMcRNhkcvnXpo6QvtP8DssHw==
X-Received: by 2002:a05:6122:8c10:b0:552:2554:7d69 with SMTP id 71dfb90a1353d-554b8c1d171mr12839924e0c.15.1760603000333;
        Thu, 16 Oct 2025 01:23:20 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-554d80a456csm5794740e0c.14.2025.10.16.01.23.18
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 01:23:19 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5a7b2a6b13bso300397137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Oct 2025 01:23:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUL6fltNONUn1ebfbv6qK4S6wdbJn3GDBJhcijLQVhO/XKgXJbNgtuYhc5TpUFkJRvIWpjuCYNFNNboAw2UDb290w==@vger.kernel.org
X-Received: by 2002:a05:6102:32c1:b0:52d:110:a920 with SMTP id
 ada2fe7eead31-5d5e2394649mr12437643137.33.1760602998488; Thu, 16 Oct 2025
 01:23:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org> <20251015153952.185249-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251015153952.185249-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Oct 2025 10:23:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUfssQFZj4Mj0T4KpXDzDXBC6MecnauD5wp2_2OLdt=ZA@mail.gmail.com>
X-Gm-Features: AS18NWDv5MDbI0Q-YaerQHTTLK54INzbJu8pMvADwEhMtSUs8ivJgVETlU0r9ws
Message-ID: <CAMuHMdUfssQFZj4Mj0T4KpXDzDXBC6MecnauD5wp2_2OLdt=ZA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: renesas: r8a77961: Add GX6250 GPU node
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Matt Coster <matt.coster@imgtec.com>, Maxime Ripard <mripard@kernel.org>, 
	Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Wed, 15 Oct 2025 at 17:40, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Describe Imagination Technologies PowerVR Rogue GX6250 BNVC 4.45.2.58
> present in Renesas R-Car R8A77961 M3-W+ SoC.
>
> Reviewed-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se=
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V2: - Add RB from Niklas
>     - Fix up power-domains =3D <&sysc R8A77961_PD_3DG_B>; for 77961
>     - Fill in all three clock and two power domains

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> @@ -2455,6 +2455,22 @@ gic: interrupt-controller@f1010000 {
>                         resets =3D <&cpg 408>;
>                 };
>
> +               gpu: gpu@fd000000 {
> +                       compatible =3D "renesas,r8a77961-gpu",
> +                                    "img,img-gx6250",
> +                                    "img,img-rogue";
> +                       reg =3D <0 0xfd000000 0 0x40000>;
> +                       interrupts =3D <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&cpg CPG_CORE R8A77961_CLK_ZG>,
> +                                <&cpg CPG_CORE R8A77961_CLK_S2D1>,
> +                                <&cpg CPG_MOD 112>;
> +                       clock-names =3D "core", "mem", "sys";
> +                       power-domains =3D <&sysc R8A77961_PD_3DG_A>,
> +                                       <&sysc R8A77961_PD_3DG_B>;
> +                       power-domain-names =3D "a", "b";
> +                       resets =3D <&cpg 112>;

status =3D "disabled"; ?

> +               };
> +
>                 pciec0: pcie@fe000000 {
>                         compatible =3D "renesas,pcie-r8a77961",
>                                      "renesas,pcie-rcar-gen3";

The rest LGTM, so
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

