Return-Path: <linux-renesas-soc+bounces-25329-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 393D9C9271C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 16:22:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D845E34431B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 15:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 034D123E356;
	Fri, 28 Nov 2025 15:22:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D181C701F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Nov 2025 15:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764343360; cv=none; b=VoDkq1VCDZDgWHHTiXvOKaWqwrrA6WmD2PIxQ+g5FCu63ml+bhUShIrPsP6Ta9jBnGwKBZvLr/2OU1kRyvhhwyspxQaxL3cus6J2YqHhUoCkQ0ZIoxzhGMPkNj6CUIUpIQfTN98GpoJc6EDkrcgfdAE+4FhHxXraaobRhKuq1YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764343360; c=relaxed/simple;
	bh=WySJ5tDr4GaYr5lUCdun1Iq88/ZJieVg0Ls3zRbLsgk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=boKb49fwl7qzORdjfCD2uVfyCgx6TFobGJVGrVoHVaPhkOfixO/mjpEYIg8Xegm+tETn9QUNftD/3zDiUfP4rvCDRyHmBRT+fQgp3dyG96qI0xQVDgoqHm/uIVw//Dgf9LSp1gAdKi+sOEvKS55B/94mz5oIDyjZk5ynF70Rnlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-93a9f700a8cso424650241.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Nov 2025 07:22:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764343358; x=1764948158;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vSU3eijvpTpAPGY7FhsdCeUuSldlsRzVmB+sdM/jI28=;
        b=W7jVl9+VYI6Z57Egt/EfKXjyDNrcX6XZlzzwSaNROzlASUvjiDVGAF5/9O+PjF2/E7
         BReIrcmMSYvYrO7wiu1hia6RkBSp75yihxQ6ZQd5AH4ho8hmrG3I+Sb6K5E1t/bdeB23
         C0rAtaptrLlU20o1ujGk6iEFZ5IJBd1Q8O3SsRJ1h/x+9ofs9ZaUgylb2f9aY++fadCc
         HZVjvsA31wJuObRdnMGGRreRzfFKRw4/05Uq7RJ69bV5W8Lzlx1Q70Y+igzVhqTO87Ng
         gWpLRlVKlpMt2Tg9/9/hTsiBmXUQkIejtejPpjcV3uQYQ0wxa8Yu8+1lwKYWVOJ9D1eF
         j0Uw==
X-Forwarded-Encrypted: i=1; AJvYcCV7w/6m3do8RTvdqx9nw9gORfFP/0y+CfieH/xX/NUKna6qVzM5kaPGIwJbL29sdwILdtXcur0/xwN0JbljJV8DMA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxj4TblMnrbQ/C+llpGNoMXtZr0fSdKmu1oIbCzstgduWfYbBq
	Y4VfavJbBcqCKAjhkzone45UXHDeA9f6zHylxv9QifGcPD2JyhQZ/lWC7ss5SQ9l
X-Gm-Gg: ASbGncs1GagWvuVvl3I/xR5LLaZJePlq+c4/uhRYcZKQ1cgShzSJA7rvVwE6D76OVAX
	Gks1HBhzv0AYuPNsR7zaUnzhUAfTFFR8rMF/vAAb2oAgKPcIo33DYWBNbuCcg1nMTaMAz+n9G+1
	q7X6SaT02vaLQ0Zn7oowBrj8N5WVAUwyNX/zWCN9zoKSjvFUgd8qnuAeExjEne21q3yd6cuFyuy
	33K3zqTS47NZRQqliUbVufvrJWqngXtY1fS+nXEZ08z926LYuybqfCv3nyixFpZReDDzjcwCyas
	ylAW4DDfeDKFcfzjNJ+fy1S/0B2FHMXrwQ/tI1jGkUKO0iNSVBcc0SFGGFfp+EycYJqupJeBWu6
	f1kHnvmUo7oi7aPdsbSiih4Yn8fpY7CL+38o9pDw7shEcBch6wX9R5v4tmxgVci77/BuXAazvP5
	sOKPdUtcblapP7pzNZPKvag9swYQNMVpVLshvMkk5qJXgD9y7x
X-Google-Smtp-Source: AGHT+IE2Ht9d52WjoIkif2MrYuQAitPPWVQ/h0sF5gTEndGRc1Leh/NoIzFvNLEY4UN5tCIpHRIn2A==
X-Received: by 2002:a05:6102:580d:b0:5dd:8a21:3916 with SMTP id ada2fe7eead31-5e224272290mr5229744137.12.1764343357373;
        Fri, 28 Nov 2025 07:22:37 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e24d935fffsm1793914137.6.2025.11.28.07.22.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 07:22:34 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5dde4444e0cso649060137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Nov 2025 07:22:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW5pPy37MTdQ9QVsDnP27RB7Cs1+UPlikNY5diLpIjP0APlTNnSrKaxnLYp5MQNh86W15eIW7X8MDah6iYoV9SpLQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3e96:b0:5df:b3ed:2c8b with SMTP id
 ada2fe7eead31-5e22442a01cmr5399952137.38.1764343353749; Fri, 28 Nov 2025
 07:22:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119161434.595677-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251119161434.595677-13-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251119161434.595677-13-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Nov 2025 16:22:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVt54J8n52QhLGC+k2FcVV=Eg57YCSgwb2imzTFkVkYQA@mail.gmail.com>
X-Gm-Features: AWmQ_bmvHPlzOAiPwp3vhsRbnO5GK1W4yQEIPYWe8DSxgLcQBpsrkHr2BizGasY
Message-ID: <CAMuHMdVt54J8n52QhLGC+k2FcVV=Eg57YCSgwb2imzTFkVkYQA@mail.gmail.com>
Subject: Re: [PATCH v4 12/13] arm64: dts: renesas: r9a09g077: Add SPIs support
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Nov 2025 at 17:16, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> Add support for the four SPI peripherals on the Renesas RZ/T2H Soc.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

