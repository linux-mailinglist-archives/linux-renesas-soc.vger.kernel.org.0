Return-Path: <linux-renesas-soc+bounces-12988-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 592EFA2ED50
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 14:15:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01F521660DA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 13:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E8862236F7;
	Mon, 10 Feb 2025 13:14:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A938C1F76A8;
	Mon, 10 Feb 2025 13:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739193298; cv=none; b=pFhjszf2Z3cuWMPP5MVuoRSXMmDIp5a1/J9bzRPvzBQAlriTygMWoVu4PgJgmg0UlfrtS9th7nbQbn9YUrE5oo39rRT7lHzUEL+9BT36eVPh2yf9lRqL0J+slPwwH2AMR1X911CaosyUagRUfzwQtMb+Eyimk8a3r244XMiQlIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739193298; c=relaxed/simple;
	bh=oe9YqlWHMEuQqzNAsLC/ymWcVw5v450bMingEO5+o/8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PsHV54UAX3Vo1GzBFg6AiS6tu0fsa+WKuCD0Snk2RXo8Lr5yKR2VAUz2F10yUhbOvtH8rrl/RQLKgXZPwIsy2ccS9/ve3uaTJDMfq9cz6/3AMUmrqaBVwQREAnWkCRJ/1e/zpeIqcjZd8v8gTzSX+bqx4zEJPRNFf7/LAQCHUqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4ba830cd6b8so1100373137.3;
        Mon, 10 Feb 2025 05:14:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739193295; x=1739798095;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CGW9ojU7zn9GGWFOqqtTTDOtvjIst3sLIBkQ7z5/xo0=;
        b=L3lT3Q1aPKt5pL51Abw2Ejusb7GyG8s++qnUyf7eFLD2YUiZS1k793/huq+OUX5g05
         eCkSB1ALeE8dv0evar+G+fnC3Mod1BsA2VIXOXaBBgwFYiVi6S5YojTdXArbpLgVRRdm
         Z+gwzvrXE25PgwcUUoa/OJJyD4/Zj5ciTsO7orIMjEaqj74MH/OEWynr9OyBRqKBAZ8M
         zrCUBr+ZXUwT98Y7KJjWlixI2+w8rVXMlvPDCBXXLA2OLH0C0BozYhJfKfhXHdQ8Za+M
         40XmW9Y2ye7jWPvsJ5NeIyYhraogRMncyXKnT1LdRPvRYulsXZXaTw9rmIxX1PQk7Ry4
         WjNQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+yCwvHXyUTirm5WczBTwJ5niAs2501rak/+P88ZdN5uK9iV21Z2L4MeRZg+nIpzV1nOuYPXSNXA1hng1x@vger.kernel.org, AJvYcCWctV/b8QPg4xPR0/vAK1Fp+2RoNJpv8EZ3tiT23cj4Z5Ihrx1f7yJTDeKsy7FM40va6qhfGAlUiqyIUbs8@vger.kernel.org, AJvYcCXMA/wJTX4hm4lAxoDBh0OKN2ItXKvMGxvsvP9uw3U9sOICUBq4iTVQuzs2Q/n1paYmlRojwgr/m69LMcNmLFi1u6Y=@vger.kernel.org, AJvYcCXYnvimHneZB3bp1AGx/ycjaAMLciyLG8K3TdM2gRoAEde4NjI7KFM70wycLjHbg0Pr57fG4XIgmMDK@vger.kernel.org
X-Gm-Message-State: AOJu0YyCfQvEbLAKLmBK/CXS3w5/CNgT4hWxATSpu+ugNsWf5rMfmPPd
	y8ieXJB8qQikWYS9RJGKpa7ij40120QQ7tj+OI+TG1er+SBNQKHiJzFtpWMr
X-Gm-Gg: ASbGncseS4T6AZ3QVnYwFAzFF0NW+KSRETjr0HIp+o4W50G5AJXsO+gxqDr2ydXrxFF
	oBrItrYZvRzVwMaK9z7IF6bEH3+oD+q0plNEf/ajBJ/jYezyQY+sfQUEcuGwYFawtluSARYDR6T
	z/mb2paH77KyPIo0hkCH6fur7CGFe+IBn5qatAJFKRJwutTsZmZPD4TzwSR0zme/Z2yJrfeSEoP
	KHjPavTDhbRlVQl20s01jwr1Ukzs1cuHLgUDmHT1yjKUh+vFFCBirr9NJEOf7m3tPDsvzsbjj6i
	ZdDP9IOytgh8uynG10YeW0kBFbJ65x+dFYWVjP3GnNsCv5LiEUK86g==
X-Google-Smtp-Source: AGHT+IE/MTI003KZAzFEzT5D6R9YpB5TnCmJjKtw6Jr9BOv+i9SG00BX1RDpdIcUNUOA5wxu6Ei3Xw==
X-Received: by 2002:a05:6102:31b3:b0:4ba:9689:8705 with SMTP id ada2fe7eead31-4ba968988famr4772692137.10.1739193294706;
        Mon, 10 Feb 2025 05:14:54 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866f96361d0sm1614988241.1.2025.02.10.05.14.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 05:14:54 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4bbbaef28a5so402848137.0;
        Mon, 10 Feb 2025 05:14:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVIIzFIqh+sbsX678kayUVzbCvZAGwALDQRqhqxkXcIIM0vSFe4iqHdBSM62hBCDgf0CTrbQq/r04dIE3orCB+r7Nk=@vger.kernel.org, AJvYcCVooTA2QKM2j4TV1xRxZg1sM2oiz4wcLFxtX6yXK3OcY3cFm6CVotTNzOsEN0W4VGZn7SD7FU+k0B0PkJnR@vger.kernel.org, AJvYcCWzqMf1xaLdpVuSvkGw6JVcgbCItkFTWjF90CSnk7hysJOXr070TReUKStkbx6gU2YzmrGirR9t9Fbs@vger.kernel.org, AJvYcCX0sRJ2n6DeRhDD+E/e9bf8ocA1wbCzHBADcQfArFshFvc8pC85/ha6aNEKMlAk2VWL6bEtZGQpeZ2kI/JB@vger.kernel.org
X-Received: by 2002:a05:6102:f0f:b0:4af:c58f:4550 with SMTP id
 ada2fe7eead31-4ba85de9d5fmr7943296137.7.1739193294128; Mon, 10 Feb 2025
 05:14:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com> <20250129165122.2980-3-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250129165122.2980-3-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Feb 2025 14:14:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVB2W6R+xYeTUKSv_dMGruECSft-P19m6nZD61=ROngXw@mail.gmail.com>
X-Gm-Features: AWEUYZmV5A_tAWdzmeYWijF-JgTDqcElC5Rp8P-Tj2Jva5zv0N3bQ2AGf8RZsUA
Message-ID: <CAMuHMdVB2W6R+xYeTUKSv_dMGruECSft-P19m6nZD61=ROngXw@mail.gmail.com>
Subject: Re: [PATCH 02/14] dt-bindings: serial: Document sci bindings for the
 Renesas RZ/T2H (a.k.a r9a09g077) SoC
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

On Wed, 29 Jan 2025 at 17:52, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> Document RZ/T2H (a.k.a r9a09g077) in SCI binding.
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/serial/renesas,rzsci.yaml
> @@ -0,0 +1,100 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/serial/renesas,rzsci.yaml#

"rzsci" is IMHO a bad name, as SCI on RZ/T2 differs from the
similar-named "SCI" (sometimes called "RSCI" or "SCIg") on RZ/A1H,
RZ/A2M, RZ/G2L, RZ/V2L, and RZ/G3S (and most old SuperH SoCs).

BTW, I believe the variant on RZ/T2 is also used on RZ/N2, RZ/V2H,
and RZ/G3E?

However, binding-wise, they all seem to be very similar.
So perhaps you can just add this to the existing
Documentation/devicetree/bindings/serial/renesas,sci.yaml?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

