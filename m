Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8156BA831F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Sep 2019 14:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbfIDMky (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Sep 2019 08:40:54 -0400
Received: from mail-qt1-f171.google.com ([209.85.160.171]:33153 "EHLO
        mail-qt1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725938AbfIDMky (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Sep 2019 08:40:54 -0400
Received: by mail-qt1-f171.google.com with SMTP id r5so18901633qtd.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Sep 2019 05:40:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4rc7ayEDOw2tvsd+jn2BL7f5hw8iQbcT9Kw4EgT2DdI=;
        b=WVPrHiAKz0s2F69r/r12AlXN9O73ELTZVcfq8xI6qF4PmyicYj47LGwlmzcLj7azmM
         vyTPIylV8LVTo/JwUw9Jv51LNsWup2D/MxQYOP+9rgEN7ruYkPIOy46xRNC2I7sKoSaq
         S9afjEZjAvjQaOcaN64O5o6+7K9xT0BumrRsiJkfTxEI9HD0UoGNDCrrJzx3QDFSgszG
         UkG083FvFbBV/UaD/N5GjpBPzgXlBxg8A3tPFj0wUMqnvj/OXtKI3pSDCQ3IOJZMY+HC
         IdsCUGpBPhRFG6fLwZjzdVVuRDkhcX1ctQ7Ru2X2zxxC0TrnQiA4bcjULaAxseMhgFW1
         52ww==
X-Gm-Message-State: APjAAAXa8rmhxO948qUYxKiM6qi4vAs54KNcaMs9TIW5BU+4znx53pHH
        KTZLkIOuneZ1hIlzOlpBPuZ/KEikbE0Jw7G/vW8=
X-Google-Smtp-Source: APXvYqy4Gbri7Sa8hZ9OYGQrbFKiYv1S1whwQeBSq+UsFyNoHhdQ/VUp3V5UuP6KNjaHrLK+IwDl6t1Pw5KozK7AiL8=
X-Received: by 2002:a0c:d084:: with SMTP id z4mr16450999qvg.63.1567600853122;
 Wed, 04 Sep 2019 05:40:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1565962268.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1565962268.git.horms+renesas@verge.net.au>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 4 Sep 2019 14:40:36 +0200
Message-ID: <CAK8P3a0rQgEj9gQh-jyPOtoj+QVT2eeXz-vF0v5aKfnzWXP35g@mail.gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Fixes for v5.3
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     arm-soc <arm@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Aug 16, 2019 at 3:33 PM Simon Horman <horms+renesas@verge.net.au> wrote:
>
> are available in the git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-fixes-for-v5.3
>
> for you to fetch changes up to 45f5d5a9e34d3fe4140a9a3b5f7ebe86c252440a:
>
>   arm64: dts: renesas: r8a77995: draak: Fix backlight regulator name (2019-08-09 11:58:17 -0700)
>
> ----------------------------------------------------------------
> Renesas ARM Based SoC Fixes for v5.3
>
> * R-Car D3 (r8a77995) based Draak Board
>   - Correct backlight regulator name in device tree

I just found this pull request in the arm@kernel.org inbox, sorry for missing
it earlier. The 5.4 pull requests that Geert sent in the meantime are all
merged as they went to the new soc@kernel.org address.

Pulled this now into arm/fixes.

     Arnd
