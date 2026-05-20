Return-Path: <linux-renesas-soc+bounces-32844-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CM+BKThpDWquwgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32844-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 09:56:40 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7885893C9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 09:56:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A514F30080A8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 07:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C7F4376A13;
	Wed, 20 May 2026 07:56:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D869355F49
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 07:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779263794; cv=none; b=CXf+6EC19C8vK5gmCWSTUCvdHGmfkSGn+hLtzZqtJqP8v+Xn3queEBpujirONKigPBQMs6d9Zk78rZeCZ6BSlTXoDLKLv+iAjgff/uAwCkiJuz1SN/N2N0kFNToFxePoorcKvm9f/d72MlV6/saJkoLo7eKd8M/MByNbVDfahtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779263794; c=relaxed/simple;
	bh=QqPxeM13+Xx0aqfPwJhCfwrd69Mly4RhTLXMjEcRwuM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V/ujwZi35X5gJC+jJcXZSII3dTOR3H5gr2TW7j1EomuqaMLeDJ3HW3QbAlhwcLUstoj0wIPFJop3/9Zm9aRmVKXcIz0SKm0Txl2ItCJmr8wkv5T9q5dJhRLzMlTU9Td8s07PAMKcromHZzbzmMsgyD4sxO+mMy2ft93OvX9wuyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5751136c561so4269577e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 00:56:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779263792; x=1779868592;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f7bxrGxQ1iTs6SaX4Z9onRYwjShKtP0zGwIDYAHZcO8=;
        b=jYcbZMxMeVS8mD9PKltCZZ1PGWmMnnekMfoH1Qdc1iFP7pPgCuJzOTMkgOxqnZSTAg
         WaTEcwU+1IffkX6HH9nIf96N+8zbvr930EDa9OmYBx6n02nDOHWUH5d40HZx7Wqk6Z/o
         FsBneTJZBgIV2K50KX18QHbDxrlzf/Ozp6PLD2C8rp78+JzyI93EbN9aVDMTxNQsHUMg
         EiewOkWopulXaiS5oCYSLIbIpQwC4lhR8jtOp9qmAhI4BKAj1nScUS2oVQmzUQeID7n+
         A2cpwCX2qORcJcNwUeAQW/WAnnjtq8JlYPBuHzRn/PZm6RXrNS5eL55TNF+u9B7ANqSr
         4qiw==
X-Forwarded-Encrypted: i=1; AFNElJ8+aZCVMPI4WDGdOa76MsE0yM8Hu6iyN6Uv961uVWorYbgklTwYLGS1If1sVqSoneWVBlddPASqEA/+75/yMjdSRA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2k6NsdJkwyqNJAsE6+QN8h/qQE04ApvdHS7YsKF/ifv/I7WjB
	3GkZIKWk+6teBMo33nLUIXRQvAiIZ3gow4sCU+yljEQM7c5sN3PGceG/lffbfkD0aDY=
X-Gm-Gg: Acq92OGQUIFwR7g6sbBh1eHzFF5MiIl/xs3HHYp/G5ZKmNrH9jwtwdInr7MU9pv32rz
	/JyEcYh1lockw/dSXdVA1zlzB3z2+wxD+LwZuV5KvFXDsTWAhpEMJ+ogplrhs/CZUok8cF3tJoy
	hZJTOjcBwSAGDra5M8c/XzdAyovByiXTseSEydiZTWPs+RPaCYekNuaYmlafse5AGNej0/okLC/
	s0WOJNPmZBCjxwby2+oGusUpCQtuQi8/R0bxul8Kj/GH9NT2tGxgCmuDDZMIl2cb3zs+iDGuzFv
	u7J1JWQyANjweVA8hZm/piSMnn/844D+YkP/cMC7fqbT4mU9G/aU21EytztkXfcnI9VYtBx/zdf
	08K/4dnApzTIkPJV8QLvT5gdlP57jXfNwfDDx7InZAsIszkne9oalgC7PT0xroNqYvgX9hX0hb9
	86Ufa0DVDwcyuH+T1/PLfsoIh6JFxhN3FdZzg++5D19tv1zKyxgo19g63qPJg+K7zQugbN4sg=
X-Received: by 2002:a05:6122:29c5:b0:56b:8ba0:fd58 with SMTP id 71dfb90a1353d-5760b872dffmr9244631e0c.6.1779263792134;
        Wed, 20 May 2026 00:56:32 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5760fa59b2esm9968011e0c.9.2026.05.20.00.56.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 00:56:30 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-6312bdd281eso4166384137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 00:56:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/Q1dsPiyMFYMU09Ukzy2iqM9GY0BjwPTF5kpeKlqEsCR7hzlk3oKw7F4tMKJiX54upna4i5QCwL/WsWoDio3pFkQ==@vger.kernel.org
X-Received: by 2002:a05:6102:c4b:b0:634:10bd:95c6 with SMTP id
 ada2fe7eead31-638b8411d03mr10827623137.22.1779263790023; Wed, 20 May 2026
 00:56:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519135342.623943-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260519135342.623943-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260519135342.623943-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 May 2026 09:56:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVsSdar1OdGtU4wK+d0+UDxGJwtXBRa+LgRVwK5BE425g@mail.gmail.com>
X-Gm-Features: AVHnY4KNCbwcbPYoOaAbA20ajOpz0ciN8hyEvIG4fBBRoaXuGIeSrdlARt57b4Y
Message-ID: <CAMuHMdVsSdar1OdGtU4wK+d0+UDxGJwtXBRa+LgRVwK5BE425g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] mmc: renesas_sdhi: Add OF entry for RZ/G2H SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Ulf Hansson <ulfh@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[sang-engineering.com,kernel.org,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	TAGGED_FROM(0.00)[bounces-32844-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,renesas.com:email,mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9F7885893C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 19 May 2026 at 15:53, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The RZ/G2H (R8A774E1) SoC was previously handled via the generic
> "renesas,rcar-gen3-sdhi" fallback compatible string. However, because
> the SDHI IP on RZ/G2H is identical with the R-Car H3-N (R8A77951), it
> requires the specific quirks and configuration defined in
> `of_r8a7795_compatible` rather than the generic Gen3 data.
>
> Add the explicit "renesas,sdhi-r8a774e1" match entry to map it correctly.
> Note that the DT binding file renesas,sdhi.yaml does not need an update
> as the entry for this SoC is already present.
>
> Fixes: 31941342888d ("arm64: dts: renesas: r8a774e1: Add SDHI nodes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Dropped adding entry in the quirk list instead added entry
>   in the OF match table to map the SoCs to the existing quirks.
> - Updated commit messages to reflect the above change.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

