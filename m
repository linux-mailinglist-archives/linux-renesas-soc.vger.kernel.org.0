Return-Path: <linux-renesas-soc+bounces-8238-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A908D95EDBD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 11:53:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC72F1C2137B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 09:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 590E6145B0F;
	Mon, 26 Aug 2024 09:53:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3DD146A79;
	Mon, 26 Aug 2024 09:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724665998; cv=none; b=VS+MN9LWrAVyTnUnonUTh+c3e9jKPoyQaI1bLARexwaNBiEZq5EyxDEv88CyNrom5ehyT3enASjXmewqN6cDGDzDJnUcnfdONsc7VPC+oryBg1Drs5WjaBQD6z7QDiSevNWNYv8FocU+ujD9uomgi1reU65P/k0NBCxWHAcTbEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724665998; c=relaxed/simple;
	bh=uCMVP5AAf9Ic7Tbz+W996PQ4zWUMv7isn0iIiV+daR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SRC7k0kJvTIe2TgfWF+TakQv1z8K1OiioMCa28ykJeVILyk8ydj4U0C59eJFjWQ1noFs6foy6eLM+Uqv3y7nBhGtne4ukAbxub9zvyDBmJK6cH4DWPRYsySSQtUzk4+kEhmugHtKbUvw6ckrlMUS4ezCVv/LgFSK2d+8vfDvbGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6c0e22218d0so42990177b3.0;
        Mon, 26 Aug 2024 02:53:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724665995; x=1725270795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xIxHgySimhudfjPoZi8j1w/98XwT2TmQjMhDhWg7BtU=;
        b=IlZxfZ4Trnz526cNe+ActhQM3kECmJ8x2Ot9mzLep9xwWV99oMSCSJRGUzCp9Nx+Y6
         JZGrE9MyIzHwDkCgs2woFLwenC1dSsXzWccm9sop7DVgprMqUQiBETDgJenj6RtN4fX7
         UwfsSGfSbuo+JGwxFVDOfQhLCnoA28a9cAcDBnwnzKLQ2cXBcA02ijtrAPQrf4qh5n3p
         47s7PfLQeK2FWv5jpj7N/p0D6ZFhb/FWZ0w6qgqsE5V8Q4Czc0MLG91eWr4OMoDoW38i
         DqvsQw06jzv3HdAfgrGTvTNtmqGogbQoZKVTreq3n6JbpdefR2olTYUzlep9BhTJrO/j
         0SFw==
X-Forwarded-Encrypted: i=1; AJvYcCUvAb/0m8IdmPv3u2seW0DBITcN+0qYdDRH+Uj4nkPzNtrCgzmUSb4l5yrGcQAV+OAjE8d1TtzJ27syiWCi1FmBwBQ=@vger.kernel.org, AJvYcCVVnNuZYIrGyhy7MbfPAe7zNNfikEvQyIahh92TUilAH+sYtGGy07QlDPhmG7mrHvzJotYWFAMmDCp+KiI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0bG7k+5Mo0oq7Z5zYCQ5UGDfe46rhoSgCCdHv9nSJqK3AGi6s
	gm/Bq4E0rpPTYn1gZzC33lcqkZM8jcMjdWmeI1RityWKmOCF8v7EpHonTevG
X-Google-Smtp-Source: AGHT+IF2N2XZbZ9IISZaWXLDUHAxjedGRsWpyXE2Z7Y1loO3LXLtjntY4GNMlh4JWphCOKX2XJUJFg==
X-Received: by 2002:a05:690c:4246:b0:6b2:4154:e598 with SMTP id 00721157ae682-6c6262f43e4mr95411357b3.26.1724665994868;
        Mon, 26 Aug 2024 02:53:14 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c39dd475e1sm14520117b3.120.2024.08.26.02.53.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 02:53:14 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6c91f9fb0acso14279797b3.2;
        Mon, 26 Aug 2024 02:53:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWi+LACs1eagFh5Z7IVa39hZtOIn7DLOaTMk/H9KAabdS3jvv/a8eZPb9E9MhQzhU7AwVPxdTT7GZP/IGuxs9BW3sc=@vger.kernel.org, AJvYcCWrWFDmFhVSO7GNzh9XfCY/H08exTUVxrkkY1BmOSmn3Zcv8W26q9hOBbe93zND+ZaL5XRkWwWi9R8yVg4=@vger.kernel.org
X-Received: by 2002:a05:690c:4246:b0:6b2:4154:e598 with SMTP id
 00721157ae682-6c6262f43e4mr95411167b3.26.1724665994139; Mon, 26 Aug 2024
 02:53:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240826094328.2991664-1-ruanjinjie@huawei.com> <20240826094328.2991664-9-ruanjinjie@huawei.com>
In-Reply-To: <20240826094328.2991664-9-ruanjinjie@huawei.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Aug 2024 11:53:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWhfDmRONWLjqgeCa4ZPKKXxXDv6T60OVSmEdvdm1RvvQ@mail.gmail.com>
Message-ID: <CAMuHMdWhfDmRONWLjqgeCa4ZPKKXxXDv6T60OVSmEdvdm1RvvQ@mail.gmail.com>
Subject: Re: [PATCH -next RESEND 08/10] mtd: rawnand: renesas: Use for_each_child_of_node_scoped()
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: miquel.raynal@bootlin.com, michal.simek@amd.com, richard@nod.at, 
	vigneshr@ti.com, liang.yang@amlogic.com, neil.armstrong@linaro.org, 
	khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, heiko@sntech.de, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, wens@csie.org, 
	jernej.skrabec@gmail.com, samuel@sholland.org, kees@kernel.org, 
	gustavoars@kernel.org, linux@treblig.org, robh@kernel.org, 
	u.kleine-koenig@pengutronix.de, erick.archer@gmx.com, 
	christophe.jaillet@wanadoo.fr, val@packett.cool, 
	christophe.kerello@foss.st.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, krzk@kernel.org, jic23@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2024 at 11:37=E2=80=AFAM Jinjie Ruan <ruanjinjie@huawei.com=
> wrote:
> Avoids the need for manual cleanup of_node_put() in early exits
> from the loop.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

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

