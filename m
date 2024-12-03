Return-Path: <linux-renesas-soc+bounces-10807-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F259E1654
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 09:53:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4AD1DB21DEE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 08:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED051D9341;
	Tue,  3 Dec 2024 08:44:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337D53F8F7;
	Tue,  3 Dec 2024 08:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733215467; cv=none; b=mVRwLxjnotJcDgYdRGPQ+NEDoqWJeNMynViDVrTgWrc25jGApnmAENtyxKVRffbJmL2s26v6SqFcQDGNoqK0roIcjOHavAp8WkLSax44om+834+8zYNpaTOq5Rx47YZynEDSZ0/KJM/ACpxXl8dliWO/Otn2Th8I3Dwu1jnSAXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733215467; c=relaxed/simple;
	bh=ZeHFodpx3VLmxFv0DlR0ZvwcUm1DKBF4oVR8jqUwTuA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MZlIkAXivJl8xCXOo7hn7Lcx/fmQbU3/eIZlDglUDX0DaO3DgsEgP5avXm2fFU2o/OjBJRndbAGzF2MCp9lMptrkoLwOrVu0zw2+HvxCKdQWcbAkRQAS3GKmMyIYaO3obkVgGWH22JKOYHXpXno7GDZ15VPU09T45Ez2PwNO2dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-841a6af60e9so168556539f.0;
        Tue, 03 Dec 2024 00:44:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733215464; x=1733820264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OywAl/2Im4NnR7aC+FvycngflhlDkW9ZjU4GtxVKkHI=;
        b=cG5jO5oUkooloZa5C/fxxYV/0Ec4T9nWeGW03TVmVYfyANIbDoM+PwNneJR4zV75kS
         T5TOinjU4GtnvYiFzGI12+2ahZ16kfM+JVktpVVtiamKv1G/PQLUK40TjgP+S0WmPx6T
         BdWwwa4Ij/M94Q1quAMJJwVDHFjMnrlv/ZwnYvgCKvHK0vsMSmEKXL9KUrpyLeoNB0Nq
         s4w7VGeI0kOOItB+PCx0S7Lo10ehwBHP8MReUwwaoWktl5zZr3Ygr1wiab+H3nnDo6ca
         DHiEwhJA5aPfyCBBVtFKxnKHlP7W3ww21hxUpgzsWjQYxPNeiRMfiBGkF1FpdV3I0PIR
         8BFA==
X-Forwarded-Encrypted: i=1; AJvYcCV5UCZc3VFnW96DcFAhBuKxrwf0ErVVdsi6Lq496x6Ggdwz5K/8NSJHBdDh8MOnYwjuV+EJBaqUkh0p@vger.kernel.org, AJvYcCVGYAGP8x9Eqz3YVnhOWUKJID2wrLvKhk9OFMqsjoFp9Pv/0xbYmTmh9n67eR6tsYHZ4941nQJdl6QP+E8I@vger.kernel.org, AJvYcCW74GoZq9hUfXsRQyVfnL5ouchnQOymBH7S2mjxDz3MrfWfn9GmeFEIqMmBunrDJLCnFMSPOBJcsgYida7UEuuy244=@vger.kernel.org, AJvYcCXCPCBzbtd1Cl0li+m+H43RNxjp+BE7kh/rw/hfkqGVwuJ/aXc+T/akgvmFmC7X5f6q50oLy5vImUdQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxXYDwnU4XrWat4nXMNC1bq25PbJfREz4Zj7v61ub5cG0DxxFGt
	ewRKN85t9GJZpDxyQ7Dy6X/Y6v5JVcil+PWZyCkLblExJ8H18urOOh5h97Iw
X-Gm-Gg: ASbGncvWjP3iz/xlnDmn9/tQY4RWmWPmRSpr3G0dfnOqCLVAdc0QKuLIcLc5SV6gxGo
	rTY8Ybu9JI/11ckpy6/ozbGe47yLuvMUq0HmB7OGrXgTiPlvAOdTEF/Zcux7mFzLOtumd0v3hjH
	T4aNkCKsvwgT04GyyKkjbYEa7GRepmwCJH0Dxc85cejr1AP8GQD4FUbjxDsH1TCYqDScVxWSS82
	hGJSpNaeadRPfLi+hgQTSAPPpC6CtfdEWCo4dUoLIJ3pFB9BsP2juM5IsTaD7e2dHWUEkQnCj04
	wPyRg8v50aru
X-Google-Smtp-Source: AGHT+IHupeDpNKXPF7yQcBX/90jhPP2R6a3vuIPkpZw7xdutQfx1qfeDNYqDA+SVMmf6sIqAuKtQCw==
X-Received: by 2002:a05:6602:1546:b0:841:a80a:f536 with SMTP id ca18e2360f4ac-8445b5e36d5mr243858639f.14.1733215464011;
        Tue, 03 Dec 2024 00:44:24 -0800 (PST)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com. [209.85.166.48])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-84405ef1377sm246509539f.24.2024.12.03.00.44.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 00:44:23 -0800 (PST)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-841a6af60e9so168555839f.0;
        Tue, 03 Dec 2024 00:44:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVTPIKNdcLEDQ96tsooF3obnK1VwzOTCwtsR44t/AYK04mZ2IQBPoXnsrn7S9w7BJob0Yd2oItda9MZ@vger.kernel.org, AJvYcCVX+YGXVpnFOWvnf0ctWxfstpov/PBp8Bp/js6Opef26Yc5B6FXEITVvSPwf+gliM3YwPOmtzCaXO7Ukodj@vger.kernel.org, AJvYcCWZpGBD/fDOPvfVCR01Y4eu8s9aBO3IzRpo3P2lXL6JeHpzXLt57H3Rrs/CtjIg5aheLR6Fe4tPyNpUKtZBqGYL8TM=@vger.kernel.org, AJvYcCXSfJbLj+6Cf10ZbugoRefD12sPxa/b4xY0PMI3vl7j65TrOUxYXg4L4cPFzmVFhyZABYAnUwxdh6eQ@vger.kernel.org
X-Received: by 2002:a05:6102:3587:b0:4af:3cb5:e3b4 with SMTP id
 ada2fe7eead31-4af97273dd1mr2273980137.16.1733215136897; Tue, 03 Dec 2024
 00:38:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
 <20241203-rcar-gh-dsi-v1-2-738ae1a95d2a@ideasonboard.com> <20241203081935.GE10736@pendragon.ideasonboard.com>
In-Reply-To: <20241203081935.GE10736@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Dec 2024 09:38:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVZui9c4X0FQ3Xke4gzxa9gvs6Nsp0eh5avzr_G3wd=ig@mail.gmail.com>
Message-ID: <CAMuHMdVZui9c4X0FQ3Xke4gzxa9gvs6Nsp0eh5avzr_G3wd=ig@mail.gmail.com>
Subject: Re: [PATCH 2/9] dt-bindings: display: renesas,du: Add r8a779h0
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	LUU HOAI <hoai.luu.ub@renesas.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Sam Ravnborg <sam@ravnborg.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Tue, Dec 3, 2024 at 9:19=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Tue, Dec 03, 2024 at 10:01:36AM +0200, Tomi Valkeinen wrote:
> > From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >
> > Extend the Renesas DU display bindings to support the r8a779h0 V4M.
> >
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > ---
> >  Documentation/devicetree/bindings/display/renesas,du.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml =
b/Documentation/devicetree/bindings/display/renesas,du.yaml
> > index c5b9e6812bce..d369953f16f7 100644
> > --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> > +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> > @@ -41,6 +41,7 @@ properties:
> >        - renesas,du-r8a77995 # for R-Car D3 compatible DU
> >        - renesas,du-r8a779a0 # for R-Car V3U compatible DU
> >        - renesas,du-r8a779g0 # for R-Car V4H compatible DU
> > +      - renesas,du-r8a779h0 # for R-Car V4M compatible DU
> >
> >    reg:
> >      maxItems: 1
>
> You also need to add h0 to the g0 block in the conditional properties
> below. With that,

Which is not sufficient, as the DU on R-Car V4M has only a single channel,
unlike on R-Car V3U and V4H.

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

