Return-Path: <linux-renesas-soc+bounces-2042-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEC28428F6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 17:17:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 209CDB22687
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 16:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5590386AE8;
	Tue, 30 Jan 2024 16:17:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D483086AE7;
	Tue, 30 Jan 2024 16:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706631442; cv=none; b=g7m/UJDvPLJgg8/GJHWHclizGBg5LpD9v2BbCDsb4fPc/GpQdnIM7a10jeB7OgoglgxcBujGJ1kDgODIrD68d58NWKQW2VoZYpwyvM/Tg41Yar4GGVOMwp4rt4fbmTYbFKVNX9PFHQzrFyFShKQWoe28Hjx/gk+/nmIh6Oud3SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706631442; c=relaxed/simple;
	bh=cYg8sJvLBxgUfX0TfQ4tHGU2fdz3vqPt1EjNhv/99Sk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rOWenPmtxKPw2Qzcr/rBrKJVYMoxMqT+NDeCiPR1e8GTW50j4W8eRY3UGCI3YFwWty6ACTnpkC0pYkGFOiWolbjTnxoeNLVKTlumHfu66l2VOiEu/sCR16BpbsB5RJX+vWqa6GOYziuIm7atuO8SKhN/saZBFQWoae6cw+UouWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-604058c081eso253837b3.3;
        Tue, 30 Jan 2024 08:17:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706631439; x=1707236239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+WreUb8HaSJRmyFug6nNkyxdwP1Ic6ZfT4F/2AORjo=;
        b=nUd7F4Li1fJqNsHiDoi2wJ5KREsBTg8tF0548hzSnnrPWT0g1v2qWhawxRAEJPVTd4
         gBD96yl+Kfe9TDiCqSypHM45Q/53myk7DvRyKb79uDmBmaatkR1b3qPfGlHub3ScemOD
         3mLBx1DrDAFPW44T0bc+pYMaur6xx2AEM/XC7X5YJgC9FSpStzLG3mUJ/lvuHzTDR4Wg
         jQFHvvaM5ZuH0K9O85F8bpoieqF2XSP/42JQRjVGmOWt/oRo/Gy76awyEeqkag0N5H56
         aUm20VJZdzV1bXoGzfPy5QrstObKFuh3SJpHRVnZW2pPfkcK5X8NYOhQaTqTqZYCYC5u
         Hs9w==
X-Gm-Message-State: AOJu0Yy8GIvjLM0mUymlnAJIKp3dNAHE8OHcpuwD4kDxAdTvOq8tgH+Q
	r9g5t38BNADypmTUdf4mCmUe38RhgSF/W7ap9OUF7bbFklMAEJqPi8EeXClts5c=
X-Google-Smtp-Source: AGHT+IG67yNnvQh4YhE5CwtsV6ClVXJjY37B5Fso5CoYREwrgfn0boIEn1hYAu37LJ7v5dsT254ipw==
X-Received: by 2002:a81:8304:0:b0:5ff:7a74:412e with SMTP id t4-20020a818304000000b005ff7a74412emr7973515ywf.38.1706631439571;
        Tue, 30 Jan 2024 08:17:19 -0800 (PST)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id m140-20020a0dca92000000b005ffa62881e0sm3266995ywd.91.2024.01.30.08.17.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 08:17:19 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-604058c081eso253687b3.3;
        Tue, 30 Jan 2024 08:17:19 -0800 (PST)
X-Received: by 2002:a81:e201:0:b0:5ec:c970:19b6 with SMTP id
 p1-20020a81e201000000b005ecc97019b6mr6685991ywl.17.1706631439150; Tue, 30 Jan
 2024 08:17:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240126133116.121981-1-biju.das.jz@bp.renesas.com> <20240126133116.121981-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240126133116.121981-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jan 2024 17:17:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWR8qO_eZ_nECewVWFCnFnGiuq_q4FzJV+d_-XWWpTcsQ@mail.gmail.com>
Message-ID: <CAMuHMdWR8qO_eZ_nECewVWFCnFnGiuq_q4FzJV+d_-XWWpTcsQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: renesas: rzg2ul-smarc: Enable CRU, CSI support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Fri, Jan 26, 2024 at 2:31=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Enable CRU, CSI on RZ/G2UL SMARC EVK and tie the CSI to the OV5645 sensor
> using Device Tree overlay.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -104,6 +104,8 @@ dtb-$(CONFIG_ARCH_R8A77965) +=3D r8a779m5-salvator-xs=
-panel-aa104xd12.dtb
>
>  dtb-$(CONFIG_ARCH_R9A07G043) +=3D r9a07g043u11-smarc.dtb
>  dtb-$(CONFIG_ARCH_R9A07G043) +=3D r9a07g043-smarc-pmod.dtbo

Missing

    dtb-$(CONFIG_ARCH_R9A07G043) +=3D r9a07g043u11-smarc-cru-csi-ov5645.dtb=
o

so r9a07g043u11-smarc-cru-csi-ov5645.dtbo is retained for separate use?

> +r9a07g043u11-smarc-cru-csi-ov5645-dtbs :=3D r9a07g043u11-smarc.dtb r9a07=
g043u11-smarc-cru-csi-ov5645.dtbo
> +dtb-$(CONFIG_ARCH_R9A07G043) +=3D r9a07g043u11-smarc-cru-csi-ov5645.dtb
>  r9a07g043u11-smarc-pmod-dtbs :=3D r9a07g043u11-smarc.dtb r9a07g043-smarc=
-pmod.dtbo
>  dtb-$(CONFIG_ARCH_R9A07G043) +=3D r9a07g043u11-smarc-pmod.dtb

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

