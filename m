Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 459542B67A8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Nov 2020 15:40:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728285AbgKQOjz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Nov 2020 09:39:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:38390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728198AbgKQOjy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Nov 2020 09:39:54 -0500
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 32E2124198
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2020 14:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605623993;
        bh=2c0ws0hzSSwDDg+MCG4sNiHHMzTyoKwnghc2NlLaQQU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=I8jQJuPCxd5sxr+db1CyGY5iwi47nxLxiO1VQ7XnTPQadFlw7c1kdyacqviS1bhu9
         6Xv9YHpC25PHjbCVVn01odKXm0DPcPXbu60d1h4FtaOZNQv9XlmuBz3Fu7vCFlc9E/
         XJW6QsmgFGgdeo/Tjy0YuIPCyjU/h+gmfVsbq3PE=
Received: by mail-ot1-f52.google.com with SMTP id f16so19546820otl.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2020 06:39:53 -0800 (PST)
X-Gm-Message-State: AOAM532xWQIwp48mc2tnzJrgRMFVEbRWnDgZu4G6PNSe+XnMaEA4H3vu
        7y8RysHxP0Att0suBn5QRVPs2l/huPt+Ty7pmn8=
X-Google-Smtp-Source: ABdhPJwpt0dxM9yonG0GQLL2/2R5Ezi/U+bwK03+V9jNs2NW3Ar9yw3V6XTxqwNxKhKV4Hc2/qNHehykkftb2LpVbZQ=
X-Received: by 2002:a05:6830:22d2:: with SMTP id q18mr2931654otc.305.1605623992439;
 Tue, 17 Nov 2020 06:39:52 -0800 (PST)
MIME-Version: 1.0
References: <20201117103022.2136527-1-geert+renesas@glider.be>
 <20201117103022.2136527-3-geert+renesas@glider.be> <CAK8P3a1CAmC3=QFA1EryDsx0aR-OF+=mf=Xj9cPrObe+qRoJKQ@mail.gmail.com>
 <CAMuHMdWTuzxg-a0f5MfPN=66EXcEqLfHCQMhiSAWH04p1BQ2ng@mail.gmail.com>
In-Reply-To: <CAMuHMdWTuzxg-a0f5MfPN=66EXcEqLfHCQMhiSAWH04p1BQ2ng@mail.gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 17 Nov 2020 15:39:37 +0100
X-Gmail-Original-Message-ID: <CAK8P3a363pGBYAyGgV1r+evpNk9Cpcu-vE++s7Ma4YB25AW+yg@mail.gmail.com>
Message-ID: <CAK8P3a363pGBYAyGgV1r+evpNk9Cpcu-vE++s7Ma4YB25AW+yg@mail.gmail.com>
Subject: Re: [PATCH 2/7] ARM: shmobile: r8a7779: Use ioremap() to map INTC2 registers
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Nov 17, 2020 at 3:19 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Arnd,
>
> On Tue, Nov 17, 2020 at 1:25 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > On Tue, Nov 17, 2020 at 11:30 AM Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> > > Replace using the legacy IOMEM() macro to map various registers related
> > > to INTC2 configuration by ioremap().
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > The patch looks good, but since you are already touching these __raw_writel(),
> > could you turn them into normal writel() to have a chance that this works
> > on big-endian? It could be either a follow-up or merged into the same patch.
>
> (Do you want us to support big-endian on these old platforms? ;-)
>
> At your service. Seems to work well.

In general, my preference is that code is written in a portable way, to make
it at least plausible that it works. I don't expect anyone to actually run
big-endian code on it, but if you can confirm that it boots all the way
to not finding a compatible /sbin/init, that would be awesome.

I guess since the initialization writes (mostly) '1' bits into the irq
controller registers, it would (mostly) work even if endianness is
wrong ;-)

        Arnd
