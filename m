Return-Path: <linux-renesas-soc+bounces-23875-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B8BC1B856
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 16:03:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A99F1885137
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 14:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7B7B33EAEF;
	Wed, 29 Oct 2025 14:53:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DFA302CA2
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 14:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761749620; cv=none; b=BZ/4UT7iI83VEdbrcDq0JZnKyN1yroRZ26pq7sr/y3DvHNjXWiGdyy5qvj6Ah9SwPAFlSt7VeOtVRw0teHRTn+WUOX6gJ6x0SqgBT77jb9954iJheiwSCEYhvgB/5wG2aJOkwRgv5mWqC9hsqcHH3OWNZtWJRbxykUMn0PoqkKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761749620; c=relaxed/simple;
	bh=lRTzqMm3C1CC3agOInFaKAmL647Ck5UdtxGzBQeuq/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mMNWLkT0XGgXLaSbM9zvq43vrT3WJbzzQ91Mz6zeUunh7bsHpntI+Lh9aFSWrHNqoV5eyxs+H7keB57BdGMNnzXDDeSdzIu5yK/TsYbkJHZYr3SZOjgBesWeyNKFTBlOHfFOwVetLfL3kKfk1nZ4mGYhc6dfaB4fFiJ8j6yR34Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-557c05daed1so349545e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 07:53:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761749618; x=1762354418;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PQw8srW8sZp+NW7sFJ0wHastT8WjOnxgYbS0cHBnNRA=;
        b=p5oBzBqkk7xCDX0YmRKq8ypEkzpaLeBamerfYY31OMoF9+tyYaq01vycWfCJeIg5FY
         0GF6TcZrZRHkBAlFJtesUKSp7B1/u1mw08JkKunp6i5IiDMwj8zVfUvenm9dhADiBYwL
         cS0BNZ0ccszEbz4tt+d/2ryYOXkWZamRygXEX/84esELunxcUsX3x7Aeab8Ptiq2OjYh
         L9OLu+H04fj47MsVVHp3VDLb/EecRkkRT4iNMtKpliU6CXQEVs+V7ZFv4+rqdSCJ5iwa
         uyELUZM6zb1tISQe1yMSaxMzLuHc7cOT7X0TQafpdREoUI+hZbubwWGawXd92SOKKgJy
         Vi/A==
X-Forwarded-Encrypted: i=1; AJvYcCUQ8XDFhwOPcw3W9G6NPE5pnnEWXf3k2v+HlXr/P0VNhRwQg1JvS0/geW4RDPbzlx9ldImr8Sk4kYeZQfAaU0mIrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGMHfP7zwF6MXoAzJgAmQsf1Jlko63zy/4HL6xwezxae2Vzxkq
	RRn0KBv7miC8Axnzymiag7Sefdbl+v2bJRaL9QSUODX4/1SKMtgvhj51njrcbYLY
X-Gm-Gg: ASbGncvdePTi2sdf6YM6Eq3spD4bz2sNMYGtnHhEtJjEGKn/FKNjRQZoN+E3kHr0Ock
	Pzpm6kEoIJVnfB1r/XdcNTH3yLo0DLx9h0X4L2UllkF5TilQ0zszjSCQ1rcuv5JbsZXFdNsR0jK
	DYq0zcB7zTbtuVHp4iN/D9Q9mtbzhq5GPHf4+UEFtMSp/+GPk6ninRyCPEfKHrKhdMzWH89l4Ar
	RLU96nPQEi8TqZm7boBCQlQ1dHNiuqBHU9gdv2Gj3LV3wK2wrTFO9r3Q/VSHJJ5qzVX7+V7pApj
	EP6vwZ9zgOFY4tWVI2wP1DGHs+gIBRWklWA+6V7frQD+MTfPzdGQy+6+EcX51PtjHWlGkTq8Gug
	dX5114BmdJRHwgfVQcWpQvZZujPQgmh1n3P2YD8v+I9+p4NEusuHeqxWYT+uxwKpw7F7VDPo8Fc
	b0ofiXHSFCvEBavmbFYIgibvUDbeK6j/e21x0vsDqQGaEeb1o8kKZK
X-Google-Smtp-Source: AGHT+IHcqUV8DXyZUfYNDY9tpammx7I/sPRX8u97O4VHnMnRKJa8Avo41dbhQVJJD+EwgPzTM2MA/Q==
X-Received: by 2002:a05:6122:201a:b0:54a:71f6:900f with SMTP id 71dfb90a1353d-55813fa762bmr927010e0c.0.1761749617747;
        Wed, 29 Oct 2025 07:53:37 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-557ddb5b68bsm5450369e0c.15.2025.10.29.07.53.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 07:53:36 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5d758dba570so5528272137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 07:53:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV5exyaX4RhahY11JlSX47OkiF/2ehkWooKw7n4Nku9hA3H/LN3lNAO4yTDTS5RbGYc3jj6FuXx0Xf3XtlC/tsn2Q==@vger.kernel.org
X-Received: by 2002:a05:6102:1491:b0:5d6:6ce:9675 with SMTP id
 ada2fe7eead31-5db906e35a5mr890070137.40.1761749616368; Wed, 29 Oct 2025
 07:53:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027211249.95826-1-marek.vasut+renesas@mailbox.org> <20251027211249.95826-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251027211249.95826-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Oct 2025 15:53:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWpkbFGFuYA5qxohU_P5trfdrR8=OE4bOFZusuax_4M5w@mail.gmail.com>
X-Gm-Features: AWmQ_bnTzLRSdC_rJSCH1WOHi3pChMPMBglo5qebVwVc_9tsiGfE_PRGste6mmI
Message-ID: <CAMuHMdWpkbFGFuYA5qxohU_P5trfdrR8=OE4bOFZusuax_4M5w@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: renesas: r8a77961-salvator-xs: Enable GPU support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Oct 2025 at 22:13, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Enable GPU on Salvator-X 2nd version with R-Car M3-W+.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

