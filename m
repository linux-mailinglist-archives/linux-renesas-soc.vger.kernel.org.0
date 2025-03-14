Return-Path: <linux-renesas-soc+bounces-14363-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1D3A60EB8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 11:24:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1218B171816
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 10:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BEB41F4C8C;
	Fri, 14 Mar 2025 10:23:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CB71F460B;
	Fri, 14 Mar 2025 10:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741947823; cv=none; b=oUH3Gabk1rhBEoYCHT27/vu5mTd7hIhPTx5wqtDFOw7hs8CRA5EhztzzXBki3qD7igw4HGARgN8R8JIER7Tol5TwV95m3xFvOpc/Al5UH9G+622X6UNPtC4+/auCgkYEZ78ZDSphtMBusbPIgo1mqMrR3hmT2Bh/6JsaPhX6TMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741947823; c=relaxed/simple;
	bh=+xJkEeipj3B8jB/PUVsG5lhHmrpM9y220dpO4w8YVr4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t3PzF0UwTl7PTZ1ru+OGXQW0qEXSzoxnpFYaWQpsnXqGqFgxKaaw/Q2rZVx2DjskyOu/9EKAVFdkZWoPUo6MApcOhowR61t4jjxRrk27NhiZYARwhYYtRKspn6UbIG031GEdHMvopbcyNxUtCFzPXfdg6wTLXFsg4kB4PPSK1Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-51eb18130f9so933505e0c.3;
        Fri, 14 Mar 2025 03:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741947819; x=1742552619;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ix43K8UyBhRQqdYWNWG7yD5jTRFtliBqicyCkp5ySCE=;
        b=l3hkfrCPfJmgJ2MvmzxoDl4T2Mxb9lmq22lOeF0pWyvmzy+x47U+J0yDlxivR3g6YP
         /sDmE45dAvxV9ynDn6qsYe9hYLFOYAn18yqx0SwPldKRlcncIQINd8i0okP7DGl5evSl
         v+0ieRv26pbkxB6Mz6k8iTdUOuspPhW4zb9yDegUpnrqgE4R+QEvFqQ1z+MHjCeW5U5n
         5ZbIphzymy7OvtXz66HaXJbQhuA2imjuYNt5JsnH3iA7FwRnpKVkiCq+Tqxn53YGLVka
         LnRkQnuHe4s6tWkL+vo9ykTRdJHcBz6jLXpVv3qNPkqILtTThp1XqtPUj+6tXf/8m0YP
         HNIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYTId/RnLFdAsU8BvElNfD9CUQXbvl5UKPiY/dETplH04Ylxjghg2E38RBa/TygG5mQTHrzlokH3ns@vger.kernel.org, AJvYcCVbZVZcezy6ESZsUnzpcWqVj1vIqs4/B8w8Eh//lkuTOtEfxvoWG83FKQHHYFSpV5fA+7dY68uPk9xTFaOw@vger.kernel.org, AJvYcCWZZcMa3BFS+Y0d69JcUXrbyOTzGMVUBPQiAd3M7HLMg1mUw1rSY50d7MiLqPLBm4HoZSE5FlsRrXEqAHsG9cI=@vger.kernel.org, AJvYcCWzqx6xogCDfSuqzC6e7Db38333t0bf1U9SPvUPb6bEqs5PxhzA5zW54uQ5RWVtYmnF9zqlvHPlrqAQP5/cdgP200c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1HEEgP4EYVWZqdjRm1sb2aRaT0kmtW276XRawoRbpAUYeEwjz
	Ypl4ENTr2q3TPxlf7sGP0sqbeUQxviWBsyCZFVuo8OvdVPB0l1sz3rkGYXImb94=
X-Gm-Gg: ASbGnctxuRgMiCbpBmSILVoTgOm7qLE1Ii6IbFcJOuZD4dgpq1y8PnkeoygYI+z1kiQ
	tr0GNy/5F6e/RvQiwCJ91o99BFPALO4V4D5zJB+aYs+TIre/vEIASaO8mzCekzEZizIkhGxIOkM
	OstUIY/9WOlKpDPULNwNc/zXMbhajOMHp9kzmIW1SartyQCpj1WMGfMa2lNW1VbaOoTVA8K9l2l
	tih7pW218AYRrQMwyf2qHjSNDQwsnkB7VvK94Iq+uqZroGmClbofTzWdwIcN4cPIpZ6baracXr4
	WIM7sGBfz+5U0c0N5Lq0JxxLAm7UH8hSg7cY8Oi/5t66nn5BJSI229L9s0F/EPAprpDJim6OiRD
	K3E9w1NTgRCXDXklHIQ==
X-Google-Smtp-Source: AGHT+IE0/KFa5zsfNOKUKt/qVFSxpjw83r9RUrVOwLhtveQivjKvu62CshlnWreoED2QF+quwEhsFw==
X-Received: by 2002:a05:6122:886:b0:520:af9c:c058 with SMTP id 71dfb90a1353d-5244991a1a2mr832567e0c.5.1741947819153;
        Fri, 14 Mar 2025 03:23:39 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5243a581873sm563222e0c.9.2025.03.14.03.23.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 03:23:38 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-86c29c0acdfso926603241.3;
        Fri, 14 Mar 2025 03:23:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVaep59j93K1SXvwYeiHUwcJWbyt+Rjv2M0PGJq40cD+fsnd73d+PeKwJu6i8OBSUJn4GL+ajQwP8Uv1u4K2e3YUyM=@vger.kernel.org, AJvYcCW/VMGFMmLDQ94358xgDJuZ3aVRWEpGYDjN/Aac8SjqbK87KtSV1K9A/m39gOkxlu3FkD+ojCRRj8xGMDBJDD8=@vger.kernel.org, AJvYcCWIzWjvBCDzkTedgmHad5/KE0djtcuahGdfhiqXqG/hVBUGxm8EUhzU93Mn7rKAqDeoD/8ZVmiQVBVFisDe@vger.kernel.org, AJvYcCXb2MMJP3Uq44esiIJJ0u60YjdIy5dptBzVsmyPI4PJw5yO62D0KyhTDoFbebcBaJ4k/OFv2zHBdrVO@vger.kernel.org
X-Received: by 2002:a05:6102:3f53:b0:4c1:9f48:617e with SMTP id
 ada2fe7eead31-4c383226b89mr836260137.21.1741947818613; Fri, 14 Mar 2025
 03:23:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <dc39e555-8ef7-4a39-9253-65bcf3e50c01@stanley.mountain>
In-Reply-To: <dc39e555-8ef7-4a39-9253-65bcf3e50c01@stanley.mountain>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Mar 2025 11:23:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUAKUBXGc=62U+20ueVu_8wUQhHQx5NTZ2PAHxJoy5BTQ@mail.gmail.com>
X-Gm-Features: AQ5f1JoZgWul8_oQdbudD_SJxTMK99tPZr75We11ZBuS7jK3v_X0iwwQuAkTuyQ
Message-ID: <CAMuHMdUAKUBXGc=62U+20ueVu_8wUQhHQx5NTZ2PAHxJoy5BTQ@mail.gmail.com>
Subject: Re: [PATCH next] mmc: renesas_sdhi: fix error code in renesas_sdhi_probe()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 Mar 2025 at 11:12, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> If devm_regulator_register() fails then propagate the error code.  Don't
> return success.
>
> Fixes: fae80a99dc03 ("mmc: renesas_sdhi: Add support for RZ/G3E SoC")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

