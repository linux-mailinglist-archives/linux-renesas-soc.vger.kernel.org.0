Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9DD149B0DF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jan 2022 11:01:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233736AbiAYJub (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jan 2022 04:50:31 -0500
Received: from mail-ua1-f44.google.com ([209.85.222.44]:43839 "EHLO
        mail-ua1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236910AbiAYJoT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jan 2022 04:44:19 -0500
Received: by mail-ua1-f44.google.com with SMTP id 2so36319989uax.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jan 2022 01:44:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tG+PhwrdWvZ0/pjVWL6fyTYlATFvYhpU0iYSURvp3Zg=;
        b=pppHFZzRf8sM1rcPpM59st/3pVLqUBcrCRbQckk5Y/nyz0f4M58/ehkFlkRNacfPFJ
         NbZXw64o4CUpNZgHe/tta7xMSdf1tAql542xZI38cUxKCNAf6PJquXM+TN0IuwXH6TCm
         awQPAmfbwmJNLyvfhV33OHNfF6E0JSKIpVH1bVUTaGFzu0ZzJHx90RhDP642huBVen9D
         nXDV/V69zf2zliclizqvwnDV++jBEcjqffGhJ+x8RVRqJBrYvMrFDQnPVyL1xeS1cjxa
         VRb7SCZ0ZFDfoNC+GZhbZul0q5whYIvdRsGbpV9vbqLO2Rrlp+AeZtPU/N/+PVP3LM0A
         xO9Q==
X-Gm-Message-State: AOAM531rz/kblQ45clezvsL+3h7ZUV9Z0+5KQLbRLYGRk8fb/yA7y59x
        AR2fJ3uFrxi0l5f+GL+90A3uljwCDrteSw==
X-Google-Smtp-Source: ABdhPJwJSpAhLFaHAnl7fQ5vuSpsJO2zwo2F6SVye4TDxzlECRBIcjlMYE0vUNE2R91mJJEfGOFODw==
X-Received: by 2002:a05:6130:411:: with SMTP id ba17mr8038810uab.70.1643103856545;
        Tue, 25 Jan 2022 01:44:16 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id d202sm910704vkd.38.2022.01.25.01.44.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jan 2022 01:44:16 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id y4so36322987uad.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jan 2022 01:44:16 -0800 (PST)
X-Received: by 2002:a9f:2070:: with SMTP id 103mr3752982uam.122.1643103856132;
 Tue, 25 Jan 2022 01:44:16 -0800 (PST)
MIME-Version: 1.0
References: <61ef5253.dX1h+KToNxbVl4p8%lkp@intel.com>
In-Reply-To: <61ef5253.dX1h+KToNxbVl4p8%lkp@intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 25 Jan 2022 10:44:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX5cyS-q7ayp-5cXySdO1yREBUMc8MT9bJJHuXZ_rGqxQ@mail.gmail.com>
Message-ID: <CAMuHMdX5cyS-q7ayp-5cXySdO1yREBUMc8MT9bJJHuXZ_rGqxQ@mail.gmail.com>
Subject: Re: [geert-renesas-devel:master] BUILD SUCCESS 4ccda2778be03d61d70b8c8da55ef54d69a7f3cd
To:     kernel test robot <lkp@intel.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kernel Test Robot,

On Tue, Jan 25, 2022 at 2:29 AM kernel test robot <lkp@intel.com> wrote:
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
> branch HEAD: 4ccda2778be03d61d70b8c8da55ef54d69a7f3cd  Merge branch 'renesas-next' into renesas-devel
>
> elapsed time: 736m
>
> configs tested: 133
> configs skipped: 3
>
> The following configs have been built successfully.
> More configs may be tested in the coming days.
>
> gcc tested configs:
> arm                                 defconfig
> arm64                            allyesconfig
> arm64                               defconfig

How come arm64/defconfig built successfully?
It is supposed to fail due to a missing file:

    In file included from arch/arm64/boot/dts/renesas/r9a07g054l2.dtsi:9,
                     from arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dts:9:
    arch/arm64/boot/dts/renesas/r9a07g054.dtsi:9:10: fatal error:
dt-bindings/clock/r9a07g054-cpg.h: No such file or directory
        9 | #include <dt-bindings/clock/r9a07g054-cpg.h>
          |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
