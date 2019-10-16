Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CDB2D89D1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2019 09:36:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbfJPHgX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Oct 2019 03:36:23 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:38179 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726545AbfJPHgX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Oct 2019 03:36:23 -0400
Received: by mail-ot1-f66.google.com with SMTP id e11so19291052otl.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Oct 2019 00:36:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VKlKYK3Agmex6deuTVUQE83h0hGOdqjmBwzrY4fqhkw=;
        b=UcdaD6Uv3JfHnxO0pWW4C/hn+sQVMNejYPrBOu7gNsEkfunBwCGIGies7x9pa2V2Dm
         DN85PZN2loMzrqYIomapmHD85XitYAYEDGN+YFiaRUku/l94243FdNS79ejAeqPV9CT9
         f2veu7Ac/lHEjhFpEw/WljEOXcx4agG093Hfd+0+mzkUi5uhiLiWwwKlO+PFPTw1+vDL
         183+PacN4TZRRFpHZMBSYkMn1xc+tOSVuBfmzS8qs8x5ukpoAZ67Z+DOT08lEI65cTha
         xIVkBKQ3mkU4NY0MqYSOxChszfOjFZBXFQDUqkZAeUoawXki94som7SCaT3wu47eBNez
         Ez1g==
X-Gm-Message-State: APjAAAURRbIhjm4uLc77eCDDN290BvbSY6AAHh/0ywb/ZgyqvkkJQlTR
        5TrpXmG6YDh1s3BwP8Gamb+VlVagu0aETDsJCs8C17Mh
X-Google-Smtp-Source: APXvYqyyn5FBJqt67FRHYhBN2jsTn8BDc1bUJgGx284dUJ1pfQq3aX4htY8iyZow7JvzN9mlauSUGvyxLrINRvAYUyI=
X-Received: by 2002:a9d:70d0:: with SMTP id w16mr15675460otj.107.1571211381219;
 Wed, 16 Oct 2019 00:36:21 -0700 (PDT)
MIME-Version: 1.0
References: <1571137920-15314-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1571137920-15314-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1571137920-15314-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 16 Oct 2019 09:36:10 +0200
Message-ID: <CAMuHMdXCWcy_uX3-Z6Ao=ROTLM52Vxk=we-oKQ_H51hTem4n9Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] iommu/ipmmu-vmsa: Add helper functions for MMU
 "context" registers
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Joerg Roedel <joro@8bytes.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Oct 15, 2019 at 2:10 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Since we will have changed memory mapping of the IPMMU in the future,
> This patch adds helper functions ipmmu_ctx_{reg,read,write}()
> for MMU "context" registers. No behavior change.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
