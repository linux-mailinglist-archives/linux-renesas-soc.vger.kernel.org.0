Return-Path: <linux-renesas-soc+bounces-11443-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE179F45CB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 09:15:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3FA887A26E3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 08:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2ADC1DA628;
	Tue, 17 Dec 2024 08:14:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5AF335C0;
	Tue, 17 Dec 2024 08:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734423286; cv=none; b=S7UHz5+J46FIi8nS7Fd+d+1dpKvcPLr1As5Xq5e49G2j2vnsTJWhSH5QOxSf6suFICFnE9fqtUil1Dh+hXdDnp97nJ03eUXV8YQsFODjylMWOxG9NL4j841yf9g8KyZWIQUQpgU2ESoXqbGIAK8SSbi7p1nLIqz8VKo8BAz5d84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734423286; c=relaxed/simple;
	bh=uOwfXU557rop5TIkXrFQReiFQ1xrxUWqWlXUsv4FT6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lXFIPQJzAtFQNI/BwZdOq+dTvcZFFUacZrwyh+QnHfSP0Oogr3QFf65QbQD87Y8nFQH/w0Ksbybs/f9fimdv6aHmWbbHvGRrPRez9m24QbwlWEu/ifF0i5tWr5rs8aYBSoKNYf9wGaSW6DEYAYomiVfETUMsjdipfv1MxBa4TCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4afde39e360so1284865137.0;
        Tue, 17 Dec 2024 00:14:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734423281; x=1735028081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BPpiGaA1e5dMiDjkAszyfRMBt3SwUPjlRJm/tlaPvdg=;
        b=jJZOm7sySrMjd9awcdD7fnQS5AaZKG86b6RvAEb9uV4h5Fany1VycfwVbHwJpio8Pc
         v0GivPnASO5dRoLt2oAoMQBfs7iT5Yv2+61bhi+YqPMF0r+PDI25ntmwSdz7VotYFdTF
         gLg7SuPn7hOza1aEzcOmsb/75eWRrwkI0Iiuf3+q0uukFRwFiS2Niftahe49qK0dL7LY
         pGBCou9jKBKI6UHvBrsYxXwkfzSox5e0+R/cY7yacU8Ua8SOdMxkoIdGQxQQHIi7KAQK
         GqoHdJ9P3HzuXXlfF9mo8t3IJoLlLxSCE86vw+Uq2BuSRPj7g57qZu6JnIh6LUF0xMto
         08eA==
X-Forwarded-Encrypted: i=1; AJvYcCUhAgoir1cdZ7RPKmHnjia5NEXRLcgqCiOEx1qgP1qqH1AtFfBGuQ9SbVEWEBtu0QLZgE3N/27+3yDPm5GvyiOw7WQ=@vger.kernel.org, AJvYcCV2uQBX/nC7A2NEps/QnF28EVmB9XBo1C2ApjMGFrId1ZUI1bJVm4xpw4jUvybNmx1YUye+rlCY7LHp@vger.kernel.org, AJvYcCWu3+b15d3ZUOYgtkquE+qq9qkSJZMo+GBRxKpZ+BOO+lUzBuo1fg4IowR84Kf2dBpRRZqhpklhO89W@vger.kernel.org, AJvYcCXaMxkofjUpfAf6yCS5yB3Y92xETd7VnrJ0uEAu/m693cJcOvtO6klo/WKxa6fI3+wqRqTulld0HjtNK2Rs@vger.kernel.org
X-Gm-Message-State: AOJu0YzFBPKIG606N8oFRSqtwNnz9YK3HidEjngOUXdVqNEcZb3fy0a+
	rMURY5xuphT5jK7GPQjpW/YcVhAYSuvu6YPTIAQNNZkrLqVK1iUyvktfEoGG
X-Gm-Gg: ASbGncuQa3d9uRVefWyi46XP7gfc+T0GDq/5jwsvuuDzhXnAvS2Mp4LErU8nYp8hxqU
	yQZUXt2u91qitIbwhgAt25HBbIdPVSMTojQUxxZCKvI0JGpgL19QnMiS8BUQEpnn9gJnbtZFdBu
	Nx8E+AvQNiBelusT3VPUSfFqQLmaL3mtZEWATJAJLw5IeYHaVZmB0Y70bpv/XQBTeB/9xFLwfi1
	4SsVTvx20FD9dUT4OJyOjqGTlCjBp3l+Z47ByEDrkdi04+a5Sn0M2FiNeU26EiKXQKpSDIil7cD
	b1dDCEa7cvYSb/3Rqflsus0=
X-Google-Smtp-Source: AGHT+IH8YYpmAEjxSSLUhBwLYDN3zqHh/BRRxfs4q0wqouKF1HTWa4+yU/mImOSOKT1Q7nneuq8TCw==
X-Received: by 2002:a05:6102:6c8:b0:4b1:3b91:a697 with SMTP id ada2fe7eead31-4b25d9c02f0mr14452346137.15.1734423281240;
        Tue, 17 Dec 2024 00:14:41 -0800 (PST)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-860ab5b7cd3sm1125848241.17.2024.12.17.00.14.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 00:14:40 -0800 (PST)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5162571e761so1400105e0c.2;
        Tue, 17 Dec 2024 00:14:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU6LaF4FjR5bj5B36WrDL6O0A26AVYkkzY02yRMtpDtoqcQZ5/qSahW7H8QJ3pUQReYw8Nxzkn8tu1q@vger.kernel.org, AJvYcCUVH5bT1Zcpeb1elC0EkZyzbWdjhtCBEZVTGQSqP6OdfCe550DcIEQdXJGPNqihZwW03Na4PUQmuNuf8Ip6@vger.kernel.org, AJvYcCVQJ3ZDUkYczpw2G7c3h6dCpAbH4UIvwkhnDHEs41DrMhX7ywnVRIYnAIFbbru3hJIVoT6hedw72j6d@vger.kernel.org, AJvYcCXyDDrNaGwNKHIg/3yscDGffoOJkLFb2TBB52RAgcF5xn1Rb9t/1KqOC1i0StQPM0yrprWklJnB7CuW0upU1l7rVPY=@vger.kernel.org
X-Received: by 2002:a05:6122:2a09:b0:518:7777:a61e with SMTP id
 71dfb90a1353d-518ca39a80fmr14871103e0c.5.1734423279879; Tue, 17 Dec 2024
 00:14:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217-rcar-gh-dsi-v5-0-e77421093c05@ideasonboard.com> <20241217-rcar-gh-dsi-v5-3-e77421093c05@ideasonboard.com>
In-Reply-To: <20241217-rcar-gh-dsi-v5-3-e77421093c05@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Dec 2024 09:14:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUczNArF7JSfjrb11OTpd8LvHv5-gUFPFCayr+Qezsbbg@mail.gmail.com>
Message-ID: <CAMuHMdUczNArF7JSfjrb11OTpd8LvHv5-gUFPFCayr+Qezsbbg@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] dt-bindings: display: renesas,du: Add missing constraints
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-clk@vger.kernel.org, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tomi,

On Tue, Dec 17, 2024 at 6:32=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>
> The binding is missing maxItems for all renesas,cmms and renesas,vsps
> properties. As the amount of cmms or vsps is always a fixed amount, set
> the maxItems to match the minItems.
>
> Also add the minItems and maxItems to the top level properties.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> @@ -77,6 +77,8 @@ properties:
>
>    renesas,cmms:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
> +    minItems: 1
> +    maxItems: 4
>      items:
>        maxItems: 1
>      description:
> @@ -85,6 +87,8 @@ properties:
>
>    renesas,vsps:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
> +    minItems: 1
> +    maxItems: 4
>      items:
>        items:
>          - description: phandle to VSP instance that serves the DU channe=
l
> @@ -489,9 +493,11 @@ allOf:
>
>          renesas,cmms:
>            minItems: 4
> +          maxItems: 4
>
>          renesas,vsps:
>            minItems: 4
> +          maxItems: 4

AFAIK these two additions are not needed, as they already match the
values defined at the top level.

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

