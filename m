Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 736F56A6CA3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Mar 2023 13:58:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbjCAM6O (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Mar 2023 07:58:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjCAM6N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Mar 2023 07:58:13 -0500
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C9581423A;
        Wed,  1 Mar 2023 04:58:10 -0800 (PST)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 41E0F240006;
        Wed,  1 Mar 2023 12:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1677675489;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2mQBBpt3PKubIpiBGD9ZENW/fR8oM7+9T5/Mly1KOjE=;
        b=f2DY5eZ6lUEXFlR6KHZI6SHqf9DAdqtYFXhtJCvpvy2ub67E6g9q+jdesZqfY5C/rh1sQT
        L0SDRBjd8gfAIhpF4SwTVD9++/4lVdQhi3vTc1nNWd2nUR/cO2rgxkrACmb6CaQwndOH0t
        CpqLft0Ntb4BTu7PfkWd/McZe+R2UnbncI8NrMuPjNm9o1wENkDOmFd1XGCPx2QxEDLLh4
        jowURkqGL0Os9NudWKac+Q60K0Q5f1gGQyV/bchg7elmaE40yROhGILh7Q2861b06ixZMx
        Dscoz1P+Q6nTPaGP9A3JvMTie2C2gA+wkYsqBZwVv4VGFny4y21Ec03TJqblew==
Date:   Wed, 1 Mar 2023 13:58:08 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Ralph Siemsen <ralph.siemsen@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 4/4] clk: renesas: r9a06g032: improve clock tables
Message-ID: <20230301135808.6fefe5b9@xps-13>
In-Reply-To: <20230227183937.377612-5-ralph.siemsen@linaro.org>
References: <20230227183937.377612-1-ralph.siemsen@linaro.org>
        <20230227183937.377612-5-ralph.siemsen@linaro.org>
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

ralph.siemsen@linaro.org wrote on Mon, 27 Feb 2023 13:39:36 -0500:

> Each entry in the clock table specifies a number of individual bits in
> registers, for contolling clock reset, gaiting, etc. These reg/bit were
> packed into a u16 to save space. The combined value is difficult to
> understand when reviewing the clock table entries.

I totally agree.

> Introduce a "struct regbit" which still occupies only 16 bits, but
> allows the register and bit values to be specified explicitly. Convert
> all previous uses of u16 for reg/bit into "struct regbit".

I was sure the structure would be bigger than 2B but yeah, gcc seems to
keep it small. However if at some point we add another member, we
might consider packing it.

> The bulk of this patch converts the clock table to use struct regbit,
> making use of the RB() helper macro. The conversion was automated by
> script, and as a further verification, the compiled binary of the table
> was compared before/after the change (with objdump -D).

I will trust your tool on the conversion.

> The clk_rdesc_set() function now checks for zero reg/bit internally.
> This allows callers of that function to remove those checks.
>=20
> Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
> ---
>=20
>  drivers/clk/renesas/r9a06g032-clocks.c | 564 ++++++++++++++++++-------
>  1 file changed, 410 insertions(+), 154 deletions(-)
>=20
> diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas=
/r9a06g032-clocks.c
> index 1b7801f14c8c..f5d12d8f1b22 100644
> --- a/drivers/clk/renesas/r9a06g032-clocks.c
> +++ b/drivers/clk/renesas/r9a06g032-clocks.c
> @@ -27,6 +27,34 @@
> =20
>  #define R9A06G032_SYSCTRL_DMAMUX 0xA0
> =20
> +/**
> + * struct regbit - describe one bit in a register
> + * @reg: offset of register relative to base address,
> + *          expressed in units of 32-bit words (not bytes),
> + * @bit: which bit (0 to 31) in the register
> + *
> + * This structure is used to compactly encode the location
> + * of a single bit in a register. Five bits are needed to
> + * encode the bit number. With uint16_t data type, this
> + * leaves 11 bits to encode a register offset up to 2047.
> + *
> + * Since registers are aligned on 32-bit boundaries, the
> + * offset will be specified in 32-bit words rather than bytes.
> + * This allows encoding an offset up to 0x1FFC (8188) bytes.
> + *
> + * Helper macro RB() takes care of converting the register
> + * offset from bytes to 32-bit words.
> + */
> +struct regbit {
> +	u16 reg:11;
> +	u16 bit:5;
> +};
> +
> +#define RB(_reg, _bit) ((struct regbit) { \
> +	.reg =3D (_reg) >> 2, \

Here and below, I would really prefer a "* 4" and a "/ 4". IMHO
shifts should stay reserved to bit operations. Here, what we want
is to convert a 1-byte offset into a 4-byte offset, thus the operation
is a multiplication. Even in -O0, all compilers would convert this into
a shift operation in the end. I believe we shall not sacrifice
readability in situations like that, were the optimization is trivial
for the tools.

> +	.bit =3D (_bit) \
> +})

[...]

> =20
>  struct r9a06g032_priv {
> @@ -419,26 +677,30 @@ int r9a06g032_sysctrl_set_dmamux(u32 mask, u32 val)
>  }
>  EXPORT_SYMBOL_GPL(r9a06g032_sysctrl_set_dmamux);
> =20
> -/* register/bit pairs are encoded as an uint16_t */
> -static void
> -clk_rdesc_set(struct r9a06g032_priv *clocks,
> -	      u16 one, unsigned int on)
> +static void clk_rdesc_set(struct r9a06g032_priv *clocks,
> +			  struct regbit rb, unsigned int on)
>  {
> -	u32 __iomem *reg =3D clocks->reg + (4 * (one >> 5));
> -	u32 val =3D readl(reg);
> +	u32 offset =3D rb.reg << 2;

Same here.

> +	u32 bit =3D rb.bit;
> +	u32 __iomem *reg;
> +	u32 val;
> =20
> -	val =3D (val & ~(1U << (one & 0x1f))) | ((!!on) << (one & 0x1f));
> +	if (!offset && !bit)

'bit' being an offset, is it correct to refuse writing BIT(0) ?

> +		return;
> +
> +	reg =3D clocks->reg + offset;
> +	val =3D readl(reg);

Could you unify the how reg is accessed here and below? I think I have
a slight preference for:

u32 __iomem *reg =3D clocks->reg + (rb.reg * 4);

Thanks,
Miqu=C3=A8l
