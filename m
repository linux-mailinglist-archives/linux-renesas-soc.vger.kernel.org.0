Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D8FF112747
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2019 10:27:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbfLDJ1n (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Dec 2019 04:27:43 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:33793 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbfLDJ1n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Dec 2019 04:27:43 -0500
Received: by mail-oi1-f195.google.com with SMTP id l136so6268587oig.1;
        Wed, 04 Dec 2019 01:27:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Byu5dYNvd64Op069ydX6IXT3Tiy3gbShsqWFito6Ov4=;
        b=LvPUdNUhz8lZ42fjVI3eyMWpvW02/91CKYotoXq5gBfNUIjeUunF24XVclgZibLQeg
         Pib0g6EYVvpAUUe0tzMrt/sWAyP9mDQoTY1JAE08pH6q21QJJcmc+5D+d1g7DRzmivVS
         FDzZNVnHvnHhbg1wOJrEghjC3/B6RuLTy2WKKqKIrM+T38Hr1EM5i6Iy6wUahhe7ascC
         obihX/yIMGx2M1bvwqksw90Ibta5NHLIWe4jHMJj1ofZia6Lpz6Zckc5PkK7EX/QZLcb
         J3sfLCWuo6keKrt+VJYdif22NYyOmPj2RVeD4aaLHmeyIyUmfNtuomtDulcUTe9zoJgG
         MumQ==
X-Gm-Message-State: APjAAAWofIKPwzjzdJFbPpwJX2BHEjlAXuGfT/zZioHCN+OM0G4ldHOu
        0D5DxLyJWck6fb0ijOn85zQYjfY/O/Fb/ajGgdE=
X-Google-Smtp-Source: APXvYqwEBRMyPHU2aUl5tsWRPp2ujzLcWyS/Nn0Q/11y2IUcNPzq6CyUEfyDPQlZtokaDEjzZ8DVRvX9xzMGXMy3ofI=
X-Received: by 2002:aca:36c5:: with SMTP id d188mr1842431oia.54.1575451662665;
 Wed, 04 Dec 2019 01:27:42 -0800 (PST)
MIME-Version: 1.0
References: <20191203200513.1758-1-wsa+renesas@sang-engineering.com> <20191203200513.1758-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20191203200513.1758-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 4 Dec 2019 10:27:31 +0100
Message-ID: <CAMuHMdWri2OXa+Xg6ovrEvSGUuCZtfcCUqQ_=Jbz7v6q5D9-gg@mail.gmail.com>
Subject: Re: [PATCH 2/5] mmc: renesas_sdhi: make warning more precise
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Dec 3, 2019 at 9:05 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The warning is not solely used for SDR104 anymore, but for all which
> require tuning.
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
