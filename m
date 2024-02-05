Return-Path: <linux-renesas-soc+bounces-2319-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEAB849536
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Feb 2024 09:17:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 044301C23E36
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Feb 2024 08:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DEA5111AE;
	Mon,  5 Feb 2024 08:17:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324A811185
	for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Feb 2024 08:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707121069; cv=none; b=bvl6rdaA/0m3bPkshBaY0BoUjxe3sE6W+2t/T86s/UYG+v6p1fGVWSeZJN677Owgtxs1E5U3ubwaJRcRiYlG8Pmk2pXpz0h2Q7lMNyWU4zfmH28XlLypmZxm8Hgn77S+y5kfkPJKhwIhB1/Pk2QAWcoQTmrAXQZDbwJN/z71PJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707121069; c=relaxed/simple;
	bh=W76qmMZSXgJEdBIIiyjQPmCvv9oNQcSMnqyAGnNX6K8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EVJhRjPnI3dzUyv3cEfiERnqZdA2VFSIveWm1resFEd0k86O1jSVVL8fDN4uzSpNDuiNs/ZMcOxTLyHBCtHi2CCgM4hSAYlj4trkGtCzqZCB75gmJ7ithOp4ATYI1rCsusIowZzx0XWvwr6Sd/ZXFK3whRYzVCauQR+sBOJnr1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dc6d5206e96so3697984276.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Feb 2024 00:17:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707121065; x=1707725865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XcNtUT3B2diGwQ5L9gVH68XeL/qWdYSYQwfgDjxmo4s=;
        b=CY+Sbq5NTGjkfUlj/aIt436V1lC9I9euIWUeIa2wteYbc6UzseawELKjA8R6JVE2na
         qP4q+qvWEc1aHZfiTD7Q1yTX3mEstpnl8pmPWuh8QIygraIFn07FbP7dsHUqFmVFszY7
         1Y3yfO7+zkzhvySW20mV7dMc+Pl3fZOOyjXNe9nFzXbxvBP58WoDnj8R6USy+Yk8Hylw
         lc8twN5mhRMjL/jWgnBm7f/H1ZFB4rtfWXOzVARkFkjHEi2KLoBvnmIlhORMclLK/iaQ
         +qR1qDtgiG9eGYJq3cT0dS+HWgH5U2SuCz/Oy80rsyj8gmj1KaDe7P4Gd59PvW4ZEVSK
         Hs5Q==
X-Gm-Message-State: AOJu0YxiliK7Gf5Jw/DN6BKbB6OK83YK0F0f0+1ib5miggC+uBVG1B0H
	/BYdDLPhFEVcA8C9JjC1EnxVEDS/uaWZyAnRU2Ruh54L7wMr6Jp96cjNCgdfPP0=
X-Google-Smtp-Source: AGHT+IFoQoS0vGRA+zAzY786mrQKzxTW3bB03MYFF2fO6rvkjNlV46j/VMKawFOxF/gjxSldoZBY0w==
X-Received: by 2002:a25:ac62:0:b0:dc2:3253:279a with SMTP id r34-20020a25ac62000000b00dc23253279amr7680077ybd.61.1707121065324;
        Mon, 05 Feb 2024 00:17:45 -0800 (PST)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id b6-20020a252e46000000b00dc25528fe9fsm1763925ybn.9.2024.02.05.00.17.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Feb 2024 00:17:45 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-60412866c36so40263957b3.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Feb 2024 00:17:45 -0800 (PST)
X-Received: by 2002:a81:f205:0:b0:604:3ee2:f258 with SMTP id
 i5-20020a81f205000000b006043ee2f258mr5033605ywm.45.1707121064915; Mon, 05 Feb
 2024 00:17:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1706796660.git.geert+renesas@glider.be> <7dbbe13428273c5786ddff6ea7af6724fcdd4de8.1706796660.git.geert+renesas@glider.be>
 <Zb59ceHI7FrUqjhg@shikoro>
In-Reply-To: <Zb59ceHI7FrUqjhg@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Feb 2024 09:17:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVq7T21R=stUSKMiC+XTaM1MSPngrDppzaaU3MXFLo-tw@mail.gmail.com>
Message-ID: <CAMuHMdVq7T21R=stUSKMiC+XTaM1MSPngrDppzaaU3MXFLo-tw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a779h0: Add I2C nodes
To: Wolfram Sang <wsa@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Hai Pham <hai.pham.ud@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Sat, Feb 3, 2024 at 6:52=E2=80=AFPM Wolfram Sang <wsa@kernel.org> wrote:
> On Thu, Feb 01, 2024 at 03:14:33PM +0100, Geert Uytterhoeven wrote:
> > From: Hai Pham <hai.pham.ud@renesas.com>
> >
> > Add device nodes for the I2C Bus Interfaces on the Renesas R-Car V4M
> > (R8A779H0) SoC.
> >
> > Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> So far so good...
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks!

> I assume DMA nodes are not there yet because you use these nodes for
> testing DMA when you enable the DMACs?

Indeed, DMAC support is not yet included.

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

