Return-Path: <linux-renesas-soc+bounces-9514-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3786992B0E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 14:06:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E5741F2194E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 12:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB2111D1E60;
	Mon,  7 Oct 2024 12:06:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A6A18B483;
	Mon,  7 Oct 2024 12:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728302793; cv=none; b=uM9wjL/pSQgHdOgU5lDq2z+2iePndFj/v1iRIYOeJln/MRvHWEyCRWcb93csRSSkONLKpFsZpXbBxvTB+pd0IRVOtymeOKEUGO4AC3e0nhxde+XImI3KNQnnOur2UuyZkCH3oXLe3p7viBjyS7ApmpwWcBYSiIaljva1zWyGZy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728302793; c=relaxed/simple;
	bh=hzhpGuCrXayAiYevOIrid30zEGByhqdcJl36HfSE1QE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=XuWgMeF5z5gteV/SaW3n2qHiizPmVdCW7MtMQdt/KO/f0zV3hO2Zdjfp5zaK8o5PcIzG5Ls2kOBKhDvic7L3EqqrtydhArhoDQHo5NaGB3XSYTub7a1z+3yRWtACgETHz8llUdZSWRmMc95E+qoO9ZwDfnKDH2xFpFHN4h3cvZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e25c5ed057dso3889270276.3;
        Mon, 07 Oct 2024 05:06:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728302789; x=1728907589;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e0rdaBnOIQ+Z0JulylMvoFl9ZlGC5bDBL69LXfEKknI=;
        b=xCJHdaBST6+P0sKRhMQanpjZNvYNLVQHDa/ULOyCHucsQ/I2pPmiIwEhFIBXH3tFEB
         ADpzmZExZZEghg9LGJXwGNUQnF6FllTQNe3FW8GPkmzKbD65+CRhxdPXYPxy91XLYCnd
         Uxga7jR5gCXWxAVPcdMOoX2pACGpYAQyTRGCftyNIh+52cQbl5JrlO0+nq0PFjuV6kj6
         8KAg5nI7TuCY5xRsV+3wbWKAsyFwnqWhHrOSvUqQbivNUXHmQ2PC33Tyo7+ZbjOcnBGW
         29RWOnFcTP0tzPAOmdLlFrT0rje133ecOd5IYUCMfoA0perYTuzsw/8VkDl1o9NuukNK
         OJiw==
X-Forwarded-Encrypted: i=1; AJvYcCXjQzUIlSV7sNS7Q7NR3yUTp2V7Qfy1JknCMtwAwMzfYvCk0tUg7c35q/IWM8xIUkBw13D/rjFy7UpK@vger.kernel.org, AJvYcCXvvQS3jiCF+qw4xw21WZphOzhON++MUokyAn4HUzwxi+8FQT7sj+phbdXvxiY2Q+lHk8VoKJzzzXHVf4pr2Se9VOs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZtra5T4PG0H5xDwM4PiBVDBc8uZ2frUtKlG/7r+rLIEJVVk0Q
	v3FVvQMxZq6i9vGXn2ZjQ5cNs3mK0Mc/I5r5W8eZ6sQ1GPSZGp38YmSQWwvv
X-Google-Smtp-Source: AGHT+IHsx4eSfxu0JrfruTCpn3KQulIEdFPCMaeszo9yEgtF4+VA6Fym59DvpMoB8L9O6WXKdNNUbA==
X-Received: by 2002:a05:6902:10ca:b0:e28:68e8:ccb0 with SMTP id 3f1490d57ef6-e28937e4a77mr6800083276.31.1728302788847;
        Mon, 07 Oct 2024 05:06:28 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e28a5c37af6sm938413276.23.2024.10.07.05.06.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 05:06:28 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e2c4ffa006so25701757b3.3;
        Mon, 07 Oct 2024 05:06:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUQne3w4Yrbm3UbWfrZAQ1mHnwWTvBpYuKqIWfJ/qz/K8Mz+wd6Y7Egv5gu7k6OIG5O3k2r/lNqapMmRs5rqLRCqrw=@vger.kernel.org, AJvYcCUig5e+Cqazqcyv5hwckTjnutb81lJQSA0PjDjubyNmK7rhtGP0RqzuK+3nNAcy2QUJqmiNzYI8k6HP@vger.kernel.org
X-Received: by 2002:a05:690c:f15:b0:6e2:636:d9ed with SMTP id
 00721157ae682-6e2c6fc7df8mr83141587b3.3.1728302787930; Mon, 07 Oct 2024
 05:06:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240928092953.2982-5-wsa+renesas@sang-engineering.com>
 <20240928092953.2982-6-wsa+renesas@sang-engineering.com> <CAMuHMdUwJ+EY2qFZxXJc478W98OEWQ7c7tfmmEj8zVEii=OyvA@mail.gmail.com>
 <ZwAWBYunkIetd40r@shikoro>
In-Reply-To: <ZwAWBYunkIetd40r@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Oct 2024 14:06:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWWV4A0NfmK4ZcUEBL72RLGCAxP1VjoKyLfR3efF158mQ@mail.gmail.com>
Message-ID: <CAMuHMdWWV4A0NfmK4ZcUEBL72RLGCAxP1VjoKyLfR3efF158mQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ARM: dts: renesas: genmai: enable SDHI0
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-renesas-soc@vger.kernel.org, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2024 at 6:21=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > Any specific reason you left out the regulator for SDHI (CVCC1),
> > but did add the regulator for MMC (CVCC2) in PATCH 2/3?
>
> Yes, the MMCIF driver didn't work otherwise because it needs to
> negotiate with the card. It does not seem needed for SD cards without
> SDR modes. I assume that, didn't investigate further.

OK.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.13.

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

