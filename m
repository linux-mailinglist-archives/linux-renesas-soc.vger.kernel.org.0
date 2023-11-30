Return-Path: <linux-renesas-soc+bounces-463-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 519267FF467
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Nov 2023 17:08:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DCD02B20DCD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Nov 2023 16:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1490C5467E;
	Thu, 30 Nov 2023 16:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9442197;
	Thu, 30 Nov 2023 08:08:04 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5d3644ca426so7348967b3.1;
        Thu, 30 Nov 2023 08:08:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701360484; x=1701965284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=USygHB1/ocQdMpKf1b2YTxPh0tPPcvtaGsWmUdR471Q=;
        b=ViBlFzmrbA1vF+vqcYy0ZOc9bIP7h6YjdGgK0TsgE0lWPjlVZGo9JcoO4usMgauR8K
         KY8KgCR7HqWdGey9FnVNugfv2692hZZk4KYP9awi4yGF4pa7dXjyJIwULC8kzh6WMFeo
         NHDqQ4AYAa2Cr8oT6EWqaxBEKlQX4Bo7fiT+0rk/QfAwJBdC6mLHvy7UYQIDtpU96RAJ
         wdmICy1n94PhC6C4444Ub1SHbW1YY9R/gkMCg0v/33XoooL04zdiFFJaqgVpHAI32XaW
         4VA9Mmk3GQQ4Zefjac61yyAkUdbrJgfYoa0DtL4acgLrwlgCT2csKCL1E+xL/vOcPfu6
         3RJA==
X-Gm-Message-State: AOJu0YzfD6qFDb9FqNy77abFATTaxDqQ54HuhF/5uL/VCXllUwhV6DO2
	Kr9ejbNoKmWG4af7zGSaj1oZ7HT7FXmkPQ==
X-Google-Smtp-Source: AGHT+IEFKkW5Av9BnrhCW4DDFMvqdGP+gzyLzUbdXw0wLznVuZFKrOy3CfPfLyRXPddaJf6vFBC5gg==
X-Received: by 2002:a81:ed12:0:b0:5d3:42a1:8ce1 with SMTP id k18-20020a81ed12000000b005d342a18ce1mr2639272ywm.23.1701360483666;
        Thu, 30 Nov 2023 08:08:03 -0800 (PST)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id r20-20020a0de814000000b005d39c874019sm207355ywe.66.2023.11.30.08.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 08:08:02 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5d3644ca426so7348507b3.1;
        Thu, 30 Nov 2023 08:08:02 -0800 (PST)
X-Received: by 2002:a0d:f903:0:b0:5c9:fed2:89c7 with SMTP id
 j3-20020a0df903000000b005c9fed289c7mr23030225ywf.32.1701360481877; Thu, 30
 Nov 2023 08:08:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87fs0zc14m.wl-kuninori.morimoto.gx@renesas.com>
 <87a5r7c13d.wl-kuninori.morimoto.gx@renesas.com> <20231128153413.GA3301324-robh@kernel.org>
 <87v89l4gl8.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87v89l4gl8.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Nov 2023 17:07:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXkSEaAtYqAVsns+fo3XJs0og84oed_VNCgrhwcBB3cQw@mail.gmail.com>
Message-ID: <CAMuHMdXkSEaAtYqAVsns+fo3XJs0og84oed_VNCgrhwcBB3cQw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drivers: clk: renesas: enable all clocks which is
 assinged to non Linux system
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Rob Herring <robh@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Aymeric Aillet <aymeric.aillet@iot.bzh>, Yusuke Goda <yusuke.goda.sx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san,

On Wed, Nov 29, 2023 at 12:13=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > > +static int __init cpg_mssr_reserved_init(struct cpg_mssr_priv *priv,
> > > +                                    const struct cpg_mssr_info *info=
)
> > > +{
> > > +   struct device_node *root =3D of_find_node_by_path("/soc");
> >
> > 'root' is '/', so I find this slightly confusing.
> (snip)
> > > +    *      scif5: serial@e6f30000 {
> > > +    *              ...
> > > +    * =3D>           clocks =3D <&cpg CPG_MOD 202>,
> > > +    *                       <&cpg CPG_CORE R8A7795_CLK_S3D1>,
> > > +    *                       <&scif_clk>;
> > > +    *                       ...
> > > +    *               status =3D "reserved";
> > > +    *      };
> > > +    */
> > > +   for_each_reserved_child_of_node(root, node) {
> >
> > Don't you really want to find all reserved nodes in the DT rather than
> > just child nodes of a single node?
>
> The all devices which we need to check (and ignore the clock) in this
> driver is defined under /soc for now.

"For now" is the right clause: all module clocks are inputs to on-SoC
devices under the "soc" node.

However, once the clock drivers become aware[1]* of programmable (core)
clocks driving the real-time CPU cores not running Linux, you may need
special handling for these, too.

[1] On R-Car V3U, the clock driver already supports R8A779A0_CLK_ZR,
    but it is a fixed clock that cannot be disabled nor changed.

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

