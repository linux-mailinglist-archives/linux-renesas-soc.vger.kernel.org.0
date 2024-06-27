Return-Path: <linux-renesas-soc+bounces-6830-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7A491A666
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 14:17:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 706C91F260DD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 12:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 079A6153BF6;
	Thu, 27 Jun 2024 12:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OY4BRyJe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814A21304A3;
	Thu, 27 Jun 2024 12:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719490616; cv=none; b=Cr+vfzlQWBl7RzxSQtdfUILMVZN+nxDS2Oe1R90xm0dkgeGglxTrGLdSLtFlFIO3IRm+HT3XehMeWx3fDg1kKxxmSwe+cNvFATq6OHKDnzbCYCzEqEVkb7OAHLhrPfDS6M7yd7PCzqF4Y/nMwOvkqT0vfFO2tiax98+4ZMFAev0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719490616; c=relaxed/simple;
	bh=qYwDBLAk1qigX5BoTuaQo8tSM+dSjUUUdY9SZlGwuhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=asKa7zILN8/Cv2ky3JpV3hew48vqUH9EWwBphEAN2De5C3o6DxwViNxO2UJWqZoo6/CFnIcmw3f5wdOOUAnoebX8k4QyPP/XK3bDD9voQeDgXV94zUzGeyT0DhmGstEHgGExZj+bSq37OL1j7+jJkHcCCmyZS9yj1VDrBlUVC44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OY4BRyJe; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-4ef31ac8b80so2672287e0c.3;
        Thu, 27 Jun 2024 05:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719490614; x=1720095414; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qXrCK6aViHZBIBVpTq3rbm7WKWJVtcvv5zFkuA5qScc=;
        b=OY4BRyJe/Z9OxO+a2zWP0YXzi6Qfy6YPFmwW7wORC+VjZ756S4/5RDXLJmLnGh2yyr
         iAeiH6Bj1Ka51B613/anyKxRGis6ABoQXyqZ/lxNMLm4LdKseUGokF9YwXOR60Mbz++F
         cDEkwBs8sn+qboiSfKHthRMtvmkHaGtCU7X3YwxnGwAexCHqbG6xCheamUgDK+swFlll
         +O/6fKIokuANFGSjDLd+LqfDBWRXS6Bs91RaH5xYRVmOZpNIRVjvGJM+hMF309l1RgT1
         HTFrKDADY3SsEXGwRDmtPCiB9ClW0o4OWWq7JA/Fmc9Q9QQHsu5Mj275yegVaeYLFRVx
         XOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719490614; x=1720095414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qXrCK6aViHZBIBVpTq3rbm7WKWJVtcvv5zFkuA5qScc=;
        b=BtUZwyZd1Ci+wLPxbEsyCNIzqkjZjXPOi+/Qz1e0HmCWh5t63CHzb5holkAruT4taZ
         bDkPqXZI6X9/ebGo7CoRh/TS0vsYOOZ/d0wzyt8gtmqU7/yQGyV8AqAEC4wOFmBwBpjC
         Kel7esOKdkrNDOWqX6GYzt+eQEQrofIO88nkt2nvPysUnzFwEvqDwojyeMV1Sn570NP6
         XmqRibLbckiEF+L241YJnXoWVhnFXO5rRObRMV3C4H4PLfEOAPzUKw1RoINVJOwUJe/q
         szC4IluqvOBoCZVMISD5uenvPHGVC0OBLThoPS7ih7QPb2f9oqKoOecYSDpTP/qT8KUV
         94og==
X-Forwarded-Encrypted: i=1; AJvYcCUGKbk5ynYyzbhix5ucZ1ySdd14kRWrGPbsK8ZcAQGzm8uvWwP2slrEKRn+p5JmS0Q0SriWmmb8+D7iFGruEzAK45APgQgjtXUvt2lixGluLBM8OK0FcUrhlcvnrqD0WP3eMUJ9AVB5+2KKGOp4
X-Gm-Message-State: AOJu0YyeAd/e+/YZhg5dwV03aOdF/UxbKWwWJI4xg3/JNxufsJHxXxrb
	IiI5MP3sPC8vlZIo49009MKG6e2kSNIUCK8Jg3hEK+27Q6OS00O1GO9dIj1vIKIjsn+Y3BOPpHG
	J+jI0id7+ogpasAQfzt3NrFy6wEE=
X-Google-Smtp-Source: AGHT+IHt18UlNzUc09/MY9SSTOudlA9KqeIPDV4PHzkleJD+CGth5dBWfsdC8d5NPI3HiRmJTZB7z9U9qIZ/0Gq2gMg=
X-Received: by 2002:a05:6122:45a9:b0:4ef:530b:9d56 with SMTP id
 71dfb90a1353d-4ef6d80805emr13133959e0c.6.1719490614306; Thu, 27 Jun 2024
 05:16:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1718890849.git.geert+renesas@glider.be> <834244e77e5f407ee6fab1ab5c10c98a8a933085.1718890849.git.geert+renesas@glider.be>
In-Reply-To: <834244e77e5f407ee6fab1ab5c10c98a8a933085.1718890849.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 27 Jun 2024 13:16:27 +0100
Message-ID: <CA+V-a8tOQsC5sEY2YtTZh7hZdMG7rpTTSbJg+8ZH3qBUvkbtow@mail.gmail.com>
Subject: Re: [PATCH 6/9] arm64: dts: renesas: r9a07g054: Add missing
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

On Thu, Jun 20, 2024 at 3:02=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Add the missing fifth interrupt to the device node that represents the
> ARM architected timer.  While at it, add an interrupt-names property for
> clarity,
>
> Fixes: 7c2b8198f4f321df ("arm64: dts: renesas: Add initial DTSI for RZ/V2=
L SoC")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm64/boot/dts/renesas/r9a07g054.dtsi | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi b/arch/arm64/boot=
/dts/renesas/r9a07g054.dtsi
> index 8448afa8be54b8ec..1de2e5f0917d91f4 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
> @@ -1342,6 +1342,9 @@ timer {
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

