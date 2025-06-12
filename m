Return-Path: <linux-renesas-soc+bounces-18181-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 232B1AD70BF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 14:49:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE84E3A830D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 12:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7BD022F75D;
	Thu, 12 Jun 2025 12:49:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398262F432C;
	Thu, 12 Jun 2025 12:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749732569; cv=none; b=g9OXkcjE2cAfcbq7b5FP91LhX1/t8EQdJ31kRWNpADjX4fNz1Tqbmgk5Sj6kf+TiWCH+N7EK4G4Nsioq7kiGdQuzD+En+W9gfVxCP68Yp1DXsJcJlK+6jhnQqIuq3EY7ch8pLAt94J5UpILIpVjpEsIndG52Z8Y+EBv6mn485Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749732569; c=relaxed/simple;
	bh=Fa7WyXp0LB0/w/1HP/XkdPqB9l46c413nDCHWgSzj2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qmu22MyPNYhbwnyi3ZQT5l7zHI5aGOEtLdp2bDl/plEyR6R9tWizyROc7KkQy2enB5OY/k35AotoNFJR9jsNEy0mlfwVQTp8JLQlzTqTxlz6QPuuOUB+wkOErdHA/qOFlHB4PsfKeb4/M8a8DODagPiOcMjanzXu0X60ucqQgZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-53118db57b4so298746e0c.2;
        Thu, 12 Jun 2025 05:49:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749732566; x=1750337366;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B8vHCQZF5jXiN+qNw+6KkjSd042ttK1jmr3cfA4PkP4=;
        b=JDbiAPpAKYWqIIC1BUZIeeNSiBEgBdojau21xRnXWBCsxdm1/WX2k8U4AvAHpGyakW
         XvWdOKd28UJ1zNsnHaWpCrPaYYYjUBSMdjcQOPmcyzrYOsipUKUvTgTNSOeiqXE+uD4m
         v4HNOy0jYTZQ5+UKqYAuGjJUjqYSftM5YiXAQqwRfO+WhHp8cFOTFh4IPkxuCHGXqLqQ
         mDq9i+6TUGVGbBxxRaglxvMYEGe9K0GR6jw9WweJMdAfHZBSearaHs+U4g9Dd4x6sEb8
         z/mBC8IwSb1BF+nucGd5mL3pS96Xq8gHBvwmeH6oSZZ1Mo2zVkv8rirl3bKZ0q+c9/sJ
         swEw==
X-Forwarded-Encrypted: i=1; AJvYcCWN+u1t9Tc5kJaDhy4SHfNzfuiXFYo0nY3Ww6217AVNJDaLc+IOG5uXWp0OBtSg7+fHSvKXhFE+J7zrpJmF@vger.kernel.org, AJvYcCWkVFWzwHhTileLGZIeXCdRdB9mWDYk9AzcvN5eukgfN6xKnxWVfAVn6glEmoB9nWGBNUzcbnq022UwdjEUJs1Ms5I=@vger.kernel.org, AJvYcCWv90SKh5Mut7wBThjtNRB17GZIVhO/dV0M+lqy0M+rgNBxBYJkn5yJIE+UN2t/3+2CMDCRThhmXeZc@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0E/J+53nxmzVICo5S/G/Kt/a8i9qlmq4R8EwuLgRxOjiBKmZW
	rZnkyhHqBjgmvtmApNX9SFk6TlBSR68nxCLXqG0F2QLtrXprwzMhSFM+DpRR7lgj
X-Gm-Gg: ASbGncvffkkLVinVfdIE+7nBULQVi9it5LCNMr2Z4cVB7hMbpZL5bKIvRoZwEFcgcvp
	teLBC3SQK32BKos7hvoDX6gRjNxPWWO7uKIUpbRMVNpS9tjB3DXCrsJLLqh0rgKv3C6GdQX8Z95
	5BLkgltjcP4U0ncK3QctpQxpdAxPkLDluGuXgU3eboie+oiHM4eK5zLNYaHKCPhrhRgrkpl0MIa
	fpK+QCiyFI0zKFY4Ht2zJZQ2xuxYsjGWElfH/EfdQ3V6512LBYUIsnybTyJM3r1Ixk2mVUp/3ee
	+QIntph296cOMFDwskU7wUBkCybvoe2Ax3ahIyNgmRH9adE53u5X99TdV9JaJR/bA83yxbWx2Uc
	V0qt+mzrwLgccvpRjhwDaeQxd
X-Google-Smtp-Source: AGHT+IFleAtodR9kj3sWNjaH7eCWjsgCnI5AJ5Y7Qzo8OXuovx9Kxs7dr1r2lPoXgiZxhgzaQUSDiA==
X-Received: by 2002:a05:6122:181f:b0:531:19ee:93ea with SMTP id 71dfb90a1353d-5312cc4574bmr3399355e0c.0.1749732566037;
        Thu, 12 Jun 2025 05:49:26 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5312f6515f1sm270293e0c.29.2025.06.12.05.49.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 05:49:25 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4e7ccab0776so201294137.2;
        Thu, 12 Jun 2025 05:49:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVNq40wn6sbnqJtpQu1pmpr96yR0v61oeSOgzva1EQVDWvqzo8E4HcbNkdjKB4GeaPzNefjudJ+C5GE@vger.kernel.org, AJvYcCXdKOdMDdPCxd//tOrp5VtcCO27j/JzyCee43bOGue87Q8JHDLxGCX/ZTyJEamuVzd4I9a5uUFID0GG1862AddiPVA=@vger.kernel.org, AJvYcCXjYKOJUkUebNdQu3oW2g99x8hQWGlDc68Pt3bHhubre90au4eUMlg/znyKJLhDZIa25d6sG8BvM39G5FuO@vger.kernel.org
X-Received: by 2002:a05:6102:835a:b0:4e6:ddd0:96ff with SMTP id
 ada2fe7eead31-4e7cccc8dd2mr2227516137.16.1749732565390; Thu, 12 Jun 2025
 05:49:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528140453.181851-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250528140453.181851-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250528140453.181851-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Jun 2025 14:49:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVa4axB+aKhH18KxK4DVafeix6wn407PEhMxV_6xfpraA@mail.gmail.com>
X-Gm-Features: AX0GCFv1580KM32SBuUHr5OfYR6zvBo1yjOIfUUT_GVzNFDtLihh4XudBW__vt0
Message-ID: <CAMuHMdVa4axB+aKhH18KxK4DVafeix6wn407PEhMxV_6xfpraA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable
 USB2.0 support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Wed, 28 May 2025 at 16:05, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable USB2.0 support on the RZ/V2N EVK board, CN2 connector on the EVK
> supports host/function operation.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
> @@ -302,6 +317,16 @@ sd1-dat-cmd {
>                         slew-rate = <0>;
>                 };
>         };
> +
> +       usb20_pins: usb20 {
> +               ovc {
> +                       pinmux =  <RZV2N_PORT_PINMUX(9, 6, 14)>; /* OVC */

Any specific reason why OVC needs "bias-pull-up" on RZ/V2H EVK, but
not on RZ/V2N EVK?

> +               };
> +
> +               vbus {
> +                       pinmux = <RZV2N_PORT_PINMUX(9, 5, 14)>; /* VBUS */
> +               };
> +       };
>  };
>
>  &qextal_clk {

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.17 when the above is sorted out.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

