Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6537849C855
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jan 2022 12:10:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240514AbiAZLK1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Jan 2022 06:10:27 -0500
Received: from mail-ua1-f41.google.com ([209.85.222.41]:46014 "EHLO
        mail-ua1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240505AbiAZLKZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Jan 2022 06:10:25 -0500
Received: by mail-ua1-f41.google.com with SMTP id b37so25014637uad.12;
        Wed, 26 Jan 2022 03:10:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fXCOLn6fZgrPz+IJqOHn8kGX68nACf9fD3RgASQNb6s=;
        b=hti05bp3rwdq+bqvClHs34zbpolgQ2GAEhUDfZO+HhtGx9/D2gKsgA6TGaQ0ck8eS1
         GtbP64UqZB48wy5Pm2ZdB2F42mKB5Vf7ZvFWrjz6gjaJI8QML3wxUkoy76bdV84YoO9N
         JqJYKtMmhVtxxr3NGfB06/XR45FaZXNcvkq2YlN42NHa+Xh195Wqm9xOhM7pwRgD5D82
         CXbFfX2C4pcAebqP98itPVkJ6k5EBJOkWynmoz5oTsBMjZayeKbHfTiFshPPfVLCbbPP
         6CXu5Stq6ClAqOkrPMoBUy+xCZltCtGH5a9IuQOEJJJhtS7PF9oPlYNV0gYWgYWI9if8
         9wmw==
X-Gm-Message-State: AOAM532NUuGn8iWcNia5p7NvUUG8T3f3cvmY0pWnWpQKNb1BxOmruFux
        1+I++AgpuTDF3ky0W/H+2AuVYTYlSwwnW6/EKO8=
X-Google-Smtp-Source: ABdhPJzruX6zf2IXlt2dLQ3U9+IQl4Y0GLdF0IP0BQzIUK8d0dMM07YTxmuvFSLdivjWxcQg0BWENA==
X-Received: by 2002:a67:c290:: with SMTP id k16mr7500883vsj.72.1643195424510;
        Wed, 26 Jan 2022 03:10:24 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id o1sm2040816vsa.15.2022.01.26.03.10.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jan 2022 03:10:24 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id p7so35471099uao.6;
        Wed, 26 Jan 2022 03:10:24 -0800 (PST)
X-Received: by 2002:a67:c18e:: with SMTP id h14mr5624524vsj.5.1643195423972;
 Wed, 26 Jan 2022 03:10:23 -0800 (PST)
MIME-Version: 1.0
References: <20211229191838.27922-1-laurent.pinchart+renesas@ideasonboard.com> <20211229191838.27922-2-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20211229191838.27922-2-laurent.pinchart+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 26 Jan 2022 12:10:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXzrmRNQdgm+67Y+hRxHxBvSMejF-69xon2QJG2fuD-Ug@mail.gmail.com>
Message-ID: <CAMuHMdXzrmRNQdgm+67Y+hRxHxBvSMejF-69xon2QJG2fuD-Ug@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: Remove empty rgb output endpoints
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Wed, Dec 29, 2021 at 8:18 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> Endpoints node must have a remote-endpoint property, as endpoints only
> exist to model a link between ports. Drop the empty rgb output endpoints
> from SoC dtsi files, and declare them in the board dts instead.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

If we go this route, ulcb-kf.dtsi needs a similar change as
beacon-renesom-baseboard.dtsi.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
