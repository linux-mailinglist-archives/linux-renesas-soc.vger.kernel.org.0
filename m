Return-Path: <linux-renesas-soc+bounces-18982-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2E3AEFA10
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 15:18:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4854C1750E1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 13:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3CAB274FE3;
	Tue,  1 Jul 2025 13:18:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE42274B2D;
	Tue,  1 Jul 2025 13:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751375889; cv=none; b=bBsfsTlJQdix2Fc4Y1IG+dxUbKMGgbTSRSJ3JeZFFblcic8hvLCpiDbzg431iejyX7zAVcUp7oDLFtcZmYAjBljfeR66b+hpptdJRvvUWWdUm0js2jjYXXHcNI8TnlJ2OqEZU8Frf4DuLazVwXusunutkWs/W411b5U0ZjX1S7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751375889; c=relaxed/simple;
	bh=ZKJmDxhwcCDftDqFYOYOD4sObA2fTSRqSgyPSrqa2mY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T57vqUJle8mzvLzcTrlUx4B3IcP+9LjWzRvI5dxh0bPdEaWjj5O0DQ9GPz30zyNOR0LcrYMWsleItN4C54B9HQmXP0X685xIjClden9gwcKK7QkGnCWI8L2kTFnetXfZGsq9vPbLlx1sR+FUPfTHX7SLoYMtfGbyxBch24oVV/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6facf4d8ea8so32457886d6.0;
        Tue, 01 Jul 2025 06:18:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751375886; x=1751980686;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=th9/0jwZYMrw057NN5f2uI8dWtTi2No3OuROf/qziKc=;
        b=BmnsRhaE6UWlAy1Sxt0mtxi5EsdOB5hsTkE04syC55TZ3kmW99bQ31a6/J0HA4M161
         gIcyX0qdI6dsyjsf8Hm0jW0pDXRDN6cz2qZU/akVT1PybzRyLZI0hR+at0m+draQXKkg
         EsPvjMyiEzOPlUKSR40ZfGwr4qXYGhUaKE5/HLR4igDIkKeQtI494vOxST0RgsZ4mm4r
         r5hdRS4Qu0RwYG3nGIPlNuNcECaVPDti8S1tyOysHtD+YpZoyXxyVDErhSFwfYB3pzFW
         1ZZhuI9UNw11wedxMQlQBlrt80VLQeXjoRVYBicSG/D1mERuBaFs0FCv3X4bkgy4rFFv
         yNVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkBpTwTJQ9OGcnin/rD42J0Pk7z/+rqsH4QzdNf0KwzHTRm1oN86kkbDfu9M6yPGxM0QsTuyWIPwE=@vger.kernel.org, AJvYcCVjefYivd63rIq3zkYgkH4wvSWvaX3qsVEeEgSc52cAjNdTpYj7ToYwkPKJuolo4BXr6NE9UP0EZA2dN6H/EjxMbdg=@vger.kernel.org, AJvYcCWKR1y4ZvlFxrsXPSVfJvjZXrTdZaDVrnWH4Ibdw3ZBILbD/QC/crUWmTM8WxDJqR5MpwqGnR8Ws/Wht4Y+@vger.kernel.org
X-Gm-Message-State: AOJu0YwXNW7fULnA1FL4CAnrPpItRiXTXDWLwPuOoKQng+QmRBQXhahr
	ndaG7zqZLULzFIHJg40ATnSN67ehyyywilZ/RZOS555cf9hSsKiQVXoV2bQqAesy
X-Gm-Gg: ASbGncu75YxXO9a5DSlbgmjw7BRjk4KDveRi0DaOGDsoFgfxW5yPHG+1T3xBoexPqMt
	liKKXjLKFqbP3imSMG+ChjC3rb+9CmzkDr5LfXnw+tzibSJylu3KTdiclw9XkRiFdxy2r0VCpXM
	DTSB/0WUSgb18GSzZtMNx6LiNUsRko2t4HQKRit/3IaozXTOdBuJTtngJ6NsTJX9ho2hPgRaEHW
	8x02sJyrwF03LWXpZ6M07/hSXvd7ue+sZXnyqornpfp0HHMXKoFfJmbsf0KgCLnhRFWZPaNXnIC
	a6fgsBuJDN8weL3Lv1JGBaF+wumwA17bhgBNPUpVZXC2dYIuVspgsgJnpMyIPLnc+/pfh7NMlaH
	WphkA+J03TMofSIDwGeh99hEAkmFw
X-Google-Smtp-Source: AGHT+IFwN1zowSLe6/NBTO/VResHsgfpxzF7LEiO1ftrH1FyboINETbW/zIhTu0OyFcaqDddkulyaw==
X-Received: by 2002:a05:6214:1c47:b0:6e8:fe16:4d44 with SMTP id 6a1803df08f44-700134a81d5mr327323726d6.31.1751375885791;
        Tue, 01 Jul 2025 06:18:05 -0700 (PDT)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com. [209.85.222.174])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd772e3f38sm83965296d6.61.2025.07.01.06.18.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 06:18:05 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7d20f799fe9so620906985a.2;
        Tue, 01 Jul 2025 06:18:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGNPtTWRcdwNb/PyTy1lsIxLbW2zbLdCCloyOE4IUoAH2XIKptYiHFnDkuiF2z/vkmF1wXCZI9Dl/A5lL9@vger.kernel.org, AJvYcCV7WkdUpQTM85Pn6DdPFHM8L86UkkxI5BgLasyduMFFzmirONkL0cM9wDMj2a6424AhXeWzXWCjOEd1XqP9evU0Za0=@vger.kernel.org, AJvYcCWTRZIZpqOgQTJr/AvyFhilXU0FqyoPVmVqRLtoDNX6mymAafQsgIaIl8VZEab/Py4lDKefU86qg2A=@vger.kernel.org
X-Received: by 2002:a05:620a:1981:b0:7ce:c600:b5e1 with SMTP id
 af79cd13be357-7d44390835bmr2182726785a.11.1751375885315; Tue, 01 Jul 2025
 06:18:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624192304.338979-1-fabrizio.castro.jz@renesas.com> <20250624192304.338979-2-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20250624192304.338979-2-fabrizio.castro.jz@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Jul 2025 15:17:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXBF7vk-fD_i08zK=dOpLYtjksfrJSb=O5f6L8n7AW3ig@mail.gmail.com>
X-Gm-Features: Ac12FXxXZbwd-rbzXSNPcKUzpn-mJWIeXqG7Bi1dq_cTjKDX6ZGMp3WIieEnOXY
Message-ID: <CAMuHMdXBF7vk-fD_i08zK=dOpLYtjksfrJSb=O5f6L8n7AW3ig@mail.gmail.com>
Subject: Re: [PATCH 1/6] clk: renesas: r9a09g057: Add entries for the RSPIs
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Jun 2025 at 21:23, Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> Add clock and reset entries for the Renesas RZ/V2H(P) RSPI IPs.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

