Return-Path: <linux-renesas-soc+bounces-8503-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E0C964893
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 16:35:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DD6F281041
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 14:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 061D01AED54;
	Thu, 29 Aug 2024 14:35:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C70433B1;
	Thu, 29 Aug 2024 14:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724942099; cv=none; b=UrYh8pBVg4O4P1a6uD+SrS3WwGwVTaXVq3MsIyeYbPNX6hAUYLYK7jCdJvxeRQWtdLhlGT2BCrOuh+4uQO4Kp1XyJyDyePvrhdHWg9aonBLu8M/Qh2+q7w2Tbj8Ezzu74GH00OXdsTxGesZV/cKJzXS28mzArVE7j1dadvwjrio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724942099; c=relaxed/simple;
	bh=XAALFjp/NR1bfS++lDuCUQU75ZusEVRBbA70eUgzF9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=swOvkCKY5In1WSKnNpvJ81Okwy+FS+Yzu5qWY1hrMLPNALTDdrpEp8+s2cEUwh/NyB4+kgCxsd56BET9rZBoKvFdVPAI17RAYa69v62tnKTTZWpaETOCtUiHnzlfiDkSyhbZd/Ayg1XAym5YCro84jQuiu/MRHXySbBUOBqxGf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e13cda45037so772524276.3;
        Thu, 29 Aug 2024 07:34:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724942096; x=1725546896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3sDsODZm9I03lBNUvN7iX7XME4qFqazcIonu1CpL+3k=;
        b=tIB540CyZFjNUKXyi58JJdswBGPI0Qb89xiM+QQXrsHLdMubX3U0nrm/10udjQ8mzc
         W7RTtTWUFr5lBYrkjmwi3S1enYa0EtdOAmz9KdJ9rgn6/B0B0zZZnHTjXN2UCiMYfe+K
         C4hNDQMQwtGqHT+3LEzbQKPZ5fjEBIaDsRYr7sOjBzrnA6nNXfvQfMqIJGeBsTLIbNni
         UykiSwIOas/z/B2dbTZryuHGVZxD8WcsEMWMi4KQt6n9Gk4zwqJ8Asahx/ymbX8Qoxiu
         uFZ2sJ92uk7jsUod8TQltngIkBx9wsQRsv94ORd5YPVDcQgPe5hyACjXcBNb8nvCtme6
         o82Q==
X-Forwarded-Encrypted: i=1; AJvYcCUb3w2xUhoD2S/wVVpBM25n8Q8PL+LV550t6UQvaU9EmmQIIzLu5f6cdkOByY+jgNJC+oooKkAZ4si/kpTCc6Wc1QQ=@vger.kernel.org, AJvYcCV7kFFAVSMYD8QEGRzjUW6FcfPKNxiaJjEpLNZX4q1UgDQE9i6JDGInmmMXdta9swGi/aUgEkfmsGgLquAH@vger.kernel.org, AJvYcCVM3iukNm7xnq7RViH2pafSbeEUOwBDyldRCvRDbYpymRU0/jBfWtiKfjTSf/tNaiSVjpWa5BrkcAO+@vger.kernel.org
X-Gm-Message-State: AOJu0YzI9pBbcqCma+YfHMy+tEigCxlkvOuEHAdT9rfmHLGESBCKb9ug
	91YIwmgzX67B3LawE7sFPWD3sAVKiphz9Y+8VnnDoRKthHAk7BA02uyPc115
X-Google-Smtp-Source: AGHT+IFES/69AVwfVAEORSVewuSTxTLF5Jz4A0BNtx4b3jKDSgTqBRcD85DHBy6IQ6dLsM8ifocSHw==
X-Received: by 2002:a05:6902:1583:b0:e13:dfdc:d84c with SMTP id 3f1490d57ef6-e1a5a6e45dcmr3193690276.0.1724942095981;
        Thu, 29 Aug 2024 07:34:55 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e1a62656f3fsm263775276.9.2024.08.29.07.34.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 07:34:55 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e0875f1e9edso727001276.1;
        Thu, 29 Aug 2024 07:34:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUjxQEnRoyesB8fdTFDnD5nxScmutUf+WHnGNyyZkYPZAB0auFiIptnc6Jf0opsonxeiSmRaBd+YLxRR6e30T+aHW0=@vger.kernel.org, AJvYcCVGuD0mHGSTbp5t5ZGrIrstJjjCVnc9qFXi2znzXhQvsgF6datQ//CbuLb3UEvVKO2JnJ+rRxiAYUOGJkJf@vger.kernel.org, AJvYcCX5+w9/dYe71DfKO7JUi6EUZgQoy/9stQykJr0kuyv2Zn5PbD1/7hfZMFY2mlT7yWC/huQhzcSNt3vY@vger.kernel.org
X-Received: by 2002:a05:6902:15c4:b0:e16:572a:4d85 with SMTP id
 3f1490d57ef6-e1a5adf1836mr3361931276.36.1724942094764; Thu, 29 Aug 2024
 07:34:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1721999833.git.geert+renesas@glider.be> <1a3d4ff8ce34a5e676d1cb1fafd40525378e29a4.1721999833.git.geert+renesas@glider.be>
 <20240730162435.GA1480758-robh@kernel.org> <CAMuHMdUwATmjM3E7WmwnCK739CwuyZH1w_YVYbroDcWEpzh8ig@mail.gmail.com>
 <67hcoj3haiptjh4f7qvaz4xwcdamr3x33xxrxusuwq2t3veiln@z2ggc7razty4>
 <CAMuHMdXSxMzzM6WgwObbymdWHcqUU2r6BOyS7ZzqSBx_gsWftw@mail.gmail.com>
 <c91167d8-df24-4a3c-bb92-811bd1543be3@kernel.org> <CAMuHMdUOi-jNLdfnG1iWORa8=EnZjM+DpREsWPyc9RMQwW80SA@mail.gmail.com>
 <20240829135845.GA297607-robh@kernel.org>
In-Reply-To: <20240829135845.GA297607-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Aug 2024 16:34:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUTju=fZ4x5qAwkrRKF8HxvwyKgBD7aD1rPWHGyGFKD-Q@mail.gmail.com>
Message-ID: <CAMuHMdUTju=fZ4x5qAwkrRKF8HxvwyKgBD7aD1rPWHGyGFKD-Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] dt-bindings: fuse: Move renesas,rcar-{efuse,otp}
 to nvmem
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Arnd Bergmann <arnd@arndb.de>, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Thu, Aug 29, 2024 at 3:58=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
> On Thu, Aug 29, 2024 at 11:10:41AM +0200, Geert Uytterhoeven wrote:
> > On Thu, Aug 29, 2024 at 10:55=E2=80=AFAM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> > > On 28/08/2024 22:10, Geert Uytterhoeven wrote:
> > > > On Mon, Aug 19, 2024 at 1:11=E2=80=AFPM Krzysztof Kozlowski <krzk@k=
ernel.org> wrote:
> > > >> On Wed, Jul 31, 2024 at 09:37:36AM +0200, Geert Uytterhoeven wrote=
:
> > > >>> On Tue, Jul 30, 2024 at 6:24=E2=80=AFPM Rob Herring <robh@kernel.=
org> wrote:
> > > >>>> On Fri, Jul 26, 2024 at 03:38:06PM +0200, Geert Uytterhoeven wro=
te:
> > > >>>>> The R-Car E-FUSE blocks can be modelled better using the nvmem
> > > >>>>> framework.
> > > >>>>>
> > > >>>>> Replace the R-Car V3U example by an R-Car S4-8 ES1.2 example, t=
o show
> > > >>>>> the definition of nvmem cells.  While at it, drop unneeded labe=
ls from
> > > >>>>> the examples, and fix indentation.
> > > >>>>>
> > > >>>>> Add an entry to the MAINTAINERS file.
> > > >>>>>
> > > >>>>> Reported-by: Arnd Bergmann <arnd@arndb.de>
> > > >>>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > >>>>> ---
> > > >>>>> v3:
> > > >>>>>   - New.
> > > >>>>>
> > > >>>>> I would expect that the calib@144 node needs:
> > > >>>>>
> > > >>>>>     #nvmem-cell-cells =3D <0>;
> > >
> > > So this is for mac-base...
> >
> > No, mac-base is not involved.
>
> It is because that's the only case that allows #nvmem-cell-cells in
> fixed-cell.yaml. While fixed-cell.yaml allows additional properties,
> where it is referenced in fixed-layout.yaml does not.

So all of this is normal, and you should just never use #nvmem-cell-cells,
except in a node describing the location of the MAC address?

When no #nvmem-cell-cells property is present,
of_parse_phandle_with_optional_args() (as used in
of_nvmem_cell_get()) returns zero anyway

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

