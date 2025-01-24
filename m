Return-Path: <linux-renesas-soc+bounces-12477-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 619FEA1B7D4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 15:25:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E2873A3FC1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 14:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE3848633B;
	Fri, 24 Jan 2025 14:25:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEA378F4E;
	Fri, 24 Jan 2025 14:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737728710; cv=none; b=qd3Xai5D14Ur5A6ZzKVUnqN+KsTrdW8dK+g/eW3WzzPrq8asxXeLN58DgsBXed72zFPodFnfiTAsT8iaLSCrEmouO+0NErWc+8rH2r0o117IQ9iaI0HC6Lh7sdw2Xk88soUqL4ZVxGmZ2dfbzhq3vZtM3VzrlFsrnIRW+k+IO/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737728710; c=relaxed/simple;
	bh=OYBPKFzLuPE4bMCcnS1E9mdPoEW2OlUher7mL9aGx/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lFK2ngWXk6SwjBhDPOFIg1sDBgcOnACftJUcJvnE8iFusxm/ZuouMtA65JBp09OvO8LFHlT9X1CfgVdU+DPFVRFtcoMCuUwG+wFvNurJUjXemaUMphaQbkQD24F+PThFQbiskwRnCS++oMbFYctCTidWtlGsp30mDe52DfaSYFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-518799f2828so1064961e0c.0;
        Fri, 24 Jan 2025 06:25:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737728706; x=1738333506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m8Y8zutVdcjj3z5SI3z6o8MP/9ZnHoMpzq7JC/J1ojk=;
        b=owxKe/nA3LRQRvDApzyY2OpCaAN399/drc5AVKvFdGq9R7uxx99l1y9Blm4Eux6y97
         o1d44tajBn6coKGgPmCNFqGC1Vb77Fg+Br/x0TJkAq2+9++y49tb7jKg7zJQsSouIrHo
         EmggKhSfvhWL3W+Bpv5kD6KQ6E+b9IIfWmei7LCFJbWxbeTC0GQ6a+UwmooqX7zT3+Er
         9+bI6sZ1wN/IYxaPh+M5m5IMYkHN5NTZjgj6iF1+oP3+UEG5dy6/ZNfZDzQpZOL/UHHG
         7hVBrn+kYPpen+Y33opdPuNM63jEhn6/R3UnAixRdANylHxK6Onm808sTHWbkk7w4QiE
         SUPA==
X-Forwarded-Encrypted: i=1; AJvYcCW2caQHN1PEbGYtGV7UEGaj7YfGVlYoXHYgg9jjuNUd7cFMwLD6MMq91uTCDrdc7LHCHTcD7oT+84FM@vger.kernel.org, AJvYcCWT1fUgsWy3El2asM10b5JDvuuSyj56rGAdzoshj4iqFUG9fIZig2wLKB7+TI1gmPaCtZltR2ORboAm7gAUc6VZdSA=@vger.kernel.org, AJvYcCWuAdmXK8p866ytlzOwaZ0BWunSkaoyWakCUF/F6bqDjo0kJu3rZP3uZrxnRVB3y3qOF1TRd+6ZGSVBNcGc@vger.kernel.org
X-Gm-Message-State: AOJu0YwoNrBgHKTDmVohO2VXrVanBJB+M2aEcIvvtCfgMKAzj63ChT3H
	qTyTkCuQP1rOnNvEx4/NPtIsmt5lOKnpIBhU3jzvx1VUSH9Yqb9otSNtGrKt
X-Gm-Gg: ASbGncvzS298HbvkZSGKwH+WsLf3HVPA+VVIY4w/f5jh4hrhVle48HH1KlhJi+dRaYb
	b47lEWPtyGkCrUKzEmtN4/NZIx43z6TI68u6olNafGzwEOaADZIjnqlAloLjvOK58vaa7jOSQOD
	4pyCP47aPRB4N+Ra8Tcx3IJNNkD3ZpoqIqA6ccSlzPi67tYW1Zt65tszKRuQxr64NJhSFkFYglj
	nzUJwxR7IFiO2nzSmIM0uzpNIEOwq40cjtZp0QAJotWGYHZcBXwP4n0tQ/3kNHMUUlODAZNWwkh
	lLY+M3FBmKy7rKAhDBubup6yEp7eCs0/ktG4myx53e0=
X-Google-Smtp-Source: AGHT+IFfoqqdY4mfhGuXSQZ8OiF0M+KCjFb0PMM4VAKgp2Sv7+3liRBGdnqAUI+IKNM/mOdD2B5Mdg==
X-Received: by 2002:a05:6122:ecc:b0:516:1b30:8779 with SMTP id 71dfb90a1353d-51e3de6f298mr7128197e0c.6.1737728706649;
        Fri, 24 Jan 2025 06:25:06 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51e4ebea379sm384190e0c.42.2025.01.24.06.25.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 06:25:06 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-860f0e91121so1751265241.0;
        Fri, 24 Jan 2025 06:25:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVPLOVfWukefbw+tmYoe17n4EI0lAgsWoqz+UFKPY+5KAl+jTHwKgG2KTEwSMX8/vhOJEoYGTj3tahORKa0KNCzZW4=@vger.kernel.org, AJvYcCVa2K7WM5JvLl5/VmKOKNvpEM6oSBcKnsvS6l3jG3dX32FcGHJPDO9x4fRm3dzQNxavrC8tUJ/14UVp@vger.kernel.org, AJvYcCXY4jTm6Tj8TYRSYV9TFA/i4Qb4RFvLaNJXaLQFev0r+/ysO/GFxxsYttFXh+421sVRT2tdPwqWVmzPlHS0@vger.kernel.org
X-Received: by 2002:a05:6122:2487:b0:516:dc0f:c925 with SMTP id
 71dfb90a1353d-51e4fcf4020mr3100174e0c.6.1737728706157; Fri, 24 Jan 2025
 06:25:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123170508.13578-1-john.madieu.xa@bp.renesas.com> <20250123170508.13578-9-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250123170508.13578-9-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Jan 2025 15:24:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV1X+wg-oTbv-kXhTjE4exznCYm2-W+HnmVcBLCXVyGBw@mail.gmail.com>
X-Gm-Features: AWEUYZkKjxG4n3qN1sCsetuTZGdjCDbk9s45jEess3Q0WQSGGQ7pMss_74ok0R8
Message-ID: <CAMuHMdV1X+wg-oTbv-kXhTjE4exznCYm2-W+HnmVcBLCXVyGBw@mail.gmail.com>
Subject: Re: [PATCH v4 8/9] arm64: dts: renesas: r9a09g047: Add sys node
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, biju.das.jz@bp.renesas.com, 
	claudiu.beznea.uj@bp.renesas.com, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, john.madieu@gmail.com, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	magnus.damm@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi John,

On Thu, Jan 23, 2025 at 6:06=E2=80=AFPM John Madieu
<john.madieu.xa@bp.renesas.com> wrote:
> Add system controller node to RZ/G3E (R9A09G047) SoC DTSI, as it is also
> required for SoC identification
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> @@ -162,6 +162,13 @@ cpg: clock-controller@10420000 {
>                         #power-domain-cells =3D <0>;
>                 };
>
> +               sys: system-controller@10430000 {
> +                       compatible =3D "renesas,r9a09g047-sys";
> +                       reg =3D <0 0x10430000 0 0x10000>;
> +                       clocks =3D <&cpg CPG_CORE R9A09G047_SYS_0_PCLK>;
> +                       resets =3D <&cpg 0x30>;
> +               };
> +
>                 ostm0: timer@11800000 {

The patch adding the OSTM node hasn't been applied or even submitted
yet ;-)  But I can handle...

>                         compatible =3D "renesas,r9a09g047-ostm", "renesas=
,ostm";
>                         reg =3D <0x0 0x11800000 0x0 0x1000>;

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

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

