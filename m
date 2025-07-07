Return-Path: <linux-renesas-soc+bounces-19305-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF68AFB02E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 11:49:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11A041897C09
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 09:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DB3429008E;
	Mon,  7 Jul 2025 09:48:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FB118C31;
	Mon,  7 Jul 2025 09:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751881737; cv=none; b=C1zPQdUnfFkxhNx2oEQDrKIwRlSSTtZ+1paYizeU1HgibS1peg6MNmKeZr68HJH+w/QraAkvQodRyk5WImudNelFycT3b1BQYtYEepqqul93ac7xmy1v1PyWiCtqiP70WWl0VtJDXSptx1AaZ/qMOSdE2OVT7zdr/j2MlFBCnVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751881737; c=relaxed/simple;
	bh=yAwrHTTSCwzfQyTa/J0bibSx7PafptauV3h4+P74mnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sKR83O6ptfVXjIKvZ5DeBgUeMEeNLvjg0OhAN0ma31hrg7A/yfBNdH5EiBC0DQjQKwmsHPZPlYD3zHi+I2xdt1czCk8Y2wngZh4RWKUTxuzHIjzG0JOQsRj8y+lns7docGbINy6VAk4vUro9hGdzL1HWjqRoosYCNQOO4de6QAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-87f26496daeso671155241.2;
        Mon, 07 Jul 2025 02:48:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751881732; x=1752486532;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X30nyVEkbf97p7ejjgeZnsoLvwP5WN63qwGxzHA4Chg=;
        b=L09ElENQjSRsO3qchbRluNrxtjqyBbMChHaV/kYLzxRkXFPR2rDvf4Wq5cS6QXo068
         EuuAG7CRAhjuCCs0IxPAk21tzm5mpxuQCiifgyfNEe7YDrsb0opeym3/5hTKc7A/j1Zz
         K00KYyW0t/BWHG6VFGc1yuwluQcXZ0RgGiRIBaIu9sQTPsKVIrY3ZegUYKjh/NBm9nEo
         iwOYAdK9595FSmatg+/n97fv6ZofNrvEyBGx7LMpu5KkYBaK04noNQwzVqwd5BFl3O17
         NkHsUMCxkAY1W5bZARBCEVoHgtMeL8Kgvbd+pJFM1Lb4kBR6H/bXczFkG4kT+FzgsgrA
         n34g==
X-Forwarded-Encrypted: i=1; AJvYcCUseZcqaYinp5wBBH5bYrTGMs+LPYw67F8H1HE4NuvHXBrn7SEhF29wZXxWrS3+1Lbonsdo727WrsWK/rTL@vger.kernel.org, AJvYcCVnS/g6t67IgYuSOnWd6xhxXnM5Wqi8Swkf2/+ZCWyRjIyPmsD4JF9UMS57z5q5cV5OCkyeoXnuMCs0@vger.kernel.org, AJvYcCXmlbU8vHnRluMvGxjy5kdrTwNDu44Yia4t7TNbUF4nNlkCMfzM1L6BJ6qeeE4oQ0X6mnUM9Q0ZpetCq5jNNP7YVKg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3oZGFA9w8JV7H1yt2wGmVvexlZC1mIDGmYTiUYmh4y72DYEyu
	HDHoOhunQmC9Qoe2QdYPadPqmYZq88a9uIu8ZKQJvHNAbUJCa/luuVifsYU42mPH
X-Gm-Gg: ASbGnctYnaapjRdXsDUFkzt227LhNOT7CHiKgI34T6+miyfTfgJtzvEBayYIERmI680
	+1yPhOC3yRKBei9Erdd9RQe0B2Vzrd49mkC0iwlsj/lSTbaqDb1UmzaXVyEZ7iG1UKH5sB2zmjg
	g+cC4Ddf3aQ9TI+ni35oFtwO3UBLmrRn1+eoePecGyeqM6EVVawtl0Qm/pvAIpRNTwe1rYr2pgb
	0N2jzRKpxyV2OWb/lNIgGGvwNcqtGuVCZbwRJ3lduS3S+MXediQFl8qBDH34Q7Ar6cFwTMMZ3OH
	QAas7cFkGDNYcQ2RP9dJy/LPFQU9HErPcKM/ZV4oPtQK/0oLKnzlUgOAIP+bC3z66DRmiLHE9jR
	90YFCA5xVywgL12kayCIPTwOs
X-Google-Smtp-Source: AGHT+IHYF9AB5d1FThVD6J80zFnKDSHHRfIp0EvpxufUtpPETyWGs9Iz/e69fH0CzCeTHUzvdDHXNw==
X-Received: by 2002:a05:6102:2b99:b0:4ec:c53f:bd10 with SMTP id ada2fe7eead31-4f2f244587dmr5969314137.16.1751881731922;
        Mon, 07 Jul 2025 02:48:51 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4f2ea543c1csm1075906137.7.2025.07.07.02.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 02:48:51 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-886b2fdba07so804971241.1;
        Mon, 07 Jul 2025 02:48:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUxbSoUPBFtGRjjKhfanPGGbB695Q5P/9UPdi6LLDyCW5e4bhkqJRqu2B8ZaPHjU8IiolaX+U0uRRBTurJ4B7dOhyM=@vger.kernel.org, AJvYcCVXz1YvOH5VPresiDrIwaFLy+BpwQ6trITOgfXCEaTIgUe7MwLhsSeTaGAUJoaOxV0SBF0XbhFYAZ23CJ0L@vger.kernel.org, AJvYcCVzH5ti7UacRNezwMH62LR4op6zyJEnioQVQZasFKII92eAQaCIEniwpAlUQYkZV+oyyptEhPr9NkJu@vger.kernel.org
X-Received: by 2002:a05:6102:50a5:b0:4ec:285:72e1 with SMTP id
 ada2fe7eead31-4f2f1e677e7mr5866844137.6.1751881731290; Mon, 07 Jul 2025
 02:48:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625153042.159690-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250625153042.159690-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUuqwo5Q2SuB=GBMLVYr1yNTB0hoOCohV=HeQ09NE32xw@mail.gmail.com>
In-Reply-To: <CAMuHMdUuqwo5Q2SuB=GBMLVYr1yNTB0hoOCohV=HeQ09NE32xw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Jul 2025 11:48:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU1G=h5AptjmO=i1Rfu7DhDKy0cHs4jhvXxrheYNny4zg@mail.gmail.com>
X-Gm-Features: Ac12FXwyVXqd2V4btALDd9XkZXt7CMeZ8youkn0AjHf_1VLV6yj7Dj-maR7VVLY
Message-ID: <CAMuHMdU1G=h5AptjmO=i1Rfu7DhDKy0cHs4jhvXxrheYNny4zg@mail.gmail.com>
Subject: Re: [PATCH 4/6] arm64: dts: renesas: r9a09g087: Add SDHI nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Jul 2025 at 11:56, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, 25 Jun 2025 at 17:31, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add SDHI0-SDHI1 nodes to RZ/N2H ("R9A09G087") SoC DTSI.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
> > @@ -155,6 +155,46 @@ gic: interrupt-controller@83000000 {
> >                         interrupt-controller;
> >                         interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
> >                 };
> > +
> > +               sdhi0: mmc@92080000  {
> > +                       compatible = "renesas,sdhi-r9a09g087",
> > +                                    "renesas,sdhi-r9a09g057";
> > +                       reg = <0x0 0x92080000 0 0x10000>;
> > +                       interrupts = <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 783 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks = <&cpg CPG_MOD 1212>,
>
> 1112?
>
> > +                                <&cpg CPG_CORE R9A09G087_SDHI_CLKHS>;
> > +                       clock-names = "aclk", "clkh";
> > +                       power-domains = <&cpg>;
> > +                       status = "disabled";
> > +
> > +                       sdhi0_vqmmc: vqmmc-regulator {
> > +                               regulator-name = "SDHI0-VQMMC";
> > +                               regulator-min-microvolt = <1800000>;
> > +                               regulator-max-microvolt = <3300000>;
> > +                               status = "disabled";
> > +                       };
> > +               };
> > +
> > +               sdhi1: mmc@92090000 {
> > +                       compatible = "renesas,sdhi-r9a09g087",
> > +                                    "renesas,sdhi-r9a09g057";
> > +                       reg = <0x0 0x92090000 0 0x10000>;
> > +                       interrupts = <GIC_SPI 784 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 785 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks = <&cpg CPG_MOD 1213>,
>
> 1113?
>
> > +                                <&cpg CPG_CORE R9A09G087_SDHI_CLKHS>;
> > +                       clock-names = "aclk", "clkh";
> > +                       power-domains = <&cpg>;
> > +                       status = "disabled";
> > +
> > +                       sdhi1_vqmmc: vqmmc-regulator {
> > +                               regulator-name = "SDHI1-VQMMC";
> > +                               regulator-min-microvolt = <1800000>;
> > +                               regulator-max-microvolt = <3300000>;
> > +                               status = "disabled";
> > +                       };
> > +               };
> >         };
> >

Same here: it is indeed 1212/1213 as the bits belong to MSTPCRM register.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

