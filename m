Return-Path: <linux-renesas-soc+bounces-26061-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC138CD9643
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 14:01:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD5AD3012DC1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 13:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 147FD335545;
	Tue, 23 Dec 2025 13:01:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B78933A038
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 13:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766494884; cv=none; b=XGKSE4SnYOSqfs+QuLJqLvrAo8Jn+fc1kqpDDRbZDh25CeT9MZoAuTPcB5r7/uEw4sUw/7JBw6iX80A8HTRUCy7vJbWzJsMyWy8oUknlhBzlNSbod8p5DnQjfobZSQierR1AEwYdYAvb2QuFNRf4RxHwkHS1rlL7RxxpB3a7QE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766494884; c=relaxed/simple;
	bh=DmzV4xvNmIC3gGCWO3QodxFTHQ3XUO1suKUrpVXnwwQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X53YLWh9UCaZbFgD6H10eyzkvsaa+MYK/VCgCvDTeZrKJuhJQ4W5TgFHwiDhyELU24Dq7yBuJ0/+pJuCabY4TQahC/9dfGkGKwyiKQ0zltvnjCVC/9y/RcUutlQQeKJD/RRWMcHXAVZsGMWfFaJ1ZX9jUap9wnnpfNeYyRy5nWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5597a426807so3137514e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 05:01:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766494881; x=1767099681;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IA6jZzQ+8S2knok6hUBAL8IKfKRQPJXwctwV+WsKFLQ=;
        b=k7hJJZu7FZ6VpUoLSK5qNBn6cloYDpfYw74YFEzf7bCzjna5euaBrvo/llNPQxYhVJ
         gZRZ49DrN4FxSr8L37t5kV05IhwiQJPG6apkTwvfu/4Ou7Kyoa4awKyRG02H/c0Hr6YU
         1WJzocnCbHcyHjWCyUSxLHsTTomJEYz1/YkcFFIoFd+WOmQ1YkVPbn/4x1K2izxDqF2p
         i32kEMaivxofIkg5PM1Xj/nVzrwy7slZ0725BNTDUV/wxeyaFjyDTzCMYK3LxsxJzIUm
         Dq/eKgC+xgqjFB/L3m/QD1htYr6acanWhZfRxR2IuSOZyrJy+HJQTmBm8vBTLa8LRM7Z
         X1Lw==
X-Gm-Message-State: AOJu0YymNj/pVG6FZpsb374ZSFIp8fx9ubfx5gyC/Hiv7TJHxvbWgTXs
	lty11TXlm15rpfQ6F0uaOodEgf0Q/fPP+zJYasGEbjfg9rt5vOxhmg6gX3orTefT
X-Gm-Gg: AY/fxX5Rr/bJf/N1CH5w4QjZKhIWSa17DdSdtRZSG+BKmdahq/DsWTwaN4W0Z06QwCK
	CpiWaw3O/83FtNKuW74iX7P1VLIRxYv0yAn8OfAefah11qcWISMRFpb0lXINzrfooUQNSxLi0nL
	sf7fpo7PYR+Ud+hihlc1x93/hawHVKWdFwrJMTl203RfVwC9BjY1uzc1QmpnFPXS0kWhKZ8p3wP
	5OrkeCTHY/Nb8sKnX5S1N5SYli2jkGAIt3yTaV4GRlQ5pTKTvRcUvOzL1r145+kEIbtc/ZYQmnz
	9ew0uyqZwpUUljgrn2g1eKQ0EVw4gx8HgNLBW8zZnVistOLiLkBCJXHo0HJHdvaILAPHV65nQvJ
	Ldq8oXGoGxNH6yT/F3FqnL97SqBIvrm5dI3exGPgZO+jUYaFmcOiOKJlT3YzC8ft6AzobWn7Ly5
	1lYDB6w3yu5m16XrCS/FhJCQyfRr7RtCp/64We7ZC6mL4h4tM+OzR7S8/6IC3RsWE=
X-Google-Smtp-Source: AGHT+IEgzYM+WaauTxMIFTIBgG/4+JfTaOVqpLD81oJX2FkYuTh6yc5Op2lYpNpq2zc8L0Prpg6jMg==
X-Received: by 2002:a05:6122:2187:b0:559:6960:be0d with SMTP id 71dfb90a1353d-5615be678e2mr4274154e0c.13.1766494881022;
        Tue, 23 Dec 2025 05:01:21 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-943417b7ba7sm3921008241.15.2025.12.23.05.01.20
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 05:01:20 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-559836d04f6so3316008e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 05:01:20 -0800 (PST)
X-Received: by 2002:a05:6122:1d52:b0:559:3d91:5f2d with SMTP id
 71dfb90a1353d-5615bd867efmr4540600e0c.9.1766494879778; Tue, 23 Dec 2025
 05:01:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215034715.3406-8-wsa+renesas@sang-engineering.com> <20251215034715.3406-14-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251215034715.3406-14-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Dec 2025 14:01:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVkTFWo5RdVq+H0PQOHs-7TO08V4YY-Vagoi96yawtPeg@mail.gmail.com>
X-Gm-Features: AQt7F2pjBBT6ay2L-6lkLl7oRDtUO3eq4pQP7jcPLoHRlos7jjrUGuT_P-wiI5M
Message-ID: <CAMuHMdVkTFWo5RdVq+H0PQOHs-7TO08V4YY-Vagoi96yawtPeg@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: renesas: r8a779h0: Add WWDT nodes
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Dec 2025 at 04:50, Wolfram Sang
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

