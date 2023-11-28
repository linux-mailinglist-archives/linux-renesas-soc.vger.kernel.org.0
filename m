Return-Path: <linux-renesas-soc+bounces-322-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA6F7FB7E3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 11:32:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 058A1B21AA2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 10:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 573DB4F1E2;
	Tue, 28 Nov 2023 10:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3023268F;
	Tue, 28 Nov 2023 02:32:34 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5d05ff42db0so20094047b3.2;
        Tue, 28 Nov 2023 02:32:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701167554; x=1701772354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wr1xUrZ1Ezxs/JZSmLhd1h3l1AFhvakfp0EV1xDi8m4=;
        b=noYXrXcA1yEhorWO7lqK05h08jtTesEcI/SdYbZ670+U2RCyrTFZlMDTtur/dYJg9v
         fNnlQS40gbR8KGU7oaUGd2dJqzKZ4lQXPqT7uOUDmmtmPh1/4cO+QkPndqsUWQEjYST3
         SnVXe7bu49nCn4/APoWyntk0xjn1U7QKCFlrNnxN0JqlIn4zvnvzrD+v/s9ATT7NwSko
         +yJKwmUGdMq7vpMVXXCrajEvhW/ndjVvGpdgCIRBTqnvE6h1LwffjVP+aZxqnxwy0vYY
         v+WBqdGNZgzWMy3qH+Y1Mj9IeYK6g2SRmKH17aNTRK5+5kPBoyMZ/KPc0RLeJghlu3mh
         uV5Q==
X-Gm-Message-State: AOJu0YyCtB64jmOwuXhy84NpP/Lsh1r/yIk6U6lNXRrD0nBYTgAzv1p/
	LFjk9/6rwQtJ/z+AjVpBqFzTn5RruUvwrg==
X-Google-Smtp-Source: AGHT+IE/riOUsksVCt6H5yKuJnXb4X9siQfM3iI7WypAi95v4MAFvlZ5BPgLiLt7G3id34CDjWpWIw==
X-Received: by 2002:a81:ae59:0:b0:5d0:aa04:6057 with SMTP id g25-20020a81ae59000000b005d0aa046057mr5055418ywk.14.1701167553998;
        Tue, 28 Nov 2023 02:32:33 -0800 (PST)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id r123-20020a0de881000000b005cc636ddb1esm3855909ywe.41.2023.11.28.02.32.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 02:32:33 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-db3fa47c2f7so4732283276.0;
        Tue, 28 Nov 2023 02:32:33 -0800 (PST)
X-Received: by 2002:a25:abeb:0:b0:d9c:efc5:1391 with SMTP id
 v98-20020a25abeb000000b00d9cefc51391mr13969103ybi.60.1701167552874; Tue, 28
 Nov 2023 02:32:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231125232821.234631-1-niklas.soderlund+renesas@ragnatech.se> <deacc7ea-6fad-47d6-978b-3f639aa5da35@linaro.org>
In-Reply-To: <deacc7ea-6fad-47d6-978b-3f639aa5da35@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Nov 2023 11:32:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUcbr--3Cs4+2m=hOehXJt0WqiuYqV_j0DBmR+YgoEb-g@mail.gmail.com>
Message-ID: <CAMuHMdUcbr--3Cs4+2m=hOehXJt0WqiuYqV_j0DBmR+YgoEb-g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: renesas: Document preferred compatible naming
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Tue, Nov 28, 2023 at 10:51=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 26/11/2023 00:28, Niklas S=C3=B6derlund wrote:
> > Compatibles can come in two formats. Either "vendor,ip-soc" or
> > "vendor,soc-ip". Add a DT schema file documenting Renesas preferred
> > policy and enforcing it for all new compatibles, except few existing
> > patterns.
> >
> > Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatec=
h.se>

> > +      # Legacy namings - variations of existing patterns/compatibles a=
re OK,
> > +      # but do not add completely new entries to these:
> > +      - pattern: "^renesas,can-[a-z0-9]+$"
> > +      - pattern: "^renesas,dmac-[a-z0-9]+$"
> > +      - pattern: "^renesas,du-[a-z0-9]+$"
> > +      - pattern: "^renesas,ether-[a-z0-9]+$"
> > +      - pattern: "^renesas,etheravb-[a-z0-9]+$"
> > +      - pattern: "^renesas,etheravb-rcar-gen[0-9]$"
> > +      - pattern: "^renesas,gether-[a-z0-9]+$"
> > +      - pattern: "^renesas,gpio-[a-z0-9]+$"
> > +      - pattern: "^renesas,hscif-[a-z0-9]+$"
> > +      - pattern: "^renesas,i2c-[a-z0-9]+$"
> > +      - pattern: "^renesas,iic-[a-z0-9]+$"
> > +      - pattern: "^renesas,intc-ex-[a-z0-9]+$"
> > +      - pattern: "^renesas,intc-irqpin-[a-z0-9]+$"
> > +      - pattern: "^renesas,ipmmu-[a-z0-9]+$"
> > +      - pattern: "^renesas,irqc-[a-z0-9]+$"
> > +      - pattern: "^renesas,jpu-[a-z0-9]+$"
> > +      - pattern: "^renesas,mmcif-[a-z0-9]+$"
> > +      - pattern: "^renesas,msiof-[a-z0-9]+$"
> > +      - pattern: "^renesas,pci-[a-z0-9]+$"
> > +      - pattern: "^renesas,pci-rcar-gen[0-9]$"
> > +      - pattern: "^renesas,pcie-[a-z0-9]+$"
> > +      - pattern: "^renesas,pcie-rcar-gen[0-9]$"
> > +      - pattern: "^renesas,pfc-[a-z0-9]+$"
> > +      - pattern: "^renesas,pwm-[a-z0-9]+$"
> > +      - pattern: "^renesas,qspi-[a-z0-9]+$"
> > +      - pattern: "^renesas,rcar_sound-[a-z0-9]+$"
> > +      - pattern: "^renesas,riic-[a-z0-9]+$"
> > +      - pattern: "^renesas,rspi-[a-z0-9]+$"
> > +      - pattern: "^renesas,sata-[a-z0-9]+(-es1)?$"
> > +      - pattern: "^renesas,scif-[a-z0-9]+$"
> > +      - pattern: "^renesas,scifa-[a-z0-9]+$"
> > +      - pattern: "^renesas,scifb-[a-z0-9]+$"
> > +      - pattern: "^renesas,sdhi-[a-z0-9]+$"
> > +      - pattern: "^renesas,thermal-[a-z0-9]+$"
> > +      - pattern: "^renesas,tmu-[a-z0-9]+$"
> > +      - pattern: "^renesas,tpu-[a-z0-9]+$"
> > +      - pattern: "^renesas,usb-phy-[a-z0-9]+$"
> > +      - pattern: "^renesas,usb2-phy-[a-z0-9]+$"
> > +      - pattern: "^renesas,usbhs-[a-z0-9]+$"
> > +      - pattern: "^renesas,vin-[a-z0-9]+$"
> > +      - pattern: "^renesas,xhci-[a-z0-9]+$"
>
> No, wait, you basically listed most of the SoC as exceptions. What SoC
> blocks exactly are you going to cover in such case with your rules?

As Renesas was an early adopter of DT, there are a lot of compatible
values that do not follow current best practices.
Unfortunately there is not much we can do about that...

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

