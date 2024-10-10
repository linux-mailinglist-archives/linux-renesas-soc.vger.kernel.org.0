Return-Path: <linux-renesas-soc+bounces-9666-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCBB998F0A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Oct 2024 19:57:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44C721F25D18
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Oct 2024 17:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FE171CB33E;
	Thu, 10 Oct 2024 17:57:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D74A19D88F;
	Thu, 10 Oct 2024 17:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728583057; cv=none; b=qOZRltbWdfFXnTh8dfEzqY0BLN1sdP32ozq/5Ph9UtGSRChrZA5V6eiETrUb9DYe8wkRqAP+JfayvZBs0HAGEq2wJPeXcTjkBSFBu9lufDf+Pcf3FeZ+Q3/MWXyIKsyyfJ42xQrTSze7IXckyLbjLvE0LcEdbXItVy5rrHziGic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728583057; c=relaxed/simple;
	bh=ZjDn5Fbn7btLzGQIJ8RjdoCOKXeRv15aDBCmCy04A/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UyOMZTdaeT5Kt/PaHr+njLoVPzxufKVtu/djM9/I2chFxO1WV0OTc7zcTNNj+zSGdzwObtUY49ogmtMzqLVYsSouNLTzThWAy4k8FuDEDDhfPCOB+FYjYoTQdTabDVZPoi/3uVa6DVlwDSZhEO1YnViL2MFFsO6mz8UcnEZVjIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5398e3f43f3so1432573e87.2;
        Thu, 10 Oct 2024 10:57:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728583050; x=1729187850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RUQ8WQ4jeEKOJ8GygBSqWu/2JMxlgxdbild12IpsiMo=;
        b=qt+XjSTYM4AThRcFKRCWiuHMnRrKGYh+rpc72Q5xX7C6Wt0wqED0fYoDIzjejztmEX
         LcWAeGcQs10DuFw2b1o/oVTuYWIF7MMftEx5kFilCGPgj302DkHeaOfHzBGsLSxk1cHP
         8XjFzVoxV7YwZWpnG/7ezn84eG3aqCGAT37CS3Rng99kj/+OmZXkZ8nnpsCM5lUCrFGX
         xQoCl4e2x6dYyZxoGdvySCyNOSpzpkQYjI18im/RUmuIt7f01H2fNFBKTceB8j6lzMV6
         8yPbNF0Q7YAYmd4TtIzYbDKSh/w9CN3A5hlkoODUplwSz1s70pkueHNOGXunf8Fr4txv
         YP8w==
X-Forwarded-Encrypted: i=1; AJvYcCVKmSi/Yf90NbadA8Si/NG+LpF7+CjdueWqx/ifsFgurtlfFOPTEIEIu/V6gQvaAftcC9LKczO6So/K//xt/7A=@vger.kernel.org, AJvYcCWDIHGxVp4e49vbvyb2BTrA7WpnVRbws7wzCL7wOzEFYyIhR4CQ7DYXL+dWRsMTq5YBVtg0pOo/pqdaH9DyZOMC17A=@vger.kernel.org, AJvYcCXCGDZOTpM5fhar7o+tIEy7COC3ah1ZMNIW1bjJ9vGmIkudwFzIXMsPwzT/5Qk3GVq4g4fx8UqTz3q0gkDg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+tm6cqPPHwToW0HzgnGKjwE9nVacjqmIjNULx4YqqAxXN+47W
	alrvWYhw+HIMe7dRqaybQu19hGNCy1DUrNjpj2fvkx/8q2nUv6z1llIPHckWmjw=
X-Google-Smtp-Source: AGHT+IHycR7lzd+QH9PQusnaFsb882tODyKwq08rZRqhR0fLblC/Ve3+/tFzs445j6mqmZQUCjWc6A==
X-Received: by 2002:a05:6512:6cd:b0:539:d3db:3a7d with SMTP id 2adb3069b0e04-539d49bcf98mr254508e87.5.1728583050124;
        Thu, 10 Oct 2024 10:57:30 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb8d7eaasm333328e87.176.2024.10.10.10.57.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 10:57:29 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539973829e7so1286741e87.0;
        Thu, 10 Oct 2024 10:57:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWIbOVGHdAhXFIiwfJoKqBIHMXYMp2r9uy8lN9nIAzHAQrGmwSoHpqlCJ6a0XNKRt35e8gBGVoAAM+0tE4B@vger.kernel.org, AJvYcCWQV25FnAZZrj7JC5wUHbimXXxhji+EYLy1dJstwQ3BaurQyPAhhd2muoXsJfDXvrLKaJUi68zlI6uMZDybclGLzis=@vger.kernel.org, AJvYcCX/61XZX9fZp2fsoO4ztcC2Je0j78Y1D5omuQ2ZQwtm6h08Ah4FtHk9eaRv/UaCpbNGAxKAU8vBsMCh6ZgVOrE=@vger.kernel.org
X-Received: by 2002:a05:6512:3a91:b0:52c:e326:f4cf with SMTP id
 2adb3069b0e04-539d49bcfd5mr240762e87.3.1728583049223; Thu, 10 Oct 2024
 10:57:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241010164155.808931-1-fabrizio.castro.jz@renesas.com> <2e9bf925-8fcd-4e0b-bc3b-996fffc84681@web.de>
In-Reply-To: <2e9bf925-8fcd-4e0b-bc3b-996fffc84681@web.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Oct 2024 19:57:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWURj8YzXKbt74KqgEX5fc1ivg_4ctMxUy3QdJGipLuZA@mail.gmail.com>
Message-ID: <CAMuHMdWURj8YzXKbt74KqgEX5fc1ivg_4ctMxUy3QdJGipLuZA@mail.gmail.com>
Subject: Re: [PATCH v3] irqchip/renesas-rzg2l: Fix missing put_device
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Thomas Gleixner <tglx@linutronix.de>, 
	LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, 
	Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Markus,

On Thu, Oct 10, 2024 at 7:53=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
> > rzg2l_irqc_common_init calls of_find_device_by_node, but the
> > corresponding put_device call is missing.
> >
> > Make sure we call put_device when failing.
> >
> > "make coccicheck" will complain about a missing put_device before
> > successfully returning from rzg2l_irqc_common_init, however, that's
> > a false positive.
> >
> > Fixes: 3fed09559cd8 ("irqchip: Add RZ/G2L IA55 Interrupt Controller dri=
ver")
>
> Might the application of scope-based resource management become more
> interesting accordingly?

No, as explained in the comments:

> > +       /*
> > +        * coccicheck complains about a missing put_device call before =
returning, but it's a false
> > +        * positive. We still need &pdev->dev after successfully return=
ing from this function.
> > +        */

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

