Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 054B1551310
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jun 2022 10:42:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238955AbiFTImt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Jun 2022 04:42:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239962AbiFTIml (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Jun 2022 04:42:41 -0400
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9391812AE5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jun 2022 01:42:39 -0700 (PDT)
Received: by mail-qv1-f45.google.com with SMTP id 88so11462527qva.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jun 2022 01:42:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YPfcx0hLdJvxVGTg7D/grK7CC6kTQDm14uyraFlQ4VQ=;
        b=IUoTgPwDpOrhsYIEhlQAhfFFxJ0A+dMSBx40PgQyYTiEf7WdmbThU+A0+CDChOyiI+
         3ZMdjwWMZdptCZYrg0KvTrWb0mfHEQknZ5oWe0YvPTn+lCsesrdOYkkRaRlL/bvUdIRR
         jSE89K6CFixRklbLa78NdFRFWrGK/BHRGNZmI/V+mDgl0bivIn+TPi/Xf6wVM3VbyQFI
         /PQgh8krwLjQQtw/NQNUKkFlkB3hwDs3hA/T/U6M56+pcXsDG92dTBzeAG+erwQdD2m9
         WJp17HlWBshq7xQR5vd9cbHz8Z7pakYgotyFPgg9m2qE4/HeTEwFOUCrlP0CYzQlEuI1
         yCVw==
X-Gm-Message-State: AJIora/Be2nsaFsecDlPETxdE2yAr5tRiQTuPUuIVaWDjyeQh6Kjbgwt
        9k4q2bmS3aL62raQmKeyJCAOICrycmaRMg==
X-Google-Smtp-Source: AGRyM1sKOwjc+bOmBR8DazNPBFcKYn5mxb4hzUrMalNsll+4D603/RG+FLjD4biEWzIVzGQDtHIPuQ==
X-Received: by 2002:ac8:7c4d:0:b0:305:96:cc8a with SMTP id o13-20020ac87c4d000000b003050096cc8amr18791923qtv.245.1655714558876;
        Mon, 20 Jun 2022 01:42:38 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id x23-20020ae9e917000000b0069fc13ce1f2sm11015129qkf.35.2022.06.20.01.42.38
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 01:42:38 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-3177e60d980so71460747b3.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jun 2022 01:42:38 -0700 (PDT)
X-Received: by 2002:a81:574c:0:b0:317:7c3a:45be with SMTP id
 l73-20020a81574c000000b003177c3a45bemr20102235ywb.316.1655714558230; Mon, 20
 Jun 2022 01:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <202206191333.YmgTGPjZ-lkp@intel.com>
In-Reply-To: <202206191333.YmgTGPjZ-lkp@intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 20 Jun 2022 10:42:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUEQkGr22WcpPuJr_Zqrx5djCcH7ocjSQfiaqfpx8aRmA@mail.gmail.com>
Message-ID: <CAMuHMdUEQkGr22WcpPuJr_Zqrx5djCcH7ocjSQfiaqfpx8aRmA@mail.gmail.com>
Subject: Re: [geert-renesas-drivers:renesas-clk-for-v5.20 14/19]
 drivers/clk/renesas/clk-r8a7779.c:137 r8a7779_cpg_clocks_init() warn:
 possible memory leak of 'data'
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kbuild@lists.01.org, kbuild test robot <lkp@intel.com>,
        kbuild-all@lists.01.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa-dev@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Dan,

On Mon, Jun 20, 2022 at 10:39 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v5.20
> head:   080bcd8d5997b1a615e17cab02bd9d16d1d4fbf3
> commit: 444877983933d0efaf6788eabf2f750b1c175419 [14/19] clk: renesas: r8a7779: Remove struct r8a7779_cpg
> config: parisc-randconfig-m031-20220619 (https://download.01.org/0day-ci/archive/20220619/202206191333.YmgTGPjZ-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 11.3.0
>
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> smatch warnings:
> drivers/clk/renesas/clk-r8a7779.c:137 r8a7779_cpg_clocks_init() warn: possible memory leak of 'data'
>
> vim +/data +137 drivers/clk/renesas/clk-r8a7779.c
>
> 7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-04-18  113  static void __init r8a7779_cpg_clocks_init(struct device_node *np)
> 7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-04-18  114  {
> 7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-04-18  115    const struct cpg_clk_config *config;
> 444877983933d0 drivers/clk/renesas/clk-r8a7779.c  Geert Uytterhoeven 2022-06-08  116    struct clk_onecell_data *data;
> 7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-04-18  117    struct clk **clks;
> 7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-04-18  118    unsigned int i, plla_mult;
> 7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-04-18  119    int num_clks;
> 931db8a0c646e2 drivers/clk/renesas/clk-r8a7779.c  Geert Uytterhoeven 2016-06-01  120    u32 mode;
> 931db8a0c646e2 drivers/clk/renesas/clk-r8a7779.c  Geert Uytterhoeven 2016-06-01  121
> 931db8a0c646e2 drivers/clk/renesas/clk-r8a7779.c  Geert Uytterhoeven 2016-06-01  122    if (rcar_rst_read_mode_pins(&mode))
> 931db8a0c646e2 drivers/clk/renesas/clk-r8a7779.c  Geert Uytterhoeven 2016-06-01  123            return;
> 7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-04-18  124
> 7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-04-18  125    num_clks = of_property_count_strings(np, "clock-output-names");
> 7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-04-18  126    if (num_clks < 0) {
> 7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-04-18  127            pr_err("%s: failed to count clocks\n", __func__);
> 7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-04-18  128            return;
> 7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-04-18  129    }
> 7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-04-18  130
> 444877983933d0 drivers/clk/renesas/clk-r8a7779.c  Geert Uytterhoeven 2022-06-08  131    data = kzalloc(sizeof(*data), GFP_KERNEL);
> 6396bb221514d2 drivers/clk/renesas/clk-r8a7779.c  Kees Cook          2018-06-12  132    clks = kcalloc(CPG_NUM_CLOCKS, sizeof(*clks), GFP_KERNEL);
> 444877983933d0 drivers/clk/renesas/clk-r8a7779.c  Geert Uytterhoeven 2022-06-08  133    if (data == NULL || clks == NULL) {
> 7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-04-18  134            /* We're leaking memory on purpose, there's no point in cleaning
> 7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-04-18  135             * up as the system won't boot anyway.
> 7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-04-18  136             */
> 7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-04-18 @137            return;

I think the comment says it all ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
