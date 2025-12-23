Return-Path: <linux-renesas-soc+bounces-26053-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB0ECD8FED
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 11:58:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E61D30402D8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 10:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B708330B31;
	Tue, 23 Dec 2025 10:56:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF3032ED55
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 10:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766487400; cv=none; b=U8dvm6iB6snlu8vzgP9G0VVdpIwnwWty97GHGXbTc88hsQqlxPBolp6CBXStC0uqi+tFwrbm/zaY1fhzeyB0dSXvopLpvdGKUb7m+rbLsqVHrtzA6uYYYRcRW6nVCUgDO9n5cAd6c9R2xms65nOiUgsTnS0lrFMn6X993MfXa28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766487400; c=relaxed/simple;
	bh=yQ/KlTeL5Decmmu1SKc7gcsfNHpf6gQrnUfnqrhq6iw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pcK3d2O7PMQVGPw/SDVge6UhScH1xefRC+pdQoscNZhStJv8zRyhPGRN72nUTByIy071eM+FyZ5rUHg+dw6nVkBG+iaRxrgf/yIrn4A5fF2c+Kileid3JAcDjxvMtT1ef7kbnXyfim7kF81ZYy7YqDesT3RLWYkOYbaEIy/QZCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-55b26461e78so1248031e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 02:56:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766487395; x=1767092195;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zU7dalQeL7dwIKkdA1xikLJ/9Mwypfr0NJiO4a6Ox8k=;
        b=V83hFwOXWDoTZi9NOx+008dGKM4BALOxflafzTW+vMx9ys6SilyBKiff0PgF9CR1yj
         1gIzndpKqRZFPDwxae2HG1OvcOW/md0ZipxbUIyWknCB4Mm8VCf1CXuQd7h5OkCaM7lq
         v/DefRUmMc6KWZr6/I5JRspTX6Hpn572mRbObOO4G1OkPM1nXkTSE0QQE8OxwoawZu/K
         uXI4a601bExEEAfm5vCD6Rw4zqxSFkq1jE0JpXNgz3CT8ZqEuqFdW9a9Ps2GjnobVn4s
         B+pmH78v48fXZe7W1xG6MYdIE3QAkTRxedBM6lzcb9iA+wIWupa0JzThG2e3zwGhYbZg
         RZzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxspwr7wfdUTbJRp5ndGfWwjdJEoktETcBF2kkStmV2uAwdeYltZgAAsKiJLSqIk1GHyh4CmjsnhMZQ+UpmaSz6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPrSGjuioQwfKOIaxSrnz2xHgebBGki3dvESzPfD5BBH4G1SX4
	NCJ6DltFGNep/93SEPAaBJYA076JpPWDgDFF6m5CRML650SNJKj/S7NyFL+fTIcP
X-Gm-Gg: AY/fxX5V8C8yZ21jclTwWpGSWF6uqPnc0YZEEpoe9Pi/vjMtq+jzzqezUauOqb1j3CX
	R0MHrw4autgoCQyWx1hx4IMQbUZvrB70s2hCpQjPkb+m7Jy5BuZa6kBU+C/6ciwvYaF3pr1E/qP
	OA7NZJo4IEAatZVqU6NPKItyXQqdBNgAdR+5vd5GqI7SuvvSXNlGCOE3VZdPz3mN4B/ZvrnoLco
	VqG9rTjUHzj8t7IKtpb7F1Bq371+Mp7skfPKKtJAxK3QQjkNen48YAZfeAW466I9LThn6ly6qO9
	SLBBDHfZ/7SrfJq7b26shWBFY+83wfGeRqULN8PM6KjOl+VL0wGEYpsOWRrKTY5wsD0P97jBaVA
	+ILB5JRvmM1opF33VI18vtjl5H0nQCLokWtVE8TEbC/EWJtnxi+B8uBJWxoFiaqBvvmsS1HYPeW
	9Q/gK7+mHBM30FUhU3ws5osz/Nge1oqSNBcTGUxNjkHWsksztlgNjDYkXUKTg=
X-Google-Smtp-Source: AGHT+IH2J3AU3DYePWKRYpDTkHeCHX645vtPD+3YvHWdPv9kAcp0eNykI9sBdbnPNCNJQ5UldGEazg==
X-Received: by 2002:a05:6122:489b:b0:55b:9c1c:85f2 with SMTP id 71dfb90a1353d-5615bce2f9emr4349219e0c.1.1766487395322;
        Tue, 23 Dec 2025 02:56:35 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5615d1518d5sm4351557e0c.16.2025.12.23.02.56.35
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 02:56:35 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5e1fde1f014so1430381137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 02:56:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX8zV0MpbN0jxQXNxdEQODih53qV1ZoYy4DFwIfymjVPkz9MhYG3VqwBz67TQhg9Azpv+xhsOrhmTO4tD5AY7gKzw==@vger.kernel.org
X-Received: by 2002:a05:6102:4487:b0:5df:aff3:c41c with SMTP id
 ada2fe7eead31-5eb1a805812mr4210372137.30.1766487394797; Tue, 23 Dec 2025
 02:56:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101072951.2681630-1-iwamatsu@nigauri.org>
In-Reply-To: <20251101072951.2681630-1-iwamatsu@nigauri.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Dec 2025 11:56:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX4XXJOXu6n4=jnAb2Wdw_Xmx5HmnH2c+FSRL0azE5OZQ@mail.gmail.com>
X-Gm-Features: AQt7F2pMGUmJFhpra1kEeOam54oQrSVzhKpcGV8lDUVFASDyGO5bBUIaTFjbEJs
Message-ID: <CAMuHMdX4XXJOXu6n4=jnAb2Wdw_Xmx5HmnH2c+FSRL0azE5OZQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r9a09g057h48-kakip: Enable SPI NOR Flash
To: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 1 Nov 2025 at 08:30, Nobuhiro Iwamatsu <iwamatsu@nigauri.org> wrote:
> This enables W25Q256JWPIM NOR Flash connected to XSPI.
> Additionally, this adds fixed 1.8V regulator node (`reg_1p8v`) required for
> NOR Flash.
>
> Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

