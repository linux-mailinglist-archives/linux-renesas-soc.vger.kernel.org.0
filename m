Return-Path: <linux-renesas-soc+bounces-22708-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E60BBE45F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Oct 2025 16:04:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 708371894FD7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Oct 2025 14:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 175C83770B;
	Mon,  6 Oct 2025 14:04:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FAF1D5178
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Oct 2025 14:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759759445; cv=none; b=h/CfEfHfp4L7mNLBKcv5Fb8Z6fIjX4YrDamimhZzcW11yFovluPq7pdzFCmNOa3fRAmCONXxnvfdXO8KV3FadEhm9ydSFnqGiuKVM7UDJrlVchk9o2dgS3dWji++4GhNrr78bo+KsHA8vse+hX6pj8c4h6zKp9TQ70nH+fFan14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759759445; c=relaxed/simple;
	bh=e9JdwUTdbDATOQqBaX7VdBTDAiGaPUCUcxVUN/89Q1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C6mj0PNRIWU+iw/kH7nwrdEp7iu+mimWo1ZjKgyem3eW1Ln8UZn5qdd56AvUgugfOe3HPasxBgEMeggyCma/MIdLrBS39ae9z4Igj2Bx9/Eh+NIaGtf5HfgjM3+rqZ4MiaXpug5vYq4iJzvAd7xB/xwPvdWPqjyFxB06pnPURAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7abbdf3c476so3890961a34.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Oct 2025 07:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759759440; x=1760364240;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C/MOCb5QFzOSGrPS8JyGdOvWdo9CLp8Tmxewx3JYuss=;
        b=GEJLaNBYRk+lsMkc61bCGnY3r6T43THLvEWuvgkYdmEoH9rFitet4E/cbkzI4wHSSj
         +jsQalg0Cc0lbLuqTi2dCr7bn0fChxmSiTwAMqwF2+Xnayiy91GYtaPvS1a+fvjJ+khd
         I1ABxAtsi99ECv5LLEST4nBeDBlKBeI++qX+CV7f2yLcC6jROwQV7cbxPnO2dEQlVYl0
         1KgbLSbJxs9EROrrYhuinuOctN0w78g1LceHpMvZ6Qq2p2eruCSa8xHlhVKthg0aJ2nk
         JeuaMEJo7WxPhcIUWwjgL5ConrTva4HZOtk/QMnR2wNdY1H14dTRL917kejjcVpfs5EW
         dLhw==
X-Forwarded-Encrypted: i=1; AJvYcCUwwjPHRnD02muEjJCVw84SLAV2B5umIXIP+agM33kl9k1cic0fw8xTVllXxCd1W8Xp7ymeAp510V3NJHufdbEXiA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdxg4qQkE2sJmTMGb2YPoqyPHPY723DQGHddy6yJhDo7ICv03b
	G5vwhw8Ma2SZQ1babABjd3LSkzB+mWkFHGQFd7ROcL+UaR4CwTYhUeWkebn8+cr5
X-Gm-Gg: ASbGncvmx+4edZ8pN56NgoejzjvDVqEzYF9hVkXJHZG/QUrscvAoguz517NkDCEBytP
	aB07tPDbEFSPZbNva7dlNsIq0kB9OURLidqYQz1qci3IxJHY0QbUSqX8hOB++jkJVLg5mYpakjw
	6yi4jTkIoQzc2ngv8vIHJudP0LjOzeTH02wbq1jVCxRreVtaArMsy9G2/wUu7As6bI8Ru3kIbrK
	4mkhYSsLDcwA87Oo98rlkRwGx48AIB9PKx6ZaJAS6imkPLrXOj2+WQXYVrg6sr1/wpohHRTEXuH
	Zb0Ed/CfEXpmEZ+C/GcZru+tvVn8XJl5hZn1T+1QbiIG79ZTSLR+pcsfEE93RNaHgCu9uc+VdsE
	6BG4u4SU8TW54wTpWiIH/XPWTa2xG9JOYoCyHqfdUXnFBwsLdPzdV5j2NrulUluDYlI/cMmtEIz
	qxPQRKmW6Plwz+h8e1YyE=
X-Google-Smtp-Source: AGHT+IHkCwVDdRaPIRhgWtxlswEzyd2Sb4EA5QUwQI0lK2svzU91RAqhfgj+Lci0Xuk8X+RlNNivqw==
X-Received: by 2002:a05:6830:9c3:b0:745:2585:9c57 with SMTP id 46e09a7af769-7bf772caad7mr8285655a34.7.1759759439907;
        Mon, 06 Oct 2025 07:03:59 -0700 (PDT)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com. [209.85.210.54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7bf434f904dsm3837051a34.29.2025.10.06.07.03.59
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 07:03:59 -0700 (PDT)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7af791b28b9so3492001a34.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Oct 2025 07:03:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUd2fS/ImmCde2cVG+rvgt/SQtWdcSygEMOgE80C3oqjJnUXmbnqTu6F3lR8tPOpTA1FBFSpiZ9PDn5XOKQadtN6g==@vger.kernel.org
X-Received: by 2002:a05:6808:18a0:b0:43f:42d4:aca5 with SMTP id
 5614622812f47-43fc1887c42mr6998606b6e.37.1759759439194; Mon, 06 Oct 2025
 07:03:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251005131524.16745-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdV-6A+vV4bZLoT2NtXiqMQLTRRbNJXC1z2ttXX=aXFEGw@mail.gmail.com> <9864e81d-3b62-4513-9deb-1ce154cdc571@mailbox.org>
In-Reply-To: <9864e81d-3b62-4513-9deb-1ce154cdc571@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Oct 2025 16:03:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVEK5MaJNWwpT_7yo0=tk+Pm+99QRD3SStkWsHHDDVJ7A@mail.gmail.com>
X-Gm-Features: AS18NWCb2ZrMUgjZ1IFcPHfLn6Yd4K2uYUz8xkX8k3wTf9cXh7KxXFz-wfQ0Y3s
Message-ID: <CAMuHMdVEK5MaJNWwpT_7yo0=tk+Pm+99QRD3SStkWsHHDDVJ7A@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: cpg-mssr: Add missing 1ms delay into
 reset toggle callback
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Mon, 6 Oct 2025 at 15:56, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 10/6/25 3:43 PM, Geert Uytterhoeven wrote:
> >> R-Car V4H Reference Manual R19UH0186EJ0130 Rev.1.30 Apr. 21, 2025 page 583
> >> Figure 9.3.1(a) Software Reset flow (A) as well as flow (B) / (C) indicate
> >> after reset has been asserted by writing a matching reset bit into register
> >> SRCR, it is mandatory to wait 1ms.
>
> [...]
>
> >> +        * On R-Car Gen4, delay after SRCR has been written is 1ms.
> >> +        * On older SoCs, delay after SRCR has been written is 35us
> >> +        * (one cycle of the RCLK clock @ ca. 32 kHz).
> >> +        */
> >> +       if (priv->reg_layout == CLK_REG_LAYOUT_RCAR_GEN4)
> >> +               udelay(1000);
> >
> > 1ms is a bit long for busy waiting, so I'd really like to avoid this.
> >
> > While the documentation does state this 1ms, I understand the
> > issue we saw in the field was fixed by
> > https://patch.msgid.link/20250922162113.113223-1-marek.vasut+renesas@mailbox.org
>
> This synchronizes the asynchronized resets, this is a separate topic
> from the 1ms delay.
>
> > so perhaps we can do without this longer delay?
>
> This aligns the driver with hardware operation charts in the V4H RM,
> which mandate the 1ms. If we want to follow the RM accurately, then we
> do need the 1ms delay, otherwise who knows what kind of fringe failures
> we could run into.

All true...

> > FTR, it looks like the reset controller documentation doesn't say
> > anything about the context from which it is safe to make reset calls?
>
> What does this mean ? Please clarify .

Are you allowed to call reset_control_reset() from atomic context,
like the ISP driver does?
For the clock subsystem, this is clearly documented: e.g. clk_enable()
can be called from atomic context, clk_prepare() cannot.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

