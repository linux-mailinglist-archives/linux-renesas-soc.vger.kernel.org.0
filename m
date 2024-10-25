Return-Path: <linux-renesas-soc+bounces-10134-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D46399B0093
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 12:54:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78DFF1F23BEE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 10:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26B301E8834;
	Fri, 25 Oct 2024 10:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dBuYnsRS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E57B1EF081;
	Fri, 25 Oct 2024 10:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729853626; cv=none; b=hNOqqcEZGTkblHs0ThfAasPgQj9tCtMpBjqACQ+AB+2syov6PSUyQBEvbA2iBTa02gWVGcASUJF42kviXY85Jw9WlMzTOF2jKQAWES3sIgpYCT7aPbL5OnOsftyKUgy1AAOkM+XPa2F7a5drszJs602wj7z0/hT0n32IEjkELK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729853626; c=relaxed/simple;
	bh=1WLCj+37HBkCkHvrCv+h4BU62tfOvbXJfQKkZSdn4MY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bGjnggXMqDA55yMppoh7upjWwEWOw+pVsATZG3V5XYt458G5tMLuvDhKWmkSdoOHHqEDV1Xv4vrwyXeileva5idOQB/Mysd/TKX4swudoe68vMvrA/X5ATGd0spjClZ/0PW0bA4scRqulnXZVmUoyYiAftYzsHL4hh1Hhk+2FHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dBuYnsRS; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-50d55d86f95so603988e0c.1;
        Fri, 25 Oct 2024 03:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729853623; x=1730458423; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KoUAe4UdcgLdmnJCCGBtzGIId+yGFwFvn9dnyk64APo=;
        b=dBuYnsRSd5ohs9nCUSMV84KBO6t1mwP/y8i7Jgl7W5RL9EpNXhKS8yvfKMbj2I89Yy
         owHOPH5n1IFFYGLjG8DM9i4LF6uvM5OQKrVCj5eZ53h5XTwu2SYIWMh+9TJppQENlju1
         7P45Eng4Ovf3TQMdmM2QIJe1qwBOWtwS1IrRgkKKoNN4ZkZ0sZNxMQgSh5gIr5KvRTkD
         IIp4vRhvrpFEn3QTXEP8faUPTqPcj641g0bwoB+kvrHqbUUsdy+500tsak6PHhfaGge+
         N+XmNtqKFEhjJ7ddJbCw4wjrBf3RKYWkjYgExOsHjO0LRtd2naWJhV+yUPksTibct2Dj
         galA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729853623; x=1730458423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KoUAe4UdcgLdmnJCCGBtzGIId+yGFwFvn9dnyk64APo=;
        b=XS4ohhuiOl7R6LNlUDhLEWEAfMTzWg4XgTDI4YRpYvyQlvC4m/5KAwIOW/C/5SVPcY
         H7mOaOWZflsj+NRnoHarmVE5Ep/r3LTwJzq7Y3I068Wph4Pmwdemb4YSuHnl+OSA7Zb6
         y1gH1EEeO6jkVy3HSTVhzNYp4hLO9bNbj01qA8F8vGIfWdjmNADwVBU4G+iJ+Iiylh/R
         7/zQOuwqmtRXkwKb+Cg77sd0fT6KTZzoD7ncIBYaFxiHVZNcfG23XEgJTfCdeFHK4ESB
         XVLZrelv91PXcSPYvKSp1c65JrXSuJ/UhZIE0WFNGSiDlo2mbnfrvnaQkSnp6RBuwRC6
         R1Zw==
X-Forwarded-Encrypted: i=1; AJvYcCVr3yz0i94MSdTMoSIv9UrOZc3uphkLBqJnFiAwLL4qUADx7lyBpAje/Gle7JxyDW/j/Dwg4q2UwlbsE8CwEvR/m1M=@vger.kernel.org, AJvYcCVtmkKLxTytlRILc6vO0zagq89uahv4KxKEy/ntDEYZidVcJzazOJbR45c4S0muLFlh3N1SDpud9gPiTeg=@vger.kernel.org, AJvYcCXzFB2Gz0c1coZLWWdvJ33CSReJdO27vpd6J1ysPUaZgfb7A9eliI9OC99qxLuugyIUn8AlD+aCmaXSzCI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr+VZv+pUWiLiHzT9Rkk5HO2jHzcYQle2WKlST2wb4hBfdgIv1
	MH4gbaJR8ZTXAr6KtLH2VE5iP/AE+ZhSOkGzbAdFl7FC+1x/YIrHnyDjTJzuj7L4sCkY2angq0Z
	/wWDLC68VdEiHnQCUubeVl7niKebt2EjV
X-Google-Smtp-Source: AGHT+IFc8sLxSwAVg+dpzU1J5dudHinDELQkjOAgzcy0zO7bX9uYEIqa0uVb3hcjmCdDU/VR5BdrDmu5kAIw77aho7M=
X-Received: by 2002:a05:6122:2522:b0:50a:ca33:b033 with SMTP id
 71dfb90a1353d-50feafb15cdmr6190408e0c.4.1729853623036; Fri, 25 Oct 2024
 03:53:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241021201349.395022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241021201349.395022-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <877c9zybbc.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877c9zybbc.wl-kuninori.morimoto.gx@renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 25 Oct 2024 11:53:16 +0100
Message-ID: <CA+V-a8sL+UAwNaAZ6ecR9ZePSudPpNCb-OBtzOpFSRHcJ6HuWA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] MAINTAINERS: Add entry for Renesas ASoC drivers
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san,

On Wed, Oct 23, 2024 at 12:20=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi Prabhakar
>
> Thank you for your patch
>
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add a new entry to the MAINTAINERS file for Renesas ASoC drivers. This
> > entry covers the Renesas R-Car, SH7760 and Migo-R audio drivers, includ=
ing
> > the device tree bindings.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> (snip)
> > +RENESAS AUDIO (ASoC) DRIVERS
> > +M:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > +L:   linux-sound@vger.kernel.org
> > +L:   linux-renesas-soc@vger.kernel.org
> > +S:   Supported
> > +F:   Documentation/devicetree/bindings/sound/renesas,rsnd.*
> > +F:   sound/soc/renesas/
> > +X:   sound/soc/renesas/rz-ssi.c
>
> Unfortunately, I can handle is "fsi" and "rcar"
>
>         F: Documentation/devicetree/bindings/sound/renesas,rsnd.*
>         F: Documentation/devicetree/bindings/sound/renesas,fsi.yaml
>         F: sound/soc/renesas/rcar/
>         F: sound/soc/renesas/fsi.c
>         F: include/sound/sh_fsi.h
>
Ok, got you. I'll update that as above and while at it replace
"RENESAS AUDIO (ASoC) DRIVERS" to "RENESAS R-CAR & FSI AUDIO (ASoC)
DRIVERS"

Cheers,
Prabhakar

