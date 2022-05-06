Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B607F51D202
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 May 2022 09:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389411AbiEFHO4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 May 2022 03:14:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353349AbiEFHO4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 May 2022 03:14:56 -0400
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22C8E66C9F
        for <linux-renesas-soc@vger.kernel.org>; Fri,  6 May 2022 00:11:14 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id fu47so5324060qtb.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 May 2022 00:11:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FaBoTxbndWvtJyrVKRmeaM3VoQdc7soHwh2HyGnfUP8=;
        b=KXoUti2Qd0e07DY3cjLLTuo9vs6t1XEZxtNiaV6EUSpdhiUFBcuFw0f8s4okRH0DKX
         pkqbe45HmHwhvnVHqFeWmo4f/MhW6e6w8ZO0yEATrcy9XlscW+upQOSpYe/OoPkpV+Av
         8ghwQoAPFeanxmUdrSJGgMt8MnN55W3EdBXNJUvoZysHoSP2UyGdhn51o6gGHK/ph9zc
         um0UMLyxPi4+Vy6sEis0xRRukafdP8mNqlPz9dkJKRpT2a2y3KDxX2HLQfo7laOleltH
         Wy6lE5QOfTYsqvuBl1gKzdevYec5I5KzblzQEk1ZP9/g3lxwl01X8uM8bNOc1S3cBOWR
         DQVA==
X-Gm-Message-State: AOAM530bJoRfoIlmC+is8TIz8NamZVTl19IfxNgrQbhoJh/SNmjgRkXv
        h8iyDHs5kRVo0v0mNu+6x3YTHvH5XQEOMw==
X-Google-Smtp-Source: ABdhPJx5wDWDKGnFUJtBVKmmjZ6xMIo0EBnIHRGXYUJXckKiRgnP2b9xBpcudB5B4TX0aPny4cYKwQ==
X-Received: by 2002:a05:622a:611:b0:2f3:8454:edcd with SMTP id z17-20020a05622a061100b002f38454edcdmr1500659qta.297.1651821072901;
        Fri, 06 May 2022 00:11:12 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id s28-20020a05622a1a9c00b002f1f934bedfsm2405645qtc.3.2022.05.06.00.11.12
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 May 2022 00:11:12 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-2ef5380669cso71694837b3.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 May 2022 00:11:12 -0700 (PDT)
X-Received: by 2002:a81:9b0c:0:b0:2f4:c522:7d3c with SMTP id
 s12-20020a819b0c000000b002f4c5227d3cmr1470743ywg.316.1651821072171; Fri, 06
 May 2022 00:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <202205061401.IHqhpmgm-lkp@intel.com>
In-Reply-To: <202205061401.IHqhpmgm-lkp@intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 6 May 2022 09:11:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtBL1NnizN=6o8rpoiEFPEj+ymrr8303LZkSTd99Dafg@mail.gmail.com>
Message-ID: <CAMuHMdXtBL1NnizN=6o8rpoiEFPEj+ymrr8303LZkSTd99Dafg@mail.gmail.com>
Subject: Re: [geert-renesas-drivers:renesas-clk-for-v5.19 46/47]
 drivers/clk/renesas/r9a09g011-cpg.c:118:9: sparse: sparse: Using plain
 integer as NULL pointer
To:     kernel test robot <lkp@intel.com>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>, kbuild-all@lists.01.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, May 6, 2022 at 8:56 AM kernel test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v5.19
> head:   2e0e144796fb5cfa637384f1e3ffc045c40bc4ca
> commit: 6bca154251df4bdc32391965a49d90e143f272ff [46/47] clk: renesas: Add RZ/V2M support using the rzg2l driver
> config: parisc-randconfig-s032-20220506 (https://download.01.org/0day-ci/archive/20220506/202205061401.IHqhpmgm-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 11.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # apt-get install sparse
>         # sparse version: v0.6.4-dirty
>         # https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?id=6bca154251df4bdc32391965a49d90e143f272ff
>         git remote add geert-renesas-drivers https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
>         git fetch --no-tags geert-renesas-drivers renesas-clk-for-v5.19
>         git checkout 6bca154251df4bdc32391965a49d90e143f272ff
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=parisc SHELL=/bin/bash drivers/clk/renesas/
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
>
> sparse warnings: (new ones prefixed by >>)
> >> drivers/clk/renesas/r9a09g011-cpg.c:118:9: sparse: sparse: Using plain integer as NULL pointer

Thanks, I will amend the offending commit.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
