Return-Path: <linux-renesas-soc+bounces-25299-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4093CC8F915
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 17:57:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2B843AA225
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 16:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A8C428DB56;
	Thu, 27 Nov 2025 16:57:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E0632C95A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 16:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764262646; cv=none; b=VtYogXw3WAgMS53YRDlxhRbNgoGGgJ4O/f2DlO9tGiYlw0i9sAhjInOlG/VNtV3lPjjWhbtEq7Q3KjTOeTQJMUsKHG+EkCWcnRcsKpGunKXz/vrY9yCOrv7eoOoCLxZH3PJ9N7ZZriC7J2Npa6qj8CKmRgA8OZrJh6N4JEPIW+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764262646; c=relaxed/simple;
	bh=+gfTKNQfNxpo2VKd2xmrMmQCdTXG5qIX9w784pwXKcM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kUE2nTwDUsiCbFLyyDVSdCvwvW/QaYUNIcYuDN5U81Lv7yf4JwUf5qE4ytOZ8we2FOPLXi4BR95I6mwFLT8ubbbw7KN6Fd4n/FuC65syTVAErtGXuUTtyF01LQzJISeKRGmuz7c534Orny4naxtoZDQhC+YPlqaOatGEQFsHW9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-559836d04f6so788970e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 08:57:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764262644; x=1764867444;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZ55d2fAWB0eCD92XJkHw68sI4LD/Wrz2Y1eABOu7D4=;
        b=XNddhkpSoesQQSLi1zYysKMg8ORs5MJIcK31vVgBXuFXKEbQ2qkDeARw58yBwQchHc
         42Bu97OVmGC3D2iSuUWU4HWfIdgBXRyPcd4Sc6vWZ0zaPFNy5NDvrnkzds7n6Uio67lJ
         BPf1YTzRP6Oaz1tEqM9GsP756oBPguv7e/+jR13YY1jATCD+PMRNbESclhetAnPtamZm
         JIc5l1bBnLHBsNF25KzgDGM8k89vd38tZ/IXzobw1IQn5wnII0hVeSZ1C4ZE+pSRrjCM
         mcDECY4ZaBaGs9DiRwya6rq9o6KMcQ1zpourHO8iKTVW2eg+TFT/4xgIuQ6Y/SQUW/Tv
         iCwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmP9RMfj2AR2xKmxTzlsiH6FR04LlqBtp2pDmxZQ10jh0LUgd23HzguxDQEszBM0MElgIM39mhxanT0Vgk7Sc0Cw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQk49Ov7z3FtDRdvzAhCsQjnja6b6FTt6Jg+mWMTWuV9Ch21VY
	f+ZZ69FMeR+VQaCx1xlTDpzb6XI7LiwlkH0Qs7b+sgqMu8VFnjyweF5NCdp1tH3g
X-Gm-Gg: ASbGncv0rEWGViX4fqva8ve2tdMWspx1iR7sMx3iaIeR5OxZ3eoLvm2m5Fr917/Gzqa
	8KIusLqi5ha+1rQ5RI7tOBWhlBdbaKZPb11wsmgvhtxHziuZfq887Z89DZGCA5qyeF0oyq7epjm
	tVZhZQS+rzEJSRwZKswEQ38pVIzsr/fpPAOpNNESft8h9hWKzmmlw6UQiXJwlHJz3Q00TGRcVdh
	uE0c+Dw9L9ySev8ZkHEoRFF1bqkiUD+xAhnnE1he6aZMq2DG8hOY7ot8ZTiXEPcwIyqolTYeMIG
	S9rE1eeTHvxEGJ/1xHK719W6fKE0ZPmQZQt8v7uaF+2l2maTrZd3qBBHrweLg3cLJUjr6A/FGyZ
	nEZfN0U54sIgKCv2cYOfba6lRK0zX/WErfcWF8FJigYwIYp4J/adVw9F69wSSqr9YxZHvFE/eMF
	VzCbgUBFymaPlVzJQBQPqmf6hRNy+or2kEkRPHkBfAA8o5UP/h
X-Google-Smtp-Source: AGHT+IFrPNrGsX/NAoh8Uphzcx5uB3AjWoJ5CIeSBf7teJkQAez4Cm9M2aVSTUh5lhnOxT9HnRVdzA==
X-Received: by 2002:a05:6122:250e:b0:552:2554:7d69 with SMTP id 71dfb90a1353d-55b8f00a85bmr8018871e0c.15.1764262644191;
        Thu, 27 Nov 2025 08:57:24 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55cf5186d0csm769255e0c.20.2025.11.27.08.57.23
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 08:57:23 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5dbd2b7a7e3so775612137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 08:57:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWNfCs50czKUIpexbdgGZI0FJiR/imm2bvfazkAR5VQ4bn5gu9LeXEReV8LzcGkMmupaegX+JYmGp0d/KDefuvA6Q==@vger.kernel.org
X-Received: by 2002:a05:6102:e12:b0:5df:ab05:d84c with SMTP id
 ada2fe7eead31-5e1de4188ccmr9513966137.30.1764262643575; Thu, 27 Nov 2025
 08:57:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125224533.294235-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251125224533.294235-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251125224533.294235-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Nov 2025 17:57:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVn49pFT-0k6AAUS2+rA9eTo91GGUBw5rfhJHZiTsd7CA@mail.gmail.com>
X-Gm-Features: AWmQ_bnLAUFifF_HRIqRZYyMedX28WkVft-CUjCnFSmXOfD1C8mWehuw1FdMd6o
Message-ID: <CAMuHMdVn49pFT-0k6AAUS2+rA9eTo91GGUBw5rfhJHZiTsd7CA@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: renesas: r9a09g056: Add DMAC nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Nov 2025 at 23:45, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add nodes for the DMAC IPs found on the Renesas RZ/V2N SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

