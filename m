Return-Path: <linux-renesas-soc+bounces-31499-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cH71OWit6Gn6OgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31499-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 13:13:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA6944525B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 13:13:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9B2DC300FEFD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 11:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D0F83CAE8C;
	Wed, 22 Apr 2026 11:13:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81223CE49F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 11:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776856422; cv=none; b=Jc7DV5Q0iZ1ZfqhSxgeTtXUu0EQsC8A2Yjt/ODOZnwv5DEl56xBRA58EYcWeee90Si5HS2zeX4Ph+XATVSNFVlovq9DROs3oE7uKpzuYsuoBjJi1vDlljmrEpGY9YMpsCsvaavTBZJa+1oFCirj1msBQ6rUEiz/xDIhxWC/0Mnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776856422; c=relaxed/simple;
	bh=cBjhdCwW7hgdwmZ1DkVjCPmyFRahOur6Pa10yN5MASQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dDHTsh1HTeDcDZKXngIp/I4UYEyfOQAHvsQivj3xQOwxcmcwr/cMk9U3imI18my2NdCnGMYpRVD63Jypgskf80IjKaYvEO9088FRIwCvgccxyCupZ+MuKKohcMs/wbeXdTSHN6f4h+nQwablJ8OYlL7YwQYvgULFkAjiXoK4KUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56faf1cfe04so1392411e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 04:13:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776856420; x=1777461220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1s+zgG1aC1QktYkJ+rJATA7ko8k/pNI81E1TOGy7G8Y=;
        b=IzVTAGkEY9b/V65xrrkcYB3qPYmFkLDB9ib8aajcBcFxP6oo96PhQDGFdWrZFhxy6S
         HW2ygKe/ziRCST1HRlOOzkFKTuFCZnJS36n6Wl/B99cmQNXvMmIjp01VeaCqpbCP+JSB
         UUm5dvoRZyg8CH0l80aZFsNd6Z6LuhjkkIGFxZ4QOjjuqnf0zzZzC7kvURK4NwshbH8r
         V7u1CxttfQl3MJgUfW6p3F4LaEb7SlALGApzZC72kYxd4ztqLE3HsAWnrsChY+jpU/tS
         g4NIpJ5NIL+zMmNKRkUiJfeDBXa2D8eH2RQLo+yQqx3s3D3P3az9VdOFINeeZ4fscqx2
         9CTQ==
X-Forwarded-Encrypted: i=1; AFNElJ8XtmKcxqbIvPanhilmoSzleYCLbWWcdd6ccXFzWJDlBxEWWWziXgVdu87tG+R2gX0cRU1sD9ZmAee6wczOVZQi9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhcLUVJ5TIr379bFb2lB3J56OBWZphqsF39UsTFoa2rjWL2Cpg
	l/0zaBL/WRRZFvcthAMhvhIh45NpbthZ+UAHcKnsqtr5sUObxbBqjzEw6E6nJibNgFg=
X-Gm-Gg: AeBDietgJrzaB8um8GswYiBu9yUmUfDyycLHvVrFcEJP48MmVG1kXKNhKhy7vj4Aqb2
	dsaTW3bjH1wLoG0f8VZrOzzZZKV2eU08BoQSPieCqeJ5uXMxP/AmIb6WUkWV9JYVUV6ISEPJGnj
	IRhqhBBXcTTg27ACXnVx5I+pcX8F3QYb+nYKrUylxK/Z4tTj8PGRt+0RQsEMhbH37Ei6dImT2yf
	MOzoSbsb8eWwOx+BdafErOewAY7iiw4e8W14XSklyhLpQ2Q/fkB+Q5ut+5s7tlnGoyZS82jBW05
	vL25t8e8+HkE60QdrfK+jL/c7gYAHs1RsZ+vfMXrjcIE/Vq3iIz4TU3Ql3s6bFFGy3ZLq2qx/zN
	61o9YGKuKinCXIN6bC9p9piRWmNPSC3iW1j4fwUNXbE57VUoyc2KQAInhFNC0k86BP7H3Qy+qOa
	Sm4kkZ89Ba8jGuEp6c9tnbeZjsNESeguNE3mI2vzMhjaWkUjlndOabO8Atwum+wpQ3lWqHly/MQ
	NU=
X-Received: by 2002:a05:6122:4d0f:b0:56f:6d11:b962 with SMTP id 71dfb90a1353d-56fa57fac70mr10268448e0c.2.1776856419684;
        Wed, 22 Apr 2026 04:13:39 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa90335e6sm9967087e0c.0.2026.04.22.04.13.37
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 04:13:38 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56faf1cfe04so1392401e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 04:13:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+Xa/nBrSYCPOdVl1Z01qMGrS+tR705n8IU6u+SSNHiM285CNG9uCgfIQfDez+wdGbCDZ/M2iZ6OAyp4w7zoPNUGg==@vger.kernel.org
X-Received: by 2002:a05:6102:8095:b0:611:183c:e7d with SMTP id
 ada2fe7eead31-616f59ac05cmr9378138137.10.1776856417366; Wed, 22 Apr 2026
 04:13:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260328090548.84124-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260328090548.84124-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Apr 2026 13:13:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVoL1aRz5zoiGqPYdS6dvThAYBAN20Dy2=4B9pDv+gSVQ@mail.gmail.com>
X-Gm-Features: AQROBzC0TXcMAHai-Jk9wksyFb2WZNepvBEXCR1h1vtfe4dycIPBLaHTb1ULuaY
Message-ID: <CAMuHMdVoL1aRz5zoiGqPYdS6dvThAYBAN20Dy2=4B9pDv+gSVQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Fix incorrect PUPD register
 offset for high pins during suspend/resume
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31499-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,linux-m68k.org:email,mail.gmail.com:mid,glider.be:email]
X-Rspamd-Queue-Id: 8FA6944525B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 28 Mar 2026 at 10:05, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> When saving/restoring pull-up/down register state during suspend/resume,
> the second PUPD register access was incorrectly using the same base offse=
t
> as the first, effectively reading/writing the same register twice instead
> of the adjacent one.
>
> Add the correct + 4 byte offset to the second RZG2L_PCTRL_REG_ACCESS32
> call so that pupd[1][port] is properly saved and restored from the next
> 32-bit register in the PUPD register pair, covering pins 4=E2=80=937 of p=
orts
> with 4 or more pins.
>
> Fixes: b2bd65fbb617 ("pinctrl: renesas: rzg2l: Add suspend/resume support=
 for pull up/down")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-fixes for v7.1.

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

