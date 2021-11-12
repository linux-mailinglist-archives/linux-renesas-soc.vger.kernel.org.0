Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0887044E74B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 14:27:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232441AbhKLNa2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 08:30:28 -0500
Received: from mail-ua1-f44.google.com ([209.85.222.44]:46621 "EHLO
        mail-ua1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231553AbhKLNa2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 08:30:28 -0500
Received: by mail-ua1-f44.google.com with SMTP id az37so18716811uab.13;
        Fri, 12 Nov 2021 05:27:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z9iJ184pTnCaa6ehbVjWTeQI8DGobiB3mmOI1dCbKMU=;
        b=teey8fICiOOi+3CM5QVgbQMF98wbXhaxTc8uDv81AuLqZmNRYOfwKLUQTn3GKSlo39
         rJSX9g1NMIp03A6w0TDI+IoErIULa9K69WDrXamcx5dwB7iT9/KoaKJ0TZ+e/gy64rwq
         HBKw5IMBMLqS4lXiWOfUdTg0euOdjplQXyUcnJExATPgn804tmb18H0TUBxL4WuDD6Lh
         2fQSYYIa8DAfbTyx+toC4Hd9ZyZRtFL/0ZHRind6z5pdPBMoKcMKUCv4/gu1Il/p5cRt
         RFWTUsAQGRLDKdZsGMpovguGzqC/T82kpeTYOHm39p+lvYa16aZ/JM1kiLSCxQ8sCaQA
         v0uw==
X-Gm-Message-State: AOAM532V/XC390uhj87BFf0y2CTQewLmOZ2s/iyqKbS3g8G4VdwznekS
        AXgJ7nD4IptR50sAxX68YtH2817RDoH6yw==
X-Google-Smtp-Source: ABdhPJz2kPCce4etSjfu8dZJ9sot+HF2CzsOyLLef4QKYowCgXjSuPrOSWlWKHPgYOu7HxQPAZAVCA==
X-Received: by 2002:a67:7247:: with SMTP id n68mr9630333vsc.6.1636723657044;
        Fri, 12 Nov 2021 05:27:37 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 15sm3959366vkj.49.2021.11.12.05.27.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 05:27:36 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id v3so18688237uam.10;
        Fri, 12 Nov 2021 05:27:36 -0800 (PST)
X-Received: by 2002:a67:c38f:: with SMTP id s15mr10047347vsj.50.1636723656538;
 Fri, 12 Nov 2021 05:27:36 -0800 (PST)
MIME-Version: 1.0
References: <20211110191610.5664-1-wsa+renesas@sang-engineering.com> <20211110191610.5664-11-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211110191610.5664-11-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 14:27:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVz8-kvyA0a8AW4uF9Tk-5GtuPLTtm9C6+-rEhSQ=+zZg@mail.gmail.com>
Message-ID: <CAMuHMdVz8-kvyA0a8AW4uF9Tk-5GtuPLTtm9C6+-rEhSQ=+zZg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 10/21] arm64: dts: reneas: r8a774c0: add SDnH clocks
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Nov 10, 2021 at 8:16 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
