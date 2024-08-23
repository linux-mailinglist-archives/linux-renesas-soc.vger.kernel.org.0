Return-Path: <linux-renesas-soc+bounces-8142-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6989195CC33
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 14:15:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C7301C215F9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 12:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 758E2358A7;
	Fri, 23 Aug 2024 12:15:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A473A28D;
	Fri, 23 Aug 2024 12:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724415325; cv=none; b=g6KXq1am3/wgWnz6VjiceqUu+m4govVoYUnooJf6xYW6GOSIp4LppnFQlvBSkcEXqrIZiegs8O475PXoKgU0FD7BYy3mS4z/fsygajTgUazb5HT4pTnBJQk//7GEUanG1iBtxrFaDIJfyV2qK5pFVx1nXMIHc/IcMFJBs8/yTvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724415325; c=relaxed/simple;
	bh=9Gvond4EpUbd/5LCrfoZSP6X0bn+M70kRVMuJnjnLcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iw10iYyEL6zYGjifPW5rWyf3g88i2d3iLflBh5NAn6Pv2o8Jv3ipSFBK8NfnApvCANDieLsfKG7I1GHDI2xUQa1Jh9GIIb/K2B7A7I7qWtHAkPa3o1rcVh8Jb1HsoW1XKUDubinVMEMM4kWvfLP3OrVf6vSDbjhRgg5yntRI5U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-68d30057ae9so17535737b3.1;
        Fri, 23 Aug 2024 05:15:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724415321; x=1725020121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q9McJyguLm8xtxOWd0nGrC2vXxRJ8FqFdeFHw/GUufw=;
        b=Gg0VLQtWNBYxRlPQ4KHdBgPkW+t0e8tZIIlacf4oZsekFUWqZuAE4d6R9lXrxcKjUf
         crrd8Wva0gpjpPLi1CuGg2NOmr2g7dQ4V9s8hCJ647EDsymj9UvNAcQrdNB6ndDV2gbu
         ppSOJIr8P1JzYjINbzv6tg7scyhdWw4a8C4dJ8HJZx8AJKxaewBM5mdUHtmXy8QJ7PGv
         Rrk67WSRUOvp678Naj+G1i90maxrNd6+aaIOJIG0CWYIAZVY8CfuPkI6IIIsY6d7AfWX
         i9Ar1p8KsnGZVzc3N9o+HkGZX5JRGN3xIfXXZnTHZ8KHCfeeMStC+DB1DzUHemE017Sg
         XcNw==
X-Forwarded-Encrypted: i=1; AJvYcCWfB5aoi3ZTISkgpT1VLa7B2R018xE6JW/unNTI32TbKyw7VGjYMAkSfULLYDMf+Pj1GZZdqwmM4Mrm@vger.kernel.org, AJvYcCWoaRWiItsEpbnLZZzQJf+vqg/wOjSTrvAlfMfN0d8RM8SevC7CK8bN4m9K++rnXs4IFT8tAHRmF+BFn9kAvlOZESs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYy53ruuXLh6rOqLIRUSWcf0rIeudHsqV8hNJQiMQVb0LHfnhC
	5dfLL06L7E3zIOeYo4Mi2lm3zDRMw0OhFv+LQzDjRjmU29H32PNnNJ0sN868
X-Google-Smtp-Source: AGHT+IG6qLUjE/4pg11khN22ayEEHO0V0oUhn5LbhRueSoRooJntj5jRWAmRA8ZDXw3DFzZCeDKW8g==
X-Received: by 2002:a05:690c:ec9:b0:64a:9832:486 with SMTP id 00721157ae682-6c624419031mr22859477b3.1.1724415321259;
        Fri, 23 Aug 2024 05:15:21 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c39d3a9de7sm5276247b3.79.2024.08.23.05.15.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Aug 2024 05:15:21 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e026a2238d8so2072835276.0;
        Fri, 23 Aug 2024 05:15:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV7ImV1HFeQ8FakMopJ+zPkKfhymT9oBbMpuHYGafRsPeL8QpSKm/VrmcJwtI8puJVFA0K5gxtzNv9NY9wY6mxGU94=@vger.kernel.org, AJvYcCXSh9PWMeBfCrIzIYfjuH3xUzl5MXrDZfc98rQXzdEiI8yUzkmiEaarrtezZikEf/SbWUe1mAHJknl+@vger.kernel.org
X-Received: by 2002:a05:690c:288f:b0:6b0:e813:753b with SMTP id
 00721157ae682-6c6288aa364mr17322387b3.38.1724415320673; Fri, 23 Aug 2024
 05:15:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240822162320.5084-1-biju.das.jz@bp.renesas.com> <20240822162320.5084-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240822162320.5084-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Aug 2024 14:15:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUmUbi9ZyxGJPZKKwXT96KB=mrkTMxhdg0TTDAcT3kxvA@mail.gmail.com>
Message-ID: <CAMuHMdUmUbi9ZyxGJPZKKwXT96KB=mrkTMxhdg0TTDAcT3kxvA@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] arm64: dts: renesas: r9a07g043u: Add DU node
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 6:23=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Add DU node to RZ/G2UL SoC DTSI.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:
>  * Restored ports property and used port@0 for connected
>    DPI interface.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.12.

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

