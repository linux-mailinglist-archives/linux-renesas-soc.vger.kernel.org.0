Return-Path: <linux-renesas-soc+bounces-22055-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 77885B88245
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Sep 2025 09:21:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BDB0174F4B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Sep 2025 07:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 505CB2BE63D;
	Fri, 19 Sep 2025 07:21:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF5D29D264
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Sep 2025 07:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758266475; cv=none; b=oZDUax84Up1xguRUsNNO2oI2JnMnRURvAqqc6p/d522Se+dcaZW1ECktagC2MtgUh3IevRTBYQXrWDgeAVBkwxBOjwpx4gAOc0x4Iv9tbRevI24r9IpahwGngpumr9IM61cgOSjca2luulV7k6fcAGZh3n0IWK9FXpCgaLbsXDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758266475; c=relaxed/simple;
	bh=Q+yeL72eS/EFDh4aFYPzpqwZ4gkMGeQeQ3gNYps+5s4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iOx1zySJxIV2TMZfcbu7ggEUsa57j5YRa8CTrQ3PLS3duWm5Xe8Tda0QmNezG7b2t96T8QmHeQi2k5gkgOaxL6T42KD4lZeAw7JWcEVyjqbuSEMUitE/vXDzg9q1tK1sF22hKoTCNxLfsQGa2BjFGjr+4OB8YbhAA5kLt/y3cNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-559cd5166bbso368382137.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Sep 2025 00:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758266472; x=1758871272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wy84fRvImGlGf/x5eRlETn8EsRWO9FKk3GgLBbxuALM=;
        b=XHgLENaKOwx99nskE0DFczcb34oOvJt2m5LC+o/07tQW1crcGeReVnGUx31iN1pWA7
         1syiRkPGJXCiR00LBa6q0w1x33GUusfhAJigJjuPTqNDFUKd0IpE5QUSi0UJLRJD1PJ0
         /kO+SsDgAMSf6LQX5mPvcP3WShgtdIMAtEBn7Dh3UwJqpRvXAngCuvySSyjt3Q58lhPT
         w4Hh5YlfBlbKHjDHwHpcVMZhfW16QYjMjsVC8hgq62NKMBfLOpdKFMaPDLyK86IQjZjM
         W6fGZyy1RYMeCc7kyziLyLUg0qAwdjun+1RCMegLUltWdJUKSBLyi0XAOm+dvCXXTKxJ
         TdpQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5ZxLK1Cuiu+/PzEfxpSsyODcUZx+jGwOCuNn7g9LQ9+1LmlxH6X9q3YYHTgxMeDSJ3KPYNnzx2ciVIKSK8Ic20Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsx3VlAAmlloFFDWqxsix9WsnfTw3HUlktsEl5fY98Ov7vF6dh
	nS+AbkMNx9RgeWbPP2dZbI5OEfkRHTJGbVAtX4junc54y/0UfkydzQgO/mK6Boxi
X-Gm-Gg: ASbGnctLaJA7/ypuXy+scdlKYu4X+Kj8s2QhUHIiLxEPjwD6+JUYiapdxvar1MzhQOo
	kZbD8a+46PqR9KdL0gV0Pu6SdoMWgCbDOvV/1YPVsA2fHXmq5wzjyOnvzQz+3PZZf2gQEUJgUF7
	ntTR2KC012snUstiC0o/eotSyjIfQHnI9mSTjsVXs94eY12mLTUuQOHdnsYS0it1fA7kmWX8ZiG
	DzZpd3YjgD7yUeU8O4UK+I4+Qifk16LQcyuB6RLVpSQfD93BPf10vZKIDiZsTuSI7FIAiTwAS0h
	zvXTpv3HFtlC8uDK4yShT9qrrhwuvnFEeLssknaJCRkEJzbpTlPlZyfsYNgTqVIFbbZFJoEUojF
	hZ37iD6aFuO6e2ZggVP+yokz1MFk99JyeHUw+Zhs5M98kOUTP4YMfcH8i2q8xbpiwCTJ1S34=
X-Google-Smtp-Source: AGHT+IEKfNuOp+/XBJK5Anyvm0PkH8naRUJaXgaJhZdJgQqazHMzdl5QxJmAHhzH8bwHOWoneubNeQ==
X-Received: by 2002:a05:6102:f8a:b0:569:93c9:b572 with SMTP id ada2fe7eead31-588d78d4f57mr724600137.9.1758266472232;
        Fri, 19 Sep 2025 00:21:12 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8e3e75254casm722003241.11.2025.09.19.00.21.11
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 00:21:11 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-89018ea5625so533512241.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Sep 2025 00:21:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUwPXLkdXXvl5NeK5dJyJURxofYOo0VLEJqGlqkKQddehx2wsx9YHAvlTK/qcvZRy1BEr1yesvZX2ldeZve3+Itpg==@vger.kernel.org
X-Received: by 2002:a05:6102:c0b:b0:57d:9305:63db with SMTP id
 ada2fe7eead31-588dada3a4fmr641660137.15.1758266471269; Fri, 19 Sep 2025
 00:21:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918030723.331634-1-marek.vasut+renesas@mailbox.org>
 <CA+V-a8sjPx8U+MB3v-SxErRPqbz4irAgZhCvd5CHY=6uO_VoyQ@mail.gmail.com>
 <353db156-e518-49c8-96ac-bd138ee64a01@mailbox.org> <CA+V-a8sLxBq8vSuq2HxcchpLqyQxqTRtkWjUKsRN9tBqGhU7mw@mail.gmail.com>
In-Reply-To: <CA+V-a8sLxBq8vSuq2HxcchpLqyQxqTRtkWjUKsRN9tBqGhU7mw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Sep 2025 09:21:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXN2=0KRhBy-pW_ah7mL6iU+8O9pGD20dhSxk4-5R5ckg@mail.gmail.com>
X-Gm-Features: AS18NWCwEfI5KFrh0NIrqWXYQYE3E0Y3sbKZZ_oamCae3icZUAjis03HzRmeCBs
Message-ID: <CAMuHMdXN2=0KRhBy-pW_ah7mL6iU+8O9pGD20dhSxk4-5R5ckg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Read back reset registers to
 assure values latched
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Marek Vasut <marek.vasut@mailbox.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Thu, 18 Sept 2025 at 17:05, Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Thu, Sep 18, 2025 at 2:42=E2=80=AFPM Marek Vasut <marek.vasut@mailbox.=
org> wrote:
> > On 9/18/25 1:11 PM, Lad, Prabhakar wrote:
> > >> diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/re=
nesas/renesas-cpg-mssr.c
> > >> index 65dfaceea71f..7b52e8235984 100644
> > >> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> > >> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> > >> @@ -688,6 +688,7 @@ static int cpg_mssr_reset(struct reset_controlle=
r_dev *rcdev,
> > >>
> > >>          /* Reset module */
> > >>          writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
> > >> +       readl(priv->pub.base0 + priv->reset_regs[reg]);
> > > Fyi on the RZ/T2H and RZ/N2H SoCs which uses the same driver we need
> > > to read the reset register `7` times and confirm [0] (as mentioned in
> > > the HW manual). So after reading do we want to confirm the bit is
> > > set/clear?
> > This is interesting, I wonder if the readback is something more common
> > to this reset controller.
> >
> > Why 7 times ? Is this documented in one of the HW manuals ? Are those
> > public and can you share a link to them , with the specific chapter or
> > page I should read about this 7 times read requirement ?
> >
> Yes this is documented in the HW manual [0] section 6.5.1 Notes on
> Module Reset Control Register Operation:
>
> 1. To secure processing after release from a module reset, dummy read
> the same register at least seven times except RTC
> and LCDC after writing to initiate release from the module reset, and
> only then proceed with the subsequent processing.
> For RTC, dummy read the same register at least 300 times and for LCDC,
> at least 100 times.

Ugh, the number of times depends on the module to reset :-(
Do we need #reset-cells =3D <2> to encode the number?

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

