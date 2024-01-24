Return-Path: <linux-renesas-soc+bounces-1786-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8BF83AAEE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 14:29:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EEB81C213D9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 13:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7EB177F09;
	Wed, 24 Jan 2024 13:29:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BF277622
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jan 2024 13:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706102950; cv=none; b=GuKJOq0ENwCMBL3WALhcXhYPByDzi2BU3gIVIkYSPkrcdp2nop6HufUiALRL0vrW7zgMCuTsY+lNAI2ipXwh6FKcxh17aqi46uBeOi7TzC38RWYJQ7flBniEMl1MF9BHg8TKnr5qbw1aPRRib0ciwfdhLKb9b9wv2ItFf48ZObo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706102950; c=relaxed/simple;
	bh=bn237oNNBVxV2loLWX7bfWroyrVpzSqvkxztvCXqKaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W9d5DHPBJeUXuTjs1yoHOdeohAiAKSVnVl44RqsWa8UHMaeyOEQFiJAOeZuLGlQ51GsLi0bdo+PTQfAwTnfiZQvAndb/ZUjN9PogpLODxDDUArWxZcchdVCm3jEDyLfLmevcV8YlZiB3hBtfdjbb+piSaXysxDvDzn5pzgUkQ9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5ff7a098ab8so46081177b3.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jan 2024 05:29:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706102948; x=1706707748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=he8G+pRaInKaEAtDzkFzp7UpMo9IbkEJtQjmYrpewCQ=;
        b=jqkg4jnnzWNrXxbAbFLfbMqMjYGCSwYS34hJvtqf9zQHUmqxdbyUZcoRrcdSBDE0RE
         iNoPI0KR5kk2qjwbH/nPkSEjb0WodrO4VQ906JaelMlX0WsAl0rrbt9bOsgUzt31h7u2
         z1rdJTuZhlQvSHu9HgKGHmIuYAKxEjhoUt0NRNKr4zgLVRQ29ASJVqokXO1il5nH4re+
         lIXT0mIy3QhLBvSnlYIdg0Yup1QIaSOxgHFGWlvQIT1mHIXmdqzv73HqfQjhdnRkMwA8
         wrOOE7zA+p9DKTwQIgGYQkQczzN+7jUDFYJqTlkPJuXvG4UOT555PHJeaPVQLPGBOI87
         U1lg==
X-Gm-Message-State: AOJu0YzOKKRTzfdMRqO9wIYfk92mlxZ720/exzrP62ciu2rUfjdK8hMO
	/h6nZVHobh6mlahHeMXq8yHK+iYIuZACqQjXKz49KgmmVs+oS7bcy0nbMLGoOEg=
X-Google-Smtp-Source: AGHT+IH2KU2yJWkp7bddIy8mYUMP4hLwSi38AE9KBUPHMKnOLWfBfyqXXHnTU1myZ0+AnYGIF1DXEA==
X-Received: by 2002:a25:b28d:0:b0:dc2:2224:b589 with SMTP id k13-20020a25b28d000000b00dc22224b589mr697239ybj.74.1706102947898;
        Wed, 24 Jan 2024 05:29:07 -0800 (PST)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id c15-20020a25af4f000000b00dc265f5ee1dsm2737596ybj.20.2024.01.24.05.29.07
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jan 2024 05:29:07 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5ff7a098ab8so46081037b3.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jan 2024 05:29:07 -0800 (PST)
X-Received: by 2002:a81:5354:0:b0:5ee:6403:8931 with SMTP id
 h81-20020a815354000000b005ee64038931mr781036ywb.55.1706102947486; Wed, 24 Jan
 2024 05:29:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1702309604.git.geert+renesas@glider.be> <7f9c840ed44dfd57da545e87b5937b58f35cb9c9.1702309604.git.geert+renesas@glider.be>
 <ZbEKR7GO_aeHsmwe@ninjato>
In-Reply-To: <ZbEKR7GO_aeHsmwe@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Jan 2024 14:28:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUYrjtvSpv=_501+f_SD0_gkPu9ezqAED3uC0Qd0n09+Q@mail.gmail.com>
Message-ID: <CAMuHMdUYrjtvSpv=_501+f_SD0_gkPu9ezqAED3uC0Qd0n09+Q@mail.gmail.com>
Subject: Re: [PATCH/RFC 7/7] arm64: dts: renesas: r8a779g0: Add White Hawk
 Single support
To: Wolfram Sang <wsa@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Wed, Jan 24, 2024 at 2:02=E2=80=AFPM Wolfram Sang <wsa@kernel.org> wrote=
:
> On Mon, Dec 11, 2023 at 05:01:22PM +0100, Geert Uytterhoeven wrote:
> > The White Hawk Single board is a single-board integration of the Renesa=
s
> > White Hawk CPU and Breakout board stack, based on the R-Car V4H ES2.0
> > (R8A779G2) SoC.
> >
> > For now, the only visible differences compared to the board stack are:
> >   - The SoC is an updated version of R-Car V4H (R8A779G0),
> >   - The serial console uses an FT2232H instead of a CP2102 USB-UART
> >     bridge, with CTS/RTS wired.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Modulo the HSCIF pin issue:
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> I like the split up and the naming. Makes sense to me.

Thanks!

> > +/*
> > + * Device Tree Source for the White Hawk Single board
>
> Maybe add "R-Car V4H" here? Maybe even "Rev 2.0"?

The existing r8a779g0-white-hawk.dts does not have such a comment.
Perhaps it should be added, too?

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

