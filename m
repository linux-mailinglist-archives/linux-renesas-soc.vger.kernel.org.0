Return-Path: <linux-renesas-soc+bounces-8797-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8C996EC79
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 09:48:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83E76282265
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 07:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B790C14D282;
	Fri,  6 Sep 2024 07:45:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431E213DB9F;
	Fri,  6 Sep 2024 07:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725608744; cv=none; b=L7qM+WYH17F1T2FaLo9VCR6OCTX4nuFZkMCRV02mOtSuE4r5MF+PCLfrhqm56GWfuY++w2K8Vmz4wnkx+rGACcujz+eQFllJvfmKDKy3SgtQsqHlyZU4k/J37jSLRI35yOH3eaN1TBBNHNRjOocvwQzPOuwdXVqa8vcpaLFu6nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725608744; c=relaxed/simple;
	bh=gfSLypdzrJOpelCcvm/VOpFxQRieJuT2vV9QrhMbim8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hr3DtyEVz3xKODI1SH/l/QD6XWthYJVNCyKGuUZLV81QLsqrOh4HByFfAo0/2D8mbELPucWDjrU4NydH0zeX3pfHNbIxjMLNQjEXHiFWlD1yWBjCsdvGiizaDNtn6wNxycUjb6XvKNwSp6g9ta1pgim+tw63q6z1L+jJ7TaqVro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6b5b65b1b9fso13840217b3.2;
        Fri, 06 Sep 2024 00:45:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725608739; x=1726213539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BGCloBLuKJNuQjTKYududIzGAVIj/P9FIhi0OmowDEI=;
        b=XZ3Ra8WcEySIrZsDAlT319i2YXKUm4G2+nzFI/bG+tXcfWFK88braiVUXzkgKZgkTu
         loj5TgosdsCOxjig7SI8fqCmhikcXkBLLIi8n2CO272RlXYWKccJu4hTJjs0BHzbtTuh
         sbWu0PbVOs22aj42ouHN/9V17epTLF+BlA4bObRHWlif8zLVWVyjLBwm0A7KcXPi4glT
         IQMOyDhRfQo80EA4fByfx3y2v68fk/A+crkj2XziAqgZmkzYD4DyMoSYnQRamZsMhRVi
         OJXDKNh5Vc9hpQQbCtUgI/2zaQVGVJK39P9QnIpk3QaOm0M/7TclLiYOOKTRQZTpfzaI
         Gx7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUdLWO654U23Pz+J8at3yj1pxF6dpPesq8sOqsHY3rhoUZPLz9XQTA+NjLLylXZghN/aqzti8Z3fjoe+Rv97+E0rq8=@vger.kernel.org, AJvYcCUrsf6CnVlBvCS6J0tIu3fHjGwkdQZs417OLHDVZ6r0/z9zNGByMoK1H/9bKaFroYoYyu9XQ6G3LriUrJ5E@vger.kernel.org, AJvYcCV4sfc+gVCvzuqpRrWvQtZvIa9/jMiiWthzBEIICPDqxMtzb6IR5z11+R33hELWhJCZPFn3UpoOC0ON@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1JkJeRuT04k9/wkmULGFWko07uTsHcs0k2yy1+HaETzwiGYHw
	8C5QX85yvxlCDKHWatflMDvGfO2GkrZhqNovmM/tT9lOxYpgYN+TvHAXEYSO
X-Google-Smtp-Source: AGHT+IH+Sd/fFjlwFdv9WXkRs/APf6a0NqXbrVbFI7Qi1GjHO1zCd7R+K2DcEJqXtpbtR3aUZlcZmQ==
X-Received: by 2002:a05:690c:6887:b0:6d6:88a1:2e55 with SMTP id 00721157ae682-6db4516c24cmr22466117b3.30.1725608739206;
        Fri, 06 Sep 2024 00:45:39 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d2d3ea308dsm32407727b3.43.2024.09.06.00.45.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 00:45:38 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6d4f1d9951fso16101097b3.1;
        Fri, 06 Sep 2024 00:45:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGaBkmRTp3hNvxhI2HcUgIMZGZFRz4r4gqk9tusTTuM3T+yIi0Ob9qccymbXjCWm/1fJAg83hsJq/0RTNd@vger.kernel.org, AJvYcCURr4OtT5XpNK0O98JzEOu+dytz6KZI/Ys2hsLV3o3ZfhlKYB57zy6AgKygBdi665wrEsbjlr5JPnuw1uOFnnoPTl8=@vger.kernel.org, AJvYcCVEgR4q9l2zyrzsp5VEvnFzLWe+bLpgyf8GtRxROFhVFyS/fN3lpg++wPVS3+InpkiWuCVJYuyHycKY@vger.kernel.org
X-Received: by 2002:a05:690c:1b:b0:6b5:916d:5a8 with SMTP id
 00721157ae682-6db44f2f48amr21186587b3.23.1725608738264; Fri, 06 Sep 2024
 00:45:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com> <20240906062701.37088-24-Delphine_CC_Chiu@wiwynn.com>
In-Reply-To: <20240906062701.37088-24-Delphine_CC_Chiu@wiwynn.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Sep 2024 09:45:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXs=hOgzorsh=Ezf65-3STVtBHrTaM2o==cUm9H_ftCSg@mail.gmail.com>
Message-ID: <CAMuHMdXs=hOgzorsh=Ezf65-3STVtBHrTaM2o==cUm9H_ftCSg@mail.gmail.com>
Subject: Re: [PATCH v15 23/32] ARM: dts: aspeed: yosemite4: add fan led config
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Cc: patrick@stwcx.xyz, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Delphine,

On Fri, Sep 6, 2024 at 8:28=E2=80=AFAM Delphine CC Chiu
<Delphine_CC_Chiu@wiwynn.com> wrote:
> Set fan led config in yosemite4 DTS.
>
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>

Thanks for your patch!

> @@ -75,6 +75,154 @@ tpmdev@0 {
>                         reg =3D <0>;
>                 };
>         };
> +
> +       leds {
> +               compatible =3D "gpio-leds";
> +
> +               fan0_blue {

Please no underscores in node names.
LED node names should follow the pattern in
Documentation/devicetree/bindings/leds/leds-gpio.yaml.
LED color should be described using the "color" property, cfr.
Documentation/devicetree/bindings/leds/common.yaml.

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

