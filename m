Return-Path: <linux-renesas-soc+bounces-9673-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4C0999CDC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 08:43:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7160AB20FCC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 06:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3528D20966C;
	Fri, 11 Oct 2024 06:42:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52456209677;
	Fri, 11 Oct 2024 06:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728628973; cv=none; b=KpFbnUpTm3t8J9+xYovg9CPMQIVtv5Kf8yuDGkLsmywhi0/g85iYrvuzoVYbM1YU4fnGNW/9HcSZxAV9vrJGdggKeL+TxOpUyCy/6nTYN/ku1QdR9AnrzvY5XfCWlv4Ger7T4B9QsP/epPumStpx2XPhRW+QiPLPBvkzjy1iXlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728628973; c=relaxed/simple;
	bh=B5BF9AElxlSzgaYbHLUSKNWQRSL07hjT8G2UPti00ZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qIhzlqrMa9ar7UQrsc45TCRkRh3z8clAFN2cLvliDtOLobWR3xsQUDJH8ndcouqbf1WGsn6/6+ckEVLw/YIzyVnvaWiCd8Qg0kcfaS8IxjAuYoUNXD2EpohmPHWD/RAzVVCbuo3be3G6C8KtCeMglW1EZ3ZxqQJk5y9KQbRETfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e2915f00c12so816216276.0;
        Thu, 10 Oct 2024 23:42:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728628969; x=1729233769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OI3b4NKCZIobgXcfPVHuehiSSfOdHQS+7R2fmQSiyY4=;
        b=C9s6wN0TjEiEAOdv7W6ce2j16muiIoL7rr/e6932g9CqFMGEMfsFWXT60W9JEUvCAl
         wT5Q/XxJTYVDP+crLTXPnAUAc+ngHk4LM146RgECiRmxU7GzJF2OP6H8jNCjhyUqgczQ
         vkUxeh704M+uk7QKMrnyHlTyR1UBR2JpdZfsm0KHi4f9HfYKPx8ZyDYFnv1osR/Uvt79
         r5X9TEhgQQHoEezzPAWtFklFB/m+mIw9+M3s9BI0ITzFoAj1ViMpDsE2m1EwatErG1Si
         QSv+TyWNKdG4ibwtbAwgULwCdGrNJbQbMLHGLpFgvnOPnZdne49op1V6ck3cxi9lcsoa
         Ky2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUWMDqururERYMxghd271SzJForvCkzzBPaseDRQfuWddAktm+a6MBvvZCI/esxTR+TlPJa/hDlGdk4YQ0=@vger.kernel.org, AJvYcCVM06Ad08OmrCNDacn5ox0wHDpOL3Kkt6N6pqeFFqIX2VQ8WWjYe4In+0uPTBNcRSUKaVj6gH2gXg0f9qQjSuP1lUw=@vger.kernel.org, AJvYcCXPdIcYQMQ3EPRtX2LGxf9o2ShikTMuukTAMIyxCFzJEGnxVbwYEc+D43SLEyLo6gDZnvKhk9vq2LMYC5o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUwWkZNI8iUfC6JBBr63+MqauE7BUoF136I3+FP/0A/WtIHbNm
	UO5bv7DLVT0hjBWO4/AsbGHZH6YrWOoqbOSj9EZrKAGm3DnsKh4v1LI36aMagRA=
X-Google-Smtp-Source: AGHT+IHXY1XciuPiTc59piqKVwCaeZpufnOETwPeTkOM5/Dn6toJa0pELv6q1Pf3Jt6m6l6yinwJTw==
X-Received: by 2002:a05:6902:240f:b0:e28:f3e7:d92b with SMTP id 3f1490d57ef6-e2919da1176mr1061686276.24.1728628969322;
        Thu, 10 Oct 2024 23:42:49 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e290edff990sm680866276.15.2024.10.10.23.42.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 23:42:48 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e2915f00c12so816184276.0;
        Thu, 10 Oct 2024 23:42:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU7xkVl8WNSf+LMCrD5nAoRRYDKG9Gj/MHsFHk8nF7E58SFUDe+MjBhMugZnvX6rAWn4wcwvXASnr2g7l0=@vger.kernel.org, AJvYcCU8tvdpZ+JFxrhvAsvPKTxdDNlVqzLVUPL0RvkA18jzcFkDo3wDsuaURxhSrywxmv3QmN98tfJ/MD1UPKrW2WVSIN4=@vger.kernel.org, AJvYcCUOdZ+Xc4CSIWlnSRbCysKTyc2hEb1RjX7K3k8M/HdUk607ubtK5vPqJ+PK7Uao1i9ZW7/9ooS3dJ1HsLA=@vger.kernel.org
X-Received: by 2002:a05:6902:200d:b0:e28:fa58:15c0 with SMTP id
 3f1490d57ef6-e2919d840dcmr1008730276.23.1728628968337; Thu, 10 Oct 2024
 23:42:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241010141432.716868-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241010141432.716868-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 11 Oct 2024 08:42:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV=EMnPFGJn5J85x5AtE4fYHChLVLOfk6zMR1rrJzS85g@mail.gmail.com>
Message-ID: <CAMuHMdV=EMnPFGJn5J85x5AtE4fYHChLVLOfk6zMR1rrJzS85g@mail.gmail.com>
Subject: Re: [PATCH] ASoC: rsnd: Fix probe failure on HiHope boards due to
 endpoint parsing
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Thu, Oct 10, 2024 at 4:15=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> On the HiHope boards, we have a single port with a single endpoint define=
d
> as below:
> ....
>         rsnd_port: port {
>                 rsnd_endpoint: endpoint {
>                         remote-endpoint =3D <&dw_hdmi0_snd_in>;
>
>                         dai-format =3D "i2s";
>                         bitclock-master =3D <&rsnd_endpoint>;
>                         frame-master =3D <&rsnd_endpoint>;
>
>                         playback =3D <&ssi2>;
>                 };
>         };
> ....
>
> With commit 547b02f74e4a ("ASoC: rsnd: enable multi Component support for
> Audio Graph Card/Card2"), support for multiple ports was added. This caus=
ed
> probe failures on HiHope boards, as the endpoint could not be retrieved d=
ue
> to incorrect device node pointers being used.
>
> This patch fixes the issue by updating the `rsnd_dai_of_node()` and
> `rsnd_dai_probe()` functions to use the correct device node pointers base=
d
> on the port names ('port' or 'ports'). It ensures that the endpoint is
> properly parsed for both single and multi-port configurations, restoring
> compatibility with HiHope boards.
>
> Fixes: 547b02f74e4a ("ASoC: rsnd: enable multi Component support for Audi=
o Graph Card/Card2")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/sound/soc/sh/rcar/core.c
> +++ b/sound/soc/sh/rcar/core.c
> @@ -1281,7 +1281,9 @@ static int rsnd_dai_of_node(struct rsnd_priv *priv,=
 int *is_graph)
>                 if (!of_node_name_eq(ports, "ports") &&
>                     !of_node_name_eq(ports, "port"))
>                         continue;
> -               priv->component_dais[i] =3D of_graph_get_endpoint_count(p=
orts);
> +               priv->component_dais[i] =3D
> +                       of_graph_get_endpoint_count(of_node_name_eq(ports=
, "ports") ?
> +                                                   ports : np);

As of_node_name_eq() is not inline or __pure, of_node_name_eq(ports,
"ports") will be called twice. So it may make sense to add a helper,
combining the selection with the validation above:

    const struct device_node *pick_endpoint_node_for_ports(const
struct device_node *np,
                const struct device_node *e_ports, const struct
device_node *e_port)
    {
            if (of_node_name_eq(ports, "ports"))
                    return e_ports;
            if (of_node_name_eq(ports, "port"))
                    return e_port;
            return NULL;
    }

>                 nr +=3D priv->component_dais[i];
>                 i++;
>                 if (i >=3D RSND_MAX_COMPONENT) {
> @@ -1493,7 +1495,8 @@ static int rsnd_dai_probe(struct rsnd_priv *priv)
>                         if (!of_node_name_eq(ports, "ports") &&
>                             !of_node_name_eq(ports, "port"))
>                                 continue;
> -                       for_each_endpoint_of_node(ports, dai_np) {
> +                       for_each_endpoint_of_node(of_node_name_eq(ports, =
"ports") ?
> +                                                 ports : np, dai_np) {

Likewise.

>                                 __rsnd_dai_probe(priv, dai_np, dai_np, 0,=
 dai_i);
>                                 if (!rsnd_is_gen1(priv) && !rsnd_is_gen2(=
priv)) {
>                                         rdai =3D rsnd_rdai_get(priv, dai_=
i);

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

