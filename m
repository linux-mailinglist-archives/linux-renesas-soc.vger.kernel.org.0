Return-Path: <linux-renesas-soc+bounces-26727-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E59F8D1E45A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 12:00:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A8663041CC2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 10:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29D2839341E;
	Wed, 14 Jan 2026 10:58:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440CF396D13
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 10:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768388323; cv=none; b=TVy2c4Oz3yuSQA5Kh8xPDzSDROb598+e1Lr0uHnUgT0Jtbt622w6VB5GCBeuVQlITcx0qhlS7bGx8bY6GX3Egq08doxdo5vzS6xYkYvca0Ndl7TThmHbRgUpYCM7i3K/qTPPpxrlkrrCOtPqOgUPq1QX1Pp6ZI0E9qpntyu12JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768388323; c=relaxed/simple;
	bh=qd0533iR+vH2yJrigMDVDGXUaNwIKBKelU7zTFCg0J4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NgiyO8iADl2SOwkcRuhRwFjhys6PjwLfj6vBlE4J83AwuuN8lT5QNK/DhbVRVhJOfGfIMbhBujxvaRihxgYpJ42VMi90rZ+3QFLgaqD+HpeVj7YXC7dSXFW5uYz6v008aEtjlGGOiTaGBfpyf11Sb7ab5JuVzbbTWcVzyA8W6qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5636274b338so658596e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 02:56:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768388218; x=1768993018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jUj0QZHjKgRIKXHXvtdXuKCfmZJrYVq/PNABBtIJEcs=;
        b=AWPPiAkFYhhxJ7rWMw+ZhdSPhp+HDjKNebzEwqALTbu5+703JK7K3685V7wH5xtwlZ
         iMJlzGdPYZrw7mcUvlHYdqSxAP0ByOxu+xrLWKGKWx2yjUFkVohVW/QaREiShFTiAl+j
         Z3tTG2oor1Iq3VlpRZMeeiTX+hhbWHuv9V/lZKZVzQIWJ3fjnzSbG6YY+gsNbIPtLSGA
         8+FEO4AlstV9D8ZFKRdyrtYOS0m+722pgG7kn2Rtlc/Wjowgqw7fhahlUYH4GBAJeXPG
         H7Cr+mbkY3uKeZhiYu8ZPwiN8Uv76EhgW3KUYVKv8t1srHv8+8XTOxAjr7NYOchGz0GB
         H11g==
X-Forwarded-Encrypted: i=1; AJvYcCW3XI9NJmU0/d7jqx8/Qfy/C6tM8gyPaf/WK8pfqNJmGdTlFyPRAN9eU/pWqyUS5szzUbc49YfGLrhTceY0raIK1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNkkjpXeWb/qyeKfFwF21HxlkEzlLqROMYAWbWVlPDbQFzIr1M
	5ujOUNd37FGXPK2ddE5Es8lVJOmigl87TCm5UsktJzXEaQF5ls0Yy1rmEZQO9mdy
X-Gm-Gg: AY/fxX7O90FbMIZi4WxDWMgzNTkItBIDXr6oYcBw3iGGjc3kmF/Ic5dzHxVQCEw61ld
	Y6R5aPUuK5N1YgvyUf/ZoO1z8ZK/wu+AjFt7LyvTJLl8mN8bH+4+v6iy5pMt9hVwOi9GVME6iH4
	MytPxm1gyUbD5/8DMjnzPkf3cVs+hnDz1YX9ClbbW5U742g+Gna75eJFd95OR7twBkSsFeVvrid
	6ER+2uZJYxFA7pEW6E9Yci8X311pDLiCvlJTfruWdBs3G5cmjFVIxWBBVgMS2Bmz27mbZmQvXkw
	HPJtgZjXHvDwTRXDawwDI0AzjOJkws3O+kb+hpsswWMCD/ry2gDLLEDIlHxPUNuaI6E8gYChYLX
	HPr7JmdBsmbX+0aw5zP8d+VAs24VQ8sQAWDX2iNj8nXEQBZpRIHPeXjRAwxFCa3MmrmFtBKVuZ7
	e1nJUa7p8FILmDIRikK1W90zmas/9DdvlCmjKlSBWxJdkXOy06
X-Received: by 2002:a05:6122:1698:b0:563:50ff:69b4 with SMTP id 71dfb90a1353d-56395c623f5mr2394350e0c.7.1768388218140;
        Wed, 14 Jan 2026 02:56:58 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5634d9162a4sm20668515e0c.15.2026.01.14.02.56.57
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 02:56:57 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-93f5910b06cso529702241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 02:56:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUWhSUzPRT56Xsb0J6YgscsAhfVLKFHfWgDocQUBcyoJi9uY0q+zHSH8/+P1IZBOiNuDU4m/VeEiZuHISaz8QF+Yw==@vger.kernel.org
X-Received: by 2002:a67:e7ca:0:b0:5ef:a3c1:86e1 with SMTP id
 ada2fe7eead31-5f16caf02dcmr2636191137.11.1768388217149; Wed, 14 Jan 2026
 02:56:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260104222653.1659382-1-niklas.soderlund+renesas@ragnatech.se> <20260104222653.1659382-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20260104222653.1659382-3-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 11:56:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW-yM0=1nVqWvCMD0a-5izxFE1LLsuNuFCtfz=Od=QB1Q@mail.gmail.com>
X-Gm-Features: AZwV_QghUYTO_u0eAcOvYe5E9g88VVEx4bvinDAi6XyZ4obaigG9hTvrBIdoK34
Message-ID: <CAMuHMdW-yM0=1nVqWvCMD0a-5izxFE1LLsuNuFCtfz=Od=QB1Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a77995: Add GE8300 GPU node
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Sun, 4 Jan 2026 at 23:28, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Describe Imagination Technologies PowerVR Rogue GE8300 BNVC 22.67.54.30
> present in Renesas R-Car R8A77995 D3 SoC.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> @@ -1295,6 +1295,21 @@ gic: interrupt-controller@f1010000 {
>                         resets =3D <&cpg 408>;
>                 };
>
> +               gpu: gpu@fd000000 {
> +                       compatible =3D "renesas,r8a77995-gpu",
> +                                    "img,img-ge8300",
> +                                    "img,img-rogue";
> +                       reg =3D <0 0xfd000000 0 0x40000>;
> +                       interrupts =3D <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;

119

> +                       clocks =3D <&cpg CPG_CORE R8A77995_CLK_ZG>,
> +                                <&cpg CPG_CORE R8A77995_CLK_S3D1>,
> +                                <&cpg CPG_MOD 112>;
> +                       clock-names =3D "core", "mem", "sys";
> +                       power-domains =3D <&sysc R8A77995_PD_ALWAYS_ON>;
> +                       resets =3D <&cpg 112>;
> +                       status =3D "disabled";
> +               };
> +
>                 vspbs: vsp@fe960000 {
>                         compatible =3D "renesas,vsp2";
>                         reg =3D <0 0xfe960000 0 0x8000>;

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

