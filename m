Return-Path: <linux-renesas-soc+bounces-3840-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B301087E59D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 10:22:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3EF91C203F4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 09:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B00028E39;
	Mon, 18 Mar 2024 09:22:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED81D2C684;
	Mon, 18 Mar 2024 09:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710753760; cv=none; b=G2ngptjul4vL1lNzqZbUBWDCyDoyUzd9kUgbvo7VIQxPDroDmmPV1hp4dCMxOZZkDE3f0A4FbstRzKSci6HoVIu1FCrnn6FeRrqHAMXkEYmtRAVFL2cE9l0W6R5LDzMqhKqK9N+23mqnEVkYQLEYUTI+4M8fjsZJ4YsQAaa4xcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710753760; c=relaxed/simple;
	bh=0npJk+gywEx+1OYHj9zoiN5ftqHPNZfWDVrTKU5LHVc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mZfjOjphMhv+tsV5KPOaaK9KX7DPWkT3D+vem5/qQvGUGvd0XeWMtARNVpFO7Fg8GRIjQGAnlN6x8s3xvv6nAnCBGV73LyRTH8xqPeLBEwg3m58LWz96h4CHw+viT1iT3P9oCIdAcRydVkC5Xs5RVRXvA2cvjaGqMOn9uqwVo70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-60a0579a931so39883177b3.0;
        Mon, 18 Mar 2024 02:22:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710753755; x=1711358555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wF4IVB2FDKwxKiiXTLe1o1QLlIZUQqwHVGeelcNqEgQ=;
        b=ljZ/wOaURIwEr8amhQRflQerncFEyedSQT/x3LjrDs9cwT3DjZ6mVstfmECLbTpRDl
         SjY/E/dmXGN8j9WmPfzuGwu/uPMfQOKsIL+B+zjsctYZymnX1Ca/l3JIwBuwaFdV9M6x
         bW09PkWcFcsTFSwqzYrR6VfchAgJ0/DaIiXi1g3il++iOFZ3zk0SAKdB3keWqvRZZhMz
         Y4DWcXKxqd5k3q10ATufhNQSfF+k4fVg7kRyvfwmqwWpXqhxWa68sByuJCuhDbbQUldn
         V7hRL10j0HKbHp4FioFl23P4Hfoog2S48S3q4/JTRa0yXMUd+uHJS2C4UwOBFwuwtW8l
         yjdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFZWvMVxFQYrntMpfa7Ul/DLDuJsg74N35p1lfEQipje/u4gig0m34OfvlI41tYFiGcgDPJktAQAAkAvQ+9MVMqxI2AjtVXUUWlUAhigIAMfhPJ1Bsc1L7NZr3vKexGPggIBkMNU4KlY2zf3g=
X-Gm-Message-State: AOJu0Yw4wtBcEk1TYDA8wXk28Grson37ym4Z4GGwXdIPEVxSAGWewQnV
	DkYw2Jkor8p0M93vbyE06lLJIwwd+nYFI978IJIlisDlMoKkb85TRc1FQ4btFdU=
X-Google-Smtp-Source: AGHT+IHP9KcvQW6dLg4GLFgaCulJZI0uUGR5500/YLmVsPcpgjsCsWIVNK2+sItOKQNSOVMuI5R97Q==
X-Received: by 2002:a81:9e49:0:b0:60a:6c30:e47e with SMTP id n9-20020a819e49000000b0060a6c30e47emr10214768ywj.17.1710753755554;
        Mon, 18 Mar 2024 02:22:35 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id b12-20020a0dd90c000000b0060a5795fde5sm1875621ywe.98.2024.03.18.02.22.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 02:22:34 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-60a068e26d8so46677977b3.3;
        Mon, 18 Mar 2024 02:22:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVAqfidh2X9eujqrNWzTisooiHeV44YSvyXghJWHoDRCGTzYPRS2lyCHtUPVdahztY3QDQP1Aua0qbnMkeSIzwo5V+gF/s3KKsQHxYsRBml1QAqu/RgE/fa8BwwKf0+twGoaRxwkPPn8kXe6Os=
X-Received: by 2002:a81:918b:0:b0:610:afd6:801f with SMTP id
 i133-20020a81918b000000b00610afd6801fmr4925088ywg.38.1710753754773; Mon, 18
 Mar 2024 02:22:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240315183921.375751-1-biju.das.jz@bp.renesas.com> <20240315183921.375751-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240315183921.375751-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Mar 2024 10:22:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXzSCpPSwHYzJrU7L=Lqftw=d4uV6gHMfDPjWDVH2BPbQ@mail.gmail.com>
Message-ID: <CAMuHMdXzSCpPSwHYzJrU7L=Lqftw=d4uV6gHMfDPjWDVH2BPbQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] usb: renesas_usbhs: Drop has_new_pipe_configs from
 struct renesas_usbhs_driver_param
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Fri, Mar 15, 2024 at 7:39=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Drop has_new_pipe_configs variable from struct renesas_usbhs_driver_param
> and use info for getting device pipe configuration data by renaming
> usbhs_new_pipe[]->usbhs_rcar_pipe[] and changing the static qualifier to
> global so that struct renesas_usbhs_platform_info can be filled by
> respective devices.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3:
>  * New patch

Thanks for your patch!

>  drivers/usb/renesas_usbhs/common.c | 9 ++++-----
>  drivers/usb/renesas_usbhs/common.h | 2 ++
>  drivers/usb/renesas_usbhs/rcar2.c  | 3 ++-
>  drivers/usb/renesas_usbhs/rcar3.c  | 6 ++++--
>  drivers/usb/renesas_usbhs/rza.c    | 3 ++-
>  drivers/usb/renesas_usbhs/rza2.c   | 3 ++-
>  include/linux/usb/renesas_usbhs.h  | 1 -
>  7 files changed, 16 insertions(+), 11 deletions(-)

Do you need this patch, now RZ/V2H can just set .has_new_pipe_configs
to zero?

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

