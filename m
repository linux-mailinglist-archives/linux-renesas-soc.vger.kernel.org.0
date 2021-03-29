Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 358C034C4EE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Mar 2021 09:29:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231184AbhC2H3Q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Mar 2021 03:29:16 -0400
Received: from mail-ua1-f43.google.com ([209.85.222.43]:44018 "EHLO
        mail-ua1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230322AbhC2H2n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Mar 2021 03:28:43 -0400
Received: by mail-ua1-f43.google.com with SMTP id b7so3626264uam.10;
        Mon, 29 Mar 2021 00:28:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dvbWeiO/clTTMNAnX8lNGcmJO6+fNShyOgdR5/QqtBI=;
        b=aWum01dQlKLWW7MmYbZYQrEyGZDMA2voISMn5NhyTpLLDYCfdaIuCiVs6UcvNBmLZ8
         3758HhiwNb15CZKqksAv4kXB1L6rmdrnRymCY+5eVvHnW7YQZoUp5/t6BvSJfG8cKs8q
         e8uythQYslVMufmWhVSfw1+48SWFHA2b1O+MykL6RmK1XC/bJypE/D5jZ8UI3G7PZgZr
         UYPn+aP9+Bq5PfeIEuUVdAX6YsxPTDko063EkVOODHm0ocAm74rqZ4WnSdQ5QUF8xHx5
         heLtolisXgAtcHGZeHUBGn+s6ybGvgTMSHW+l8uCoWi9lZure6jUzokXBw2WWHYviiI3
         vpzQ==
X-Gm-Message-State: AOAM533MF4Yd3wYHPh+uSEJGHqEcH+ODE9ZXWJfJNADXA848ia1dsGoh
        RxCWOukQjj0vB01SB2Hc8nG8zmSeK5IcEoS6TVnyHRkR
X-Google-Smtp-Source: ABdhPJxRJZb0+HfOZj6Fiup/boinTl1lnnkCjy1tUsJc4fi574Gx+jzft8S3NIHMRUPhr3qxhwITbJmF1sACKxL5sr8=
X-Received: by 2002:ab0:6954:: with SMTP id c20mr13903558uas.106.1617002922749;
 Mon, 29 Mar 2021 00:28:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210322172919.1154686-1-kieran.bingham+renesas@ideasonboard.com> <20210322172919.1154686-2-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20210322172919.1154686-2-kieran.bingham+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 29 Mar 2021 09:28:31 +0200
Message-ID: <CAMuHMdVp9R=MZUkvJ=wH-5Lu=BWCGcOF7gJJuZv+aC_J99FMEw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: r8a779a0: Add FCPVD support
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Mar 22, 2021 at 6:29 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> Provide FCPVD support for the V3U.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.13.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
