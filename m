Return-Path: <linux-renesas-soc+bounces-11958-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B181DA05BFB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jan 2025 13:49:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09BC43A381F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jan 2025 12:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDC841F9ED4;
	Wed,  8 Jan 2025 12:49:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626711F8F14;
	Wed,  8 Jan 2025 12:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736340582; cv=none; b=E6xAWCkvnHp6rVrdcsW75/F9O3j8hWDrvm+/w80WW95pfqgfdZUdEG3u4H9Y0AYZ9YudT02wFZolTNTFky2g7XXVu9nHrLIcAKN32B1hAHyzGDYu1l/uUPyEvq5nr89iS2WOVagTODrrTwtggRPju7iyxwReqW+brq53i8d7p9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736340582; c=relaxed/simple;
	bh=fNRAprGW+H8OfhZpQEkJ/jIpXFQkdunMCWk4Ny7EQkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Li+hXxxFfcaKXQLb3XYshH1XCv6fJ9EBRrItoq30jOsw4DP4F14372xjidtFDSnjfA+pzFSdyieZXKLxNcgL5cYFrFdFkbNGnMiHlJP/I6VoxDQL+8Ki0yEqfpkIr8QhVRsvy4tzOR8YSUBqvhv90FCuykcvLKgXp7cC7o8bDK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-51bb020339fso3642480e0c.0;
        Wed, 08 Jan 2025 04:49:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736340577; x=1736945377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HUpdZqfO185onp0pw74RHuTZBmHqg9gIbSRVhApYVuI=;
        b=NyehqO04AGaBK63dyKFhZnl1A2DkDiKyoxoZjKpNG9shEbMTmo6RVcdjtqz1+dGD2T
         0DVNII8VB5lh+Nx9ktiij86CUi/4AlD0uuK5yFxgRg6NrjKZqgJK1206eRpwGaOr2aqm
         C9YAf7ALvp/qCLdD7qomAibnWwn0g0G7RROhCunRs5IFGkpvMuhDpKlvQ2c+wQsP1Yyw
         +eb+/bfqBEMYwb5nJmoGrWUcG7PDD/tjZ75oHSJ0YxO8AH47dY8KyCU45aPd3/FEvGrD
         zjmPHw+jGLZ4uwrfw4H+EopTsvYPTOj6DdiL4AAlVt51nI/9mR/BT2hbgVbRq9fOMPKx
         8Hxg==
X-Forwarded-Encrypted: i=1; AJvYcCUHO7OH6QW+Z8JMHOJPNC/hJNLwKCkRpCdL6I6d3bK/SnT+QdKzjnoBihiDsmD+DrbHZP21M5+RtPcXMx7MkCg/vhQ=@vger.kernel.org, AJvYcCUXS1SUg8jlUQYc1Z+a4nTKHJmR/U3oe6WBV3saPN2bcmodAfYhlcTnTttG+8Ol761mAkmDbF2/FGF/kjw=@vger.kernel.org, AJvYcCVSlhxmoeRsn3FTVT4GLJlnDjkT56xE2PyzvA6qTAJPuXZ2GMlSwMowRZ5Swgrprnz6nEaZ7+2f70LE@vger.kernel.org, AJvYcCVW88dSU5OjS8zJdhNUBMJSqR1cSDwxnrMWsU/uStFKB/1jb5MCUG8iF4+6eU25UJLoDCMNau7AYYe4gUM8@vger.kernel.org, AJvYcCVwUkb/nNOD7rc1MhGnydRvwHSR8JcL9Tt4ewNLpNLkyMAl+isA3C87jCUMMZOUDfDX7hNSDU1F3wy1@vger.kernel.org
X-Gm-Message-State: AOJu0YwDQzm2VYYZwXooV/7jMnzEi26krgiBmrCOyTX4jqGWhdtqVGyO
	c5u1yU2feyyck4p823e8RpP2o+vm8SKjAgoAehpn5lOFXwIeKTzTu03/z7lF
X-Gm-Gg: ASbGncs5aG0Sx7UqcwIA0QBI1MzLP1PUMpRbIIStnG7Ux3RUa0CeeYOxxZ5KJi8xD5j
	diaIACfCG3kkweJ9um9B7DR3sX6CinUbzcK19Ub6atXAxGq73hF7POx1NRPIu3xhYCP79EBqddO
	EaNXIzddGzHKGrOkTJ5GWR8QuCNh6RVblUcIfDRrfGVdPpXGDI8aAnRfJO2JdoQR/5ioVPXmC2V
	yH3GoNPg1dJ/Gj74aZhpfXuXLD0kjJSDV5/hXEmfxkBqIkholS8MJAei2oZpLcGy0r3ItyH8oos
	Vh858eWedHLLTpifRpo=
X-Google-Smtp-Source: AGHT+IEITTgdXM1Fmq4pTWXfT2OwdddiU47j7yiS46a72/fPuaqNJ21obuAS+stFzHcPtVq3LEKn/g==
X-Received: by 2002:a05:6122:4b11:b0:518:a261:adca with SMTP id 71dfb90a1353d-51c6c50dacfmr1689281e0c.8.1736340576717;
        Wed, 08 Jan 2025 04:49:36 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51b68bae007sm5098806e0c.14.2025.01.08.04.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 04:49:35 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-85c4b057596so2963758241.3;
        Wed, 08 Jan 2025 04:49:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUG/C+Uj8nZw6HRmxdWWSqEkAmY1Uh/1cSDhW2UuuO/JX29w5DgfvYDkrCg9NTOyCJPmHTGCWvxFukzk7z4@vger.kernel.org, AJvYcCUbJ4Aawyy5JlmrNy29xfK28MK19bciHzKXni4xEPvgpPbJXAJyZdBQn/H9DOmUBEjCqXE+vWLGCTD5Hgb75B+/ig4=@vger.kernel.org, AJvYcCVP+MHpsRORxwSgfU3FmlG9Y8eWVjqzY5UZcozRE8cjVkOFiwiORCY8fYgBaglagQ5l0mvJ1y0Lp4W4d+Y=@vger.kernel.org, AJvYcCVRTmGO9NAYQI9/C2Moha3o4JNtmoMNsmTwzbPrB9RKgg2pru3wMumALO4eLzHmVpOMbNGb6CrkxcVg@vger.kernel.org, AJvYcCVt2aecBP5u3FMzCFeyTmM1evGnAgfyVAyNxsB4254DYnfIS4x+AxL10qQ7sBKb1alAQL0AxiDoCc1n@vger.kernel.org
X-Received: by 2002:a05:6102:e10:b0:4af:c519:4e7f with SMTP id
 ada2fe7eead31-4b3d10485b5mr1502790137.18.1736340575232; Wed, 08 Jan 2025
 04:49:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250107131015.246461-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250107131015.246461-1-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Jan 2025 13:49:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVpDWFt+3EBeiGfia3DXDL+LNg976FBm32vNEnJdSx4uQ@mail.gmail.com>
X-Gm-Features: AbW1kvaX9wLk6edIIBJWmWkhpdJHnfaq_7CxFB_flrYoOUJ_oqU6wmphd1LCLQ4
Message-ID: <CAMuHMdVpDWFt+3EBeiGfia3DXDL+LNg976FBm32vNEnJdSx4uQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: Correct indentation and style in DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Justin Chen <justin.chen@broadcom.com>, 
	Al Cooper <alcooperx@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Florian Fainelli <f.fainelli@gmail.com>, 
	Benjamin Bara <benjamin.bara@skidata.com>, Bjorn Andersson <andersson@kernel.org>, 
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>, 
	Del Regno <angelogioacchino.delregno@collabora.com>, 
	Tianping Fang <tianping.fang@mediatek.com>, Jassi Brar <jaswinder.singh@linaro.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2025 at 2:10=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
>
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

>  .../bindings/usb/renesas,rzv2m-usb3drd.yaml   | 36 ++++++++---------
>  .../bindings/usb/renesas,usb3-peri.yaml       | 24 +++++------

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas

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

