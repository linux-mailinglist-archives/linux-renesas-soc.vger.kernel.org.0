Return-Path: <linux-renesas-soc+bounces-6716-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6069915F28
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2024 08:57:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E098AB22F6A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2024 06:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3144A146595;
	Tue, 25 Jun 2024 06:57:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE6614658D;
	Tue, 25 Jun 2024 06:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719298661; cv=none; b=j2BX9DgtNFdHwa6bwtC4xyQzRbg+O10KO+MVK8EpKLZlj3D06Z4T2ajvSKaOR8cY2odsbzd3TTm6JiA5/3/MSFpcV1DBQUqV7DYNXgqVK7zhlkAkgjl048BzfB8oYmc+NDn+mrkXqsLfaixbUBms4EV4UC/c6bG616O53tlS6RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719298661; c=relaxed/simple;
	bh=7PQ9Ld3PigpkI7t5BiNna4fflu7OG1uZIn6VEDnEgUQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dqYNTT+tTkbaHg76GqnIJXq/eCJadRiCqB8cFgj1VuFKd3aJ75rlTcmPH1SWjWepY35mF4PDEmMydf/8kdq4Lx0IlntNK4xSrmPcgH6l6tv8J6HZuqPen47vkShuWgBpabTS1cnhc9IjxzkFux7jLrk1nVMK6Yxbu5h2618B6Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-64361817e78so25270627b3.1;
        Mon, 24 Jun 2024 23:57:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719298657; x=1719903457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zNbYMFbhgmOSSwF5RGasbPwl9K7tYI8aYy87FC0FKAw=;
        b=YMD1xsJjicz7/7UP9/OL/OatMBFoy4ck0TXy8cUkcWNaMuitG+KjHpk2d4Hrkhys1v
         8PRSYp+fG6ku2Tl6ffqnLpcnou4Mp8Z1VyqUsisS+J+HKMEfhMjYwkCTXnz6xr1MUHa4
         lMQEeXpAfomWlZ0QXOZf1tEChBKWzoQVJStNpEn8cUtGl17QJ7hM55MQysN2lbYrD7kC
         WG4/jcRJp8PIqsq5CYNRVL2HU/qqw6RtGFcFKxz2NhIUdwpUjBt/JuUmQzkNJGc0vCSH
         VrVnOzi1drbw2OGsE5Tb8I2BD1Zjm7XSl0EzlxL0n4ID9x7KEziwyELN4WAfwWoqdYza
         wmmw==
X-Forwarded-Encrypted: i=1; AJvYcCWSxHmM0e/hM1kcdE8kmOEPWM8A0BkniK6cUDgqQAiIQiRpz2nQ7Gww/R2eHRD0Uy7585RDIQ3YnHYtT0phBRfSzJZv51Pef73d+4ZD+eK+m5/V3EdqLWvl0dxgvTF+/ZPdAx9iM4JxjM6dYD46JyyarH7toBiPDKr+6rrNfwY86DrU75pzrlLoGvJmnBOTAo616cPLxCh3h6NZm6QMHOm+kLoFxpgq
X-Gm-Message-State: AOJu0YwzphaHsiY3Er4CM8byCXmHWtY16esLRNHq1020gKMWAmWrjjbj
	DXj2EgL6ZZcejK3XV/AnkaNWClBGiFbiIjS8KYi52Gvlsg/JVgoD3oWFcD/t
X-Google-Smtp-Source: AGHT+IHWmQxqhcZcwE4sPvQn0p6Wr9FMO+8wNhst8PvMzBNiYKD5Fq+B2YR5eLIc85yO5Z4TvdP3nA==
X-Received: by 2002:a05:690c:845:b0:61a:d846:9858 with SMTP id 00721157ae682-643aa1c15ddmr60099197b3.20.1719298656843;
        Mon, 24 Jun 2024 23:57:36 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-63f154d5f8csm33570257b3.111.2024.06.24.23.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 23:57:36 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dfdff9771f8so4776583276.1;
        Mon, 24 Jun 2024 23:57:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCULI3LaolOrc/SVFBkaCa1z18le1a0/xuKtVfLSZLwZV8LOR600ORtWaUrdmgcAIaQ78clxBhQ/THp7YA1SaCZp8gitVcLmnJJl+tJay1A6RNXORlEFfsRdF7/IGrmJ9mredPGPXHZxdkjG0SB2gm91MpfP7A/eYkSD9LHmVi3LzoQB9w9Zw+vbHDZ+CJqWevfRcxe/0Xlrmc0gMAjr5Nqkb3JAa4oL
X-Received: by 2002:a25:97c5:0:b0:df7:7065:24cc with SMTP id
 3f1490d57ef6-e0304045133mr6134526276.61.1719298656102; Mon, 24 Jun 2024
 23:57:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240624153229.68882-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240624153229.68882-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240624153229.68882-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Jun 2024 08:57:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU0r+B_Jmh7E6sopRbfzzX7DtZKpY=Xte2vLDC-ORwdVA@mail.gmail.com>
Message-ID: <CAMuHMdU0r+B_Jmh7E6sopRbfzzX7DtZKpY=Xte2vLDC-ORwdVA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: mmc: renesas,sdhi: Document RZ/V2H(P) support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Mon, Jun 24, 2024 at 5:33=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The SD/MMC block on the RZ/V2H(P) ("R9A09G057") SoC is similar to that
> of the R-Car Gen3, but it has some differences:
> - HS400 is not supported.
> - It supports the SD_IOVS bit to control the IO voltage level.
> - It supports fixed address mode.
>
> To accommodate these differences, a SoC-specific 'renesas,sdhi-r9a09g057'
> compatible string is added.
>
> A 'vqmmc-regulator' object is introduced to handle the power enable (PWEN=
)
> and voltage level switching for the SD/MMC.
>
> Additionally, the 'renesas,sdhi-use-internal-regulator' flag is introduce=
d
> to indicate that an internal regulator is used instead of a
> GPIO-controlled regulator. This flag will help configure the internal
> regulator and avoid special handling when GPIO is used for voltage
> regulation instead of the SD_(IOVS/PWEN) pins.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3
> - Renamed vqmmc-r9a09g057-regulator object to vqmmc-regulator
> - Added regulator-compatible property for vqmmc-regulator
> - Added 'renesas,sdhi-use-internal-regulator' property

Thanks for the update!

> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> @@ -204,6 +207,31 @@ allOf:
>          sectioned off to be run by a separate second clock source to all=
ow
>          the main core clock to be turned off to save power.
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,sdhi-r9a09g057
> +    then:
> +      properties:
> +        renesas,sdhi-use-internal-regulator:
> +          $ref: /schemas/types.yaml#/definitions/flag
> +          description:
> +            Flag to indicate internal regulator is being used instead of=
 GPIO regulator.

Do you really need this?
The status of the regulator subnode already indicates this.

> +
> +        vqmmc-regulator:
> +          type: object
> +          description: VQMMC SD regulator
> +          $ref: /schemas/regulator/regulator.yaml#
> +          unevaluatedProperties: false
> +
> +          properties:
> +            regulator-compatible:
> +              pattern: "^vqmmc-r9a09g057-regulator"
> +
> +      required:
> +        - vqmmc-regulator

I'm not 100% sure this works correctly: does the checker complain if
a required subnode is disabled? Note that I haven't checked that.

> +
>  required:
>    - compatible
>    - reg

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

