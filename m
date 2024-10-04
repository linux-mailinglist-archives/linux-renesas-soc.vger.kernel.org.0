Return-Path: <linux-renesas-soc+bounces-9372-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 303CF98FDB9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 09:20:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5701D1C21017
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 07:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8054132106;
	Fri,  4 Oct 2024 07:20:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA778C1A;
	Fri,  4 Oct 2024 07:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728026435; cv=none; b=er/2UbtcMb7UCLwQPVK6JcNoid2gpKrtI9hh8U43kydWmkzmDu0AwGe0UnE8Ao4ClBkoOg6fbWeWs8AuaHk3F6bBkngck5yBvrXaDVAT50XMLhGehf0Pn3imuKNr9F2DiAIBv3kWZhb16FbSuD1m6umrURP0RsZz/XtZVu5FSZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728026435; c=relaxed/simple;
	bh=ZPpLghnA01MTgfFDexYWWVjyGzrkLlPJ69F1OK9MCcE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HbDJ3vs6ycSNrEtIEbiYKilMg6PNoXK5TJ1T3xCAoiyz8M8WTSAMb1sjHmeGNClamRXu9XyWQ98hFUh905bQfdxaCet411FcYiC+CspPJe8/JOuoWIGo+EeB47vWnx9whGXc+lHKFOdD1n1920T0ol0zIXAAnXxWy9BvCxvbxpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e262e36df27so2308907276.0;
        Fri, 04 Oct 2024 00:20:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728026432; x=1728631232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RdsZwn8Yihn3uqxJRqJVW5QvdEPiHc3q0eV7E8r1KgY=;
        b=IDHn8azfcfn2pvT2tSlccUIg/B6bKUf0PNZyDpCxhh63LK1t0yUMJx41RtnnAxBOj5
         7ntf7zkD46LeukFpKD9nkKWkdmaLyOviGeiCOvn+3rg+i87QPXGOoZi2aKwLBAF2RllY
         y81TveSD9GLgZPQlRpv1bOzbcwtdRQvVJyE2PsyqPYj/U3daeNQarKYFG1V2nP7frYBa
         3mbGsdp1kqbEVnWAUC/qMFJJuKG3U8ubDnOSPLx4bh0vVwRr4yDzNNuYOhEtmZ23wc8x
         rXfYaJzNYUJTGLHbkYFUtxAPE/9nq/UBlZ+J/gM7G6YuI0uj5X8ahyMOYcfG1Vxaq3uZ
         N8xw==
X-Forwarded-Encrypted: i=1; AJvYcCVgAzmiQkA1mgOgkKkI75iM1maE9G41lNLvz/e3jM3ZWMIvQg0fOtKGE6wBCRwIt095yF5SR5cFhd+iVzuh/j+ax0w=@vger.kernel.org, AJvYcCXi6nfMk/Ry9Mf/A6kU3hQ7EuqKEUAPfTa/jQ050jU7vd7qWe3Cb9az/E2Q/3ovFO8bGhTcQjpYMwH8@vger.kernel.org
X-Gm-Message-State: AOJu0YyoTgJtu4LfOLdfcFYSjw7dihLdokqHOT14unhzY5cIRULm+2Rd
	A4aifdLNHGRzf5ZtMrF4C43rqRdBKdo6JiVgq5fcAcvfdyyYR59+kZA4YR+rUTc=
X-Google-Smtp-Source: AGHT+IGRxLNWXjCtIhiuHyPDaqXY0EgwkeAWFK/OF3Q9oeEu53IQa2xql74Jtgv7lv1z2e3xN0GdPA==
X-Received: by 2002:a05:6902:102d:b0:e1d:9f6d:2eab with SMTP id 3f1490d57ef6-e289306b2bbmr1044504276.26.1728026431240;
        Fri, 04 Oct 2024 00:20:31 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e2885eb2137sm512013276.48.2024.10.04.00.20.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 00:20:30 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e255b5e0deso14764657b3.0;
        Fri, 04 Oct 2024 00:20:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVLIuPL16su0eei0UGlVcjBbOHO1ixmOWpG3RlOpHi/CtdVteFQ33lejs2sWw1cSHpxNyTZbLK0xxpFf4GXg92jAW8=@vger.kernel.org, AJvYcCWwBuXBwyMfgzP7F2efOBHBMkr9rzG/ON4LX2W6BqUTUn/22Bc1mNdm/Ef/9rQCPcV/9lBQt4zpnPy+@vger.kernel.org
X-Received: by 2002:a05:690c:6a07:b0:6e2:2e8e:7a20 with SMTP id
 00721157ae682-6e2b5367f0cmr44382007b3.13.1728026430467; Fri, 04 Oct 2024
 00:20:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240901183422.31600-1-biju.das.jz@bp.renesas.com> <20240901183422.31600-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240901183422.31600-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Oct 2024 09:20:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVWHr6zxpPHWxLe2sgBpTsyk6RTEvwFQHisU+xXq42VWQ@mail.gmail.com>
Message-ID: <CAMuHMdVWHr6zxpPHWxLe2sgBpTsyk6RTEvwFQHisU+xXq42VWQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: renesas: rz{g2l,g2lc}-smarc-som:
 Update partition table for spi-nor flash
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Sun, Sep 1, 2024 at 8:34=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
> Update partition table for spi-nor flash, so that we can flash bootloader=
s
> in Linux by executing the below commands:
> flash_erase /dev/mtd0  0 0
> flash_erase /dev/mtd1  0 0
> mtd_debug write /dev/mtd0 0 ${BL2_FILE_SIZE} ${BL2_IMAGE}
> mtd_debug write /dev/mtd1 512 ${FIP_FILE_SIZE} ${FIP_IMAGE}
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v4:
>  * New patch.

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
> @@ -341,11 +341,18 @@ partitions {
>                         #address-cells =3D <1>;
>                         #size-cells =3D <1>;
>
> -                       boot@0 {
> -                               reg =3D <0x00000000 0x2000000>;
> -                               read-only;
> +                       partition@0 {
> +                               label =3D "bl2";
> +                               reg =3D <0x00000000 0x0001c000>;
>                         };
> -                       user@2000000 {
> +
> +                       partition@1d000 { /* fip is at offset 0x200 */

Is this 4 KiB gap between the two partitions intentional?
If yes, I think it deserves a comment.
Same comment for rzg2lc-smarc-som.dtsi.

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

