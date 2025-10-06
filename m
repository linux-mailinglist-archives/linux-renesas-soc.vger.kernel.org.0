Return-Path: <linux-renesas-soc+bounces-22719-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFFEBBE879
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Oct 2025 17:47:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D5CE3BCD8D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Oct 2025 15:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC1362D29DB;
	Mon,  6 Oct 2025 15:47:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3548A1E230E
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Oct 2025 15:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759765635; cv=none; b=sk1MtY12gOckfu50trP++EmmAcd4bcP6sWSTvGKyu2512Ea3qyTjojrI800uBCWjN2HxqsaMc3xgGT1+VqFjaO2dIIPOg6y25jEZagTF+TSA9jjmkCx+cglRMIiXEIKZshaI8+4dI2VHrrzugl4ei1MJ/VmDgdFgwmSfsYVpJYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759765635; c=relaxed/simple;
	bh=VXVFUxV6lOZVeHIaGD8b7dszxK+l1QNd9a0CBcsxlVc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U+rJBMs+e4ZuXyYn7wViD0xZbBDjHblaE3gwO5xGUv6aM4W1CF3HZAcXV00+1JTkOZOZz5ZiXNWBqHZNEKM+h3JTOlWJlEqioFO84/QP93QboCJVXcBTzQkQYhSvbIdC6clFhd17DZAY9NR2I4vXVaPDVkWOy+axc8dFgnLkH2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-55784771e9dso2899603137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Oct 2025 08:47:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759765633; x=1760370433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=baxwn0lz/mgVFFB21nG5BxqQzMuKCxMSfDK/zsQ1nbY=;
        b=jIStlDlg5vmFLY20lNWruB2F7gGR82GSocy1JQ8Blr+XYekaomAikiPpiCnDHPXOAL
         6ZUaZfEkmFwcpmNjXqWZ8AOwCWG7S/q+A/8bCrBbWZixOmYGxTcWU9N3uabiXaBAHPXC
         /tELVNP7B1fdVB1aALQygosikz2sbRgPoIb3Jpyy9JsoVI7/AWXPGqrdEOVCae1te0bP
         585QeeDQ+EXHeKo/lmg1iXILIFBrZiooOw7i+yxXR7EsYNRfOQbkMY25F1oYY3LnigcC
         VpE1Itdz+2kCss76/KK9d3Ud/VBxdc2vTQZNV8i+d0hlEjpBh64EzozzmJRDKFFspBe3
         2zYg==
X-Forwarded-Encrypted: i=1; AJvYcCUNjPuIbq40EGko9CVblb4CDuENIMACkL4p/KtoJn8Aqc8VUbgKzRRW1rfWf+n5DJ7jH/Z4yXKp1Q219qZmGGZsXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnzXhowjN52x4KQl9/dB4NdrIY8MsPxcEY0KjavBEFVKQPS8JG
	wg0AKW4qVCQ9HXGCiSRLrG88D6SZxEu3vJdNlsq70S61SDqb/tcAlU3yg14x7xab
X-Gm-Gg: ASbGncu5/gcoW2KIROzstV3kb0pZdZHEblr/havaoWSs18qf6+N/lH/A/aS9Sj58WHI
	PXJsIQmCSH/zNTzCXi2WLJWVnaXeykXcg9wFReINA/LnEa0JH2kQvlXx9x1WJcslOApV6B963et
	hpdn9NbG53H/gM+UauTq6ttLwOZguaX7gTYB6NMkTPjzZOlrIaEymUjhv3YfDxRniF7/+JMyaX+
	gJf/il0YzzyMeVc2IW8uSAR88BBgY7EOFJhGPg3N9Ay3HHbianj9FjHUG5jjHIgKihgi+PKlXFM
	pWPENGrzXRNA3afsaiDp4vqvNtJH/JOUcKqrWWuO/G4g7RfMUk7Zm+d/CLvBw0Awmz31atU0NcH
	fQTxvwK7pEpMQUO8ZPYQl3YNoZDm/z959AFWLUmWSDZUaaB1Wy0NmhtfGdaDDRHlunG29YtJVXV
	ktwBNZVSxjuiVLpjPipxa+EXoZOiZ8jw==
X-Google-Smtp-Source: AGHT+IHG9G0neiQNNbiOQaRsGHVQMUQjNzLBo8av+F8dvT9FaO0xWS94/DtBI0Tp5D93Pm8sd6ZwHw==
X-Received: by 2002:a05:6102:50a3:b0:57d:9305:63db with SMTP id ada2fe7eead31-5d41d08b522mr4257752137.15.1759765632835;
        Mon, 06 Oct 2025 08:47:12 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d5d39fb8e2sm82491137.16.2025.10.06.08.47.12
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 08:47:12 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-59dff155dc6so3289310137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Oct 2025 08:47:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXb3jeKc7ZSbcAvPmyQ3rS0c7nXdCGTo/ko9mEqrKpQgi51K0TAWVygJPj+Eyiu7sprW5gLDwYp9ot+rtmn2CSM3Q==@vger.kernel.org
X-Received: by 2002:a05:6102:41a9:b0:59e:68dd:4167 with SMTP id
 ada2fe7eead31-5d41d028226mr4721054137.7.1759765631839; Mon, 06 Oct 2025
 08:47:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251003215318.39757-1-niklas.soderlund+renesas@ragnatech.se> <aONmeDgUPCn8rphM@shikoro>
In-Reply-To: <aONmeDgUPCn8rphM@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Oct 2025 17:47:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXvn52Kh242mSdb+bFLowQ9jgyegRGh6ZZaY0z+Qm2faA@mail.gmail.com>
X-Gm-Features: AS18NWDKqcFvLxyfi7FxcJ-zF3zj1ASVGyV53_H6SUlUTrSHB21YlZyQvRY9HqQ
Message-ID: <CAMuHMdXvn52Kh242mSdb+bFLowQ9jgyegRGh6ZZaY0z+Qm2faA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: renesas: koelsch: Update ADV7180 binding
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Mon, 6 Oct 2025 at 08:49, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> On Fri, Oct 03, 2025 at 11:53:18PM +0200, Niklas S=C3=B6derlund wrote:
> > Use the more modern adi,adv7180cp compatible for the CVBS input found o=
n
> > R-Car Gen2 Koelsch boards. This aligns the bindings with the other Gen2
> > board with the same setup Gose.
> >
> > Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatec=
h.se>
>
> I think this could be added?
>
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>

I don't think I am the first one suggesting that ;-)

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

