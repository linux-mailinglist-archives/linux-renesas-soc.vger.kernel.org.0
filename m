Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AF84A203C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2019 17:59:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbfH2P75 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Aug 2019 11:59:57 -0400
Received: from mail-40135.protonmail.ch ([185.70.40.135]:11399 "EHLO
        mail-40135.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727118AbfH2P75 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Aug 2019 11:59:57 -0400
Date:   Thu, 29 Aug 2019 15:59:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
        s=default; t=1567094393;
        bh=s0PahgYZsuit8sSrf7wTLbyTQ2qVGl52SRNMyg333Ks=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
         Feedback-ID:From;
        b=mp6rq7K16xOW7a7JH2Dr8zmKgqrqZJS+W/BULOYMGrphHtPcy5daClMOl6Q4hiJRD
         e9R3+q0XHsb8umldAcfRlZ07UoAdwKPQRFt3vq47DeDJL9vpTcPWluVtpADfdVMIPW
         UnvtbcKwpfiGxn5S7TxrzGhAF/r48M5evKTJpMVY=
To:     Geert Uytterhoeven <geert@linux-m68k.org>
From:   =?UTF-8?Q?Tam=C3=A1s_Sz=C5=B1cs?= <tszucs@protonmail.ch>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Reply-To: =?UTF-8?Q?Tam=C3=A1s_Sz=C5=B1cs?= <tszucs@protonmail.ch>
Subject: Re: [PATCH] mmc: sdhi: fill in actual_clock
Message-ID: <FaBiPuw0MFfdsj60MQTULROSN-8cSV7sNRlgO5SSVPo5jfQopmm9zTq4JT71VxaO32qdcAhisOrhFYG_QLByLNHcBrMgshsI_WwP9rlH2ms=@protonmail.ch>
In-Reply-To: <CAMuHMdWcp-3B7ZZjbyo02ECyzDX_rQxXF645OCutCkjUu_jWaA@mail.gmail.com>
References: <20190828185518.4340-1-tszucs@protonmail.ch>
 <CAMuHMdWcp-3B7ZZjbyo02ECyzDX_rQxXF645OCutCkjUu_jWaA@mail.gmail.com>
Feedback-ID: nIMxuco3ul2LtVHhzi8PphYHQLjwNa0SMoiI49kuTHKENnPWKUsinAdWedFtAsi63naFGY15tCjh3_itnNk3og==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM autolearn=ham
        autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

It would be possible to call clk_get_rate() unconditionally but there's usu=
ally no need, thus the ternary. Are you in favor of that though?

It turns out I need to send a followup to fix some glitches. Please stay tu=
ned.

Kind regards,
Tamas


Tam=C3=A1s Sz=C5=B1cs
tszucs@protonmail.ch

=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
On Thursday, August 29, 2019 9:47 AM, Geert Uytterhoeven <geert@linux-m68k.=
org> wrote:

> Hi Tam=C3=A1s,
>
> On Wed, Aug 28, 2019 at 9:02 PM Tam=C3=A1s Sz=C5=B1cs tszucs@protonmail.c=
h wrote:
>
> > Save set clock in mmc_host actual_clock enabling exporting it via debug=
fs.
> > This will indicate the precise SD clock in I/O settings rather than onl=
y the
> > sometimes misleading requested clock.
> > Signed-off-by: Tam=C3=A1s Sz=C5=B1cs tszucs@protonmail.ch
>
> Thanks for your patch!
>
> > --- a/drivers/mmc/host/renesas_sdhi_core.c
> > +++ b/drivers/mmc/host/renesas_sdhi_core.c
> > @@ -124,7 +124,7 @@ static unsigned int renesas_sdhi_clk_update(struct =
tmio_mmc_host *host,
> > {
> > struct renesas_sdhi *priv =3D host_to_priv(host);
> > unsigned int freq, diff, best_freq =3D 0, diff_min =3D ~0;
> >
> > -         int i, ret;
> >
> >
> >
> > -         int i;
> >
> >           /* tested only on R-Car Gen2+ currently; may work for others =
*/
> >           if (!(host->pdata->flags & TMIO_MMC_MIN_RCAR2))
> >
> >
> >
> > @@ -153,9 +153,11 @@ static unsigned int renesas_sdhi_clk_update(struct=
 tmio_mmc_host *host,
> > }
> > }
> >
> > -         ret =3D clk_set_rate(priv->clk, best_freq);
> >
> >
> >
> > -         host->mmc->actual_clock =3D
> >
> >
> > -                 clk_set_rate(priv->clk, best_freq) =3D=3D 0 ?
> >
> >
> > -                         best_freq : clk_get_rate(priv->clk);
> >
> >
>
> When clk_set_rate() returns 0 to indicate success, it may still have
> rounded the requested clock rate, no?
> So wouldn't it be better to always call clk_get_rate()?
>
> > -         return ret =3D=3D 0 ? best_freq : clk_get_rate(priv->clk);
> >
> >
> >
> > -         return host->mmc->actual_clock;
> >
> >
> >
> > }
>
> Gr{oetje,eeting}s,
>
> Geert
>
> ----------------------------
>
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
> -- Linus Torvalds


