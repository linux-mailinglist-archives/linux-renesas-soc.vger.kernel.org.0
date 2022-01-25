Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F3BB49B0E0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jan 2022 11:01:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231297AbiAYJuk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jan 2022 04:50:40 -0500
Received: from mail-vk1-f179.google.com ([209.85.221.179]:33403 "EHLO
        mail-vk1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236985AbiAYJo4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jan 2022 04:44:56 -0500
Received: by mail-vk1-f179.google.com with SMTP id 48so8847231vki.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jan 2022 01:44:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7Zauf+HIGa7tobUHKgZcgtgGR6f2wpo5lZUh5geR8Go=;
        b=XbYZWdD8bAgzfKN67o3d0iM3rrCChNx/70SEOPO06h/0jEu7ihmpExnI5IEV0NiBFN
         6umueDzHHs6Vtr5Y7xj5XTdlCo1iOM3qhdGdkZiCdMtYW6HRDB8LlvdS0ObKjv+EeXH2
         rZa3ZCkJRZUTeENoNiYaU2mZh1fMspQfBtl4eGH4wxv1M/NCFs6k2P0GpyQZzVzu442E
         MTFASZtxxDXLNgiWC1P0O7eYkwBonLtPRD+X/EPYJMtYcDBkxV7/s4Y7zBmp1lJI8MTJ
         zei+sTPt1yIaMazI3aHPnK16wsYn31/DVnJsKexgnLLj1vsxJAHlpXmXn1mO3WiGONlf
         diXg==
X-Gm-Message-State: AOAM533vITgYQ0xgTcMo68eoL2yY9p41jS6FbmhlGm/0t394/6iLA09e
        UMOOlN2ZBX7hHq54aNBrqtIlOdOS0bNFJQ==
X-Google-Smtp-Source: ABdhPJwh5TU74WsG1VzEejoGR1llFQJHCTrEKVoP+A/6UfLn/QJy+mQmd5uzDEUqD+k90U8rKHOr7Q==
X-Received: by 2002:a1f:5702:: with SMTP id l2mr7060539vkb.33.1643103891289;
        Tue, 25 Jan 2022 01:44:51 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id k28sm3083676vsb.31.2022.01.25.01.44.50
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jan 2022 01:44:51 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id b16so36306753uaq.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jan 2022 01:44:50 -0800 (PST)
X-Received: by 2002:a05:6102:a04:: with SMTP id t4mr1941033vsa.77.1643103890738;
 Tue, 25 Jan 2022 01:44:50 -0800 (PST)
MIME-Version: 1.0
References: <61ef5253.dX1h+KToNxbVl4p8%lkp@intel.com> <CAMuHMdX5cyS-q7ayp-5cXySdO1yREBUMc8MT9bJJHuXZ_rGqxQ@mail.gmail.com>
In-Reply-To: <CAMuHMdX5cyS-q7ayp-5cXySdO1yREBUMc8MT9bJJHuXZ_rGqxQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 25 Jan 2022 10:44:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVJ0+Gn0Ute5m=R67R7ogkOiub+eMXDcFjzO=4QddV3jg@mail.gmail.com>
Message-ID: <CAMuHMdVJ0+Gn0Ute5m=R67R7ogkOiub+eMXDcFjzO=4QddV3jg@mail.gmail.com>
Subject: Re: [geert-renesas-devel:master] BUILD SUCCESS 4ccda2778be03d61d70b8c8da55ef54d69a7f3cd
To:     kernel test robot <lkp@intel.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jan 25, 2022 at 10:44 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Tue, Jan 25, 2022 at 2:29 AM kernel test robot <lkp@intel.com> wrote:
> > tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
> > branch HEAD: 4ccda2778be03d61d70b8c8da55ef54d69a7f3cd  Merge branch 'renesas-next' into renesas-devel
> >
> > elapsed time: 736m
> >
> > configs tested: 133
> > configs skipped: 3
> >
> > The following configs have been built successfully.
> > More configs may be tested in the coming days.
> >
> > gcc tested configs:
> > arm                                 defconfig
> > arm64                            allyesconfig
> > arm64                               defconfig
>
> How come arm64/defconfig built successfully?

Sorry, allyesconfig.

> It is supposed to fail due to a missing file:
>
>     In file included from arch/arm64/boot/dts/renesas/r9a07g054l2.dtsi:9,
>                      from arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dts:9:
>     arch/arm64/boot/dts/renesas/r9a07g054.dtsi:9:10: fatal error:
> dt-bindings/clock/r9a07g054-cpg.h: No such file or directory
>         9 | #include <dt-bindings/clock/r9a07g054-cpg.h>
>           |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
