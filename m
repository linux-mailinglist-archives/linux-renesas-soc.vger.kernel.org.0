Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5ED13B93B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2019 18:18:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391533AbfFJQST (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Jun 2019 12:18:19 -0400
Received: from mail-ua1-f67.google.com ([209.85.222.67]:42281 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388932AbfFJQST (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jun 2019 12:18:19 -0400
Received: by mail-ua1-f67.google.com with SMTP id a97so1462029uaa.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jun 2019 09:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6g1amzGWWTQeL8UKEkhr7i0NSGU3hAL+N1/E/jI22oU=;
        b=HW2FcNkw1AyM5mPhc3BzCW7VqIn+zDEUsDp9c7wLJbnEl5Un7a0jKcvgDhCuVGJvGo
         Fnug+8k4fWm7ZtvyifH/b/IQcP6/Iy2gfvgzPn8J/lHw6SsKYNxdDCmUnV/Ho9cq35dH
         jfGEVMX7X8lKSt13GoNfNuhTkuur75bRrtI/VAvkbdVwhVHIBLIN+7BkTht9ZnVzZVXR
         qwECBLoyf5X9do7m9ExCrWzlHtJVNureBX8Y5fCqV/rMZDdO+1zJmR4GASXeA/nRkFje
         hqLVlcEv7+JuP5noiUFATLX4IaDQhJd8kke/VnDOw2mPm7tsgA4EdmheT7sfoquowH9O
         SfGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6g1amzGWWTQeL8UKEkhr7i0NSGU3hAL+N1/E/jI22oU=;
        b=Uca8sEJaw3SxCoghEAOy8m4HwpAQmqrUBEoIVXbdfhftCCTli5UpOwEw/mwo7e3aLn
         M8rApaHoj1ZUooXiFnuQ6dzHgHZWVtRzCcnpMfMDsPWVN2DU1VWzMfTF3ARmOoIl/pn5
         bHUwLvjb+nUm+ANS5KhoPVKHYcvZLSCf6k5SfgNKcAH2Z5V/1hFT8+wWLIMWqSAkQ4er
         02wwr2QBqIbB2G2AXHCtK9JjEqSgcMxBU82N++Cr5N9HMeD3/K2JDEMeXL0KGO5g9Ese
         ahp1YsF8qpw0coPl977qxxqzbYecE3yFdq4YMIjpTXBTuXAd8klR0KONiszXkKFxSlvh
         W9Vg==
X-Gm-Message-State: APjAAAWPbEV4up56+eo7PjtEzwycANs4do9r7spvsQXRaQbSKF0tfTGU
        PoFrvA0OaA1tMgqGp0stVQq7LJfwtuk/j4NSapVGU4Yk
X-Google-Smtp-Source: APXvYqxzift3FGWOoRmlryYDkKUogOyNP3CyhjdC9W22whl+Ilq7gSYSG/OUBCNzJMIhFO+RYFyExhE6ozK950Cek+4=
X-Received: by 2002:ab0:2705:: with SMTP id s5mr5731944uao.104.1560183498453;
 Mon, 10 Jun 2019 09:18:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190606113537.8869-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190606113537.8869-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 10 Jun 2019 18:17:42 +0200
Message-ID: <CAPDyKFr_LG5+kGnNstO7Q4rOy7hNJBDdqFmhDD5q2gMHCwxddA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] mmc: sdhi: improve HS400 quirk handling
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 6 Jun 2019 at 13:35, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> There are some more SoCs which cannot handle HS400. Add them and clean up the
> quirk handling a bit. So, patch 1 is suitable for stable, the rest isn't.
>
> Note that I don't have that HW, so I am relying on the provided information.
>
> Changes since v1 (thanks Geert and Fabrizio!):
>         * use '[012]' to specify the range instead of single entries
>         * add RZ/G2M to the list
>
> Wolfram Sang (3):
>   mmc: sdhi: disallow HS400 for M3-W ES1.2, RZ/G2M, and V3H
>   mmc: sdhi: improve quirk descriptions
>   mmc: sdhi: remove unneeded initialization
>
>  drivers/mmc/host/renesas_sdhi_core.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>

Applied patch 1 for fixes and by adding a stable tag, the rest is
applied for next, thanks!

Kind regards
Uffe
