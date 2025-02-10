Return-Path: <linux-renesas-soc+bounces-12995-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AEEA2EE86
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 14:41:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D8287A04E8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 13:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE4DF22FF5A;
	Mon, 10 Feb 2025 13:41:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37CA22FF37;
	Mon, 10 Feb 2025 13:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739194860; cv=none; b=cP+lr1q1RUIb177eohKaNJWrezgb0CTMC+yttQQ97suzPVaTv8+vWV9dWxZty5UOLW0/uSWE0/jOT6WUmZQ5U+sydYB06yOcJqlILLdL+iKcCMTXTUcjw0qii4nAMeLJN0xk5v1PmeQwyCDfmMo8IjObgFLFAXqIqWojGDhwz5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739194860; c=relaxed/simple;
	bh=d5M7CjkiBfF1U3RRyoCwbTcDqhRkdFy8/esIO2PXoJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AA/wf31TqsUhRWjYS3elo/i83kOiJ/J/YBhOBroQW1lSNoUWtSAsfCzQcIAkHvgOg3rniKQN3ineI3nmUWNAAWxAvxeeY7ockSUYWHs+FXc0P90jVIeChRNmKFzidO9ygKxFpXVIz2qJRC9mc5U2z/1ine1emxPbGvCQ0fxMl5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4bbbab48111so463763137.0;
        Mon, 10 Feb 2025 05:40:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739194857; x=1739799657;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vaarjJMAl4KW3gMJM03j2ekRCVmUK5mi2YhdBinkVdU=;
        b=riuQKYLPowknXqy8BRKNxpv7Hlq7HXYRyc3rmiDBreZa4p+gtnvkgmt9lXlHwWBZUn
         rMVpB79sSSWP9fv31tMXUepyL2ckZivWCRZzbQeEV4UIRlQFILAhGqL3e4Fg6f/5mf3Z
         k7JgO2RcdOAh+mg8D//9I6N4FFK+TiiYIK8JPseRWufnr72p0TFQ2fHE3tydtHCux/EO
         p07HdJ2gxzgA52G78znp6CZMEIfZEFlITvbY5KiQRZRcMw7hYJgpIjYUxuIqq5TYWr1U
         sJzVG49yC44L6rueMsWpxGYhxYesHA+sO6Bl9wXsKQSZ1s1aw6SQ9XToH/PVgeiaTbfg
         ZV0w==
X-Forwarded-Encrypted: i=1; AJvYcCUD9mtu+D59APVNrBUZo1DJa4TLdafG3QmuGoR75BBHArFtajrRDb3KJsoX0F0KXo1Y2VfkQqJtP/BcMLCOWQgNfgc=@vger.kernel.org, AJvYcCVkBen6djS4JLn/xYshXfQOfOIth0Eip672BIOmuM52o388AlLs0c6CC3gaGmRUO1Cj9ec4sU2DIAbzEWA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP7SpRw4Qp2po/gistoOF/iALrRyGnQ/PXvRaNGik79U+CWkSy
	4cSGFWvnnziFHmv3CB3/LZB0uYw/fUyW/LwA9tEaPwwXrmDjjI3Ao65sjka5
X-Gm-Gg: ASbGncvb5F/q58TGJFAuuDGuU5pe5hbiBsrE+sps651Nk+eNwDrzrswLqTJDUSyZ49Q
	zTJ3F/ziStvzeXjbKPD5UZw0GjtSzg1rgvqnR0FCQc5JB1xhqoopg4vCM1K3002VLHLCNqg8zoZ
	Wr/pyQsFg3h8nbiPJD5AvPRo/DlKCg0dW6WrGofVrrA/2+wMI/o0BMfoedi7ycrq+Gh9jBRkiw9
	patYexWkULpEX5ZpITeD7L8gWVmeEkiwJDcYi11fKXR8mdjQwF23HszwtAJ+qC1IgYpcZrJhgQv
	YDjSfmIHjh4NmTvRh7MjUqPU/cswmsLCRWMUFQ24xm5gYPumkHXQ5A==
X-Google-Smtp-Source: AGHT+IEfrzu4U4+eO7mu+QkqoJ+LRvp33PWcfmcQrsJSsTee5y8DyyoP2V28lYjLSv00YyW0Nh2IzA==
X-Received: by 2002:a05:6102:a54:b0:4bb:d394:46b5 with SMTP id ada2fe7eead31-4bbd394581dmr974505137.1.1739194856862;
        Mon, 10 Feb 2025 05:40:56 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866f97d9237sm1623556241.26.2025.02.10.05.40.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 05:40:56 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-8622c3be2f4so993740241.1;
        Mon, 10 Feb 2025 05:40:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWP3qjliDyi+uYqgx6Rhz7/xnkGUfddJND5LafMR94kihybSsQfe5f3/3EVYCqJ1dEUTXgaRZcJjCkXjNo=@vger.kernel.org, AJvYcCWla3xfwRHeMgKw//Bb5B5N/6C+cPELEgE2uIqx1oTcd4QAppmkErZxq9jguBkuAtuG3gybhqOeklXF0T6RxCJ7HUI=@vger.kernel.org
X-Received: by 2002:a05:6102:8082:b0:4b2:9eeb:518f with SMTP id
 ada2fe7eead31-4ba85e4b3a9mr8769141137.10.1739194856282; Mon, 10 Feb 2025
 05:40:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com> <20250129165122.2980-6-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250129165122.2980-6-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Feb 2025 14:40:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVrzVLWbe4497bzVxcU=KeJVnZoXb-9JpS3oMdc1qKwww@mail.gmail.com>
X-Gm-Features: AWEUYZkiR4_qGtQj6v1cYcK2m850RJRv00LcgMxTtGuLt824D2iCsCpKUZqN4b8
Message-ID: <CAMuHMdVrzVLWbe4497bzVxcU=KeJVnZoXb-9JpS3oMdc1qKwww@mail.gmail.com>
Subject: Re: [PATCH 05/14] soc: renesas: Add RZ/T2H (R9A09G077) config option
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Jan 2025 at 17:52, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> Add a configuration option for the RZ/T2H SoC.
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

