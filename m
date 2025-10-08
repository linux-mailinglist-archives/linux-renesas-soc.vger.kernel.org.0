Return-Path: <linux-renesas-soc+bounces-22786-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0083CBC4397
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Oct 2025 11:57:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 616643512C8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Oct 2025 09:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 955A9223DFF;
	Wed,  8 Oct 2025 09:57:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1706E2BE036
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Oct 2025 09:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759917426; cv=none; b=a7w28sL3YUeIujsTbbvNYmW6ylJ7DTSkql0DnQAgM5sxpI0WeD3UTOeWl36Bs69vHANkSRGSOAN6XYSZO5p8hq8Qth/S2/w24QmmklK+5EfMxtVXfkGCeJ5m8lh3NPgBr8e5+AD9U/umBsq4QUJvjmlQcc38BsmeEvQh//teaCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759917426; c=relaxed/simple;
	bh=wSaoX9wAzgdSjXfQ1M7zv4B/Iix8At/KxM0d2Pds7K8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lTs4hWfXsFUagVtJOpq8/kO7i0R7gXacYwgOHrk5KgxUpK8ihWJYou5EUVD/z6AFKdfMbkscNAVn2MZmOijtWWByqyzcXgxNqxI5/Zk2YmmmzmbY8hbKM9SOacrOcbw1lko133hIPVqMZnZwuJzDJl4ltWgSBZNXPgRJjQNR/Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-54a86cc950dso1154849e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Oct 2025 02:57:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759917424; x=1760522224;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b8N55tCmF/DMY5b2AW2r04kBr6K7c7B8wSOVZxQmIvM=;
        b=n9qvU2RaqPn0VhLHg+BCDL9rN826bMd8vq6/GJWd8PBILUtXNeCnaBzUp7ZfkX/s0U
         kcB4t/Lg7j0nNZDpojt6B82NdUc8vX4Xf2ZR3ptB6EJ/Vm2hdn+Cjuh5QFFWgPeChS1n
         cQtDMEfJ9fVMRl8zTQUgVRaj4zl70Wiyp0iBuCmtPaFPoE84+ussD5iZET8Ps6LAxiOg
         phvIYmBt/19MvqKJoSpQ5+rnV41crbnsO4SqkokV7VbmLB0yj511RqztOyflLzyp1OpY
         G7ozSEeLfcxwdFmdtSyIqAwmH13BvYl+WZHpvhvL860xT5tcM9Xb6J3eMUVEWLWo5pEy
         TBvA==
X-Gm-Message-State: AOJu0YxrdiEFOlB4JsCuwMqXjO8VDVi3xP/NHbOVOtwdTfoBv3D4gYyo
	xRJ8Wu5L/bkmp+HncwDWlzuyd357W8L4EGIMKDv2YbcJu0sDcKdvx14FLmk9YUch
X-Gm-Gg: ASbGncv7B8K/VlRAig6R5/A+Une6LngtY2A0st8rkMG9afL90trZW/ahaq9uOi/piej
	NoON2mgqUglM2VoN/EH2MVmTk7vULwNf2AEhYmB2CSUGbbrsThQt1ZmL8ZAmRmmH5EYaIriAmzA
	zQDgbl8nlcLZiKU9ui3/bRW9PTc9TuOmyszqafQ529e8TbcVZLe8gthehVjNFp6HT/bVONxt4An
	zpY+ejYRlxhq29uy+kPxyXH1KshSc67d1uorTzX0fp/vmRzwNVqSBUFXzZeodyvJ4Pt2o7IgIzS
	Mxj+N3c/Wa8ITdOt104wmJtP6K/AaRy+ULO2cw7pnk2LefmLpHD6tH1SMQn/wiYR01fBHG5u0FV
	XMV7+aRrqWrNwwgVBPcU9x/LsAMKstEDpdMa71wppg41cuI8RVPmDKCY2Wx4BYoQrKciMQApXSR
	dVYCvYMzzrorBLvXJWD2A=
X-Google-Smtp-Source: AGHT+IHvClgzlv5o2f1yk8LPvXdEMzllwWNph+HLhzToviOAWlAK/l+b1NVFCacMLnoIdjePPyL38A==
X-Received: by 2002:a05:6122:1812:b0:544:c8bf:6504 with SMTP id 71dfb90a1353d-554b8bad2a4mr1064705e0c.12.1759917423753;
        Wed, 08 Oct 2025 02:57:03 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5523ce69b52sm4373536e0c.12.2025.10.08.02.57.02
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 02:57:02 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-59f64abbb61so3450643137.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Oct 2025 02:57:02 -0700 (PDT)
X-Received: by 2002:a05:6102:579a:b0:555:ef1e:49bb with SMTP id
 ada2fe7eead31-5d5e2364222mr774121137.21.1759917422208; Wed, 08 Oct 2025
 02:57:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007032209.7617-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdUChRoJ-A4W-PBBQssMvsn1GZY5zXmWxJ9y+EA8M2p3gw@mail.gmail.com> <aOWGWkQn1AK22tJB@shikoro>
In-Reply-To: <aOWGWkQn1AK22tJB@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Oct 2025 11:56:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUXoq3d010y0vyXvvaHpgaV7rHb66VAHrwJxAZXzt+z=g@mail.gmail.com>
X-Gm-Features: AS18NWDCNv9PgDOKJzOc1BoGp8uKrNZFVxJ98-pOMj1F0s3tf9so3ZiI0gofHuk
Message-ID: <CAMuHMdUXoq3d010y0vyXvvaHpgaV7rHb66VAHrwJxAZXzt+z=g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: bus: renesas-bsc: allow additional properties
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Tue, 7 Oct 2025 at 23:30, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > > +patternProperties:
> > > +  # All other properties should be child nodes with unit-address and 'reg'
> > > +  "^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+$":
> >
> > I take it the "\\-" means escaped dash, to avoid it being interpreted
> > as a range? I usually put the dash at the end, so it needs no escaping,
> > but I am not sure that would work in yaml.
> >
> > I would drop the "A-F", as upper-case hex in unit addresses is very
> > rare, and non-existent in *upstream) Renesas DTS files.
>
> As said, I copied this from 'bus/allwinner,sun50i-a64-de2.yaml', so this
> got reviewed already. I have no strong opinions on your suggestions
> above. But whatever we agree on, it should be reused for all busses, I'd
> say. So, we should put it where it can be referenced?

In my defense, this is a DT bindings file for Renesas BSC, so we can
(and IMHO should) add restrictions.

If you want to go the fully generic way: as per the device tree
specification, a unit-address can take all characters from the same
set as a node name...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

