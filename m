Return-Path: <linux-renesas-soc+bounces-1516-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 263C282C168
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jan 2024 15:13:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB4DEB22824
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jan 2024 14:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD55F6D1DA;
	Fri, 12 Jan 2024 14:13:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328F864AAA;
	Fri, 12 Jan 2024 14:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5fa52e173f7so33196367b3.3;
        Fri, 12 Jan 2024 06:13:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705068794; x=1705673594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ogmBK4GcHnlicaeksl+88HTGrvs80uzfrt9z9GfN5KM=;
        b=q2aQdezOMkTi488Fx34hxeBwzrkyVLaeinNhuwXDd38KvpoGJdiVGn1Z0RuBk6nTxH
         vnG7yb8otKUq/XmDKQqYf73CD8H71pYw5p7eJNfG3dVPEZmOBKK8fVFTM8Zne+976aAi
         etHhbJmsm9IWWfCwipad99M/LkFPixXS+BbFqUMVYW5ESFCFkfHeG1HRABtOglR0qHx1
         r+KYKYChvyuLN8igq/jfM+5L/3EEKsBLHhASW7Pznf0QOZeEvA1fOgDyzYbOM5ta8GsO
         b9elZKuwWNGoRGTldXWiHUEc+0KNhyqNaFY4k6pGr4vYR4sENzBY7944fMAbeJU3FyYE
         212A==
X-Gm-Message-State: AOJu0YycU/2j2nLLMW1fq7294fsJBQ0uKw/yviRkhMPudvMaj8wd6mPp
	90hxatdOdvDT70LSgVkllnEP0E9AKXltZg==
X-Google-Smtp-Source: AGHT+IFIzJ/PmIVOEEFVeKiaFwHi+rAUcGrgk0Vxlk7x5Le2iSnlytZAHamkfjeUZMjWbL7z83XYkQ==
X-Received: by 2002:a81:6dca:0:b0:5fb:9321:9ff5 with SMTP id i193-20020a816dca000000b005fb93219ff5mr1289598ywc.61.1705068793959;
        Fri, 12 Jan 2024 06:13:13 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id g139-20020a0ddd91000000b005d6f34893dfsm1355399ywe.135.2024.01.12.06.13.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jan 2024 06:13:13 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5fa52e173f7so33196057b3.3;
        Fri, 12 Jan 2024 06:13:12 -0800 (PST)
X-Received: by 2002:a05:690c:7:b0:5fb:86a1:3e57 with SMTP id
 bc7-20020a05690c000700b005fb86a13e57mr1510809ywb.39.1705068792784; Fri, 12
 Jan 2024 06:13:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87edeqgfbu.wl-kuninori.morimoto.gx@renesas.com> <878r4ygfap.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <878r4ygfap.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Jan 2024 15:13:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVq8gjv=NFQdN0PcMoQsZ8QWYF0A9sej1mLPPF_SOSS-Q@mail.gmail.com>
Message-ID: <CAMuHMdVq8gjv=NFQdN0PcMoQsZ8QWYF0A9sej1mLPPF_SOSS-Q@mail.gmail.com>
Subject: Re: [PATCH v5 resend 4/4] drivers: clk: renesas: ignore all clocks
 which are assigned to non-Linux system
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Aymeric Aillet <aymeric.aillet@iot.bzh>, Yusuke Goda <yusuke.goda.sx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 10, 2024 at 2:15=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> Some boards might use Linux and another OS at the same time. In such
> case, currently, during booting, Linux will stop necessary module clocks
> which are not used on the Linux side, but are used by another OS.
>
> To avoid such situation, renesas-cpg-mssr tries to find
> status =3D "reserved" devices (A), and adds CLK_IGNORE_UNUSED flag to its
> <&cgp CPG_MOD xxx> clock (B).
>
> Table 2.4: Values for status property
> https://github.com/devicetree-org/devicetree-specification/releases/downl=
oad/v0.4/devicetree-specification-v0.4.pdf
>
> "reserved"
>         Indicates that the device is operational, but should not be
>         used. Typically this is used for devices that are controlled
>         by another software component, such as platform firmware.
>
> ex)
>         scif5: serial@e6f30000 {
>                 ...
> (B)             clocks =3D <&cpg CPG_MOD 202>,
>                          <&cpg CPG_CORE R8A7795_CLK_S3D1>,
>                          <&scif_clk>;
>                 ...
> (A)             status =3D "reserved";
>         };
>
> Cc: Aymeric Aillet <aymeric.aillet@iot.bzh>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Tested-by: Yusuke Goda <yusuke.goda.sx@renesas.com>

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

