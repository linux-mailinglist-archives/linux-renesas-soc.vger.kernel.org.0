Return-Path: <linux-renesas-soc+bounces-29784-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EG1HDrO5umlWawIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29784-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 15:41:55 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A722BD5A4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 15:41:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 60A31307F367
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 14:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 085A83DBD71;
	Wed, 18 Mar 2026 14:33:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0993DBD51
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 14:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773844418; cv=none; b=p/W/NV4YTIAeWz+OoZ2IMDpQ0XWi+JjqCEriO8kCy6AIftdc6DFAGyYTzyegOD0k59d6/lGveMN+O07QYMsbFkZaagoMNSOlcXMkQFFb60ZJRbOngqkFOqgJKHcMrajfUsBcc3WBbQj50A1u2/V57l4i72Uq8N8QEsDjXkJLzCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773844418; c=relaxed/simple;
	bh=Lm81v3X2hopJu4HkS2XTSZZIGVqR68LKUdtuY/WsRic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rRKPGa4SDzDE4n9JJFCsFUheu0kAbFyO/21Dt/kE/DpcvkhdynfMHSsDgvfdvyGHrSkyDswFZF0Opydcsj44pwJdeB6QbhqDxtaztrbFX5o9Wdw6JZk+sCOvUozRLLYtlMo7Og8NWku9+zgcl3mdZ0Cz9QN/Y1gPIM+7KrOxVPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56b6c7c8d00so3168502e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 07:33:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773844416; x=1774449216;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0dzTiRw9+wmXHZEQW0d3m+CW5azAN7PobPRJxwWyKM=;
        b=rNC6FkVm4zUvXU+2qIttJ8ATcv66tRsAMrIP5sQJ4cKuLTZftdo6NNsu0T3A/7lqj8
         ciO7k7w72zfjarj6Qo32hbE8FFa/qGU3xUDZZbAH9rBV0BrBC8lQtEi5GjgOITrLGK7d
         yQz9O+vAWgf0HY1MUnBM/wiILG1XbCI31iigGpbVwFKE+7ag6tvWriWOctz8tXp0CT5Q
         YU9kX4LTWKTUBpYkRgkjLg6gucslTqAb2yeKTPrF+MOOVlxWa8S6IMfUYQ+1PZCb3DWM
         LXytMbby34FEckObc9wf1guMqBc1GOrVnyN/EtELCTVjy9UDQm8M6Pr3t8lgekDELjOr
         gXWw==
X-Forwarded-Encrypted: i=1; AJvYcCXSgS7XPRZIsmQ8S51S2Az7NKTTsCib8CzSwR2s/r464NWXWiYY1oS1QNuUzN535ZGPqIu186wzvwqstyjejD5nLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbetYCcoCmu32XW1x36Omsxmxvd53WW976+hAQDphS5hbP+ozg
	FABuA/MBstuITS2Gevd6ZTHsarL0vyYCEFtb7RJGiO6FSJmgVHVOgyY/zMLyGIAfEL0=
X-Gm-Gg: ATEYQzzTOa5GYHkITmYRMAX3hYbLoK8GM1WPECER7ertdHKCswKup70EdCtMIq8IBwz
	OOhTa1ihVnhN8XU932VCEpyk+uuk8CwomdI5Y1SOnOzl0kdJ4F2cQaONazW0y/KUQzhJ48/bsHC
	OES0+oXPyDKw9LxOXGNENTZAX+PuuWGe/x7mi8HZbF69ZLCl1cmPAyCgLsXRJlk0rhzgAkS2yMC
	QG6vDma5gGIZtlnyCMz7zPAFmCAR3SlQlLitO2HVKMiI9HFXY1ihh2ro2Lj/OB7sBbUfYAQfRh3
	W45Nm3cREdyOocZgz49WeT9uWFQJrQAzq+n9KSOTA07a045iCM2n0XzTltINrKe4ykWqKL7y7cE
	IPmzrUjn2yveY6NtrU/Jby/u7I+7Q5xWrmW0LqkaIvAHz6Rh7g09rAHn+tpn7w4jdHe0T1gnrF9
	nwuUJHVKT7Hsmb/X6h7BVYF724vBD5JdFFi3isQI+YkY5Ka9jiUHI/+EDq7FqnY1C9OqtV5kA=
X-Received: by 2002:a05:6122:2916:b0:566:354d:9f4a with SMTP id 71dfb90a1353d-56ba6ffe657mr1891192e0c.1.1773844416172;
        Wed, 18 Mar 2026 07:33:36 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56ba6e82b4asm1650979e0c.8.2026.03.18.07.33.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 07:33:34 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5ffc879c1aeso4369491137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 07:33:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXOyeAa5daQn7ArqvwrampWgeyCXU51+Z+6VvWINellGtLJWLvxT9qO9VeqrcoSFNbIHQNzEXqQCjEVOUF3y2KDPQ==@vger.kernel.org
X-Received: by 2002:a05:6102:370c:b0:5db:ca9e:b57d with SMTP id
 ada2fe7eead31-6027d2c07acmr1775626137.19.1773844414146; Wed, 18 Mar 2026
 07:33:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318085119.44717-1-john.madieu.xa@bp.renesas.com> <20260318085119.44717-2-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260318085119.44717-2-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Mar 2026 15:33:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXzYa-+oP+Kg4cFmoZ64s-7GcFW_NQ1SgC2y1OZB-S=7w@mail.gmail.com>
X-Gm-Features: AaiRm53aZ3vOKz3xOV0p41g2dKm3hv4oZar4whKMHd360-1-SNNOc-RjUNHJAH4
Message-ID: <CAMuHMdXzYa-+oP+Kg4cFmoZ64s-7GcFW_NQ1SgC2y1OZB-S=7w@mail.gmail.com>
Subject: Re: [PATCH v9 1/4] clk: renesas: r9a09g047: Add PCIe clocks and reset
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, conor+dt@kernel.org, magnus.damm@gmail.com, 
	biju.das.jz@bp.renesas.com, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-29784-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,google.com,gmail.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	NEURAL_SPAM(0.00)[0.140];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,renesas.com:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Queue-Id: D8A722BD5A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi John,

On Wed, 18 Mar 2026 at 09:51, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Add necessary clocks and reset entries for the PCIe controller
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Looks like you forgot to apply a few tags from Claudiu and Prabhakar?
Fortunately b4 kept track; will queue in renesas-clk for v7.1.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

