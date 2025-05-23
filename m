Return-Path: <linux-renesas-soc+bounces-17427-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1865BAC2084
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 12:04:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86BC21C06023
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 10:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA70F226D16;
	Fri, 23 May 2025 10:01:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5855C22370F;
	Fri, 23 May 2025 10:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747994496; cv=none; b=Vn7mBuiFhUvcawxEXOWLiZegUZfnnv5x2zjrYYOh1nZU/dsuDqBi3FbF6fKoBHiq3QWgbcvUqVvzScwlw5GQ5AGqeK2vPsSA3Y2JuN6mBZJyW5Tw8TW8jhimMzU7ITs2XmKAl/AJWZu/0gqFgb4cvc6RC+WyNUmRM2WUXXqAtmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747994496; c=relaxed/simple;
	bh=NJdtv6GmPu1+XOiSP690U7jWpekRbX+VzlxGbpmT4dA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rgBDDPcLyT4tx/oZKf/zPK1cM6AA7pip2pGG3tfx8c06BArnJL79OqqQqgzdai7G/oaB/GzRvi4gQSZ2+q72BU1lqezlyJytaHuVDkZE+qWqNRip23pTL4+w3VviqDV7iBdOOYdel2fhYLtC/nL7IL+vOFphB2/gLwRlUaMOI2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-527a2b89a11so3049238e0c.2;
        Fri, 23 May 2025 03:01:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747994494; x=1748599294;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lw2mnB2eWWUd/fRdi8WSEZFVQVzABw7jmycIbZCqC0w=;
        b=laqR7eAgV7DwY16WjNpHA9GGtJKHOiUyG+Kfu3vssfMrmLFbCQ65L13eTAXhhr4JZ2
         Z+FpbH2hA5MQb7DKVGZpYyST9UmCao6Br58jYvLIcIbFsATJ52XEBc6ll18N1GNAtqP2
         5FbJFiH43X8V8t1qGh0nCOzx/WuW8hx0nNRrlk/sleD5wh3Py/TnjRNcGTaEoTnZK3Y4
         3FHY6ned7bmyNqvrnGR4xZQnuzqqRX/Tolo3yEAsNYhugFNUYJfDXkfzGepBab/heTp+
         Day1lgWsedpf63ezdn2Om7ztrfs1P6iRzvZBP+z5nP5TICOGre6eGyeRhweBMhcOguBs
         L7Nw==
X-Forwarded-Encrypted: i=1; AJvYcCVuKKAkrqERa13wKqNt/HkcI0SXNzH7PBmLOUprz7kgXXnzFAemY2sIc1uZ7b9Prcx+49RUziuGqgqqEzAX@vger.kernel.org, AJvYcCW0L0gPIHiSMczICHUQjqSh5xjC3jW9J+y4dTi5P9bINP9XZAXKLs4g9l5xDBfXjiXLmO2Qb8xC+sU=@vger.kernel.org, AJvYcCWuXhadpUz0mXB3VgHb1CdufZIuyEOGYsLDrMtJsjK3VsB9r7hPB7/K+EP/27badb82bQ//1nJM0/iHLQ59B9oRlNM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhEhSa36JAgfp4jXV8S8duABiIZ0yLfOX0ZRUUElvb1UATXtAj
	KtknUGGb6VA1vDbuJfPDY4TFwsme8Y4RcI+iKO6WDpJG540wkdH0yesA4r/7TCGr
X-Gm-Gg: ASbGncsfVv76MHt9Hr18qIlxlKeXwgSFCMmdRwn3G34UctC34YZSmsV51m0ySmWOuQu
	JicFIR3XQ0BBFVG+295Vpbz6ZNLZ4wyI/O69FsSoqYBXx5ZjQULu0qwl7dvKUbcvxhjhgSdwEmv
	QCQIFV6Vxw+Gi/nr/BA1eP3pWOHq/3J7+Wd8TQ1UwuwlXgSL9vbKglT//uRTvUCJjzy6vItxpzm
	Yr0SJMcs0aJFZL3qT040dxejlFy7/tvycS07YN4vo7vEa1d4KVPf4IXfvoPLtkrDoWKbD8/XRGI
	/qribLIs0pjWKk2Byj6Lf8IBtglv1ntD6k7ybSlcxDOjbI7JDS4p6A5IN6l118+2XFNPVxisOZy
	y7sSDnwwiGqyZLQ==
X-Google-Smtp-Source: AGHT+IFrppvUU2gwdRLqYijusDb7w5f1qXj/IJjCbFyszCQ9ioEF5+/0sgJ532Qcyl8D7gImHLb5nA==
X-Received: by 2002:a05:6102:c16:b0:4e2:955a:b12f with SMTP id ada2fe7eead31-4e2955ab974mr17644884137.3.1747994488607;
        Fri, 23 May 2025 03:01:28 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e144511052sm11255879137.26.2025.05.23.03.01.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 03:01:28 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4e149bf7f4eso2555610137.2;
        Fri, 23 May 2025 03:01:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVXZCH20qjVOLGRXVGdwRL69qHjYyiZZUj6KSkwoC30KdUAA2mbwyXKkCM5njfNBZbHKO9OowkcDH6wyr80@vger.kernel.org, AJvYcCW2zBltxVCvVicGq+32ZE5lQLiPlqaz6FN+LIj0yxsSWWhL3ZHOafpmIrnizGnN0HXCV/hRNN0Nq80=@vger.kernel.org, AJvYcCWj7FLiPD/ArDo9kCRWb/ADTL9gWoZYZZYaDMMZ3khodgktjz9LnTQ+1b2Eiq/O+/hWSkTJymqt8WMHaiua1XwS9Jg=@vger.kernel.org
X-Received: by 2002:a05:6102:50a4:b0:4bb:eb4a:f9ec with SMTP id
 ada2fe7eead31-4dfa6c1aeb0mr24449023137.16.1747994482563; Fri, 23 May 2025
 03:01:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515141828.43444-1-thierry.bultel.yh@bp.renesas.com> <20250515141828.43444-5-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250515141828.43444-5-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 May 2025 12:01:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUfMCxa8GW1Lpf47AqD1+h2j67ghrTCvVcsBggHNd09tA@mail.gmail.com>
X-Gm-Features: AX0GCFvrpDyS-AyyJl1bkC1vwwyFvwIAheURBWaXCselU2MfukzegspSSgcYub0
Message-ID: <CAMuHMdUfMCxa8GW1Lpf47AqD1+h2j67ghrTCvVcsBggHNd09tA@mail.gmail.com>
Subject: Re: [PATCH v9 04/10] clk: renesas: Pass sub struct of cpg_mssr_priv
 to cpg_clk_register
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org, 
	paul.barker.ct@bp.renesas.com, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 May 2025 at 16:18, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> In a subsequent patch, the registration callback will need more parameters
> from cpg_mssr_priv (like another base address with clock controllers
> with double register block, and also, notifiers and rmw_lock).
> Instead of adding more parameters, move the needed parameters to a public
> sub-struct.
> Instead moving clks to this structure, which would have implied to add
> an allocation (and cleanup) for it, keep the way the allocation is done
> and just have a copy of the pointer in the public structure.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> ---
> Changes v8->v9: rebase on linux-next

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

