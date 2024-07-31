Return-Path: <linux-renesas-soc+bounces-7650-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA0694282C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2024 09:38:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD4521F22904
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2024 07:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EFBB1A76CC;
	Wed, 31 Jul 2024 07:37:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDA61A71FE;
	Wed, 31 Jul 2024 07:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722411472; cv=none; b=BOj3guGf2ItBJjeMdsFKhy8KQgVBKWgWFt5Ooh6zsEVGSGjk0P73cmrwoj8nwvlPKfG2IOrNaYcuokYrDQBuWsC7JcSfNEOjPTQmw/64wECWr3sbPxKVGKCsXitnJTGdr17fdA3Xh+GlwZdvhhKmYGjjFlPrdh8pFsIDgYyxBww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722411472; c=relaxed/simple;
	bh=wO9HL+BBteRiiD6YU6w4KeCMRtqOK+b0HwVJpjaEA+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rtj+CIqXCetBxpqlOZZX4Hdh47pzwlIUivJCSZydWMduo3NCeSKoMOvONPzBIhDGqFKDKV4xfbgq1nDImfs0RLjfGxDBelOlCwE+eQbdkQMZej6AqVU9HM6c3/M93BK8YKa+OdHuX5KicIbTWuMIppjdVOv0pj7uxLDxPDJAZ0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6518f8bc182so5241147b3.0;
        Wed, 31 Jul 2024 00:37:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722411469; x=1723016269;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6GuGpj0zw/Kgo7p95Nh9RRAk92Vob5VEzeOvHJ4rFPE=;
        b=xSoMJeacNn9Rh8l4o6GRXRUnC6QOlNLXq6qNBP+/7yZUz5jSfCIYaaLiPomKxFyCT6
         Sq8AfpqzxiNVfkvapdWExcUcetr+kXOYVxfEJcLIxVmKCUkfS87/NOLlsrj44pgR8kL3
         FO2oCmI+K0Dx8eX7xmL9u0Ai6nnyj//wygTjOHHa6qwfMggtvzsAqP6G6D5242mv2Jx9
         Lsp3jOwOqr0CpMDRixSdCeh2esoUMhqdH4ZCDktoImfmK8CArQv2PV8zfd9/SOQq6+yY
         6DxZ2Gxs78sjlwgDZIAkcSFELvLAWQR1y+vTqH2UcZ4eU5l5M9OMlq7Hb8dHIsnkBsrx
         R+7A==
X-Forwarded-Encrypted: i=1; AJvYcCVVOQu6w/7RZmNjPHZSOqKlNqbjWFlE9AOw5RGdLPbuwnhGQr7IIzeQaBBrclZJAveqrnNbkkGqcUIaqkLJMQezwYFPXpniXasEsMB8k9Zn2IW96pU7xMYEPmov3LZJ15w0GGvH/Reh+/Btt6tHqQEK+HyOZVLaUtY6ogjceQq+DbW2hLctAS1d9n1v
X-Gm-Message-State: AOJu0Yx9dpKMLH0cureWjRlAI8/iOjX5GC7t5GrEN3iK1aZ4/Mf6X1oc
	pA+r4s9McXvDzQnf0sTkfWVSSI0VZ8TRJCkYBRXIHj6itTYdlpBkFBQIIXVX
X-Google-Smtp-Source: AGHT+IHrf7iQRAp2MwxsqCYaAzo0M1izP1o8/HnL3f8+p/uC69RIKOmqGUC1YKB80JlCMMKyQO97hA==
X-Received: by 2002:a0d:ed03:0:b0:615:2fa1:c55d with SMTP id 00721157ae682-6826ef4c6d7mr40169117b3.19.1722411469440;
        Wed, 31 Jul 2024 00:37:49 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6756811415fsm28826707b3.71.2024.07.31.00.37.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 00:37:49 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-664b4589b1aso5365847b3.1;
        Wed, 31 Jul 2024 00:37:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXdL8aeYciUWGCVgycPbmTqq9h5QALccHU5mItZplQJBzLbI5Jp6NO89sCwbhJr4mQ47r81Qm/5bbwpdua1aJPZXaL/SP2cbBoumod5egUHfmdPH50NHADTXHdTFDZrlH2QwWZ6aQDnh2l2U6nssC80RDnbYlHEi/iPWVKVqtZhuEr5f2snzgLo9jip
X-Received: by 2002:a0d:f285:0:b0:627:e3ba:2ad7 with SMTP id
 00721157ae682-6826b064b56mr43000577b3.9.1722411468553; Wed, 31 Jul 2024
 00:37:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1721999833.git.geert+renesas@glider.be> <1a3d4ff8ce34a5e676d1cb1fafd40525378e29a4.1721999833.git.geert+renesas@glider.be>
 <20240730162435.GA1480758-robh@kernel.org>
In-Reply-To: <20240730162435.GA1480758-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 31 Jul 2024 09:37:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUwATmjM3E7WmwnCK739CwuyZH1w_YVYbroDcWEpzh8ig@mail.gmail.com>
Message-ID: <CAMuHMdUwATmjM3E7WmwnCK739CwuyZH1w_YVYbroDcWEpzh8ig@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] dt-bindings: fuse: Move renesas,rcar-{efuse,otp}
 to nvmem
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Arnd Bergmann <arnd@arndb.de>, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Tue, Jul 30, 2024 at 6:24=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
> On Fri, Jul 26, 2024 at 03:38:06PM +0200, Geert Uytterhoeven wrote:
> > The R-Car E-FUSE blocks can be modelled better using the nvmem
> > framework.
> >
> > Replace the R-Car V3U example by an R-Car S4-8 ES1.2 example, to show
> > the definition of nvmem cells.  While at it, drop unneeded labels from
> > the examples, and fix indentation.
> >
> > Add an entry to the MAINTAINERS file.
> >
> > Reported-by: Arnd Bergmann <arnd@arndb.de>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v3:
> >   - New.
> >
> > I would expect that the calib@144 node needs:
> >
> >     #nvmem-cell-cells =3D <0>;
> >
> > but after adding that, "make dt_binding_check" starts complaining:
> >
> >     Documentation/devicetree/bindings/nvmem/renesas,rcar-efuse.example.=
dtb: fuse@e6078800: nvmem-layout: 'oneOf' conditional failed, one must be f=
ixed:
> >           '#address-cells', '#size-cells', 'calib@144' do not match any=
 of the regexes: 'pinctrl-[0-9]+'
> >           Unevaluated properties are not allowed ('nvmem-cell-cells' wa=
s unexpected)
>
> Did you want 'nvmem-cell-cells' or '#nvmem-cell-cells'?

Oops, I've been (manually) re-adding and removing it again too many
times during my investigations. "#nvmem-cell-cells", of course.
According to my build logs, I had it right at least once ;-)

> >           'kontron,sl28-vpd' was expected
> >           'onie,tlv-layout' was expected
> >           from schema $id: http://devicetree.org/schemas/nvmem/renesas,=
rcar-efuse.yaml#
> >     Documentation/devicetree/bindings/nvmem/renesas,rcar-efuse.example.=
dtb: fuse@e6078800: nvmem-layout: Unevaluated properties are not allowed ('=
#address-cells', '#size-cells', 'calib@144' were unexpected)
> >           from schema $id: http://devicetree.org/schemas/nvmem/renesas,=
rcar-efuse.yaml#
> >     Documentation/devicetree/bindings/nvmem/renesas,rcar-efuse.example.=
dtb: fuse@e6078800: Unevaluated properties are not allowed ('nvmem-layout' =
was unexpected)
> >           from schema $id: http://devicetree.org/schemas/nvmem/renesas,=
rcar-efuse.yaml#

Anyway, with or without the typo, the error message is about the same:

- Unevaluated properties are not allowed ('nvmem-cell-cells' was unexpected=
)
+ Unevaluated properties are not allowed ('#nvmem-cell-cells' was unexpecte=
d)

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

