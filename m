Return-Path: <linux-renesas-soc+bounces-1969-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD257841D18
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 08:58:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 888A728706C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 07:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 879C954667;
	Tue, 30 Jan 2024 07:58:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE9254668
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jan 2024 07:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706601530; cv=none; b=BBlm10rHP8R+5WBUxgUxpQYMxVKevEnalDGLueamURqH4i3yIAfklv3zeTNhwVFKtYbJvX3rKpl4dJE52XAQN4u2qz7yz5YSruBgK3GfdiapiCQXvCXlRmFip/T5P8580uleO7ksDsnLXuFt/vE2RE1GSYRGAjeTh0J/XsLNJVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706601530; c=relaxed/simple;
	bh=dIzOwvXajejud+TaY9iHsKMq0WD9yCAmQMiTckZBQr0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uI5uyppzjZf+HkcWgyIGISsKc80cCOqfmL94bHc/5FQiCYXgE5BlOKQIgrF08MdnlNvxggnTOlnFWoq+w0LH9Pq446cNu0zLfkEI+IZ1V14AP3cMej2mDMCpV0kXoXBrEKnSAUzjr6TfsaRMNqhYgAZJ1S4mBjqy6IsdtsPs1+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5ffee6e8770so43072437b3.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jan 2024 23:58:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706601527; x=1707206327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=We6oCD7oy75LkhTPwDJc6sElKRctH0wNNf7rNGfSxfs=;
        b=loxJeU3CeWlxzBCuf0f4ccB0H5/x9fV5mHcF2dxj+Rg7ifzROE376+6D01Nwr6B8+k
         OTpX2Y/L2X1ZvDdX39y+ToDGJu336MqiYuFz5N5LXErxwhvK7JsznwAK7tgtgqLP+s3P
         5fwSVIyznDDKVFnWt7nKQGYxO81b+hFyjBJ5CSRSY0eziYjSvHwY0NeuxXxBfaMvP9bG
         jw3RX8/Ed5JhkvnzK5/pEMP4ESAtDRrH+ppsJN3BidlvLTZZq9CMpsKnMdmCdYSXEWT7
         7UzcZsyKQ4EgvL9nyyMEUGe+F9MyIZz1nOiF9J9010Qf/Q3EYN1YuFtGV0gwe0hRou2c
         YP1g==
X-Gm-Message-State: AOJu0Yx4p44kerh4cxCQ0Yt8NvagflOijRCw3uSY6ppH3pi+chAKar7z
	ztfQnYge6/ROUB5hKtBR8VKJaSnpzIqOGiQKJ1nSMnKxpsUums59sAXK+1WZ2jE=
X-Google-Smtp-Source: AGHT+IHCwPFYBn5gSeL8kboE5TTk/u3kzxL1rD+cWl0GHMqBPtsbrlgfB/sYAEW1Nu9l+hE1HZYolg==
X-Received: by 2002:a05:690c:450f:b0:5ee:1ca0:b7ef with SMTP id gt15-20020a05690c450f00b005ee1ca0b7efmr7976602ywb.42.1706601526929;
        Mon, 29 Jan 2024 23:58:46 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id h21-20020a816c15000000b00603ee8537d3sm436851ywc.72.2024.01.29.23.58.46
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 23:58:46 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5ff7a098ab8so35610837b3.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jan 2024 23:58:46 -0800 (PST)
X-Received: by 2002:a81:e803:0:b0:602:ab7e:7343 with SMTP id
 a3-20020a81e803000000b00602ab7e7343mr6563475ywm.13.1706601526386; Mon, 29 Jan
 2024 23:58:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <12ff20eb-d4b5-41f4-a494-cfb6b7abe617@de.bosch.com>
 <CAMuHMdW=igXesjxvNk=+in62neW=kipnFW2BUH3P7sfDnqXzEQ@mail.gmail.com> <8a0e405d-cdee-4888-ba92-47352766688e@de.bosch.com>
In-Reply-To: <8a0e405d-cdee-4888-ba92-47352766688e@de.bosch.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jan 2024 08:58:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX2RvXj5ZFwg2WxNpPGw59=b9quqryO-iZONx_yqgsp7w@mail.gmail.com>
Message-ID: <CAMuHMdX2RvXj5ZFwg2WxNpPGw59=b9quqryO-iZONx_yqgsp7w@mail.gmail.com>
Subject: Re: rcar-dmac.c: race condition regarding cookie handling?
To: "Behme Dirk (CM/ESO2)" <dirk.behme@de.bosch.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dirk,

On Tue, Jan 30, 2024 at 8:08=E2=80=AFAM Behme Dirk (CM/ESO2)
<dirk.behme@de.bosch.com> wrote:
> On 29.01.2024 10:57, Geert Uytterhoeven wrote:
> > On Wed, Nov 22, 2023 at 8:02=E2=80=AFAM Behme Dirk (CM/ESO2)
> > <dirk.behme@de.bosch.com> wrote:
> >> using a rcar-dmac.c on RCar3 being quite similar to the recent mainlin=
e
> >> one [1] we got a BUG_ON() being hit [2].

> > Was the system running for a very long time?
>
> Hmm, the trace I have contains boot time stamps (dropped initially) like
>
> [  153.394731] kernel BUG at drivers/dma/sh/../dmaengine.h:54!
>
> I think this "153" implies 153s after boot,  i.e. ~2.5s after system
> start. In case there is no wrap around here too.

Yes, that is still quite early in the boot process.
Do you have log info from just before the crash, that might give a clue
which device was trying to use DMA?

Thanks!

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

