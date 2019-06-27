Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1B30579B5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2019 04:55:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbfF0CzZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Jun 2019 22:55:25 -0400
Received: from mail-io1-f48.google.com ([209.85.166.48]:46752 "EHLO
        mail-io1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726760AbfF0CzY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Jun 2019 22:55:24 -0400
Received: by mail-io1-f48.google.com with SMTP id i10so1342203iol.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jun 2019 19:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BagUEWU4JMaHfO4zEh4KFO/Co7whzZQUVnKPwZipvek=;
        b=YGhLEWHgOxYUTi12mztc4zACgIfgOFXXQtwVCDQdgZZ5Idb6wRBZ6SHIcYyqtZOGvP
         Xvrdjqc6ovw7D82uYHVS63ATHXt2uHzigP8GDl+M4wO3mRX1pR87ESM0Af0gN2E+zdeC
         5aWa+HibGrO/Tpu2d+3ZbzBK2Nr2qzm12961fah4xcLctsMfF09nEG1X3NzXt9z9Yu1k
         vkGrEO9z+kI/+xT+QU+2ZuJbFN+Ep6M37aYvqsL+5nF/ZsyENcU5GQpP0JVaxG/qbdse
         CAgPGhMQYRUtdgYtBcaJFiRXgzxjGl7Pnkc7AWxasjIOZlKJP25fZHmHpXJlf9sUD7o8
         kHrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BagUEWU4JMaHfO4zEh4KFO/Co7whzZQUVnKPwZipvek=;
        b=poo6OlnHN9BADQc8Z7NySi28gMF59r6IGLLdM/6kPBoplkUo8G/k6SAir4u1ZonHpv
         m7zpjU0u+2oLBuMYZFYZd9lOMHw3oX7E2q3U2/ApW0RtgwcX5TjxpV5JmXij5cQokmj/
         XAlLNLB1eTvPKf0f7V3YK34nlNEHH73AzL7QmWMfWVlrEhLXedfSrIGbAT0kNonFiAjL
         xlBawswbn0CGtocYQ6aHqgJBYNwbfRdn3rperu1SNz8/LkC5NWxM2sDxDRgNHfuNGh+t
         ujD8CzV/abd03c3d6e6NdAqiHUhpHdG40IHXDte4Kkc0EeS0UAfLERETlArJyWJZ+PLi
         OHHA==
X-Gm-Message-State: APjAAAU8WOO9d5ZMOGEmH0cZCTM+3M66U7qQB6F7X3ivo73EYunAHCCn
        QxTuDLh0K5KMkurAhVy15p+nOMk2bPdCO2sagXPyNg==
X-Google-Smtp-Source: APXvYqyjwjH6PcvtE2d5Vc+6EVj/KlkhOIZ+KK8G/WFrida+Tfh6HoRg7rLd58y0rhwH3GzlJtI5y8fglRHWLesopwg=
X-Received: by 2002:a5d:9282:: with SMTP id s2mr1744443iom.36.1561604124107;
 Wed, 26 Jun 2019 19:55:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190626135422.eebzw2nosygkzhy3@verge.net.au>
In-Reply-To: <20190626135422.eebzw2nosygkzhy3@verge.net.au>
From:   Olof Johansson <olof@lixom.net>
Date:   Thu, 27 Jun 2019 10:55:12 +0800
Message-ID: <CAOesGMgvQTPm-7iyvbns+rCG54vtppJwSWbT20BuggUBRcwknA@mail.gmail.com>
Subject: Re: [Announce] Renesas SoC Co-Maintainer
To:     Simon Horman <horms@verge.net.au>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Kevin Hilman <khilman@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        ARM-SoC Maintainers <arm@kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Wed, Jun 26, 2019 at 9:54 PM Simon Horman <horms@verge.net.au> wrote:
>
> Hi,
>
> at the end of the v5.3 upstream kernel development cycle I will be stepping
> down from my role as Renesas SoC maintainer. And starting with the v5.4
> development cycle Geert Uytterhoeven will be taking over this role.
>
> I'd like to take a moment to thank everyone for the support that they have
> shown to me over the years. And for the contributions of many to allow
> the upstream kernel to support a wide range of features on a wide range
> of 32 and 64bit ARM based Renesas SoCs out of the box.
>
> Lastly, I'd like to wish Geert all the best in his new role.


Renesas has been a very high volume platform with lots of upstream
participation, and it's been running smoothly for a long time. That
takes a lot of work, even if it's not always visible.

Thanks a lot for all your work, Simon!

Geert -- feel free to find us on IRC or email if you have questions as
we get going. Sometimes it takes a few iterations to align workflows,
but you've probably been observing for a while already. :)


-Olof
