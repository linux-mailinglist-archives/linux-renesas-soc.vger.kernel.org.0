Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89DDC333D76
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Mar 2021 14:16:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232278AbhCJNPa convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Mar 2021 08:15:30 -0500
Received: from mail-vs1-f45.google.com ([209.85.217.45]:43020 "EHLO
        mail-vs1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231519AbhCJNPB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Mar 2021 08:15:01 -0500
Received: by mail-vs1-f45.google.com with SMTP id w76so8686960vsw.10;
        Wed, 10 Mar 2021 05:15:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QDfO23mATK6CqDaHcYM85sjaBlq0z2F1PZtWMpKT3Sw=;
        b=r0xsMCINSPdWlSdOm+MIcvXUWRV4cbZ5g7HS6T504ntJj9Xotsgeb1EMvCzt4X3zTf
         p+TlK/K6Ww41soWls67EMZRNThWKlPz+H5gQlrBPOTUlaAhoL27P01JApuNrqHBB8ohA
         KhPdjXYAFXC0XVYEfm7tLTvQ/0CCr4ibfHQ+tXg73vFsqQyZevfq+cBK3u2DgFNzCgiw
         l+rjqoI+XRFpKWQTuv2FdaFtJdpo2vv72/2IArQ3HVscwgNQ8s8xGhYMX/YWfyoVzIiJ
         n3ofaGnO21G//Mc+3PfRorI3ouY3qGwJ+5gzH7pZdBMP/5iJI1QWRGp+phKWI0iJxkaz
         sfMA==
X-Gm-Message-State: AOAM532ZJpE9ENJVdn2H86VavJgf53H8I3twzv+r1mptKUao6gbn30EL
        KGm/I+DE/TabKSCXPhr7OEB0aVkA3NfQKtHmADU=
X-Google-Smtp-Source: ABdhPJwOpI5TUFI2LAahJvjU1nMrfVI3/HHEDjfc939oZUxyrLf/J72sVqysnvB/fK/u6KRSfxQ7MzEF9Kn+bQYqARg=
X-Received: by 2002:a67:ef0e:: with SMTP id j14mr1168284vsr.40.1615382100365;
 Wed, 10 Mar 2021 05:15:00 -0800 (PST)
MIME-Version: 1.0
References: <20210310104554.3281912-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20210310104554.3281912-1-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 10 Mar 2021 14:14:49 +0100
Message-ID: <CAMuHMdU9e43174aSMb6BNWavVMNBv7Gs2eSWenX-soZ-nX+BNA@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: r8a7795: Add TMU clocks
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

On Wed, Mar 10, 2021 at 11:46 AM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add TMU{0,1,2,3,4} clocks.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v1
> - Set TMU4 parent clock to S3D2 for ES1.

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.13.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
