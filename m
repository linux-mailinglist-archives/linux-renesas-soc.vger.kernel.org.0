Return-Path: <linux-renesas-soc+bounces-27439-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Pb4Em2Od2m9hgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27439-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 16:55:25 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B19768A5D0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 16:55:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 920FF300DE24
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 15:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31E0A341057;
	Mon, 26 Jan 2026 15:55:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF38340DA4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 15:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769442907; cv=none; b=UD6bFvp7PAuGvnh9gpYOAO8x2g3ElYsPmnx8quU7+SES6fkHA3nI/fXHkv9CUAoiwCQUSP9rGKY6WQoWk7oh6eFIfySw28v9jkWFg/TFYPZxBiw/7DCY1pSa2yk1HdD2hxlyFsJSzYFo/L3LF+APG7VOxaaO7oJ4ove0GBXoseA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769442907; c=relaxed/simple;
	bh=1XOij24fFL3jCp8FgItwLjml+TZ1bGZsb0l3e5RoGWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H1CaOCwmfWIW5aMM8qPIKu3IpRa8+ZShcD1zvNH41wgUD2/q6NJC33J22acWnXEY4R/DEgV50Oq3F3NkIYReSNUXhkZiwjVa24CoG6pEqz52yu9YlV4kRGRi2eZ4q3oviELRoUeLCBCo71gDRKG9vjeFraBqN84RnY9OQq/+2tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56376c3e866so4478038e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 07:55:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769442905; x=1770047705;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GfmszpDLcKM3me+QqaBglak1H7HW82219TFin6bK4Mc=;
        b=pojk+/RfUPZt0kEWsY4lc4xZ51aLs+2DVuaY1U1xDdXAKvNlPmJEXeiijTa/s9I972
         CLTkuY8KgYFxpx6jg3bOy/IEMDFHvWLZVCWekSG2SEVQgMLZiUNB12T5HYrT9/NP4pgi
         lpbAFfUUihl2jU2uYqSF0MZ8MbV0gznAOBtIJWo4Q4yq2QW8g9OSdAS1vJ/yjDvEB0Rk
         +x501t2YFO3j3gzs6CJIAp6NLNwwTHWgu1AkdjBULj3XGYyNIujCKUENljvR3omoc7ny
         IPEvZFHdRdKIzOS06tpfCvUMR9SRcqEalg7JgfL0fvBItLFOQLjXeZpeEAhzU6SFBjIS
         sBvg==
X-Forwarded-Encrypted: i=1; AJvYcCXQJ5PUfapE2kOUa9TU12Uhz75lu97OL7cqHtMVFm8ZtFcFS6QAThc7MoVt+sJviYlvSrRofw6qVfZlRAITYA5Lcg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3BpubkQHHTiPCJcp46O1r/JLCDWKmdgxYcAvOz8mgXpQpxkU6
	+oZJdjrLMcs7+Iewob3Dg9KE+wejtUXQ7y/7AfguXqag0onhUsfkUiXqXaUMbV7h
X-Gm-Gg: AZuq6aJaNuMMidVd90ZyscY7mAhrZj7joDWWiHgZcmyO5/0GblA2s66JSCywpxgAAtT
	qmZvk8N8UeezIgXgm0/hwvtYND0XN4BRVLowKtuoP2QKonRK6NXTrDaBhd0CjP8Q+tWn5j8dl5K
	DQq6et4s7ZEZjAPm0owlrI8PjnTkrZOr7mkKFJswhZRZN9Tpk4OAzNrm2EgGsOTw69TyIwdRs3h
	3WscJzB3hXD+pDleVX4TsO6tT2cQmgwvQrACauOqoP5g2qU3qUMRd+Ju8ga0yxvwRWQG6kInoky
	1IT72ZYZNXlBK5WSewMNbTVVNQkdiqOrdc1/4Bo6B2vdmMS4QCkW/iLHO+Bt1Qj/r6gtsZLKcwu
	1hpOZHHs7AV5DO6DdG5joZ7x2WwOClsgZypDUs5Z9P3kqO0V4E6nHAkFpj3pj7FhgMH1dkVA8Mj
	+3JYYJJsVVHS9X7UrrMpsg6gVM7L2hWfjl8VUUJuGSpAyoTISm
X-Received: by 2002:a05:6102:a47:b0:5f1:4fb8:6b92 with SMTP id ada2fe7eead31-5f576485579mr1631655137.22.1769442904537;
        Mon, 26 Jan 2026 07:55:04 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f54d62db62sm2405162137.10.2026.01.26.07.55.02
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 07:55:02 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-93f5761e09aso3236783241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 07:55:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWFDVXp3ed1ujFpPDRhs1OAFvMYX8+xdFgHhI2aRGyTuUuCoBK6JAd2B8irirCJ/s2jfhB0YxdRW4bjhOrhqN2NXg==@vger.kernel.org
X-Received: by 2002:a05:6102:cc8:b0:5f5:256d:c0cd with SMTP id
 ada2fe7eead31-5f5764c0342mr1772360137.34.1769442902454; Mon, 26 Jan 2026
 07:55:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125192706.27099-1-ovidiu.panait.rb@renesas.com> <20260125192706.27099-3-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260125192706.27099-3-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Jan 2026 16:54:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUCiAxhrxFnj4w3=hmMKXVggaqsbswBcCNLUaMnue0Dag@mail.gmail.com>
X-Gm-Features: AZwV_Qhbv0qDo3qYKrsna5xVdUyAWWjt9-sxoW2iEe0kNcXEgj8fU6MWgw8rCcA
Message-ID: <CAMuHMdUCiAxhrxFnj4w3=hmMKXVggaqsbswBcCNLUaMnue0Dag@mail.gmail.com>
Subject: Re: [PATCH 2/5] clk: renesas: r9a09g056: Add clock and reset entries
 for RTC
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, alexandre.belloni@bootlin.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,bootlin.com,kernel.org,gmail.com,baylibre.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-27439-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email,renesas.com:email]
X-Rspamd-Queue-Id: B19768A5D0
X-Rspamd-Action: no action

On Sun, 25 Jan 2026 at 20:27, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> Add module clock and reset entries for the RTC module on the Renesas RZ/V2N
> (R9A09G056) SoC.
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.21.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

