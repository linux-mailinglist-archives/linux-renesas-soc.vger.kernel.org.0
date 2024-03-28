Return-Path: <linux-renesas-soc+bounces-3506-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDC7873429
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Mar 2024 11:28:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BCC41F21FB0
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Mar 2024 10:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A0B85FDA0;
	Wed,  6 Mar 2024 10:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oN5oJ808"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6AB64A
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Mar 2024 10:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709720821; cv=none; b=JOgnTwrIkzGfnhUVeVd+juWOVHt/SONyfDb2QXruRfecyC2B0uPH6ZcDIwK4NNp0RDvkBJYyTAshJkKZQj/IPjjqmnkHrxLEqL5tx2Rl1+YXWJGD5FZK+BoKfN+V3FadLs1Glb2pHQcg5Ps1VmW6Lp20X9SRxpEN+mMMOgQyRfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709720821; c=relaxed/simple;
	bh=+vgV13prNibuaI8yJvc8H0LTr+jXEu2xgV5VNrpuQF8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lZz4/3LgjQTSSraTEKILGudHKfzwBReMA+YBNRJOdW7r3H4WErpyMZP0UoZM985wcHtQ4lFoktDU9dQ5fPhvl1JrRiel4o2gWFEcE77WOB2c4wOeCPDwDPvJfug8S2MdW4hFGeGq23LyqwXJtQjziA4HcGovQ7aCnfYd2lOxAOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oN5oJ808; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dd02fb9a31cso3637530276.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Mar 2024 02:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709720818; x=1710325618; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ytLZrm+K6B+y/qgp5MHdxGITQKkVAxUSbIjux0E6L/o=;
        b=oN5oJ808iICMorKCwFTwyczdhXGAC57PI6iH2LKpD1Tlvy129B08MNVi1zwd48JeLF
         p5uYMzxpMGVC9uPLi90mDeXqwc+q76/n85tqwvmGjnpQM1TV4J5kN0FIlxGvuwoNVMHW
         8hjxIV8zt3jSDCU4DxhiQvODDpSIbuaddO25nTM2ny7y53Thyg2pnDERV5QZZQLeadom
         DTv91Ltf7etfF66LYQCcXMrjn+Lp/yQtcs7S/7DaPhg9y4OZz6qub++Hs3dtHW/SRHZ1
         XcwNqMpJwdCubEUFpTPbuz6YNEZP3nvTqms0cZ+0NT/pfnzGY5Bm3ZFVIOlE+YmlxpCJ
         0oMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709720818; x=1710325618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ytLZrm+K6B+y/qgp5MHdxGITQKkVAxUSbIjux0E6L/o=;
        b=tYkEY10Po7ImoDtzHlxaKmjkre0cJmw5b+XSos5I6OYvGcvXGT9kk5Afd2LVJQMoxU
         t8VvrXMDnas5H00MDTi6QiRha+aA+mKtXizAIM8c7WIyaooqIJkhRYWVqOdID28MG+/O
         BK/oYZJMqYIK7qHXFZbkIfedEkykuAUCmixG1Q4E55XsP+ngr0vE1o6aN1Djwa8jjdYJ
         sFFsfSsdJ8qAFv8v2Jm3ptE7IlWTMwyJZWQU5l/vhmDpjo7ayHHd6jju9qpXFkrqw2od
         OumyVRFS9hgaN1F8gM4nbrWUxQbIL0Bow8kJ3L6FFnJwyrzf8zu4dYzopd98Sm8qvMUH
         0HSA==
X-Forwarded-Encrypted: i=1; AJvYcCXfWg8+8D0yBl79s6CUpi8F5n7e5JeoAkU6fZweRtu5KkrV6TKOb7fLhpRl/GPtdKbl/QU2E8cNDdLgA59dnFt52gD6vUhyfAU7jS9my/1znPo=
X-Gm-Message-State: AOJu0YwEeg8FtRlOm5RMbf99KSjKkX3fZ+jrvmfaE5Y5W5fkO0MHZWSp
	+s14QADIDOphJD98AXrLUW548G7ZIjyujdEF9YqSPSTHyPm12GJzwdgiE8GVOFF6Heg30iNVOO7
	8zbTowQnWKMleJWxGYPM0irnjFBeHJMtNyBo+Vg==
X-Google-Smtp-Source: AGHT+IGS7yLn0/eVgFjRnv/iZx/978VY/xjm7oyt5HwHDPzF8udJwLRjyV3fMbxW//ZVV7Ou5p0GzrEFijVuBzAKylA=
X-Received: by 2002:a25:ac68:0:b0:dca:e4fd:b6d5 with SMTP id
 r40-20020a25ac68000000b00dcae4fdb6d5mr12184178ybd.27.1709720818600; Wed, 06
 Mar 2024 02:26:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <77f150522096d55c6da0ff983db61e0cf6309344.1709317289.git.geert+renesas@glider.be>
In-Reply-To: <77f150522096d55c6da0ff983db61e0cf6309344.1709317289.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 6 Mar 2024 11:26:22 +0100
Message-ID: <CAPDyKFpA-dqrcao6yzxVJP368XWuZYC2gtUbS9FZJNWzYH_HnA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: renesas: rcar-gen4-sysc: Reduce atomic delays
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 1 Mar 2024 at 19:23, Geert Uytterhoeven <geert+renesas@glider.be> w=
rote:
>
> The delays used with the various atomic polling loops are already at the
> maximum value of ~10=C2=B5s, as documented for read_poll_timeout_atomic()=
.
> Hence reduce the delays from 10 to 1 =C2=B5s.  Increase PDRESR_RETRIES
> accordingly, to retain the old (generous) timeout value.
>
> Measurements on R-Car V3U, S4, V4H, and V4M show that the first three
> polling loops rarely (never?) loop, so the actual delay does not matter.
> The fourth loop (for SYSCISCR in rcar_gen4_sysc_power()) typically ran
> for one or two cycles with the old delay.  With the reduced delay, it
> typically runs for two to 17 cycles, and finishes earlier than before,
> which can reduce loop time up to a factor of three.
>
> While at it, rename the SYSCISR_{TIMEOUT,DELAY_US} definitions to
> SYSCISCR_{TIMEOUT,DELAY_US}, to match the register name they apply to.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied for next, thanks!

Kind regards
Uffe

> ---
>  drivers/pmdomain/renesas/rcar-gen4-sysc.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/pmdomain/renesas/rcar-gen4-sysc.c b/drivers/pmdomain=
/renesas/rcar-gen4-sysc.c
> index 728248659a97e8cc..66409cff2083fcd8 100644
> --- a/drivers/pmdomain/renesas/rcar-gen4-sysc.c
> +++ b/drivers/pmdomain/renesas/rcar-gen4-sysc.c
> @@ -50,13 +50,13 @@
>  #define SYSCSR_BUSY            GENMASK(1, 0)   /* All bit sets is not bu=
sy */
>
>  #define SYSCSR_TIMEOUT         10000
> -#define SYSCSR_DELAY_US                10
> +#define SYSCSR_DELAY_US                1
>
> -#define PDRESR_RETRIES         1000
> -#define PDRESR_DELAY_US                10
> +#define PDRESR_RETRIES         10000
> +#define PDRESR_DELAY_US                1
>
> -#define SYSCISR_TIMEOUT                10000
> -#define SYSCISR_DELAY_US       10
> +#define SYSCISCR_TIMEOUT       10000
> +#define SYSCISCR_DELAY_US      1
>
>  #define RCAR_GEN4_PD_ALWAYS_ON 64
>  #define NUM_DOMAINS_EACH_REG   BITS_PER_TYPE(u32)
> @@ -97,7 +97,7 @@ static int clear_irq_flags(unsigned int reg_idx, unsign=
ed int isr_mask)
>
>         ret =3D readl_poll_timeout_atomic(rcar_gen4_sysc_base + SYSCISCR(=
reg_idx),
>                                         val, !(val & isr_mask),
> -                                       SYSCISR_DELAY_US, SYSCISR_TIMEOUT=
);
> +                                       SYSCISCR_DELAY_US, SYSCISCR_TIMEO=
UT);
>         if (ret < 0) {
>                 pr_err("\n %s : Can not clear IRQ flags in SYSCISCR", __f=
unc__);
>                 return -EIO;
> @@ -157,7 +157,7 @@ static int rcar_gen4_sysc_power(u8 pdr, bool on)
>         /* Wait until the power shutoff or resume request has completed *=
 */
>         ret =3D readl_poll_timeout_atomic(rcar_gen4_sysc_base + SYSCISCR(=
reg_idx),
>                                         val, (val & isr_mask),
> -                                       SYSCISR_DELAY_US, SYSCISR_TIMEOUT=
);
> +                                       SYSCISCR_DELAY_US, SYSCISCR_TIMEO=
UT);
>         if (ret < 0) {
>                 ret =3D -EIO;
>                 goto out;
> --
> 2.34.1
>

