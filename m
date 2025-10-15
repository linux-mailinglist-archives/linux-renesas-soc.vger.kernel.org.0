Return-Path: <linux-renesas-soc+bounces-23049-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A22BABDD9E8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 11:10:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A4CAC4FDE41
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 09:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E85E4308F1B;
	Wed, 15 Oct 2025 09:10:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A97A3090F7
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 09:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760519426; cv=none; b=ONir7PkU7KAdotBLT9cdQ1hzUrFqsUDEImHeBEsemEP2rh4w/+zCJIqHNDO04tb6ePlNBt5jSHhe7NzqNom0h6Ewp/KhVXVH8HjsS17bGDIPDblsBlIfYjyvbwD2inw9PgLt9Es7EbUYI3H4h5dWi7sACeVQtOLdRgzP3e1tBqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760519426; c=relaxed/simple;
	bh=nozLRYQe8UdUB+yAdcgrpHH0NZNgUwItZr/cn1D4vEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hGD/ZChsAdLXP4PYxIQjp1ocYfyQHB5paPXDfHFGqkSfv19jG/Xi5lPhexAsHh/PDG2Aqpzmh2hrK7yJF3o4yue4lCFgv0UDKPMcSWGAAVyd00+XOYwCRayLT2+cOaPoO0kJqDSztxUc8UAMTqktqO6TZcwkcGlZCpgsVoxhFME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-8e261568020so1261210241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 02:10:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760519424; x=1761124224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tJmRJlu9H8wURlz4KPU2uyoao6Y2zyTwzoAnkPT6lmM=;
        b=vpQS/uBR1OGjsfe4jdHHqCQfTPT7KC/ajIuU0V3w77vMdZB/RscXGNPbnyp8S80Uou
         gNjVDzSpawiaSeqp7pWgMVW2dxsqvdEENtgSOyAA9pCg4vKnD09+wVyU3ESp0n0tfaAV
         CAhqgGFY3MQmG+3jOj//4x9inLNJpMZ+m/LYu/4FPgKZGsXs+ikPq7pbrMP2S5py9DKl
         75+VkEPEmqrz4345WUBVD4q4GuMOWXTjrdzf0N6Rc+Z1zwzeN6MPRAKo2lmrCbRpfQB+
         xVJVd3aVNl6aToMokaVUyKLqoUOaH4yMKHjtedpdClkYT05aR8Ym8w3cXMYVdoKF6UGX
         DNMA==
X-Forwarded-Encrypted: i=1; AJvYcCXWsKhgZJfp/HZIoW6rpVnTksOUIxSxCEEzbpjgKgadV54Xv96jFziOtHqAPKRavBXN4HobP9bRXsPVfwfD3sz5Qw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzznAJv0FGqFarVw5i1I9uCWqNHJlPKV/lnOLGOJBnLDS4Q5jy2
	9RTQ4dXMJehnwgVdSQ/t95q2rq+KiDpC8oufc4cWx5/SksYS3EO/EGlV4GvgJ/TP
X-Gm-Gg: ASbGncteCFHFVC0yE1u4e2GRgkbJNTekYQWPIgCcxzbVvs1RXf2AupTe2FlpQ2HdCwm
	k8TXlWpugV9ho513wXe/iUQk1ki8BKkvj8RdsEeVX7HkpKRuuYbpU/zfgQe5u2ap+NGzuErmLDa
	iyKZpyF54Mx0kwbjbPEDmnqK/f8Bp0DSUSxVCllUXhVn17vjYmOM4ndYo8d+KfeE09rw/ZN/odn
	b5MuyGMtaY+mhafg09c9y+ujyN38yKIDti1XiOr8Mys1OoneJ/VQ29D67z3rvE22OwHTrVmPHJm
	jNCGSyJNubslC95H4XnLBN3FHrrDtP9YylKvF821nmlXdPFgOLswhCA1EA0LszzpQ38CcTfEY4C
	O5DFcx/Psd9T0Z//3m7hEdfbExN1/SPF7aEvWEuIMJQowp8MeJh6sbaYI7VzyjVklhzAbBcT0zE
	2Q5yg=
X-Google-Smtp-Source: AGHT+IHkRiwBhfQwzhltgMXypBdKELnPZihk+5pgyRDljNSl3NGuzmkr6vHYlVIWIZJekz3ISd5hVQ==
X-Received: by 2002:a05:6102:2913:b0:5d6:1309:8a4f with SMTP id ada2fe7eead31-5d613098a54mr3547074137.39.1760519423590;
        Wed, 15 Oct 2025 02:10:23 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d5fc713dbasm5125942137.4.2025.10.15.02.10.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 02:10:22 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-8e401b11bfaso1773181241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 02:10:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVavcbFiQKMNfk8w7jTkJ6azDOUqNKzkJ/tMKThIEp3kK20UvZYcBmCV1o7NoBShkJGRIpatfpX/j1RhHc4UtcyuQ==@vger.kernel.org
X-Received: by 2002:a05:6102:54a7:b0:5d6:df4:4a9c with SMTP id
 ada2fe7eead31-5d60df44b27mr3945077137.38.1760519422390; Wed, 15 Oct 2025
 02:10:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013190210.142436-1-marek.vasut+renesas@mailbox.org>
 <c65950f5-010a-4d5d-88d9-60697eeddb46@imgtec.com> <f4e1897c-7073-4ab0-92b3-6f7d69382825@mailbox.org>
In-Reply-To: <f4e1897c-7073-4ab0-92b3-6f7d69382825@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Oct 2025 11:10:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVpb-0TJ4AoqjAGbdErw65193+j1-HbXCyvvwf8MT6yLQ@mail.gmail.com>
X-Gm-Features: AS18NWC0NtvnYK5U9YXJyT8uG9UQFbJEFgUG9T-bnGHWW0_GW4mwUzABObId4Tc
Message-ID: <CAMuHMdVpb-0TJ4AoqjAGbdErw65193+j1-HbXCyvvwf8MT6yLQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: gpu: img,powervr-rogue: Document GX6250
 GPU in Renesas R-Car M3-W/M3-W+
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Matt Coster <Matt.Coster@imgtec.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>, 
	Alessio Belle <Alessio.Belle@imgtec.com>, Alexandru Dadu <Alexandru.Dadu@imgtec.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Wed, 15 Oct 2025 at 00:48, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 10/14/25 1:52 PM, Matt Coster wrote:
> >> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.y=
aml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> >> index c87d7bece0ecd..c9680a2560114 100644
> >> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> >> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> >> @@ -13,6 +13,12 @@ maintainers:
> >>   properties:
> >>     compatible:
> >>       oneOf:
> >> +      - items:
> >> +          - enum:
> >> +              - renesas,r8a77960-gpu
> >> +              - renesas,r8a77961-gpu
> >
> > I think this can just be renesas,r8a7796-gpu; most of the devices in th=
e
> > dts for these SoCs appear to use the same pattern and the GPU is the
> > same in both.
>
> Not really, the 77960 and 77961 are different SoCs, that is why they
> each have different specific compatible. Of course, most drivers match
> on fallback compatible, since the IPs are mostly identical, see this:
>
> $ git grep compatible.*7796 arch/arm64/boot/dts/renesas/r8a77961.dtsi
> arch/arm64/boot/dts/renesas/r8a77961.dtsi:      compatible =3D
> "renesas,r8a77961";
> arch/arm64/boot/dts/renesas/r8a77961.dtsi:
> compatible =3D "renesas,r8a77961-wdt",
> arch/arm64/boot/dts/renesas/r8a77961.dtsi:
> compatible =3D "renesas,gpio-r8a77961",
> ...
>
> $  git grep compatible.*7796 arch/arm64/boot/dts/renesas/r8a77960.dtsi
> arch/arm64/boot/dts/renesas/r8a77960.dtsi:      compatible =3D
> "renesas,r8a7796";
> arch/arm64/boot/dts/renesas/r8a77960.dtsi:
> compatible =3D "renesas,r8a7796-wdt",
> arch/arm64/boot/dts/renesas/r8a77960.dtsi:
> compatible =3D "renesas,gpio-r8a7796",
> arch/arm64/boot/dts/renesas/r8a77960.dtsi:
> compatible =3D "renesas,gpio-r8a7796",
>
> I can turn the first entry into renesas,r8a7796-gpu to be consistent
> with the legacy 7796 name for 77960.
>
> Geert ?

Please use "renesas,r8a7796-gpu" for R-Car M3-W, and
"renesas,r8a77961-gpu" for R-Car M3-W+.

> >> +          - const: img,img-gx6250
> >> +          - const: img,img-rogue
> >>         - items:
> >>             - enum:
> >>                 - ti,am62-gpu
> >
> > You also need to add img,img-gx6250 to the appropriate conditional
> > blocks below here for the number of power domains (in this case, 2) and
> > clocks (that's more complicated).
> >
> > These older GPUs always require three clocks (core, mem and sys), but
> > it's not immediately clear from the Renesas TRM how these are hooked up=
.
> > I can see three "clocks" connected (fig 23.2 in my copy, clock details
> > from fig 8.1b):
>
> Which revision of the RM is that ? There should be some Rev.M.NP at the
> bottom of each page.

Rev.2.40.

> >   - Clock ZG=CF=86: Appears to be a core clock for the GPU (3DGE). That=
 would
> >     make it our "core" clock.
>
> This should be 600-700 MHz clock on M3-W , so that sounds like a GPU
> core clock.

Agreed.

>
> >   - Clock S2D1=CF=86: Appears to be a core clock used on the AXI bus, m=
aking
> >     it our "sys" clock.
>
> This should be 400 MHz AXI clock, but wouldn't that make it "mem" clock
> ? I think this might be the clock which drives the AXI bus, used by the
> GPU to access data in DRAM ?

Agreed.

> >   - MSTP ST112: Appears to be a whole module on/off control of some
> >     description, and definitely doesn't align with the missing "mem"
> >     clock.
>
> Maybe this is the "sys" clock, since it toggles the register interface
> clock on/off ?

Probably.

Note that both ZG=CF=86 and S2D1=CF=86 are always-on.
MSTP ST112 is the only gateable clock, and it is controlled through
the PM Domain and Runtime PM.

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

