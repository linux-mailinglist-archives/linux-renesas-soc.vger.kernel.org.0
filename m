Return-Path: <linux-renesas-soc+bounces-11089-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FCF9E8FD1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2024 11:13:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6DEF1882CDD
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2024 10:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7373121660D;
	Mon,  9 Dec 2024 10:13:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645A712CD8B;
	Mon,  9 Dec 2024 10:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733739213; cv=none; b=afUcsfYrgC50vQmfqu7RGORMgeMql4pFITtklDHH0Ci9dnhDGUK9wjw+yl1V211sJMx/0t+pwYMyEeChCc+oE2MWLrFP62tCEs7xdLSQtYHvcGV/8EUQH9xKV+C1Fx3SoiC+aubHX/rJxBDW6x8s5/gbs3A15uT0WOQJI9oqMYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733739213; c=relaxed/simple;
	bh=/+Xh3plNunmdiMGPkU+Lu+ifUykNqRq3guldsJCwfn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NcWATAtsuJGF3iGkhW+YvnK5V9nUgy7kANFBahpDjXkJSXM+azCdT8zr1/KwTlVKbx0yPgKFqyYGXbHj6S0vMbgGtYQsDh1FZI8pCddN9AxxRGGHBtltG2G4TQB7aXvA/jUM5sKcufZo6+u4CicicxJJ+B07YtmXwO/jAFBKmyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-51873bc7377so239552e0c.1;
        Mon, 09 Dec 2024 02:13:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733739208; x=1734344008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X8B9uKckOVcu5ZiiWKsm9nKo46c0wYySjcRU1WQJF6k=;
        b=qM7f3M08+v/9fTmHUe/XNbI/epY3mnP84k5HG4HpUsv/GBvMgNT247MZ1agZ/WRALM
         tVY/lSNd3Jv4SJT6W5II2NI7suCHbjWroaOlJCWARwRDrzuqj4quhDUzYmItHfAaHSw6
         y1undT/wDuQlsXOtE5fvWZwNlMUFG4UZvJDfxwu/CfMdx2yAqpsgyIpvYmrU4CMzEsdU
         E6o+liJkpmquSUqxmABoFodya6qL3/vOA1oSE+DexDbgTAZJFi7jg6nXNs/qX94x2tBP
         bLnLsAO4gzHo5d3jQ3u6UyuaC2NHICikJFEOg5cIY4l7QWCU77ViK3QBuxnlpyDcW5r1
         qzQQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1anIFkSt+TIk4w31eNRZ2nXT0nbJEr1PO1Gxvi4hSGUNXy2MqY41X+Hlkwcm+d1O1iS/ugr+lX70JNv7w8Iyn1Go=@vger.kernel.org, AJvYcCVKWmrGoR6ltObKddJn3/H/9Zcq+75l4yk500kA/flUeFRXvidFtKwb/1U0LgtZc+0Cny/UqxS/gnBE@vger.kernel.org, AJvYcCVuM9WdsJQXOyqcM4hxMs6+krlvGF2M+wW250QKq3CRnWr4oE4qTrv0EboWn77KPUyk6LftlXSoVV9HZTqG@vger.kernel.org, AJvYcCXKHvu4ka1+Y9h2OKT4Ypf7kjs34kNHuJW5DevE9H6h1O6q+N9d7T3QAljOxqQmb+7hiSiUlZlFK83+Y0Yg@vger.kernel.org, AJvYcCXvMPuiX9S+x8X5tZ9fcQ8kH5yxEAiQM5aXDTBWqQl2+RJ2LBCp/5bRMHRIROYncwunko6mYrPn9Gk1@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3VzqX5YpUeAi6hrUCilusSIp2E3nW0YL4QK86qNvWJGT1HmE/
	EiLjBs3TGPb4SGpiUAagBHl8u654frC/rUwyc2qYt1JFjaloSPAYog10Cwbe0NM=
X-Gm-Gg: ASbGncso6SA+rV3UegNyEgAJ5OGNpOzEKKX+B7WE//rrJ80uJldDmzqBM0BRpXAMyYC
	fMRyuKv7LvC4A8dNdzWXSJdgrnutQyX70Z2L4l+O8iIo69b4a+OukXmiFYl07J+gn1XOUsj4dxH
	jQu1uPA1dY0FVZJMQCmvp4yYmqOxuWcdBQ/oHxQlcbFk+uG05C/L59VSaY330nCIk5JoZ8B6CJw
	b75VJAl8BNbfDuK7fQZ6pnkDwYVyuerv+OiL3esAeAJk7nYDVQF3DcwRVjElOKnu/+1sSbcYgdR
	MUMT3br2p+Lus09p
X-Google-Smtp-Source: AGHT+IHFAda1mXZ4uaqdsFLE8kzBrJovLyJyEyySHaAt5tv2YapVJW2uj8nG8mhck0ieZTXr1jXDcQ==
X-Received: by 2002:a05:6122:308e:b0:517:4e40:6838 with SMTP id 71dfb90a1353d-5174e406e80mr2268547e0c.6.1733739208182;
        Mon, 09 Dec 2024 02:13:28 -0800 (PST)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-515eae69aa8sm782729e0c.29.2024.12.09.02.13.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 02:13:27 -0800 (PST)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-51873bc7377so239527e0c.1;
        Mon, 09 Dec 2024 02:13:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUBKUvfZag1QbTR5C8LqYLZlWUm6ZgFgh+xompmDTcumEFSljOI16qnTUI2fXfEZjN7rxD/Tq2zNq28UXIf@vger.kernel.org, AJvYcCWI8AFu1fI02D4rpECstNZkhpzgrX6hAeg0v9waTccP7SbCL/Vqjsgb2heeufG5brey38PsMvhaIyXrA7fFHwwwZyc=@vger.kernel.org, AJvYcCX+nzyyP7fSzGTQqBMKihpZkdHJ1FS6WG52rQwPX8TQHajM/WP6T07+cjHglNMvUNY6+0G59fS0+ZgG@vger.kernel.org, AJvYcCXTuGFqRcBigXLDll0GVrjh2qkEeB3+dAXfUNGUudywB2MUYai8dwn9N+9akaWCL/LYmjPCrwcyg24q@vger.kernel.org, AJvYcCXZ4sNGUK8Ch3qI1UgLro9d/gthADBCF0BRIWA5CV5LxTdhpcv0SBQKBqNGSVJSxeUFt2o9UuqXztiHmFZb@vger.kernel.org
X-Received: by 2002:a05:6122:82a4:b0:518:8753:34a6 with SMTP id
 71dfb90a1353d-51887534a03mr27117e0c.10.1733739207196; Mon, 09 Dec 2024
 02:13:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241115134401.3893008-1-claudiu.beznea.uj@bp.renesas.com> <20241115134401.3893008-8-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241115134401.3893008-8-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Dec 2024 11:13:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX=7CarF8gd_t2_9hsnUEonBpoMh49LefEXg8NqSs45rg@mail.gmail.com>
Message-ID: <CAMuHMdX=7CarF8gd_t2_9hsnUEonBpoMh49LefEXg8NqSs45rg@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] arm64: dts: renesas: rzg3s-smarc: Enable SCIF3
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, p.zabel@pengutronix.de, 
	lethal@linux-sh.org, g.liakhovetski@gmx.de, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-serial@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Fri, Nov 15, 2024 at 2:50=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Enable SCIF3. It is routed on the RZ SMARC Carrier II board on SER1_UART
> interface.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
> @@ -9,9 +9,14 @@
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
>
> +#include "rzg3s-smarc-switches.h"
> +
>  / {
>         aliases {
>                 i2c0 =3D &i2c0;
> +#if SW_CONFIG3 =3D=3D SW_ON
> +               serial1 =3D &scif3;
> +#endif

According to my schematics, SCIF3 is routed unconditionally to
SER1_UART.

>                 serial3 =3D &scif0;
>                 mmc1 =3D &sdhi1;
>         };

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

