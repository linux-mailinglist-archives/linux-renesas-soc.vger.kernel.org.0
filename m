Return-Path: <linux-renesas-soc+bounces-3267-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E314D8696F8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 15:17:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 132A91C21B9B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 14:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88E7D13B2B4;
	Tue, 27 Feb 2024 14:17:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341C613B29C;
	Tue, 27 Feb 2024 14:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709043428; cv=none; b=POmsRFfr0Hi5796GauALbL8HWKuDMCmeNJTJE5GXo5auqm4V4djAa0qUoPH15+0GuqI+y74eRryJcZccQiZHZpocW2SpRG5P2P5smoRVAtIKdlDlmp4+kuXMgSHaYED0FnWIeqIhPhxvueX+A8yaWSUAhTTty5cKCV07zQ+CQBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709043428; c=relaxed/simple;
	bh=Xn6o2bGF5DiPX8HAPawgpYy3iLQQ0+lG4YhM53gHcLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l0UICuO51+tLTQhG4I+6H0RNNs+ybgpL2m9PhyD1mZG8yHNUOaWhrMZLZm6SQuT8bGLBf6qk7oL2NH4Wdr67mFv+1Uvcij/dn7REgL4Ui335mWSJ7Cky4uXZbwT1DLQQMUdm9hAuzDgAJeUoR7Jq0Ei5bMwBBzEHK7izOl16hnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6089b64f4eeso42979507b3.2;
        Tue, 27 Feb 2024 06:17:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709043424; x=1709648224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VP3AOk86O1fQXduz5wbAFP5nZBmS0VH1bQ23IBAgmNQ=;
        b=aB4E+kufs7EtoPfws5kT6nXiRqPUpTDrECmyhVfbxwbYuLM0Z0GlWTrqUVDC5j/pWN
         JKZA9ytxA2C5XQYiNl0rRC3gAXRdie/yXpkNZjFq7iNHeeYYoUgq4Mbf16gJEirfsG/A
         QdJJttcrLDt0cVC7ew3MU2pthFZIjg3pGS+daw9QfFhT/t5LBpBOLZwBVfpoQNNceZpc
         8obZ5XwwhDlujY4wsqNxShRlDaVzi6oqZQnkgurBujuOUvyXwSpB608K3GbL9O0QEc33
         cDl0yF0UZ0zoyuVxbJ7MDkyk/MJIieG0C0FnGQYZvHoo0hDB+G3rpLX77yQUSe6INjpM
         KdCA==
X-Forwarded-Encrypted: i=1; AJvYcCVtJcbIRe0fskcU5BJWkxwjohiMUCPP+XbZvDrs8bQBx8hcgPn+jfqXdRThd0qjmvuZzVpcvMIZYXR79wNS1/agp/StxoZ3dx8TIDPgSMek7OTtsfTFjRISzSD1Z7JGLX2d6gifkeZguWYrGqa8
X-Gm-Message-State: AOJu0Yw+VbBIsUXcrtb8ulb+tO6YpA7XHccFTABAYC2cyR5R3i+RxLpf
	Tr/XnNJZwy3++TYhrYh4h0wbPBHYHbPf5F1yEzlQYMhuTLy/deaPf2i57zqb6bI=
X-Google-Smtp-Source: AGHT+IHxN5Mqj/L6kI+YD79l+7qLq/3jH5koGKPgBY27P/fPGUviS42r1QMmAZ6k6lJD13+ODlB5cA==
X-Received: by 2002:a81:9b05:0:b0:607:a8bd:c24 with SMTP id s5-20020a819b05000000b00607a8bd0c24mr2348739ywg.29.1709043423330;
        Tue, 27 Feb 2024 06:17:03 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id v6-20020a25ab86000000b00dcda3959006sm1469395ybi.33.2024.02.27.06.17.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 06:17:03 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-60922e16f6fso10203287b3.3;
        Tue, 27 Feb 2024 06:17:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW9AtzlqMoTeqjGRbS3KRx+pWzG6uyrKDwtHRq8LkqXbqPrH4Dty32L2yGhRskTf5FGs/4cO+/WRG68cYjxFrb3whW/ilKbCZ/n1PNm/BjmIySS02HGFuJX0wzZxgKu+brgfcSHkkIHgOlQK7uI
X-Received: by 2002:a5b:80a:0:b0:dcc:1f6a:d755 with SMTP id
 x10-20020a5b080a000000b00dcc1f6ad755mr2167596ybp.39.1709043422906; Tue, 27
 Feb 2024 06:17:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240226194715.427597-1-biju.das.jz@bp.renesas.com> <20240226194715.427597-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240226194715.427597-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Feb 2024 15:16:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXarkL=pVH+4vutNf_g2MX=Y25YM1bFLHJjOE2OQAd+qA@mail.gmail.com>
Message-ID: <CAMuHMdXarkL=pVH+4vutNf_g2MX=Y25YM1bFLHJjOE2OQAd+qA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: rzg2ul-smarc: Enable PMIC and
 built-in RTC, GPIO and ONKEY
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Mon, Feb 26, 2024 at 8:47=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Enable PMIC DA9062 and the built-in RTC, GPIO and ONKEY modules on the
> RZ/{G2UL,Five} SMARC EVK development boards.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Dropped disabled status from gpio and onkey nodes.
>  * Added gpio hog nodes.

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2022 Renesas Electronics Corp.
>   */
>
> +#include <dt-bindings/gpio/gpio.h>

Yep, we need this...

>  #include "rzg2ul-smarc-pinfunction.dtsi"
>  #include "rz-smarc-common.dtsi"
>
> @@ -23,6 +24,63 @@ &cpu_dai {
>  &i2c0 {
>         clock-frequency =3D <400000>;
>
> +       da9062: pmic@58 {
> +               compatible =3D "dlg,da9062";
> +               reg =3D <0x58>;
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +
> +               gpio {
> +                       compatible =3D "dlg,da9062-gpio";
> +               };
> +
> +               onkey {
> +                       compatible =3D "dlg,da9062-onkey";
> +               };
> +
> +               pmic-good-hog {
> +                       gpio-hog;
> +                       gpios =3D <4 0>;

... so this can be replaced by <4 GPIO_ACTIVE_HIGH> ;-)

> +                       output-high;
> +                       line-name =3D "PMIC_PGOOD";
> +               };

Same for the other gpios.

Anyway, LGTM
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.10, with s/0/GPIO_ACTIVE_HIGH/.

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

