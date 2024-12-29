Return-Path: <linux-renesas-soc+bounces-11743-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 372789FDEA8
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Dec 2024 11:50:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12D6C1881B3E
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Dec 2024 10:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BE7178F54;
	Sun, 29 Dec 2024 10:50:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27A68494;
	Sun, 29 Dec 2024 10:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735469413; cv=none; b=Sf7USAT4vopTIGVxVCVim5n82e6fkKcmNaTtmldXcjZK+amCiQKOi/kKdN1cHjA298ERd7vamF/iEairX1sc8HpWVv7YMmEYAB0N+dvq0wRSGVcrHPUWmL9IFPU0Mr/uz8iEmVXeipRMDn/Ipsq75g0daIiPPKQqU1KYebFANDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735469413; c=relaxed/simple;
	bh=8v45KXURV/Dkdk8ZqMObUmREPJLqV0h/+eCcDXZBQyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CT4Xx0VQN0Fo0VTmjvUnabnLEW9FXnxvR1ienqsMHgUI4CXbvNe/jgAq+Vv2iYtBIS+V3QTaH9cPy0yJgfUv2a6cazD5LhzS4LspCMiB/AzAQBnxe18ZozwV5khbWzIxzhL5WFjLFHylziKpgun5SaT70ESVhGOkHDIYVRx9+5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4afd68271b6so1945042137.0;
        Sun, 29 Dec 2024 02:50:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735469408; x=1736074208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZ0pwHb7t8cFMA4VKZuPNOPFB/kxFNmjFIAMXrbg0mk=;
        b=njEpPqVEOx/sTBI68lDv2ilgkP+NWTwoMSlPzom0wET36a64As1F3OCzVW8lPJV7Au
         DqxtgGT3iBWIy+eIVuQKEXoR/TZlccddMI0SwU1V1mmK28VZnsaenpP1A7UVUM3CxKK2
         aUY9GZrLKeWLfqfeLHWen6dbXWu3BfFAD6EH8Dx1I+S4e6UIGK5ajPYC0PE45m0aNx6Z
         J7gr8Uim1z1KDz/cOCIFucRdJSmeQDU27ExRORKlF84WPToArb2IkVrFMncRDFO1qEoW
         12N00mSBBmJcY5lcKiro11GLbfUa/XvQaSkCldujw6Q7csRffZNA7+Dv859532fdL1FQ
         8l4w==
X-Forwarded-Encrypted: i=1; AJvYcCW6hWZLno5/eUmcXgG/9Mf0qcuRGf5/jAGfNtFxXw8nc2skVN6pukjlhn68b/iFKwh/3JthDIoaMcXCnWM=@vger.kernel.org, AJvYcCWWZe8LiRVTHAaZQ2Xhc5EbC9eISjpoho/q/3yqbUExq0QrNR9J65sGqUetk3P1rWxzmDtpRYdijTeLRKbHSDl0Kzg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1s4cGuvOnOMcrhgZnWkYsRzxV49lDHveRQZxsn5JKJaU5u7iq
	aVD9frEkwAfK34F9G1f0eq4l4lGPfcWffeCn08GMd/vzLRcIusEVBr/i04/y
X-Gm-Gg: ASbGnctVqMUZuH6nHhHIuJameOr+1m/UHi+eYdD8teP55OkksUVz5Aa/YAmDBQgU6C0
	xofFvRgRbMOI2DpBec7ahntpacGq9yamRxxrunZprhb4mmTSBleu4l6We/i8t0l5qfY+HqIRj6p
	2NZjGZXIArMK9VKmxAAn+/PUk6Qq2Wf82jkX5+MeAtC2xz/oRPf3uBZFaOLyMOrA1bxrzHRzJoT
	3v/wiQx24Ya5MH5HYSnJp1yJEv8qdSWTXu2Eg+U6LPBEzk6wtqiPhTs6GD6wCRRvj5v0I1uMky6
	gB89N25ep050+ugJft0=
X-Google-Smtp-Source: AGHT+IEUcz/O4PV4QjPA02IGh07JhyDRmMSxmHbMtcs9sQ3ndVXU1AjMPssgK3qJA+06h3oiwLe7fA==
X-Received: by 2002:a05:6102:4422:b0:4b2:ad82:1318 with SMTP id ada2fe7eead31-4b2cc48d1bcmr28615383137.26.1735469408625;
        Sun, 29 Dec 2024 02:50:08 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bf9aed62sm3616611137.12.2024.12.29.02.50.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Dec 2024 02:50:08 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4b11a110e4eso2371449137.1;
        Sun, 29 Dec 2024 02:50:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU+xZX45x/sEN3sdr5SNj7m3MasrUFfQC4ptZc799CWJVXdl/7knroP99Uf4XPzLgGflGLljrA/LPE9Xd+jDSTHJrk=@vger.kernel.org, AJvYcCVK0jMJWD1z+Jgbt6PCrCFeTn16x2d298gb1xBktj3rRLqPAuE1WeMQvbFa1W6w1K02iytSAzH52J2sz+8=@vger.kernel.org
X-Received: by 2002:a05:6102:41a5:b0:4af:fa1b:d8f9 with SMTP id
 ada2fe7eead31-4b2cc35dd44mr27262082137.7.1735469407868; Sun, 29 Dec 2024
 02:50:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com> <20241229101234.2896-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20241229101234.2896-6-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 29 Dec 2024 11:49:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWSQvyLwHyci+WVtTj4rGeR-hkjw1ap52=5X29ZzVchSA@mail.gmail.com>
Message-ID: <CAMuHMdWSQvyLwHyci+WVtTj4rGeR-hkjw1ap52=5X29ZzVchSA@mail.gmail.com>
Subject: Re: [PATCH RFT v2 5/5] i3c: cdns: use get_parity8 helper instead of
 open coding it
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, =?UTF-8?Q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Sun, Dec 29, 2024 at 11:13=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The kernel has now a generic helper for getting parity with easier to
> understand semantics. Make use of it.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/drivers/i3c/master/i3c-master-cdns.c
> +++ b/drivers/i3c/master/i3c-master-cdns.c
> @@ -889,8 +889,7 @@ static u32 prepare_rr0_dev_address(u32 addr)
>         ret |=3D (addr & GENMASK(9, 7)) << 6;
>
>         /* RR0[0] =3D ~XOR(addr[6:0]) */
> -       if (!(hweight8(addr & 0x7f) & 1))
> -               ret |=3D 1;
> +       ret |=3D parity8(addr & 0x7f) ? 0 : BIT(0);

Perhaps keep the if()-construct, to better match the example in the
documentation in 1/5?

>
>         return ret;
>  }

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

