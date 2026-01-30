Return-Path: <linux-renesas-soc+bounces-27659-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cO3mLlF5fGmWNAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27659-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 10:26:41 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A54EB8E73
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 10:26:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42ECC30053FA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 09:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6226349AEA;
	Fri, 30 Jan 2026 09:25:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE092AEE4
	for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jan 2026 09:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769765139; cv=none; b=bpRtoeqZqymjxy7oJG/iKcrQLl6R5Zl7Ewmr1C0ksejDs51wkgtCYGJElyNEdNlaJYpY9QIvdd2o7S3Pvh3pa9w/vudIDLZA7XcNw4VoCGBoxfnzzjXkYm7qfdjzJOX221FBnBJBlPP0wQRWatF/V12mCoovk3xMqMmGiXSVm0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769765139; c=relaxed/simple;
	bh=rb4EuzCXuTKTVqbpFElzoMQdpdnMXSS0x58YBQfZZgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IyoBLGqJDW1mpYQDSkWD6j9Y8r9S4qhWzu4wdM9nV9J1my/o3bOVkgZ3lZmHPdT+7Rato5cKamvW9M5tTwui+EH/4i6wGEiAsrA1RIjOMYNOemgx0BG4RCDSPeQDR+aOjnF8E21ciWGP7scG5Y29hfMILnr5NRERFYLaWYvQV40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-81f4dfa82edso1090128b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jan 2026 01:25:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769765138; x=1770369938;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sV1LMONvjqxJmyWmmePKRhrEiX3yiJWUNyHMjjj9WKE=;
        b=SVCG328x6x2k70VyVokiMgtVK7a/aiLBdgKub8takn0gMbDDEofqZdv/eEKBcUEm8+
         gATUtCm7Q6edL3A5glZeTu0rOZQ3/5IiOTOUTQ+RX8GI//VsCBnhu/KykR/Vk1fx4n59
         VRBhNUXHoRv5k9PZmXFX5Exvclv1jTIvqY9Q20sRjib6VT+sHSpO++syjUtGcUVDUD42
         /UbzDp4hbC43Q5QLBo6cKYGI0FWZH7DV/MhLQZCGkoypVtiOF6dNpmewfL+8TS1KSxNj
         pfNhU2V5cpvLSgW85zJgulOt3hWVvCrbQsV7jvyRRLzfLsyTyl3h8BEtwH9+WPGshR+1
         ANFA==
X-Forwarded-Encrypted: i=1; AJvYcCW79SV7Syup3T4s7mlyAl0vw4MDpTF+CFmVGcXLnFhPCW16jN+AtnoaAsoT38TYYZS5ivn9IJHkwra8tlXNEzbyew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1bvI8+c7vLP8mvtboRvV2dqnHD7DYN5kML/h/hG3QudAmqwf4
	+ZJfIMyHubM9IwzLL4yB8S9gWISaRuIvR0W8VJI/bdlnbGpoOe7YKV7w84ImItql
X-Gm-Gg: AZuq6aJ403XJr56PX66FehCqqaHHAVlFPoa4DeoRgMm4qdlqaRKs+kyFVdv/+Clg13R
	4Ldmxl/o6wljg9S7g33ijLXO8liJSN+4Wgkbqff7i2rIGBG/E7la9DF8lEJik+RB1XilmdZzSrQ
	62wQwI43mBHJbDzLFBbHNv8CAu/YueCm5LoYSwAoXDWzw0qWk8484JrhAJfw83y0Ew1E1sKdDyN
	zeLsqntAkDvQtPjOwHpEwNRRKd2gm5r2zswpAp5mVU15sr3VFCDlnKjZwTX385JtNKi7mfbjqLi
	XxLpGIy3CGYcNP9Uj5SEg8J3+jB0vuw4Sxs6fCDD29FBohAS4dDuwJiEa5FLFygK+DTfZKi1oDb
	ctL5hI+1DV8TVdD8PXviSHo3vUiBpCk8pN0g9yZVpyAUHhJKfFvJmr2z8J7BjeqWv8zBlFXeAL9
	wYCmwUSqAWdduWh5MWMZ2Bqm5Qy5N0KJero07H/atEUsGWf4SI20o=
X-Received: by 2002:a05:6a21:493:b0:33f:4e3d:afed with SMTP id adf61e73a8af0-392e007b1f3mr2605053637.33.1769765137946;
        Fri, 30 Jan 2026 01:25:37 -0800 (PST)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com. [74.125.82.171])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642a33607esm6800058a12.23.2026.01.30.01.25.37
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 01:25:37 -0800 (PST)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2b785801c93so4944284eec.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jan 2026 01:25:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVGkMnERJc7lDmGufTchRKpdGOLGEVTfjKfBz8vXxctbq7XdZpUwMO+V2fyMBWbLHZ6fUaVjIUggUaqm6Eiq7Pr6w==@vger.kernel.org
X-Received: by 2002:a05:6102:32c3:b0:5ee:a0de:65ea with SMTP id
 ada2fe7eead31-5f8e25fcd99mr682216137.38.1769764782873; Fri, 30 Jan 2026
 01:19:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129165412.557643-1-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20260129165412.557643-1-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Jan 2026 10:19:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVG4o4-3tJNXnLgK6ejopfoN8Kp384my+72vN5Bz1AmXw@mail.gmail.com>
X-Gm-Features: AZwV_QiqqityMJ4wlbQdNw-loL8M4m5eOc3ehO8F7z2M2oZ_zXPwPRLyN4p_l4k
Message-ID: <CAMuHMdVG4o4-3tJNXnLgK6ejopfoN8Kp384my+72vN5Bz1AmXw@mail.gmail.com>
Subject: Re: [PATCH v7] dt-bindings: usb: renesas,usbhs: Add RZ/G3E SoC support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,bp.renesas.com,linuxfoundation.org,kernel.org,renesas.com,microchip.com];
	TAGGED_FROM(0.00)[bounces-27659-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email,renesas.com:email,mail.gmail.com:mid,glider.be:email,microchip.com:email]
X-Rspamd-Queue-Id: 6A54EB8E73
X-Rspamd-Action: no action

On Thu, 29 Jan 2026 at 17:54, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Document the Renesas USBHS controller found on the Renesas RZ/G3E SoC.
> The USBHS block on RZ/G3E is functionally identical to the one found
> on the RZ/G2L family, so no driver changes are needed. The existing
> "renesas,rzg2l-usbhs" fallback compatible will continue to be used for
> handling this IP.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

