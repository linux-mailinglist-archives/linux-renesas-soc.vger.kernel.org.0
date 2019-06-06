Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00A5E374A6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 14:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728025AbfFFM6k (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 08:58:40 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33505 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726693AbfFFM6k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 08:58:40 -0400
Received: by mail-lj1-f194.google.com with SMTP id v29so1935173ljv.0;
        Thu, 06 Jun 2019 05:58:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O7awPU/yz1T2ye4jq/uDLv3hd9IqWGVRDNlCu7uyczA=;
        b=K+tVqE5XaT3JJf1arKAuPD8qBntVhz7uxGhqDy+/U0HInHLy3e94rb94asVC2Hmose
         9dvpO55neFNOEUK/KcEZ9UOjmkQ9Vn4gQk7BD2fRsTwuU6SZWf5zT9LaXfb9R+1grWmk
         XpU0KlsYZImqXcHK75vq5TfVwTmxXflNdZKO7b5B7Eyf91/g3gzYLdeoOoANdiv5ojC0
         EcmzJgzsPEUGkEfyYnKu6hut2zBDvtSh81k6kYiM6YZeSp0Ls8LBNDwThmykS/07AsVC
         8P2KA7rZpVz1HCPP4ZZ0pgmYfd9Gc/s58Iq+phk5kMEVlVhBAl+t5J0bkmgK005O7vJ1
         hrTw==
X-Gm-Message-State: APjAAAXABZlYYY5nHP4SQSBB5O+1lt8DjToPl5Z9X1JqJ9gOqz6OUsyY
        njwf7BprRNEy8gfSuSOkQ/qfMwOGQ4FTe34RpAM=
X-Google-Smtp-Source: APXvYqwL3waA7kHbJfQltEx/0sgqPoiVUOcrDG8lsFHIebvZsMmsz8VKmfaT7ci+ATnJIPEtaQJlSriuUKDG53B4DUE=
X-Received: by 2002:a2e:960e:: with SMTP id v14mr24893999ljh.31.1559825917962;
 Thu, 06 Jun 2019 05:58:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190606113537.8869-1-wsa+renesas@sang-engineering.com> <20190606113537.8869-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190606113537.8869-4-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 6 Jun 2019 14:58:25 +0200
Message-ID: <CAMuHMdXwX0Q6f38CPBabuD_ZDDhXNw8Q7tbae-Dmh8Q+pNuHZQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mmc: sdhi: remove unneeded initialization
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jun 6, 2019 at 2:36 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Bools are initialized to 'false' by default.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
