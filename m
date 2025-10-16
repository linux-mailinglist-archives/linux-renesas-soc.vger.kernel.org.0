Return-Path: <linux-renesas-soc+bounces-23131-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B09BE2263
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 10:29:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA41619A41E3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 08:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69A5D30505D;
	Thu, 16 Oct 2025 08:29:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE873043B6
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Oct 2025 08:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760603368; cv=none; b=LkzhGtxjslt1MMSdEege5myTodSZW8LIFF4frMyYyqMMsJBtegtD7W8UXFM7IF4VCDw8lsFi9RbZxU8jKBYyFwJ6KVCoyGxpb5Nx+lB3U5In6K+W7dvlXQpNnB+W+RA+fBWd5IEa6545RN8cLlpxbvJjJiPtNgEu/0lOV8Wa/kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760603368; c=relaxed/simple;
	bh=r1Z4OyxzKh48mLqr37vrm7i7AogylgNivvpQTAqom2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UYsugqZIEj4kaMiH2iH/udSMFGFQBimsn/W2H9CdztJxLPlE3oNAQdV7pQzLTOC4mLlNrrpeCxyVPy34vgXTfMJD9b45dfyvJFAjc58j3SDf7bPg27mu+qzjMSzY218ZN0cJe/xLFpw/LuB83iv6EfAPaXTFqaRbePJexKr5iGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-816ac9f9507so264473585a.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Oct 2025 01:29:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760603365; x=1761208165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IxMxNXtMy6Jnm1vHPFEexy61mNhacC+YBJiirqBC3iQ=;
        b=oo978HqsULj3Wg/Z1D5thT3pyt5VzQslyfBuhRG5b9zblamkL7RkBZLcTdBKlwijOj
         djTpfrAO+2nzyZK+/4YPbcJZaAiTepfksbQfu2eO6NWk/+BAXWypxBzRvPlWBQK3Xe42
         6zEyIL1A8SX8LE+5YVB4AryyEDHDSMkYXstXQN9SaGJVWapsDbuVtweAkxe8kwRMkg6h
         YsT3RHJOE9QaCRh3Wlm2l8lWj6F+ocM+PuS2KENovG4ayW2I1l5aAiFy6tdaX/FjwJ1k
         fPzkNx4EpxFLkAOveQTttID85IrHzEF8MjKdCAh1WiW6vgaHUR8CmilTAArjTO/I15f5
         ikSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOIYhKSWgwA1ymA8yw+MImwbOhJGgNQuSCYgPhN/JKERvuubVSazlY3skeU+KeylhGx6ZW2Uze79Jxf2wHIjymQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxW1+Wk/DrgijjM3eMIQViiKTp9RChXb6NEPzjU2SWgfkFJ9Ay
	sR/QPhBxExpKtJaYzx03elW6yyHFgHdfVhkCIwUKGIxOAGmLkmtjklnTXk9oqiCP
X-Gm-Gg: ASbGnctZ1Migolq++qf4MdF5Lktqh6UFf5tURV4PFMEu0NitrQzITIjmZsvvRUYRSga
	tlYz4MIfLPNZQaZtdvXtk1HR6SLxFT4/1PJH2iZYRU0KqYt6y66IJG+XiLFY2wn0MmDwIGhoSIg
	sVYViKfyG2KUz4u6tzVzZC0PmmPq2LM72e+/fKTlzd80kmF2eeisibRUiLyTEDp2lFDI1m3klO9
	vJ5+xlHehrKXxNPfaD5utMuFtWWpzdcwdVyPesuB9gxJae2xfHcyFWPLthGilvm87KMr4+n2a+i
	W41q+P0rEI9p88bUpTC9krY18NS0GPEGmKZz3vb6IXMS91iGV9UhGzGT0MRs57Jqoq51VGTsmgd
	Xtw3P6LmOopJxlb8goP7Ujjiv3eJPB4g1Osjt3CBPjPKqHFgo1MLV1kAFwm9G0oxtHHBFhXRdMP
	UemALGv5v7mT2xcsZ0/UCh5y2b86hll12oOGxtmDt39A==
X-Google-Smtp-Source: AGHT+IEgIKNnltyp3yc320xoBpjiEtj+Icy+sRnArcomaZbTyh4mdW8UIP7xAA7iTAiiV4pgP24uhQ==
X-Received: by 2002:ac8:7d01:0:b0:4ce:ef41:f2d9 with SMTP id d75a77b69052e-4e890db1537mr38168541cf.1.1760603365330;
        Thu, 16 Oct 2025 01:29:25 -0700 (PDT)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com. [209.85.222.171])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-88f7a97c9acsm104314185a.48.2025.10.16.01.29.25
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 01:29:25 -0700 (PDT)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-88ff65374f3so23204185a.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Oct 2025 01:29:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWcqoKgiRiXETxH5TPBrM7XvDfGO5GzshA795mv/oSDpmMV0g2woCtQpoKnTFj1TAz/NwtlEmDifYkKGIN6wkas/Q==@vger.kernel.org
X-Received: by 2002:a05:6102:801b:b0:59e:73d5:8b57 with SMTP id
 ada2fe7eead31-5d7ce7bd161mr1324148137.16.1760602942005; Thu, 16 Oct 2025
 01:22:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org> <20251015153952.185249-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251015153952.185249-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Oct 2025 10:22:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVdW+tMA1=g9D+BQV0fk0kis8FzyQgf7BpN-u=pi5eQfA@mail.gmail.com>
X-Gm-Features: AS18NWDLIWGJb_IOoRvlCMu35mq1PVX8494ciH6v3rxbYpQaD3fQbpHBOXBZzcQ
Message-ID: <CAMuHMdVdW+tMA1=g9D+BQV0fk0kis8FzyQgf7BpN-u=pi5eQfA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
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
> present in Renesas R-Car R8A77960 M3-W SoC.
>
> Reviewed-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se=
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V2: - Add RB from Niklas
>     - Fill in all three clock and two power domains
>     - Use renesas,r8a7796-gpu for R8A77960 compatible string

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> @@ -2575,6 +2575,22 @@ gic: interrupt-controller@f1010000 {
>                         resets =3D <&cpg 408>;
>                 };
>
> +               gpu: gpu@fd000000 {
> +                       compatible =3D "renesas,r8a7796-gpu",
> +                                    "img,img-gx6250",
> +                                    "img,img-rogue";
> +                       reg =3D <0 0xfd000000 0 0x40000>;
> +                       interrupts =3D <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&cpg CPG_CORE R8A7796_CLK_ZG>,
> +                                <&cpg CPG_CORE R8A7796_CLK_S2D1>,
> +                                <&cpg CPG_MOD 112>;
> +                       clock-names =3D "core", "mem", "sys";
> +                       power-domains =3D <&sysc R8A7796_PD_3DG_A>,
> +                                       <&sysc R8A7796_PD_3DG_B>;
> +                       power-domain-names =3D "a", "b";
> +                       resets =3D <&cpg 112>;

status =3D "disabled"; ?

> +               };
> +
>                 pciec0: pcie@fe000000 {
>                         compatible =3D "renesas,pcie-r8a7796",
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

