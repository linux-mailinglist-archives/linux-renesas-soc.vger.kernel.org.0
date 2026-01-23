Return-Path: <linux-renesas-soc+bounces-27325-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJ6AMrF3c2k2wAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27325-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 14:29:21 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 582F97641A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 14:29:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 79AFC3004D3A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 13:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B2541DA60D;
	Fri, 23 Jan 2026 13:29:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B222826D4E5
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 13:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769174959; cv=none; b=qN6xzhyPuIXo1jXTYTsDUI9LpxZ2Zp1MEDXPTTD23EWt58JE391SJCKK2GYXQU5bFkJBlyf37rvJoHy+oM9uL36/RWorfM8ao6wCJSCF/4t0mAK2rpj6BWk2+mMeltI5BICUNjE6Z08KwRzO7UamLVE6fl1lHr/xLWiAp0LJ6h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769174959; c=relaxed/simple;
	bh=5NurO0R2/OhT6VhbIKg6bkeoRSQoLzY5e3peAIZO8zE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RSd3gSZUe5+kKHGKHXexdxQqKN0CrjKMObsQAlofzD3xDlkpE3P7edOGu3+T45S5jthYP6cnm3TkG61pTYDEqSTyCjnwShkE1SDAa/UsxrBuEk3UNACl25K550P/DS+vFPUFsx+HN7Y6IKM/OLFqh+ve5mKmVLXPon2HP+AgYqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-566360cab07so388769e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 05:29:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769174957; x=1769779757;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7uRZVas5P6xxkBpdwTHJQR+xs1A0EdTWP84ona+zohk=;
        b=GYphOTFOXgiBHwjaNPRmwgN7KTc7c5v7jud5Xo5qZuGnFf3Mb4enNb3ISYAe4o1F8/
         RfAG2TxKe7onY03VcR2ZOQxRqswrpoWk0WQJJRSlCLp9A6vTD+Q0xV5pXGNKI3K7lSWV
         fyUGO+aQTdLmzrmVet6PJ85TFg6v177kel2ae5tu35YSJ1hgfMaQc5tWSI+TOjCcNXiO
         SLwz8kxqvB6xiREAgrXVGzG7erCY7/zjJZ3dcQ2v56gycEvtdFWu8RFQh2ct76/J/0Ol
         TgetZVRxXS52vw+JiTZgNogHyUxfMNv6TqSQ8SmD2wPLgsFgzEylA0tG7mPJHTupxQg3
         H6SQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4YbO9GqcUTWqKkA3fF0/JJijlWmBcYgXMpWCPOhPNZXf5jjVHwkGFwmoMcoRAf74fzSpaQu+UHTV+7OhKhXzQSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxivZFfSTqxVpMCAApLRcUCwOGpGawMZl+UN/2dE9Y9RIXeCyXH
	gjkJZ5C0Bmk2n3aO0JpzDlM7G6Rnge0grI7wL0iHmdaH6v2buuxGmhhz5N+crreY
X-Gm-Gg: AZuq6aL6Ts05zQMmflGwJiymoenlayqi4+MkqkUmvLnBXLXEJA5uFVEOJSdRKafgo8I
	N5T8LhV5Htvb260TVWQu/8/nAxP6zX6iqB7fdXDzH+HkOh/wIVqQifhKuIncm2ecyYWl9Mbmt1g
	/RdrYz1nTWgANEuMQuMJEYdBKz1QQ2RNudICHTl9rwgpyox9IRhFvWaxD0KXuKd6B9nLGaxmBlD
	2iu3rflNSgbdPKN9x1nt9alwSa/qstBodz6MmFVQt+DUc6nSgsBiBRS3XrdpS8Q23wwmuokerou
	Ax79wvDSg//ywN/5A90HH9Pgo9WQO3IFJl6ZRYtI3c7cUWLHa6SIf407U2Z0FG6i0zLZfsJOsYr
	uOy3HSJy0bi0nSvXjJaY7Ro4OCbizbnacVa4ONgm7yCBXckopWvgpNklCaV+61+3utcnsga+TCD
	daBToFiqlotB9I7lqE/nRnW5P9K7gooOnRnuJqzJXaQi6TS0aW
X-Received: by 2002:a05:6122:608c:b0:563:83b2:ef2f with SMTP id 71dfb90a1353d-5663ebcef2amr912982e0c.21.1769174957493;
        Fri, 23 Jan 2026 05:29:17 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5663fb58645sm480817e0c.12.2026.01.23.05.29.15
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 05:29:16 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5f52b3d98cfso787463137.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 05:29:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWBrMTcpJwXZkxoJuwHCravFJavu1Ivt6uDaIGTyts6rKBsmZlAkW5YB6qwxvjiNJUjTDin5RpR7fFsKuK6TlKExA==@vger.kernel.org
X-Received: by 2002:a05:6102:12d9:b0:5f5:5c89:12e8 with SMTP id
 ada2fe7eead31-5f55c891584mr122473137.3.1769174954825; Fri, 23 Jan 2026
 05:29:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org> <20260118135038.8033-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260118135038.8033-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Jan 2026 14:29:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWW6KwSXqKkYBGVDpbhSn+eznA1Y1-9iPs4jR9W9pJb3A@mail.gmail.com>
X-Gm-Features: AZwV_Qja41EG5GwRG8B7m5dFnkBsNMOHUZuH503OCKweOMnCriK-91TiyZZrpMw
Message-ID: <CAMuHMdWW6KwSXqKkYBGVDpbhSn+eznA1Y1-9iPs4jR9W9pJb3A@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] arm64: dts: renesas: r8a77951: Describe PCIe root ports
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,linaro.org,renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-27325-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.990];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mailbox.org:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 582F97641A
X-Rspamd-Action: no action

On Sun, 18 Jan 2026 at 14:51, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add nodes which describe the root ports in the PCIe controller DT nodes.
> This can be used together with the pwrctrl driver to control clock and
> power supply to a PCIe slot.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.21.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

