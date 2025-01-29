Return-Path: <linux-renesas-soc+bounces-12697-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24070A21FE0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 16:01:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48BCC3A5634
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 15:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F86217BB21;
	Wed, 29 Jan 2025 15:01:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C0D4C83;
	Wed, 29 Jan 2025 15:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738162867; cv=none; b=Lrf0u+dM7DE1primmUxw72cBYALQjvK9oHjv4uZwNaRBaDSOQNsxCWvSBDpK21mNNHwbCJqCzio+bF0Ird1JqcI4GmNRed3ykcAJnO3J5xDCtzmuU1pbRER7tILnpeHS5u6YA3+FdKdZi0V73bz6nG1DLuZ0E4iJoVMx0AzEgo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738162867; c=relaxed/simple;
	bh=j/m6kwHo4UDB1IdHMtfJr9fPgK2zfFhcBgVjgWGik/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HKB4zguURHoe0EVk6hnR2QpUjcUq/AdpP4sGXHfVpWxkaY6v2QGvxvE9IQrrT4tTpypgn/WL+L3vojV7w7q3wFpQ0616i+ae4uYSOfKQulOiq7Y2eQiMMx0Yd44BR1e+X/uVU4I0SaQtawRQyfjhVkHVCnkwwVlz7SeENklpxjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7b6f0afda3fso747590485a.2;
        Wed, 29 Jan 2025 07:01:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738162864; x=1738767664;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ex2tWyeW/k0r8iZYdad5hNrd1cbscLNXJd7mnDfH3/k=;
        b=wUZ4ZoZ3J8XONqj2NMJb5KqheG08IG0UIsAxP5yP/ljZg/0GXJHNlDZVIm4QdceH2L
         i7PhibBP3qiKtUWzA65y+ncNzLvsnNEz1xVJsi6S3Lx0Rf36Vox2d22ApOHjCC1fcJzR
         VHR9rdvD7/F+46CDk5hbleyq85ZFKeHVZjXTKn4UneFX/Ef3pr6f2/+txMc09uJwTnyh
         BK0657SqEUIOUKt+DFSfiaZsTV+fXPBV6/+UUDY2yjYrMja+qyC6wOiL0mn/tOxZY6g3
         gdLygCWgFxOxF2VzcbedxsUFmdg2G/FFh9XJC2CJjgeWoMJJV1lgnKqkTG3QYFlBuWwc
         aqeg==
X-Forwarded-Encrypted: i=1; AJvYcCUF5x1z+hFQVOo+ND8wY5Rflju71yMor5bkxJcV0/VfJ6w4hcbY1U9DKi0FXv15Oanp136OocGnIE/7rozvTB6oHqA=@vger.kernel.org, AJvYcCUuSpGgZ+gYYwoJX/es9W34Q5ZQUemT4k6rkVI2gabwCME9i7Qn3fV4Y02F0Fsr/xpLRdEacgmZNjZf@vger.kernel.org, AJvYcCVivZZoRD3JAzJxze5Ot09+AHddnz9uVS1l15vJ60NLjYtJE1t53idKHLSlzbpvEUeJdta+sXS+bx53GZnZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyV5/HhvFBB7PIh2jnI052r9+YRRpfdAdsDVXWX92m+R513JH7a
	rMb/UA30fK8wGA5oODT7OqUUTeYfbs16VkyjJxtHUhb5wOdsCBfSVb25O6Al
X-Gm-Gg: ASbGncvavptaLOLlZYvf+hPtmfFmaX6JrPH/Ym0FZ/tasX271roXi39jLVOHSzYLGwF
	67NCl0kf34gFWiax5VrSfNdW4nRqvbL8sgSsZCwtpV4O5qw13gs/Ib0RO4m4x+QTPdO2vm/xEHo
	PaXbZovhNZ36m82fcmGBgQu6wj2FJGdgIiIPLc1z7O3tF67G20Et1YXXfOdlCP//COmBuW3kHg+
	irGB8S+bUzR684ne8uKBR3mhy2xpkXsx8YBvKVMzHVgNgPmvPYhSRuMNv6V0ScyyQkKZVNsmRoN
	2AXAhZcxYhQEkGF3oKKdwnr8escDfogjB5bYQ1mZfkfBflxXrd3afJYqTg==
X-Google-Smtp-Source: AGHT+IEP004MWOhMnnPh9dous9EaW+UeTCK21GiiGe88wPGS3jUoi3PyZSqlDedvUewziF4opZHIxA==
X-Received: by 2002:a05:620a:bc3:b0:7be:7f66:f1c4 with SMTP id af79cd13be357-7bffccc7965mr514660485a.1.1738162863574;
        Wed, 29 Jan 2025 07:01:03 -0800 (PST)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com. [209.85.160.174])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be9aeedefesm634677085a.78.2025.01.29.07.01.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 07:01:03 -0800 (PST)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-467918c360aso75964091cf.0;
        Wed, 29 Jan 2025 07:01:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU7yDi5E68BbnalX7OY8ALNDrmM6T6CDTosBopw7LWoTgg4UHMCiyXmNYXLc6yWwLX5hvW1MOrKwushIR1uLVRmpQ8=@vger.kernel.org, AJvYcCULUHMHmkW9y8kqz8MePp7lC0lAYVbFdlxxt9huvbp0O2rkbHNZI/6fRYrsJflcg9C0VD5Y2K7EIp01eO/4@vger.kernel.org, AJvYcCWF+KfE92eEYKLx2bEjrBp799ZhBmoUpRi40yeIyAdtEdEID3CXa6uEpSvtkM1Er6QTGZRlzkS65uuY@vger.kernel.org
X-Received: by 2002:a05:6102:3707:b0:4b2:c391:7d16 with SMTP id
 ada2fe7eead31-4b9a4f2c207mr2798022137.7.1738162852423; Wed, 29 Jan 2025
 07:00:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250128031342.52675-1-john.madieu.xa@bp.renesas.com> <20250128031342.52675-4-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250128031342.52675-4-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Jan 2025 16:00:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX4O2UaLaijREMV5VyGzES9JkmWVSLHeN1WkPDTpyAhoA@mail.gmail.com>
X-Gm-Features: AWEUYZkCxL8R4TUNaRcRtuW-1UilpVOOvSbG3ODnBxMEFoDj3gk9gT3orq46m2c
Message-ID: <CAMuHMdX4O2UaLaijREMV5VyGzES9JkmWVSLHeN1WkPDTpyAhoA@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] soc: renesas: rz-sysc: Add support for RZ/G3E family
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, biju.das.jz@bp.renesas.com, 
	claudiu.beznea.uj@bp.renesas.com, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, john.madieu@gmail.com, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	magnus.damm@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Jan 2025 at 04:14, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Add SoC detection support for RZ/G3E SoC. Also add support for detecting
> the number of cores and ETHOS-U55 NPU and also detect PLL mismatch for SW
> settings other than 1.7GHz.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
> Changes in v5:
> - Avoided using common include file for register definition for both RZ/G3E and RZ/V2H
> - Do not use macro for register definitions
> - Do not use a variable per line while printing messages

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

