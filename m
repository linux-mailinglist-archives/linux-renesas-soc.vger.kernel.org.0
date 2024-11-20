Return-Path: <linux-renesas-soc+bounces-10621-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B02179D360E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 09:57:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E30AB247B0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 08:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C166318872D;
	Wed, 20 Nov 2024 08:57:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F01C176AC7;
	Wed, 20 Nov 2024 08:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732093035; cv=none; b=SkJZ55xZgfj7qXg2BzclfcLrUjmSZzOq4IlgV0cvBtBvhgHhB9fqPGzG5m+ozLK2VZWZaRZJ5Xae0FnMUE1Mg5F89vvxm9li4kCVDVkYMC/lI3Ahkt12lrHRhP3F4up+tBRHWHOVzK8+jBQ0vNtmhbefcx9YKsRWpo4Bju4OtYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732093035; c=relaxed/simple;
	bh=B0dDHI/2v9sTO457km8+xaCTu24NvfYHRd2EM73SBKE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hqQ0570LYak3xJmZtnbXaTnmF7wXKqxgYqL18WimH72pbrihv5i+8fS5/iYDCHAFm0h2qXdiFpEYaf4HSGvuX7MV0aDtT/k1a6cue/rpQzs9lO5QXKotrntrbb6E6obZ/3j2qRNhQkcIKzvkwKuQyeyVT3s08QlmIaOrzrExHpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6eb0c2dda3cso19856087b3.1;
        Wed, 20 Nov 2024 00:57:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732093032; x=1732697832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yqejtgreyPze9wekE77oPp4PWzW/3GGPPe0NT9h9J2s=;
        b=gY5fJtH4D6RJOPLyfVAKe8s4r53ImKUNtxCOqaNIkZDneuJKaR/bBwoE7oGkROjOCd
         vHJE94+tmdCdh6lSUzB5XMCbFhEFcebm0/fqhQ2k5WaIVBYvk/ksUAnq1sQtpWjB7KEP
         PjiIPYVf1EsmR3yJYBhLl/exS/woNhcKphzgXb4gtPlZRGhkdBoEFH8BY6vzmCYlNuMB
         vvU6r2ruas/l7RChmHfJwChYHUDW33cjQYFrChlAmIgcKwiStrCQ+o1TictLDD5gbBkk
         UZP73A92JEvnvcdiY8Ce5x1/zFyybl4p2d67EHxq7jI4igFJxrxT4973Y8uWcWkk2cFv
         zYvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMUNZz/Ly8ASxEfOtZabpMV9MYxm7X8mqPawWdKevu9TYD1EMtZCjibOR6kiDPScW/x2JubezIVVF/dFM=@vger.kernel.org, AJvYcCW2WxxqzX+oeVzSeibzs5cCYEIi/3pWKEaR1Batv6zuaCQEDHHf5Y2YOlQR3virivNG6p2Nr/F0AMtIpj7GrqRVzog=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx7CeN4UDf1RLpz1ov66NCVUJUnAwL7RKe3kSewyKsSxVmYwQc
	AGkExjYMg5nLixNPZdMeMFggw09QOzrHtfmqk0CZX979KCZ710A1aycwJIx0
X-Google-Smtp-Source: AGHT+IEF/Zz9sPYJ5pq6Xtg2dMy9vZpCVkt0KStzHwI7nNqeTb+C0h94Xal1vSApRI8ir9uRepTB6A==
X-Received: by 2002:a05:690c:9987:b0:6ea:87dc:49b1 with SMTP id 00721157ae682-6eebd0f4f42mr21468077b3.10.1732093032000;
        Wed, 20 Nov 2024 00:57:12 -0800 (PST)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ee712cbf46sm21267097b3.67.2024.11.20.00.57.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 00:57:11 -0800 (PST)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6ee805c96dbso20481837b3.2;
        Wed, 20 Nov 2024 00:57:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVSEU/DmKGPdVDjl3vTYxeUjAIG6kGi77yaI7rkK6umOI9at196+GDf7FiT53V63OPkBcXDkHKVS5EcHGAyaYFkWWE=@vger.kernel.org, AJvYcCXp7AHgSkwwQL5wPR9bZYxFreoTDwdWOQPnH4mJZxgnDCqZe2exNeVCGC9WtnEeEMdIUZg+w6Ug6LtgtrQ=@vger.kernel.org
X-Received: by 2002:a05:690c:620f:b0:6ea:90b6:ab49 with SMTP id
 00721157ae682-6eebd0d4c0emr19457607b3.5.1732093031323; Wed, 20 Nov 2024
 00:57:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241108160717.9547-1-00107082@163.com> <4ce18851-6e9f-bbe-8319-cc5e69fb45c@linux-m68k.org>
 <87ed36zon8.ffs@tglx>
In-Reply-To: <87ed36zon8.ffs@tglx>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 Nov 2024 09:56:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVrHy58pGft0tsFF2Npy4=rE-JCeEEDqVHMDabyVLXhPQ@mail.gmail.com>
Message-ID: <CAMuHMdVrHy58pGft0tsFF2Npy4=rE-JCeEEDqVHMDabyVLXhPQ@mail.gmail.com>
Subject: Re: [PATCH 01/13] kernel/irq/proc: use seq_put_decimal_ull_width()
 for decimal values
To: Thomas Gleixner <tglx@linutronix.de>
Cc: David Wang <00107082@163.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Wed, Nov 20, 2024 at 2:21=E2=80=AFAM Thomas Gleixner <tglx@linutronix.de=
> wrote:
> On Tue, Nov 19 2024 at 20:55, Geert Uytterhoeven wrote:
> > E.g. on Koelsch (R-Car M-W), the output changes from:
> >
> >              CPU0       CPU1
> >       27:       1871       2017 GIC-0  27 Level     arch_timer
> >       29:        646          0 GIC-0 205 Level     e60b0000.i2c
> >       30:          0          0 GIC-0 174 Level     ffca0000.timer
> >       31:          0          0 GIC-0  36 Level     e6050000.gpio
> >       32:          0          0 GIC-0  37 Level     e6051000.gpio
> >       [...]
> >
> > to
> >
> >              CPU0       CPU1
> >       27:       1966       1900GIC-0  27 Level     arch_timer
> >       29:        580          0GIC-0 205 Level     e60b0000.i2c
> >       30:          0          0GIC-0 174 Level     ffca0000.timer
> >       31:          0          0GIC-0  36 Level     e6050000.gpio
> >       32:          0          0GIC-0  37 Level     e6051000.gpio
> >       [...]
> >
> > making the output hard to read, and probably breaking scripts that pars=
e
> > its contents.
> >
> > Reverting the commit fixes the issue for me.
>
> Interestingly enough the generic version and quite some of the chip
> specific print functions have a leading space, but GIC does not.
>
> The below should restore the original state.

> --- a/kernel/irq/proc.c
> +++ b/kernel/irq/proc.c
> @@ -501,6 +501,7 @@ int show_interrupts(struct seq_file *p, void *v)
>
>                 seq_put_decimal_ull_width(p, " ", cnt, 10);
>         }
> +       seq_putc(p, ' ');
>
>         raw_spin_lock_irqsave(&desc->lock, flags);
>         if (desc->irq_data.chip) {

Thanks, that does the trick!
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

