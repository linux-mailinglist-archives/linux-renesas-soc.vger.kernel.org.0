Return-Path: <linux-renesas-soc+bounces-16647-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2322CAA757C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 17:02:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4A749A536D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 15:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52165255F5A;
	Fri,  2 May 2025 15:02:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD856253B71;
	Fri,  2 May 2025 15:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746198168; cv=none; b=VceC5Q8hNocIbkCqN9CdlCnfZzkczM4pXUoZw1oVwwo3kblo+jvb5aRzibh4MufIFS+LVtUDbzCB52kiXh4vrqQj/Ge8/I/nur1jEGZYQyIzY4nNv2HiVrK2kmyZDhIH8FBoPvRsLgWN8UAqRRpyZLyQ43OBV0yWT91JO1Vuq7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746198168; c=relaxed/simple;
	bh=dV9ez0tNzTQ9bXfQDBs3l7BLeAPPDA6Gf2TvwqMbsJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z27R3xnOc7MjLtz95bQIV+KqmssOIvx5kZwHYF4yTT+jRlDh7yXJFBm2xgnFUwP6JklFCsNAu5dwTBzzXrXwBQ2/JD580TjjpT1VXeQwRStONSeOpTCFY26wwkY/lrYO/pifERT3EKVpuqj7msW56+qmg5r/Z+jThTP8LJXqBMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e733e25bfc7so1987206276.3;
        Fri, 02 May 2025 08:02:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746198165; x=1746802965;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G7bqZaBGvexORSE+eABGdkiK7FrpOXbyrtSUkb/T11Y=;
        b=fsuGttOoRcFceZyBNewmxRkFgM7N2SsblOBmf/g051DgzsIHKZOG6glN3ZpfotRNtI
         yToe1Lt8JhOjvAwjT4ZnnsoKsyhQPEkkBiRJlmewWEwMjT7xqsBej8CmTs7FxBEgi5KQ
         HyNXQesDn88Y0vylJk5JP23YfeIu1OCw8PYxuUe2mnKYaaAX+wt4qoeGhRZIXOgvfqiC
         IstSfA5c3HF1MnwYtkMZGuFHUw0yZvClZAP0BScjKqW39wgJYuBa5/3i9+ZAA6ngSBXs
         mHI4VLN2kLQpbJmbhCLpywuyhLqd03LxAnPqfNReXV4UExhAKAj0xtZbR6RuKf/O53M8
         GTlQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7h5mFHwpB0ty58F/6vbWcrs9M8FHBj5AjFNvvY3ulWRi1Hb4seiOn9rqLhdPy3Zs3ZhmOs8SB0T/K@vger.kernel.org, AJvYcCXNiAdM46k0tQCLOPvMbYqpWxOvPF0fKP+lrTeCu2vrtI7fq5cv9P96wyy7cd7XIXyIO6OGcMYLN7fjBiXS2jNgmQo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYwjXHKSGXT3UucnTlS48MdceK8wbVCenyspwM79GrvPXbZhtP
	WK5g5tn/y+/+w4DDRZ2Bym+A9fxgIg8DV7KWW1RLaPQO2BsoNjHGjIiTFrVb
X-Gm-Gg: ASbGnctqgXkLsaCCXMDwsI8/MkniXBb7qLxXMcXmtOZ2MOo+d+ZHf1pPMFmWChtYWE+
	YiX4HWvrFZnWW0fDHKI21H64LkdRd8N6/xzuOFBUaKgdRKm/I3Cp5XhsT/2nfZXDf9wa6w0pd6Z
	W30R01vdS03KRohUu+hWFVlA2TPdsen44Qkz23RU51nP/OUSUmA69XeBNTyQRN4QL/qpINq+EKb
	GnBKczJ3UvCvEGs/Y38luhWMBXpNTX05U8F88K74Glvd2q5RKkRhiBuuYww5QTZYa9np2vnW9aT
	MZGtE8RH4nE4Ni4XK8pkDeOjJvo8UVhKVyClhH0uVH+x5cP/8tR70jCJ827qi5VcERG4rfZSeTh
	afrA=
X-Google-Smtp-Source: AGHT+IEjMqogF559dPivCvZc8VCKGm/D67BZb/U7C4nu4wwAxLU6IZSL63ho7f73waHNzi3z/n91Aw==
X-Received: by 2002:a05:6808:11d1:b0:401:cd6d:25e2 with SMTP id 5614622812f47-40341161850mr1849449b6e.4.1746198153890;
        Fri, 02 May 2025 08:02:33 -0700 (PDT)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com. [209.85.210.48])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4033d9a58b3sm604616b6e.4.2025.05.02.08.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 08:02:33 -0700 (PDT)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-72c13802133so512294a34.3;
        Fri, 02 May 2025 08:02:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU6HL4bycDxPKddZC8XDXx/ljpbZHDaKGl91EBKyAuMNgEkcm4g9/CklOZSM8UGJfJIOrLV3KBIAJ+r@vger.kernel.org, AJvYcCXzC7MhTddC8ODQ64vr/5XOmHGKC/yMxTpJiu0n2YhCpUMPBtHZ+iniuGiy3nqoQ4I9D4gvsQnJxbYIf0zx9bUxW2I=@vger.kernel.org
X-Received: by 2002:a05:6830:2b09:b0:72b:89ca:5120 with SMTP id
 46e09a7af769-731da1465femr2322726a34.8.1746198152989; Fri, 02 May 2025
 08:02:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424054050.28310-1-biju.das.jz@bp.renesas.com> <20250424054050.28310-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250424054050.28310-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 May 2025 17:02:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWe3ON7M93UMfo3S7xCbrQEqsccoHtgas0+TX416CnwWA@mail.gmail.com>
X-Gm-Features: ATxdqUHPwn0XwB3wYwxDt6jZEjrjF3XGyG6r6klzMARP3qDMz7SxeBdquQKKYNQ
Message-ID: <CAMuHMdWe3ON7M93UMfo3S7xCbrQEqsccoHtgas0+TX416CnwWA@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: renesas: r9a07g044: Add GPT support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Apr 2025 at 07:41, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add GPT support by adding pwm node to RZ/G2L SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

