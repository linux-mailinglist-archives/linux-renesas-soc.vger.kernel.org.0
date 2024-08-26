Return-Path: <linux-renesas-soc+bounces-8265-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC9A95F119
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 14:16:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCCD228CE62
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 12:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32AF1185945;
	Mon, 26 Aug 2024 12:14:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29658184526;
	Mon, 26 Aug 2024 12:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724674486; cv=none; b=n5tyq8DBA/UhTD7xBNllRSpUe/c5ZZKD85MGs+meka7KHZaqo+AqwtlFNIUn0bAqvjafPBfvXNJnF0mALee2xxI8sTpC5eFj/kd2vMTGFOnkorMgyrBMlm9stU+TNmRZIWuvvOAC3Ts6YeBn+7evmt1q/d1s4dGvYB6B6h0jBhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724674486; c=relaxed/simple;
	bh=VG4z0gnxMqPCYq9MlUwTLNv/ZoG+XojlElfHXZWbwsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hMDiqOhguLSuZW9szVaN/rtDrk5ZHCwG23jebr0ypbbOe5bNiE3q60Aas6JHVIJ7//QlM9cr1tw3ZvYyvnlqVLDQkvmiVNqrXhPZpYBSt/v0HAhi2BVQrnsp2ItZTKStYag6Xu9HkifZtXrcAiZXCrgEJ6WDjDf/r03u9hLp46k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6cf6d1a2148so793917b3.3;
        Mon, 26 Aug 2024 05:14:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724674483; x=1725279283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DI9texX7L+jkyHEYzNQJBlSAbKF6W+PZkXVFdVqDL0c=;
        b=kjBxvTJCc8nB+x25VdFFrHwooZ1zkEykmp3exV9qDXTiwueE60H8ma5fboAo/OMupC
         CR1Gao5y77EsZXbdrJsJpEJqK3f+iU4G0TnnEk5kQ9JMciHUZvSte8lKjBtuJoA3FI2C
         I1nRk2LB38HcHClt412xc/GAe7h0YpM+ElTrKs22+ca7xd1gq6SXzlK+P9NUHxn5eHbl
         er1EU7XK6CXB71hdD88bHQaplRGY9fRPsw5DbVhRBfIOkHY84klgB7xamlupqTcRtuPK
         WXvhB9deIFee3OWghZZXVCvwdxVynKzlncyJn8Yi85yyuT7QciDD2ety0VpUbHAN34/5
         +oaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhCaWnnt7jpzluht6cdbT8CNMtepgroKMGScFScrgs7+qfz/Fil4u8SMy+X1vSuG/RYNIJUF3eX3htfu7FKqCepF8=@vger.kernel.org, AJvYcCWF/braniu8KpMvvZ2fQFL6gPcS4x76mEyDpd1/zOca1kKb82JDLzhb8+v/7m6COmWcBBXIwbQvIoGOYxBX@vger.kernel.org, AJvYcCX0HuF1dtDP5nQP+oFDFKHrY2B49bzwgcZv99FYi6T/NNtxEwauV7bIMAr3mH3gSL//CJJ5nIN9dzOw@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1WTBznTqX9J366FdGKhvFUQbfd67oR0PWhmxTo7Ax6F4iUzE9
	ClK8s4i+oj4TFqNTObwVbU/u6PqtZSSXjySV7qZNmvqhH/yaOMcQKfK3skp8
X-Google-Smtp-Source: AGHT+IGiW3v8p8nU3HmxHFkLQ0N0sZ8FrqRSveTzu4LT9SIqOMYZ6IXjl3Cy4siQvLtjaH2gLYN9Sg==
X-Received: by 2002:a05:690c:112:b0:6b0:d9bc:5a29 with SMTP id 00721157ae682-6c6293457a9mr116189117b3.32.1724674482606;
        Mon, 26 Aug 2024 05:14:42 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c399cb540fsm15071417b3.4.2024.08.26.05.14.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 05:14:42 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e0875f1e9edso4023888276.1;
        Mon, 26 Aug 2024 05:14:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU0MdaAYdaSzvEnbt2dkoqTITy68jWwy3/ozvZuayYSFjCTZEdt7LXsb3vDdAKqkhJ0JaXQMhIAX3Z276AJ2W4wdV8=@vger.kernel.org, AJvYcCVXRGeZwQOEJNIYLlrLOZ5lWEBZAOtfiUpMqu0zHUuWfjirpyP7teeT4X/oOkLyoAzEPgxKPw8I8on6MJVm@vger.kernel.org, AJvYcCX8LUupogUgTGxz0qIgy0n8vkg8af/IbSI1kcLbJOX2zbiiduyCzntS7AkjNnUsHG41xg53W9kIv9In@vger.kernel.org
X-Received: by 2002:a05:690c:f81:b0:632:c442:2316 with SMTP id
 00721157ae682-6c62538fe2emr113091027b3.3.1724674482044; Mon, 26 Aug 2024
 05:14:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240821085644.240009-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240821085644.240009-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240821085644.240009-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Aug 2024 14:14:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUYYPj6JD-aLkriYB59OnHir_ec=xLo7fUbASggKetfpw@mail.gmail.com>
Message-ID: <CAMuHMdUYYPj6JD-aLkriYB59OnHir_ec=xLo7fUbASggKetfpw@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] arm64: dts: renesas: r9a09g057: Add OSTM0-OSTM7 nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Wed, Aug 21, 2024 at 10:56=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add OSTM0-OSTM7 nodes to RZ/V2H(P) ("R9A09G057") SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3
> - Grouped the OSTM nodes

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> @@ -121,6 +121,86 @@ sys: system-controller@10430000 {
>                         status =3D "disabled";
>                 };
>
> +               ostm0: timer@11800000 {
> +                       compatible =3D "renesas,r9a09g057-ostm", "renesas=
,ostm";
> +                       reg =3D <0x0 0x11800000 0x0 0x1000>;
> +                       interrupts =3D <GIC_SPI 17 IRQ_TYPE_EDGE_RISING>;
> +                       clocks =3D <&cpg CPG_MOD 67>;
> +                       resets =3D <&cpg 109>;
> +                       power-domains =3D <&cpg>;
> +                       status =3D "disabled";
> +               };
> +
> +               ostm1: timer@11801000 {
> +                       compatible =3D "renesas,r9a09g057-ostm", "renesas=
,ostm";
> +                       reg =3D <0x0 0x11801000 0x0 0x1000>;
> +                       interrupts =3D <GIC_SPI 18 IRQ_TYPE_EDGE_RISING>;
> +                       clocks =3D <&cpg CPG_MOD 68>;
> +                       resets =3D <&cpg 110>;
> +                       power-domains =3D <&cpg>;
> +                       status =3D "disabled";
> +               };
> +
> +               ostm4: timer@12c00000 {

Usually we sort the instances within a group by instance number, i.e.

    ostm0: timer@11800000 {
    ostm1: timer@11801000 {
    ostm2: timer@14000000 {
    ostm3: timer@14001000 {
    ostm4: timer@12c00000 {
    ostm5: timer@12c01000 {
    ostm6: timer@12c02000 {
    ostm7: timer@12c03000 {

See e.g. the scif nodes in arch/arm64/boot/dts/renesas/r8a77951.dtsi:

    scif0: serial@e6e60000 {
    scif1: serial@e6e68000 {
    scif2: serial@e6e88000 {
    scif3: serial@e6c50000 {
    scif4: serial@e6c40000 {
    scif5: serial@e6f30000 {

scif3 and scif4 have lower base addresses than scif0.

The rest LGTM.

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

