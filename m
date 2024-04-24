Return-Path: <linux-renesas-soc+bounces-4869-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 912878B06B9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Apr 2024 11:58:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EB981F244B0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Apr 2024 09:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B80A1591F7;
	Wed, 24 Apr 2024 09:57:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD55B158DAE
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Apr 2024 09:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713952641; cv=none; b=laSXz0w8pTEwtEeBG50edufEJlfWGeyZxTtfaBSG5fKabzM4CWzkdLqifuSirLSve7UkmgB5P5CyuEVLC4d/ZsoPTDRwYxCuD+VHvVEFgi1pXH8fyVJ5ByMbeVTOTFp8a7qnJ1WjgR8tqGmhVuUjkuMWlUQN5aaFHtrs+jf5UgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713952641; c=relaxed/simple;
	bh=xBoMnS/U24Xmk+b98yC9/zx3BSPWnx/BrNAsIXF14Jk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EJJi7e1OZLTvUUJPha+jxDeZrEtmLgXjwOUPBeusJnjtelN27OT969hy8/IqQxmqAjIfIa47hEaLjn4+fCWyu66d/6tVA+TKIMiJgie4SQUK3cl4TSvA7sqwc3KS8Zdp58MDeVyeic+4EVFJm71OAPX8qh2WgP9jdjCABqlr9ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6164d7a02d2so77134557b3.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Apr 2024 02:57:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713952638; x=1714557438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KQU26/ov+2ttmtKzftOZXP11jQDNo9zi+sDhRhwQgfA=;
        b=LPDGLS+lnUlMcwL9UnYnXNrjd5WykOAb2usV7hxYm/YzFmFw2uRndpp9qSRLJ2ITBQ
         8ICamgkX0CfFbgtoxrd0nuU+z4KUvnPWvMiH9NQNGiYQW7HkA9t+J5potR8Tglx39cfG
         iUfn7hGGcPo5GKaFCGNRibdXi1N1+vipenrGX26NzFBKH38AemaZS8RXSL66irlHLxfR
         lkxv5/3qufKFixHHRgQ1GMOWZw44ByVvOBZ0aqGTPBaXxC4mx/i1+c5XHMDtsBD3J7b0
         rjhEQE1z+sT/HuzuAGCbFePYHYD2ftb7OA6g9ueceCvqdYtDG/w94+2sHIVpEMwdqRCl
         gjZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXLEATmgPdf/AsVgHQDMmUigU78OGw1ecY6nv8ksrTH2ubHELly7q1cMGqrWAtbK9OnDoi85iwQgWRlXoeH5YNzQ9sdD8Y/6TUMmTpdFhOLm8=
X-Gm-Message-State: AOJu0YxtHfF2dx90GtZfNjFC/mMV/lSTvx7Rk4dS0fO8Kbw82qMieFp9
	o9Mg+eMqGjVHhhXRRZhq4S70ZufoWZFQBIz0JU8A3omqPwNxlTuO6n7Pic0M
X-Google-Smtp-Source: AGHT+IEnas8oZpOGIIapHuebudacqgTUgQXrlNkeRUqTojTteGQZD8wKCVD90iCSsIN9M5Gs3fGOOQ==
X-Received: by 2002:a05:6902:566:b0:dc7:43aa:5c0b with SMTP id a6-20020a056902056600b00dc743aa5c0bmr1998630ybt.21.1713952637732;
        Wed, 24 Apr 2024 02:57:17 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id v69-20020a25c548000000b00dcf27be1d1bsm3103342ybe.28.2024.04.24.02.57.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 02:57:17 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-617ddc988f5so69831557b3.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Apr 2024 02:57:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUM0PDITFMnhTEg+aCAheQjxpmRshrCV0CLmFShvFP/H5+0/e2M0GNxJCjNH8nRFQ60FI3CIkGfh5S3ToXFxSa+SCu68Wvjgx7IiEwrSzxcqys=
X-Received: by 2002:a25:c1c4:0:b0:dbd:1dfd:8b8 with SMTP id
 r187-20020a25c1c4000000b00dbd1dfd08b8mr2152897ybf.24.1713952636969; Wed, 24
 Apr 2024 02:57:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ee6c9e16-9f29-450e-81da-4a8dceaa8fc7@de.bosch.com> <6fcp525uab7fggrkoftpz5bjrvvpza735wnp5djzuab3hk5zte@vgk43d4ijbww>
In-Reply-To: <6fcp525uab7fggrkoftpz5bjrvvpza735wnp5djzuab3hk5zte@vgk43d4ijbww>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Apr 2024 11:57:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVH9LnDHtfhCYNKPPUTSp1rRG_fX70zxsF1qWUiZrPs=Q@mail.gmail.com>
Message-ID: <CAMuHMdVH9LnDHtfhCYNKPPUTSp1rRG_fX70zxsF1qWUiZrPs=Q@mail.gmail.com>
Subject: Re: tty: serial: sh-sci: hrtimer not properly canceled on chan_rx invalidation?
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Tue, Apr 16, 2024 at 1:49=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > Analyzing this we found that in sci_dma_rx_timer_fn() s->chan_rx is NUL=
L.
>
> Again, good catch. Thank you! Here is the outcome of my first debugging
> session...
>
> > Is there any chance that there is a race condition where the timer func=
tion
> > sci_dma_rx_timer_fn() is called while s->chan_rx is invalidated, alread=
y.
> > E.g. via sci_dma_rx_chan_invalidate()/sci_dma_rx_release()? Or anything
> > else?
>
> Only 'sci_dma_rx_chan_invalidate' clears s->chan_rx. I think these paths
> involving 'sci_dma_rx_chan_invalidate' are OK:
>
> sci_dma_rx_chan_invalidate <- sci_dma_rx_release <- sci_free_dma ...
>
> A) <- sci_startup (no issue because interrupts could not be requested
>                    and RX DMA is started in an interrupt)
>
> B) <- sci_shutdown (no issue because 'hrtimer_cancel' has been called
>                     before freeing DMA)
>
> This path also seems ok:
>
> sci_dma_rx_chan_invalidate <- sci_dma_rx_submit (error path)
>   <- sci_rx_interrupt (no issue because timer is started after
>                        'sci_dma_rx_submit')
>
> This path looks problematic:
>
> sci_dma_rx_chan_invalidate <- sci_dma_rx_complete (error path)
>
> The timer is started before DMA is set up. In the unlikely event of the
> DMA setup failing, s->chan_rx will be cleared while the timer has
> already been started. This is in deed a very rare condition.

Or when the previous (still running) timer expires...

> The problem is that I cannot trigger the code patch so far. It is easy
> to force 'sci_dma_rx_complete' to bail out but, so far, I couldn't get
> it called.

Note that DMA is disabled for the serial console, cfr. the check for
uart_console() in sci_request_dma().  For testing, you can just remove
that check.

Also, plain text typing (on the serial console, or on a getty running
on a secondary port) does not trigger a DMA RX transfer.  Pasting
a block of text larger than the FIFO size to the terminal should
trigger DMA RX.

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

