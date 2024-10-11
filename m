Return-Path: <linux-renesas-soc+bounces-9682-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 709BD99A30A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 13:55:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F178B1F23422
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 11:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAA8F216432;
	Fri, 11 Oct 2024 11:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lyxg9p0y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BF82AE7F;
	Fri, 11 Oct 2024 11:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728647748; cv=none; b=jq1G+8Jp9M+keer3VOng3XYk5QF7dmyBFRju07z6d6OY+8KrMnKkHI5CwweHf9GGKEPI9x2aqKqHkBcuth4FonF7VQD7djwtCwJmuWQSVBWgpReXkFjJPxyHMvF+lr6JIdxH91C4WVrfVv2ub9vWVfEyXH23eD/2cyX4tFZkZGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728647748; c=relaxed/simple;
	bh=TKF3Q6GoniS3etrMQC/802TE9lUR+oa2UPZboFmX7NU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=URUdmifSVZ7IaG4+5aiT8juiFkbsKOCFFRrZS0DK6FtI6/Ni6P3OSDxygXvd2NUhb6IQoqBfepwBTDHyV8WPvYAk23jbzk+UnY5repxu/HzMVUUXvLf0JbSxv7l3LuNBmcgk7sgKgsqdSun6Q8Kn5OaO035VBe/CLaB0dvMoBuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lyxg9p0y; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-50ce2aa412dso687591e0c.0;
        Fri, 11 Oct 2024 04:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728647746; x=1729252546; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fsmhDId2GTy6AcJ8g0rIHy8uxbTvk7bC3UqigQ37z7w=;
        b=lyxg9p0y0pWfop7vEJ8omFHuyijIx2sJBsw3c4BnSCHxA+VSb4ebYlPRYIn9EfrTbm
         hxmQt8OA27BgzA48dvpWYT7f9PMX7H3W7O2aj82VkFw3l42Zb4XShPMLVBD0kJhQ5EfH
         zV7r+ZcLdxttLJlrGBDuIEQ/tqZCeU4gua6mNx1ytWdCcX6pXdt3j6zS9p0Ju6+0iBHm
         rafuIFsgodAiYES39wt6PRTuodrG/G2Kc8nnQi6U+qbBvq/hle6g/KWE375uySnC+DHG
         dVDxs8sJU/FiyBriboSnN3zkcEMWU/RWpurMEVqnPHhoZTiCDMIYYQ9FXK7TPGVli8Pf
         oxRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728647746; x=1729252546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fsmhDId2GTy6AcJ8g0rIHy8uxbTvk7bC3UqigQ37z7w=;
        b=IlgRHF74REN+3cP4+oMOre0oDpY8CNmreYCIB7RN8Ia/7d3+zfnHFFVqAxO/YcXXAV
         UPecTmz0d3Jpz6Y+V7TOXX7uf8+oL+ZdpprWZv/+jX4qgufIg9AP9VDMRPWnIoT9pNtY
         fNfHHJlXSSsAwUz7Qhr8N/PEOcf2BDyVmcqZooPaX6qdm6QskeSGDWuoBkL7Q9VSzy96
         7jIdDSEZCg8YWhpNymIFwCs1YWoViaHv5/oOETE6bOJjf5NZLGHHOPLQZKOJBbKABIcP
         MuCQAk2DKuKvwkpqAdimlHyRk7SPuOs6Ftx11XOU1+/KBP+hscJu8g40/57bSPyF0OzM
         luMg==
X-Forwarded-Encrypted: i=1; AJvYcCVl1wH6ZEnFBpZTC80/gZy+66leZ8c8HBDoA4opfw/Jz2n4I9ckhSx1DYy7oxyqf/NbG4arlSWnrfPyE8zL0+m/j5U=@vger.kernel.org, AJvYcCVm9qBqT9mWq9KARH+awmOnECQnMIHkXHzEq/5dwMXxBaK96EUYgx1D8XgKgXFxaFyq1eLTvN2xHJWKkGw=@vger.kernel.org, AJvYcCX7Rfu012C20SqMct9OQlVP7wUsMGo8ds2p1ZtcoBiK+mynoxmbGYHjUI8kO61Pq5wkUFlId4yJFBStcns=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKtnJPQe2crcIFVx+Qb75yfoxLplS4qO4E3CYEtZ8jSuWZFqnU
	rwdaTknAyUyLlCVEz/UUdom9Vzhcbhg0OXVciIjXLmmYEyMe03H0I3o+9V/p1g0RY8vH2FYuSL2
	jSG10jtShCyTZGOeCqBUnIKHFhxc=
X-Google-Smtp-Source: AGHT+IFLIBhzai4CZn1KSsuKtR4h7H3pWP9E7OCyGkfJ8k/+vnvQX2Ar08B25rN8jChB4hW82aVeqQ/7DJ9JFOhd0mM=
X-Received: by 2002:a05:6122:1d09:b0:50a:12e4:2618 with SMTP id
 71dfb90a1353d-50d1f3910e0mr2244894e0c.2.1728647745848; Fri, 11 Oct 2024
 04:55:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241010141432.716868-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdV=EMnPFGJn5J85x5AtE4fYHChLVLOfk6zMR1rrJzS85g@mail.gmail.com>
In-Reply-To: <CAMuHMdV=EMnPFGJn5J85x5AtE4fYHChLVLOfk6zMR1rrJzS85g@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 11 Oct 2024 12:55:19 +0100
Message-ID: <CA+V-a8sqV2KOf2iCt9fHgxNhJG92UYdm0v7mZGNZj4U8QLRSXQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: rsnd: Fix probe failure on HiHope boards due to
 endpoint parsing
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Fri, Oct 11, 2024 at 7:42=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, Oct 10, 2024 at 4:15=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > On the HiHope boards, we have a single port with a single endpoint defi=
ned
> > as below:
> > ....
> >         rsnd_port: port {
> >                 rsnd_endpoint: endpoint {
> >                         remote-endpoint =3D <&dw_hdmi0_snd_in>;
> >
> >                         dai-format =3D "i2s";
> >                         bitclock-master =3D <&rsnd_endpoint>;
> >                         frame-master =3D <&rsnd_endpoint>;
> >
> >                         playback =3D <&ssi2>;
> >                 };
> >         };
> > ....
> >
> > With commit 547b02f74e4a ("ASoC: rsnd: enable multi Component support f=
or
> > Audio Graph Card/Card2"), support for multiple ports was added. This ca=
used
> > probe failures on HiHope boards, as the endpoint could not be retrieved=
 due
> > to incorrect device node pointers being used.
> >
> > This patch fixes the issue by updating the `rsnd_dai_of_node()` and
> > `rsnd_dai_probe()` functions to use the correct device node pointers ba=
sed
> > on the port names ('port' or 'ports'). It ensures that the endpoint is
> > properly parsed for both single and multi-port configurations, restorin=
g
> > compatibility with HiHope boards.
> >
> > Fixes: 547b02f74e4a ("ASoC: rsnd: enable multi Component support for Au=
dio Graph Card/Card2")
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/sound/soc/sh/rcar/core.c
> > +++ b/sound/soc/sh/rcar/core.c
> > @@ -1281,7 +1281,9 @@ static int rsnd_dai_of_node(struct rsnd_priv *pri=
v, int *is_graph)
> >                 if (!of_node_name_eq(ports, "ports") &&
> >                     !of_node_name_eq(ports, "port"))
> >                         continue;
> > -               priv->component_dais[i] =3D of_graph_get_endpoint_count=
(ports);
> > +               priv->component_dais[i] =3D
> > +                       of_graph_get_endpoint_count(of_node_name_eq(por=
ts, "ports") ?
> > +                                                   ports : np);
>
> As of_node_name_eq() is not inline or __pure, of_node_name_eq(ports,
> "ports") will be called twice. So it may make sense to add a helper,
> combining the selection with the validation above:
>
>     const struct device_node *pick_endpoint_node_for_ports(const
> struct device_node *np,
>                 const struct device_node *e_ports, const struct
> device_node *e_port)
>     {
>             if (of_node_name_eq(ports, "ports"))
>                     return e_ports;
>             if (of_node_name_eq(ports, "port"))
>                     return e_port;
>             return NULL;
>     }
>
I'll drop the const maybe to reduce the diff and  have something like below=
:

+static struct device_node*
+       pick_endpoint_node_for_ports(struct device_node *e_ports,
+                                    struct device_node *e_port)
+{
+       if (of_node_name_eq(e_ports, "ports"))
+               return e_ports;
+
+       if (of_node_name_eq(e_ports, "port"))
+               return e_port;
+
+       return NULL;
+}

and use it like below in the rsnd_dai_of_node() function:

@@ -1278,10 +1291,10 @@ static int rsnd_dai_of_node(struct rsnd_priv
*priv, int *is_graph)
         * Audio-Graph-Card
         */
        for_each_child_of_node(np, ports) {
-               if (!of_node_name_eq(ports, "ports") &&
-                   !of_node_name_eq(ports, "port"))
+               node =3D pick_endpoint_node_for_ports(ports, np);
+               if (!node)
                        continue;
-               priv->component_dais[i] =3D of_graph_get_endpoint_count(por=
ts);
+               priv->component_dais[i] =3D of_graph_get_endpoint_count(nod=
e);


> >                 nr +=3D priv->component_dais[i];
> >                 i++;
> >                 if (i >=3D RSND_MAX_COMPONENT) {
> > @@ -1493,7 +1495,8 @@ static int rsnd_dai_probe(struct rsnd_priv *priv)
> >                         if (!of_node_name_eq(ports, "ports") &&
> >                             !of_node_name_eq(ports, "port"))
> >                                 continue;
> > -                       for_each_endpoint_of_node(ports, dai_np) {
> > +                       for_each_endpoint_of_node(of_node_name_eq(ports=
, "ports") ?
> > +                                                 ports : np, dai_np) {
>
> Likewise.
>
Ok, now I will have to create a local variable for this loop, which
will look like something below:

@@ -1486,14 +1499,15 @@ static int rsnd_dai_probe(struct rsnd_priv *priv)
         */
        dai_i =3D 0;
        if (is_graph) {
+               struct device_node *dai_np_port;
                struct device_node *ports;
                struct device_node *dai_np;

                for_each_child_of_node(np, ports) {
-                       if (!of_node_name_eq(ports, "ports") &&
-                           !of_node_name_eq(ports, "port"))
+                       dai_np_port =3D pick_endpoint_node_for_ports(ports,=
 np);
+                       if (!dai_np_port)
                                continue;
-                       for_each_endpoint_of_node(ports, dai_np) {
+                       for_each_endpoint_of_node(dai_np_port, dai_np) {
                                __rsnd_dai_probe(priv, dai_np, dai_np,
0, dai_i);
                                if (!rsnd_is_gen1(priv) &&
!rsnd_is_gen2(priv)) {
                                        rdai =3D rsnd_rdai_get(priv, dai_i)=
;

Does that sound OK?

Cheers,
Prabhakar

