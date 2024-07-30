Return-Path: <linux-renesas-soc+bounces-7614-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6E49408A7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 08:44:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 77F97B245D1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 06:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D387118F2C1;
	Tue, 30 Jul 2024 06:43:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766CF18F2CB
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jul 2024 06:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722321818; cv=none; b=MQDlhnSEf38gEt5TFeOXMIUT5aLJGu3nkIDjkLwlmgVD3C1s/FPk86LJeuh9BI40QnE9DOamzpxYUJ1U4t38sqyWr6n5WtR5SNa5/VbBvVO04WWwR/L1wUlOJ+TiLlwQ/CuHX5nEOic4W3ZMncenXg4pHlf3pqdjArVT2X/WNc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722321818; c=relaxed/simple;
	bh=Qm5E/6+Yh6PcC1XnE8nnfs5vJV3iQ3aCW/tMRpBh8oM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bOyH/oBT/xZSZUIrOwK5XlPST2eFBxPu4Y4FU0CUUJo/TvAcIPxSY7If6oS16kHCVg/evVEFvEhDTWzBNoy3RtfZRIkRPBjEw5xY9iX6vUH39LbcHl0YaUZfbYIlJQsIs9hBvuaPwP8K+1OMKPac+U7mKcB086s8TtV2oc7ozH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-64f4fd64773so29751687b3.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jul 2024 23:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722321815; x=1722926615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8bmAWATvVKkI7vXZLzaArh/Y/pmIo49jDPkhotOaxfg=;
        b=ljB90PkRfHYmHbBavkAyrNxUuF+ncR9vb3bseTxvMQzQvRXVNHpUhlaapNHi6e6rI6
         aGZyofmndhcElK5DTCcXKBW8IzsHbzfeasvl1h5GC7Vyvn25Q6p5J/NvdjGg/5zMh6qg
         CUFPQL9BK3/GmZkz0fWprVyThr9v+Xwes8LtW3RqKFD6oq9f1P36XYXVz+4BBCUe3eIa
         cyUCPcLZ2VkITf96hnT+/fZKlVzR0Yqh8sCkti+EgjmhH82oCeeZkd6Bu4/Ahx6vgJhd
         GmvuGTldoU5Hnjn+u2eer2rvF1qaHCxVtTeIWY1yUlYVZmpIGND/CXtXHVp3fYNBcmYY
         5y0Q==
X-Gm-Message-State: AOJu0YytSrlwjcrskMSUCsNNdNiwMsfhhDeqzYjj6GMRd9LXxvvyTvJv
	les9ykUcuvo+NQFjFhs/z6z+VWmERTEH2M8n4UZzJSVmMjZi+PscCYO6HD1Y
X-Google-Smtp-Source: AGHT+IHBBuRTZgiYhZyROTJH6eDceVK66jQzErv8NSMvhSOVdmhR9VONavexq8GvmMZqParVMVqmyg==
X-Received: by 2002:a0d:e5c4:0:b0:62f:b282:9f02 with SMTP id 00721157ae682-67a07b7651emr132305117b3.21.1722321815118;
        Mon, 29 Jul 2024 23:43:35 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-67566dd9059sm23943867b3.28.2024.07.29.23.43.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 23:43:34 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-64b29539d86so28056327b3.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jul 2024 23:43:34 -0700 (PDT)
X-Received: by 2002:a0d:f281:0:b0:650:9e71:bde7 with SMTP id
 00721157ae682-67a0813d798mr125986867b3.26.1722321814700; Mon, 29 Jul 2024
 23:43:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725194906.14644-8-wsa+renesas@sang-engineering.com>
 <20240725194906.14644-12-wsa+renesas@sang-engineering.com>
 <CAMuHMdV7Z0i4HnN5dsPB2rYiZBfCjZaLic8KHXZ_+eqDkTASDg@mail.gmail.com> <ZqfnIe-2azyQ3thw@shikoro>
In-Reply-To: <ZqfnIe-2azyQ3thw@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jul 2024 08:43:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUBEV77nuMD1Wf80_dcvH09xZyZhy7bJTUxrH+a+v-tOw@mail.gmail.com>
Message-ID: <CAMuHMdUBEV77nuMD1Wf80_dcvH09xZyZhy7bJTUxrH+a+v-tOw@mail.gmail.com>
Subject: Re: [PATCH RFT 4/6] arm64: dts: renesas: r8a779h0: Add TPU device node
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Mon, Jul 29, 2024 at 9:01=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> On Mon, Jul 29, 2024 at 08:44:33PM +0200, Geert Uytterhoeven wrote:
> > On Thu, Jul 25, 2024 at 9:49=E2=80=AFPM Wolfram Sang
> > <wsa+renesas@sang-engineering.com> wrote:
> > > Add a device node for the 16-Bit Timer Pulse Unit (TPU) on the Renesa=
s
> > > R-Car V4H (R8A779G0) SoC.
> >
> > R8A779H0
>
> And V4M. Geez, where has my proof-reading gone :(
>
> > > +               tpu: pwm@e6e80000 {
> >
> > Move before spi@e6e90000...
>
> OK. Do you want me to resend right away or wait for your further
> testing?

Given it doesn't work yet, I think there is no need to resend for now.

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

