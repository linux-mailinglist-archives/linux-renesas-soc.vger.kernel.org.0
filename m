Return-Path: <linux-renesas-soc+bounces-5485-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9678CFCAF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2024 11:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A067B20DEE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2024 09:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F366139CFC;
	Mon, 27 May 2024 09:22:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D848BF0
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 May 2024 09:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716801737; cv=none; b=Ro5HnB4N5ct3YAuVTmqL7ZCU1Ftwn1DIdnE9+wdyCKtbCr1sOrI4W+VpD2jLbJ4Pf5RVi/VVCu2qMmzmQd+x2Glw+jt0eX2AZDHh1hgT4UlgV0XkxtsLqMglMxCwn/dJdDgNTP615u+BU9DFZz5PLTPwizRXA4vfak3ZadI3kGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716801737; c=relaxed/simple;
	bh=PfSN4R6+1LGQCc7csCXNbDSvsE6U8OIyF9fYkAumiro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=Gk5qdZ5dlzhaNemwql4kV9P7iqaTWsSj/pHnSiXjaUOQiEQOj+LyJ8VrWBBBpUTG2hlGje2L9xWUmtt2pEA4ycQ8PnU+iRKCKf2XihyVSsNMZQgQqaIdlm7TxlxsNuKFGxMq5Sl1tRQsfF5/VubyZy7okZLuag9uSGI1sa3WKbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-62a2424ecb8so8639077b3.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 May 2024 02:22:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716801734; x=1717406534;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FoZIGZXDswlPrEe3jIPfQH/fSW2rIKNEqI9osWtK4mE=;
        b=Ba2BStbEk3V2CuosFZt8boqOsWmZ3E6aJWKHNfIXivwWfxqf/yt6Ke98PcuHXTGHVe
         0qwtNyLVU79Fmt1pnweeMOk5iqs9nWx3Q7BlY8oQqoV/ctLoDQjZ6aBH2YeC+dRr+knu
         wgaVa/QHdUUdidkG+GlfNXQVjTzVvj/7JrpMXZHef3PpokZ/f/uS7JSMDh4wILewfqYF
         AsDrdlJf34xJRx2Tkb1VuuTQmv7SfYQy21yaWrqgnfcxst9rwJNlyDt5t+Msabtlkdsb
         2Fu3yXfsjjfsDQvGf9MuPf7E5ra+NQWMuEg8CnvGWF/Y+CiEJ5OrQWICV0DECLf9wDIX
         yPLA==
X-Forwarded-Encrypted: i=1; AJvYcCV3qcgolIzjxndnR27duGjA/ebSbACmDLPft0aGjZcPFL2g28+Es9oz9VzgnW4gLC5PM0M1h740G+U3v/JjlEiIunuSOWLR5OFm/ZahOivqjgg=
X-Gm-Message-State: AOJu0YyaPw20qUdzCZfvct7T3Zd5Y8kPqf7ztKqkzUEREvtmkh3P9yZn
	bsfwVuv2l/PPID7Rd5GdjAmkQXh+27LqgYWKUSDMiYRrDjHQvb7PH/pf4VN7
X-Google-Smtp-Source: AGHT+IE619FRdcNSbP4jaDizxOm/IfWAbt1HeYIAax7klsKZYc0haFagx3xQn7xZTEJaaNkNqAz48g==
X-Received: by 2002:a0d:dbc2:0:b0:618:1dab:2f0f with SMTP id 00721157ae682-62a08d59be1mr84945697b3.2.1716801733929;
        Mon, 27 May 2024 02:22:13 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62a0a4204f0sm15723627b3.57.2024.05.27.02.22.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 02:22:13 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-62a2424ecb8so8638847b3.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 May 2024 02:22:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV3LMh8mGm6VwM+3U1SmzXShyiFNCm0MqhV9+YXezQaxq1uKdU3SUeujek+bq/ZwrEuyG04b4QTzEB6Xv2d1/VDDUzH+uB2EG3yXvM2JsdcA7g=
X-Received: by 2002:a25:d38c:0:b0:df4:e088:d012 with SMTP id
 3f1490d57ef6-df77218e610mr8794613276.17.1716801733103; Mon, 27 May 2024
 02:22:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240523203431.6423-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdUfdHBMZ7WkUqN9JzcvXkPtLygL684_Qbaudb5+GvtMJw@mail.gmail.com> <mdztslnrrybhm7ugdwq3xkmdtvgibn7rkpjbzhavwqywactx2t@27wcl7eslmqp>
In-Reply-To: <mdztslnrrybhm7ugdwq3xkmdtvgibn7rkpjbzhavwqywactx2t@27wcl7eslmqp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 May 2024 11:22:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWQ=6AOZPB6HK57sheV5eTbsyqDk05ZCXvWVi0n-R7O4A@mail.gmail.com>
Message-ID: <CAMuHMdWQ=6AOZPB6HK57sheV5eTbsyqDk05ZCXvWVi0n-R7O4A@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: defconfig: Enable Renesas R-Car Gen4 PCIe controller
To: Geert Uytterhoeven <geert@linux-m68k.org>, linux-renesas-soc@vger.kernel.org, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 24, 2024 at 1:13=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > And you changed CONFIG_PCIE_RCAR_GEN4_* from m to y??
>
> Stupid me, sorry for the noise!
>
> > All of these should be modular.
> > If you agree, I can fix that while applying.
>
> For sure, I agree.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.11, with s/=3Dy/=3Dm/.

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

