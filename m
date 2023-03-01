Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 676EB6A6BA4
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Mar 2023 12:24:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbjCALYe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Mar 2023 06:24:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbjCALYe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Mar 2023 06:24:34 -0500
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA1562917B;
        Wed,  1 Mar 2023 03:24:32 -0800 (PST)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id E8DAF40005;
        Wed,  1 Mar 2023 11:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1677669871;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NdQUXNQz7IbKbhXXN1a6Wk3GfwZH/3fYGstEBPCsKN8=;
        b=OJkh2y9Pltb71Qmi1Ef3tkgoFtdHwn3Vo7v+D0q4Tot/q1iG6imYWeWcq1lXA3MLSD9omk
        wqa0K3BRWx5BS2XSg2cH6FRwHuMX9z6MmPkifJcC5z+SskmHHLqMBfW7CkXmLNAqAhM57O
        9AZpQrDWNQFSpyshvJ7uDiBU7TFPCGILdUmalvey8g8IIP95QyHZPqcc/Qi1sQgKHsg8CA
        oeP/IT5O6OUJBHsRhGucfLAEcBqBH4cZvElubWmWjJFGwxrO/K3XKgu3yNJoY6tDRUEJ1w
        uvE7jU+51C9qWfb4ayC8rdjrZuckAOJQIUov8hbjVJkDwM1BxD6Ccx/1GI+o4A==
Date:   Wed, 1 Mar 2023 12:24:30 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Ralph Siemsen <ralph.siemsen@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 3/4] clk: renesas: r9a06g032: document structs
Message-ID: <20230301122430.4317530f@xps-13>
In-Reply-To: <20230227183937.377612-4-ralph.siemsen@linaro.org>
References: <20230227183937.377612-1-ralph.siemsen@linaro.org>
        <20230227183937.377612-4-ralph.siemsen@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Ralph,

ralph.siemsen@linaro.org wrote on Mon, 27 Feb 2023 13:39:35 -0500:

> Add some kerneldoc comments for the structures.
>=20
> Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
> ---
>=20
>  drivers/clk/renesas/r9a06g032-clocks.c | 36 +++++++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas=
/r9a06g032-clocks.c
> index 8a1ab9da19ae..1b7801f14c8c 100644
> --- a/drivers/clk/renesas/r9a06g032-clocks.c
> +++ b/drivers/clk/renesas/r9a06g032-clocks.c
> @@ -27,6 +27,26 @@
> =20
>  #define R9A06G032_SYSCTRL_DMAMUX 0xA0
> =20

Thanks for the change, I think it's always interesting to document a
bit more the code and strucs, I would like to offer a few proposals,
feel free to ignore if you disagree.

> +/**
> + * struct r9a06g032_gate - clock gate control bits
> + * @gate:   bit which enables/disables the clock

Is this really a bit? I see below you explain what each field means
in terms of offset/bitmask, so maybe we could be vague here,
something like:

"configuration to enable/disable the clock"

> + * @reset:  bit which controls module reset (active low)

"clock module reset" ?

> + * @ready:  bit which indicates device is ready for access

"the clock is stacle and the device fed should be ready for access"
(not sure about this one)

> + * @midle:  bit which requests to idle the NoC interconnect
> + *
> + * Each of these fields describes a single bit in a register,
> + * which controls some aspect of clock gating. The @gate field
> + * is mandatory, this one enables/disables the clock. The
> + * other fields are optional, with zero indicating "not used".
> + *
> + * In most cases there is a @reset bit which needs to be
> + * de-asserted to bring the module out of reset.
> + *
> + * Modules may also need to signal when the are @ready to
> + * handle requests (read/writes) from the NoC interconnect.
> + *
> + * Similarly, the @midle bit is used to idle the master.
> + */
>  struct r9a06g032_gate {
>  	u16 gate, reset, ready, midle;
>  	/* Unused fields omitted to save space */
> @@ -41,7 +61,21 @@ enum gate_type {
>  	K_DUALGATE	/* special for UARTs */
>  };
> =20
> -/* This is used to describe a clock for instantiation */
> +/**
> + * struct r9a06g032_clkdesc - describe a single clock
> + * @name:    string describing this clock
> + * @managed: boolan indicating if this clock should be

typo: boolean

> + *           start/stop as part of power management

started/stopped?

> + * @type:   see enum gate_type
> + * @index:  the ID of this clock element
> + * @source: the ID+1 of the parent clock element.
> + *          Root clock uses ID of ~0 (PARENT_ID);
> + * @gate:   describes the bits which control clock gate

I would just refer to the structure above (like @type).

No description of the following fields? :-) :-) It's okay, but while
you're at it...

> + *
> + * Describes a single element in the clock tree hierarchy.
> + * As there are quite a large number of clock elements, this
> + * structure is packed tightly to conserve space.
> + */
>  struct r9a06g032_clkdesc {
>  	const char *name;
>  	uint32_t managed:1;


Thanks,
Miqu=C3=A8l
