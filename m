Return-Path: <linux-renesas-soc+bounces-16975-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC99AB3679
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 14:02:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2C347A798D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 12:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B87FD293452;
	Mon, 12 May 2025 12:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZpEa/1Kr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8CC29292F;
	Mon, 12 May 2025 12:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747051319; cv=none; b=YUAt1E5hv3qrU51UPaJsoZOjzw5Vs3XL0OQrxLw/+DnDeL+zjsRJysLQr7lW3BI5H+ieh1Hp48vnZ8xBOObD6UAtEoG76OErfjooKWWFnweCnbQPZtU/vpWIN2D37kjPtq0PkejLBn2pJPd2xBZ9wfb9S4J8nPAACn9oEI9czCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747051319; c=relaxed/simple;
	bh=KWgvMAO4K1mNt0OZ1RdUoNM3mYP3PC51EL202TpMAQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xzfl1SJDJIwPv0OJURNuYXuNtLcKtXpwyJYfd9b27YLkze9VYZ8JKm6+yo5JHWbaqgSIFBZaUsy2tXQUlSJ6QzpV6s9gg+hxfRnoqFww3uLx4W4NO5om2Maqy8nf3fZT/ckV+NmlKW8aewTu7GIdmLzljeOH1KZPuXZbv+N5L68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZpEa/1Kr; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a1c85e77d7so2388139f8f.0;
        Mon, 12 May 2025 05:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747051316; x=1747656116; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jLJVLjVIRNcIHnxTaw9HxnIWG+CtfSeCj2P4M8tU46M=;
        b=ZpEa/1Krg9vgAB0DDZRw3HApbteUYNxi5HkFtpa20txMDQHE3Lwli0vNE1P11y5PXM
         xtQkLz/3t4TlrhOEm2LwofybIcNoy7cTamkNnsu9QqOK0Sqm39SEZsE10cRzi6DTgpWH
         iJGsCH8AheVO0Fkgg5BwIfHfQuf5S8oM/uKZXilb5nYnFTmtvEZdnFFLK5WNhyWlIYVO
         sgFEkl/IHeYoR/hJQRh/dK8jg3FSLSI64ziNaMJVrnHQmTAKEfOK7VzSuOb011d1ocbR
         EBmlMIUOH6xRTwxfLAD7AaaA1kl9x92Gxf8B04ZtNo6hPyZYFoTeBCurbLVioHXVStnF
         He/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747051316; x=1747656116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jLJVLjVIRNcIHnxTaw9HxnIWG+CtfSeCj2P4M8tU46M=;
        b=Kujs2UZuKttM/oqJU5o76COuj3/nQca45p/l1wryqYuRPHlX3X35per9L4BwT7TXOp
         J6641OPWzjNZ0Ht2OPG9VAAUe/Xt5n172Nfydje2+JxYg6GyBmYyEslLJfYqJ9rqJkKE
         XxrYg4rX8NywK8gvmlWUPIKyZa/xLtrRSovFbAEpYsejuvEgx913zAP8krKh/rwncmwi
         O8Qca4w3ZGnc5yF40xroC7mryq39PXpFUCgsXED98hHjjXwxZdU+ewiVU456U47uyJn+
         O/iuvD6z1NNU3a/xqdKjUI3Rfpi/BtqfwD9aRvoOPN8pmdo6yZu2dhZAqv01pvME2XB4
         fkfw==
X-Forwarded-Encrypted: i=1; AJvYcCXQgOupCXAHrab9VJA5agV/K6asckf/HXMhBlItCvq9AFwTKv1D/wxOFAkCtFLmuveJYSjg/nDBPZfwOXN4Xtq9LEo=@vger.kernel.org, AJvYcCXgFYe0Nk3dr4A0x1dXUeSxEcjufDZFG9gC3Kdru8rqkxSO/aVP8INDsePXOvvC+6TS4Z+dCGR82aE4aqS5@vger.kernel.org, AJvYcCXu3fsX83Trx/9slhknJ2D5rDoIjwN5vM3R8suCmuzcYAVoD/A5MdRCzD+36TXOmBUdscOZB2aJ8o1Q@vger.kernel.org
X-Gm-Message-State: AOJu0YwuGmG/xXvAd9ksQobWpPPzTrPVQ/kfevE8xt2pXkTmETI0axZ0
	PdyNf98gHK05BGBRqxFtmupsiGkA3gnxmghOeyEWECxLxTc/bzzIFKHquEQGYqVsR6wJEMKpRtM
	Mmk+ef2t3Mip/GbIT5Yr0ASm+FSw=
X-Gm-Gg: ASbGnct5ANZuDRPXpCkC1b/qVcxu3pJQV8Es0/7n0HKTbHo69YjYuZnYDohglU0YRre
	P1ef08xP6xTW3d5KhN6Aex692Gp7KLJbFanLHixReekwwbv4kYwb4rFIzDXGKrE0R8usd2FFh3l
	cWJIXZcJnYE/OjfzNkUOcBDApshju8EP/o48gWXvxaiA==
X-Google-Smtp-Source: AGHT+IFk51E71SGFXWQToQBrKc9lJsRATe+u4B3hYGRyU+GlbSWTBex+VUQWevQItC9UKpsGV9rJCDGVr/VutENn9RY=
X-Received: by 2002:a05:6000:2289:b0:3a0:b784:883f with SMTP id
 ffacd0b85a97d-3a1f64836f4mr9290450f8f.23.1747051315923; Mon, 12 May 2025
 05:01:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509-sapling-exhale-72815a023ac1@spud> <20250509-dwindle-remold-98b3d03d0631@spud>
 <CAMuHMdVWznEm4Kg-MvgCT5+cBtdwGi9YrzFK6mBaoPJ+VK8S+Q@mail.gmail.com>
 <20250512-disaster-plaster-9dc63205cd6e@spud> <CA+V-a8sJUsNsF+AT1v3ySLiH9RGwDukMHHOC44JuV4JE3YKEpg@mail.gmail.com>
 <CAMuHMdWcfH7RfYnX+1vx6zFo83oGAW25kSAH0fW8Nb_LQ4PV_w@mail.gmail.com>
In-Reply-To: <CAMuHMdWcfH7RfYnX+1vx6zFo83oGAW25kSAH0fW8Nb_LQ4PV_w@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 12 May 2025 13:01:28 +0100
X-Gm-Features: AX0GCFt-R2izv5Pf4TZGUme5bt66ZDkczAtT9CVVS9BSmAPnq3CowydfwZp3ZF0
Message-ID: <CA+V-a8sob3Me1JcQopymEtWZXCqGLyQZHu8n4X_5m8OKj0wFoQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: cache: add specific RZ/Five
 compatible to ax45mp
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Conor Dooley <conor@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Ben Zong-You Xie <ben717@andestech.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Mon, May 12, 2025 at 12:05=E2=80=AFPM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> On Mon, 12 May 2025 at 12:05, Lad, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > On Mon, May 12, 2025 at 10:59=E2=80=AFAM Conor Dooley <conor@kernel.org=
> wrote:
> > > On Mon, May 12, 2025 at 11:01:26AM +0200, Geert Uytterhoeven wrote:
> > > > On Fri, 9 May 2025 at 17:39, Conor Dooley <conor@kernel.org> wrote:
> > > > > From: Conor Dooley <conor.dooley@microchip.com>
> > > > >
> > > > > When the binding was originally written, it was assumed that all
> > > > > ax45mp-caches had the same properties etc. This has turned out to=
 be
> > > > > incorrect, as the QiLai SoC has a different number of cache-sets.
> > > > >
> > > > > Add a specific compatible for the RZ/Five for property enforcemen=
t and
> > > > > in case there turns out to be additional differences between thes=
e
> > > > > implementations of the cache controller.
> > > > >
> > > > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > >
> > > > Thanks for your patch!
> > > >
> > > > > --- a/Documentation/devicetree/bindings/cache/andestech,ax45mp-ca=
che.yaml
> > > > > +++ b/Documentation/devicetree/bindings/cache/andestech,ax45mp-ca=
che.yaml
> > > > > @@ -28,6 +28,7 @@ select:
> > > > >  properties:
> > > > >    compatible:
> > > > >      items:
> > > > > +      - const: renesas,r9a07g043f-cache
> > > >
> > > > This name looks a bit too generic to me, as this is not a generic
> > > > cache on the R9A07G043F SoC, but specific to the CPU cores.
> > >
> > > So "reneasas,r9...-cpu-cache"?
> >
> > Maybe "renesas,r9a07g043f-riscv-cache" ?
>
> "renesas,r9a07g043f-ax45mp-cache"?
>
Sounds good to me.

Cheers,
Prabhakar

