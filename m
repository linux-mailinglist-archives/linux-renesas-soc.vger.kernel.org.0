Return-Path: <linux-renesas-soc+bounces-22714-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE84BBE7FD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Oct 2025 17:35:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CA3114E9F51
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Oct 2025 15:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B315527FD51;
	Mon,  6 Oct 2025 15:35:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EA4281526
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Oct 2025 15:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759764900; cv=none; b=CsqImXAjpiEsXqhLNbWbMcTrBHDR3XgzHbMSucJxYo2A9s7AAr2J+bl224zPRxHi74Q2ND92k4kqPP7cyIHKwzEZra34E/OKxk5bXBnTbpNRSRkxezRktdB/JMXiEUG97pU18BzUW1I5KCgvvL4YyON1j/LQIBU1+JkYXDU5uK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759764900; c=relaxed/simple;
	bh=ZD3wq3u//1+z6LqbsvgXhOM6CP7Nx5fSpPj0C2X/bE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OVR4oIyAk5iYCpti+N/ZOOfgC6+vS9kTeY8rv+WsVqEztonkpUAaPHqvX5dGV5aY3vGuL0CP38dxa+9Pf0QZ802p0tIrLs2gpi/QEvjG13uSTOukL4AWFWDzc03lu98TOpYnPhv03V9w9RP9AZFiCc2oj0CqcTzLd9vExu//Ti4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5838680e242so1806233137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Oct 2025 08:34:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759764898; x=1760369698;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WDkJ9FF5nhqfcMcTa7/MTCnbJ3v4Dd3szx41XuF9lTU=;
        b=JpifGsoZsKHxqg1ijjA36SL1FEveFpaxjWVD0QUTqXbhefMKFHZxvDppn5HYl6BXXU
         a006rXuKrT48kq3TSzb9phUQSHp0hr/wOF/f+H6LMRAKNq9RWAJkHDb4TZ562mCjnl6o
         A365AkoIkumMd6DZJOBY4z/fUcTGbbYXMR+GDvSTJRoilGdX7dYIjWeKWMukU8wJ1zMB
         iiXIosWuGyaGqrUDpuBqT05VN4PSHPutbmNrKFBHF26laKxaJU010WZCvDFeRE5OS3X/
         +GwavFGuMxN7RlYl4kA09p9S6CMbz2WANC4nzAoQgDfifQPKrp2RmgVsLmTnevYbYXaP
         U7Iw==
X-Gm-Message-State: AOJu0Yzcv6A3RdXWfG8GwxoSI9pT8xb3uWUYwpRcpsh0MPyG8NUEnBtE
	h5W0xjieFXwyhdk8cG67Zu5Q9QzBfXK++sLnoqY414XgZ86YZB0t2DYv8s+9otcQ
X-Gm-Gg: ASbGnctK1mnxDQwNahTAF4swPASZOEQayQypRuXzLowHfNsGY+lwLddvXTMS5rah6co
	LRxmcQAoGJSOXcP4EvFo7GjPU9DWRU7MQx6I68Y4W/UYdCL0XLJKdriVUgw05FZef5D/pThZBRW
	80IAWq1vbONbh8Jpv4hl0MfX49c5g7SMNlL8xE4Xr61FgNLpzpPZt+571/dLzdx1f1dfiWK42lc
	uOw9p0BqVN+ehMUo7QBnBmOt1EfslO+YWpW1U2Z3w9+Ja6L8CkdjcMDgbPdnfcnLoG6hVDvU72J
	MEFXU121vRBbzzmQqxBHe270D54YVH9y4KthpxbhemhP0I3KXl2Mef/jxtmP4ASx3O8jogggl/v
	sGQkUKDlUufvR+Kj/XoQfw/zd2lK0MxWxT+CM6awd+IbVPnVSP2NG48RbrgP1stOfGb/ORqWxE7
	oQZ8QTCwIJ
X-Google-Smtp-Source: AGHT+IEHtR2807lsnxTEwXcNjBpFSvJ7ihOoonf6Zo6iIjUj9w/kAo8yPjmiLwEt/bOyypIOFLzIoA==
X-Received: by 2002:a05:6102:6cf:b0:59e:2da9:2580 with SMTP id ada2fe7eead31-5d41d005b9emr3780888137.14.1759764897527;
        Mon, 06 Oct 2025 08:34:57 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-92eb4da21c3sm3011228241.7.2025.10.06.08.34.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 08:34:57 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5d4018cb45fso2215912137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Oct 2025 08:34:56 -0700 (PDT)
X-Received: by 2002:a05:6102:5793:b0:54e:76ce:8fb5 with SMTP id
 ada2fe7eead31-5d41d001020mr4223697137.9.1759764896428; Mon, 06 Oct 2025
 08:34:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251006082520.10570-11-wsa+renesas@sang-engineering.com> <20251006082520.10570-15-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251006082520.10570-15-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Oct 2025 17:34:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXJqsZswHBCcPK0KXvfgoFsL5Xq2NLoLgxd5J8soe-=pQ@mail.gmail.com>
X-Gm-Features: AS18NWCIBt4AaVbUamhTqhXAClfpqJPWlffXNRSzt0N2Sq7y-S5LjrOyGROJ2kA
Message-ID: <CAMuHMdXJqsZswHBCcPK0KXvfgoFsL5Xq2NLoLgxd5J8soe-=pQ@mail.gmail.com>
Subject: Re: [PATCH 4/9] arm64: dts: renesas: s4: mark SWDT as reserved
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 Oct 2025 at 10:29, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> This watchdog can't be used with Linux because the firmware needs it on
> S4 boards. Sadly, it doesn't mark the node as reserved, so this is added
> manually here.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

