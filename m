Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2EED3D5BCB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jul 2021 16:37:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234557AbhGZN4m (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Jul 2021 09:56:42 -0400
Received: from mail-vs1-f47.google.com ([209.85.217.47]:34807 "EHLO
        mail-vs1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234419AbhGZN4i (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Jul 2021 09:56:38 -0400
Received: by mail-vs1-f47.google.com with SMTP id y18so5340801vsc.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jul 2021 07:37:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vs5ogcduc6XNoQIqg2ksL+90hIR+gm5vskbJqAmY8Cg=;
        b=Y4bc6tUMMByN7H+gpn6Atur7OUqunstpifezf6cxCDnpW57KLIyTAIcae4i4HIYWTT
         QViDZyo2mg0iz06xbO+C//mazHEMWvNIXWPthufJVUNc8kpqfoTU10krERQnbUaSUcaZ
         Gvi/YUlzA4/UNTZYO1L+dDiqW50UTK80qgfpudffL5Fiq6HKmEU4DtU9gH6VMC+RfAZE
         tzzPX7y47QK9HRRNdkK6Cili9sTUxk8DM3dPkcXwwhWGHKkEjDiQ8cJmmIH2LdePYo48
         jZOj2ZBuNN3nyRzp7ljlYLofsIWzUlpwGkoRcHRY3WqU7Uh+TG5ttGO1MyXbT0Z0HDoQ
         07TA==
X-Gm-Message-State: AOAM530MmUgUqaAca8+aRP5lCZkRLN2xhny0D4Z7oVgJvzgr5Z6djmww
        xfB2avV5hoZqmhf78KThLAJOZsYzLBSQx8nkrlA=
X-Google-Smtp-Source: ABdhPJzCUYq5Oe+AtCFFo9p9awa1xNdMgSXVKJ0CoAgPWCI16arxA3iumzHheMGNl/fbObHXqK6D8Kzy5SGM9k7YC/c=
X-Received: by 2002:a05:6102:4a3:: with SMTP id r3mr1364051vsa.42.1627310225551;
 Mon, 26 Jul 2021 07:37:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210721111247.849825-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20210721111247.849825-1-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 26 Jul 2021 16:36:54 +0200
Message-ID: <CAMuHMdWGs+CBAO78xxgB_7s4gvQeOEiJJDieuD+5z+Kjwk0m4w@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a77961: Add iommus to
 ipmmu_ds[01] related nodes
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Wed, Jul 21, 2021 at 1:13 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> This patch adds iommus properties to ipmmu_ds[01] related nodes
> (avb, dmac and sdhi) of r8a77961.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Changes from v1:
>  - Add other iommus to ipmmu_ds[01] related nodes.
>  https://lore.kernel.org/linux-renesas-soc/20210714090843.438076-1-yoshihiro.shimoda.uh@renesas.com/

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
