Return-Path: <linux-renesas-soc+bounces-22446-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC65DBA9349
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 14:29:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34435189EDF8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 12:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6979930595F;
	Mon, 29 Sep 2025 12:29:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E34347F77
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 12:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759148984; cv=none; b=lRNAiFdjXiNrZ6H466HgsU7D0Sp9FxLxRWu1bFVczaGymlZbmVjzD6Ft5em+1Coxnkyw3AmSJoFwg2DAZ8uvXDSrapxh1zUyuH/xcoF1cnqvGKa740E9r10+GCSqJgrxBwymSi8y3CJeWTcuPlftMMGx+eknx944EA+sdIuOJ+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759148984; c=relaxed/simple;
	bh=Eouh/Dih6ut2cc9xkN69dD3YmwApD37ueW0zfyLSUjI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GE0HRE37+SLedb6OrnF8X0oHNhL6BWBvsQJ2kVemDSavmVchbH7440HULyFBMXIr2bpOKq0q4PgqgykvKzqZdOZXYcBvHePnOcGQYIWgkvf/FUl5EhaukrdUorVMFPcUzX2Gp0gXeawCBoCQLJZq2e8Ou57AyTs8IT/5onlSvUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-59eb88955d8so1890406137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 05:29:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759148981; x=1759753781;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RkpKegjLM4X1g5BOC9wFP0NSK9+QF1wXHcR6o9TX8L8=;
        b=W5ZHlAKI8lZzDirzhOX8Om6RpipU4qIMicFfPoVxLkXYpuduwQU6JBWue9e+SP74TM
         LJnEF+P54AQFbH16tUlh8zqsd/puoNhGjU0qRxMWDWcOvk81RcB8lP2wplpOjt6VwNUj
         LKno815kqvc2VqU030ojkH4oooydm3bTOSb3a+J8ijFn/MA8HL1fvy8nftTxMrRB67bU
         hLmFLx/lIpacRvPKZU+p1vPJcHvw1cAJegoBPufMygJdz3a2Y+EQEaPa/7KX57Zh6MkW
         Mvgy5Xlwf+r2VRQdl/AZ3HgCzFCQmHN5ut/cG8jloz82FIJzEQM54rGVNA2hGDGz4wA6
         JVZg==
X-Gm-Message-State: AOJu0YxbCeHjQIhBE2H4+u2HRUkWy4YgvhhSu+i8KdywuUgXXM74V/Qg
	FH4YakJYf0gB7pBdUqPmbG2kBSFZVn02kMmq8Rm2D4VCOe+joIjW5f6Vg6hIE0h8
X-Gm-Gg: ASbGncsaDNhgSQ2/Zs7c0X2g/LDDXhSH1ZsflBAEPCkZSCrJVvpqQA3zNPTN0Mn95CB
	sLjW61LCXbvlKkThrz3UQa605e7hsxKKaYMGmJZT6LFzqvQ1BTwFd7vmHYDTm0kCI3+DgTXKlx9
	EYzraLrYOUusY5MxkE5fK2PETfvbmc9buHRFA+LACPRycASL+BI0O9W1BImtmpST6u06SCdwHqc
	wdUAZ6qgTmE7J4UthO8VhJuH2UWOb3wlmKnif5yjfTLWKMXKXqc065Z+o3DvmbAPoCSApgOXQlH
	Lm5ZE6b7BzXLkjbR2FM7VF5o7rL2FuS+qbH6trTmEVZQVSQJuglDXoiVDcPpn7jDURaUufxXJRJ
	HUgt0wylBo3NDNL4wcySpP1D/HTm/qNeKfMiZ36PV3apsISYg9MzJfprKW0S7
X-Google-Smtp-Source: AGHT+IGbhbsrENa3+DW2+9Hn7KegwLy63noClny2joZiBalrEFtG1CeLCVH5Fv1R2BHS8hNzxjLeMg==
X-Received: by 2002:a05:6102:370d:b0:52a:4268:7618 with SMTP id ada2fe7eead31-5accf20b16fmr5853750137.27.1759148980775;
        Mon, 29 Sep 2025 05:29:40 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-916d8788fb4sm2358615241.13.2025.09.29.05.29.40
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 05:29:40 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-59eb88955d8so1890402137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 05:29:40 -0700 (PDT)
X-Received: by 2002:a05:6102:292c:b0:5a3:1af9:752a with SMTP id
 ada2fe7eead31-5accd2116femr5698432137.20.1759148980357; Mon, 29 Sep 2025
 05:29:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Sep 2025 14:29:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVn24vKVSkGZ_F4OHiXvqtKd4Hx88Ct+Lz-YcvFK1Gv2A@mail.gmail.com>
X-Gm-Features: AS18NWC1JlKmz_lymfUFwzNisQMHtJyVP-Gt1E9IjHo2EdqpBeIpGGeP95Pm48A
Message-ID: <CAMuHMdVn24vKVSkGZ_F4OHiXvqtKd4Hx88Ct+Lz-YcvFK1Gv2A@mail.gmail.com>
Subject: Re: [PATCH 00/26] arm64: dts: renesas: move interrupt-parent to top node
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san,

On Wed, 24 Sept 2025 at 06:29, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> We can choose not to use interrupt-parent by moving interrupts-parent.
>
> Kuninori Morimoto (26):
>   arm64: dts: renesas: r8a774a1: move interrupt-parent to top node
>   arm64: dts: renesas: r8a774b1: move interrupt-parent to top node
>   arm64: dts: renesas: r8a774c0: move interrupt-parent to top node
>   arm64: dts: renesas: r8a774e1: move interrupt-parent to top node
>   arm64: dts: renesas: r8a77951: move interrupt-parent to top node
>   arm64: dts: renesas: r8a77960: move interrupt-parent to top node
>   arm64: dts: renesas: r8a77961: move interrupt-parent to top node
>   arm64: dts: renesas: r8a77965: move interrupt-parent to top node
>   arm64: dts: renesas: r8a77970: move interrupt-parent to top node
>   arm64: dts: renesas: r8a77980: move interrupt-parent to top node
>   arm64: dts: renesas: r8a77990: move interrupt-parent to top node
>   arm64: dts: renesas: r8a77995: move interrupt-parent to top node
>   arm64: dts: renesas: r8a779a0: move interrupt-parent to top node
>   arm64: dts: renesas: r8a779f0: move interrupt-parent to top node
>   arm64: dts: renesas: r8a779g0: move interrupt-parent to top node
>   arm64: dts: renesas: r8a779h0: move interrupt-parent to top node
>   arm64: dts: renesas: r9a07g043u: move interrupt-parent to top node
>   arm64: dts: renesas: r9a07g044: move interrupt-parent to top node
>   arm64: dts: renesas: r9a07g054: move interrupt-parent to top node
>   arm64: dts: renesas: r9a08g045: move interrupt-parent to top node
>   arm64: dts: renesas: r9a09g011: move interrupt-parent to top node
>   arm64: dts: renesas: r9a09g047: move interrupt-parent to top node
>   arm64: dts: renesas: r9a09g056: move interrupt-parent to top node
>   arm64: dts: renesas: r9a09g057: move interrupt-parent to top node
>   arm64: dts: renesas: r9a09g077: move interrupt-parent to top node
>   arm64: dts: renesas: r9a09g087: move interrupt-parent to top node
>
>  arch/arm64/boot/dts/renesas/r8a774a1.dtsi   | 22 ++++++++---------
>  arch/arm64/boot/dts/renesas/r8a774b1.dtsi   | 14 +++++------
>  arch/arm64/boot/dts/renesas/r8a774c0.dtsi   | 14 +++++------
>  arch/arm64/boot/dts/renesas/r8a774e1.dtsi   | 26 ++++++++++-----------
>  arch/arm64/boot/dts/renesas/r8a77951.dtsi   | 26 ++++++++++-----------
>  arch/arm64/boot/dts/renesas/r8a77960.dtsi   | 22 ++++++++---------
>  arch/arm64/boot/dts/renesas/r8a77961.dtsi   | 22 ++++++++---------
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi   | 14 +++++------
>  arch/arm64/boot/dts/renesas/r8a77970.dtsi   | 14 +++++------
>  arch/arm64/boot/dts/renesas/r8a77980.dtsi   | 22 +++++++----------
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi   | 14 +++++------
>  arch/arm64/boot/dts/renesas/r8a77995.dtsi   | 12 +++++-----
>  arch/arm64/boot/dts/renesas/r8a779a0.dtsi   | 14 +++++------
>  arch/arm64/boot/dts/renesas/r8a779f0.dtsi   | 14 +++++------
>  arch/arm64/boot/dts/renesas/r8a779g0.dtsi   | 14 +++++------
>  arch/arm64/boot/dts/renesas/r8a779h0.dtsi   | 14 +++++------
>  arch/arm64/boot/dts/renesas/r9a07g043u.dtsi | 16 ++++++-------
>  arch/arm64/boot/dts/renesas/r9a07g044.dtsi  | 14 +++++------
>  arch/arm64/boot/dts/renesas/r9a07g054.dtsi  | 14 +++++------
>  arch/arm64/boot/dts/renesas/r9a08g045.dtsi  | 12 +++++-----
>  arch/arm64/boot/dts/renesas/r9a09g011.dtsi  | 10 ++++----
>  arch/arm64/boot/dts/renesas/r9a09g047.dtsi  | 12 +++++-----
>  arch/arm64/boot/dts/renesas/r9a09g056.dtsi  | 12 +++++-----
>  arch/arm64/boot/dts/renesas/r9a09g057.dtsi  | 12 +++++-----
>  arch/arm64/boot/dts/renesas/r9a09g077.dtsi  | 12 +++++-----
>  arch/arm64/boot/dts/renesas/r9a09g087.dtsi  | 12 +++++-----
>  26 files changed, 200 insertions(+), 204 deletions(-)

Thanks for your series!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.19.
If you don't mind, I will fold it into a single commit, though.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

