Return-Path: <linux-renesas-soc+bounces-22457-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2430DBA94F7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 15:20:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD9F717CCF5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 13:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B887330748F;
	Mon, 29 Sep 2025 13:20:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2931A305E24
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 13:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759152001; cv=none; b=h+tp46G1XQGJo19Y0BgLPvH3zgUoo/EcOsCfe0NmCR79LuEehQyamzFzYaUEe8Q7hg2mcXnw3HctO5VIX0dKWLgQQJPGi5/01WZvACTjTA+AdfNHaR+Z0gYXehm+hJSHxMy8FBe2EXXIKzspHzuAxDOUKnJlHzyd/tDODtZupOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759152001; c=relaxed/simple;
	bh=vIo8G1dUkqGexyodFaJyBEisgmjuJNKw9KNh+swMCgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l4sXkshRnMxfnOwtGG27viWY5Jvix1+q6IKTjZ/Rp+1CCkWToYbAJScqBgucWrj+5UKMnEvsIRDIyM+dRz5cVRRdzdhgUFTP4pktopc+EtIACyzSi6xIiVIu5QqPWBBa1JE+BXvMws/KRJmwkIH7LRsvBcDIg6ICAgn2SZMHoJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5a218470faaso3598379137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 06:20:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759151999; x=1759756799;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=23gbORvNsNd/bWBvceXGDRuebww3eQ8/sn5W2L2Ij0s=;
        b=nmRcI5rqF9U+UHymZFREHVybn2A8f4jnnAVdcXwKqDa4cA2kuzud4pa4Vbk0LOa6t7
         mjvE15pl+GIBnjXupo59eTF8v5kU2DZcNAEJpLQgqneaB9wnhWzTFlfwkgudB+On35Mq
         UtAEs7W2E+nYXURH+rRybtVLBQWHtBnEYSDHrYRgufvMc9ZD9dkDkRkXXx8rcb1/4RBi
         MBfJEz9qD38M+n2sqYh92K6grXdSZOhzjwCvpo2+y/aDND0P/tB02sLcSGA17MZW8BnE
         8XhV4O9umjBIQPebOnP3nF+2dFOrej8siB8dSNwE00qRBif1pHx2xfe+r45iyZ8LEKVM
         co8Q==
X-Gm-Message-State: AOJu0YztjCACHnNrniBW6HmKLkqD+cLNWZaamVzBg0KlwAog4C6VsA/B
	5fbSorYHUNr/8QAzEjGrqmAk3DzlEyigoY3ia8x0hCD/heHxbGKwpyKHQpa2hVSK
X-Gm-Gg: ASbGncs1SsvFm+InuytVvaHHNy71M6UxHTT4I2YeSnnK713VECPBZhNlDMnhlqVycMs
	wY+MDM+oOwpw+0RkywW4TATJtftFZKibuE0p+4hIJzTdJFb4cWeHU+JirUmWAmV190mDZNPsM99
	ubimaFq8SIPySCL75AFsbswHcOmDnZDe/z3EdS6K9kGRxf2O/7lwVmUOJaEN1QhybZn+yu4+QzD
	R36qALGuIQOaJrkQaKzIs21oHWDwXPwrfReMrBjz1mTxORLkQnb3x4ytlyv0wjEpiUD4+VFuFGR
	AJljT8SJEkvK0zO10F2/EcrX4/mY13KwhhHxTF7gGNP6vCu8u+fX+pIotTBywcs4gsB4lLSEc1t
	fKv/J5Ggd8M6oVH1FVh14gpQJ9CrScuZ9847tcKVvG0YZo0l+9GiGcEdoa2LRq8b54FVkcYo=
X-Google-Smtp-Source: AGHT+IHqsW/fhg9i3z8ElqBullOk4Eln+e8pujFUaM28pKbzwAJPatJoC9+vHWkYV0PdvS/boPJXKg==
X-Received: by 2002:a05:6102:950:b0:56b:54c7:cc98 with SMTP id ada2fe7eead31-5acd4639b06mr6810227137.21.1759151998931;
        Mon, 29 Sep 2025 06:19:58 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ae305d0c44sm3364980137.1.2025.09.29.06.19.58
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 06:19:58 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-50f8bf5c518so3584397137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 06:19:58 -0700 (PDT)
X-Received: by 2002:a05:6102:c0a:b0:534:cfe0:f85b with SMTP id
 ada2fe7eead31-5acd4639aedmr7850547137.20.1759151997701; Mon, 29 Sep 2025
 06:19:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250925093941.8800-14-wsa+renesas@sang-engineering.com> <20250925093941.8800-25-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250925093941.8800-25-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Sep 2025 15:19:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVg90v7GtR-Na22F2AHbB77dNPAskcrMkZfcNn4KQciXA@mail.gmail.com>
X-Gm-Features: AS18NWDouu3Mlu91mJ6p4ux5ma0dgCGP3C3S3u0Q2HXWXPDY1GzrC0vYCXYV9HA
Message-ID: <CAMuHMdVg90v7GtR-Na22F2AHbB77dNPAskcrMkZfcNn4KQciXA@mail.gmail.com>
Subject: Re: [PATCH 11/12] arm64: dts: renesas: ebisu: mark SWDT as reserved
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Sept 2025 at 11:40, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> This watchdog can't be used with Linux because the firmware needs it on
> Ebisu boards. Sadly, it doesn't mark the node as reserved, so this is
> added manually here.
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

