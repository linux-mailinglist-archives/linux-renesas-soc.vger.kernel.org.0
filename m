Return-Path: <linux-renesas-soc+bounces-15665-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D66A824B2
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 14:28:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91A5417C900
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 12:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D1DD26139C;
	Wed,  9 Apr 2025 12:25:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B6325FA23;
	Wed,  9 Apr 2025 12:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744201524; cv=none; b=NwdObYD8RoiW0suE28dJQ+cb0xzpnIDUxV/vepzWnu60AnQWGV48uOqjOdpSvtLNU8GZOs4HiPmijuvW69AyvTNwK6yqlatx3b7gD/4HxCSRcrpA5Qe9CfyNMxRmGYk0kGr9XPVGVcKlj6wV+pnEXA88hYzsxVRSoaHnaxRqQGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744201524; c=relaxed/simple;
	bh=LYcF6PfU4i0kmmqI/TkLAuqKe40Ucw7uWLG9JphBXvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BrZDB3Wo5zGHpgQ319t7rEODFO8olOHn4UxGsJL9nVa5fml2cQB47bQd75UtWnjg9gDOz36VveMaI7p3/XVulHA/F50VL3Oc0Y4yILmFCFZYCBaSikp2ijE8C7p4gr18UcEPkwW13pe+1OB4xjPeIQ7r3BtceOb3FGDYUjJNbEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-86b9b1def28so6162802241.3;
        Wed, 09 Apr 2025 05:25:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744201520; x=1744806320;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4bwpqyi0C/Omv8Oxh3ieog7x4LQHMwE5JHHlM6bbhPs=;
        b=I7MlbksafnjdKaAwCA7LHhI2lS8tthwf2HKptAh/0KD/bHvCAgNIdWWN3SMh80oUqA
         eTnvaV10qG4ZbHKvYzXOZusxtxeLUxs2OJLn4fGxXt/iOBobUNgt2mow/piauTaFcru7
         HmxW7t118jTbyKhVhz0XXWlX+acNQHAn8lEoPnc0JtULePGnMlsl3v6VxYde+MXbTwUF
         ZWKs2Nf7tb45mMW/wOJJnjQimV6Wkey1u1Yt6naEPIBfLKWpT5qFgv4QbiVA3JnU81m0
         QKqmBkusaI2rDAawXb+mVVseJDz1vMm88vLLKqTaFbJgDM2R9dk9JXbhMZsV/fHBvV/o
         mX7g==
X-Forwarded-Encrypted: i=1; AJvYcCUI5g8VsVS2xvd+8b6/wgHWnTw8UXfhJR6RwjY+g9cAJkFtWt22EswEHteSY21d3AMvSUnDgBJdqezwmHgDrrthJZY=@vger.kernel.org, AJvYcCV0H2arxsCUjXmg6OkmI9Hp+kkyvNv03AoUb4x5CEmEJEdbV+gFlgDge5fKJWyxE3/XFW04PxpogT8mzLA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxry3/FaJ1JsKi0WVMTdZtkun5DsxYD5RxojkuKormgsrE5SBYa
	VCE2SKJb/H+IbsLO/CaDomny4eKPnFJuUQgVpdp9g237aAZTYD1fFgA31eet5LA=
X-Gm-Gg: ASbGncvlaSgTUMQ19ODinQk3XQQHrGIRCPzU91NE6O3xPh4gr4ylFWriMvSeEoOzMXR
	Kg6OHopBKGrvA1D0irhZHJItXq85jaID6KuBQtenWtpX36g9GBE+TSvrdO2Vg9tcmiM9TOzrxzN
	mig7uu936x409tH5PMdfw4iH0E7q2wm4sNjvBLxMDRAkrK3PAMmPVOvQJvVeJCWITU9NkZ6Kc4J
	+Ndn4G4uplSnsaaOeCOgRxlHKtkBFGi7F9m7VnpnyYAxN9Es+VMwc/dRAiWNTf4X2CuzocnAvQ4
	BxUu5jTdXEpiw/xoFdzaLpcjfVy8G5WtPAeFIzd/Q7R2xgfca+PrAWgjzb15iUuhvrqNtGTmpWN
	2ubdrDm7aTzS+Vo1Opg==
X-Google-Smtp-Source: AGHT+IG1p3blamTdqchW2JXW+tXf91ECJAQQHXdkrQGNcHCZosqvrwkg9yMjbtWj5aoBGD5oOMVj/Q==
X-Received: by 2002:a05:6102:4bc1:b0:4c3:64bc:7d00 with SMTP id ada2fe7eead31-4c9c447d902mr2124796137.24.1744201520120;
        Wed, 09 Apr 2025 05:25:20 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8755716eebesm205489241.19.2025.04.09.05.25.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 05:25:19 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-52403e39a23so5310684e0c.2;
        Wed, 09 Apr 2025 05:25:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV7PadJpSMneuck1kc0xokyycxrNVhsQcJk7HIrCpnf/x5lYUPslktkF5ktkq6xWJyyCFo7w0QS7QtQmOgyXvlZmd0=@vger.kernel.org, AJvYcCXUooeSLcZTw12GOyyqcl1Oaj+PDwRUeeY+O+ohxRw84ATuFjvUjbkwfs+yxPcXHaRxx80gAt0BbXd5hX0=@vger.kernel.org
X-Received: by 2002:a05:6122:3291:b0:523:dd87:fe95 with SMTP id
 71dfb90a1353d-527a92355f4mr1715214e0c.9.1744201519093; Wed, 09 Apr 2025
 05:25:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401090133.68146-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250401090133.68146-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250401090133.68146-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Apr 2025 14:25:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWY+rYzPO5TmowdDvoyURVZBiXgWu7MEZE4eh7ze_tJrg@mail.gmail.com>
X-Gm-Features: ATxdqUFzwtuDtvELHopcKxYge5NHyDOHhLRTNuKkyueoCSJD1WhC4pXt_PeD_Zk
Message-ID: <CAMuHMdWY+rYzPO5TmowdDvoyURVZBiXgWu7MEZE4eh7ze_tJrg@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm: shmobile_defconfig: Drop individual Renesas SoC entries
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Magnus Damm <magnus.damm@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Apr 2025 at 11:02, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> ARCH_RENESAS is already enabled in shmobile_defconfig, which ensures that
> all ARM32 Renesas SoCs are enabled by default. As a result, explicitly
> listing individual Renesas SoC entries is redundant. Remove these entries
> to simplify the configuration.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in renesas-devel for v6.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

