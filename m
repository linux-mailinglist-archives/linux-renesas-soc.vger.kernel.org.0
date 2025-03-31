Return-Path: <linux-renesas-soc+bounces-15188-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A884EA767CE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 16:27:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC51E18889FF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 14:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DC79213E9C;
	Mon, 31 Mar 2025 14:27:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B10213E6A;
	Mon, 31 Mar 2025 14:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743431244; cv=none; b=sWxHwExELe6CjUOeetYsXehzuj/53lry368GTV3d/P1CqEao5Y078PGSwyBvDTs2W9FsicJzIJ0Rsqn4UqjElCNx46h5JqcwJS5XSdmmakcIORQYi0GEgyT7rUE2FvFjCh1gLfAy7Nn4SySA2TqifG+LYgTcu4oqyD8A5HMFDLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743431244; c=relaxed/simple;
	bh=962YuXtpU5ksFklfgpYmzCBy8v+1KpCivvd2wNCNe7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oww2g/oZ0krLrSlPZMdeR/a8SUd6q6Y9b1Ni0Al1XCdlXGF+6aBEaUCd8Nf3yP1ipnOxKLhm+Fih+joUqbOMV9PCJX8kmnxlKD6gsJuzVgPDdZcKAjmkqPTUsXSFroEgJxIR3p/81A8f2XDdB0znRpqWJOIA/TVaaqeChvw/HgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5241abb9761so1905630e0c.1;
        Mon, 31 Mar 2025 07:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743431239; x=1744036039;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J6XaQosItH1NKthv6Ki1C0BcrJO53JS+zdZjEPD2oW4=;
        b=Xw+4jyQeodPQGRGqr/AVeIEboxo/epy27djbb8XwfbimSAfFwOaFdPJC2xTxCrUlXw
         3Z7iwCGw9sZ9W7ebILoYpr3INF/0ufpZy2UAmEjddk/C/z1k5pE2Ru3Ds5FSfcCV/9Sq
         PipbCU7TR+TecYfDeNn5qjXL5kA52dkbOpOfv/IALc93nmoMArUpz1HwRvWVOe8lS0tr
         GnPGmI3Sf5EuEHaaejhawDl5rwlv9ur3nUmNhn6q2YszTguBa995XH+2xABlWNgdRFrC
         RiDvEAO2Uqm25A9fzQ1cWG27u+xscOS5JNtPhcJJitE+LCkfRWseOCATopAZ5l9titBb
         w/Vg==
X-Forwarded-Encrypted: i=1; AJvYcCUYJ6iINQlhNxiPeSrNjTf4KJGEQJUMG9bdE2AM0rOwl4uPmd7NmM4GaDIZG3/zgNtWJlUPNPmRbOZAkZ3p@vger.kernel.org, AJvYcCVl0TgmGP803p3thl39V7/p0JBFxXA4XKBUc/RQA6g5qdgMxzTooAhFtsn3r9Tah1VzNzxPtQqwHMKCtOLEAUGFeno=@vger.kernel.org, AJvYcCW/Ph4zLhCxaN75Q/JjyOh5P95yWjXT6NLi22r/hcRa9kVdNMNcvNIzbz+cXEteNo8TWa20GReIAOlLT6OX@vger.kernel.org, AJvYcCWvdZmPoQvsRBjzJVA+j6crq1Bc3dzb3SeKOf1CoGmecMPC4jkekS7ZgfvjkUMhwEWzS0NYIJCMz/rO@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd2P8OHTZApnFoWSdu+rrFHfKWL/Njb176p8RncXf6GPuJOYX9
	98wlokmJFS1Y1OW53/Popt+B+5iEBvS9whfI0daPtxhNT3ZKVPmVXs8+ub5+
X-Gm-Gg: ASbGnctilmLwxNel0aqrABAHiqlJN1R0T8Ax2VlEDRaey3F8+aTUYRe0YEaomLzNe1d
	I3HQOmXWTf2RphrWU1uUKER4Je7KkIJSYPndhUmR6lb1yHevUhmuqDSazah/McHdc6+6oTiqN8O
	ztrM+aq9W/ubiTIcLIGAFHR4I57RaOAV0Wm+jGYjixPd02JO9HDhyRRWfY0E5uH5fM2i0Df3Cd5
	fZvBmzkBWddJIYLy68e+FwhmzPQ9D3BqreBTr+5+AJ6fsEZLe8y2zkYK7U3vEm8TIFgj3tyjxrp
	uyacNQgOjzGdfBWsV452aaIjfDIkyfW/K5gEmuolCZizsiPFDtufgwKwHIC1vJaqjJ86uTKIoFI
	c9ND1N7jodp9f7EjN5A==
X-Google-Smtp-Source: AGHT+IGMKDsEuWu+3UH6kdkk/JhE5asQywsja2YvMEEjUqwMT1Scwa9QHIsPjVuEjKa/ejasmBt06g==
X-Received: by 2002:a05:6122:8c06:b0:51f:3eee:89f2 with SMTP id 71dfb90a1353d-5261d3375f3mr4975459e0c.2.1743431239652;
        Mon, 31 Mar 2025 07:27:19 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5260ead785csm1560568e0c.41.2025.03.31.07.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 07:27:19 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-86feb848764so1997333241.0;
        Mon, 31 Mar 2025 07:27:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCURv3nn7BBSpUm7nb99e7lRj7ETyGwQTVNVRO6sZIcHKJZ9Ex3YzaENPshYioaiQ9lhxaGZNHYU68Fa8a/el8emCSQ=@vger.kernel.org, AJvYcCWfeSCRkDQ+Bg6qUQNtTxWgQHa+KNz7+Z7V9I5YiNklTOjzj+UquFmLz/rJsFEmJ4ywKKs0kHaIfD+ePT5H@vger.kernel.org, AJvYcCWglkhAjuD28lx3gpixLNc3FTuKcNET4XumGyBtyshAN/vl1J5ii1m3dgvkEUt6LytoTIi3fE0cVyoG@vger.kernel.org, AJvYcCXkbwB1AvFiBbfbdUiBrSplB/v5EWqnVUNxIvyYVBUYsf7gGGLd0pet/JerJWguwvhRRxNvCCZH3Gl0kDKB@vger.kernel.org
X-Received: by 2002:a05:6102:41aa:b0:4c1:9159:859c with SMTP id
 ada2fe7eead31-4c6d38970c3mr5342613137.15.1743431238962; Mon, 31 Mar 2025
 07:27:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331122657.3390355-1-thierry.bultel.yh@bp.renesas.com>
 <20250331122657.3390355-4-thierry.bultel.yh@bp.renesas.com>
 <CAMuHMdXeAueSWf50OhTnCxu3tFq6Rq8YLJ=r67WDnOfv0Yv-oA@mail.gmail.com> <TYCPR01MB114921C523043FDABA2A3EDCE8AAD2@TYCPR01MB11492.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB114921C523043FDABA2A3EDCE8AAD2@TYCPR01MB11492.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Mar 2025 16:27:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXyk_uqQBTK6PAKX0TnDiCCu7uwcuONpH5fPWebgnxYAA@mail.gmail.com>
X-Gm-Features: AQ5f1JrFvA2AXF3EQspH0f7LMRhi9yahu87wW8maQvQLJ-BG_qXMITRyp5k-rY0
Message-ID: <CAMuHMdXyk_uqQBTK6PAKX0TnDiCCu7uwcuONpH5fPWebgnxYAA@mail.gmail.com>
Subject: Re: [PATCH v6 03/13] dt-bindings: serial: Add compatible for Renesas
 RZ/T2H SoC in sci
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: "thierry.bultel@linatsea.fr" <thierry.bultel@linatsea.fr>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Paul Barker <paul.barker.ct@bp.renesas.com>, Rob Herring <robh@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

On Mon, 31 Mar 2025 at 15:55, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Mon, 31 Mar 2025 at 14:27, Thierry Bultel
> > <thierry.bultel.yh@bp.renesas.com> wrote:
> > > The SCI of RZ/T2H SoC (a.k.a r9a09g077), as a lot
> >
> > RSCI in the RZ/T2H SoC ... has
> >
> > > of similarities with other Renesas SoC like G2L, G3S, V2L;
> >
> > ... with SCI in other ..
> >
> > > However, it has a different set of registers, and in addition to
> > > serial, this IP also supports SCIe (encoder), SmartCard, i2c and spi.
> > > This is why the 'renesas,sci' fallback for generic SCI does not apply
> > for it.
> > >
> > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > > Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> >
> > > --- a/Documentation/devicetree/bindings/serial/renesas,sci.yaml
> > > +++ b/Documentation/devicetree/bindings/serial/renesas,sci.yaml
> >
> > Given we're now using the "RSCI" naming, I think it deserves its own DT
> > binding document.
>
> All right, but I have then several questions
> 1) I am not sure it can have generic fallback,
> e.g. something like :
>
> properties:
>   compatible:
>     - const: renesas,r9a09g077-rsci      # RZ/T2H
>
> ... is just enough, can you confirm ?

I don't think we need a generic fallback at this point.
You didn't have one before.

> 2) Should I also change the node name in .dtsi file from 'sci0' to 'rsci0' ?

You mean the labels? The node name is always "serial".
I think keeping sci0 for the label is fine, as that matches the name
of the instance in the documentation.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

