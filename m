Return-Path: <linux-renesas-soc+bounces-21707-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C30EEB5160C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 13:46:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 068917B01C7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 11:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4095B22CBC6;
	Wed, 10 Sep 2025 11:46:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A375A4A1E;
	Wed, 10 Sep 2025 11:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757504768; cv=none; b=W+YN1CjOLmgOKT05nvK9CaouV4ldHvHgeSXDiS4e8J0nY64xnzsv6jOhX4lqLkqco2ekilA6SVUjisHu/pJseU8B019VKHGwkqkHmc9pZNOrREOcuuywjuBjntP1QBIqID7TwzNJNDnYtR05gFxqRRU21LGtRQ82D28m5dNFTjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757504768; c=relaxed/simple;
	bh=csbSsmLBj0sHJc2hAiyDX/dsXK2thMnxMp9Kx8Jufj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pFaPXk9ayaxW2fOcEwjltXZl0/7KlHiTnv5oQmbWZOzESxmhkqRITaevN6oKzS6pMKu4dAxk092Hco8uaFh+a6WBMPIwb35kRC8Gl/uyOJo7/nR6s9fle5fAmIsI9c4WfxGO8iSDo+lvig1POhl/OWJ/TWathc1XI+lR9bwxILw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5449dd423a6so1360759e0c.2;
        Wed, 10 Sep 2025 04:46:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757504765; x=1758109565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Otf/DIZB6w1m1iGxzWRiPBWA4CBmeOJ6zsbyVxKZOlM=;
        b=TrJ1pab2XvA3yq342cnte5DlyWoyBtSJiR0Mxxu86ocFjRSrPKr/fZsolGajDn17eV
         g95k/pSfplgvnjImi3YK7B+fP8LE/t+a/QFy2kdseDWRXnQP3RYaTM256RZMGjV7Gkzd
         HhLoY3/7WcW+/5Z12brGvJ9EIX71tuq8B/83guay/E6sS/JABstDlYqPmX82EMI1I6FK
         CnP40jYBXas0Lxph0HTjrOZ+qkreyp9ajDiGxHubbce2OJ8WNG9+ASWdD4kyLH4/A9J+
         xFtPgqKR/4742SsgzOKaWsJV6qcExUlsBjfjaL1HZ4RlYV/eiTH2fZtltqC34D8AzPn0
         hUFw==
X-Forwarded-Encrypted: i=1; AJvYcCVH64MchpC3+sCMD7D1UYD5elc5oOfuZoakKVj62u7ftdLJzSzxr6RBGRzqY8jwVV0m/ySoxPKP@vger.kernel.org, AJvYcCW7cjPNLBMQOmIG0TIQXdAFPEmcEWjFFFqZmB/yWcTV+WqHSFubZRusNRUMBcpGXEEfrrfy4bAu8pmAOECp6T2LeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOPq0YSknF2BzW/dhb1ZQUpMdWOMRd8VQzVDo66odwxDuPU7J7
	6v8oYWnlnV6OGvgu1hUYZdwT9QPV1hzOAE3r+LF4BVeHFpsOhaSE1EsE34LAoaNf
X-Gm-Gg: ASbGncv/0DBivjgMZ8UmrVK7MBqwSokptLWRO+KDfbF1ALu/Or/nEHKmG1M/SlllSby
	M52+Ev0WivUuvjbVlOo3A46sHofuM2L91WPWIrjGU8mzkCCJA0HsqiIHDwJiymHet7u4zvMXqTH
	rtLGyEdDG8JyFt0eQiE12yN5BFhtjnCmPVM0dkOxsP0bB8GqITdtxZO/6042us30pwzP1vb670D
	LCymOlponhfpUkzV98AJj8RG4Oazkw/VRbdfT3/k7jMOXS6HdvFZBUugBZ9B4ZsVnl5uNQskBle
	t30XrUZ816Ame0mjOt3eK1DzGmWqrkfWvYfYAUh6M642pm8NnpOKPt8ORpzfbwShpcwPtvoV/pZ
	J3UhF3WJ2DzfVS81ymDW/cA+4u39nAttcFsBvqlZli416uHEWnNC7Hqc/sdGZ
X-Google-Smtp-Source: AGHT+IHAYPTklF6gr6yfEM/+4LaKI+PqD5Y9W0u7RJn8VcIYBC02vsXKuaLb5D1F1gLfo6HvKsdXeQ==
X-Received: by 2002:a05:6122:2017:b0:530:7747:80a7 with SMTP id 71dfb90a1353d-5472c3d1686mr4476032e0c.9.1757504765237;
        Wed, 10 Sep 2025 04:46:05 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-544a1f09810sm12174788e0c.22.2025.09.10.04.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 04:46:04 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-51d14932f27so2775455137.2;
        Wed, 10 Sep 2025 04:46:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVQtPmxB/RJZJEusfqwZFcrX2Pz7KvVtSbPlVRShN+LKvU5tsDY89gyJy96lkRoBHtfYXgEoFZx@vger.kernel.org, AJvYcCXZKB0WQLbqPqJZgS+1FwoxvYD4Ll+4zArnoT49BU61S/7CNIDuCQb3toFBDuMQe8Byr3vWZ3uCIf+PK60QVAIcig==@vger.kernel.org
X-Received: by 2002:a05:6102:8092:b0:52a:4903:95af with SMTP id
 ada2fe7eead31-53d21db5d83mr3960316137.19.1757504764716; Wed, 10 Sep 2025
 04:46:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909085849.3808169-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250909085849.3808169-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Sep 2025 13:45:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUUxFRr4SxOcxgQtF-PCNgRWXL6Pn+js_-C5kLLiv_AgA@mail.gmail.com>
X-Gm-Features: AS18NWDKhfuji0BVjEqXwRGAXXaG8PrhgUk_1ZX1R2g5T3AOJ2MZy5GlABb9zEE
Message-ID: <CAMuHMdUUxFRr4SxOcxgQtF-PCNgRWXL6Pn+js_-C5kLLiv_AgA@mail.gmail.com>
Subject: Re: [net-next] net: sh_eth: Disable WoL if system can not suspend
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 9 Sept 2025 at 18:21, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The MAC can't facilitate WoL if the system can't go to sleep. Gate the
> WoL support callbacks in ethtool at compile time using CONFIG_PM_SLEEP.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

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

