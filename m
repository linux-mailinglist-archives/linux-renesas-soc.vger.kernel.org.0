Return-Path: <linux-renesas-soc+bounces-22059-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1574EB8864D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Sep 2025 10:23:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6710525FC1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Sep 2025 08:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDCBD2ECD2B;
	Fri, 19 Sep 2025 08:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ewA8+KLc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124D62ECD15
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Sep 2025 08:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758270225; cv=none; b=GFc9PDbAiuYRw3eAdDvtsDBG6Q18rulUdqAHj4+yoJSsoCA4SYxsSDXg98QCuDw6x2fZ6wk2jzjHherIifN4UgHeIE1xt6CGvKpjp8iXwQxXPg6Ljs/57KcPgc/sUcrua6M0KR29VWFOjO07zTNdNMxykRoVS5yAfyZAMcKWd0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758270225; c=relaxed/simple;
	bh=7XGnGKvoNg5AjPkeoVXXXH/13xWfCqH89BhK/sv5qFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sOqNhEAVdwjGqZlD03aY84iNbRupPz79Sznh3ybUU3ZxbmwZyYHJoyRTKYo1P5MrVJuhp8tCHAJmaI7JK7Gx2vqgfKzInfbCw9fn+6rcsAAWHSUim/Vy6LvJe9RDbfFrZNOpEnhIWuJ4NRs6z+fa+YbU4mJGB0K8oBdrbgRxXQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ewA8+KLc; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3ee130237a8so902694f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Sep 2025 01:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758270222; x=1758875022; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y2qmh1oF2ZpeQFMjFAEk6/CZB5TW11CPjyGCveazKTo=;
        b=ewA8+KLcacvWK3ptSNFFwgoD83oj3C+IcUU0UHPl7qnwGhUQMK+gWYd2XnPW5AEzXt
         XuL1WhKL8Xd1fuRi1EbY87UEZem/vrYLyLYhDdwVxRJwErLGFudLyp94P084gbY4tJkT
         Xh1mPlYdxD1JYg8+DGxv4Sy7fFOSH7EAeTq0E3Wv4pJKQd25g8oglWiPYUEjQvjVN0/+
         4laV16tQiplY6TeyoecR5RaeRQXKTFLPT13E1lVvph21RYP8cm0uMKLlQwLuoQShnm75
         hhr6PRvU0391a3rcKhcWqTKgg+INNpF7apgUoO3t8kQLTvYdTZ0QHAZeSHQCHIupo5Ul
         cnBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758270222; x=1758875022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y2qmh1oF2ZpeQFMjFAEk6/CZB5TW11CPjyGCveazKTo=;
        b=FWJOKQXwI0Z2UzrQLuo/CHPlIxHtxr6kMZh0N0gpZJYcD6B6KjTUNX112f1JT+R+sJ
         r4/BZroS3HwxSH05KW5ItwEVVWKPMEVVGAkQPdfUV4/j6FBfUbkaYM6+WSeND+YRRZDx
         O1qbNrWcseYwTfV1+1+o7i3KtIQprhiV9nHFiVGvqYqbSF4PG3ioIpag1SP4B967v2e8
         rtF1jqnGluJjbvYAuRnuLdZ1agIqU46afBXL3BOsT7b5ZCN+AQMDRCnBTy/7+HIvW7Xy
         3u1n6NcdSy9YHLk9Rh6dCqYUffIh/ahNOIPSuDcV6AHgajGz11PRDXg+5Qh6zCmuSB1/
         WHjw==
X-Forwarded-Encrypted: i=1; AJvYcCVPuo+dCb45ksCMyp/WFspfWGByLLWSADHZ1l4iQtd6ZGkzVddMcdW3ba6/UmNV5Xqa1jmW7B5UhUxKSovqh2TI9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVCldFekWLYaP2jWTKyNBocwvrBBmMC/sPo7sjJ6BPGos4TvL1
	OwYcBabWjLk9DE9WQrflJYTRxTTjvufrZ2lf0H8PlEYWJdr2sSIH+y5NDtLC4DNsCWwjTFnLsvK
	K1lX3n9CvW9AMYt8Qw/HFz2wG/SWnbzU=
X-Gm-Gg: ASbGncuVa1SyrBqWx6mMWmf0rgR86JOWPRRaEsyYSeQORwJ9ktK449fgs1uxcm36Fvr
	ZCJ5/u+LzzgoIUUOFj3j+TTscBOqULpu/NR5QEJSlOU/IGEhVocXQzZxXnj1rtA9mAGRwprvUfl
	XVt6rQT86jxOI/XWY3JYTPXP9RlXIFpAfqdRZp2V2a5eJ7OFAuZNXTht6yF/9Cf7SqyWIzIBGql
	JpSiQxC
X-Google-Smtp-Source: AGHT+IGm5MKN1J/V9mgZ6eULjmirfe/RDwIztEONkzpPnPIt4WbNaHdqepIQ+Zy9XpUmGIPijhUZpnRR0x1x2w5OYpw=
X-Received: by 2002:a05:6000:1862:b0:3ed:a43d:e8c4 with SMTP id
 ffacd0b85a97d-3ee7ccf6148mr1392722f8f.6.1758270222293; Fri, 19 Sep 2025
 01:23:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918030723.331634-1-marek.vasut+renesas@mailbox.org>
 <CA+V-a8sjPx8U+MB3v-SxErRPqbz4irAgZhCvd5CHY=6uO_VoyQ@mail.gmail.com>
 <353db156-e518-49c8-96ac-bd138ee64a01@mailbox.org> <CA+V-a8sLxBq8vSuq2HxcchpLqyQxqTRtkWjUKsRN9tBqGhU7mw@mail.gmail.com>
 <9dbc6022-eb97-49af-bda7-1a7a8069609a@mailbox.org>
In-Reply-To: <9dbc6022-eb97-49af-bda7-1a7a8069609a@mailbox.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 19 Sep 2025 09:23:16 +0100
X-Gm-Features: AS18NWAfcrcIXLiPjw-n2LKhXN05uaVghDk4JKPLmORvE6F8g6pzNVnIF9UcvSw
Message-ID: <CA+V-a8tK-LYxPaZu=o7Zdfb64Fijuhsfy23bi__fawzH=zCnsQ@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Read back reset registers to
 assure values latched
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-clk@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Fri, Sep 19, 2025 at 12:16=E2=80=AFAM Marek Vasut <marek.vasut@mailbox.o=
rg> wrote:
>
> On 9/18/25 5:05 PM, Lad, Prabhakar wrote:
>
> Hello Prabhakar,
>
> >>>> diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/re=
nesas/renesas-cpg-mssr.c
> >>>> index 65dfaceea71f..7b52e8235984 100644
> >>>> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> >>>> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> >>>> @@ -688,6 +688,7 @@ static int cpg_mssr_reset(struct reset_controlle=
r_dev *rcdev,
> >>>>
> >>>>           /* Reset module */
> >>>>           writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
> >>>> +       readl(priv->pub.base0 + priv->reset_regs[reg]);
> >>> Fyi on the RZ/T2H and RZ/N2H SoCs which uses the same driver we need
> >>> to read the reset register `7` times and confirm [0] (as mentioned in
> >>> the HW manual). So after reading do we want to confirm the bit is
> >>> set/clear?
> >> This is interesting, I wonder if the readback is something more common
> >> to this reset controller.
> >>
> >> Why 7 times ? Is this documented in one of the HW manuals ? Are those
> >> public and can you share a link to them , with the specific chapter or
> >> page I should read about this 7 times read requirement ?
> >>
> > Yes this is documented in the HW manual [0] section 6.5.1 Notes on
> > Module Reset Control Register Operation:
> >
> > 1. To secure processing after release from a module reset, dummy read
> > the same register at least seven times except RTC
> > and LCDC after writing to initiate release from the module reset, and
> > only then proceed with the subsequent processing.
> > For RTC, dummy read the same register at least 300 times and for LCDC,
> > at least 100 times.
> >
> > 2. When module is reset once and released again, make sure that the
> > target bit of module reset control register is set to 1 by
> > reading the register before releasing from a module reset. Then
> > release from a module reset
>
> Thank you for sharing this, but it seems this is not the case for R-Car
> Gen4. I found out that V4H and V4M has additional "synchronized" and
> "asynchronized" reset types according to SRCRn_FSRCHRKRAn attachment to
> the V4H RM. The PCIe resets are "asynchronized". This extra readl()
> added in this patch is turning all the resets into "synchronized" and
> therefore makes them behave as expected.
>
I see, thank you for sharing it.

Cheers,
Prabhakar

