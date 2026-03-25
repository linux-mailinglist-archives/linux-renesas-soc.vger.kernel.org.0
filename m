Return-Path: <linux-renesas-soc+bounces-30246-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLcwGXzow2lvugQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30246-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 14:51:56 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF537326266
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 14:51:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20DE1320F430
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 13:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E26FA2472A2;
	Wed, 25 Mar 2026 13:32:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDEB238166
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 13:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774445544; cv=none; b=bzCSe+EfZ2Yl4K7siLQQyIpJHUsY2xqjp7KkneJu+Szk4dqWBv3lrFp/wvT9xekLZkBAuMNKp/tggg7oOrMIay4Mrfj3qj0SD8tP9eECKJW3qutUfVNlOe8BC0B2lk7INfFYOGfEOV/vZVW/YRzz4FmJmsrv65FjKhUEWaGQxw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774445544; c=relaxed/simple;
	bh=rkpIXgDQz1UgC1XYYX1tm6OOg5kF5dWhygEa7cgINow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GQasSj8vOKMYg4xSZiSOJsE5Ndo1Cvp4UGxwpyonfROE41/PbL4NfEAe/WpqeMrrHovrdac4z5UjJLauMBZ+QwcjUfhlhWgMkzFMp4UkrdgHUX25P+4OMGomdBTLzNyLka2DdpJQKnN85ZmadHbJ1jmSjS0DcQgaf0c1YuV6DuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-667de793310so4430348a12.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 06:32:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774445542; x=1775050342;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71PZmwBCGt13+2E2u4S7ZamRqElFJ3XFkvVJ95R0Un4=;
        b=b4+TXxECdhWtbelB5+3IP3g14GblNw+o9u7Tsbw1/i+pA9w3Atut/cZDvvLJF6uQ+a
         z4kIxO/U12ob6nBD4iq40uAv01V+N3h5ZqEWnIz4kn9etDALokZN3KTqozc9eIvzaLDN
         yZhjmo+kEn1qRndb0OQ1mQFbemjR/5xKwnR8JT5Tzv2iIPah1qVL4x/0jOb4Cjte2ibh
         yQKJOp1Ve95L57YAaLxziwaStzHLvo1ogYE16VclDRa1JW3a+9XqsAu6ggpmsdxn7JHG
         I9cFsbho6PHXjkwb+CvYxG9T5UmCAUy48vl1x812TdwMeKe2PIybNqp8fbqcmVMHnTfa
         9sYQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2VPkDYRcU2vrxOJ465bcqZnuz+Ad5vDVVphaJCbuoTS5xYZA+w5HuDqfphBYDfV3fgEqS7HNjYmXkGirSyQmrzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvF3AIPm5qR7dIaDTK5F2JycPrUHZOtGBPPvhEKia2z/e/dBmI
	3qFkJjnevbpwLQezmDTmEZJmPm5d/bs3s2omaeXNdps1I1v9rYJN70Z6J/nGFfkdfJg=
X-Gm-Gg: ATEYQzzZTwlhqzxX+st+VfWOqZTQpxWGzVfAJXrgQwUfFCnE9nubQBgbQWJUO6ISki+
	KSA2N0Mht/iqtbqr9ec1JVZXxmDAcYClnkfG0PZSwQ3QsvPaEt5+W3Dec8HCxaBY+HFG7raLW7j
	iKbkPG1lpbCW1765TbjJtiliSQvExAtsBFzkgCsC/i0Pg2ZL8SRrTJRXbOMc2t5+agFMbDL/AD+
	KI2cEeJyClAHEZAdFfeLF+4AD/dozcx+/LY1RagwArmK/eI1YxQZw/CAZO1JNXI0HQ/4+pPBaxL
	qmvOdgIsMVza2Vn9PHWu5OE4LCjMx3wKxaV1n+wbl2UaVXi85mk7YVrdDCQCNyzsYnoT+XAifR+
	MC/S9goy3i/vGvKtnveSPBsvoeFdeYngw+mr23LzbhHB509f8ID5l8rVI1B8KxftIMCMLQq88+q
	U86gRb0Nhm2nnYTUSbAPkHsfcopDfFRYN35yRrlFpV7i/6EVIG8zmGlqa2tf8t
X-Received: by 2002:a17:907:61a3:b0:b99:1074:74f with SMTP id a640c23a62f3a-b9a54238966mr181628966b.34.1774445541617;
        Wed, 25 Mar 2026 06:32:21 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832fd7147sm791842666b.27.2026.03.25.06.32.19
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 06:32:21 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-668d70fabc4so4725056a12.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 06:32:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUka1RTE8cwrlsLqFfwkTfHYbBqTncux1TVcdY0ZKJjd/vqK22lRZKuLCRO8sNFobKaWzzA1661a97VpcEJhlj61Q==@vger.kernel.org
X-Received: by 2002:a17:907:c08:b0:b98:6984:661c with SMTP id
 a640c23a62f3a-b9a3f14900fmr255405366b.10.1774445539317; Wed, 25 Mar 2026
 06:32:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320025328.509003-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260320025328.509003-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 14:32:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWO9Qc=mn1SAwZt1HJK2VkU++G_8N+eVuN5AWTrLnVxUQ@mail.gmail.com>
X-Gm-Features: AQROBzATJnixo_UeI8ufWETnQDalm61zGkrEBTKZCHPPX7aWGGL_4MFy_z_N-QI
Message-ID: <CAMuHMdWO9Qc=mn1SAwZt1HJK2VkU++G_8N+eVuN5AWTrLnVxUQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Add overlay for Olimex
 MIPI-HDMI adapter
To: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Scott Murray <scott.murray@konsulko.com>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-30246-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,glider.be:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:email,linux-m68k.org:email,olimex.com:url]
X-Rspamd-Queue-Id: BF537326266
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Marek, Scott,

On Fri, 20 Mar 2026 at 03:53, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
>
> From: Scott Murray <scott.murray@konsulko.com>
>
> Add a DT overlay to bind the Olimex MIPI-HDMI dual-lane DSI-to-HDMI adapter
> on the Retronix R-Car V4H Sparrow Hawk board.
>
> Current device link is at https://www.olimex.com/Products/IoT/ESP32-P4/MIPI-HDMI/open-source-hardware
>
> Signed-off-by: Scott Murray <scott.murray@konsulko.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-olimex-dsi-hdmi.dtso
> @@ -0,0 +1,94 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Overlay for Olimex MIPI-HDMI adapter connected to J4:DSI
> + * on R-Car V4H ES3.0 Sparrow Hawk board
> + *
> + * Copyright (C) 2026 Scott Murray <scott.murray@konsulko.com>
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>

This include is not needed, so I will drop it while applying.

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

