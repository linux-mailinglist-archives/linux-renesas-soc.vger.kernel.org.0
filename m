Return-Path: <linux-renesas-soc+bounces-10372-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E11E79BF611
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2024 20:07:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F28F1C21C0C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2024 19:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A0BF2076DB;
	Wed,  6 Nov 2024 19:07:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F46C20607C;
	Wed,  6 Nov 2024 19:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730920022; cv=none; b=f5zu21tp48gh8KmOp389p7RGNXCr+lzboVEUXb1uE1K0H+DvhhizOuSIVFvUWnf/dY7CRbltmUYjRZ1F+3nKli5y/5L59PHFKqA12unXhQ7uoih+Zipe/rlQrax9l0r4kexnYNr/wwNCr7x956OHnwci7SY/0+qUZN+TpL/6QNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730920022; c=relaxed/simple;
	bh=SOvFmyhUwT3CpaRLxO/rqdt+udzR2qrH+lXIuEhlosk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jbi1lHrOXAaGfCgftJpJm0blcvF9B3FLmnVxaHihMQGMAN1JwdjOFr62I53DjDAF5DrNFelodoD4ZTggN2KxZfN01ABPS8rEVHfiC/fhG3uS2LHBN8SJ7FUlZCLdjfWQYzz1OBaYAkaDSqojPIJZF3eLQTHFkQAzSL5Amq75pnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5ebc9bda8c8so78828eaf.0;
        Wed, 06 Nov 2024 11:07:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730920018; x=1731524818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ZfJuo7pugYHJJaS8IJNytNUoBp8GBDpjZKB6B7LHdk=;
        b=nZE/KSC51WmpvS1VpsHwhb4b/RhLW0tc1M1oNWRC8SvZS1wT4KolhG44lFG/R0FANM
         t5o+21LCMxvqSxDtfuPeWfwxZtyH2lZo2ykiyqLvOSdRIZqnsSnqfxt2X9Z48LQhuRSX
         mopr2CiRXbYqBC4FJr6mdETsTZItI0wOXVjRGDeUJtxbD8lLxrykABH3pJPqq8p4Ruqc
         HqPhpHG0Zhq06driSP9ij+BEMIR2obtrBwhMFSLyD9tyrVcRIDL97TAWPc4vxbx/FUCf
         c3Svc1HpK1KwXBcTTpkzXXHfCpX6T0Hf2vAHo3nm92dy1UbnW1lky/wVaqkVXV0B8hI8
         ajEA==
X-Forwarded-Encrypted: i=1; AJvYcCUZ+Bw8H4OdbyFT8kyPFrzqwdIVNjY/MamXm3pGdRAQqikqqUOzSclWNHpCYD/o2WIKVQTqNWOwEAkCB7ibn5WfFfo=@vger.kernel.org, AJvYcCWHRrh5SffVSjh2E7oPwGCX2HvkcdPzestH4vphtLK1VwsO6RySalx5fDV+1RRG8p16bvSVPLyO@vger.kernel.org, AJvYcCXnOTO7jmtooda4KnV1NT2svI1xT1Y49/p66L/ITe1jBfS4bJWDbEVgXPLveM3HA6N8tUFe/Y572yuc@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3/J1LKeS3B4PAfvC4heR16UE7Faut0+8C7LfutSGlLJFnmU8y
	QSjJXbMBp0icP8Nj3kqCvQO3hOkzemScD1XKC24LFknEVzxTLtXIHZkeLDWm
X-Google-Smtp-Source: AGHT+IHOEKCdklXPOl9FK7PNCQOwBwNPkJRFUa4nk8dyhp2q68r95bIX0/1hMezbxb68roOqu09ZvA==
X-Received: by 2002:a05:6820:54c:b0:5eb:6a67:6255 with SMTP id 006d021491bc7-5ede6317636mr14450108eaf.1.1730920017834;
        Wed, 06 Nov 2024 11:06:57 -0800 (PST)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com. [209.85.167.179])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5ec704e4af4sm2766469eaf.16.2024.11.06.11.06.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 11:06:55 -0800 (PST)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3e6075cba82so143020b6e.0;
        Wed, 06 Nov 2024 11:06:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVMsgfsaaHQS+dTd+GZsPhSQwW81VFHMAMCMXDk/bfC8+zIA762c1hVOI9B40QpyVbvW1Utq6Y8NkMr@vger.kernel.org, AJvYcCWtKW3L0Qd+Q9Q9akWIIpNX4mfKqwpoLgb+jubjJOVWlvzNxztHboqhtS8cmD9gb3/uo9JqITB9@vger.kernel.org, AJvYcCWwrzaxrWC+UNO1xyH3Y6ZOzuOKB2tNPG04vwR599UWx/MkRJxj+Y+fW//2Z8Ff6V93QO53HgSyzuLS5GBTdofJRhs=@vger.kernel.org
X-Received: by 2002:a05:6808:130a:b0:3e3:a99a:433f with SMTP id
 5614622812f47-3e758c5a52bmr17620319b6e.13.1730920015121; Wed, 06 Nov 2024
 11:06:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241106184935.294513-1-biju.das.jz@bp.renesas.com> <20241106184935.294513-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241106184935.294513-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Nov 2024 20:06:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWwf4iqUsOA+XajoAcN081GG95muA3m_ZxRp-BemSmajQ@mail.gmail.com>
Message-ID: <CAMuHMdWwf4iqUsOA+XajoAcN081GG95muA3m_ZxRp-BemSmajQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: display: adi,adv7533: Drop single
 lane support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Wed, Nov 6, 2024 at 7:49=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
> As per [1], ADV7535/7533 support only 2-, 3-, or 4-lane. Drop
> unsupported 1-lane from bindings.
>
> [1]
> https://www.analog.com/media/en/technical-documentation/data-sheets/ADV75=
35.pdf

The above is for ADV7535. Fortunately
https://www.analog.com/media/en/technical-documentation/data-sheets/ADV7533=
.pdf
agrees ;-)

> Fixes: 1e4d58cd7f88 ("drm/bridge: adv7533: Create a MIPI DSI device")
> Cc: stable@vger.kernel.org
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

With the description updated:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

