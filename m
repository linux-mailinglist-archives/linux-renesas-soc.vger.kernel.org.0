Return-Path: <linux-renesas-soc+bounces-8122-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BD695C8CC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 11:07:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BEADCB2442F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 09:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F4B1149C79;
	Fri, 23 Aug 2024 09:06:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E4B1442F4;
	Fri, 23 Aug 2024 09:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724404004; cv=none; b=Sn7sIpNQlGexyv1OGEAa8tYtDnhWoe/eo7uOSW9tNLOfE4Ueiv3BKYkj5fBUijVgNJoTRpQGRmhOwsgPb7eX4sl1xZ3To3QRjos+WgxmlTYRh4Ge3CU4o0JUcgdbDWGTt5+iJCzusfQVxobFIuQk+9GD5MWG2rVKL/eQCvvdxRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724404004; c=relaxed/simple;
	bh=+9IpXVuegpDInQgrAgek/vlLq/KRAbJFH1JPQwJ4gwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZPBrKqblWMW3wGTMD2O/bAQqdx4Hz3WlHwRQ+KA0aG67uQD3gcYLVszF1OEKAUzKXqBVEC76HIXEvyuFGrFj7d54uOSdFQhIbIwX6MdMKLNJjnZ4/T3iXcKZidyYyiUU1dZbe9Qt1lM0h+ujohMAi9A6E5fN7wAzMwHQ+AXSTYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e13c23dbabdso1688806276.3;
        Fri, 23 Aug 2024 02:06:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724404001; x=1725008801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gb/YSqzf9fDLhLWRgXRW/noXuJgu/x7bBZHSqFpFD0Q=;
        b=dC3wbDve5glLecLo5GyHlCjh68RSkaLfFTJan6nNQfwXtznSDo7Bx3ITaiMrrkAwgG
         9JU9wdsaeJyo/p3hU+ZGlvJ9aDJq9EnBsdcUlba4plP/BVu+Y3vEa6/+ivF35zgCQ8YH
         JI9M9DBE441fX5OqNo377SwuFibwYBhnMX4AxFt6woaBDibxLpQKt7XzUk/BiVPHKZoQ
         G7FB0XxZSLKn6vbAMYI0o1DgF12z6lOTC91sT2RWkb7todI26Mh6m3bsAY/sYmZRZ7Ac
         X1ROEcFWR77tG0S7NGFVxNYoeSD85H7jFurz6Cd8DzAL5bAggU3SJCXhpiHhTzkO3o3C
         Y2nw==
X-Forwarded-Encrypted: i=1; AJvYcCU27ucjkhRJRFFOF6KwPMZenNzq4t/PmQkzdvn5QLo5GyLDJrIBr8iCKZMKL2bFkOu0n48cbTDNJwK0XVPAYu3pKPc=@vger.kernel.org, AJvYcCVTslZ6SIoMhgW3fy7441BfdQDVjJ6lv0e0DBseyEcb09QN+0kmI7w1Tunhv2Ed80ovYd21U8NBmtuS@vger.kernel.org, AJvYcCWRKxQ3ZJQO2PivK55Bk45anzw2NNQf0c+W7LSgIo0w8fGCdxdKBdg5ocRwDTAQk2+hwZ/ecQkNPldzBJfu@vger.kernel.org
X-Gm-Message-State: AOJu0YxggrYde+OfE+z6jK6WnuqdGTTfEyKujcQfXvST8aqIOFt33WZ7
	JDjOgkuNBAQEqUCGytz2roW8fQ5HIU+4tfgr8mkL82tV/Zvc7gGhbiV/JLtA
X-Google-Smtp-Source: AGHT+IE8XA4iQjNq3Lh9k9fFy7um3yyoxoDo9pZFNJSUCVZHXMnmwe8pQ+IMDMVEvmTWskrlawXs3w==
X-Received: by 2002:a05:6902:218b:b0:e05:e103:1ccb with SMTP id 3f1490d57ef6-e17a8e66d33mr1524066276.55.1724404001088;
        Fri, 23 Aug 2024 02:06:41 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e178e4638c5sm585147276.18.2024.08.23.02.06.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Aug 2024 02:06:40 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6b0c5b1adfaso16800047b3.0;
        Fri, 23 Aug 2024 02:06:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUTyUTgt5EL524lsBr2FUTz/mz79BcbWW7L4AN7qAqzLSaH0YB7QRCfuvOKvHkfWS/wj3Eed/+pbJT1DsXr1MskJc8=@vger.kernel.org, AJvYcCVX0yjyEh3rg/RS1/faStGKvoyZNOkj9Zgwigzk/HgPo491EBScXx3HPMeUOlTRmXhN2fGfDTuxaWMQbpRE@vger.kernel.org, AJvYcCWeehA8lHwyzeaG6m/90y4TfY7A9UtbFpf8TLROvuHhWXC+O9aainZ7omilJ5cMmeVHPVo9KM1YTEMw@vger.kernel.org
X-Received: by 2002:a05:690c:340b:b0:664:7b3d:a53f with SMTP id
 00721157ae682-6c629befdc3mr12100907b3.45.1724404000684; Fri, 23 Aug 2024
 02:06:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240724094707.569596-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240724094707.569596-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240724094707.569596-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Aug 2024 11:06:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUdTZMHOn9qK=mZi7PR=fdwzXOdYnhFwB-2ikEGiLQfmw@mail.gmail.com>
Message-ID: <CAMuHMdUdTZMHOn9qK=mZi7PR=fdwzXOdYnhFwB-2ikEGiLQfmw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: soc: renesas: Document RZ/V2H GP-EVK board
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Wed, Jul 24, 2024 at 11:48=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add "renesas,gp-evk" which targets the Renesas RZ/V2H ("R9A09G057")
> GP-EVK board.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> @@ -515,6 +515,8 @@ properties:
>
>        - description: RZ/V2H(P) (R9A09G057)
>          items:
> +          - enum:
> +              - renesas,gp-evk # GP-EVK
>            - enum:
>                - renesas,r9a09g057h41 # RZ/V2H
>                - renesas,r9a09g057h42 # RZ/V2H with Mali-G31 support

Is this the same board as on[1], which is called "V2HEVK" in the board
documentation? According to the (vague) picture, it has an "RTKxxx"
part number, which you may want to add to the comment, too.

[1] https://www.renesas.com/us/en/products/microcontrollers-microprocessors=
/rz-mpus/rzv2h-evk-rzv2h-quad-core-vision-ai-mpu-evaluation-kit

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

