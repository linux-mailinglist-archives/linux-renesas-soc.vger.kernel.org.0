Return-Path: <linux-renesas-soc+bounces-26068-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AF3CD98B6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 15:05:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D2C63036CAC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 14:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AE1529D277;
	Tue, 23 Dec 2025 14:04:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8785F22CBF1
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 14:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766498684; cv=none; b=X0nwaQyAEL06I6OxjOP6zVDVXZcUSWtyZYDiDVqL2/dEdfxCP50hz4za7197FLtp9BrlFhdSZGYs5HuEMP9WPXRsV0Hbpfkm5948rt3K6axbYl2WvfZjIp0azypBtib32zaKov+kWGaJHDE6ubtIuSwEHZH3a7g2HPXLVGG1z3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766498684; c=relaxed/simple;
	bh=+jtPilWYFm5ncAYTgsqlqGBVAaL3UvMzNugfZf9EGfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pf+l5Yw0+j9VuRJfwqHrjSJhEsCM381O7D3W2RxO1gQsIjtpJqE3i8+Hl/3M7rdErnCboZ2kVLJ7JYuUsKug1EKvwotLL93LUZQaBsMNsziegkbicu267NcgCley3u3DFlWzxT5ajBbSKycsNztxtMKL17w5lVUFv3lUWAvO5Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56021b53e9eso1403833e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 06:04:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766498680; x=1767103480;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKvJk7e7tJ7TSRXYxuvnx2VLhgvs9PdFoo0OZwEpm8Y=;
        b=pgo9B87leKar523fpBB+TgD0emZHv2hwyL2p1WynZaxD+k8u0Mx5lKZFMTuWpzIIis
         rCt1PDH/JZMjoa6X0cRMN11nRI03ASNbani4hZbBo47fhIkLFn18wp222aN64MdeITNz
         cm114NnbD26pb60aBL6ybb7QKWcfkrTbWcfcpXj6m9twZOKCzfYVR5dmXgtR8fsUqb2T
         nQhBXzqITnn4s0w+1EnPXsiroSqwRfrJckRZKDd+a3kU/4NSv9HkhC3Jy6RjU3+slYd+
         8LQewA4aUI+aBK6T0p9ytrboOrMboJCWG3wdDXVCxnJpkW4BpKY/MHTJVS3xH+p88DBo
         TB4g==
X-Gm-Message-State: AOJu0YyJaluesHJ7TRHLJnv/koZobGyUDqAVRt0xkL1y2FcAbVko03ot
	V1EWk9PVpik9VGYxlaPH9O1s6WSbjf3kzmrz2vvYbel5YF5t52+PLqvkuShwrsqewyQ=
X-Gm-Gg: AY/fxX5mCNFEElAnOe+MyvNJueWANJX4OENBHrAkjebDG5BM+0W3IE6oCc6IlkaRub2
	nBS0ryZaoULBQwTDoLXefDNaxZG4dTqGtD+mzfYRHapZS8kzrQJBnzcaw+Z6MFWuTsSO89pMvy/
	JKLOvUxT07HCZ9iOq5Oeki/pMFcuNAWlUa3fh0wXYSVpbX9H/vEGouRUGRmte/fd5pFWaqq70Hb
	XJQF7WA2tGwAGbozBncqhvaL+eF/cMOzhcHlRqbK172ZjGTUyYBYSIsIsTj+dbc2Yrt82vydlME
	Cm1L/Koanl4PU1nqmc3ZHCeZ1WLLufOPS4mt0WiENQYFGnsipuAvdCmF3A5IIiqRsM3KeONaN5Y
	s/7vpqRWmkllhbk1xkJ0U0GdBSmuoBULNTonAHEauRvQ//hc7p+xDwNhV/2is+2dCgL29bn6ekU
	y2o7c7XYpLQDenLGmKVSQSpHZahF0m/iT21L3fAhAqbpKrtXsi1MYX
X-Google-Smtp-Source: AGHT+IEfnpjtilXR3Z+wP4nIZwEjwj4A0/fq0YZomHB2gdXsENtAmigFSoFzU8zmIdPp+R5Se8pRNg==
X-Received: by 2002:a05:6122:4692:b0:559:6960:bdf9 with SMTP id 71dfb90a1353d-5615be91e87mr4218163e0c.16.1766498680263;
        Tue, 23 Dec 2025 06:04:40 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5615d06627bsm4384923e0c.8.2025.12.23.06.04.39
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 06:04:40 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-559a4d6b511so613820e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 06:04:39 -0800 (PST)
X-Received: by 2002:a05:6122:208f:b0:55e:4bcb:6baf with SMTP id
 71dfb90a1353d-5615be2e21amr4350349e0c.11.1766498679648; Tue, 23 Dec 2025
 06:04:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215034715.3406-8-wsa+renesas@sang-engineering.com> <20251215034715.3406-9-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251215034715.3406-9-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Dec 2025 15:04:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU2S9ivz-tCJ0-+ukDiX1XJ1W6PYhXMDiwjrPx25DtACQ@mail.gmail.com>
X-Gm-Features: AQt7F2r9Kt9kfh9d8NWv8LptzC6R88BS41HsAN8NK9CC46GU246gmE1I-VG_VJE
Message-ID: <CAMuHMdU2S9ivz-tCJ0-+ukDiX1XJ1W6PYhXMDiwjrPx25DtACQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] arm64: dts: renesas: r8a77970: Add WWDT nodes
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Dec 2025 at 04:48, Wolfram Sang
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

