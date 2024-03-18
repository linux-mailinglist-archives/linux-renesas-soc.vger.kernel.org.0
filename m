Return-Path: <linux-renesas-soc+bounces-3839-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2FA87E57C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 10:15:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C48BD282B2A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 09:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05BB128DD7;
	Mon, 18 Mar 2024 09:15:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F09D288D7;
	Mon, 18 Mar 2024 09:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710753313; cv=none; b=IAp+zV4QzeMMywobQ0Ez7j9l0eAc6RYPjccqyUy4P7alNNcufTanfUc4AtRcjGfp/vW8yt5h/b1hXDHPdy9JyddsJT5yW7sc/4+kW7Ar9JJG+DQ+zg/0EXPL26rLiOzJmiw+VQ8p+8F3SVsygZ1jbS5uTxJgNTrxPw9Npp2YxG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710753313; c=relaxed/simple;
	bh=ZrqiLCzlaYnOqkDnAV97vjaitJds6HyOAnrjDawVko4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HJMKoX8e5I+yVyPU0kGTMsfx+oVyb1BDibFGTG3/W4xHoehwiJ4Mg0WWU4gauq+qrAQ9nBi554QPTUem6d75K6GzM2+rQNt2WXlgpZO5SbrsPcJCJhRZqoXHpG0962az3nhpgtxLLmgrfUdROmSVM61BWNBYqPeq3WucSdyXuAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-60a15449303so39788407b3.0;
        Mon, 18 Mar 2024 02:15:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710753310; x=1711358110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ny28AcEyyIOSwlsOgRzGEP74cd3uygxkMf5Vwv/TISo=;
        b=WgHCTPilpsFdRqfg9qQ9eC0xNSCxKRayeNbU5zDzVVn7aeir7kfFV1Y5ckmi0X00CI
         VqoB4hhQ267dc4jDXF83zZ9qA3jhRQEn+GiL7EPZ59teSRzV93Cbq7Qry7qNzkBrC3hr
         gMxuSI2rREplpMBtRJD7PXGC6NBcMgmaA9JtOBh9fm1jT/YGeyyEQyITacz18M88CB/K
         fB4j4VVq/BfDJ08UNJrzCVlPtJ6UN1AfGRYD0cGKfK1XEPAntWXXohXVfVqjmSfALrfn
         BUQGCzWNunUe/IzSakML/HGMB7uy96FhQq2HayrOScuSv6HbDkTfviOP1TDtMvGXC7Mp
         k3Mg==
X-Forwarded-Encrypted: i=1; AJvYcCX7SKEaUZGyPmw9XRBK5g+SbHer5pZPlM5KDTkW/gemvwYvoPzgZi+y+5yXxQVv9HMZQ9V6r2PahoNGlYmaP+maWFSPvOpNReCayUyMONNzTgbm9aPMuyU9Vs51OU39RfR266QquwtgGlraGA0=
X-Gm-Message-State: AOJu0YyMCqCyGHBfL3J/xboy8PGzR755ZCbwxXRtUrSPszFuWRl2PShX
	2cFgB27SCF9v2vF3kxPerP3exgYu/IZVi6GMYqBGgwYaaQd/5S9GWqBTFi3g9uM=
X-Google-Smtp-Source: AGHT+IGtVcd1R0dXgdqnpAKNoVSMJaPPbSei1iavuGqXY5ZleGRcWA9BScvCULQlk2vRK0T729M1PA==
X-Received: by 2002:a0d:f901:0:b0:60f:d70b:c1f9 with SMTP id j1-20020a0df901000000b0060fd70bc1f9mr5530005ywf.24.1710753309741;
        Mon, 18 Mar 2024 02:15:09 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id gz8-20020a05690c470800b0060a2fec128fsm1819823ywb.24.2024.03.18.02.15.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 02:15:09 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-60fff981e2aso18946647b3.3;
        Mon, 18 Mar 2024 02:15:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVw+Tt+olVICzmJclJAf0Fa6wFkUbr9h9ainE8PleNt2/wzNY//cZ0ABnrZYFm4vC9crNR1r9IL7Tw7txWhTt5LgXyCZ0RLOpdXU1ElCRmKqrtsN2QGUXBUr0+o1dtShI+LhlLau94pupQe4v0=
X-Received: by 2002:a81:a150:0:b0:609:f24d:d88a with SMTP id
 y77-20020a81a150000000b00609f24dd88amr9487601ywg.8.1710753309124; Mon, 18 Mar
 2024 02:15:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240315183921.375751-1-biju.das.jz@bp.renesas.com> <20240315183921.375751-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240315183921.375751-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Mar 2024 10:14:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUBawyUD-m+36iqV_oeLgWJi0QZdhJUZs1_NEUxGF2OXQ@mail.gmail.com>
Message-ID: <CAMuHMdUBawyUD-m+36iqV_oeLgWJi0QZdhJUZs1_NEUxGF2OXQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] usb: renesas_usbhs: Improve usbhsc_default_pipe[]
 for isochronous transfers
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
> As per the hardware manual, double buffer setting results in fewer
> interrupts for high-speed data transfers. Improve usbhsc_default_pipe[]
> for isochronous transfers by updating the table from single->double
> buffering and update the pipe number accordingly.
>
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3:
>  * New patch

LGTM, so
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

