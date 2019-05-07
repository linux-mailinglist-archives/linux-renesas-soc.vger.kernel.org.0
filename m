Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D0D615DBD
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2019 08:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbfEGGvD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 May 2019 02:51:03 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:40348 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbfEGGvD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 May 2019 02:51:03 -0400
Received: by mail-vs1-f67.google.com with SMTP id c24so2809557vsp.7;
        Mon, 06 May 2019 23:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DKiquDwX8Os4l197HJsRPWzAuacm0urteJuQSSCJDVQ=;
        b=qqvDbhoQHnkG5ub9vUiHj2QkpOsZNFlIoWcb3qEsvT/Mwo0wggRA5PVb0LLrFTi1uC
         3IPwAQQXa/G728RtibvoIQEBnpq2E/bExrSkYsi95icYNmJ0wt36oeUGwM9/QpcjmU7S
         j4tYcnMmhYceyuWKBJUboCCP/ybUgeGAgZltrGZ/k+bozDniM8BW0tOQjyAAlKvvqjJD
         nNbjSPfpmd4LfbwCLrth5TG+1zXagZvdt4qPVpXEDlqFaCcOfbluhoTwvZF2gW+xkIbt
         Untlh9hoaVD1xGtr+iKDr/sYtRvmhlsgxQXBNqRbHtSn/1nzNrGNJk6zl6Fk8Dff3Q/J
         cuug==
X-Gm-Message-State: APjAAAUdbIoqv7fCKBqBedy65EePE+P1PU0HvWfbaDRnHpHaNttd9LFM
        PtOravzEWHHZw7OMzbtLaA9ko5oLZZ3FwzXRcSg=
X-Google-Smtp-Source: APXvYqwpPVr8L7dP5g5arQ0lpj+eBQXq7yovfkgwIPiIo7Y8MtvaVzfpeR+Wu7msk+2oeAg4QCDUhOjTc7BnCStqt5g=
X-Received: by 2002:a05:6102:406:: with SMTP id d6mr8857952vsq.63.1557211862601;
 Mon, 06 May 2019 23:51:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190506201236.110281-1-chris.brandt@renesas.com>
In-Reply-To: <20190506201236.110281-1-chris.brandt@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 May 2019 08:50:51 +0200
Message-ID: <CAMuHMdXZVLj1NmFJLowDBiLFqeNogqSJamZAysmQ4gMeboRpSg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: r7s9210-rza2mevb: add ethernet aliases
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, May 6, 2019 at 10:13 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Add ethernet aliases so u-boot can find the device nodes.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
