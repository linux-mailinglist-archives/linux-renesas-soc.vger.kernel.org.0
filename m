Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FBED797430
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Sep 2023 17:36:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236017AbjIGPg0 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Sep 2023 11:36:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343654AbjIGPao (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Sep 2023 11:30:44 -0400
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7C1F1FDA;
        Thu,  7 Sep 2023 08:30:17 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-579de633419so11006347b3.3;
        Thu, 07 Sep 2023 08:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694100535; x=1694705335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IGdCm3ngn4AXhff3BrHDNP55N2x9eM/v8Yjzq97ZIQw=;
        b=HsomnAYn+M1bNtm/pmGN7agVOcmvQSz0sWdLVWXaptUlkeo4RHXI0Y/A+Z/px1qLjN
         B0PN/jvxCpewAtLWuRsh+rm9I2BdclBFfYh/BHwAsgjRfW4mdE8P53PEHXjsNYaMJPAW
         a/aDbCcpviTx6lk1Sdn0qp6HPdlKggdggzkuE5JN1CwC+IjUsaX5+Jej2KMpzOt8eThE
         j9P4OwEeT6jTHOmvGtefZuCNcRir/xVFD0OgRZyEg882Mzssi+0sljV82lbWQ/qgSapN
         gsSqq2Xc/9MKPQHMLJ8+tAPZHRYyn9n784H+1+R1i1JclBd7Y02eKDSeX0Bv5abgEk2c
         Qg9A==
X-Gm-Message-State: AOJu0Yxcyi51LO0z+5uc2zsIRvjRH/rb07kT3luiXCi3VXcki7ljSMVj
        ndKuWqt4rSlfkYgavkf2cPXTOqSASDpAhA==
X-Google-Smtp-Source: AGHT+IH1Kt2dgZnQZNqAjoXPvUTJYHzDfERDgvSAz1KAbJeKLaG0Do5KNmQM/G7Rb3Kfp2OGJUcsMA==
X-Received: by 2002:a25:778b:0:b0:d78:1360:a484 with SMTP id s133-20020a25778b000000b00d781360a484mr18585654ybc.57.1694081288608;
        Thu, 07 Sep 2023 03:08:08 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id e10-20020a25690a000000b00d7ba4c5e31fsm3733615ybc.39.2023.09.07.03.08.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Sep 2023 03:08:08 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-d7e87b4a0f2so739522276.0;
        Thu, 07 Sep 2023 03:08:08 -0700 (PDT)
X-Received: by 2002:a25:9387:0:b0:d7a:def7:b96a with SMTP id
 a7-20020a259387000000b00d7adef7b96amr16752501ybm.53.1694081288073; Thu, 07
 Sep 2023 03:08:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230905140008.136263-1-aymeric.aillet@iot.bzh>
In-Reply-To: <20230905140008.136263-1-aymeric.aillet@iot.bzh>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 7 Sep 2023 12:07:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX4-Bd8EvFE2U6YOL01LxAFg+uCjoD-sodXNgWuD9U5rg@mail.gmail.com>
Message-ID: <CAMuHMdX4-Bd8EvFE2U6YOL01LxAFg+uCjoD-sodXNgWuD9U5rg@mail.gmail.com>
Subject: Re: [PATCH 1/1] clk: renesas: Mark concerned clocks as "ignore_unused"
To:     Aymeric Aillet <aymeric.aillet@iot.bzh>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Aymeric,

On Tue, Sep 5, 2023 at 4:00 PM Aymeric Aillet <aymeric.aillet@iot.bzh> wrote:
> In order to avoid Linux from gating clocks that are used by
> another OS running at the same time (eg. RTOS), we are adding
> the "CLK_IGNORE_UNUSED" flag to the concerned clocks.
>
> As for now, list of clocks to be flagged have been completed
> depending of features that are supported by Renesas SoCs/boards
> port in Zephyr RTOS.
>
> Signed-off-by: Aymeric Aillet <aymeric.aillet@iot.bzh>

Thanks for your patch!

> --- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> @@ -288,6 +288,18 @@ static struct mssr_mod_clk r8a7795_mod_clks[] __initdata = {
>         DEF_MOD("scu-src0",             1031,   MOD_CLK_ID(1017)),
>  };
>
> +static const unsigned int r8a7795_ignore_unused_mod_clks[] __initconst = {
> +       MOD_CLK_ID(206),        /* SCIF1 */
> +       MOD_CLK_ID(303),        /* CMT0 */
> +       MOD_CLK_ID(310),        /* SCIF2 */
> +       MOD_CLK_ID(523),        /* PWM */
> +       MOD_CLK_ID(906),        /* GPIO6 */
> +       MOD_CLK_ID(907),        /* GPIO5 */
> +       MOD_CLK_ID(916),        /* CAN0 */
> +       MOD_CLK_ID(929),        /* I2C2 */
> +       MOD_CLK_ID(927),        /* I2C4 */

All of this is board-specific, so it cannot be handled in the SoC
clock driver.

E.g. scif2 is the main serial console for Linux on the Salvator-X(S)
and ULCB development
boards.
Pwm, gpio6, gpio5, i2c2, and i2c4 are used on Salvator-X(S).
I2c2 and i2c4 are also used on ULCB.
Scif1 and can0 are used on the KingFisher extension board for ULCB.

> --- a/drivers/clk/renesas/r8a779f0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
> @@ -168,6 +168,12 @@ static const struct mssr_mod_clk r8a779f0_mod_clks[] __initconst = {
>         DEF_MOD("ufs",          1514,   R8A779F0_CLK_S0D4_HSC),
>  };
>
> +static const unsigned int r8a779f0_ignore_unused_mod_clks[] __initconst = {
> +       MOD_CLK_ID(702),        /* SCIF0 */
> +       MOD_CLK_ID(704),        /* SCIF3 */
> +       MOD_CLK_ID(915),        /* PFC0 */

E.g. scif0 is available for use by Linux on the Spider development board.

> --- a/drivers/clk/renesas/renesas-cpg-mssr.h
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.h
> @@ -140,6 +140,10 @@ struct cpg_mssr_info {
>         unsigned int num_mod_clks;
>         unsigned int num_hw_mod_clks;
>
> +       /* Module Clocks that should not be gated */
> +       const unsigned int *ignore_unused_mod_clks;
> +       unsigned int num_ignore_unused_mod_clks;
> +
>         /* Critical Module Clocks that should not be disabled */
>         const unsigned int *crit_mod_clks;
>         unsigned int num_crit_mod_clks;

Even if this was considered a good solution, why couldn't these be
added to the existing crit_mod_clks[] array?

Fortunately, the Renesas SoC developers thought about this use case:
R-Car H3 has both System (SMSTPCRn) and Realtime  (RMSTPCRn) Module
Stop Control Registers, and a module clock is not gated unless it is
stopped in both sets.  Linux uses the System set, while an RTOS like
Zephyr running on the Cortex-R CPU core should use the Realtime set.
Note that that mechanism does not protect against both OSes changing
e.g. a divider for a parent clock.

R-Car S4-8 only has a single set of Module Stop Control Register
(MSTPCRn), but it does support multiple domains instead, and has Domain
x Write Access Control Register (DxWACR_yyy) to control access.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
