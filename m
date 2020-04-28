Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B51F1BC16D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2020 16:36:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727124AbgD1Oge (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Apr 2020 10:36:34 -0400
Received: from mail-oo1-f67.google.com ([209.85.161.67]:44484 "EHLO
        mail-oo1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727122AbgD1Ogc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Apr 2020 10:36:32 -0400
Received: by mail-oo1-f67.google.com with SMTP id p67so4708853ooa.11;
        Tue, 28 Apr 2020 07:36:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xxIKi5iDI55wdhi1KIGfVexmNRIE3bS131i3YZ1d/2M=;
        b=eKEZGQtrFrS9Mij4xvKsSDibwko3kZJrTJ0qxwD0lEwMmyHFYSeZm7YqWsEZucKN9a
         ik4uxFK/C6YtuW16AV0hIT3KGt8M+7DN91mWM+0Pz1zLiIOP3AePEKCgbOFigG0FNZo0
         wnVlpnyuSdB9HwkAjfT1neuYwq2cS3KbjxX6yY67e5TUho5TJVnPWha+xwz5t66v+5Ei
         wZKtVZuE0OoIEtlfcJO0yaAgp8l3uGmsKjZS8B+KGHpZoQt93FlPrkyDWX4GXZSMx3Id
         fga4LTxc5DcibMJu1emq2XU1lP6+IednnJUM+XxcYeJSPyhRjWGTW2L6LncGHCQcE1QS
         sn2g==
X-Gm-Message-State: AGi0PuasGY1vNPWhDYo+hFNhPXOYz1IFNZJZvPRMQabLB+Ykt+A1AqKe
        4VHQACI5L3mFR/dD8srN86pi+UKokhyLSx9MlfM=
X-Google-Smtp-Source: APiQypJJHE4iw9q62VxVYdpxPzCPkCktSHmeW9ThpyTpTlpnife/ElAKMojM9kIW5+D41AjYKimV3ZBswLAT6J+OPlU=
X-Received: by 2002:a4a:eb08:: with SMTP id f8mr23328962ooj.1.1588084591983;
 Tue, 28 Apr 2020 07:36:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200428141716.87958-1-weiyongjun1@huawei.com>
In-Reply-To: <20200428141716.87958-1-weiyongjun1@huawei.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 28 Apr 2020 16:36:19 +0200
Message-ID: <CAMuHMdU0Chy6vmHBc6xqKZ3uQ=3NxZeZ7gt7FvCOLWh--Gcxdg@mail.gmail.com>
Subject: Re: [PATCH -next] drm/rcar-du: Fix return value check in rcar_du_cmm_init()
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Apr 28, 2020 at 4:16 PM Wei Yongjun <weiyongjun1@huawei.com> wrote:
> In case of error, the function of_parse_phandle()/of_find_device_by_node()
> returns NULL pointer not ERR_PTR(). The IS_ERR() test in the return value
> check should be replaced with NULL test
>
> Fixes: 8de707aeb452 ("drm: rcar-du: kms: Initialize CMM instances")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
