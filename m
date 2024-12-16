Return-Path: <linux-renesas-soc+bounces-11364-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1129F2D57
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 10:50:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB295164377
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 09:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B381F201005;
	Mon, 16 Dec 2024 09:50:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509001804E;
	Mon, 16 Dec 2024 09:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734342643; cv=none; b=uHALOf+dB5ZuI4HBWNzpYjjKZM3hffYBxC65YhsVLKqIK0aMJg70mbWeexTzL56/iPjKfLVfwlV2DTppskuJWOSq9qMnlhquV08m5IhZj03SUoevwAezTpJx9iDRmnkYAT40rTGJXfZoEHWZ4LJ19yeNlv11M8iTWSOPakcwp9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734342643; c=relaxed/simple;
	bh=dtAoDEbX46mZegb7X6Da4LHRZfjcermuAfvrjrI63CM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gzPr3kQz4P0Pbv7VHwGEt7j9QEdSzU68UFuVI0kRNJNTuc10xd0sUSDGrpfRdKpf+kuBfJ2PN8a9xHwrVXsExVTtFqQrcnsAkjsojj3ubw5LYsy1lYcvcZsXf7pQlo7fLrQ+NptCcsy0WE0cNQ8bCiQIfq0NxvzSV53kpzCTPn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-51619b06a1cso2083582e0c.3;
        Mon, 16 Dec 2024 01:50:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734342639; x=1734947439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nEQxriZsKIJoW//6ZrtlM9VA8MpLHKD2JU7uy8gFOdM=;
        b=DzZsaGuG2Ika+FYqNvQQdFvYUqizyp/9otpVxzk/ZQBd1VpVPY76wj7Z4T32fK9xM8
         slwRyGNnZivf2Dp43ezT9wz8EvXbvF+82bxO7zO95dMgM7NBLs39ZgunyvHb1cJD5Ux2
         +JMIMBNzI5ooCS5EkWpWT7SU5Zx3qzzJ5Vg7HLWoxzscdJ0raNAlcXY2zTeniKm7Wwhd
         hTU4NvIbbYxTWZX2uJaGIl5UbepRky1d+POfOGsezwabb+xfEYqnRTAkBibEVKXSsmhK
         PWbypb2SfirSWz8cQzmEZGPiR+UnJung/5b8Mh8lnOo+6QXhfBSljZ2BsxoeT+KwFWyb
         ifVA==
X-Forwarded-Encrypted: i=1; AJvYcCUiStQDapC/QgWDbJm1ZhFE8ee5fK8UV6Wsl/utmrobLY8o5JIc7aGj0h64sE69KwIicy+TIP4+LOsTAA==@vger.kernel.org, AJvYcCV96Vmp8sED39wv+TgC9F5bAfS1Iy44vzNW/Y77ONgqhyBB/JzWQHR3BfQbqddjblPfzwh5EcFE3rh+iDQC@vger.kernel.org
X-Gm-Message-State: AOJu0YxsBSBk32NosTMZcAx84ExjV2c57OulTJe4+5I0z7q8nUZOY4JZ
	Ccvb0CcPib0ZomkuI5OoiY8aokLUoTBOZEd8xwrY3b96mxd2z690ey5Fub+P
X-Gm-Gg: ASbGncugyEXqaPD6DnjHVAoBTGgjFc/4zAwMp4SKrVmoHhBhSgpMislgVeSjKUUT3H1
	A5WBsolD7wJTySTmHNNJ8hlvzSQJOzLm0f4oXeZeQYq/CXpWxtXY5aQePlVTCoO0eV5nLyNiRN2
	WOtRt/OeV6ywNe0WR8RyqjXXGviLGu9V2lBXPm+ELk/ir9DNisfQF3hQ8SwRnSFivJVITuLzpHN
	TaXLrksNYodMzH8555XD1275WlTF0lfoABzk3s2AQye2YYkUlueQ2Y7mKrEaqlrMQtgsNA5Lfne
	8qyGLCcWZAIGOMEFAc1srCU=
X-Google-Smtp-Source: AGHT+IG0LP+HNGEatty8YkJZ+h+ttV2GofdRa4rDVB0sipwEqaFLFA3U3tJSgVj5eiY2Tj3Ce77p1g==
X-Received: by 2002:a05:6122:1d43:b0:516:1ab2:9955 with SMTP id 71dfb90a1353d-518ca3b6a2fmr11218971e0c.6.1734342639607;
        Mon, 16 Dec 2024 01:50:39 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-519eb6fcd1asm546090e0c.33.2024.12.16.01.50.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 01:50:39 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-51623968932so2117457e0c.1;
        Mon, 16 Dec 2024 01:50:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXkxmw6E8QhlrGV7g1SYN6qY+vPKWiDQ9mjPcRaCNQaM1MzIHVaZidkfDjAFzJ5Gbxydg+QRxXpDp9WcVQZ@vger.kernel.org, AJvYcCXm65wQyiCXetAVCww35jCLibBTOE2+zjMi1BtLlLg2PAyQvNb+WLndeFc73vIlj/BRZuj4dvN2lDtw0g==@vger.kernel.org
X-Received: by 2002:a05:6102:32c1:b0:4b2:5c4b:517d with SMTP id
 ada2fe7eead31-4b25d99ee96mr11219600137.10.1734342638986; Mon, 16 Dec 2024
 01:50:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241214085833.8695-1-wsa+renesas@sang-engineering.com> <20241214085833.8695-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20241214085833.8695-3-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Dec 2024 10:50:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVg84XWfjXRmt8Hw1Gwh71-QOwo8jRRzWDSt1r2SEgQ9w@mail.gmail.com>
Message-ID: <CAMuHMdVg84XWfjXRmt8Hw1Gwh71-QOwo8jRRzWDSt1r2SEgQ9w@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] hwmon: (spd5118) Use generic parity calculation
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 14, 2024 at 9:58=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Make use of the new generic helper for calculating the parity.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

