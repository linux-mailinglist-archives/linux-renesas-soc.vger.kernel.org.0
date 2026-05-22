Return-Path: <linux-renesas-soc+bounces-33006-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIeTFbxaEGqDWgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33006-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:31:40 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA1A5B52EB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:31:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F1413018AD1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 13:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C2B03BFE3A;
	Fri, 22 May 2026 13:31:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB46B3AE18B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 13:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456697; cv=none; b=t7Obz1UKdnQgJvtGvEa0IDaMPxdRoTrhOklFB5JUMiwn8+Ux0fdy76hnnoyCDr/QTDMmy2osJ1nm9tQ5bSjEgvGz/43yLeqBwle3PG/MEl9aCrBFt5822nSn5u4NO5k9mC3fnTxmunHtVpgWWpT67xklc4VSC9T9usJRWH9cXBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456697; c=relaxed/simple;
	bh=Xf+Yg8LOlRf2GpZPDC0DTWEwrAeGxm14AhKUDI+j+Fs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tcyV/FU2UEyZ8ChX/FNV68WMzq1J//FMEgCjLbGvhs7xBEdtoGC6jtxJuTTHUbgZkaMWqILTZn9HUA9XncT+KMN7BxUYLCNIKt2MyETN3AknQLVuU3M3Jc3dVjVY+Y2DkkagRRwgGuVfNB0kfctzE6qin8yZjuuAZZn1bYDiLiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5752b27958fso2573310e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456696; x=1780061496;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3IibdMW0ZAZE0FiZHS+V+HA8IdlGKvS4swE3fjIitYY=;
        b=qm2AvRxFBNAGtqkxP6oG56ALbEtNrmdEJ0UzGvSaRCia4fY2ZaTb4VIOklX9zYF2EJ
         iwKAn5dQ/CTlS266yNjAuOym8mjsVGMPFbfXGby1KIic7dA4IGaYWS/Wz5bCXMjFOn8o
         Q/pdmq4sg+6zk6cJqwFIO/AD58nwh+TXBn6MClf84PJ3WhMHyU9mT6b8dBgk07ZhJuA2
         ceDS4lkCdvdHqiKEjw3OGOz+DcuxFAKvh3p/xQb4w8LiTjz5+JIuDRxL8UNFCq+ypsc4
         EWEilAZZ18kftkCXrpBhaqCg3i9dNgSShVNkVl1d/NCWYvd8xQDyo6yHnqz0ep615/Ui
         diiQ==
X-Forwarded-Encrypted: i=1; AFNElJ+9HXTifQ/OLM95+g/Dl2coMB1MxpkkqbgYUFZULp8NZtWKa/AvqjPb8LyVV4EPTOEHqF35ZBqbWEAZy5AFYlXRVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQwGb7LyUN3ml6nmieoywDLuHUOwGgsyOpHv/8y3sIIZlWFwY+
	215Kwnbqhz3ffSfpT20FMe3u6RLONLpCRtBGMjbiELlvo6mr5PXFq5NruygmjNo0gtA=
X-Gm-Gg: Acq92OHJ+XxK+FNFtv7nNmSjx41+6NfExXkT8kKyt7obRT1K1MuOd19vLX4lR/h9ftE
	Gdi1TSWn4GQfmF2FRmjBZeo5Ywoex/Cm5jYO1LTw63W+xmgbHjj7+LGkdm9h/tGnogAuzTgpYGR
	ntOKILz0xFokKntFB722daRQblWlM0DgKpEDMdVsYoFWcSmypu5ZENT3Qkob2MQvvbX6bbCNwkj
	oPs9jBZMLXmw/2o1hQWie+xFoagl9rV4XT4KurWaxK8aFSqpnLUpN6Pm7TUFR21D1c99GfTJjJv
	jhmwVCOLWvK696qawKK1IIypx2kE4XvzBqKBIM4dKUyWyKGYwSCMlIIGIHDIIJUPv+4BEpjQq3/
	UjMgx/o+gdyS+lBw+aoM/j/ufBltlw5XIUe+jq9XBArAzkGBXPiPgObRkLp0YeJGGJrQja0WAGy
	6XE/uHMgeK8q2Nk6kxDigjciJWXeCwhMVLBG0Pa9xsRjODDEuTbYIjNcR5HWyRObrq
X-Received: by 2002:a05:6122:f84:b0:56b:8023:b89e with SMTP id 71dfb90a1353d-5865fcf7d81mr2065469e0c.6.1779456695593;
        Fri, 22 May 2026 06:31:35 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f791f719sm2086722e0c.11.2026.05.22.06.31.35
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:31:35 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5774680983dso2535986e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:31:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+fy7UfUhw5Rx7CrtZDc1cXQNAHuuJ7dCFcNKo5LKCJuw9MYB7nf9iwTOwiK4A29cbARtDW1SP8fyaDCgTY3XK5Cw==@vger.kernel.org
X-Received: by 2002:a05:6122:e166:b0:575:360e:6009 with SMTP id
 71dfb90a1353d-5865f15480dmr1917895e0c.4.1779456694823; Fri, 22 May 2026
 06:31:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520115144.60067-1-biju.das.jz@bp.renesas.com> <20260520115144.60067-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260520115144.60067-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:31:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWYT1n9bs554jkJQ-Cu6yQ3C4zdeXYAeTjxRfEAGzO3Zg@mail.gmail.com>
X-Gm-Features: AVHnY4J_8QsNnHka07viF6tH8LShnOalF7HfnEKC7XAH0_Z4FxHa7fIG0OGuqUk
Message-ID: <CAMuHMdWYT1n9bs554jkJQ-Cu6yQ3C4zdeXYAeTjxRfEAGzO3Zg@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: r9a07g054: Add max-frequency to
 SDHI nodes
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-33006-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: ACA1A5B52EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 20 May 2026 at 13:51, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add the max-frequency property set to 133333333 Hz (133.33 MHz) to both
> SDHI0 and SDHI1 MMC controller nodes in the RZ/V2L (r9a07g054) device
> tree.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

increasing performance by ca. 33%.

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

