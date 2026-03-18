Return-Path: <linux-renesas-soc+bounces-29771-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAeQF7afumlSZwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29771-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 13:51:02 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A422BBD6D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 13:51:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03CFB3176CF3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 12:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DAE43D667E;
	Wed, 18 Mar 2026 12:47:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6014C3876BF
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 12:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773838077; cv=none; b=tfxFwuPMh2u1UW6Xzc2EiDjLr11vDnavdTgnQwvcrh09Smk23kDpkkbZP2aY5bPwIQfjfS2CC4jpyTd2YQRC3/XsIA3eK32zx7sr+cB+zayvFal4fXoZu7Kudj0LiwDWqNSiQpD0rlGVZ4raC3hOXvv/gmue77UJmeLzwgTgWg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773838077; c=relaxed/simple;
	bh=auniBK1RLNeP9e0qQi8bawPYrVPaApc/ITk7ZrBeLyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SszgI2m465pdW84wmk+ydQECRSfOZtIzlMDfrrl0lLGaxWkMZZMJWU3kXdIDQCJ+5yMWWMf10laYlyyjCYUhKqJmuvHJUhWgjWa4XpUSDVUBUVheGM0UqGtPRiq3dbXNEggsi4VmgdrD6Wd2T6r6UzkPAzB0ZFnFs4/9b2WLk5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5ffc6a96602so1364966137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 05:47:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773838074; x=1774442874;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCOIuBh8oPxYZvoMAhS74p7vRvZQwzuvijT9kB9rGXQ=;
        b=CtRRHwXsE+S42bEfXbiRAVkzy7kcWMzyM2Iph3JzS5AW/FtptnZ2CO47qkNMK76Nod
         QR9Aq57TKErpJDoHjboJdEdObx14dXFb4XZYh61dDhkLl9Ik+Y4bLWt/5z7ivgiDqSnt
         zjUz/qBKGCLPm3fytEJNUy+2vzgNWLIMHiP0u4o1/ftoXhqQ5Ab4/ghlGxzc5zv/UF0l
         +T83X/VzXIVTZgkqgZJKRiamK0yJpfpkaX1r3Ya/+luRzK1Ahb/rA5uUtReRzBd5/Ri/
         /WmOTgrFTzx6zXU+5q9Wc67xX24GXhWyN0R+F78jk3/5Cwcv7rV5R+VlmADMyBswSzPj
         i1gQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXx7dVo3NHHVefOAsy9n9OWrY11Fd5p8kouHghpFNjIC8B7HaEBKmgpeJrNJK8NOizY/mdeKPomAMp94BSMHQN3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHDeLmumM6lUrZY5RRztF29kdddHSh5iYLUpM2kE/0QNQw+OkZ
	HB9ObuUoZRsqG9tZGHwk1Zrb7x5PSjOcBwzIAJEqRwoNGpWKDPlETuj8YwKFZ+8ynkQ=
X-Gm-Gg: ATEYQzz3sCiKfA0Osu6MqEob2mTf8jR70/3QOa+6jvmxcuHUDLUroIRyWS7IjoicMg+
	jnpimnomyJ7ynq483DJmWERkucnxDlAUVCxWk+sAV6JA+KXZ+FJnrMudB3vhWx1Nn5JpMEUU6CW
	nSawpqcUpsAZ5o92xYyt736wRu/gon0VGt/SvMInkce3m0EOjLpGveLV7JML0QmUaWBrqt9VH38
	Q2JFAVhPb/eRf/TM/AXgqrWdeg/kjPROKFWAdrgo+dS+oum+wGz4Qvzb1ooUXx8VuPUOhwPGZKz
	wD7j0Ouy4G/xEQgkZzrRHycJ4Wj+UpSnV6olz4tbZkV4Lwa+KGHJs4JZIOZYcopxM8LBm8Ghdpo
	O1x1KlNvLZBK+pUz9zkysfu1Vk9iabQ+1dO31l+8JlmC/ha80mpd1oHgG+RGbA64OsMGauJoOCd
	v8fSvpcyiCDXIoIE/RbzEC9BGjo+nU95My8lmWGbYL6HTXsxYv+1aFagiUS2EXoO50Dsuirf3L2
	Ak=
X-Received: by 2002:a05:6102:4ba:b0:602:86a6:986a with SMTP id ada2fe7eead31-60286a6a83cmr383991137.27.1773838074257;
        Wed, 18 Mar 2026 05:47:54 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6027eddd8e2sm1288219137.9.2026.03.18.05.47.53
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 05:47:53 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56cc6fe8815so215935e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 05:47:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUEzAqmwStuK5OuYyQwY9g9sI/Tvv0mBxWYUll3WB/utUCXw93WpKSAkEfOytetRIsUCjtZfEWhLCqs7303U8G4vg==@vger.kernel.org
X-Received: by 2002:a05:6122:31a5:b0:56b:8023:b86e with SMTP id
 71dfb90a1353d-56ba713b035mr1941136e0c.11.1773838073393; Wed, 18 Mar 2026
 05:47:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318120102.226118-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260318120102.226118-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Mar 2026 13:47:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW1ROF3VdKzXVNeKtPZPEwX4MHD-kqdunrNYKBprPgPWw@mail.gmail.com>
X-Gm-Features: AaiRm53ywqYqhV410sSvk0RbQ_hDYxt7FsUBR80-zy9YkZunCX5lwuW8kMg5KXw
Message-ID: <CAMuHMdW1ROF3VdKzXVNeKtPZPEwX4MHD-kqdunrNYKBprPgPWw@mail.gmail.com>
Subject: Re: [PATCH] phy: renesas: phy-rzg3e-usb3: Fix malformed MODULE_AUTHOR string
To: Biju <biju.das.au@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	Pavel Machek <pavel@nabladev.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29771-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.952];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nabladev.com:email,glider.be:email]
X-Rspamd-Queue-Id: C1A422BBD6D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 18 Mar 2026 at 13:01, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Fix a malformed MODULE_AUTHOR macro in the RZ/G3E USB3.0 PHY driver where
> the author's name and opening angle bracket were missing, leaving only the
> email address with a stray closing >. Correct it to the standard Name
> <email> format.
>
> Reported-by: Pavel Machek <pavel@nabladev.com>
> Closes: https://lore.kernel.org/cip-dev/abp4Y2FVspUgEpCT@duo.ucw.cz/T/#ma80454df129c8cfcbe48d75f3b4abe697925c6f8

The "/T/#..." suffix is not really needed.

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

