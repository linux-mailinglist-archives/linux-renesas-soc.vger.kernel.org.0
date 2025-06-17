Return-Path: <linux-renesas-soc+bounces-18459-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD55ADD08E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 16:53:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CEC4188138C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 14:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBCA620A5F2;
	Tue, 17 Jun 2025 14:47:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272911DE8BE;
	Tue, 17 Jun 2025 14:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750171644; cv=none; b=uCPgJAxBu6SHcd9oJ4x9MvTuLTYQN6G09YLjZROZf15U5upAm6ePrc4wi0egawtxn8NYsuOMn2OF5ZGScRv/GTWKZr89llocB33/R3aMI/JlrFkyKMxAysXv/8HUAfteBNREAY61iXyRzkJ8JuiTXeaYIVLtTY8KVyhLSAhAZfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750171644; c=relaxed/simple;
	bh=kNOBX3kDwcJCVjRwO63OOerW1N3E3Inq45ML+Jh9mRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oiHUk9Nztl0FW3eTd7FaLDpPjG7gCQo1eCOqp+LRE1pKMQ2rMUdgvu1aK8Q1rc5NbSC8AoS6qfk2/XkexlifAXtHRvjOOsRpFiFBkxWgjxp8A9DBdnhhnaQkGWH5B24YrZrzTcIscSZADPxAnPkbZxwVSEJl6kWQW/GctfsVR04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7cadd46ea9aso918484985a.1;
        Tue, 17 Jun 2025 07:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750171641; x=1750776441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZL174OVf+FE8GUAaly+9Noj4AvnbyoVh06lJ5C/YSZk=;
        b=xAHuEttRpWtypHO80dKxdkyE/zBippV/2iQa72XXN+Kbke2ktt++xv3JXNKEt40HRr
         nJvvaC6lnEBrFD4ONgb2Qy/c+FU+beKnyiJ+xgb1Hh+BevRTzK3w737+bSQZUQAF3DtM
         hWpiw1FLcSyfq7Wul90K9sjJ7gSsPZ9+ptp9dyiup54Ri5tdQoFx149/D570ZVTdpdh4
         HY5SUMbLyptPi6+e84IBE/NBRI5KPuanEqSeINNIeJmS+dDMZeLeN9eE9aBfBtqt3oe7
         9JydlogqbU/IQWeWFZDgAIRCmjGtEBZnD3+yTxv6io5O95gYRZWNs1WbI3crOiKUP1AC
         Z/gg==
X-Forwarded-Encrypted: i=1; AJvYcCUw734szWdmteJW18++k6r7MCXwwOwpiObrbI/KWGEQ5g8unTWwy/Q5Lk2MK59z6gvWI3npQvMHgPHTwEfO@vger.kernel.org, AJvYcCWL7QHeVZZ4BROfX1o3Upkrr75OWMAOlSpMXVSbNYtIUEdUBRJ1GQRNZ705/kviVfUiVSW1akrgRF7O63X2dlerEp8=@vger.kernel.org, AJvYcCX6MpU6JHW4sqfJMcW5In1zPz1FBQSAmH5TFUJfzFeMBfX21LNlYBccuhj0pwKEEMWkA9iVZ7omCWEsC3v5@vger.kernel.org, AJvYcCXfNZjXAvB6aah50IvTb8HvKzCbPK2tE0cHmC6L12MzCU/s//19tQadWXF332P2li9ZIZa/NQnq66lu@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ2DXVRPqzirdDg0G/BIHMJJzID92+NOG1Y1FsCLick+1eoXOJ
	JUZREXzrLGo8FUcYg3lrIDagsz+Qz0ffIecKdfS3SWLxq92lPozXXhyws8uM6V1M
X-Gm-Gg: ASbGncvJshj5rYXBq6aX0cJZDxlLbjoQcqfyIbeCxaraanBQVQZYpWsMu30PyyvtaXD
	2aWWXIA2dS1TtNS0xZpt1Hvj4MxSSv8QQIgx2hoiyKPevK/CmrD6/rRyzBMexTBDZStvzkAmaDb
	I35eoVVudodQNlplclF9zNVdha8i4BGc/hQVCDCs7xtAdYtQ5oXTmZmBtHX9/xmLSMrt0ZemSuX
	o6IQhB6souRc6W4WwpCKyAg72QOJMQOeHW0uiR+0mj7FwZ/uA5MYzk3UoMOGIL11cNZH8FntEBs
	emkJVWXdkfhe2p3sXs46MvKWRBZLl8AcnlRW0N0K7xbH56o6JkMRFHSaXGyvy9yMz2DZPOXQUpl
	j2yvbY+vPPAfKH+/Zpf+TK7rCspZo
X-Google-Smtp-Source: AGHT+IEYti1h5NrKENasCOdwjBAWss/NVzwxJLdBrl4NNVRcapEG1Xs+MWS7kM3UPTWCsZ22hLozIQ==
X-Received: by 2002:a05:620a:4101:b0:7c5:3c0a:ab77 with SMTP id af79cd13be357-7d3c6c096ffmr2103611185a.4.1750171640703;
        Tue, 17 Jun 2025 07:47:20 -0700 (PDT)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com. [209.85.222.170])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8eac910sm663345685a.72.2025.06.17.07.47.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 07:47:19 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7d20f79a00dso846008185a.0;
        Tue, 17 Jun 2025 07:47:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVh+de6tLvxtYHL7Uy63G8xEtD7+7fq6NovJgAh5clxmiF9I4///XaaRK6IJVa7i1MUsyN8NFdOXa4DElOl@vger.kernel.org, AJvYcCVpYw58VOP4BaVBHCniK4VS+x0X3ZZX7fyKAdID3Bjl2v8t0JUiGzTfUrsHH36j8uERyW0R6o/TmRMBPj1y@vger.kernel.org, AJvYcCWeReIQ+0uEI8+Lx1xkjfpTCRoPuAwOfak2p1nE25uRq3DlErU8DzTciEOYIm5JBvd5LBR2V1Vf+yjl@vger.kernel.org, AJvYcCWesG/TpqL5g3CkxWtMG03HPazrEQo0D3X82b+dDbRhLBgBTFDmAfCJseFwzispylyU9Z7vB19kx4JmyGpR32Dm6Co=@vger.kernel.org
X-Received: by 2002:a05:620a:244d:b0:7c7:b5e9:6428 with SMTP id
 af79cd13be357-7d3c6c193f7mr2182882985a.22.1750171639228; Tue, 17 Jun 2025
 07:47:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617134504.126313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250617134504.126313-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWfsqYvdL16hrbWug3PhK1XrSunaWtduajRzViKBRPeCA@mail.gmail.com> <CA+V-a8sx9iuUjn3uvSqq3Sd=JeTj_UMyDiLzisrnj1uQw6nbGQ@mail.gmail.com>
In-Reply-To: <CA+V-a8sx9iuUjn3uvSqq3Sd=JeTj_UMyDiLzisrnj1uQw6nbGQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Jun 2025 16:47:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXn+Bhhp1KdeX+86ceG8-Tu6-k32Q4e35tr4rnS6ATzww@mail.gmail.com>
X-Gm-Features: Ac12FXxX_-svUz3B-XW3PKGFENxEpML0XitXkiF8yDYZJw0qOf4W2v_oYmV7urM
Message-ID: <CAMuHMdXn+Bhhp1KdeX+86ceG8-Tu6-k32Q4e35tr4rnS6ATzww@mail.gmail.com>
Subject: Re: [PATCH v12 7/7] arm64: defconfig: Enable Renesas RZ/T2H serial SCI
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Tue, 17 Jun 2025 at 16:04, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Tue, Jun 17, 2025 at 2:57=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Tue, 17 Jun 2025 at 15:45, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> > > From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> > >
> > > Selects RZ/T2H (aka r9a09g077) SCI (serial) specific code.
> > >
> > > Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> > > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Thanks for your patch!
> >
> > > ---
> > >  arch/arm64/configs/defconfig | 1 +
> > >  1 file changed, 1 insertion(+)
> >
> > I don't expect GregKH to apply this patch (or better: I expect GregKH
> > to not apply this patch ;-) so IMO there is no point in including it
> > in this series.
> >
> Ok, got you.
>
> > Thierry's original version is still in my queue, together with the
> > DTS patches, waiting for the RSCI DT bindings to be accepted...
> >
> I plan to send a new version for RZ/T2H DTS/I which includes fixes
> from series [0] squashed and also mainly update the model string from
> "Renesas Development EVK based on r9a09g077m44" to "Renesas RZ/T2H EVK
> Board based on r9a09g077m44". Is that OK with you?
>
> [0] https://lore.kernel.org/all/20250613135614.154100-1-prabhakar.mahadev=
-lad.rj@bp.renesas.com/

Sure, please go ahead.

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

