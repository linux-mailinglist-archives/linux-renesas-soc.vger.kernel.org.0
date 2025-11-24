Return-Path: <linux-renesas-soc+bounces-25091-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7000CC81E96
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 18:34:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6346C4E615D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 17:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 654AC276028;
	Mon, 24 Nov 2025 17:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cSMluTDn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4025926AA93
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 17:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764005656; cv=none; b=hVaTqq5qFaaTW7GCUQZmzt3o1+qXwP0tMw0ihPf5kMhfVGpi15DzWuW4vwxhPvM8O00kc2BhqucnnFRAeK8lPriKzSp/EbEFvHB7IBNSipsSqnpbpF3NtRs3DpIqH5DDf3YtpwRJS/2WpDtXAA/VN8x53Wh8FmoXN4x/XjsxL9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764005656; c=relaxed/simple;
	bh=QrwrudDXcmBwv5MpjExmSZyNDnG2x6mJE3eaNfxGUrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s30i8ae+c3vfhhGMIGpu/oeUoUwE7j3A+exO54btcq1zOz65sQ63WJl2JQp15cmHiKQL9WpQcTdwR58sOyeYYAw09jo0+1cDXPOfXdGSSy2WcH1SKh/YQunOdSdsj1qDSzTruRXCfQYqBTtsPVXOhULkOPm9j0d6ng1zqoCbtOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cSMluTDn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 161F8C2BCB2
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 17:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764005656;
	bh=QrwrudDXcmBwv5MpjExmSZyNDnG2x6mJE3eaNfxGUrk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cSMluTDn9fYYcsY96+RxCVmBU1UT6UeyACkllJmWSzU7gZrvo4gGKXo7uyft1pw/J
	 X0UATKXVk+76/kBFRGVF3WN6uZgdNS3IO4AInkWQW27lHULnedM31JIF4SYAhBxdt1
	 htoENAzwePRLjk5wCvlNeLCA2EhSsiJdEzldD7GbpiOoH+JZ0hIPxhLZNrJGTVLqyY
	 2rgtF3juLEX+iTIqseecGdaakgW0CW4dYuyzvYUgbL2kageR3wIVXZrIeJIMhRFjpw
	 s8V/JiAZGEYvkqjz/CuBiFxqZYv8hiBAk1mJsvk15Xna/VKLCOvT4hJYMMNMBq/vD8
	 cuwKoO9s+/KJg==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b75c7cb722aso670411566b.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 09:34:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXumR2AVFWKtUGsxmZmG96yPuQELDv0EBOY4JxyRJFPHSDolq1Aljqy+8XOrX9vKNybr8QDFxq5HvFtzt5zLymH2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyV5xDkYpnAjbFFmn5zYfiWg6GjO/hdAOyOwPho7gxDnuZOlKXk
	Eo66A91U8Dd1cQmx9AGNDBkziE7N6cek1GSwuB5sKteG2XMZTykNgInxxN0+10R10IbO4gJ0fMM
	s4yzu+DqfzXUVodUsIfOVf2FgI7Ovhw==
X-Google-Smtp-Source: AGHT+IH4zThrBiVwTM/gMTFGPCf7Ko+9nQcpXA9JRi2zbFqO9WDmcAZTQclKPHj9NMzyHEHvrVsg+wN6QcpewpApah8=
X-Received: by 2002:a17:907:1b0f:b0:b6d:573d:bbc5 with SMTP id
 a640c23a62f3a-b767170cca7mr1240223266b.37.1764005654444; Mon, 24 Nov 2025
 09:34:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251031175926.1465360-1-robh@kernel.org> <aRN0fdOAV0B728qo@p14s>
 <20251111195923.GA3629535-robh@kernel.org> <CANLsYkwcbrTaKASdr5fj0m9ARS4xUgzVH8iWQKwTCvEsoZDDsQ@mail.gmail.com>
 <CAL_JsqL7HcDkPgJjcqJSagdN=gH2rv6noVS57QMGNRp0YCxUBw@mail.gmail.com> <aRX6DJoaP4MXG3fN@p14s>
In-Reply-To: <aRX6DJoaP4MXG3fN@p14s>
From: Rob Herring <robh@kernel.org>
Date: Mon, 24 Nov 2025 11:34:02 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJGtQTVdaJ99DKiqbo3GfxmU7V6QjroTxHi7gR53Dfe-Q@mail.gmail.com>
X-Gm-Features: AWmQ_bmPMfxmmKwhG7Mzx1bAQRdZoKMheTTGVeWZ-CEQx6BfmTyQnFsumwKZ_Xg
Message-ID: <CAL_JsqJGtQTVdaJ99DKiqbo3GfxmU7V6QjroTxHi7gR53Dfe-Q@mail.gmail.com>
Subject: Re: [PATCH v6] remoteproc: Use of_reserved_mem_region_* functions for "memory-region"
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Peng Fan <peng.fan@nxp.com>, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 9:32=E2=80=AFAM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Wed, Nov 12, 2025 at 10:59:42AM -0600, Rob Herring wrote:
> > On Wed, Nov 12, 2025 at 9:43=E2=80=AFAM Mathieu Poirier
> > <mathieu.poirier@linaro.org> wrote:
> > >
> > > On Tue, 11 Nov 2025 at 12:59, Rob Herring <robh@kernel.org> wrote:
> > > >
> > > > On Tue, Nov 11, 2025 at 10:38:05AM -0700, Mathieu Poirier wrote:
> > > > > Hi Rob,
> > > > >
> > > > > Please see may comment for st_remoteproc.c
> > > > >
> > > > > On Fri, Oct 31, 2025 at 12:59:22PM -0500, Rob Herring (Arm) wrote=
:
> > > > > > Use the newly added of_reserved_mem_region_to_resource() and
> > > > > > of_reserved_mem_region_count() functions to handle "memory-regi=
on"
> > > > > > properties.
> >
> > [...]
> >
> > > > > > diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remot=
eproc/st_remoteproc.c
> > > > > > index e6566a9839dc..043348366926 100644
> > > > > > --- a/drivers/remoteproc/st_remoteproc.c
> > > > > > +++ b/drivers/remoteproc/st_remoteproc.c
> > > > > > @@ -120,40 +120,37 @@ static int st_rproc_parse_fw(struct rproc=
 *rproc, const struct firmware *fw)
> > > > > >     struct device *dev =3D rproc->dev.parent;
> > > > > >     struct device_node *np =3D dev->of_node;
> > > > > >     struct rproc_mem_entry *mem;
> > > > > > -   struct reserved_mem *rmem;
> > > > > > -   struct of_phandle_iterator it;
> > > > > > -   int index =3D 0;
> > > > > > -
> > > > > > -   of_phandle_iterator_init(&it, np, "memory-region", NULL, 0)=
;
> > > > > > -   while (of_phandle_iterator_next(&it) =3D=3D 0) {
> > > > > > -           rmem =3D of_reserved_mem_lookup(it.node);
> > > > > > -           if (!rmem) {
> > > > > > -                   of_node_put(it.node);
> > > > > > -                   dev_err(dev, "unable to acquire memory-regi=
on\n");
> > > > > > -                   return -EINVAL;
> > > > > > -           }
> > > > > > +   int index =3D 0, mr =3D 0;
> > > > > > +
> > > > > > +   while (1) {
> > > > > > +           struct resource res;
> > > > > > +           int ret;
> > > > > > +
> > > > > > +           ret =3D of_reserved_mem_region_to_resource(np, mr++=
, &res);
> > > > > > +           if (ret)
> > > > > > +                   return 0;
> > > > >
> > > > > The original code calls rproc_elf_load_rsc_table() [1] after iter=
ating through
> > > > > the memory region, something that won't happen with the above.
> > > >
> > > > Indeed. it needs the following incremental change. It is slightly
> > > > different in that rproc_elf_load_rsc_table() is not called if
> > > > 'memory-region' is missing, but the binding says that's required.
> > > >
> > > > 8<--------------------------------------------------
> > > >
> > > > diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remotepro=
c/st_remoteproc.c
> > > > index 043348366926..cb09c244fdb5 100644
> > > > --- a/drivers/remoteproc/st_remoteproc.c
> > > > +++ b/drivers/remoteproc/st_remoteproc.c
> > > > @@ -120,15 +120,19 @@ static int st_rproc_parse_fw(struct rproc *rp=
roc, const struct firmware *fw)
> > > >         struct device *dev =3D rproc->dev.parent;
> > > >         struct device_node *np =3D dev->of_node;
> > > >         struct rproc_mem_entry *mem;
> > > > -       int index =3D 0, mr =3D 0;
> > > > +       int index =3D 0;
> > > >
> > > >         while (1) {
> > > >                 struct resource res;
> > > >                 int ret;
> > > >
> > > > -               ret =3D of_reserved_mem_region_to_resource(np, mr++=
, &res);
> > > > -               if (ret)
> > > > -                       return 0;
> > > > +               ret =3D of_reserved_mem_region_to_resource(np, inde=
x, &res);
> > > > +               if (ret) {
> > > > +                       if (index)
> > > > +                               break;
> > > > +                       else
> > > > +                               return ret;
> > > > +               }
> > >
> > > This looks brittle and I'm not sure it would work.
> > >
> > > Going back to the original implementation, the only time we want to
> > > "break" is when @index is equal to the amount of memory regions _and_
> > > ret is -EINVAL.  Any other condition should return.
> >
> > @index equal to number of entries returns -ENODEV, so that condition
> > is impossible. We can simply it to this:
> >
> > if (ret =3D=3D -ENODEV && index)
> >     break;
> > else
> >     return ret;
>
> To me this needs to be:
>
> entries =3D of_reserved_mem_region_count(np);

Ideally, we try to avoid parsing the same property twice. The places
we count and then read the property again are when we need to allocate
an array of the right size in between. But if that puts this patch to
bed finally, then fine.

>
> ...
> ...
>
> if (ret =3D=3D -ENODEV && index =3D=3D entries)
>         break;
> else
>         return ret;
>
> But taking a step back, it might even be easier to go from a while() to a=
 for(),
> the same way you did in imx_rproc_addr_init().
>
> >
> > If you want to keep the prior behavior when 'memory-region' is
> > missing, then '&& index' can be removed, but I think that was wrong
> > behavior.
> >
> > Rob

