Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F3955A157
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2019 18:49:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbfF1Qtv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Jun 2019 12:49:51 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35865 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726605AbfF1Qtv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Jun 2019 12:49:51 -0400
Received: by mail-ot1-f67.google.com with SMTP id r6so6636411oti.3;
        Fri, 28 Jun 2019 09:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EdKyOYt7GxqyI93w7wTOY43fKPojuJCzB6lRbDEEVQw=;
        b=mr7LceUDwBl/+U19UnCLQ8Lj/y3/Qu5Ehs9fE3/xleTLmjm/huO5gf/UZ8uliu9Izf
         0ybspGKozpsi25GqiOUo1BI5rpWizQ/3ds/GnxyhOAkQGXwC3u86yzTeKT+wodC9YbOM
         IjhgobUgD69LX8O8ViqHTKo2eQm2iwN4EZjOIweMOZStr/DH2QAjYkJdvvw59zgpNSfl
         xDdlHIKUQPbE8boKdTRdapkVb8lQ/6v1S+8TQ4bjx3g6smQ0csjJgs05MYqWLPRCtJfr
         a+Xo1iCi1Wp3jMSd81izmTs9/ictALgD2xPonITZMfLs9w53XAHvTYW3ToiHWWcpLrE2
         8tFQ==
X-Gm-Message-State: APjAAAXTFMnND3QXykbNRhAeUO81dlA7MPpSkmN9rgxXDK8Pz0R9WcgB
        Q3+5dN80nWGmIT8W5nbsIoceSAggScpmqPF1nlY=
X-Google-Smtp-Source: APXvYqydCS9Wz3eqOLELLl0BF11GOFzU8MU9TU6xNjZ2CPL5wvuCPePuRC65qKXRBWadt21jFL+6lPAdhQs7cOXEDXM=
X-Received: by 2002:a9d:69ce:: with SMTP id v14mr9125219oto.39.1561740591002;
 Fri, 28 Jun 2019 09:49:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190628153448.4167-1-wsa+renesas@sang-engineering.com> <20190628153448.4167-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190628153448.4167-4-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 28 Jun 2019 18:49:39 +0200
Message-ID: <CAMuHMdVKtL-ZycpuXbR0ntibCgqXLL+h-us86kjCeBrOEd7feg@mail.gmail.com>
Subject: Re: [PATCH RFT 3/4] mmc: renesas_sdhi: make quirks info accessible
 outside probe()
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 28, 2019 at 5:35 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> We will need that for a later patch.
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
