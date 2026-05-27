Return-Path: <linux-renesas-soc+bounces-33187-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IjdLIaYFmrmngcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33187-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 09:08:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 347415E03BC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 09:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 026AB305D03D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 07:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B41743B6347;
	Wed, 27 May 2026 07:04:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E46238F65D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 07:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779865491; cv=none; b=lP1tcY5h/F+vkTasSMU3xDowe+qE6tNb/96yg4V4K3dezNCGSxMkWkRlAUSS6sT29P0MjBUV1NBb1YXOYb+hYTVsyU0DGhx3fblKhkJhD8yo/9sxo9MdulDJNAkPtLV0VDFgrM6+Q3VaycVGfvrFNf1g7wvzxUb/by/mkaHutS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779865491; c=relaxed/simple;
	bh=GKMmnSobBzwl8JTLQd/YSJsYNvtWz84m/vNFGhXlBbE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pTkZKHNTQvcuhXAIgdPAgrwuT3glJ8Tmc5EoX7TSNd+PRLbiqBmgGTVUOGl9P62dS5wyzPATM/sVXllGLY65cGr/kcwSCLCvtkNlLmCKc2eUn3RmmE14LY6hawSVa4bwkFkkrzjh4nvwG2wnx6ay39Tg/qhUOM5TwU1H0HAHa7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5753a289955so3940280e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 00:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779865489; x=1780470289;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6b1O7SqPXRKk3Tzhi5LoKK3yhm2w/yWFcqIE+eebFbc=;
        b=r5ObfYFF4OvT+5g4QjsmGDNpTRRISw7JGgZ9SB3sPRjOIdHBq5gbWHXgDMutzuk4Cr
         0jd6CV9WsdJoPQxweEK10cguANhGK8if18mwMiJJkfikbTXbVszvUzMhOSvXIgdJ1rc8
         xKL8uvCJ/iWbxX94s7SO1PsJZk2oQfCRF3p3DtKTNSzpZlG28qiYcx+345lZhD01OlPI
         DL3Dgh0l0xCsEDqUQvMcgjVzvz1rJRxdGfDmPpHlYbxVGeK9+eepxLwpPyMIFuSrt574
         W6Vk0OfOXYxQGsy1K2NFxtml3ib/mLyuVP6NFLn5tgJD2ioQrzRIG040dSCw0yzr8Uh+
         YC/g==
X-Forwarded-Encrypted: i=1; AFNElJ97oQ60Hp/mA8a36k50/VewBA8DnQ1JQSBIqd2kj8q+Pk/fHCfOC2Aaxth3RrnWcWWF3NtC0c7S7halVsiLfIZ3ww==@vger.kernel.org
X-Gm-Message-State: AOJu0YydoVjC1bgCAEZNABB6Qg55YttxA2Q+M852ZGW/gXp/gbqrB5Wo
	7PrBNrvag0ZJ+WV3CKOSXiz5YIYVWWT0MSsR+EysG37LQaMGCO4OshJ56fxqjR2yHtg=
X-Gm-Gg: Acq92OH62nXOOLWZqWJ7w5GHZO5frMnG/+U/VJC6SwI1U7Iy8EiIyMjswy6+0CAMapL
	98Bg1eI5P0rTUgBhLBalQHhXDQtk+5kn13VthlzowFkYXVMdj2vtqxWsrHEdRnfQAsJ460wcn9t
	bnmF0TG6rxajfl+9Nrk6QFtKcMr31SiXt+irkGk+gKoA0rs5+mDdiz3932/efpVOQS/2MTB/hL8
	zL2kjo3ZZpNVedNDYA7rrEjml02vU+WbYVqd7nphdRNgBMU3cgioDJ6sV7UvSqimlwueqHDOxQk
	oFs3Acw1cUYR291icNghwH55hjkBOBNfOnvWyPC7NBEKkG0x/88Qvx2lTq8f43FyYyANh1tQs4Y
	ghoYl59IATKgNvymzcGyUiCIz/A7oOhlSWWoIKhPWLaFOvxsgVRQRcC5FkMNqs3fhKSJMLzf4c1
	xnw1kR9fM1Y9dW7YSWc4MolqdGHOhHdcVlhbPQtiR6bykiZTtMvNIshKaP1xnTd1dhjtQ/0f0=
X-Received: by 2002:a05:6122:130e:b0:575:360e:600a with SMTP id 71dfb90a1353d-58661834f53mr10280665e0c.8.1779865489121;
        Wed, 27 May 2026 00:04:49 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f791f719sm18997906e0c.11.2026.05.27.00.04.48
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 00:04:48 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-95d0476490fso3361972241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 00:04:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+VEdpKlbDu7JBId7gSDoecRzKP25Gbd6y9jTabkSyNnLCksTY8uunmzLuF4/ZqDislCjDDM8GjzD6yxyaYdD4YxQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3e8d:b0:62f:34db:9474 with SMTP id
 ada2fe7eead31-67c8c3f0c9amr10644205137.20.1779865487931; Wed, 27 May 2026
 00:04:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522105717.1727837-1-claudiu.beznea@kernel.org>
In-Reply-To: <20260522105717.1727837-1-claudiu.beznea@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 09:04:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVQCKmmNMYOs1nbE3nEoBk5uoQBVPy448pKAEq8aqLPDw@mail.gmail.com>
X-Gm-Features: AVHnY4JnV7OBtFs3jVCT30b4PRifJZS7GqIqdG2hkN5jrcNMinu4UQ3d7c-uTdo
Message-ID: <CAMuHMdVQCKmmNMYOs1nbE3nEoBk5uoQBVPy448pKAEq8aqLPDw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzv2m: Use -ENOTSUPP instead of -EOPNOTSUPP
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: linusw@kernel.org, brgl@kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33187-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-m68k.org:email,renesas.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,glider.be:email]
X-Rspamd-Queue-Id: 347415E03BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 22 May 2026 at 12:57, Claudiu Beznea <claudiu.beznea@kernel.org> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The pinctrl and GPIO core code make exceptions for the -ENOTSUPP error
> code. One such example is gpio_set_config_with_argument_optional(), which
> returns success when gpio_set_config_with_argument() returns -ENOTSUPP, but
> reports failure for all other error codes.
>
> Returning -EOPNOTSUPP from the pinctrl driver on the unsupported pinctrl
> operation may lead to boot failures when pinctrl drivers implements
> struct gpio_chip::set_config, the system uses GPIO hogs, and the
> struct gpio_chip::set_config implementation returns -EOPNOTSUPP for the
> unsupported operations.
>
> Currently, the driver does not implement struct gpio_chip::set_config().
> To avoid future failures, return -ENOTSUPP from
> rzv2m_pinctrl_pinconf_set().
>
> rzv2m_pinctrl_pinconf_group_get() is used when dumping pinctrl
> configuration. pinconf_generic_dump_one(), which calls it, makes
> exceptions for the -EINVAL and -ENOTSUPP error codes. The documentation
> for struct pinconf_ops::pin_config_group_get states that it "should
> return -ENOTSUPP and -EINVAL using the same rules as pin_config_get()".
> The documentation for struct pinconf_ops::pin_config_get states:
>
> "get the config of a certain pin, if the requested config is not available
> on this controller this should return -ENOTSUPP and if it is available but
> disabled it should return -EINVAL".
>
> Return -ENOTSUPP for the unsupported pinctrl operation.
>
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

