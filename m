Return-Path: <linux-renesas-soc+bounces-26059-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 813A6CD9631
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 14:00:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 92CA230019E7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 13:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A9B5335572;
	Tue, 23 Dec 2025 13:00:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1C832E14F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 13:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766494836; cv=none; b=EtbJkhxajIOiBamQSSoz5YSNoafq1R386fMPSHnPM+IH72KrkclU9UzM18dARKj9z5vZT/XJrDMHCeDetCKX0BF9svqaRwvncZ64eqOR7Wk02JEudpuVIKn+iUY+y72j3uBqBIgob0+J5hwsX/VMAMWisITs+uit1321yIg/SFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766494836; c=relaxed/simple;
	bh=HEqsK9Z5r2vHLwE1iRzi4qqy0StklJQS/KD1cB0QMWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BQrbH9yLfdiKJjuImSM8h5LVSDgHdAaAOm6EPUcv/BiCe81pKR94tXfm2I5DjToAww9BGe+G6LlOMFmt+qaE+IM53LVxhWWtwf1d1G0w5rsEtupScN+FVQsBC22j8/rzmynbWAwNLhwvaqG71++54WKmfMKAkfya4cRI+kegOdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-559836d04f6so3315401e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 05:00:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766494834; x=1767099634;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/MpJqkv6JnZsSqSn+n7d/g2Gjy+SF5KqOdVd8mQ0/c4=;
        b=wedQjBuCNRGA4FBLTdubIvFmRmbMD2GV34klTgIWrNy3MpthLyt5TSp8FdylDJZL2k
         li6VC9pG20T1AaprVXUfLZyhU8uOqVKT0y76wwiIS/chL9bFaX6qTKGzceA7C7qbEjvV
         hqTbsqjUYFnmpiLTVzX4lCCFAmmIEAu0jacQ97fVNlHYdUGc0LFEbvq2L5nLBsVlerhH
         HP1WqhuMnv4/piMsiOXKtt2B8o6Evz0gfwvXCq1+R6pfHt6jzWoEkjW+nzRkGlmgKTwS
         FwWQFlcrLa+CGR5uEb+HUtbi13x7fmPxTFq0/gnaNvZwI/E2Q17OPpOOxCFsLNzHCUsf
         LDag==
X-Gm-Message-State: AOJu0Yz8oRjnKxaChOCiZvYP9x/G0Mew/wnvtJJhvWpoIrmQyKcFcqkx
	CTlKSPRCwK9D/uyVcm+yd2ir+M/yW/moLvGwxwNCcVcyK36ipEq70fgRNhOSEzKm
X-Gm-Gg: AY/fxX5DRNGdOm5KcuzZ//czsVSnf5Ilm3FPtRMoZVLY8eO9xgMZRastjQH7gRW1SO9
	pf6oiDSaJFZEu0uQRhDQDqXrdnYMXeZIq7A5e6nTgCbfg5gUOW2P3KDs383x8kHXlRTaI3ZM7z5
	ekKRp7dq3T8PMHXf3xlVodriYeovl4aXZdURny/QFSO1wI/Tvlfg0RWoBDWmlP1WxLW3GJQMJMH
	Ww/jjPKKVdVbRJ8MeE+UhVf74CFBuwrYmL59BeEBhx7dZzUW4L4KWOMN4TtPCaoiTNuu+enAuqi
	YXh4D+YQtPZq1yQTjqTWJ1Ug+t61TD6Jbr/FbufK2cp23qfZWYa1tiq5UfcJC5wcVVW+4YFqCAO
	JQjckay5lVyH4YBzC5AMZitEBxHjWwV5NtHorErj9x2hPeGP9ynkp/SOWFA6A8crxn5j1uVSb1U
	U1f3JKcrpHRH5Cuoois9WBbF04pv1mfDg4Z5WMB005qkwmPoqEJLHca8baJMfWk+Q=
X-Google-Smtp-Source: AGHT+IHIKEevIFY1LJp78/HROVehLp+iOZIeJo7JTczPxqJNQIq5f+k9r+GDykEbHjVc4ky4UujndQ==
X-Received: by 2002:a05:6122:1d0b:b0:55b:305b:4e29 with SMTP id 71dfb90a1353d-5615befda3dmr5096755e0c.21.1766494833508;
        Tue, 23 Dec 2025 05:00:33 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5615d15f5d4sm4320288e0c.18.2025.12.23.05.00.32
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 05:00:33 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-559836d04f6so3315386e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 05:00:32 -0800 (PST)
X-Received: by 2002:a05:6102:2d0c:b0:5db:d60a:6b2f with SMTP id
 ada2fe7eead31-5eb1a41db7dmr4715689137.0.1766494832281; Tue, 23 Dec 2025
 05:00:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215034715.3406-8-wsa+renesas@sang-engineering.com> <20251215034715.3406-12-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251215034715.3406-12-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Dec 2025 14:00:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUUpVzDCUArY-uQBW12t4dDs6u9MLWbhJ_DnJ_2oUTGtw@mail.gmail.com>
X-Gm-Features: AQt7F2rU6VpMprjhKYPjDPSXdLb4P8LJPvmquWr3BGyDaK-rmr2SKfFLKwRvfzA
Message-ID: <CAMuHMdUUpVzDCUArY-uQBW12t4dDs6u9MLWbhJ_DnJ_2oUTGtw@mail.gmail.com>
Subject: Re: [PATCH 4/6] arm64: dts: renesas: r8a779f0: Add WWDT nodes
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Dec 2025 at 04:49, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
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

