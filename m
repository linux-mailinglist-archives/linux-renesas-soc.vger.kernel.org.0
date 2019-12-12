Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DA1511C8DD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2019 10:11:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728198AbfLLJLt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Dec 2019 04:11:49 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:43939 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728147AbfLLJLt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Dec 2019 04:11:49 -0500
Received: by mail-ot1-f67.google.com with SMTP id p8so1072885oth.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Dec 2019 01:11:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7wIM1lJRy9eAtuRPisDJiZIbJvk9fZX+UZSB0XLtzrY=;
        b=LgTKZBOJ6cSY23w4q9h5f4kHUsHb9E/v2/2XXkBHiks3mhGDkSE8nUmLJf6NBgqG/v
         wXRIa1pPWWQQCyRf/3oqH+rYefkFAaPHjC9EfNmTtlNxUVquiK5CQCD2Se7uspWmOJ1B
         ECSD1bMCLOKyCGu9vy13G/ASZ7SLxwDdkb/RaHAn4f5I7GrABmLuEHs40gy6S8K9PVl0
         8To4IQyFJpRDzi4Y9YdZKmk0hBbGqjRlQF7gviQogZ46opCvRv0ytYnY1cU+IFD+ktub
         G5u4nbu2oRI9lc85xPC3x7jwY0Vq9U5FYkkjcH4NTNGa3v8cjdAVYtk6AnJI5+CfcXiQ
         7ubg==
X-Gm-Message-State: APjAAAWldHcWYWLkiqvNSv7o6oT3vnani4QYQwfiB7KEiSYxHDQhPBpU
        sDJLTwcPh+4C35HkU83HsCvtYCFFz/xO1qFdWcY=
X-Google-Smtp-Source: APXvYqzwFePvqkNzW8sdMGqYLAE1xQ/z7N0Q+kJIK5JiX86N5yOiaXL7el8kbtOuVhacdBDSWdTXW8js3zU5R5RlYGI=
X-Received: by 2002:a9d:2073:: with SMTP id n106mr6976842ota.145.1576141908002;
 Thu, 12 Dec 2019 01:11:48 -0800 (PST)
MIME-Version: 1.0
References: <20191211131311.23661-1-geert+renesas@glider.be> <20191211195217.GA10150@lxhi-065>
In-Reply-To: <20191211195217.GA10150@lxhi-065>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 12 Dec 2019 10:11:36 +0100
Message-ID: <CAMuHMdXOxcTMY5JFHZfHucNF++=Pyf3=H51MkeDmO2MTXn2yyw@mail.gmail.com>
Subject: Re: [PATCH/RFC] arm64: dts: renesas: Rename r8a7796* to r8a77960*
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Eugeniu,

On Wed, Dec 11, 2019 at 8:52 PM Eugeniu Rosca <erosca@de.adit-jv.com> wrote:
> On Wed, Dec 11, 2019 at 02:13:11PM +0100, Geert Uytterhoeven wrote:
> > Disadvantages:
> >   - The DTB files are renamed.
>
> This reminded me of a past contribution [*], where, based on feedback
> from Laurent and Simon, the decision was to avoid DTS renaming. Does
> this series mean that one day, given enough time and resources, we
> might also eliminate the "r8a779[5-6]" and "(h3|m3|m3n)" redundancy in
> the naming scheme of the ULCB DTS? (not that it bothers me much)

Thanks for reminding me!

At that time, the rename was considered too intrusive, compared to the
slim benefit.

However, if we're renaming the files anyway, and thus causing a
(temporary) inconvenience for the user, I think this is a good moment
to get rid of the "(h3|m3|m3n)" redundancy in the DTS naming scheme
(unfortunately we cannot do that for the "renesas,(h3|m3|m3n)ulcb"
 compatible values).

Hence for R-Car H3, I will move forward the rename of the DTS files, so
all renames happen in the same kernel release time frame.

Regarding the R-Car V3HSK and V3MSK boards, dropping the "v3m" resp.
"v3h" from r8a77970-v3msk.dts resp. r8a77980-v3hsk.dts is IMHO
different: the boards are not called "sk", and are far from identical,
unlike "ulcb" and "salvator-x(s)".
Renesas has lots of "sk", "rsk", and "evm" boards. Let's hope they don't
plan any unrelated "ulcb" boards...

> PS: [Thinking out loud] Need to get prepared for using two versions of
> U-Boot scripts when switching between BSP and vanilla kernels on the
> r8a77960 targets. This will definitely add a tiny bit of overhead, but
> nevertheless it looks like an investment to me, the one which users
> will not regret (on the contrary, will be happy about) in some years
> from now.

I'm fully aware of that inconvenience.

> Reviewed-by: Eugeniu Rosca <erosca@de.adit-jv.com>

Thank you!

> [*] https://patchwork.kernel.org/patch/10555955/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
