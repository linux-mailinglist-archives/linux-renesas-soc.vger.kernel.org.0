Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24ACC5E118
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2019 11:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725847AbfGCJdt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 3 Jul 2019 05:33:49 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:40016 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725820AbfGCJdt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Jul 2019 05:33:49 -0400
Received: by mail-oi1-f194.google.com with SMTP id w196so1503284oie.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 03 Jul 2019 02:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XY57Eb0+fpH09gIsa/yZVETx8eYY0HjZRuAjKs94P5g=;
        b=EvQqgp0ZM/7B/KqqRAtj6eSPT56twQd4a7XrTpPGqL7hNdykm1rXHsuJu3inyqisFL
         vEZMDikRSsUznFWN9RIbJ+FRIo6rKFw9bBTayZni2C93P4ZuqpN5EZEfU/YQkpUWfJP+
         q7N353uBvavq7BvAFJgbX0isf6bICRGjsQZBAcJB1xVjvPrKvSzGtCmH5P7LUmOwQOTZ
         UcCnXUg3jiCnbkMDBOSH+yE2EpnhINV9eCwgEOKBeiHGbkzuw/sgshHePcYmqnkpVY56
         nPSt+zS0FSoI6IAtTl+QAWTmsqAUD+mA9b68s+KTnkmfHxXNcsHzozq9DhLs/PhpZGwB
         yZRw==
X-Gm-Message-State: APjAAAVhPyu8zXoN95Y36fEFZm08dBY1tpZU7cP3Zwf7smSoe+j+jAgp
        3ItCHycKMuWGZNxgi9WHd9vXF+q1h6xWkKLH4lU=
X-Google-Smtp-Source: APXvYqx+c2SzwJQq+7TzCki3BJT+5uFwGVTitri6ZlR7Et0sqOSM3YR3c6SFPcQwkfXC1byWK1EFoXPH07xVgKg/WWk=
X-Received: by 2002:aca:3bc6:: with SMTP id i189mr2815567oia.153.1562146428547;
 Wed, 03 Jul 2019 02:33:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190703084106.484-1-horms+renesas@verge.net.au>
In-Reply-To: <20190703084106.484-1-horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 3 Jul 2019 11:33:36 +0200
Message-ID: <CAMuHMdXMbLzL7X5uUp0g5Q-_YiXiyTW+tALzS=kHBOS3JNbRUQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Rename file of DT bindings for Renesas
 memory controllers
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jul 3, 2019 at 10:41 AM Simon Horman <horms+renesas@verge.net.au> wrote:
> For consistency with the naming of (most) other documentation files for DT
> bindings for Renesas IP blocks rename the Renesas R-Mobile and SH-Mobile
> memory controllers documentation file from renesas-memory-controllers.txt
> to renesas,dbsc.txt.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
