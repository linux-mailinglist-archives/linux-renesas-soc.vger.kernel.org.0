Return-Path: <linux-renesas-soc+bounces-9371-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7849598FDAA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 09:14:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3034A283D74
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 07:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1BBE13210D;
	Fri,  4 Oct 2024 07:13:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A135985260;
	Fri,  4 Oct 2024 07:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728026039; cv=none; b=r16NH/FE1FqX2i3fIXmW0YbWzTEDqQs4W8nq/0Hog7MAsxqulTmPXRX9toTiENMswdTwxS5gZRCw2GvnIcK+dh+rbFfmoVePm0hJCM9oLN3erIB51+i7IIqn0Kqis+eY3gyW2n1Rz/xoFHcKTBmG5UEP2/b7fzRxvfsRPZR2l48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728026039; c=relaxed/simple;
	bh=pM8GaIlxVXPW5mu0feVafuJtqrx1FlyNcpoZQ59fb+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tIQGz0iEmRKc57EVonMwslz/ISKa6Ag0f7p5BvNebwyGJxMfN+PJQU2T3Kbp2sdMFklhqX5SF2CCCYCGq1qm7QaaO4CijHgwhdJqt4Dn5jmtLh1assm0z/mdiEGhdC6YHAVNxx68UM6C+Tgu3MumCRP6CgfuwshXsbKAmcZHSRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6ddd138e0d0so15134877b3.1;
        Fri, 04 Oct 2024 00:13:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728026035; x=1728630835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V05yuwVEk8dY8sey195NO+tBeukEkXixf9PFgWfdFzU=;
        b=ke5KhuQP7E8ldo2XldF3zr/td7aWT6Otf2Dy/xVlrb46OEJJT8Pd+fE2U+MUvcop6y
         szjqF0GXjXTzYaWbHHoUPHx5tvLyv1mEIZdjq8QRmLW8TQ8IhO/w8IBRnrNAEh652ayb
         RrUIQAIfPtuD0qsIR1zX+tte+QNXbIW8Lilyk906pKqI/4d6J1VlDjTKPafcuAxRaYDN
         dF1yGmXxtc76hyFyEboI/VVt73t+wCCgj9c4Crso/Psrbs5CUAlxGEB3qre4I3pAOkwh
         +0WXyVzrOOedsXlVHALCDC1ltl1mEOPMltMjWBv9rZpZBQk0p2KzvAUQG1zVELf33J2/
         pzxA==
X-Forwarded-Encrypted: i=1; AJvYcCUdr73JTtHOmG+LbvEHR6/h6QxDULLu3cQcYGZ2nRjoEDBVY00OI/BywixPbeGT5nFb6jcEFgVK6fEQ@vger.kernel.org, AJvYcCWFwDSrIqw08w621LJPGxQJzX0+c7qwozvNEXidVv/Y01n9fostoFilq3tIYG11Fr4G5hwlBmaU7pRd4nydR2quMyA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXE7rtZigmSSacDpjlHJjjunsi0H+mRBrX1kOB/hHpLTFRsb3C
	cihRY6bSN4UHBjprlDGCM8sbR1beEJQ4PgbyiPkVX89U8wQFroVMQkOBefsuujY=
X-Google-Smtp-Source: AGHT+IEbcTw/pP1CCE+2Fx3cKId9yoRyTdkOzR3TiDDp6MFXxo1XLmxLIhG+3IvRLop8cdiApNERyg==
X-Received: by 2002:a05:690c:6f86:b0:6e2:c4c9:5875 with SMTP id 00721157ae682-6e2c7298c61mr21905417b3.37.1728026035471;
        Fri, 04 Oct 2024 00:13:55 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2bbea6e6esm5506567b3.50.2024.10.04.00.13.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 00:13:54 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6dbb24ee34dso15578737b3.2;
        Fri, 04 Oct 2024 00:13:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWlZgddq9NoyqfwAVbQM07r2Vo+mJqll7xNKs92lLyojUXISrGkID4RbWQalzsk5DWDicv1QbO8KajW@vger.kernel.org, AJvYcCX5bGeftv+ZVxEvNRGwEOSN7dLgxx/dgn0xqs1wTXgCrqSWwmUw6bf25x1UhOy4G5Tq0FuNDJ802AWemVjOkiLNGjY=@vger.kernel.org
X-Received: by 2002:a05:690c:94:b0:6db:db27:24a3 with SMTP id
 00721157ae682-6e2c72833eamr19404947b3.31.1728026034217; Fri, 04 Oct 2024
 00:13:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240901183422.31600-1-biju.das.jz@bp.renesas.com> <20240901183422.31600-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240901183422.31600-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Oct 2024 09:13:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWcZ-pxVkv+phjFv8CvsBpbABVA6_8=OpxQWECuHHS_oQ@mail.gmail.com>
Message-ID: <CAMuHMdWcZ-pxVkv+phjFv8CvsBpbABVA6_8=OpxQWECuHHS_oQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] arm64: dts: renesas: rzg2ul-smarc-som: Enable
 serial NOR flash
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Sun, Sep 1, 2024 at 8:34=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
> Enable Renesas at25ql128a flash connected to QSPI0. Also disable
> the node from rzfive-smarc-som as it is untested.
>
> Tested the flash by flashing bootloaders:
> flash_erase /dev/mtd0  0 0
> flash_erase /dev/mtd1  0 0
> mtd_debug write /dev/mtd0 0 ${BL2_FILE_SIZE} ${BL2_IMAGE}
> mtd_debug write /dev/mtd1 512 ${FIP_FILE_SIZE} ${FIP_IMAGE}
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:
>  * Updated commit description.
>  * Updated partition table.

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
> @@ -201,6 +201,12 @@ irq {
>                 };
>         };
>
> +       qspi0_pins: qspi0 {
> +               pins =3D "QSPI0_IO0", "QSPI0_IO1", "QSPI0_IO2", "QSPI0_IO=
3",
> +                      "QSPI0_SPCLK", "QSPI0_SSL";
> +               power-source =3D <1800>;
> +       };
> +
>         sdhi0_emmc_pins: sd0emmc {
>                 sd0_emmc_data {
>                         pins =3D "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "=
SD0_DATA3",
> @@ -252,6 +258,45 @@ sd0_mux_uhs {
>         };
>  };
>
> +&sbc {
> +       pinctrl-0 =3D <&qspi0_pins>;
> +       pinctrl-names =3D "default";
> +       status =3D "okay";
> +
> +       flash@0 {
> +               compatible =3D "jedec,spi-nor";
> +               reg =3D <0>;
> +               spi-max-frequency =3D <50000000>;
> +               spi-tx-bus-width =3D <4>;
> +               spi-rx-bus-width =3D <4>;
> +
> +               spi-cpol;
> +               spi-cpha;
> +               m25p,fast-read;
> +
> +               partitions {
> +                       compatible =3D "fixed-partitions";
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +
> +                       partition@0 {
> +                               label =3D "bl2";
> +                               reg =3D <0x00000000 0x0001c000>;
> +                       };
> +
> +                       partition@1d000 { /* fip is at offset 0x200 */

Is this 4 KiB gap between the two partitions intentional?
If yes, I think it deserves a comment.

> +                               label =3D "fip";
> +                               reg =3D <0x0001d000 0x7e3000>;
> +                       };
> +
> +                       partition@800000 {
> +                               label =3D "user";
> +                               reg =3D <0x800000 0x800000>;
> +                       };
> +               };
> +       };
> +};

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

