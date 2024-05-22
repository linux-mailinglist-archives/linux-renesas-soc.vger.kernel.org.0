Return-Path: <linux-renesas-soc+bounces-5430-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CD18CBD93
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 May 2024 11:15:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 67D6EB214A4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 May 2024 09:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DBF42D047;
	Wed, 22 May 2024 09:15:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E5E282E2
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 May 2024 09:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716369350; cv=none; b=XtRVjQkTQJt6lWG2/htQ43ALU9EGxc/a+lhXW7JFhQsD0Ul0WVxGolan9yYNP/s1SM9VbSYaf4drK9aJeJ6zEIjkRpiPU4sApaKgvMeWYAECuq5QW01gvIr3jWVeMCXzrGBdZtcics180kFoHrRgIT2TcBnd0cM/zdZ39tBIt0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716369350; c=relaxed/simple;
	bh=jaKuKfC5TQ5qcLw4k5UekXXIl9lwTM3qysVYuZy+wNw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B/41Gf0kLtaAY+ASIpYSHBKj8o/zTA6gHEclgcYFGxzFVj+L2HHRf3SoDwWsyK0JkVEjNJxNJ93E6fYwuvbNkeRePpzvCVWYN92m4hKGByaTGuJ961acknzBMp4QbYnfeXsIvwuVUvlmGWSNgyXuonRotrxfCySur14lK/bz+Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-627dde150d0so5852077b3.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 May 2024 02:15:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716369347; x=1716974147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O1SbES1a9bCpIba+xnsBsyW2Hes5wHDiPrkR1hx+hJg=;
        b=WkogHAzt4lLmZtkjLohDyfGhgaa+FnwDucVFnh/FkqK+VwKoAAowdS4JjY2IW4ICrk
         gyJ8V6gX/02d0VoX/XXi6PXC981QgmUwlDs78Pu8VB3KK3s1MRy4ubTdHc0GQfVQXiZB
         FGiH0DeWEEQB+aGHgc+pqd8OxPdeS1q4w0jYFiNaRaHS4VOtIH/s2GXxkyET2+P9DsEp
         cPAfME4hB9gOtUxFOGRO5iumXBQkVUeVx6rAAZYW/YfIm3E2binb7rD88BaOU/vwa/bY
         DxqCg8TFcvDmLNA+v050wvRMz5hv30sQx/E16md/2Jd2t/RGklrBuliRq91GJ+qzJrzD
         0U7Q==
X-Gm-Message-State: AOJu0YwWH6Vsb1bCSv2ecblksln6izzdQ36MsPcUaK9yq1eIeDyF2DzY
	zkmj9YNk7+qBwFJ1tkfS4lgkjMruDGgGon5Jjj3Ph3buKNIp+b5cKEBgKM1c
X-Google-Smtp-Source: AGHT+IGnkFp4VI6c6OAle+9ah1oPc/wi7+4yZwyBnm76kYVTNo+kLXpfkIRLKC47eKWfCaZzMXHMzQ==
X-Received: by 2002:a05:690c:60c7:b0:627:dfbd:89e with SMTP id 00721157ae682-627e46a4737mr18273367b3.11.1716369346714;
        Wed, 22 May 2024 02:15:46 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-627915d0663sm19121297b3.14.2024.05.22.02.15.46
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 02:15:46 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-df4e6ece05aso280448276.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 May 2024 02:15:46 -0700 (PDT)
X-Received: by 2002:a25:d854:0:b0:dda:c10b:1c6d with SMTP id
 3f1490d57ef6-df4e0db842emr1389984276.51.1716369346405; Wed, 22 May 2024
 02:15:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240521065136.7364-2-wsa+renesas@sang-engineering.com>
 <lcbvbogpsvia5c2rpsedu4mjvzjht4cfqds7zwmzyghqmdlnbg@xzyogkjl53dv> <TYCPR01MB11040E4C3EC3280AA907796FFD8EA2@TYCPR01MB11040.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB11040E4C3EC3280AA907796FFD8EA2@TYCPR01MB11040.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 May 2024 11:15:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVH-_fV6=9pOD-jP-NNb1z-2qNeT_B3mnh7CM+=PJ91Uw@mail.gmail.com>
Message-ID: <CAMuHMdVH-_fV6=9pOD-jP-NNb1z-2qNeT_B3mnh7CM+=PJ91Uw@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable Renesas R-Car Gen4 PCIe controller
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram, Shimoda-san,

On Tue, May 21, 2024 at 12:30=E2=80=AFPM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Wolfram Sang, Sent: Tuesday, May 21, 2024 4:14 PM
> >
> > > +CONFIG_PCIE_RCAR_GEN4_HOST=3Dm
> > > +CONFIG_PCIE_RCAR_GEN4_EP=3Dm
> >
> > Shimoda-san, do we also need 'CONFIG_DW_EDMA' for endpoint mode? There
> > is a BSP patch suggesting that: cda3dd982572 ("arm64: defconfig: Update=
d
> > for RCAR_GEN4 PCIe driver")
>
> Thank you for asking me about this. Yes, since enabling the config improv=
es
> the performance in endpoint mode, I would like to enable the config.

Do you plan to send a v2 including that?

I guess we also want that in renesas_defconfig...

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

