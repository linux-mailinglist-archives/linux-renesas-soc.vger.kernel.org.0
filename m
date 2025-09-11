Return-Path: <linux-renesas-soc+bounces-21775-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74743B53568
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 16:32:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3B4417BD05
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 14:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2F6F32ED41;
	Thu, 11 Sep 2025 14:32:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703BE3203B4;
	Thu, 11 Sep 2025 14:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757601129; cv=none; b=p1Cnl8QMr68Uxrameh66urdvqlQgPzXiTEIXXJE3iRcLPnOFSVKa/gyXAbYA3CTn2HH3xhdhbffkmr9rPkmhhXnmUG6GrZRJaDoqDrGN6Bfs+1lyMq0LbOK6CbjxVbsMLb9P0POqEifM53COlToZ+pIx25/lYefTgarLzZpExLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757601129; c=relaxed/simple;
	bh=0UxARpqVN7rxGSBwGlRd2nS4dxKJYQiHjY0DwOXrge4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s5u1GEKCuT0W+IGjFwpqElwZqCsIDAWYXl3LIyeoxqr9sovvVXIchdiaDrk8TNn7sbxCHzg69kYjOaca1fnDepTqFcaxknMnyYk9O1E7emtD2GufNHqXvR91nOCs5Qlzwn3FGjiAvjeUDzdwvYK45iYcZdl6Gt4QHCL+OAoQt/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-544c796daa1so249079e0c.1;
        Thu, 11 Sep 2025 07:32:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757601124; x=1758205924;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iuG9v1lMTLeiPKsVMgrQ/1maaUsWmMhO6LZ+84EqcRM=;
        b=jHLguC45PQyyT7ss/HemcMF2RgztX6hObofPA51eidufKz9rzUUPk6i1Qu/w7xw7kq
         96+L4uL5x9dxTAo52TICdSAEcW8udExz1NsECF8BxbennS/Ntjb5SCVlVnkiXD2re9xD
         TRii9o6Dv+cq2eOi8X3UqKtSbuV1pgUpDWQW7/i4Oi755lmnl6fHCGCo2pbjePbb71tV
         fpGcRMm8Y7L6LZWq2z1oWsblltyFMFpwXf4oB+fA6O/3bbJ3LE5Ukqg+anO59CvPcbwa
         w9Z/7NBLUPnT6oT+80sQZIHqSFDQ86kFVR8HmATAumthyz5U3MrzgT8F0F7wqadr248u
         UIkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnNeHOPcWmGHIdNPiHblCFSmFz6LdrQAhn5ngD/rSFAUIN7DZ6eW72MeajdbQAQsNOeXqKoNGMduyN6GTG3dPSA+g=@vger.kernel.org, AJvYcCWT7sUWQM9GjLGoS9gaMuKtiakI4uMyGtnTceqYtQvrKGSseIn9DnxMUJaaDTnGXWikR1948oZrEOaI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5QAqb3ds+Nji0rGQWYNLCKEop3GZAU8uhu4X55Ldc/SFm9Ase
	HPVa9avHaZkN1f6p01lf/sQJo5Y+DOE30W/OpKXGiE5sLrDuIUutmZZd0yDAPsko
X-Gm-Gg: ASbGncsnU5t492hdyk5v16nOGjYxTkcdaxkPDRl0Vu5LUWB55CVW1+WSbcgs5+Odu4M
	hP5X+Xz5YvxRGjkbLbavL9pnISfPm6TboLZKB4mC1y2ghLg6yizPzlG5t7cdUyaN4bmr0bnA9/W
	9npCHdAJMRXOVkBziwbeRwz4gvKQMZMI3h6kBdqdqnrCynS9LHtbY+pXmw9BGEpVt4v+z/77nyF
	dL9TWggka/xgMxhw3mlBoSs9/WHu4PLKhH937OddCGE++ujVCg4j5oimUak5P6Gu1nopo3EKM0M
	PKd0sIuE3uKeqM8WxvUTL9RScr2p/B1Qa0sG4sz5XVj7uREXuvFU7Q4ve+FrmOHGeH322jLZD34
	D5OVDj+4GUT2htxLowUSysQnDhafuTL7QroMWdjpusJ5+RM86XejG2ORegkPeV8TAjFprvNRLJW
	Y=
X-Google-Smtp-Source: AGHT+IE3nkWNipjOmOhZW0UMPd1LjrHnbjaRbElTAJLmmvsn0q7mEQLcI+svT2qA01rBos3c4M62Dg==
X-Received: by 2002:a05:6122:1827:b0:544:84af:c8c7 with SMTP id 71dfb90a1353d-5472afeac92mr5567319e0c.8.1757601123783;
        Thu, 11 Sep 2025 07:32:03 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54a0d1bd09fsm280219e0c.3.2025.09.11.07.32.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 07:32:03 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-54487445158so229244e0c.3;
        Thu, 11 Sep 2025 07:32:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVc4rFakiNAxjku9Q4OXEorPudQbtj7kHOlzsnvT+X6VFLq4BYMDgO2ClpxwND0zCZ6yxCO/xskjRYd02czuDC4+T8=@vger.kernel.org, AJvYcCW6BSzERe6xm9s8dMP9oM+QfpAxeDzqFvBqoI0XenD1WI5UBe/QMEksRl59wXBLBCXoUIugpfS+y/zb@vger.kernel.org
X-Received: by 2002:a05:6102:50a3:b0:519:534a:6c24 with SMTP id
 ada2fe7eead31-53d2463053emr6229257137.34.1757601122544; Thu, 11 Sep 2025
 07:32:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904210147.186728-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250904210147.186728-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Sep 2025 16:31:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVu29vTmvvAb2fJS8ZKmqnLb6bEUHTnO3NLRe=mE+c4GA@mail.gmail.com>
X-Gm-Features: AS18NWD8YMdZPnXdMJyRLJjErW6NxacD5Z9NgH-0YDOiJVkaB7ifoDDK8rPLQHs
Message-ID: <CAMuHMdVu29vTmvvAb2fJS8ZKmqnLb6bEUHTnO3NLRe=mE+c4GA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] arm64: dts: renesas: r8a779a0: Rename dsi-encoder@
 to dsi@
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Sept 2025 at 23:02, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Rename dsi-encoder@ node to dsi@ node to follow node name pattern
> in Documentation/devicetree/bindings/display/dsi-controller.yaml .
> No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

