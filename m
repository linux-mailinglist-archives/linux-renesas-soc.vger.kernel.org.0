Return-Path: <linux-renesas-soc+bounces-18988-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB08DAEFADB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 15:38:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61644445313
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 13:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B918275106;
	Tue,  1 Jul 2025 13:30:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F102750E4;
	Tue,  1 Jul 2025 13:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751376640; cv=none; b=thQVYb6HpxGxjBIQFGqdA2aYiyXl4N9Zdpc9aywarp+3uM4hfQ8x1I2wIvu2LgChqDDZFU/aN+4fBYGFwI6L4ZHq3BFZ8uDdxlvjgx+ZANn9M1rnb7FcPgdthz2En3XCz1cIfdWbXMkwZTdOVNW6H6AQv0o10mUJ+MtWJUgk3nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751376640; c=relaxed/simple;
	bh=J09a9Mwip2Xl6q4fugzogQiS0NXf3F/4eXf+h2ayJvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fC7hy8NRmN2z6enYGInAw0iB7cuPZ2J9wZYO+98aFwEMd6a2HmSplKmxc/WtNsaaaKrZFiY806vgsmFAFor29eDffS+rL9LugSPamBof6Km1eqLK4Id/eXhID476xA4gkDZF+j8+LD0i9LjhK/TFDPD81kbuZTVa39nQ5lEBt1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-532d498eb95so1068578e0c.1;
        Tue, 01 Jul 2025 06:30:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751376637; x=1751981437;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Pa6W6WCZZosOdEoMRfhpDFvlYIW+s9x+Nn3RA6Noiw=;
        b=AHETOBq86vctTwwTqaP3HfmYywxMciJPgbj0oHBqfwf6NypHY3YBlupNaFFoSjibzW
         I6iadSsXoquHv2mC2euVMztE+9LvGQJ95Cz6/sSY6UUSxcRtovhTcPVrGeeem4X4iucx
         DyFo/DFucez4ghRsVLMX6EDrfRpw+WYYmJ1MRzbu13LMms+lIsBc9VzruZuWmdl3FQon
         o9uU+pZfA7PYXsiFswblz7jfSOM9PglELXBBQo+QULBMSA2EXN29XIsYM4TfkcLeF9YY
         q1/d53HfE1O5wlnXqnlRP2ja8Pwqi0PjEgRYfSogzQzqftFD/k37/YXEaXj7LnQqgxSq
         mR/A==
X-Forwarded-Encrypted: i=1; AJvYcCX3q9QBTgxHZNWy2zkaiMc5nBMuUxaKZmKwcocUN+LS+Tddm2f0WaTIk/bSR61/le497wZSjGYcM+OF0p4=@vger.kernel.org, AJvYcCX5nqPrIRG9DZ3VZ4YdbV5xf8KFriirB+3LbxNp98j2W3PZ5hV7/Gwsm9Tz+KCA6vsHMR5P9GeFKHpSRfmfc6Txis8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ69BhH9gU8rYesxLfwfQ711Bp85ogDfgwN26GrfkAfZyGyws5
	5rGIPOez7IJjCOtXZNkmtJmhq7twDSLD6/vPONhlMHWxQB/CWFF8ZUh+NpiwqL67
X-Gm-Gg: ASbGncu8JG/Ij1vMed05wrOiOVLTOs84Tf1Il+PcIw33937BM7UBvv0s6aQpF9nZZO7
	SLY5BqViljSPNiD3g9zDgKJmA5uodjK4iJCpGC7G2lEfJu5+27eXexiPVabbAohtq+QUqVXejiC
	OD+SPKm2iidQKsaV/DxjOBlUpBuMZd4004kdNOcMjCa6Q1QrsO7QT+Ey8iZqipvcAYuDkkXV5C6
	sWeHwBBu6hdcD91o7pSvMb/EqeCq06kH+GpQ71dwOkZNNAhHkswi9rXXYVcXURfujkjjoe6yAOJ
	SgY7xmLLJRCpNDYu2dpvC+a2b71sNYj6OSPQeWGgdD/qqfLUo5EpPeBCvVoIMdCuaYkEx1QDr88
	UJrcKADX6I8Sy2/KypauHHuZrrGhOyz3ubq8=
X-Google-Smtp-Source: AGHT+IE0Vf2iI5L2ti7e7oRVwUGXbxhdlBfFskPd5KjKYMcKuJTMz7I3SCv9s5clzB4FMXPNgStMEw==
X-Received: by 2002:a05:6122:1aca:b0:531:19ee:93ea with SMTP id 71dfb90a1353d-5330bbd3a5cmr9837334e0c.0.1751376637270;
        Tue, 01 Jul 2025 06:30:37 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-533091bea7esm1721608e0c.29.2025.07.01.06.30.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 06:30:36 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-87ed3b792a2so623690241.3;
        Tue, 01 Jul 2025 06:30:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUxHDAfnXZ6sn9zNKxGcviVROnzSjBsbTUY6GLRHBZi8VDC1yvau4qtKP2mGPgMl1w4LvbHjH/9Fy8FXro=@vger.kernel.org, AJvYcCXT9lSLELlHRjPUypBwZ5tiqgl+suV4q0LlYS2peiwed+mAtFG5vslyUnhzA+ejOQFIAKXjMRcWk3WJEH8/v8NQ4xo=@vger.kernel.org
X-Received: by 2002:a05:6102:e0b:b0:4e5:8c2a:fbee with SMTP id
 ada2fe7eead31-4ee4f7aca08mr11179396137.15.1751376636032; Tue, 01 Jul 2025
 06:30:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624192304.338979-1-fabrizio.castro.jz@renesas.com> <20250624192304.338979-5-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20250624192304.338979-5-fabrizio.castro.jz@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Jul 2025 15:30:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUqKZYTSkX6azfE+yxuWrQhO63zDyK2h=Ntpekh-BMEDw@mail.gmail.com>
X-Gm-Features: Ac12FXxWpltO73kHpcpyIiYK7yTo3qR29kLdLYqEVvt-DZH8N1sX1aThVvVvEqA
Message-ID: <CAMuHMdUqKZYTSkX6azfE+yxuWrQhO63zDyK2h=Ntpekh-BMEDw@mail.gmail.com>
Subject: Re: [PATCH 4/6] MAINTAINERS: Add entries for the RZ/V2H(P) RSPI
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Jun 2025 at 21:23, Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> Add the MAINTAINERS entries for the Renesas RZ/V2H(P) RSPI
> driver.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

