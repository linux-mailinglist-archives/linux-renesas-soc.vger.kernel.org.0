Return-Path: <linux-renesas-soc+bounces-12652-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89161A20961
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 12:15:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D8B61889DFD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 11:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DB0E1A08AB;
	Tue, 28 Jan 2025 11:14:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB991A00FE;
	Tue, 28 Jan 2025 11:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738062859; cv=none; b=oHQnm704MOOS8lVVpgeVtWzYAXePmtOKQFQSdO2Z6mKR1xd7E1Oi6ZKlUWJnrDVQW8vRgSpRPvAQTrcqb6BU27+ZgoV+uFSJeKnu7GVJzhC5h+8tc3Cj6x8GO6NmILm0we/9UY9MtHbra4a22N5JJN5OrLBhsIb3QeToAI4+Hdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738062859; c=relaxed/simple;
	bh=XOCGnBtzVVe1JyT0Q1oye2KIAaeyTH8XFXmPy0Wn/ug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i3JwEuHshhX0KL+w/0XgKMnOoJTl1gfQkPwj7fmYEfpzn4owK4cgdpR/+9hXh1g0ktja9mnX6wtH8Mi0YDBvJj73zcoycwnnQgVOpQ9DROqRtrYreVjjdWhLEBqzd76DqSiVoQxv+D+pTaTS/CWKYPBgmforpZFMtAgicHFB2wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-85b9f2de38eso1143923241.2;
        Tue, 28 Jan 2025 03:14:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738062854; x=1738667654;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FFDjC8+m0guaapghXOgauQnC3Tek07sseLBM44qJqKo=;
        b=Z4lNRH6PyOLt51U5zTTKCE0RzrKtuuBP4daFMJhgXbjN1KbbBVPvq4DgGT6vJ/9Oeh
         gHPJdQneTfe02Jh9gSSc0ngGtvffLUa0la004ywh0UaAETCirtAac7SSoHyI+xGMROgM
         CyUFRHt+Lpiv2DhnjfxG9XQ7D2UbPkO8vIhxXuSn7HCuXPJ1gt6bFiFz0LrHYV7wgnRQ
         VqOBVJwcJ7jABseO63PNxnjTAXBAwiZYIYmYqGLotRDwKUAUicYCuLfnNjSwF3gkZx3+
         QATQogVbLDBEfxb+XAxzGODm2kZxOgxIgByJibr/FqPgK6kmDxV5vokVGAS9au7RtBSa
         KVvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWb5Z6NRyGtnezxxKWYGAQrzFNV320lqtFykMp8TzHWQdLq7t/WE1AYxkE7+KgYigJT/VgL751xwt3ttCKmTsDt2wg=@vger.kernel.org, AJvYcCXnI5SdUTRzC0SXllG7JiH/el5Tw9+2DQqeeRFehtaAFNqzrljZVtYvdR7VbgUGVA0E4bX+z5rMRkM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxW2zcBbTBYiajOdHtqB5JoTDE8ZTUir0/3kNpdTFMOR6+9TR7W
	1wfTpwbgQ2G+ElTA4lr6/4y0Ej9W277Qki/VmzvfC5bE4x4KHekwiC1FtFUi
X-Gm-Gg: ASbGncvNNpyKSwq/TOYm7nauqUFS8aQMQviq9zPynQOqsiLKA6f5kGu5hLSPDIaQEdU
	dQBb5TGx8xJGdQGY3m0fEnPfFdtmadW9H4lCvkh8TfuVDWzSxpm61PfJjTZdBDygyF+P4Wj0nsp
	yP73YZiw/uEx/GQ4xkcbmwpGQdrnZ3DaiJIHtyXo3deS9tvRTomRAbFPNBKRgT+4LApiTmnrnje
	VVeWvyE9JlYzALE+56Mg47XTFcj/7rcBDdFsr748ydspH8zcp5u+YPdfowbuiDEbYQT3Ws4ZdyC
	ijO3ytynUr5PdpfY+OAb38grHEkagSxkRxZ/9pYUzut9w4CvLgbXFg==
X-Google-Smtp-Source: AGHT+IFFMZ9frOxFs1Kl6aC0dR/IhbBHS/wv7/XurgksV+DAC2Qea8nTpn8naZ3+ED1JhIrULiEX6Q==
X-Received: by 2002:a05:6102:38c9:b0:4b2:cc94:187e with SMTP id ada2fe7eead31-4b690c854eamr38105183137.18.1738062854465;
        Tue, 28 Jan 2025 03:14:14 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b7097803bcsm2102490137.6.2025.01.28.03.14.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 03:14:14 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4afd68271b6so1597663137.0;
        Tue, 28 Jan 2025 03:14:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUh/F6pVVZABsfdD09Q7z4uYvIZxOwuqRxoJSgf+9w+iErACdvwj7yKxm4xyu0UkhgH5sGJXmSNnoI=@vger.kernel.org, AJvYcCWydftjLPsn/XOi6qTHTbcdE8lcWVrgXLA+A7HOwGkit+6R7fEbGgKqHpHCvqp/d33XDlPjot+5lqNcRym4yrGda5s=@vger.kernel.org
X-Received: by 2002:a05:6102:418d:b0:4b2:adfb:4f91 with SMTP id
 ada2fe7eead31-4b690ccb97bmr38153880137.21.1738062853779; Tue, 28 Jan 2025
 03:14:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250126134616.37334-1-biju.das.jz@bp.renesas.com> <20250126134616.37334-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250126134616.37334-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Jan 2025 12:14:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWC2GeODvmwdUyBkqaEYSK5gpvLVk++0EgTpz5D2tKbYw@mail.gmail.com>
X-Gm-Features: AWEUYZk3qh_gD-BEMHf2WM5DPfZsTQthfTyK0Rc7SlOhnjQs4fqC31Pmt8f_ruA
Message-ID: <CAMuHMdWC2GeODvmwdUyBkqaEYSK5gpvLVk++0EgTpz5D2tKbYw@mail.gmail.com>
Subject: Re: [PATCH 3/7] mmc: renesas_sdhi: Arrange local variables in reverse
 xmas tree order
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 26 Jan 2025 at 14:46, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Arrange local variables in reverse xmas tree for probe().
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

