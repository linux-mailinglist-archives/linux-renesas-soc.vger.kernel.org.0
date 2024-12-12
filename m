Return-Path: <linux-renesas-soc+bounces-11268-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9589EECD0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 16:38:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5543188DBAE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 15:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 941F8217F28;
	Thu, 12 Dec 2024 15:36:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2BA216E12;
	Thu, 12 Dec 2024 15:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734017767; cv=none; b=LrkjkAI013rmTUXTqQQAS7cXPylJ6ALzCTm34VZBRDYMI6Q1zm9tT5Tw1m83GUrjW0I7EHFezuvLzB44F3HOoWcENCEamvjmYJ7NABu/GEtu9jAI1KkywWmzWNrrBtntjyqPRrSH+xLoj8vgVGRxaeVf/kXoOSja59zu6aaULnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734017767; c=relaxed/simple;
	bh=80HEFM1qtcB3yKzoQi+rYnVViPk6Kfc16b1MogXODsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JuB8Nm2qZ4kd6sxhr4/dcKhp4RC4UZrIb6Vj9kNEdeFTPdgQ7LrB7nD0R31iIW8WMCQUCNNBIj+8cGiwVYU9S1ravfLtc//9PouXKASOR9Qhwic8EgbA5pm5f0I6M8DqoX7AUEGQuqrWTb9yDnMZgD05iwmg0GiJOIyK6l76ldU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4675d91ea1fso6470501cf.0;
        Thu, 12 Dec 2024 07:36:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734017764; x=1734622564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qG7CS8T2mEwSFffuxVb+lgKTFa1dWRCDhkXo29OCljE=;
        b=U7gLPdOsTpAHdul+MPo/qBuUHrhJLc7LUyj5eE9weNtPdKZP13ud1ElnHdnUGvYSCL
         J/7umqPyfLpBwnz5HZzkPp09rrtARM5fSp80+vEt4UxmIX0W9Ie1Q0VvsGxPKaxemVJe
         5t99AqoSB4SJ/LXm6brbOeoRppu2Rj7O/+XIAc7NoA8R6fraNENfflmjmih2qrmECRzz
         ZGtjnyJ9t8PlN75F1JXckp2AKe1Jm96RC2z8LLRdix5lTFIr+/R1wAERJI8BebEzOzgI
         C760fwHTxt964Ij34tN/BXIxgd6dcv/Uijf6guOx1r79lOfHP9K4zDW8MRmMjZ2YjbmC
         MnGw==
X-Forwarded-Encrypted: i=1; AJvYcCWFKuKMfFLbB66h/KIqNz279uTgHBrgU4LXbtmkDre950Tn7LRUiJMvYWPgGudWnpoQ9Ymcvq4OJ1q+@vger.kernel.org, AJvYcCXpEsEXCNX7MnqmRcsVsP9cYa+KrdnSOT2YtlnEcYBTTq4ZeVswPRGqTRT6LXYFiBgAD3H7cSlg51uMg/AU6odkKUY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/aZdHGFOzFaYatbqLCv1xxJL3YEYSwhK61lvXa7JzAvfiA6v9
	JuOAb0ZvKbifile30MUM1NPuGB21aBkqfqkkX/xveHm+MN5KAuxFv8eDIhXIFHs=
X-Gm-Gg: ASbGncvAZY77rIqa4oFkXj5wtPcc8kNocRmnT0kHwu4isVKwFfz/Rp/dgYKnwSx2xnL
	90tBhbvurcQVp7Y3Jm8R010qJYTOneZ9N13NwxG/0xMGePDt/8di5qdI/Ghi6TGca2ZocreznHC
	xNotZfMXQZNOLhfD7xFi82SDzmKL8GKnquk9HZeGfdPiRXk6Tv2/47SCm/tXEP7flwVjIapTDmU
	7OrlNrQTaaVDNtJuTQtHkta/02M+kNkwpawJr/llwZmK0BsZw1KVcYmnhp/v6UMF490gqDueq9B
	QNEetU+a9DVQHhvxdlY=
X-Google-Smtp-Source: AGHT+IF/XH4yxly2FAQFFGZzMM5epLSKASh8Wv3Z5IWFfqUh4tDgQLaqse4JgZMegX2hWCv1OJixgg==
X-Received: by 2002:a05:622a:1a91:b0:466:a51b:6281 with SMTP id d75a77b69052e-467a15547b3mr12747061cf.26.1734017763954;
        Thu, 12 Dec 2024 07:36:03 -0800 (PST)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com. [209.85.219.41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46780a93029sm27874381cf.84.2024.12.12.07.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 07:36:03 -0800 (PST)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6d8f65ef5abso5585046d6.3;
        Thu, 12 Dec 2024 07:36:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUqC6PahE0V2/oF/bsTp0zob6qJG8HfZA6+ywTeD8NQOftgitnbq5qKZfqvLEvh5RtmdP4XwlB5MtKb@vger.kernel.org, AJvYcCWIZQmNfXMRX28cwpcCEvDAxgibEiFZAwCf+SzSresf6Lw8zLMCikYp0Hkmv+igU7CJNSaXnZrdWSW2r9qBE4rNcTo=@vger.kernel.org
X-Received: by 2002:a05:6214:d83:b0:6d8:8a01:64d0 with SMTP id
 6a1803df08f44-6db0f82a0c2mr9042316d6.41.1734017763396; Thu, 12 Dec 2024
 07:36:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203105005.103927-1-biju.das.jz@bp.renesas.com> <20241203105005.103927-11-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241203105005.103927-11-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Dec 2024 16:35:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVwMyt2zMBi=oiqs_HvDho8j5OXsDjJ-XtF-ckBkpg-uQ@mail.gmail.com>
Message-ID: <CAMuHMdVwMyt2zMBi=oiqs_HvDho8j5OXsDjJ-XtF-ckBkpg-uQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/13] arm64: dts: renesas: r9a09g047: Add OPP table
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 11:50=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Add OPP table for RZ/G3E SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.14.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

