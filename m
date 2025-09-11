Return-Path: <linux-renesas-soc+bounces-21788-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78435B53A63
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 19:28:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B52191BC46BE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 17:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A0BF34AB1F;
	Thu, 11 Sep 2025 17:28:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767A3340D8C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Sep 2025 17:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757611734; cv=none; b=T7Qid4ufqDx1SinI2hGFcGVw+g8NN4YlVHHI74mS6gWQGi6p9Zqz6jgdhG9ir6dX/aetZWNfRW5X8nyZ5ppor7s/XY82nB5l1MRL5911nxvf3jZ38wy5meL98KPDmZDx7dBDNIneA8iblMXHDSf7EiLUOsnbIk87yHjbCiN2C38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757611734; c=relaxed/simple;
	bh=BdWBmM3pGAEjuR8ywljtmJOivr5eFXGIIviSTZvwLdY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BGxeQ2Dw7GG8uKn1qLg2tLgxxRJXfc+VycWjAzGK3ZibG+HGNvo/EdANU6WT0XSfV1GeiIpHg+ben44vfbQMOb4gvX3cXHmKPSbpL4Ml2KfKXTI6Wajgq33TAo0EZ3y4upJtkzmjTlh1UMC4khoLODs4fHq//Kz1cm1gmKjcLwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-544ba00733aso647881e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Sep 2025 10:28:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757611730; x=1758216530;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nNwKnllKcgNmSxozD/+n9dLn0I91saVxOj9Y59G/HOU=;
        b=eFsl3CTgODDPhNB4OCscU3pakvAzFAWAw35CSFR9qW8HT/8KnUUhlAL/TBbL3XnI1S
         i4a9HLtq79WnX+UqyrRULTxU8SHx9qs+qsmNsPXz9ZAVql8kaBPRAqAtAxlD42wNGejg
         vDQw7/EyPj9sb8lV2TG5KY/z5qp+knUDEC54+YcCfed+zso+v79H+Z5sH1uZbNQwfWpw
         KqxPDCz2tFqyFSSDrSjtz9HHOWXH4/+GituEYjAi6n7ivxanVQHKjwr7WZ6/Xumry4s8
         Q9PlOIP4fC2ZtLiaH1ZsB1xfOyH/e/OysbmYZ3PGmyMZQUDHOmQHQI9jzXdNPjRyCWXm
         UpXA==
X-Forwarded-Encrypted: i=1; AJvYcCVOu5jnSGV1deYp09kGKWDQjtOWqmqwVdIIcXaub2yArJpYQGz6yFw4SsEQf9z+ATGuGw19Qwo3dzuTnwhe2CkbuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGMkCvGC6Qqj4+eH6wZw/s9r4KjMrs00gdE6EIzeK8lcDd4oTI
	r/ejC2HWZOYJJGh7Sz1/3+FpoKePNWM7iqKV56Vi9EpxNhuwneqNBIk4DyuEsje6
X-Gm-Gg: ASbGncvn1MXl2RQDDNiDwHVdTrvdptUb4vvQZbg2TVbiqwUEiDXocsdia0wV4FaoIpp
	6NNWO3nJvwLSR5H5zHnb4trgu3iiEG26yRaaW7Jalto3z1ap+e1gDEaRKRXa5/QFPlL56RF20sO
	zIUPbNzf2i7ufGOOwAuKBnzD7PbSLQK48YWdYnJn3zUO4s0J5HFSU/vXq9p8I72dNP00yH1h5qU
	+erPrlwBgd5Id7xYlpUVcPDB48IjNfW7svGOX/9OxLMUVqnF4EmcKbFJKLsHfJj/tVWXviIDZw5
	A1uRiCngrkdLDDKkPMyHB3SpFZmedur1EyAjytUw8M7F4c9NA2PIUk2i8Muv5FWXn4W06/DCBm9
	sLiNqY+xsgyCi6hwcIv7t7BYUYcrdhA9ZU8kMxi+7BIhOPG4now1N78jjTG28cjTNc/MU8t7/aQ
	oJ2Jw2zg==
X-Google-Smtp-Source: AGHT+IHOohUS+4UqC38rnRtJBnNm0DSXWZd17RjMEEMxPqZU821g4L19ISUNDHPIkfK6uUcZ+ZyAmQ==
X-Received: by 2002:a05:6122:3284:b0:530:5308:42ec with SMTP id 71dfb90a1353d-54a16ba4ad5mr75684e0c.8.1757611730086;
        Thu, 11 Sep 2025 10:28:50 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54a0d1bd094sm378513e0c.1.2025.09.11.10.28.49
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 10:28:49 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-89018ec3597so572966241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Sep 2025 10:28:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXxfwt/23EzOuE7SNHVx2xqiHWZStoV7qunN1tfnp+5gTJ/AFNT/IXMd+goHwk8sNXkThKUOlZ9Nc86U+uKRZh+Qg==@vger.kernel.org
X-Received: by 2002:a05:6102:41a2:b0:4fb:fc47:e8c2 with SMTP id
 ada2fe7eead31-55607e2ba72mr193657137.9.1757611729558; Thu, 11 Sep 2025
 10:28:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250907225338.426253-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250907225338.426253-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Sep 2025 19:28:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUHwp7EiVw97CFZG0zmcK3opAgO-YGcdSGRaF3tGwgLcw@mail.gmail.com>
X-Gm-Features: AS18NWCqPuEA5ue65D37BzPjM6jGqyVU7S3WL9hosSlR-Z0YeWoG17bjv1N9sFE
Message-ID: <CAMuHMdUHwp7EiVw97CFZG0zmcK3opAgO-YGcdSGRaF3tGwgLcw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779g3: Rework fan hwmon comment
 on Retronix R-Car V4H Sparrow Hawk fan DTO
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Sept 2025 at 00:53, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Reword fan DT overlay hwmon comment to accurately locate the
> fan control sysfs hwmon node on Retronix R-Car V4H Sparrow Hawk.
> No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

