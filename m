Return-Path: <linux-renesas-soc+bounces-16972-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDC2AB3590
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 13:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A7F918941A5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 11:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69A012820D0;
	Mon, 12 May 2025 11:05:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3B327AC3E;
	Mon, 12 May 2025 11:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747047931; cv=none; b=hD7JWSb5g1MnUU4LvFaBu51elf+1qk+wAH8umTtmFx6AutLHDKv/qVPZZdVFuIKjVN4kRgq3/MDmhw+9lRRjanKMMODlAS8Q7vh7YZJBvVFmkvsqX0YkWLXhDRq8vcGDcO+2faVFha65A1sOm2HY2xx7hyv5/sDWD0kS8vUHgk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747047931; c=relaxed/simple;
	bh=Dwn9+V8p9uACWSGO3V64qxMICTHHE9j6Cf7EJJVmYqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iIelxdf6v6AiLq4mMaGJqizzmt+/yUxMEdTU406+Kpr/pB7dm8vhM+xa+q8DX08sUAOJAsMBQSJmqKNGmRO2kdJo/N+I+Ux8IYnq+Aqnrq/r5b8GWQyTwjiqJHhcde1015tj9qS0cibyh3YAwT6MXGjo8Ov1UUxwu3YbchkXZe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-476af5479feso51281441cf.2;
        Mon, 12 May 2025 04:05:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747047926; x=1747652726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/0nyFVM8kY7M26CugFUGaMuLf40Ltidiv/gy6m4GKs=;
        b=wFufxKPaQfcK7CBvtW/9xDleZHf6AHe+cNUxn5P+Y+BH4xC/DWZTgjORJHuQEnl/Mt
         k0Vdz+FNIkpksw1Bq9SN8RLUfVrr8HUSU4AQnZbf9JaKism81gWVkXoP8oLNLBu2VN+2
         o9naiopi2NccLx7aWZYjXelPr19NpmsPLKslkXtrJOHuAVMWkfvSBV1Yr6ouKLS0RJt5
         FafjaOM11XsQ0hyaeNdl3H1aPeAdxjFZ47oC1SFMh1sVGP/+horqI0At1YWVuUiQgB1h
         NP3kLwAAqNq6vr9DpBziIAf+HPj5euOX3g5UF9fLKLYq8Ih6B6V3gKKgYkd+fDQoMmLS
         N29Q==
X-Forwarded-Encrypted: i=1; AJvYcCVBYo00ZzY9vO+TnC7IpOOJSGlKZOlkUjlhObZkmqlI0n5WEW2aoz4uhAUZtFvPpAkhJIOgZkZ/ZjP3@vger.kernel.org, AJvYcCVpmUxv3dqfl3yK/hYMlIbkp0fYuQPuHI7zKNwf4w4qgpQabxhMjxrPS2wxvCgbJMmTh/qefWozel44Zb8k@vger.kernel.org, AJvYcCXuXMZdmR5wU/+bcCD7YZya8zeMPmt1o0tTH4q+0j5VKVYmXdsYrXpthuSZIBLHDM4Ms6IQvFySH26AHKaGxgOsvPk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yws2eYOS+e9Vg5W1gh47OjrEnl4YldZvsgkjhAZORqZjhIz9WSr
	y2j4H2vVdoAIezuKuZE1UIBwPXeE2mmt1BWFy0G7COvykGrh743AkTk/wgUS
X-Gm-Gg: ASbGncsuShxrjoCwxJiH8Wy4Qgu17DYkSLVtEggD3Qt25q+E/QL4HM80B47e/d6rV1I
	a/zSD2N5cg0EPFXi9J2PZOKzOE7YPlnocR6rQa5V0S9b4t0yghf2xgFQKSEfB3FR1ufCTevnD3T
	10TZ66TxGhsvayF78ZqJukcxc9WzbFnwY68Cwxxnzk31FMGsanELEGMCGLCeHTJ4td/0sE+kdhl
	XlWHUSh20ogaKDkI5kip9nLrwICtQSMtru9HRzyne5Lvk2kVebfmprA/Ud4jCsWBsLmWIiS5GAs
	mvKeF6KH60BTfTF9jAzqQeciJAT9V8TDvjTiMbav228vqXRUqrMCw1m5oSTLpnliVjYYhx3nKOw
	0jVrpoaYs6PbkEh8uDw==
X-Google-Smtp-Source: AGHT+IHN2hzu165i447G++UZMOtBKC2/G3ipCkP1UCcnhVtPvRbaRRgEFCI3+No3fAx7piNaF60Y1Q==
X-Received: by 2002:a05:622a:10a:b0:476:8f90:b5b1 with SMTP id d75a77b69052e-49452762506mr199119431cf.25.1747047925901;
        Mon, 12 May 2025 04:05:25 -0700 (PDT)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com. [209.85.222.169])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4945246d1c8sm49676151cf.6.2025.05.12.04.05.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 04:05:25 -0700 (PDT)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c546334bdeso425024085a.2;
        Mon, 12 May 2025 04:05:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUNS3q1Wy/ZXCcZrDgEP2f/49NXcLI/PUku90cZc79fsT+BI9/11nbeZfzxrKAcQRMlJ7BukVL+b6NV@vger.kernel.org, AJvYcCUqkM9N6msCNlUF2MK/CnUzqd1P17BrAbzHvGMlkj5u5J/sXptrmjmWMDF7YTimxfxBhA235UjVufICZBKYVN4NMh0=@vger.kernel.org, AJvYcCWLFVIG32JilhkVMRGCXo4oE9zHUnPJXqbAA5tdUeQX1O8AG0JtLbp/ZOHIZy0hGkuZi4HyvuMjJGiPJ8k8@vger.kernel.org
X-Received: by 2002:a05:620a:2442:b0:7c5:9a1b:4f22 with SMTP id
 af79cd13be357-7cd0114d020mr1937195185a.56.1747047925157; Mon, 12 May 2025
 04:05:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509-sapling-exhale-72815a023ac1@spud> <20250509-dwindle-remold-98b3d03d0631@spud>
 <CAMuHMdVWznEm4Kg-MvgCT5+cBtdwGi9YrzFK6mBaoPJ+VK8S+Q@mail.gmail.com>
 <20250512-disaster-plaster-9dc63205cd6e@spud> <CA+V-a8sJUsNsF+AT1v3ySLiH9RGwDukMHHOC44JuV4JE3YKEpg@mail.gmail.com>
In-Reply-To: <CA+V-a8sJUsNsF+AT1v3ySLiH9RGwDukMHHOC44JuV4JE3YKEpg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 May 2025 13:05:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWcfH7RfYnX+1vx6zFo83oGAW25kSAH0fW8Nb_LQ4PV_w@mail.gmail.com>
X-Gm-Features: AX0GCFuhtlyY3Eqn_kBtywHJQj93m0KzA5ewFZiyxbSIYATMgySwwco2EFgn4Dw
Message-ID: <CAMuHMdWcfH7RfYnX+1vx6zFo83oGAW25kSAH0fW8Nb_LQ4PV_w@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: cache: add specific RZ/Five
 compatible to ax45mp
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Conor Dooley <conor@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Ben Zong-You Xie <ben717@andestech.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 12 May 2025 at 12:05, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Mon, May 12, 2025 at 10:59=E2=80=AFAM Conor Dooley <conor@kernel.org> =
wrote:
> > On Mon, May 12, 2025 at 11:01:26AM +0200, Geert Uytterhoeven wrote:
> > > On Fri, 9 May 2025 at 17:39, Conor Dooley <conor@kernel.org> wrote:
> > > > From: Conor Dooley <conor.dooley@microchip.com>
> > > >
> > > > When the binding was originally written, it was assumed that all
> > > > ax45mp-caches had the same properties etc. This has turned out to b=
e
> > > > incorrect, as the QiLai SoC has a different number of cache-sets.
> > > >
> > > > Add a specific compatible for the RZ/Five for property enforcement =
and
> > > > in case there turns out to be additional differences between these
> > > > implementations of the cache controller.
> > > >
> > > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > >
> > > Thanks for your patch!
> > >
> > > > --- a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cach=
e.yaml
> > > > +++ b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cach=
e.yaml
> > > > @@ -28,6 +28,7 @@ select:
> > > >  properties:
> > > >    compatible:
> > > >      items:
> > > > +      - const: renesas,r9a07g043f-cache
> > >
> > > This name looks a bit too generic to me, as this is not a generic
> > > cache on the R9A07G043F SoC, but specific to the CPU cores.
> >
> > So "reneasas,r9...-cpu-cache"?
>
> Maybe "renesas,r9a07g043f-riscv-cache" ?

"renesas,r9a07g043f-ax45mp-cache"?

There don't seem to be many vendor-specific derivatives of standardized
caches, except for "brcm,bcm11351-a2-pl310-cache".

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

