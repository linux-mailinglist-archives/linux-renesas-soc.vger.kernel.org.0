Return-Path: <linux-renesas-soc+bounces-12588-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D1DA1D6DC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 14:32:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBC4416239D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 13:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A17C31FDA84;
	Mon, 27 Jan 2025 13:32:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF09B1FF1DD
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jan 2025 13:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737984759; cv=none; b=Czw4NuLvfcZ7RHhug5zgS4SDwDPBFqYZL2M0HiTQlPBdzbv36l4q+cnNrbaT9hsU4afN0zXEjGpNo/xlyLpB0ddMVU9oZdg+H41C6HYZS1MvsEE9mKGXP1ss7lo0kt5xR0VDGLCORusDtwLSs59c4q2n+ZvYhZhb/BHDVAYaNXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737984759; c=relaxed/simple;
	bh=bs4Be4iHfGyCtZm49sZ1HzKjxwL4wI46iPdH1vefhwI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s/PBDpSSccoRCMaakHaLW+gCZtVuPKZuqS/GPyvgSzS4HktnWoOyKsDCCswv2Cb0i/ftvQA4ge0VwctpfcAEp43Jud256vqkHxdAb1FI0JgUGKZyz9DHejMv0rbkvUG18NcbPuLa7KEa6Lrm6ARtO92O9p6+jrQWjHOLeMYmdu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-518954032b2so1451979e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jan 2025 05:32:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737984754; x=1738589554;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aeEn3KjNKPNz5fH4fvSEc7SugJm8AUvfxKbNAKX5Bh8=;
        b=dPGUZKtihg/9Y+A2gTzPvc2w0i1CHyR7c6DuWRt2RVJ0AvEfqNhszrsap7IFAVQHpP
         RzoaPFrG3JFSGkGarGHscH1D3tMJ8v6kd+7JjUoIlhfzXj2bLMVgjiD+XrIvqijCx86K
         wa5mq1LTWuGqQYLu8PZLSB1yTSQ7QAC+r5vPA14BQ7cccGDornBeKGa6IqIGNFK0c9r2
         7SUXfgH+3zmzcILlZ4s8o7RdNjQpKz+4jHzhHieUQ5hnSMv5poa5jqPej1wnfGDfDC3H
         5J9HIxbmWootc7A4H2hcrFz8vPq+DCQuk9jLM54GxRIny4I3TtWa08jVEHsqcJOTccQ2
         3QfQ==
X-Gm-Message-State: AOJu0YxbciDxZgxVFa3L5mOZPZajHcUhdP6qVxzN/136rrVhLUUblZV+
	iDWUPBo35+F3DKufh6PCX986a+7KsZBM//lyVy7VvjcVPtkPfKCkUuEbC45OQO8=
X-Gm-Gg: ASbGnctWGlbqerw8JKVnmzH0EACCR/9VUUGiYWBoQHHfcfUBRNSzrtpQ3szOX+iETYb
	H0WBaoGw4lf7kMMvcTBCG2HooHZLcBrWCk7rrVmSXKykFhWv08DS6Aq/IqLOhoryKdnA7JHU12N
	510tULMkXvho49S2uqLjIOxTIhbnRgwZM2CXbG5SY1mjyLnJGyWZGiziRrT4Yg7uC3DmAeijDbS
	CH7I/ZHk7rEOiYNGSo+oXQv/khb3V/eCMQyn9Q83DrSfYW1rYG+fhSjWH+BifyOxMAcUPWxen3b
	EJmXhd8eTCQFCVahSoO3PRT4+aBB9guFeET8/YWXFNv2zeV0SksPDQ==
X-Google-Smtp-Source: AGHT+IGnREtSwsVyKEOU5ZvKAbyTugIlWNEHwsFzdLSzSa9/ZAV0uMAIwCl1RsyDlUK4kv2DoZXsqA==
X-Received: by 2002:a05:6122:4005:b0:517:4fca:86d4 with SMTP id 71dfb90a1353d-51d5b3aacb3mr32703391e0c.11.1737984754521;
        Mon, 27 Jan 2025 05:32:34 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51e4ea34db0sm1402647e0c.5.2025.01.27.05.32.33
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 05:32:34 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4afdfd3124dso1135898137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jan 2025 05:32:33 -0800 (PST)
X-Received: by 2002:a05:6102:38c9:b0:4b2:cc94:187e with SMTP id
 ada2fe7eead31-4b690c854eamr34380430137.18.1737984753735; Mon, 27 Jan 2025
 05:32:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250125130320.38232-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdWmE2UiE7kwAyQKONSE_ytrNux+Wwu-v__K=jjpAutxqw@mail.gmail.com> <Z5dpcZdHrn6XVlCI@ninjato>
In-Reply-To: <Z5dpcZdHrn6XVlCI@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Jan 2025 14:32:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVQSidTJfMCLcZQc=De4HdgmkYDXdaQ3Ch9smV2af=trQ@mail.gmail.com>
X-Gm-Features: AWEUYZmJaCHA2JBtmhcpfFKaRBpjbUofvuxb3Smzgf6C1Zw6z5L_tmsZs9aN-CE
Message-ID: <CAMuHMdVQSidTJfMCLcZQc=De4HdgmkYDXdaQ3Ch9smV2af=trQ@mail.gmail.com>
Subject: Re: [PATCH] bitops: use safer link explaining the algorithm
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-i3c@lists.infradead.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Kuan-Wei Chiu <visitorckw@gmail.com>, linus@ucla.edu
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Mon, 27 Jan 2025 at 12:09, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > Is the plan to replace all weblinks by webarchive links as a precaution?
>
> Dunno if there is a plan but 'git grep' showed at least a trend.

AFAIK most/all of these were added after the original links stopped
working...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

