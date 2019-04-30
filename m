Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC692F960
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Apr 2019 14:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727821AbfD3M7M (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Apr 2019 08:59:12 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:37926 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726264AbfD3M7L (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Apr 2019 08:59:11 -0400
Received: by mail-vs1-f68.google.com with SMTP id v141so1114965vsc.5;
        Tue, 30 Apr 2019 05:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KKdm93VPJXF5O5j7UpkQ2YT6Jqh9Gtcke5UGF/ei2yA=;
        b=Jj62xx4+w7S0Pp3wzQpACkCAd3xSpatLthOIDCqzoasbbfuGEVKZ3/4EFPU4z1gHLd
         jgMQNxBcKmacz0WX90BTmEWyevcY8nC3EmN7DcCCNVeasOl+fAXZsqVtS7bJ+8MH+dMO
         rLWnSBzzlpUuEuRWknRxyPtkZLg2cgA0nXXzUc0nhtnbXZAiGKYc+MovLR15c5Vnsc4u
         yoBqW1cRxTodxHQqM8E9x2F4No+HmP72ictarmWSTsQVwjS3F4r0vGNg2U7UazeAvMcK
         Q9elNLX4WdTwipWV151pZfm9jB/Ujj7Odjq7sweqPyBXfAq2M8qdCY9Oa9wMp9LGBfPa
         yGqw==
X-Gm-Message-State: APjAAAWMt8SI5jdAxFrikDYMb5uSGX6SmAo/jZVIbCK/pMcfSa6KCYmK
        3NnonFVr4+bPVm4/kcwDNrFHWH+6bUXqE69kAKw=
X-Google-Smtp-Source: APXvYqynR/fkbar2duH23XOmQIDC7a0Td41tF2nqLIgwhoqq+1OTqM8g1UtP+1bte30RGXuXT+Mc9i4oiDLvxyUFPUo=
X-Received: by 2002:a67:83cf:: with SMTP id f198mr6727361vsd.63.1556629150322;
 Tue, 30 Apr 2019 05:59:10 -0700 (PDT)
MIME-Version: 1.0
References: <1554907730-14792-1-git-send-email-biju.das@bp.renesas.com> <1554907730-14792-13-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1554907730-14792-13-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Apr 2019 14:58:59 +0200
Message-ID: <CAMuHMdU9URhBDbM7dP+Mq6f3kiUTdcD8+ipDvipFBciq=iUDMw@mail.gmail.com>
Subject: Re: [PATCH V5 12/13] ARM: dts: r8a77470: Add HSUSB device nodes
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Apr 10, 2019 at 4:56 PM Biju Das <biju.das@bp.renesas.com> wrote:
> Define the r8a77470 generic part of the HSUSB0/1 device nodes.
>
> Currently the renesas_usbhs driver doesn't handle multiple phys and we
> don't have a proper hardware to validate such driver changes.
>
> So for hsusb1 it is assumed that usbphy0 will be enabled by either
> channel0 host or device.
>
> In future, if any boards support hsusb1, we will need to add multiple phy
> support in the renesas_usbhs driver and override the board dts to enable
> the same.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
