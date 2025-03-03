Return-Path: <linux-renesas-soc+bounces-13910-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BAFA4C580
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 16:43:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7129C3A1CA1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 15:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6A422135BB;
	Mon,  3 Mar 2025 15:42:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55318142900;
	Mon,  3 Mar 2025 15:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741016541; cv=none; b=M3hfir0XABXC++pOmvOUCIENEJn4bblJaGuElPmL8dgGh9tnX85S483qbHTwZYd22L5XJxUyOR1wxb2/w6/M9FyysE+alQYe26PJxkuNyt8neifSDpPlrt/94Qi+6+kFoMCnilKq+RI2KsaLbOVWztM5Gl/2/ALDL96KxNMry5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741016541; c=relaxed/simple;
	bh=c0rbulC+YHbb5daw/fx8ZNMv/ZzxDGYND2fLyrNaARk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wc/BvZDaPUvUOPXcm6vTQKpxbcY38AS5ar1xk5+tJynb2zJ2hg7nCcXNYJGdm/iVh88VRgBvuVoJ8ycrmvZ56Hkn4UumpfWsLXZ71mo1rGFhZiQu7HkAiRmyQgO9XkHfPNvyfBfmL/HEop/Bg3v+xIk4tFS7OvtWsKbjqrJwTIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-51f22008544so1831345e0c.1;
        Mon, 03 Mar 2025 07:42:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741016537; x=1741621337;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PEmVeCz4Uzs+jWGBRQohRmwcfz59z4FOg768eOIxkzI=;
        b=LZKkJf+NLf/tCAzzIU6Ue4Zl6mCftNbAwQX0/5lSQiRGZ9HqUEeLo7arL0eHoRk7KO
         /NTDS0M61VJk+sqa2uJ+Ni8aFmT5NWEaeH/BU38d7Cz/Z/85J1L3YljWozAGcoUy5OB2
         d/3r02KEukPgyrWETBXqT20ck36bOrl26BYsfASXQ377ihVzKfDVAOm0hVYhu5pC/ITu
         gK5RlO33Sn0SYV3rDknhurfaiG2FPspEM4hz3bnpGo9LyUlWkvjHAGfb0ON+NFn/FAc9
         u7OhovW7vyWstodHeSS76qqgkseqh2qwD0DVA0Af+YoGAenAUvzGZmjm8Zb/Kshy3W3U
         igUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoTRIvMalkwkxv0gv5mK+e9mrs/mKS/XN9xkD5+TJSu/+tQA0wYEl4AiiQnY9t7Gc/ZKz+p6sabaXJ0h+0@vger.kernel.org, AJvYcCVE7WO+xXs8DKssAUShQeXlsHwMN+TNuxtc/n6TArG/6Ng8wW267pyuq6xKnQAqb9SPeZvYUKgF2RWs@vger.kernel.org, AJvYcCWpRLeuvqquudC+VDbdzTtLdAAHaxo49nWYi9M/XSqPjEWAluNqTrMvr4OVTJV2VN5/sw806jztIWfusLkR@vger.kernel.org, AJvYcCXTSl+RDowaLTB0nndzGiIZnWPVzyS+EiZTvzmWAUsb/oe92cv7WjmKeosUds4NOOyJxPGUdyvHeSNpQIF2uPb2YOo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6LhIiWVRODNM7MV0DNHe1TVLSAqHfb0Gwgn65rVnLnsDIrser
	DFcg3Kb1TyiQXEicEgJAodc/qso4GOA5OsuwZeE9ZHgPhNb/gBd3vQCLIB08
X-Gm-Gg: ASbGncsL5uVW4KvtHymQANQ509j1LOOX2RqzpsmSPOZwLKxtvKatOwv29SpAm5k9Pt7
	eFwcqZhfmJKSO8lrSraBBOOCGM7iI1cIBgLHbB54f7vCwCcjnpRjqJeHLBVFBJMmpmouCUxBvMr
	UXMNS+bOhe/Gkv4+JlVKHiyDLVeGHUQBFSBn2qijws/K9EbgQPJPzTCbOwLrQcsv5hlyMbj3hsF
	PizWHPaabWoYmUmcWpE627h/CLD+YwGBGsI7Gax64MyqTWV/1YBvSENTV6cqp9LwtTjY/w0utr+
	rsmRQgRyhR4dumDA5sIrLuBn8Pmp6CGQhdQN2wSAlyo0tM4X9d99mIvpyWNLYWHFB2US95M4YG1
	1hFwcPUL+qO8=
X-Google-Smtp-Source: AGHT+IFN8Ax3GZXDB2gNFK+7EvOvj5OalczQ2YcALagsFj9Dcvyyy/URUcct3XyM2U+Jw0thh+U9NA==
X-Received: by 2002:a05:6122:8d3:b0:51b:b750:8303 with SMTP id 71dfb90a1353d-5235b8cccffmr7484558e0c.11.1741016536644;
        Mon, 03 Mar 2025 07:42:16 -0800 (PST)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-86b3da71bd4sm1897940241.0.2025.03.03.07.42.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 07:42:16 -0800 (PST)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-51eb181331bso2156588e0c.0;
        Mon, 03 Mar 2025 07:42:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU1esdBp3qSbUfDSQXiQWhTlunCA5fqkRdOim8v01d3HSe2SYzo/uXMVrtNLQWii+9xF3Cszv2qIS+2@vger.kernel.org, AJvYcCUtuFjlbCfyaBoje4tuBmZct49RLuI53EYyAhBSPp+DCsupT2u/eaVk4Kvha6ndx2spQ2AQ3jlFSJYGXFuf@vger.kernel.org, AJvYcCVeevKLnNvsRTMylFzY8RQoOTloHf+/ftPDJbtXTLsui56WTdIOesE8FlOpAWOlZWpka56F5Om/CXuNCd0N@vger.kernel.org, AJvYcCWR9s9yAv4J7h133c1Rz2xOghfDu6VeTfEJuPo6p3WHOf/BZr0Zax/8XaXguODTelZvEG7MUJcbK5kdBVwwmkLMLmI=@vger.kernel.org
X-Received: by 2002:a05:6102:6c1:b0:4bb:b809:36c6 with SMTP id
 ada2fe7eead31-4c04495290fmr9157605137.11.1741016536000; Mon, 03 Mar 2025
 07:42:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250226130935.3029927-1-thierry.bultel.yh@bp.renesas.com>
 <20250226130935.3029927-4-thierry.bultel.yh@bp.renesas.com>
 <20250303133540.GA1681980-robh@kernel.org> <TYCPR01MB1149261DFCD83872B2F94435F8AC92@TYCPR01MB11492.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB1149261DFCD83872B2F94435F8AC92@TYCPR01MB11492.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Mar 2025 16:42:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVj9=TysOOMc6pg-Yy2XRA4MCUw2e+5GwEKzMTcpnLbXw@mail.gmail.com>
X-Gm-Features: AQ5f1Jp1wUchYyU3RiyC7BHY0Mt9sgg6vrImyJ3xNHKGwXzepnM3aITEspelp3g
Message-ID: <CAMuHMdVj9=TysOOMc6pg-Yy2XRA4MCUw2e+5GwEKzMTcpnLbXw@mail.gmail.com>
Subject: Re: [PATCH v3 03/13] dt-bindings: serial: Add compatible for Renesas
 RZ/T2H SoC in sci
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, 
	"thierry.bultel@linatsea.fr" <thierry.bultel@linatsea.fr>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Paul Barker <paul.barker.ct@bp.renesas.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

On Mon, 3 Mar 2025 at 16:10, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> > -----Original Message-----
> > From: Rob Herring <robh@kernel.org>
> > Sent: lundi 3 mars 2025 14:36
> > To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> > Cc: thierry.bultel@linatsea.fr; linux-renesas-soc@vger.kernel.org;
> > geert@linux-m68k.org; Paul Barker <paul.barker.ct@bp.renesas.com>; Geert
> > Uytterhoeven <geert+renesas@glider.be>; linux-kernel@vger.kernel.org;
> > linux-serial@vger.kernel.org; devicetree@vger.kernel.org
> > Subject: Re: [PATCH v3 03/13] dt-bindings: serial: Add compatible for
> > Renesas RZ/T2H SoC in sci
> >
> > On Wed, Feb 26, 2025 at 02:09:22PM +0100, Thierry Bultel wrote:
> > > Document RZ/T2H (a.k.a r9a09g077) in SCI binding.
> > >
> > > Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> > > Reviewed-by: Paul Barker <paul.barker.ct@bp.renesas.com>
> > > ---
> > >  .../bindings/serial/renesas,sci.yaml          | 64 ++++++++++++-------
> > >  1 file changed, 40 insertions(+), 24 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/serial/renesas,sci.yaml
> > > b/Documentation/devicetree/bindings/serial/renesas,sci.yaml
> > > index 64d3db6e54e5..2c4080283963 100644
> > > --- a/Documentation/devicetree/bindings/serial/renesas,sci.yaml
> > > +++ b/Documentation/devicetree/bindings/serial/renesas,sci.yaml
> > > @@ -9,9 +9,6 @@ title: Renesas Serial Communication Interface
> > >  maintainers:
> > >    - Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > -allOf:
> > > -  - $ref: serial.yaml#
> > > -
> > >  properties:
> > >    compatible:
> > >      oneOf:
> > > @@ -22,6 +19,8 @@ properties:
> > >                - renesas,r9a07g054-sci     # RZ/V2L
> > >            - const: renesas,sci            # generic SCI compatible UART
> > >
> > > +      - const: renesas,r9a09g077-sci      # RZ/T2H
> > > +
> >
> > Perhaps explain in the commit msg why the 'renesas,sci' is not applicable
> > for this chip.
>
> Would something like that be explicit enough ?
>
> "The SCI of RZ/T2H SoC (a.k.a r9a09g077), as a lot
> of similarities with other Renesas SoCs like G2L, G3S and V2L,
> but a different set of registers, that moreover are 32 bits instead
> of 16 bits.
> This is why the 'renesas,sci' fallback does not apply for it".

FTR, the registers being 32-bit instead of 8/16-bit wide is the least of
your problems... If it was just a SCI with 32-bit registers, you could
use "reg-io-width = <4>;" and "reg-shift = <2>;", and add support for
the latter to the driver (it already uses regshift on non-DT SuperH).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

