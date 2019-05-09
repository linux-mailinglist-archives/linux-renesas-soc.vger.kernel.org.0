Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3EFC18786
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 May 2019 11:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbfEIJNM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 May 2019 05:13:12 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:38955 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbfEIJNL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 May 2019 05:13:11 -0400
Received: by mail-ua1-f66.google.com with SMTP id v7so525685ual.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 May 2019 02:13:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CO1LDZcUUMtjwZ95rDpATUzOWfNRdSzsVTky9zlt1Ic=;
        b=VmdMZyGgAc0adhAGMNlsVO4l9JK0ZCSzgvxODZDC7iRBnCOmIoxSd5AerjSYKyc6zI
         Yi/Ac6vTKZV/fQaH/5zLwjq5tTq8Yz7Lb3WRAYXVu0ASgGAelXVF/JAzHcSNDVGwssd/
         aLGjO+i4JjmeTbqOf5+hi7r9Rea/75ILWKbUhKSSr3j8njjq+VRJ5I7mpF7ge3xw0WbE
         2+rVG+HmlQQ+smm5ErULByC+eA/mhUjK4Ez4yATdV5vin7ElOCUKm3svnJTkR1Ig0AKE
         CGFFsKvTeUa7snxpc/SIwy08xJa5o0Pr88FByDZV/ddK9IZU5WJyn/qj6E/MpXxoETjb
         xYTA==
X-Gm-Message-State: APjAAAXG3955qj5PghEAuP1SlfD48w2gufBh1BA2MFj3cOaB6rg9gXmV
        cq73ocgHU2eCKD1ND+Hw4LuIjKv9de0KnSLFP64=
X-Google-Smtp-Source: APXvYqzufhoQ+k0HSckXtOh8O01ekYsPnrH8qK/yHxFzvydgKu+M1is8fbfiy9xeQn0VzL04yWna5fPDol64nUYBPuM=
X-Received: by 2002:ab0:1646:: with SMTP id l6mr1228439uae.75.1557393190841;
 Thu, 09 May 2019 02:13:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190508173428.22054-1-jacopo+renesas@jmondi.org> <20190508173428.22054-9-jacopo+renesas@jmondi.org>
In-Reply-To: <20190508173428.22054-9-jacopo+renesas@jmondi.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 9 May 2019 11:12:59 +0200
Message-ID: <CAMuHMdV5AWLng+kLyiK-UHO2HRrGCPYsW=HgmwQNWqfyv+_Ugg@mail.gmail.com>
Subject: Re: [RFC 8/9] clk: renesas: r8a7796: Add CMM clocks
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        Jacopo Mondi <jacopo@jmondi.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, May 8, 2019 at 8:27 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> Add clock defintions for CMM units on Renesas R-Car Gen3 M3-W.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
