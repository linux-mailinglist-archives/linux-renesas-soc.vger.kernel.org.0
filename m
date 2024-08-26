Return-Path: <linux-renesas-soc+bounces-8283-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1E795F20F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 14:53:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E3031C22B77
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 12:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF79B17C989;
	Mon, 26 Aug 2024 12:49:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE7717BEC0;
	Mon, 26 Aug 2024 12:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724676598; cv=none; b=FfUvEp5ZWmOnWm5SSB1ErRxspg4hdqLMgp6/he0eYX9GfwOBlTYjuNl8t69o2Cqp39T9cwR5vRFimhCJn/cWQhLSBzGU7s93Jlixbsws6oZJWDjsGlae8/thShquBhf1N4ze+FFB/aqpNv+U5owciWlIe7AE9m7A22eZ/NsVZbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724676598; c=relaxed/simple;
	bh=U5d9f4V/3go4eQ+5yKorX5gfhmyk6wN2Wq5U9RPsxn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pcn3n9BQhWW+7nW7Aa/6wE2uCpfvtVrXreafnrLHKxIe8NCCmT3VnzPrFbcJNiv/M6mOJfP7Fq7pv8dPrcMcKGrjrjJjemXdbmIHRXbFWndy75ovXvaBYl5n2T/yUiA8sbFNO0X5GUVxnnVQwu1frTSlXCma+At5vcKq86Q7QjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6b4432b541aso37662757b3.1;
        Mon, 26 Aug 2024 05:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724676595; x=1725281395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fNKaoBwiLKxyI1/6ZL98h5nDfWVTkc6MIAIcVX0VupA=;
        b=FBNDsYrW6rmcC93wcjM2qoQx8WqS9kDh7SQtpGMjKBNOjE1+Ypqb9JaxYHu70pPwg/
         tkQFjegWuankG7n8+BzevDaffMfqy72+j8uyT+80909PI+5nLWnqmUP+EM9pNN0Gvskh
         PLvJ97xP3eChPe28vx6GwwjDL1FNIHDtAr0ux52wjwwb8bHHxwOi+HPpF7+5ZEMve/hT
         sqNR2Ww5yzhLsLzsMmLr9XDmpx5kXrKC6atKwsGiME9VkBbv0+vv7ZHB2JVjSe3miWnc
         zH86ztNNNlzEMzPOiW3i2C/k47nt8VdJ+DrEjsu2I9NiD5zPDO7jOOfoywTICnGQULDl
         o4vw==
X-Forwarded-Encrypted: i=1; AJvYcCWG6c4fc9NhOjQb9qjGdVExLR5A1A86Czt8kUHot8ZVQW9wvWcXl3k8vb5DvDiJVG/FCl1WejrbF5qifbdtg4QfP+8=@vger.kernel.org, AJvYcCXS1/RdV+PQBEM7ToSMZ6mWp+A2ss7HLvlFltd/OBiQPjYtgiVBCuHX8jGqYed6KCgG+s0MWQ/ZQwgc@vger.kernel.org, AJvYcCXSg7dZ6aNKg0g2+LtqX0CpZHAgt/JfrrebnfypzdoNiVxpiQVYGA3va2tDqx1I3Txcld8jIMTxVkgdJsSB@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1UznnXadDUL5KFZm1YA1/XC0uFe9SOldWv3hgrMXQCXHkPYh3
	NDmG3OijQ9udPmgskEoj47YnXcwOTMfft2tud2ZvI4PhTts/ZxCt3aacC/I5
X-Google-Smtp-Source: AGHT+IGwbKXwkNP2TgAFJUWSN4ml6WC6Nhe4oky562mjIrqDl608Wxor3GqniBr12Kz1MkJAsBWuuA==
X-Received: by 2002:a05:690c:d91:b0:64a:f237:e0b0 with SMTP id 00721157ae682-6c6246036cemr116548157b3.5.1724676595122;
        Mon, 26 Aug 2024 05:49:55 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c399cb503asm15103757b3.17.2024.08.26.05.49.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 05:49:54 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6c0adbbf2eeso34492477b3.0;
        Mon, 26 Aug 2024 05:49:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUHThF6t30tHkf16lHdLocXP4yV+rn6b91VKr8RswB0XcvF6KDV8RiaxhQVdchEsU8TRwDEDprgq0j8yPaa@vger.kernel.org, AJvYcCVVldGhbRqpaHV3wLeEGZyhrhdSY6LfUAQXfqA8/qlKsPgCnw3h2pJ5iqWWhrnnWpXYGuOIM0iXdbmJw6Y/XNQ9rdo=@vger.kernel.org, AJvYcCWA/QNmu6loI5wpwEGs3pxEUbjgub0tuDI3gRMP4fuRe9c0LKZlPWkowCDC2phJs4A+i3vFDoThg+X+@vger.kernel.org
X-Received: by 2002:a05:690c:97:b0:6ad:deb1:c8e0 with SMTP id
 00721157ae682-6c625861730mr125379867b3.18.1724676594353; Mon, 26 Aug 2024
 05:49:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240821085644.240009-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240821085644.240009-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240821085644.240009-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Aug 2024 14:49:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUyW_8ma++zP8bRLMh120mysSD7206On0euRG7+S-081A@mail.gmail.com>
Message-ID: <CAMuHMdUyW_8ma++zP8bRLMh120mysSD7206On0euRG7+S-081A@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] arm64: dts: renesas: r9a09g057h44-gp-evk: Enable
 OSTM, I2C, and SDHI
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Wed, Aug 21, 2024 at 10:56=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable OSTM0-OSTM7, RIIC{0,1,2,3,6,7,8}, and SDHI1 (available on the SD2
> connector) on the RZ/V2H GP-EVK platform.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> ---
> note, for i2c nodes we are defaulting the clock-frequency and this
> will be updated when slave nodes are enabled.

This causes lots of "'clock-frequency' is a required property" warnings
from "make dtbs".  Moreover, what if I run i2cdetect on any of these
buses? Could it run the bus faster than the board wiring allows?
Hence I think you should add "clock-frequency" properties to all
enabled I2C bus nodes.

The rest LGTM.

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

