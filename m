Return-Path: <linux-renesas-soc+bounces-23349-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C3CBF4E25
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 09:15:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BD5844FE6FD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 07:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF912274666;
	Tue, 21 Oct 2025 07:10:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E30927B4F5
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 07:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761030611; cv=none; b=NpLbLreIFeF8PBLL4/jjby+y54qi+59AkJ4vW/3hZi4+D4Y4R1zaIG39Rdfp2WUmL6iRxH1Q/ywH37uDWVYtnUs9rZ5lIbWt6CRG6KjN9h2Cx+gLcII4cgvGxJvUOAgOwAn8bKT7gnbN5MrkACYNmsJXHOkqJv8uulrDDkSxy+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761030611; c=relaxed/simple;
	bh=EaWOviValG7y7rDuZFiVJwGc6tgKAHv5i2TxQg6KxAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lu5FawcB10Qn5VmKLtEWDdmL4/nlQ8njs9gpItIE8zwkJYyWVRi3lgp+qBHtiuXP0SjEOi9b/PmBOIuzcZaCTwaAcdQzrI8RZVGv6q6jbxGo2ugfn81JivA0xPs47RGB7l31xa2ds+5eLBbg4eRZYhjrWpyCB5opI99A3cTY1P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-54a8514f300so3295375e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 00:10:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761030609; x=1761635409;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hx+KW0owCtgL2l75gelOTcl0W9UjxPp1nCTrQDZYmug=;
        b=oRBSgrMGQAPSVMVvgbTwpWuHMP3H3em9df4R3Zvt3k7FFslbxg48NwRSr4rDNEwvV1
         G8JBbu2HmAW4wMUFXJr3HdiOt5ix+Tdyc3FZgq7ooEWt1uP/+NQsEofK+BPImyvBpEjY
         g6+pwAjOpaHADiuIYp17Oqhw80ypQHWDiz/8hWBzWA/2fuURbVcj+mOMH/8aRYiiFkHQ
         Z4eFK2x5+MY2yAQkrE5fGEf5DCiXimbgJJKUrpU4mCblkLfia0ptCZN7J5lLllq1StVN
         iU3CgiQW/E2W/OpBVjF7tUWziKEfTamH26vQ9fJcUd8Cz4338z7S7ByYfON+0JMo1BV9
         yDXg==
X-Gm-Message-State: AOJu0Yyi6t5qoF+9C8eJvB71bwH80vdZ/jR2C4/c/Qv+a0QHmO6eNz2Z
	WD4k6KrmILNTLroU7nvLBvvsps1X8vZiudAc4mZCm2H834tT1mVi6Dx4CbbolE7c
X-Gm-Gg: ASbGncupwYrLMDfKrXNTKq6xDuyhBHOOv5GG20Hhzm5pAdqMw+XAcZfOi9yMOt5hlMr
	wMJGTeq2jJzzprHLWPLhnGaaJuH1aBSnab5qWnA+UfO5x93lyc64AiSUSrG/mJkTii1mHea6oWl
	x1aZKpK2UqM+28bX3d2/pgfQz5w9LU75Ptp2QwMLJlh1/VMQMOYM289z37tSbnSmoNYB+qJVYsr
	Y5Y/DqEQ5OLr3X//+MUed7U313aB8JQdl93DXkQaCIK6Hg3tTfNRk9oC/EC4Kum0cbWXhcXK6D7
	oLsSkA2zZ66Tvz39EdDF7AXxGYpW0012mBDJzl9B2XMtJqr0h/zoJghrhvR3SRzCx/2RrbsQExq
	eBAg5SJeqRn3T6xTSVX8U3ijsl4WSiJ+CPQCfC4rgCPDUlqHhXYIC7yjvOuqVYVMMy1D75HJJUS
	2dyuqCsQWX/6MBdEbi4DYN7vXoOcLSLOnr9gWxlZZDnlDE+bJC
X-Google-Smtp-Source: AGHT+IHKvq1OwKhswbvwd5A8m5q+3TGiIGSC1GPI/MlIhG/QuRy95e9Vl+1g/3O45oRZ8KtQFRT6HA==
X-Received: by 2002:a05:6122:308e:b0:556:40b2:270c with SMTP id 71dfb90a1353d-5564ef152c3mr4936113e0c.12.1761030608641;
        Tue, 21 Oct 2025 00:10:08 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5568319eb26sm910162e0c.25.2025.10.21.00.10.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 00:10:06 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5d28f9b4c8cso4551686137.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 00:10:05 -0700 (PDT)
X-Received: by 2002:a05:6102:548d:b0:5d5:f6ae:390e with SMTP id
 ada2fe7eead31-5d7dd6d62camr5385724137.44.1761030604638; Tue, 21 Oct 2025
 00:10:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251017115123.3438-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdUCSRKAbD=DfJxfFGpfKTRkt=a2BO+HnwTqALBeeECOkA@mail.gmail.com> <aPaSF2lokJ748cTx@shikoro>
In-Reply-To: <aPaSF2lokJ748cTx@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Oct 2025 09:09:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXv_R6POTQe=MEcEOraKhjhzwrW5skkWnzgvijF2qAykw@mail.gmail.com>
X-Gm-Features: AS18NWDdpjVO6Fys_8jqiH_KABjmm-PcYwNOkQaFcM5LilJ7ylXgPRFU02A3n_M
Message-ID: <CAMuHMdXv_R6POTQe=MEcEOraKhjhzwrW5skkWnzgvijF2qAykw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: don't reserve SWDT
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Marek Vasut <marek.vasut@mailbox.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Mon, 20 Oct 2025 at 21:48, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > Or better: drop all these swdt = reserved commits?
>
> Maybe. Since Marek is maybe interested in fixing FW...
>
> > TBH, I always had my doubts about making them reserved in the upstream
> > DTS, and there does not seem to be much gain in doing so...
>
> No strong opinion here. With "reserved" I think I followed your
> suggestion but I personally don't mind.

Well, the proper mechanism would be that firmware using SWDT would
override the status to reserved, preventing the user from using it if
it was enabled in the DTB passed by the user.  But (a) the current
firmware doesn't do that, and (b) we currently do not have a use-case
for enabling SWDT in the DTB.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

