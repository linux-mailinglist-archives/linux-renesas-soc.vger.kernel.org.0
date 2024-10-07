Return-Path: <linux-renesas-soc+bounces-9535-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9EA99359A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 20:02:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0ADF41C211AE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 18:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04B971DDA3D;
	Mon,  7 Oct 2024 18:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L6A2flCq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731841DDA1B;
	Mon,  7 Oct 2024 18:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728324121; cv=none; b=sa6TDHcJ29NSpzbDodZmpDuW1GpAXmF9Y297/o+g7c0uSNiDG8ftYEgTGUyDPQuwmJdOhhdsDLfqLI1/vSSP44wlnN/2T2fathle64MAo0tMeGQOrGpXipF98diRVqemT8pK7h3nE5drjz885seUO4r/Xz8LXFPbr7UNQBXoB/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728324121; c=relaxed/simple;
	bh=A+8Hekfb4r53gfGCb595vq1ys4UujpdKzRnv+/gLKTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P92B7O2+SfeWnvtjFujSchUGXipDJWdoT95n+LEQiU+buRh8JOo07NdHgHnhm2QKtnEOR4DkgUIfuWgT084UVk5LLoT76MHTNB8G7JXUTjNzOngd7oAIziaDKjfqoCj7/zqu5kKXTaeGP2MNzIMYXKqa2A+0KlGhfRf8A7l2uuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L6A2flCq; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-84eb1deaf03so1162197241.3;
        Mon, 07 Oct 2024 11:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728324119; x=1728928919; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/KVxz5nl/+CkP7JgrEXaeui4XePZ7Km9UGFcRbVFBbw=;
        b=L6A2flCqqt/EgfY+HuqPWajDfYlSXyTyNQTRFre4aydnMThDD9KGH65mt8lfyYeA8L
         21v1RnYXjCBgHusjQ8Cz/d6Nl79kB1vmpm0fUNpJeb1c3QYH00wDseGBvDclZLoUht5/
         HAHxEel84pe2snjFPIlRA5AdXPaaO3zn6OGtYJMBpWVLGMeLGkVIeK+JMJrgt2PHWiC1
         G5QsR+JhaFnti3DjSWSBEx7uSlB1VNGNgTKxKxFAs6CzpCsSJBb8OVFBUhYDqF2J+s4e
         lbz5C3Wq4/CquotclN8PFYLarfOUzX8iaOQpW0aLk5aRiBvntq60SJNnQ9jfnlGhrbaa
         KENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728324119; x=1728928919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/KVxz5nl/+CkP7JgrEXaeui4XePZ7Km9UGFcRbVFBbw=;
        b=Uag01kF8FOiifDNvU/A+Q/PatcudOfGLzQ4FO2uEfyd4MaDvndQy54CXITXjDc0r1k
         zLh1fFjbDQU11Vb5HARPbB8T+3E8rhImeGiufz5J+2gbrLcnwreY8NirM2MyV3qMHNEL
         Fb4sJSIZcg+xMgWbn2jcTZ7G5UwYWFUQNtxPtMyVW1EqgSx6Nt5f9LQnUx4q7HMLrG6p
         77TVbAl4bfRaDKQPVYAdzysuarYzcBDvb893Sq91niVMRGiZ6wVdC4fo8ZQdW2f4Un/Y
         4FP9AHduWH8LJC8Vdk/BcBGh/ce4vSRvyR7p4ttLK1e1n+eCVSx5JEnHMQGszSIQ0NQW
         DP8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXE5XHAS29a3ysrxq7//bPXJsTPnL96XIVfk5ds/CjiNpXzOAR8o4JVh0T63FE9a/f2P2kQ5OABbb9PGWQWbrJRfAU=@vger.kernel.org, AJvYcCXynE2k4x/dSu0Wul9ZmziydZBGB2uZxsxmz9RcVQfJKMQqNOTZ1X5OYvVL7xC0rn7biW0LITDMGr8t@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfc3V8X+19tk2VvHTMq589agCPez/Ypy27hVGfRgDeveiQPJXk
	f1BwNsvGQE5kDYk+tY4bEUq8Dja1x+h3QUjHxqdc1teY9CWDjU1MpEaq6mozg82ZDtCrfLefrJ3
	ykN2g+qgWRL9Galai1ey7mKs88igVd1Yq
X-Google-Smtp-Source: AGHT+IHJBomWso3AalswV7Ldy0FLnKyY+Y+sC0lT3HpaFJ05d5qnAv6zoX78l+il4+3yzFlVxekIQXvKB8eBO4bU+e4=
X-Received: by 2002:a05:6122:468b:b0:50c:ae69:b6dc with SMTP id
 71dfb90a1353d-50cae69b8f8mr3454301e0c.8.1728324119309; Mon, 07 Oct 2024
 11:01:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1728045620.git.geert+renesas@glider.be> <e04fff0e6d7d9ffebf5e3d3fe7682f0d411b60d9.1728045620.git.geert+renesas@glider.be>
In-Reply-To: <e04fff0e6d7d9ffebf5e3d3fe7682f0d411b60d9.1728045620.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Oct 2024 19:01:33 +0100
Message-ID: <CA+V-a8u=eQ5BcoJxsqMQO4hd-1svAw_eO9zx30JH01rMpg6DMA@mail.gmail.com>
Subject: Re: [PATCH 10/20] ARM: dts: renesas: kzm9g: Use interrupts-extended
 for sensors
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2024 at 2:27=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Use the more concise interrupts-extended property to fully describe the
> interrupts.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
Reviewed-by:  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts b/arch/arm/boot/d=
ts/renesas/sh73a0-kzm9g.dts
> index ae7e68a44f493e1b..1ce07d0878dc635a 100644
> --- a/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts
> +++ b/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts
> @@ -195,8 +195,7 @@ &i2c0 {
>         compass@c {
>                 compatible =3D "asahi-kasei,ak8975";
>                 reg =3D <0x0c>;
> -               interrupt-parent =3D <&irqpin3>;
> -               interrupts =3D <4 IRQ_TYPE_EDGE_FALLING>;
> +               interrupts-extended =3D <&irqpin3 4 IRQ_TYPE_EDGE_FALLING=
>;
>         };
>
>         ak4648: codec@12 {
> @@ -208,9 +207,8 @@ ak4648: codec@12 {
>         accelerometer@1d {
>                 compatible =3D "adi,adxl345";
>                 reg =3D <0x1d>;
> -               interrupt-parent =3D <&irqpin3>;
> -               interrupts =3D <2 IRQ_TYPE_LEVEL_HIGH>,
> -                            <3 IRQ_TYPE_LEVEL_HIGH>;
> +               interrupts-extended =3D <&irqpin3 2 IRQ_TYPE_LEVEL_HIGH>,
> +                                     <&irqpin3 3 IRQ_TYPE_LEVEL_HIGH>;
>         };
>
>         rtc@32 {
> --
> 2.34.1
>
>

