Return-Path: <linux-renesas-soc+bounces-23619-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBD4C0CB22
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 10:37:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D7FB84E9E63
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 09:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAF0A2F0689;
	Mon, 27 Oct 2025 09:36:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF112E719B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Oct 2025 09:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761557799; cv=none; b=rAAJaJLermQPusMaCF4L+fgOCsxYsuTkaf1m1yOKhEqeZoXbkr4MHm7Xe5hzG6z7UYlCS7QqqeeylJaq8/N+nMaZLW+7ihDFL3jgUkblyrKPIZDAUB6r8xd/FwapM9+XV1xRjIxM8szafBOyNjIk+XfHfedVS4qRfjJF69a3kLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761557799; c=relaxed/simple;
	bh=fncR8W3gUwNVJs/Vf4KEEfYIEt4HzTjF5c31Mog2Tps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JjWHwYl6VyWQaFTGd9WNk4QNBw7z2E+9b7q8yFc7KSxtfZ3kvFV0wkCm3NcqH5HnqRA0aGZY6cngYN4zBKEw7iszFxjQ4+mpwqbXemHOKKTNgijm1kZZnL83wFUAUMw4DGtwOYPmmgdwN9Nxf5q0H9WR6igNIicticUQHA4xFbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-557c3b5b93aso3038679e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Oct 2025 02:36:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761557797; x=1762162597;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hU5eTMlYlc3Dd8EpCFgpJqF1eiQsAhEcO++v12mjSXI=;
        b=duyuWrEBunbaQdQQOmyTH/7G8xDHiBDMngsBzk5SwGqZ31VNPhFh2wKtw3H1gNNcAT
         9+y8H5qSlxo7xxjxLdPHe1jnXBDIRz8zwLwAg1Ttjy1a82itnDI4PzR1usGwCHZ/BvGl
         N8ad9OY90geDcTGWdlxijEOvKIM45jbz6SwDS0l28BcSaRrPjfbmGc2gI7lJohFTNm9G
         VZtp5cndUfhi4IYWxgJ5GHkJsES02d7eeCt3eoG5YlXpqB6nKIpABK6OpYI8v8lBughk
         zKJwlg2zwFY66xpsa2Jhl0Tv5KwjJ2XrDwC9J8UKYZj5GmhqOaZo6uyyz+Qz5SJO6Yr6
         RI9g==
X-Forwarded-Encrypted: i=1; AJvYcCXia5jNT3jhw3pQrRMOshf7WLf0tDfGAGvfnFf+DozIq1/VjWMkU6C1geXIn72UCm+FlreooEj8U2jubN9WTknXKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCgC7KtYQXkUhl66sgB+LfjVLZhqe8TNO9z5igairDZAQRpJ+H
	UDIAMlYfWwqZekKbNup/s1weu4ejzRZruxxiHVRxkTyRKf7AL5/I9+t4D1GY/oSJ
X-Gm-Gg: ASbGnctq0GaYM61oo7RtMbXNuhQmukPr40c6wcH89Ao6/dQO6OlJWC4bSCUoADdoa7T
	N1hyhGiYapSYO4pjOCUMIRraoG4K7VrUTuG7ziOrLnGXcIt9KYgJjyLXOy4YVXszZvxSLNhZfmQ
	oFGpfj4qRCtTGzcteSsW6R2mwp5Wo+5RfPUyHfgWDU1VA1PYmKtJTgpPIQuEF1f/vr+kBxpUTqS
	TAZ81crIcnl+7oejsu475Dvd82P+05qlZ3cw1vYw4MbK9TngP+A8nFVSTB84ukJaMFbNdmjdcTp
	dnIDlLKTksJyLSvIeHScPJuIrsCEu7ssEn3XeLj2Fs117bfKyUTsN0tFUqPTKNkuXF5Bp43/JA1
	rQgHMoT/fJbyFGg6CEo1i48Vk3oc/Hlb+bRGshq4AECOtEnuQ3ASPx1I+BsKGQwUgdY7BiZ8PZa
	tkc641kLF6l653+cwZJ0SJpPQWHzhDFn9XTq7jSuoHpgzljPFXg1mwwvJpPVY=
X-Google-Smtp-Source: AGHT+IFDlvFEDNbeX21drEQOlrRiGgd4o1ObBql7nUo826BrXgWXdlFK9edlZ21Ve/Sn9YkpR1V0+w==
X-Received: by 2002:a05:6122:80a7:b0:556:e951:b554 with SMTP id 71dfb90a1353d-556e951bb17mr4724014e0c.10.1761557796624;
        Mon, 27 Oct 2025 02:36:36 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-557ddac18dbsm2680182e0c.2.2025.10.27.02.36.35
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 02:36:36 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5db2a0661e0so2749452137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Oct 2025 02:36:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV49+ddrgHzVCXUEAfdnY53diTUs7W18rtwLEsWaf/XHlv82pqkHUUqXsudTfXPbdcX0iLNg3bJErEeKEBY+fvrcQ==@vger.kernel.org
X-Received: by 2002:a05:6102:1625:b0:5d6:2bf0:32ed with SMTP id
 ada2fe7eead31-5d7dd5eb045mr13327749137.34.1761557795627; Mon, 27 Oct 2025
 02:36:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87frb8n7kl.wl-kuninori.morimoto.gx@renesas.com>
 <87bjlwn7j9.wl-kuninori.morimoto.gx@renesas.com> <176129066419.661728.14767654389778601283.robh@kernel.org>
 <87ikg1gcwx.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ikg1gcwx.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Oct 2025 10:36:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWu1GemaT8vQv=vnsMvyK5t7+rAspFEKi53oWmyj1kZAA@mail.gmail.com>
X-Gm-Features: AWmQ_bn_brfemq2GlaNph51jwJdZbBeeTlVBAadZH4syrq6rxb0hI8SuGXTM8tQ
Message-ID: <CAMuHMdWu1GemaT8vQv=vnsMvyK5t7+rAspFEKi53oWmyj1kZAA@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: mailbox: Add Renesas MFIS Mailbox
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san,

On Mon, 27 Oct 2025 at 05:57, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > > Add device tree bindings for the Renesas Multifunctional Interface
> > > (MFIS) a mailbox controller.
> > >
> > > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > > ---
> > >  .../mailbox/renesas,mfis-mailbox.yaml         | 49 +++++++++++++++++++
> > >  1 file changed, 49 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/mailbox/renesas,mfis-mailbox.yaml
> > >
> >
> > My bot found errors running 'make dt_binding_check' on your patch:

> > from schema $id: http://devicetree.org/schemas/soc/renesas/renesas-soc.yaml
                                                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^

> Hmm... I can't reproduce the issue. What I'm missing ??
>
>         > pip show dtschema
>         Name: dtschema
>         Version: 2025.8
>         ...
>
>         > make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/mailbox/renesas,mfis-mailbox.yaml

You are checking against the wrong bindings file.

However, I cannot trigger the warning by passing
DT_SCHEMA_FILES=Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml
instead.  I only see it when dropping the DT_SCHEMA_FILES parameter,
and thus running all checks.

If you are 100% sure you do not want an SoC-specific compatible
value, you can fix the warning by adding "renesas,mfis-mbox" to
renesas-soc.yaml.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

