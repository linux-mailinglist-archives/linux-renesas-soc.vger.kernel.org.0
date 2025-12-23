Return-Path: <linux-renesas-soc+bounces-26055-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 397DECD9028
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 12:04:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1D1C9300C360
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 11:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83344340277;
	Tue, 23 Dec 2025 11:04:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DD833F37B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 11:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766487867; cv=none; b=XPiGlb1L5IOdLGvl0Af2LVMqyGaNbw5RuSCl2R2ecO+fJtu1Nym4NUoI4uND3uMD6PYxX6loxyGCaqlxYS9wLDPE0RFm8mg9Z8ATAq0juDWXW24cBCU/0KZglVoJSqMhcBEuUFuHNZKgm7tUrkUp7QBN9ujCrV+oBBSqhdHuMWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766487867; c=relaxed/simple;
	bh=8xavgCXA9B3gWMv3UMFR+bJZoKLzbEenRiYSk44yFnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PZsXYUxw9pOFtP/YnBlMuv5MUpOoh17DhHKqo8qdjTm4qtngGvAI94ldz6+ENnp6i+qIVqGdT4S4e52V3H6cl9FalYwEkS0UtHv+9rgV+xr3Dt3pKa5Byjq2V/x7qkm0RIXjkq0YouBKXUpIlg/gfQOdb4bcrE0LQG3DMadye1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-55e8c539b11so3321347e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 03:04:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766487865; x=1767092665;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3wvNhE6zEOveVxdx0cMF9V1zD4Mnsw3m9dQoHOGZJBE=;
        b=GaspVA/QT/mO5wb3A7RkDZeJCAOwCDPI38vnTAF34R06Z7TvG7sbE7vb4xIOVlTti+
         QhzkAdul8tWol4/toiY47zbvX39VBjxRnYM76ymWj5WcZ71+8fZmfAVPuV5uor+FoKQx
         5w3AyZiCZMb8ABAPEBAbE4moTH5n170KQqr7lCjXksGQe1IhuVYb03tLx+wH0iVvmSK7
         YM76YtmQTSQR7z1cC8YmbxmoXcq9vOkAgfvvkRIs0cbCLxie3xbmJiRXei3CJQFSpdg2
         3QyPOp3J36rq+DezpVWkhB636o7/uF94BiRZswNpAgNGlOAPfNpwstNZDipKqERs8o0v
         pghA==
X-Gm-Message-State: AOJu0Yxe+xOIcbASM3vJN9+HNgLM5HAsfvTSllM3hr13pqza6fnOx923
	8dEOyZNEJttidk9LXQ6Jxv9xXhm+wkZA8+h9EOKsioBh7xJrO+adepJOXA8vjnoh
X-Gm-Gg: AY/fxX61vamu46OziQkgnIYdoFUzYbpxjoasUiWxg77bqG2qZ68RNunF1rJSM2glaKg
	U1N0nc59HVeBqtmgkaaYMrsm5ZHws1q0bRUCTkU810wjltibXCm0eq0f+j9OtS9KXH/B+nau6Mr
	WvQLeJITfezXEuPYeOSfCiBu8t9O7KpzzoeYBaEh3lXSCLauvAczUtqMUDhIQ32xjw0MXG6uclx
	EEvKJ9Ekhas+RqqCsAODIRw/zM6/Rk9ST+KWFsRfNMdzqHQlM85ugsBpS4Vb2VNjzTKi0XihPyL
	onTZdYix7CO622xdMPx3uF/cU6z/lxrz09Ov/HaMjR3aZDQ+dFgFM4DZm4agKQNr2kTTS6ZWoqC
	jHUEjk070pLQWk5z/lueQlrtD8v/qKcd39aW91hg8smVBqyDTtMQbkP9poeJDEH1xuDPZVzzfE5
	DjEFXyfmAlnnet+G2i+vMDfccGhWDHAWidDitdiDINU1/3w4VtlEUmvmNzpiU=
X-Google-Smtp-Source: AGHT+IFZaEWCI0neirgSOfM4+XdXq/FORHMevkv3BFifjQ8ujwmhzQcIPkyH3y8BWNQlH7ahX/36rw==
X-Received: by 2002:a05:6122:459f:b0:560:2368:191 with SMTP id 71dfb90a1353d-5615be633d4mr4753961e0c.10.1766487864733;
        Tue, 23 Dec 2025 03:04:24 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5615d04b58bsm4277897e0c.1.2025.12.23.03.04.23
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 03:04:23 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-93f5667f944so2899822241.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 03:04:23 -0800 (PST)
X-Received: by 2002:a05:6102:5689:b0:5db:d07c:21a8 with SMTP id
 ada2fe7eead31-5eb1a7d5994mr5054676137.25.1766487863544; Tue, 23 Dec 2025
 03:04:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215031318.2219-4-wsa+renesas@sang-engineering.com> <20251215031318.2219-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251215031318.2219-6-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Dec 2025 12:04:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVw-4ZxtQo0+yE=iPyrW8=bAPmWk1YYJwpuK=c+m-A4kA@mail.gmail.com>
X-Gm-Features: AQt7F2ptGEnVFsY7BDzUIm4jUxTIQE0Z4gYHuNiD1tGfkEW1wEuYp__bEkKpWsY
Message-ID: <CAMuHMdVw-4ZxtQo0+yE=iPyrW8=bAPmWk1YYJwpuK=c+m-A4kA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: v3h: mark SWDT as reserved
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Dec 2025 at 04:14, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> This watchdog can't be used with Linux because the firmware needs it on
> V3H boards. Sadly, it doesn't mark the node as reserved, so this is
> added manually here.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

