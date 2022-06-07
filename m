Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB9F45423AB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jun 2022 08:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231472AbiFHBST (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Jun 2022 21:18:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1839250AbiFHACx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 20:02:53 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42EDD1D7865
        for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jun 2022 13:27:15 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:243a:e14b:d107:1f56])
        by baptiste.telenet-ops.be with bizsmtp
        id gLTC2700V1qF9lr01LTCXg; Tue, 07 Jun 2022 22:27:13 +0200
Received: from geert (helo=localhost)
        by ramsan.of.borg with local-esmtp (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nyfnE-0038Bk-D0; Tue, 07 Jun 2022 22:27:12 +0200
Date:   Tue, 7 Jun 2022 22:27:12 +0200 (CEST)
From:   Geert Uytterhoeven <geert@linux-m68k.org>
X-X-Sender: geert@ramsan.of.borg
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
cc:     Mark Brown <broonie@kernel.org>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 6/6] ASoC: ak4613: add TDM256 support
In-Reply-To: <878rskp9l0.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <alpine.DEB.2.22.394.2206072222390.746371@ramsan.of.borg>
References: <87h778p9mx.wl-kuninori.morimoto.gx@renesas.com> <878rskp9l0.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

 	Hi Morimoto-san,

On Tue, 5 Apr 2022, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> AK4613 has STEREO/TDM512/TDM256/TDM128 mode.
> Renesas is the only user of ak4613 on upstream for now,
> and is using it as STEREO mode, because of board connection.
> Thus, current driver is supporting STEREO mode only, and other
> modes are not supported.
>
> But I noticed that I can try first 2ch out of TDM256 mode 8ch
> Playback even in such a situation.
>
> But because of board connection, I can't test full TDM256 mode,
> and/or other TDM mode. Thus I don't want to add new DT propaty for now.
> This patch enables TDM256 mode test by "ifdef style",
> but it has no effect to current supported STEREO mode.
> You can define AK4613_ENABLE_TDM_TEST to try TDM256 mode.
>
> Please don't hesitate to break current code if you can add full TDM256
> and/or other TDM mode. You don't need to care compatibility with Renesas.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch, which is now commit f28dbaa958fbd8fb ("ASoC:
ak4613: add TDM256 support") in v5.19-rc1.

> --- a/sound/soc/codecs/ak4613.c
> +++ b/sound/soc/codecs/ak4613.c
> @@ -645,6 +851,29 @@ static void ak4613_parse_of(struct ak4613_priv *priv,
> 		if (!of_get_property(np, prop, NULL))
> 			priv->oc |= 1 << i;
> 	}
> +
> +	/*
> +	 * enable TDM256 test
> +	 *
> +	 * !!! FIXME !!!
> +	 *
> +	 * It should be configured by DT or other way
> +	 * if it was full supported.
> +	 * But it is using ifdef style for now for test
> +	 * purpose.
> +	 */
> +#if defined(AK4613_ENABLE_TDM_TEST)
> +	AK4613_CONFIG_SET(priv, MODE_TDM256);
> +#endif
> +
> +	/*
> +	 * connected STDI
> +	 */
> +	sdti_num = of_graph_get_endpoint_count(np);
> +	if (WARN_ON((sdti_num > 3) || (sdti_num < 1)))

This WARN_ON() is triggered on Ebisu-4D, as sdti_num = 0.
It can be reproduced by booting renesas-devel-2022-06-07-v5.19-rc1
using renesas_defconfig.

Sorry for not noticing before.

> +		return;
> +
> +	AK4613_CONFIG_SDTI_set(priv, sdti_num);
> }
>
> static int ak4613_i2c_probe(struct i2c_client *i2c,

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
