Return-Path: <linux-renesas-soc+bounces-23384-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4DEBF6C5E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 15:30:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52F49486B26
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 13:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA2D3019A2;
	Tue, 21 Oct 2025 13:28:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E667432F75A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 13:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761053332; cv=none; b=tDjkS/8C6P0lN9KxgXI3ZjrpJUxQKpAMdXEx+EtbFC0vL+2YVHBqYYXtcnw1bAhxonpkizxc5db4Lx9Yc5uUf+EQaeVFqO782BJev/32jjhF8AUr8sLOYClf35XkN1jthGdvOe3nHHlPMs4NFNG5aYqIpugxJUdCi6CC7BE8uN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761053332; c=relaxed/simple;
	bh=RQwS0fuOoAkZ4Bs1IOOQqMEfIMm1iFcY5Luv08QraSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PkqSV3mrsIOTWJeW7EV0ojA9xrQL9fyifAkICVqILafUxatmpdsw5+wBvr7O5IeQUtqPBiWN+4bZ5XAW3Bk0SJuwiFUkzGVIPzKgujjwleGp0dyuCNL2tMipicSb68u8LRU/dEPBdcwgIwEYfO4z8R0ysKipi/Bj7c1yUuKVcRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5d967b67003so3607632137.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 06:28:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761053330; x=1761658130;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=foZkbBKrkpzKqOb0SdfF8T3/ui75q1xL0TwtV3s3sfo=;
        b=aEDj5h2bM9cN8j/Yj7KSKjFiUgjh455qdTJW0RI+lvynhLDjDDJaxHu8DwzMnGlAAz
         EQgW21pVe7ny7u3NSEy3Pyni2UijtUBe4KkPBQNdKMX6ounhOCV/v+TJKlEX0/+LPLfU
         4MWN7BDxY+ECbDMiRLdYdOorDtjMISDbacXzcpp5lgCQzKG4MEqdTjVB1w7tQRaLz0pu
         RI0yzSbC37jMcMDLNDGG9hnOM/zSvscN1c97cK4+1Rhq9Z6e7ONnUysSH5DYcbXRyxEh
         F9Y/9ozzmbOxHk5HXVMZ+M/MxU5U1OJlSA8yIlX+/8PrNrxukXyRWw8BxlqhuwDSWXz9
         6cRg==
X-Forwarded-Encrypted: i=1; AJvYcCUl/FSQVAQj4Lhm5V68aLJhkFE+ltPd5orQ7JlpgoDyHXbI3NYVKVzk8m7FyQCaci3kqqSz8wXYs+4CXxObKMh2GQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0uWbjPXfTuoMphzl8D0k5olbRN2Cy1rEekat2c3gK2b4ZZ1qM
	1UBV57m+Tf/2T+9rZ1wbNyQr9KCGsRRWPZ1gvUhZ5dIves5A6IQHoRNk6l4EY9wQ
X-Gm-Gg: ASbGncvDa6FBeJdf6SZtVodnAnQ5EPfTz+QwDzn8EwoWbER3BkT9LFqOFaoCxLTi1KA
	3ymhcy9ssWq0ip7CcpcoL8wRyJJqYzShYeqL+jljUmYvWsj6MKEc2Ees0rGik5N/e/1IDcOa0Ub
	asQ46ff7wNeEvLvVhyG+/UEMd0j73ATPksdHPMJW6ZW3UEAlUSeTR58v9yBs09Lj213sPyQhoLY
	EO3qU6WASfX+9f3laA/CH26qGhsVEBlsLCuLQAI/PHFhBHAOGengqW8kI7wFmFR/Kh22mYvDD1s
	3SEw+CQuhV973+C3sZxYcW42bnv/vzu/6tRHYEm2U1D/i58ZzjEUfcoRnitr6qeTAzjpwruGJOn
	DwgKY+cSqfn/eLQfkOqGEoZo5IrUAsf4CCIraBLhMJ+T9QsTb6VCHjKFP7IYJHGuWOg5ZuG5lvl
	VkeZubpG4lY1/HPBuubpXBFPdZ9AdrH7cTDCV6I0wYew==
X-Google-Smtp-Source: AGHT+IGK8RVH6y1m905d7R1PYhlHps9FI/swVtR5gkKQX/aalnSgMsXBPLGEPBZVIbwt7c1pkzvLAw==
X-Received: by 2002:a05:6102:370a:b0:5d6:130a:4153 with SMTP id ada2fe7eead31-5d7dd5c201bmr5328772137.19.1761053329533;
        Tue, 21 Oct 2025 06:28:49 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d96c2accf4sm3617346137.15.2025.10.21.06.28.48
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 06:28:48 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-54aa0792200so4193942e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 06:28:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4BSZxHvdwBbi1nQpBCcFJ7MljwoiGECsoKZmDlkqvTyvS1WiT7C2GAYyVZCWSD0xtT9ieUV4nv8cH6V2LL52kTg==@vger.kernel.org
X-Received: by 2002:a05:6102:3a0a:b0:5be:57a1:3eda with SMTP id
 ada2fe7eead31-5d7dd555917mr6009011137.2.1761053328121; Tue, 21 Oct 2025
 06:28:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014105348.93705-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251014105348.93705-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Oct 2025 15:28:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVzuRhD-r=gSzm2FDDsAOr+Xu1fWyN7ky-U0NoJWXY=qw@mail.gmail.com>
X-Gm-Features: AS18NWDraC2r8a9GHqVGQXFDsek2PQJQgzVHv7PR4XYgaOZDcSUVJXOIem5AU9A
Message-ID: <CAMuHMdVzuRhD-r=gSzm2FDDsAOr+Xu1fWyN7ky-U0NoJWXY=qw@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Add read-back and delay handling
 for RZ/T2H MSTP
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Oct 2025 at 12:54, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> On the RZ/T2H SoC, a specific sequence is required when releasing a
> module from the module stop state (i.e. when clearing the corresponding
> bit in the MSTPCRm register to '0'). After writing to the MSTPCRm
> register, a read-back of the same register must be performed, followed
> by at least seven dummy reads of any register within the IP block that
> is being released.
>
> To avoid mapping device registers for this purpose, a short delay is
> introduced after the read-back to ensure proper hardware stabilization
> before the module becomes accessible.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

