Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B80913735B6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 May 2021 09:41:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231279AbhEEHmc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 May 2021 03:42:32 -0400
Received: from mail-vk1-f172.google.com ([209.85.221.172]:45789 "EHLO
        mail-vk1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229741AbhEEHmc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 May 2021 03:42:32 -0400
Received: by mail-vk1-f172.google.com with SMTP id u23so283649vkl.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 May 2021 00:41:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FxmIwdarWvGp9lvWIXyTK6sz+Izpg+iuQJ3oaH5SLE4=;
        b=GYoyZ3US43bW9EbDyRm5MMUsNcjxN6H1sCS2KSYQ7VhLPrxzvVd2+uXFpn7hJ71XvF
         y4sWbMNRtgpVqh+xE1mHcC7wW8MBoNhcm6SGjbdw630A4T+PQNaL3HwXGxoR6B13xaz8
         huSQ0k1sLf6e6z/XmTZX1X22fCgezgQ9OmCRpPbxBabL3+1C9GhmsHttxJmOtT8jmS4A
         wGC4dGqZ/AgbeAFOKtsOxTyJz3YN+Y0tWqsA5l/QcDuYECF0NWOzH9Alq7rZSnzSDP7v
         pPwElkN4ICyDX0bXa+QuNKE+Mc05UpP8Mm9UUTR2ZMkdV2W0vIzaomSUfN1qvZmxTZR8
         WQOA==
X-Gm-Message-State: AOAM532AiHq2QG8IX5QjV7Ill2vfLp3rEpj+q+wsbTCaQMMrQx8ygcnI
        y46kgZfYzqa+tsylWnccDFl/2mHgpd8PUA55+m4QPrM7FiQ=
X-Google-Smtp-Source: ABdhPJwK+tcZn2lvBS2OqqVSW+Q/A45XepiekwiPEyw4AW8QCZEE2jLG8//q7PG3RiCfFBCyRA/tBh2AnF3NPzksrLE=
X-Received: by 2002:a1f:1f81:: with SMTP id f123mr17500365vkf.6.1620200496107;
 Wed, 05 May 2021 00:41:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1620138979.git.geert+renesas@glider.be> <1eac63f15a776e492ff8a2d8447c5e1019982dd1.1620138979.git.geert+renesas@glider.be>
 <20210505071323.GA1009@ninjato>
In-Reply-To: <20210505071323.GA1009@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 5 May 2021 09:41:24 +0200
Message-ID: <CAMuHMdXWQ0CR0QpYeVJ9TWTUf8M7K=QZ+5z4-JTJgutq_ndBng@mail.gmail.com>
Subject: Re: [PATCH/RFC 1/2] ARM: dts: r8a7778: Correct internal delay for i2c[123]
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Wed, May 5, 2021 at 9:13 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> On Tue, May 04, 2021 at 04:41:24PM +0200, Geert Uytterhoeven wrote:
> > According to the R-Car M1A Hardware User's Manual Rev. 1.00, the LSI
> > internal delay for I2C instances 1 to 3 is 5 ns (typ.), which differs
> > from the default 50 ns as specified for instance 0.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> I wonder if we shouldn't also specify the 50ns for IIC0 because it is
> describing the HW instead of relying on the Linux-only default value in
> the driver? Other than that:

With the json-schema bindings, we do have:

    +  i2c-scl-internal-delay-ns:
    +    default: 50

> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
