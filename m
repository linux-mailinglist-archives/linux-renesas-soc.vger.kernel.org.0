Return-Path: <linux-renesas-soc+bounces-3269-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BDED0869744
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 15:19:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F045D1C2381D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 14:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7832278B61;
	Tue, 27 Feb 2024 14:19:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEB913B79F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Feb 2024 14:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709043587; cv=none; b=cMXkad5i5TuHlndtbHxpCjNGVhuWfNRo1gJvE0dnPqNH37MV5tj5Lop9qL3z5LeXIYNu8lpkh38RHl69zvBD5ilPpXqCRlUTV3YCSV1zvB9Z+uVzvDsJoHAIv5Prv7voRiYkQNusdIFALc27LbhQ/oHM+Spp4HCrUBUj0HcpbIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709043587; c=relaxed/simple;
	bh=EwB7td9wg3Noo9dayLkT9F2KIb4YzN096SQPYQ22XHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AVTGHKq+E9BAh0C00kgKPx0wuCW7qD++8+aps71ys+Jxda6U+KYI9C1a5MhikkAteNN64KeAmWgmdHXcbn3mnonzSGKP+r2AUP47azQSeacfTszigFLBqUS6dIc3qE4AyJuvrmktxfIXUrrCe8WGhop93ijcA6m46jOY2XMmq7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-608d55ab7b0so29971587b3.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Feb 2024 06:19:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709043584; x=1709648384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y2dXpUyPu8pyb6Y62TJpUBLXk+0hXnlO3uldJ0vwPjQ=;
        b=JyV0DPJyj50VQRUHfOWnyWZx/ZtiORJs5ru414iM2YDuPIlxsJY2SxVXgJkPSB/qxa
         /oAkmNBBvsGgjEe4UuU4f02tVxA2iqj86xnXMXrtEjcQYteoYXfI1AYrneDLYoErU6Te
         KMkkeHYeVHfVfmUlegj1HOGAnRzgiS9WqBLmgZpF16ldsH9qE0izmt7FlQzrhBbiCl0Q
         Rp6IhgrOydyk4iSDQIBBSF0Ro7Hlysh8j61kPEx8hsRUGLlhyTi098Bh166JRXHvYWYV
         GUCI55AZxqJnbJPCbiBGLIkWOxlsk/d7hDbng0QfrtnXVuCSysTjZS4YHzrqKln20aHP
         X8MA==
X-Forwarded-Encrypted: i=1; AJvYcCUbUgTpc3/L9FCCqc+ryHJrVVxCJwqMv3lFkhKNMArfOy2H3durflM+tZ16crVN2EXfE9A16/f6j8iZhfUnTDcy5rgy7zt2SkpeaCDBbeKSsnQ=
X-Gm-Message-State: AOJu0YwgnLijA31O2A8vE/acXk3eVCxwl/VqUkhTVu1S4GgkxMI9oBGw
	0JLTUFiO+XhWzCQLUkSQ83xICPA1v41OdNJQz0wR+KQFkSo404aFgJxLSZX+dD0=
X-Google-Smtp-Source: AGHT+IGZJOnXF/NZmOyygp65xPc2zGE6s9X6DJeV7/cqEr1iUqJSlNP2LRN9RwmesbErv8uqFSvjZg==
X-Received: by 2002:a25:acdd:0:b0:dcb:fa70:c09 with SMTP id x29-20020a25acdd000000b00dcbfa700c09mr2048972ybd.28.1709043583696;
        Tue, 27 Feb 2024 06:19:43 -0800 (PST)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id g13-20020a256b0d000000b00dcd25ce965esm1385730ybc.41.2024.02.27.06.19.43
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 06:19:43 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dcc4de7d901so3508032276.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Feb 2024 06:19:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVy4oCxSe91NVw/t9zcO2ePmUle40RAy/Myo/Y/dpph328hCWOJzPhmFHWPYA6r5B5Uscg9CAdDqi6wedJDdVQR9xZ611E/x58E68ZlY2MgrHk=
X-Received: by 2002:a5b:187:0:b0:dcc:a446:553 with SMTP id r7-20020a5b0187000000b00dcca4460553mr2155240ybl.57.1709043583208;
 Tue, 27 Feb 2024 06:19:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240226201305.429790-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240226201305.429790-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Feb 2024 15:19:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXJsMrJxcKhSsijxkh59btq9W=Ye83+WbNcg+SBKx9=-A@mail.gmail.com>
Message-ID: <CAMuHMdXJsMrJxcKhSsijxkh59btq9W=Ye83+WbNcg+SBKx9=-A@mail.gmail.com>
Subject: Re: [PATCH] arm64: renesas_defconfig: Enable Renesas DA9062 PMIC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

Thanks for your patch!

On Mon, Feb 26, 2024 at 9:13=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Enable the config for the Renesas DA9062 PMIC and built-in RTC, GPIO and
> ONKEY drivers as it is populated on RZ/{G2UL,Five} SMARC EVK development

RZ/Five is (in reality: should be) handled by a different defconfig.

> boards.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will apply to the topic/renesas-defconfig branch, with the above fixed=
.

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

