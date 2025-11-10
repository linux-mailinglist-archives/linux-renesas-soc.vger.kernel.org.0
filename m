Return-Path: <linux-renesas-soc+bounces-24404-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BB0C46D74
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 14:19:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 116A7349619
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 13:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2864730F550;
	Mon, 10 Nov 2025 13:19:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B468130F7E8
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 13:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762780765; cv=none; b=aGa4X9BEdwFbS2UdPZiDGf0+ubZ31KAzVvBZ7EZz9/W3d7T/+y9AI7+XfRCtK8/apXhrdTJRCOoGdJRWpzIOQhIz+ESXGyv7WC/PHyhOj6ysNVUozFS19+OGj2WPGNu/2EdpfHWUaCHFZUa9GHg/vH7OXjzrcEtNEvJMWI/qPuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762780765; c=relaxed/simple;
	bh=wA9BCmDruypxe3smorD0vULZ7Tgi2Cly7mnUgeAvySY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oIX9+dXLgaknpl5ttcg38nRsZ2MqGTst9dDcI6Spn4D7ox1FYqLS/1c2ZBCSUhQGW22kzdEK9U2cc1AtGkLSE18NfxznDvdUQLGI4IWC6DDKXi6szS3OICHkM+JAbKoHIssmKQ03o6gmSg81mI+PcxW9M2gA0Gni8DuUPy1CfPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9371f6f2813so738582241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 05:19:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762780762; x=1763385562;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7x+CI2dPjKNXpWEkjlBqw4SucojwVb7aPiVE+kUAJGs=;
        b=Z8485/m1mgDFytHXdTzcPu00mgTCTMBt7kBt60BRkmfFmpE6BKSt7pF0qq5OE/PTom
         WbIWQyUYpwFpcdGKd84wcPNU3R5na3RHPckpQzsy71BKvYJpetyem3BUsSwBzmbgO/UZ
         2BJmN5ONQ/YZYSbc/TYymG6Gbdjgk7yzf7dgcarbGiDKDbde/wER0yFkbdciomTzs/FV
         sI+2Nai8Dc5Ogdo7BmAtMRJ5NhW3eitSN7lOgv/YyBnxqXqgkWo1OsYn3qKg8haU+qyX
         smy6iWmCfB1UcXHoHjYzXOiGjavlLhf+cgR70mKiAaUQYHfIqJxwLsc7H4IuMyP95pJW
         MCng==
X-Forwarded-Encrypted: i=1; AJvYcCUv7vEar494GZ6JOslUtfWEHiD5pk9Vyd+eNjhHtbasGfZCj5OjHY0xN3lgwTqhFCAnYtH58KJBfS1wWD/rCYa3TA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPwu7urUIX71uawCQ4wZ7fHjuzYeR4dM5/FIiYarWVuD/DgSp3
	Q1feljg/Q90LgU1HbY9cbmzvv4QZthba8zbgoeDg6F4EOOofvCjlHrbePlY+/v/N
X-Gm-Gg: ASbGncs3NCcHybcK1l0n5/sFceGWTsen7EnNQNRIVsIhnPAz1YFF1xFdUwNcMTksfNL
	fLhYn5hKhQoC2hCLhduuTmyz9JOKvWfxcmJNqvZ3qsKHsy2i7NRosBRALJ3inVtBONoCCOULyzk
	ZGBM+IAnnJh5Tm9PF/ZScGT/zcnA4aNU6xDfetobj7WwSapoNqM/6IMFMqLMiULI1Zxckwgl9Vg
	/KINGxrp2KbowdAZgLMVolKYA6TIp/45w+a8Wq5iv0v/ufp3aDVyEqFkwbSnJ+qVVwg+09G+F05
	0mMe5CeGQLgxpDP89uTaeRW7DPRmYZeJkt7sKtWIkRDViFhsQbKPHtRXlvAyJYkTP+ogWpd6yVT
	nfo0DEUL1UGIS7yTk0Bb4Xj9jPoUozYbAJ3sE2WotbqUIfs3fhw/yA6b/9nTMQljbCesQZlM6gS
	IU2CxDDVyEQiNT7iFjZJOOKoDShzIq7orpji4hFZSdlw==
X-Google-Smtp-Source: AGHT+IEPaRot47/1K40FPa2YW0VTVMNgOxBs8Dyx4Z6rMtcFekHeZvkt/lt1tAAUaCzmDGApfrKxEg==
X-Received: by 2002:a05:6102:cd4:b0:5db:b7d9:4db with SMTP id ada2fe7eead31-5ddc46eb7c6mr2178183137.14.1762780762274;
        Mon, 10 Nov 2025 05:19:22 -0800 (PST)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5dda1d06bd1sm5736646137.3.2025.11.10.05.19.20
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 05:19:20 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-557a56aa93fso546876e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 05:19:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVwDe4zRhyFDGgJthd5MQ+8P1EQuQxlWuiZAJGTginB5JEfN7GvVi85M8w8+vfivQ6dmXtQDu+yQtF2CgWNz2iixA==@vger.kernel.org
X-Received: by 2002:a05:6102:549e:b0:5d5:f544:a88e with SMTP id
 ada2fe7eead31-5ddc4814e83mr2563556137.35.1762780760163; Mon, 10 Nov 2025
 05:19:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028165127.991351-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251028165127.991351-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251028165127.991351-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Nov 2025 14:19:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUoGQVhdy-h6B_6_z3-h03GnNz4AhpS5i0WJf_oAPNktA@mail.gmail.com>
X-Gm-Features: AWmQ_bmIROBItvdVM9xE3_P83zJy9BKTyQeGOqvTNjEHYV_SlB5kh2Ov6vUy8Lg
Message-ID: <CAMuHMdUoGQVhdy-h6B_6_z3-h03GnNz4AhpS5i0WJf_oAPNktA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] clk: renesas: r9a09g077: Use devm_ helpers for
 divider clock registration
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Oct 2025 at 17:52, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Convert the divider clock registration in the R9A09G077 CPG driver to use
> device-managed (devm_) helper functions.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

