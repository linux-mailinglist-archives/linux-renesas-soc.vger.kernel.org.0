Return-Path: <linux-renesas-soc+bounces-2778-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C87854B61
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 15:29:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 688D728555F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 14:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3514555E41;
	Wed, 14 Feb 2024 14:29:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A0A1A58B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Feb 2024 14:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707920941; cv=none; b=bWFFp+cxMwQ+dCWzqyM5IxUQAdhlFwRQK3xfpWZgeu2XR0LNhWXEX7d/4BrxnQit14x1OmHEtdBZMde+kD+1z0SNHo/vMK0P3zRqqfjRXlTedX0A+AJsrhjuGw8oy5Mp30TIY+HmHmsob9GyWSZmDwW5Xu+d5esXNAlSvgABv9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707920941; c=relaxed/simple;
	bh=IsMhGKHg074QQEUyGl72EoxTPJEIiv2oQVchb7oHauw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H/BAqN/OJF5zAOMvjVR4A3+QdU3opZ6rJnWfhnxu8NhO3Ih2B3JJ2UlXbRNb+OA1SzlsLzwVXiFwBSKlmYMt8nxRtFSVwrSVAUiMGM1uhimmoMY8+KFqqVtKOmn7jNK2RJXyxKTt4F/c3E2gPDrEmirqTR48lDGtdllqNeZ5VTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-607b2f54543so4561077b3.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Feb 2024 06:28:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707920938; x=1708525738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uxx6BhEfyAb2qf15rhyTrfvjtPrVn2pO83E8tKf5Kc8=;
        b=QHKJViGluqSBorQOLQNCGZU6sVNwkS70Rpf1T3yaUvaAZVcPD0lzfHSQioVMVMSScD
         J2evYQgqwhQk8iNDFKrSISD1F4XfQX3WBWD6JoUnLOLn8l56i/AY+xGU8r9xNiCOKZjL
         mlGvg6R7GvorauLm9YaO9ZFqP/jCyu6hKj7NyrRHWFgMdl09XvsCRZykvhy6cU3YORJ+
         Wq49V6lZ1Y3dThMHD/DgTdQFM3NroiqEw8DD/nXct6nxroSC350myda2OQA9FUkw37EK
         hYCKaEEXDMiSa0LFHyYM3NpWNne2PGmmIHq98/KDP60/UWvLl/0PfXNS1++OxZbvH7qg
         CV+w==
X-Forwarded-Encrypted: i=1; AJvYcCWIzhklqlnUD321T2omv+ptr0Dynt0Vc8Il/eNtm0z5ajK8JYC2LXNg+uxizvlRXTVY0Hs0yDCPiPbjcG18D4LgoHQLn/VLPMQHs0BU83ln2LQ=
X-Gm-Message-State: AOJu0YyHkeam9v4gWbg76Hwd4NVj5jZ8aYwxiaAX/iFlsF+VJNSYCioy
	/53hxE3ZJ5cn6LDzUa2UJ82qqbAE1Ha351ebpznV3VPmItSi9bcc/bco+EwNEdc=
X-Google-Smtp-Source: AGHT+IG4w2d+d/mJ759XM0KiXR4RmA19ohOjXUnDCY1XkA/1dBQ8TVz0UOlpK1xNy78lhWZCGvvxmw==
X-Received: by 2002:a81:8401:0:b0:604:3d5c:e1f5 with SMTP id u1-20020a818401000000b006043d5ce1f5mr3093758ywf.1.1707920937917;
        Wed, 14 Feb 2024 06:28:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX1h7o5xMbtIdBzpJ4yHLCYqZ71IQJGOUm4Ump6xzj8lrIeOmwGGKyNFYbighjEykedfwlNayIrNbUl0HT02MDmzYX2EcLK+fYwi9yeEBYJeks=
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id a67-20020a0dd846000000b0060795309574sm570344ywe.79.2024.02.14.06.28.57
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 06:28:57 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dc23bf7e5aaso5212740276.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Feb 2024 06:28:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVNG2nLNfH7ANiIHpwkrr5Co7fjcnFSzx6Lb1zrl+JELlP64ospoWHeljUq4EKbUrtGAKae2ENSIJSXsdbv51Tw+Zl4fVaacKW5g5YUTsH0fXk=
X-Received: by 2002:a25:9706:0:b0:dcd:23ad:4ef1 with SMTP id
 d6-20020a259706000000b00dcd23ad4ef1mr2569547ybo.31.1707920937211; Wed, 14 Feb
 2024 06:28:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214052144.1966569-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20240214052144.1966569-1-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Feb 2024 15:28:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXYKE+UjiJgdN3zQs-dKXrfBbkR1cMp1KYMuU=OPKL3Zw@mail.gmail.com>
Message-ID: <CAMuHMdXYKE+UjiJgdN3zQs-dKXrfBbkR1cMp1KYMuU=OPKL3Zw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779f0: Add GICv3 ITS
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shimoda-san,

Thanks for your patch!

On Wed, Feb 14, 2024 at 6:21=E2=80=AFAM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> This SoC has GICv3 ITS and PCIe host mode on this SoC can use it.
> So, add GIC ITS node into GIC node and update interrupt-map in PCIe node.
>
> Note that PCIe nodes need msi-parent property to use the ITS for MSI.
> However, it requires PCIe driver's update. Especially, vendor-specific
> registers' setting is needed. So, this patch doesn't add msi-parent
> properties into PCIe nodes.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Is there any value in adding the GICv3 ITS node now, without msi-parent
properties pointing to it?
I.e. does applying this patch enable extra functionality yet?

> --- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> @@ -1262,11 +1262,19 @@ ipmmu_mm: iommu@eefc0000 {
>                 gic: interrupt-controller@f1000000 {
>                         compatible =3D "arm,gic-v3";
>                         #interrupt-cells =3D <3>;
> -                       #address-cells =3D <0>;
> +                       #address-cells =3D <2>;
> +                       #size-cells =3D <2>;
> +                       ranges;
>                         interrupt-controller;
>                         reg =3D <0x0 0xf1000000 0 0x20000>,
>                               <0x0 0xf1060000 0 0x110000>;
>                         interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                       gic_its: msi-controller@f1040000 {
> +                               compatible =3D "arm,gic-v3-its";
> +                               reg =3D <0x0 0xf1040000 0 0x20000>;
> +                               msi-controller;

Missing "#msi-cells =3D <1>", which is a required property.

> +                       };
>                 };
>
>                 prr: chipid@fff00044 {

The rest LGTM.

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

