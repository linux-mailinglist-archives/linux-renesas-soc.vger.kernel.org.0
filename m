Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 897CB45C9B0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Nov 2021 17:16:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345777AbhKXQTN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Nov 2021 11:19:13 -0500
Received: from mail-ua1-f44.google.com ([209.85.222.44]:37875 "EHLO
        mail-ua1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241890AbhKXQTN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Nov 2021 11:19:13 -0500
Received: by mail-ua1-f44.google.com with SMTP id o1so6211714uap.4;
        Wed, 24 Nov 2021 08:16:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hhx7XvXOWuA2/9SbYledRBUDpLPEk6fhxAunTPhAlF8=;
        b=D97UrYxLKpNTLl9ZtqGvsFcgVNMTIrzoeZZCHSUipQVt7Kxw8+SKKrw460HTCSk8ej
         GaM+VbdXA9mFp0yfFET4N9ARpaXgIPSV+r4pARsnkV0k8iQuSp0yen1jtTYuAMJFTUmk
         YY/h3l62sG+0YeMD6N+spVGuM7yU6YDCB0ylcTEGYn/K70qjos9q6dng7hPm+lDVt5cs
         yYM3sm5Hega1p3BEmkZycVEvd2ovfVgpOSOkD7sg3RkUV93Pczw8jNYNqKygiu8xFIvW
         9YxzTkcr90XIBUJGPluEd5X4DYQt6Lj3CxWe2O7L3AyeTVxVeAMzx4GqZaaNZ1FfdpX8
         EJTA==
X-Gm-Message-State: AOAM532otp7VAXfkeYgy7HWGKji1EA6usyeV7MhefXRxGcRQ+japG02g
        bQbNlrP2n7ENSYiSSKaRm3Ckv/AQsHExOQ==
X-Google-Smtp-Source: ABdhPJznrQag10Nxpl3HN5yVtwsJvY0EUkTbFeLA85CK/MCtO6hiBvZn8V98xCr6bMf41Ppy4R0LpQ==
X-Received: by 2002:a67:4347:: with SMTP id q68mr21874032vsa.40.1637770562247;
        Wed, 24 Nov 2021 08:16:02 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id i24sm112099vkk.5.2021.11.24.08.16.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 08:16:01 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id n6so6254258uak.1;
        Wed, 24 Nov 2021 08:16:01 -0800 (PST)
X-Received: by 2002:a05:6102:1354:: with SMTP id j20mr23834515vsl.41.1637770561517;
 Wed, 24 Nov 2021 08:16:01 -0800 (PST)
MIME-Version: 1.0
References: <20211124152815.3926961-1-kieran.bingham+renesas@ideasonboard.com> <20211124152815.3926961-3-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20211124152815.3926961-3-kieran.bingham+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 24 Nov 2021 17:15:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXd9b74PZyAe9aNKzBintath+emM5uC3L5Qtd0EXuQDjw@mail.gmail.com>
Message-ID: <CAMuHMdXd9b74PZyAe9aNKzBintath+emM5uC3L5Qtd0EXuQDjw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: salvator-common: Merge hdmi0_con
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Wed, Nov 24, 2021 at 4:28 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> The remote endpoint for the hdmi connector is specfied through a
> reference to the hdmi0_con endpoint, which is in the same file.
>
> Simplify by specifying the remote-endpoint directly in the hdmi0_con
> endpoint.

Thanks for your patch!
I missed that when working on commit b1158c5e14b30396 ("arm64: dts:
renesas: Consolidate Salvator-X(S) HDMI0 handling")...

> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
