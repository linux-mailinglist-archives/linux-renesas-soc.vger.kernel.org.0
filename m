Return-Path: <linux-renesas-soc+bounces-22458-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BA4BA94FD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 15:20:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDC61170767
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 13:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E5A43009D5;
	Mon, 29 Sep 2025 13:20:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A224B306D48
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 13:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759152051; cv=none; b=RE7w97FXK+w2w/+AZKIb8NDVODS+PPsgi+Ajeqg6lsKMcYtSA690efzWD74C+Xty/Yfiwu3BvX3OP8dOLJEmzAUVYWBJ0ci48mrZxYWTHhY6cg2TX88sYzoQqNeS59dw/1bxaYizW5jsfEK6AHO5phhg+9PuVLxzg1p9JB342x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759152051; c=relaxed/simple;
	bh=4pV8YivL9vh8JtsmcWV3a8thAYA4hLibEwTGE1sy/J8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kdI/YYxhFcCkO716HkaP2/p1ugSBFLmcrkKxNmzuoMYsLyFuVDAFlUTewWPQk3J9YxoIPmh+T4DoCmZa8Rc3PSmE/4YKrdi8f0gE72b8qKE5vD7YabVdYZmzbwdv8VauCct/W4EYF1pUcbqo2kfJHNtnElLDn6/6d859yMiBzz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5a2b3bb803bso2888673137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 06:20:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759152048; x=1759756848;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bMaoRTzU0+4eWSSSFd2t5oF9VAMc19YDTPl4HIGvMIA=;
        b=OSMNJJb116QUYLEO/7zdz2MddMcb+BFnWsqIYxQjJmL/ajeX9boV16blsJjwkH0nP/
         sXrQwJou+QMfAe24jU9MqpT6JqTiPTfsFGUbeAuNKpCKuR4/7ntp2h3K7vhThhcU51Tg
         teGaDgy7B5EGcSSx/RSU49ENqXHAWbGY+xAZMrsPaPTp6lx58T81ys6nDuzm6daY/W11
         TMzS+Y0wC/zVzh5CH5Hb4tTS5fYO3yzRrdKai5rebCyigiZD5xNQcFrEXCwClDpw+cnr
         sZ6APjSP4GRm2Ehb2AWsPtu1tsHr384n6IhscLRICZnd7V+g4Cb+oRVMLaWtKtGiw5WF
         /TaA==
X-Gm-Message-State: AOJu0YzfK5Q2OcqpPAt7Ji9DarslAML2ZGfyXzOpBbNdiqphvjyaLBBv
	sfhQLj9kdD/QlEU4OutdeEoOOfQXi9hrLcNTyddWuOOCaROcyFT1qv6CuFoUBxe8
X-Gm-Gg: ASbGnctpfqYNhgRRvUAn116e974sdz6obndrwiJLL0xdHYme41Yis6PN7Dl4D0zkIOa
	NYHcm0dh7tTX+U+bl5DLZjKTnpi3WkvTjIO4mMjHXCY98N+isaLimKt7DxnuTmyHTX+GYP0uvQM
	flNwvl+EFJMhprdyx/GxeNM+KzU1RwWeTHbV9yupBI1nNPl9yXQC4xw3B1Q1xho7Wx4X2HBle4Y
	/Jxh7dWQgZtLPNyTZxR/I+jeTSylYTzwp4P8u6nZyORuuGvBwfgxJTxJ7cCsEuuwEiZaij5puYt
	udSLqrPGVKCom8CfQkDVAZGqLCr6+5mU4MEdQ5XA6TnxeUS3iMgZmegHxoJ+deq5a33T6z2ddmR
	zY7ks78TR0H3O3s7foqAhGe63EKJHsU1iL0jALYvowECdj9E3h2AKO7NEwEuOZU4SsoOcVulCso
	ca4pfp6viCZw==
X-Google-Smtp-Source: AGHT+IGOQYzK8GjABH8lA/7/uwgQfAKZJzMus4qHPVMxtcSxxUMfyp5fV3TbL4iKeY902yojx79N8g==
X-Received: by 2002:a05:6102:38d0:b0:521:f2f5:e444 with SMTP id ada2fe7eead31-5acd4636144mr8421531137.17.1759152048226;
        Mon, 29 Sep 2025 06:20:48 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54bf7ecbdc4sm2004317e0c.6.2025.09.29.06.20.48
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 06:20:48 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-54bd3158f7bso3389279e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 06:20:48 -0700 (PDT)
X-Received: by 2002:a05:6122:91f:b0:540:68c4:81a2 with SMTP id
 71dfb90a1353d-54bea359bdbmr7288656e0c.14.1759152047704; Mon, 29 Sep 2025
 06:20:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250925093941.8800-14-wsa+renesas@sang-engineering.com> <20250925093941.8800-26-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250925093941.8800-26-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Sep 2025 15:20:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXxHEp7C4SwdoQ=irnAvYhbTvqxZnoQy0zNFoiYgSDFHQ@mail.gmail.com>
X-Gm-Features: AS18NWAE4WaE4Sjn24X5zyjfh4_vHbU6gOxCAAJaFd5Q9uzhwvIt4sDUo66WHTY
Message-ID: <CAMuHMdXxHEp7C4SwdoQ=irnAvYhbTvqxZnoQy0zNFoiYgSDFHQ@mail.gmail.com>
Subject: Re: [PATCH 12/12] arm64: dts: renesas: eagle/v3msk: mark SWDT as reserved
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Sept 2025 at 11:40, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> This watchdog can't be used with Linux because the firmware needs it on
> V3M boards. Sadly, it doesn't mark the node as reserved, so this is
> added manually here.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

