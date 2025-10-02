Return-Path: <linux-renesas-soc+bounces-22578-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 623FCBB3DF4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Oct 2025 14:23:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 296B416C574
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Oct 2025 12:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 070BD3101A9;
	Thu,  2 Oct 2025 12:23:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B03280317
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Oct 2025 12:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759407783; cv=none; b=qW+8aAs4lGs9rYdcrPkbAoWtFc8rnsFLJ+CaMy3zxF7dso6BL4KhJaZDuw4ZkhacaiYZupdZ7axJKBpm3wmp0qhIQLTL53hZqB+nH6raJLwp5OmPWrmFYz6eqASl2EtMP1Pqhhh1Oih3BlmhckaxzZ9bfcqVPD86ArgmJ9ntlns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759407783; c=relaxed/simple;
	bh=Tqtk/3Mjh7EHlittC8esBGgOeAbCYg7iKT03peJmm8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LWog4e0xK49W4a3sbfTG/wjKh4N9g3zpTORABaSqTd/DaHtf4AwoJpkhYm649Ri+yaoY/FcgkPrNklYoFcNaUk2XxnSw+DCcaP/Xt9/dj036ih8/GltuieTTtMrwJpRrWPsyGrYBjrVUYwu2eAFVA8y8X/D8GxBCcuyb/Vc6C8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-634b774f135so1733622a12.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Oct 2025 05:23:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759407778; x=1760012578;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Va9V2uUOhWQg20/22Fe+/4og8vX6tT9a0pItbdogQI=;
        b=P8ziSkm8/yfRhjWal6SlSlM6keeVCQy7GI32xPLof/iRn2jv/jpyRGuEotY6ZmofPe
         TdO4qui2FwHdJ//kJlt9EpQPCvUVgi4lxzpU7g+cCa7il5UXiIO56UfYG8koEIdSV2rd
         fRm3TDGdhhbPCgrr2/Kq8174bmSLrog1UE1j7RhCRsiEbZyu0Y55ijC5BgfPl8pjbw9N
         Nmtb8pTqOmFQ+Sq+7jicCgwxLJ64P3IsgpS8Lh11p8SEkzqKymrgWzm5gGueBp5BnF24
         A4QBo01uDpV4lysqg9zed9YZb64gAwZs8ATQ5/gu61ikKjBs8F7pOKP+wSsN6XsqAxAS
         LUFw==
X-Forwarded-Encrypted: i=1; AJvYcCX50ZeXJzy31WVo7mXmiMhhsArVaPV8x4d+OQ+ykBCjKvbzfEmTvySsSKfmUmZvCPLXzPMB4BS+I+BEIKAd0L4x0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxprKzndt0CL1q4p4HecEDXHg3w+oOfmA4iI+VIk1CsCiIxhs4u
	TxISCrwlE9ls4WXUrCvTJjRXXgOWvcR2YXvdkLDwefXssLmnemxr7jl7aYnqy+uH22Q=
X-Gm-Gg: ASbGncuM+sZzVqsI5sOGcKFTZli6CYx7ReI6Uo0sAuR4b6xNv3oiKsLZzyOFH3H9kE6
	xgQhBvQ9/UJUr03Wqb1HGU4i62+thceqUS44IFoDV77YTsVyWYREH8GN4z2tCdnpL2mEkSMTPPP
	0UMnb0u11rDlKQIsXqqWH3UB/Hyd/0etYZo0jf1hziDnMQbIDNoMh8sPGU5S6LyGWcCvYLxv6wq
	ZAON6XnbsuzqTt3Pqca7/6e8kt7X4GZ7XwzQyxVY1xVO7g4RPSuceit3En9+kP7Jsw91GFJBt7R
	9iLUTd+8Hbds4UYhJ2OIDMONe43H4jaMPPEMl9OhdyNHFrNNvbhg7wKqVPZbOOaYBAwoaZJ2g5r
	dd0lP9o0sZ10fzjmTYi3YXJk90SaLYI8Jy6Q8Dufg7b9CgeqZHpY9HSzWveDkP9ovocYgkOzzy+
	IO1yTz+zr/
X-Google-Smtp-Source: AGHT+IGDMi0irdDH6wexIPG1cYF+GS+4bWdjpa4n4aHpb4DNG/WdGPQST9uXWom7IKim+LU7QjskfA==
X-Received: by 2002:a05:6402:5249:b0:636:7e05:b6c0 with SMTP id 4fb4d7f45d1cf-6367e063f45mr6099915a12.0.1759407777882;
        Thu, 02 Oct 2025 05:22:57 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-637881010ffsm1780354a12.27.2025.10.02.05.22.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 05:22:56 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-634b774f135so1733524a12.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Oct 2025 05:22:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUyjkcZaVPz7c0ZZLPsaR14Xeqsd5mqBtvpcQGa4YABWeuoTC5ET3NIwLNQlTsXQ9gRR/qp7YG2e9ctPImrlt7tNQ==@vger.kernel.org
X-Received: by 2002:a05:6402:518d:b0:62f:2b53:5f7c with SMTP id
 4fb4d7f45d1cf-63678c4d329mr7937739a12.19.1759407776512; Thu, 02 Oct 2025
 05:22:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251001122326.4024391-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251001122326.4024391-5-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251001122326.4024391-5-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Oct 2025 14:22:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWF9ZLrUMrk0LvDqVTPPnm8bAvqf3-hvtobpZpL=S=XSw@mail.gmail.com>
X-Gm-Features: AS18NWBgQP_ruL9GwGLtrsdk2TQDw2PTGEAqKYNAvgwmaawF9Btroxq-FKYQXOI
Message-ID: <CAMuHMdWF9ZLrUMrk0LvDqVTPPnm8bAvqf3-hvtobpZpL=S=XSw@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] arm64: dts: renesas: r9a09g077: Add ADCs support
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 Oct 2025 at 14:24, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> Renesas RZ/T2H (R9A09G077) includes three 12-Bit successive
> approximation A/D converters, two 4-channel ADCs, and one 6-channel ADC.
>
> Add support for all of them.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

