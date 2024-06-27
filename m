Return-Path: <linux-renesas-soc+bounces-6829-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C47691A660
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 14:14:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 376DB28A152
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 12:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F7B7152190;
	Thu, 27 Jun 2024 12:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4Ohb6jI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9BD14882B;
	Thu, 27 Jun 2024 12:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719490492; cv=none; b=mbne0PQnwiFTt2oatFhVlA8IYyW7sWk/bNkFaN4fimowhNlQAUqELZYdcByJXxcQfxRUtA0W+/NCvjA2y2ms55fNq8ibiYCPh5XkFBUm5v1Yv2w2CWSOquYQ90cWHfqVBUtWxhGeckQBIo0oziu+fvmUc7QCKszS0Ul5ty383fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719490492; c=relaxed/simple;
	bh=zUYOb9WAui3W9ZDW5gm2pjxYLINOkNYjIuikFEfk7ps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=McfvAcFvMYahMEncPiFhVCTwl+o+LokuRL52uXvo+pQOSdsd+U7HOOqlHOTyovwjNW//eeIsf/IRk3rvO+HmiXo/vjTRauDhTnAiLOe/RtdN/Mekou4UqX9f/j3VjzvzCW1zw9Tza0NuDsEoq+RWc215nia4bCyMhX5aZOYjgI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D4Ohb6jI; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-48f95cde70dso75214137.0;
        Thu, 27 Jun 2024 05:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719490490; x=1720095290; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Y9dQvZeDvG6Qre5RQuY4pOsTxAYw1JrSHuRLyGZaNs=;
        b=D4Ohb6jIhCOOTmG4vTGmM3pdKo0qsdEvFcU9Ay9iJP98CY1tqRj5swVQ2FPjkfpm2x
         dwvIlmQMYG1LFFiMFtrhTF/1A0I1DCjKfoZxk0ZY6iwrzxQSSPdZL99sWj+n0Ee4P5w4
         pDp/upKwp4Zd9w8PcpZ4+O0nP+jbW8tjFYaqwayZzAg8GDwaTyrQEkeXbEo7TdgOfpts
         /unXUXRQcUg+BtpmkxeHLS5ZutommSrmDnGLxeYF60pUzKg0EffnLCxVyfUM+Lja89nO
         3bO8YPk+N+IAE0LPuhNNHkun9tKsD4ehT+8sSblKWShCVJjJDqlIJzuq0i5yV+QJ1jdc
         4/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719490490; x=1720095290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Y9dQvZeDvG6Qre5RQuY4pOsTxAYw1JrSHuRLyGZaNs=;
        b=nAoUhVKl6yMLxVLjYZaH7t6tObm6+iZ3mJ9uIyqyD3XyfG6zZrR6/eZfYSE7Jx8C/N
         L8Rwg/OYnJNjB8cPlpJgOK2gNjptKON4T95TAiDINKTBizJnikJVciS+j/60C6XDt2Dc
         ZXs6S+d4fLvq7HBFHRPxFIfrKyxHo3eokMcZHEEG9jRn1CddDVIVwbstey++kRzDdobJ
         HCfbLmwKsWu01MPVVm0vN/3YnjUPTI1ZkFq/agesi+2icyJ317KVcBUCYiaEehanDhUo
         nv0lcGzY9R8gD8/KxfOcZLdNyURg7yDnPcGR0jgCDq9V2EE2UcZEQUJT2vu7T+/KMpsW
         DoIg==
X-Forwarded-Encrypted: i=1; AJvYcCWPgS5JPsaUemA40R2wg+j8EehjV4qtteL8G94GI2vvKqqjc9I6kZe73uuK1gO2mYK/R0T6LQG/8yZDdWTAvKSG3ZWTu6fyQIUP81S5Wb23EOCr40cI07D7rFtsWMK77OBXOdoo021G3YTzVRa6
X-Gm-Message-State: AOJu0YyG0vK6g8uyuUJo56YR6HDOJ04QaGmuO/ue8uzoZwMPWAYNXVAQ
	SJsuPyyFDBQ37YRLH/divg2smke3wAY8fsqkBwPl2f5KFnhd4qB1/9v0xj1f2wKOS1c4KhJgqX+
	bdABJFrZQV6rvyqZULragPFlY7XE=
X-Google-Smtp-Source: AGHT+IFnj0LoPat2p23pBEMhmQY5tAkx/uqQN5PPHRmogdvmw4zGGw/x0a9s7IvmXFZXBbMopPp/dS/dmfKZ2pdnOBU=
X-Received: by 2002:a05:6122:202a:b0:4ec:fc9b:a0bc with SMTP id
 71dfb90a1353d-4ef6d802c27mr12642429e0c.4.1719490489929; Thu, 27 Jun 2024
 05:14:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1718890849.git.geert+renesas@glider.be> <21f556eb7e903d5b9f4c96188fd4b6ae0db71856.1718890849.git.geert+renesas@glider.be>
In-Reply-To: <21f556eb7e903d5b9f4c96188fd4b6ae0db71856.1718890849.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 27 Jun 2024 13:14:23 +0100
Message-ID: <CA+V-a8u25Ci64SD3KXn3ma9LfvORR52T8VmPZhAuozynNx+4-Q@mail.gmail.com>
Subject: Re: [PATCH 5/9] arm64: dts: renesas: r9a07g044: Add missing
 hypervisor virtual timer IRQ
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Mark Rutland <mark.rutland@arm.com>, 
	Marc Zyngier <maz@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 3:01=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Add the missing fifth interrupt to the device node that represents the
> ARM architected timer.  While at it, add an interrupt-names property for
> clarity,
>
> Fixes: 68a45525297b2e9a ("arm64: dts: renesas: Add initial DTSI for RZ/G2=
{L,LC} SoC's")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar


> diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot=
/dts/renesas/r9a07g044.dtsi
> index c07ddd8124e6804c..d3838e5820fca19f 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> @@ -1334,6 +1334,9 @@ timer {
>                 interrupts-extended =3D <&gic GIC_PPI 13 IRQ_TYPE_LEVEL_L=
OW>,
>                                       <&gic GIC_PPI 14 IRQ_TYPE_LEVEL_LOW=
>,
>                                       <&gic GIC_PPI 11 IRQ_TYPE_LEVEL_LOW=
>,
> -                                     <&gic GIC_PPI 10 IRQ_TYPE_LEVEL_LOW=
>;
> +                                     <&gic GIC_PPI 10 IRQ_TYPE_LEVEL_LOW=
>,
> +                                     <&gic GIC_PPI 12 IRQ_TYPE_LEVEL_LOW=
>;
> +               interrupt-names =3D "sec-phys", "phys", "virt", "hyp-phys=
",
> +                                 "hyp-virt";
>         };
>  };
> --
> 2.34.1
>
>

