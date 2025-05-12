Return-Path: <linux-renesas-soc+bounces-16971-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DC8AB347F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 12:05:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3B7217CC80
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 10:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 843EC25B1CD;
	Mon, 12 May 2025 10:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cb5cSO3m"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EF9255F5A;
	Mon, 12 May 2025 10:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747044347; cv=none; b=uaHI8iUBNpUwtZKsA9qvT0t6ANNYwWU6r3CpuJxWAHQLJ3WR0xtVUMslLq4nyDEdo9Zup/Y1arZWroWrvvk2tAuDYsDxXoS8IvCAVEKwO8OsWYn6nFq+v+H0fQRW8SeLuyDeFRJW55j00PMrOvfkR+TO1yxRz4Vxwn/AmwlUseA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747044347; c=relaxed/simple;
	bh=kriW8vZy3c5r+bH7zxmwSEx9ONWQNoFoXgvOYWc6mfo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LHrT7OS0Vvc88bD+vrLTHBOLdT8mCVPyGTceWMwPNiS0umnjHV6gyCf85j7X8gCox9T3emzsYw1Fc8aJ7+JvgPtk0zgwvlpqQF0PXg//jvzQRlg0bPfk8rICMuav+95lPHEYeTC6eD+Bm1w19uFv2PYIm9XUZjFxDBZc5w4oLNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cb5cSO3m; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a0b9625735so2148270f8f.2;
        Mon, 12 May 2025 03:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747044344; x=1747649144; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wWrnZKTmDa27byamh1hKNbF5CE+D6DlGjHH+M4r/udk=;
        b=cb5cSO3m0yMJQCsPqNBIdieBGQrUTx6XdOyOryysNMvNkZJSbu0Q8NTgxZ2qOYkPMh
         HU6A9t3+dGDO+sztGy/akqmftxC3GvrvZPRnbg4WBTHV6wsOolFAmtGBd6aaGH7ndszg
         WUzyPzRM46QE9pc11E8glW3rRyViMmNQVC6A5qN7S/7umkOLGx8szJf2iC21qCbLelxZ
         A/SOMDpgSaILsRRBRc8zNRwGQKSLEx+DX24oKhq8nv09LvBfwhzw7MMBLMuAiS07dYWr
         QUvOF80nzt+F3s0QbcJOm5elWBkF3OTs8oMj3xq0XxnsPDb21YTpiFk+eU8AoDRvifcK
         Eo5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747044344; x=1747649144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wWrnZKTmDa27byamh1hKNbF5CE+D6DlGjHH+M4r/udk=;
        b=jALAos0IPw6ZfQMS7Kk5F+LHy7jq4oJGNfOdVE3eXk8e9w9bA22VGxAqy4dF7k8jd/
         U220FSL2AeL9cb1iuRYTw9oYri9/o+bxRj+L1Iez7EeW/c6IFWf1EQe5/mcAwvpnUEF6
         GjJvAO2hswoCxYFaPW5c+CK5zXAJIu/R5EJ6J+ukYFgun/wl5LtF8X7YaTxHVWCB/oUK
         EF2rkHw5f/0+v/IjTPsizTYYbWlcnGxJsAH12+xzP7uY6bm3sUduvfmW7iCqyfOrQQ6M
         iqklpqLKKOwVVhPHcquSUvVFGL13WDuzgqzFZUwoTwQMd8L4AqTCzANhLB8Hl+OTZEtN
         0YSg==
X-Forwarded-Encrypted: i=1; AJvYcCUIM1T9J2/7HPehkQ+Khnog+Dvv14pKRVZEuEMzZVLGDjYkgVocima9IGpjAKp0f/SP2+/5xEZ3t4bd@vger.kernel.org, AJvYcCWTITAI7e4NdEQIGrzONkQJmU/XJUNsDjJPxO/1cXBQ3/RFKpR2TO4cDxGos1PosvHPPB8NkFyzbUl8pKR6@vger.kernel.org
X-Gm-Message-State: AOJu0YxNDNYkMqWRqNW1JQzqWbNYb8oWEXkeCis1N21Wf040MLQV4HAF
	ufx7Z4o9WrunLcO3vK1MDyXTAwRyTZYbDRkfHj9RJzp/+EV7QTkQdkKBWNaY01OhRfMFY7Lvwmk
	eljekm9alQHgptOO3t83qzCYpPNs=
X-Gm-Gg: ASbGnctsSv/bfvNLKqOYojTKoTvBIcdh6xJY3tCOluxoiTsel41bYlUkPLJLQ+DDWEj
	QQbAG/lKZWsixDgFmX0Sci44hLLw8X1s/l3Eo1mnIEw29uO+zXIvoqykXHgv9cGe6bISDrIc9cp
	Fs6wE2GU13yXheQbS8XVNQGqHT4zZueoQ=
X-Google-Smtp-Source: AGHT+IF988+YYtCFKDfHfq0riU8jX0iVCIlEgn39eMhT5b0J5UZn6atp+YZiqB2f2vhp3l6T+P2n8HzWKXXURplcMAg=
X-Received: by 2002:a05:6000:3103:b0:3a0:8495:cb75 with SMTP id
 ffacd0b85a97d-3a1f6423243mr10400388f8f.9.1747044343759; Mon, 12 May 2025
 03:05:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509-sapling-exhale-72815a023ac1@spud> <20250509-dwindle-remold-98b3d03d0631@spud>
 <CAMuHMdVWznEm4Kg-MvgCT5+cBtdwGi9YrzFK6mBaoPJ+VK8S+Q@mail.gmail.com> <20250512-disaster-plaster-9dc63205cd6e@spud>
In-Reply-To: <20250512-disaster-plaster-9dc63205cd6e@spud>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 12 May 2025 11:05:17 +0100
X-Gm-Features: AX0GCFvlNSGSQ3PtDGg0yEHkC9yOSWx2r_Q2w6kDcWVgBNfDLkKNDhCtbAm5VKc
Message-ID: <CA+V-a8sJUsNsF+AT1v3ySLiH9RGwDukMHHOC44JuV4JE3YKEpg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: cache: add specific RZ/Five
 compatible to ax45mp
To: Conor Dooley <conor@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Ben Zong-You Xie <ben717@andestech.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor and Geert,

On Mon, May 12, 2025 at 10:59=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Mon, May 12, 2025 at 11:01:26AM +0200, Geert Uytterhoeven wrote:
> > Hi Conor,
> >
> > On Fri, 9 May 2025 at 17:39, Conor Dooley <conor@kernel.org> wrote:
> > > From: Conor Dooley <conor.dooley@microchip.com>
> > >
> > > When the binding was originally written, it was assumed that all
> > > ax45mp-caches had the same properties etc. This has turned out to be
> > > incorrect, as the QiLai SoC has a different number of cache-sets.
> > >
> > > Add a specific compatible for the RZ/Five for property enforcement an=
d
> > > in case there turns out to be additional differences between these
> > > implementations of the cache controller.
> > >
> > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >
> > Thanks for your patch!
> >
> > > --- a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.=
yaml
> > > +++ b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.=
yaml
> > > @@ -28,6 +28,7 @@ select:
> > >  properties:
> > >    compatible:
> > >      items:
> > > +      - const: renesas,r9a07g043f-cache
> >
> > This name looks a bit too generic to me, as this is not a generic
> > cache on the R9A07G043F SoC, but specific to the CPU cores.
>
> So "reneasas,r9...-cpu-cache"?

Maybe "renesas,r9a07g043f-riscv-cache" ?

Cheers,
Prabhakar

