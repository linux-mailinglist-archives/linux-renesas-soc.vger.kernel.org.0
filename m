Return-Path: <linux-renesas-soc+bounces-14948-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CAEA74579
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 09:32:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A48D1B61A78
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 08:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 131CE21324E;
	Fri, 28 Mar 2025 08:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ORm0QcCy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F8B212FBF;
	Fri, 28 Mar 2025 08:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743150638; cv=none; b=ssjzEcHNAtQdDJsk9YceI0YtTbpIwvkrU8uSStGSEVag4/ku59faMUa0jE57Wl9mii2aCrhXRYTIb6Bgx0zpdVSIhDt3oC4mPIPMUQbSR0A9ahKZW4M/qZMpAY3ys/n1Vs2yACTGVGFBe+Rw1arZecI+kBgpNdp/JoWBYrdZHlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743150638; c=relaxed/simple;
	bh=DTcedE6KspyD0WF2+HMkGLOGGYHnEJsoVr5IaBC0H1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZBFTW/q/NQ7iLiXO/pE219xZNeYQR+P4aw0sebuieDxrzDKY+rBLoUqyX+rvehM/vX5kNxa/ukI/i2mrdAYJ7zldOD5zd0aHIcop3rko4TFrnhxFeGzNz9ZyLOQfzOiVUhwyYHsdQBRZPV5HnNaQ9eqKz5r63f3zUKhsiKFvrUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ORm0QcCy; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-51eb18130f9so928928e0c.3;
        Fri, 28 Mar 2025 01:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743150635; x=1743755435; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCz69q91HFfvhGoJrcN7iTaAaXUD5silbw3K2qhF6HQ=;
        b=ORm0QcCyYHE88TApOCi8jN7/pgRrfidzwxJ90Kgn/rDoKPW/cpJpvXDTNa3K4bBEQf
         J9W2rSQmBEdnAZ/cv360sy+CVWbfU2iK4YM/TqjgAgkZlcQ9n3iA9YIn9F42y9w9hjo1
         QltX8cGtW3t/hnc0E40DRcNSwVqRpSWLuIxRPhzNYdClOBFFXqjMM/uovzDWxIUdBMld
         tTLGdsylxy21Is42Yx98+F6/xDkOJ/QtZXPsJNgAerd8QZxd4IdAw5DrrfcDeKE0UvB/
         Zj9G+gqV7S4AwZ/tXd+92oESXpH7/yv0e/JSIX9E7+9PxkbAuvBQJLZczMAr2NxXOV3g
         m11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743150635; x=1743755435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wCz69q91HFfvhGoJrcN7iTaAaXUD5silbw3K2qhF6HQ=;
        b=IzHY4hcshxNjfdB/XABmSzDXNopvem2c9KBpjXhoP1Ehxj0UbiQ+U9FVQf2tLGOwek
         ej8JDfnEny8VT3FALp+3uxhtMRL0oA9DpV86XBr5ftC4TxZAfHcMCOGaJMv6LNMsQPNK
         y7tUmS5dAkihs5IENeUEJcKLUiZbiqVJF5K2GUwWstNxzZ0PtK+TpuYzbxhNxZFNI/ZX
         to6OQhIWs61QQM5RS68lCQe/W7sAVuyTybgJJNcgO/oMvUHW8NCoYfYs/GY+ejZ1y/Qr
         uFBIPr+tQxX/KLSwAfIxKNVXmwPZz4nmGufnE0OvL0LW4vE3FynZfXuv0+10jJhfiF4/
         GMmA==
X-Forwarded-Encrypted: i=1; AJvYcCUFzg4L5MedjkS7cPiXrr/SPLUw949dgaJoYk0h/jzt1B4zp4mo5r2Ap2r05qJkiSEbbTv3VS3DHVeQbLtAheQItQg=@vger.kernel.org, AJvYcCUzp9Kig5yTQOSYu4Ou4fSo9bUj83TELR81DzMrKoe6+oIWWHZUjF0ftHw21uWyS6Mkafsp0E5uJP//uiw=@vger.kernel.org, AJvYcCX6upC/tXaz1ZKUTHIEdHJt3nc4+MmZMbtOrxhcNjFmIvlek3VJ6Bh5iyl3zZ2XBXRvOagBYh+Vu39s@vger.kernel.org
X-Gm-Message-State: AOJu0YzA5FeE25qBa8MWhYNJO9l6ac9OT7VqOLZ8HxTUALiOfYXbxsnK
	4sm7UDo4Qcudu/A40dEUJQVzrgwI/oreLYSXQkpx52d5tKeUei3SfBaJnEYyXmFtf7Xomzsbg35
	Wo7rjeCuit1k7t4oDJg4J9u330lU=
X-Gm-Gg: ASbGncuZH0gRBj+SsHcsOe45urtm27AV2wRdarYOoJblRyrWcW3WQPNffo/BKYH5/9J
	PNk7LWS6OQ/Iuj3MHO/oowGZJE2IcIWbk/fGYG9uZo/4uNiC5l0dpaDyg2dVM3xQeq7/prYxsGI
	tTfYy2jeXEKv8fbwZG8eGUNytxMg==
X-Google-Smtp-Source: AGHT+IFIZReqhwYH+e0OINTV0TbFc9HMOCFT2KPlEmIJBSBf3GP/kFOfHmgaEfx6fm/rrHXFKMQCWubhlgeX8F1T68s=
X-Received: by 2002:a05:6122:887:b0:520:9b05:4cb6 with SMTP id
 71dfb90a1353d-52600719492mr4729899e0c.0.1743150635039; Fri, 28 Mar 2025
 01:30:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327120737.230041-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250327120737.230041-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <8734ey10dp.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <8734ey10dp.wl-kuninori.morimoto.gx@renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 28 Mar 2025 08:30:08 +0000
X-Gm-Features: AQ5f1JrdoiuRzwfKuayvqqi9Zb-yH-FlHzUYFciOjeCux00RWQ8VspRuF2eowtU
Message-ID: <CA+V-a8sk_SU4-2tq6ZdOsMeZY41NeFhVbAq_NZQ7YgUWuMkACw@mail.gmail.com>
Subject: Re: [PATCH 1/3] usb: renesas_usbhs: Correct function reference in comment
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-usb@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kuninori san,

Thank you for the review.

On Fri, Mar 28, 2025 at 12:09=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi Prabhakar
>
> Thank you for your patch
>
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Update the comment to reference `usbhs_mod_probe` instead of
> > `usbhs_mod_init`, as `usbhs_mod_probe` is the correct function
> > used in this context.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/usb/renesas_usbhs/common.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_u=
sbhs/common.c
> > index 4b35ef216125..15ef246a1245 100644
> > --- a/drivers/usb/renesas_usbhs/common.c
> > +++ b/drivers/usb/renesas_usbhs/common.c
> > @@ -698,7 +698,7 @@ static int usbhs_probe(struct platform_device *pdev=
)
> >       if (ret < 0)
> >               goto probe_end_fifo_exit;
> >
> > -     /* dev_set_drvdata should be called after usbhs_mod_init */
> > +     /* dev_set_drvdata should be called after usbhs_mod_probe */
> >       platform_set_drvdata(pdev, priv);
>
> If you want to care about context, it seems we want to care "dev_set_drvd=
ata"
> and "platform_set_drvdata" too :)
> And, it is easy to understand that it indicates function if it has ().
> like below
>
> -       /* dev_set_drvdata should be called after usbhs_mod_init */
> +       /* platform_set_drvdata() should be called after usbhs_mod_probe(=
) */
>         platform_set_drvdata(pdev, priv);
>
Ok, I'll update it as above in v2.

Cheers,
Prabhakar

