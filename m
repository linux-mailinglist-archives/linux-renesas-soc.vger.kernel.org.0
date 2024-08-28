Return-Path: <linux-renesas-soc+bounces-8470-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F40C963179
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 22:10:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B108A1F2588E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 20:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E40C1AC43E;
	Wed, 28 Aug 2024 20:10:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD22C1ABED0;
	Wed, 28 Aug 2024 20:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724875822; cv=none; b=IePhsjd3aOl6+WspnCUoVpVXxtThcZ/3+LqMWQ45idmBHQVCsHR99FWBW3+gUFXrPJqmEz0CPngtQx0TKOEAngzN8chEdMOAWnKMZkA4VfchG4ETCCEQ6FpB68WoGOcK6/+WIWpbhGqOU0zcmdo7zgseF8+LcZ/7k9Y500StwUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724875822; c=relaxed/simple;
	bh=V+q6J21kVe7c02P8nvTh3RuqZOXLUvxWG4URJm7B0k4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bfNCI8l2VDgvmnMkAdQhJtLJUxcLnU66EwqoznnHKRYtDYj2pg2dUW77/1uPNUqsXWYTZSEpC1pu/hIAIAxEGigeufIjn/gjSSmJbb6/UDJ6LZMR3OvmXSgXCs/kzmTl8WWTPvdCAdl3QKzFsZGj+IcLqneXq/VUh1LnqzjiTyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-699ac6dbf24so63360207b3.3;
        Wed, 28 Aug 2024 13:10:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724875817; x=1725480617;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H3fsTHCmYfDxrSsPAO72YHSKA5Wcfi0C92irrpmOidA=;
        b=jhoVQDJbHvSTly/1J0Q8P8bdsbAApsG1pTWP6xvca77zAi0/bn/nQYy2o/LUE1899o
         /AnD4sRAWMTRLXVjncrVIucFNyw88JSIyDd5GVhz7TUPn8ev+6LNbSS52r5K1nCYWUi9
         rbezlqY1a3fyG4uLiqlycyOpAgRCjWU1X/oIV6w/V6Wl+4l/DDE6vw7syrGbvTTY9UAH
         5zf50Jtwv60/0eVM39nFMJAKqcHPXCpK32HzvbL70qJDNE/3q9ncwT5uhhf6wIrkNXnQ
         pyZZxY+6y1Y5YhNSBsfR1pQhxSV+ifLwllrhEHH4eqFJmxyiQpNlJAKCQ+mBNZMKsz1G
         MZTw==
X-Forwarded-Encrypted: i=1; AJvYcCU4eJn3kOHdBZ4YWd9hK/ZIi0Gcf53V9CaAkEvZOKDvKgwiabORu7OsIIDhu0JQx197LkUHgMnjBAnb@vger.kernel.org, AJvYcCXPQiA3p6zCGIRC7IkXYl/7CCZDdEkjY/FfioIv+mJExQmqbfj+cVxOP7ml6IXWAX1y6W9pQU1sdDEIcmPE@vger.kernel.org, AJvYcCXW1aw2NJdgp/YmWjSrjSQ4ehTukkeyl2FcuPe2HsEQ7CH279VGZEcozXIbGVBYfefr2a/dJhKqwkMUgJOthAMVY/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXCTG4E4wrTWkElA3vTzyMj/Y6ml7lh98HEZTyY5d8CKFcWtNH
	XIhCTG3wsmy3RGecmSdzMMQIy4ScTDemibP32Y5RQd4PSim5Mycdabewx3zp
X-Google-Smtp-Source: AGHT+IHELkHhFAghogm47XLjLqS5AU+bvTRO9wgTaijpxIFX4RJBlWt1fk00b0IyarOessB0/ZmXBQ==
X-Received: by 2002:a05:690c:4b83:b0:6be:8c:691b with SMTP id 00721157ae682-6d2764fa0f8mr5791937b3.17.1724875816870;
        Wed, 28 Aug 2024 13:10:16 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c39dd47b4esm24901617b3.105.2024.08.28.13.10.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 13:10:16 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-699ac6dbf24so63359887b3.3;
        Wed, 28 Aug 2024 13:10:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVsKT9kydMZ94r4+bTL9rzzusbHatT222J9WPXp6ZN9EF09uhLw7anGsUmbHQInEvCpkiOq0D/kXABJJEcgiCyHURs=@vger.kernel.org, AJvYcCWBF9EYL4eqqYrQX/n/TeQ0+Gs0OqwcYcVvgJTFrJ9TrHwj6034Ncvnk8yXGXRNhNts8/6VGgf1dBwqk0zG@vger.kernel.org, AJvYcCWXHuk8WbSjrVdUejPKZ1InNBzOmPXYrX834IefNG5LEwNOBOYYITmcjA0TY+Rza1qYEkNTGhVogVLk@vger.kernel.org
X-Received: by 2002:a05:690c:660c:b0:6b3:8248:34c with SMTP id
 00721157ae682-6d275d3e7d0mr6369377b3.4.1724875815706; Wed, 28 Aug 2024
 13:10:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1721999833.git.geert+renesas@glider.be> <1a3d4ff8ce34a5e676d1cb1fafd40525378e29a4.1721999833.git.geert+renesas@glider.be>
 <20240730162435.GA1480758-robh@kernel.org> <CAMuHMdUwATmjM3E7WmwnCK739CwuyZH1w_YVYbroDcWEpzh8ig@mail.gmail.com>
 <67hcoj3haiptjh4f7qvaz4xwcdamr3x33xxrxusuwq2t3veiln@z2ggc7razty4>
In-Reply-To: <67hcoj3haiptjh4f7qvaz4xwcdamr3x33xxrxusuwq2t3veiln@z2ggc7razty4>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Aug 2024 22:10:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXSxMzzM6WgwObbymdWHcqUU2r6BOyS7ZzqSBx_gsWftw@mail.gmail.com>
Message-ID: <CAMuHMdXSxMzzM6WgwObbymdWHcqUU2r6BOyS7ZzqSBx_gsWftw@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] dt-bindings: fuse: Move renesas,rcar-{efuse,otp}
 to nvmem
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Arnd Bergmann <arnd@arndb.de>, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Mon, Aug 19, 2024 at 1:11=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> On Wed, Jul 31, 2024 at 09:37:36AM +0200, Geert Uytterhoeven wrote:
> > On Tue, Jul 30, 2024 at 6:24=E2=80=AFPM Rob Herring <robh@kernel.org> w=
rote:
> > > On Fri, Jul 26, 2024 at 03:38:06PM +0200, Geert Uytterhoeven wrote:
> > > > The R-Car E-FUSE blocks can be modelled better using the nvmem
> > > > framework.
> > > >
> > > > Replace the R-Car V3U example by an R-Car S4-8 ES1.2 example, to sh=
ow
> > > > the definition of nvmem cells.  While at it, drop unneeded labels f=
rom
> > > > the examples, and fix indentation.
> > > >
> > > > Add an entry to the MAINTAINERS file.
> > > >
> > > > Reported-by: Arnd Bergmann <arnd@arndb.de>
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > ---
> > > > v3:
> > > >   - New.
> > > >
> > > > I would expect that the calib@144 node needs:
> > > >
> > > >     #nvmem-cell-cells =3D <0>;
> > > >
> > > > but after adding that, "make dt_binding_check" starts complaining:
> > > >
> > > >     Documentation/devicetree/bindings/nvmem/renesas,rcar-efuse.exam=
ple.dtb: fuse@e6078800: nvmem-layout: 'oneOf' conditional failed, one must =
be fixed:
> > > >           '#address-cells', '#size-cells', 'calib@144' do not match=
 any of the regexes: 'pinctrl-[0-9]+'
> > > >           Unevaluated properties are not allowed ('nvmem-cell-cells=
' was unexpected)
> > >
> > > Did you want 'nvmem-cell-cells' or '#nvmem-cell-cells'?
> >
> > Oops, I've been (manually) re-adding and removing it again too many
> > times during my investigations. "#nvmem-cell-cells", of course.
> > According to my build logs, I had it right at least once ;-)
> >
> > > >           'kontron,sl28-vpd' was expected
> > > >           'onie,tlv-layout' was expected
> > > >           from schema $id: http://devicetree.org/schemas/nvmem/rene=
sas,rcar-efuse.yaml#
> > > >     Documentation/devicetree/bindings/nvmem/renesas,rcar-efuse.exam=
ple.dtb: fuse@e6078800: nvmem-layout: Unevaluated properties are not allowe=
d ('#address-cells', '#size-cells', 'calib@144' were unexpected)
> > > >           from schema $id: http://devicetree.org/schemas/nvmem/rene=
sas,rcar-efuse.yaml#
> > > >     Documentation/devicetree/bindings/nvmem/renesas,rcar-efuse.exam=
ple.dtb: fuse@e6078800: Unevaluated properties are not allowed ('nvmem-layo=
ut' was unexpected)
> > > >           from schema $id: http://devicetree.org/schemas/nvmem/rene=
sas,rcar-efuse.yaml#
> >
> > Anyway, with or without the typo, the error message is about the same:
> >
> > - Unevaluated properties are not allowed ('nvmem-cell-cells' was unexpe=
cted)
> > + Unevaluated properties are not allowed ('#nvmem-cell-cells' was unexp=
ected)
>
> And if you test your schema or DTS with all nvmem (so also layouts)
> schemas?
>
> Apparently fixed-layout schema was not applied.

With today's dt-schema:

Documentation/devicetree/bindings/nvmem/renesas,rcar-efuse.example.dtb:
fuse@e6078800: nvmem-layout: 'oneOf' conditional failed, one must be
fixed:
        '#address-cells', '#size-cells', 'calib@144' do not match any
of the regexes: 'pinctrl-[0-9]+'
        Unevaluated properties are not allowed ('#nvmem-cell-cells'
was unexpected)
        'kontron,sl28-vpd' was expected
        'onie,tlv-layout' was expected
        from schema $id:
http://devicetree.org/schemas/nvmem/renesas,rcar-efuse.yaml#
Documentation/devicetree/bindings/nvmem/renesas,rcar-efuse.example.dtb:
fuse@e6078800: nvmem-layout: Unevaluated properties are not allowed
('#address-cells', '#size-cells', 'calib@144' were unexpected)
        from schema $id:
http://devicetree.org/schemas/nvmem/renesas,rcar-efuse.yaml#
Documentation/devicetree/bindings/nvmem/renesas,rcar-efuse.example.dtb:
fuse@e6078800: Unevaluated properties are not allowed ('nvmem-layout'
was unexpected)
        from schema $id:
http://devicetree.org/schemas/nvmem/renesas,rcar-efuse.yaml#
Documentation/devicetree/bindings/nvmem/renesas,rcar-efuse.example.dtb:
nvmem-layout: calib@144: Unevaluated properties are not allowed
('#nvmem-cell-cells' was unexpected)
        from schema $id:
http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#

According to the last line, fixed-layout.yaml is applied.
Am I missing something?

Thanks!

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

