Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F4D1E4C55
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2019 15:34:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504781AbfJYNeJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Oct 2019 09:34:09 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:46078 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504780AbfJYNeI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Oct 2019 09:34:08 -0400
Received: by mail-oi1-f193.google.com with SMTP id o205so1615842oib.12;
        Fri, 25 Oct 2019 06:34:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iUx4xBejI/bMHyocAzAYVHDj3igErzHqOpH7ANpRK3s=;
        b=MHscxQ0pZptiDIlX0rN4nU+0hNEgCMXqLecB8o7/JZpJBiYd6s5vNg33EpvbmCn9Zq
         f/WNi0X2g43s6FsWb6YrbwmLZbipl5KAvLZrXyR6KRN1A3lofv6/iy3MSody8BJ6nRlq
         ZsGBA5YHXhDm7GIhgku+a2RkOXuvlZMt3miHM81Lsjaq6OnBk0TO9E28GbBHx3bPWw5u
         MDteMTaN1qBTuUqB5dsYRFu+cHfPWPP47niyzFhAZF7bzO2ea7XVZnVOe/fcrqXWqmfX
         vU4YlM6SiQ+DXAEQVnRQG+SHj0YIN4WQ54j19DV7W2T0oSfGKWaHf2hYtMeSmsDLpGQR
         yAkQ==
X-Gm-Message-State: APjAAAU0EmuiVqvOtv1vWVbkgSlcyLLtB0ODDcod4eQrPa1xfYdlcS+P
        z84e8A5AwqUcbOR1uRPMXwBUyqg6yd8Gh3jxqmw=
X-Google-Smtp-Source: APXvYqxAOGdO/wj9UkmiDR4PxV5ipsPdG60be1raRikztn0fXd5AqBMfMeUxpsKU+jxgNsGXUXjpeFI0ChQC09meEhM=
X-Received: by 2002:aca:fc92:: with SMTP id a140mr2928341oii.153.1572010446895;
 Fri, 25 Oct 2019 06:34:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190908120528.9392-1-horms+renesas@verge.net.au>
In-Reply-To: <20190908120528.9392-1-horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 25 Oct 2019 15:33:55 +0200
Message-ID: <CAMuHMdWrOn1wmi4YTNB251pLnNO1cXLX-ZszBV-+5cVLDB_QWw@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: arm: renesas: Convert 'renesas, prr' to json-schema
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 9, 2019 at 12:14 AM Simon Horman <horms+renesas@verge.net.au> wrote:
> Convert Renesas Product Register bindings documentation to json-schema.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
