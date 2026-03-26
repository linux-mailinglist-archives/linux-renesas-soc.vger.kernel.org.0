Return-Path: <linux-renesas-soc+bounces-30358-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLsPLok+xWkU8wQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30358-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 15:11:21 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5619C3369C8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 15:11:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 435823014A08
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 14:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CAC737267B;
	Thu, 26 Mar 2026 14:11:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8813783B0
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 14:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774534270; cv=none; b=ajWq1/NkaEzZ0wf9rnsSm5Fv5HeF0HUNE/xAJU5Whi58hgJkcaMqxbgcTUvNb+J7UUTZ3W0KWYPV8rYWwoO0sorPsFq8nJdT/e5NmV79VKvW1csGxyNMZX1pkNAzM8KD7NiHWA6Oryam7cNRE5yw4bH0vgnQ+pnjxHPNk1qqYOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774534270; c=relaxed/simple;
	bh=mFU2c0LbIRehA7BI2cm6F9oxSoh6uyssNcntKmKFElY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oTTaDb9iLkRhQSzUX7tlPa1ZLRA29nkjOUJ0KHvboJMkEmtwVsjl8BPet6DfJg0tmufk5mB/5jwBJWzUGq2iXOYu1hMIKDH5yAxP3BUw3ezJCxlomUHFvHBi9EbnX9xWP8BDEcN4URkUo0Vg7S7jmOK+xpQhA8Ue+f3jim7cdH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56ce54c8c82so375418e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 07:11:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774534264; x=1775139064;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+bKV+ZQocjR4wxZ5VtPX9Yx9FjCc2fmvfO12wKPoP8=;
        b=ot1hMAKOcoQCIN7IowWiiJ79YZhRDjfpkEQwpAxIAdAHr4sUwb6113TfU7Y8gYlXpk
         SKnSBfFrW9DozASSpMhz0IhQWd10hTak5uC02c1TQ0EUX+TKNFIzfdS5hF9TObFApbgp
         ZlRsrK3TrBaiq03k/e4ROtJyd6OMa1yYHsdzkNnk7CR6ADBcmys+RbeGG3IUMxY/M/8L
         74Mp/f80eBu02TVPe2RatySWKhwgJzxIgDuIoRrVrfCtAzQZvL/LE+cbEJ+9zCqilxQ1
         PlN5w4NLOw8ewox1nedaO7cuQAMITHbBGKCYKloJ4QXvk5fX6Z35zduIHT3IiqnaJ0V6
         zJjA==
X-Forwarded-Encrypted: i=1; AJvYcCVh8shGopgap7+RSBqPui8xGnyrjZ6agwlxOTGsRpvOUHz1CRenGBiLfvueHa6ceCr/0l4lOlGem1/kS2zXYditXA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywww8oUCi36msYMrSJ+kSF8ABYLo7nYcxK/94uQFuDk7LxQWmBy
	W3r2iyN/PIYrYp/htfStkZGL4cld2OUzKDS6YQ60OwPxhsYvsE+Xw5Eb73ZykFGww2o=
X-Gm-Gg: ATEYQzwaN1ZVHyO+TAwlKS4s2AUyFZDbz1+nYkWHTcrxI+6wod8xCJhP+dP1WvvfWjp
	WoCspbOtoviygK9KkxFlMJbk9SQbfE4cpeYjxsBw+B9x+ucoq3G6PldQkXdZkndNWxS1ayUBM6r
	T7FSLR/aVy9/7mWGuScG8ksHEuLTJsbmHWlXBvPelbrCgXthXXyQzi94IBEcNe2rvpH84aRafAJ
	waLX28bXnNOUL0RNHQBes4/+QjmWhYeZIYqhfrGQ8wE+FFvOexJ87i3L8lXyusaqlnV5gJfxnZT
	DlsbLSFEnMQdiLUCnXbhLjrIbAUapdLU1MynH9kb9btwzO/kyjw15j8KS/m6UzIsKr+PbnleRba
	8goSipDEA067qL/EdXnIxaeVh0Sh8A3fKjwK1oRxR5LES8w2aubFJ1d9J7jH5D82pZUFyGpxgmz
	lFKK0jmdEzjVT+f1/n4Zjy8EdLIiage9SMjnTsUSzFI7+bbKOXz0zdUgKPN5gi
X-Received: by 2002:a05:6122:905:b0:56b:1042:a24a with SMTP id 71dfb90a1353d-56d220ba1fbmr3737397e0c.13.1774534263799;
        Thu, 26 Mar 2026 07:11:03 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31d71947sm4294847e0c.14.2026.03.26.07.11.02
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 07:11:02 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-94abd52b274so261785241.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 07:11:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWwCGlrtUgNx1nq45oD4C3xW1Yaocq571Me/NgXuYcUYo7+9RxKJ/3VkHdB3uaILUB1M25j+371BoQUcNDq9o8U6A==@vger.kernel.org
X-Received: by 2002:a05:6102:3976:b0:5ff:e769:44bb with SMTP id
 ada2fe7eead31-60387319018mr2792199137.30.1774534262074; Thu, 26 Mar 2026
 07:11:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320164158.487406-1-biju.das.jz@bp.renesas.com> <20260320164158.487406-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260320164158.487406-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 15:10:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWqgVmugEVV=k2_u1xKRswu+e8Hhi7dKD=E4Lep9S96OQ@mail.gmail.com>
X-Gm-Features: AQROBzCL0y_jZA3BBZ1V00Z_wgTT1ywsDaOPuag8T0_jf1tfWGKQ90rerqBeNPg
Message-ID: <CAMuHMdWqgVmugEVV=k2_u1xKRswu+e8Hhi7dKD=E4Lep9S96OQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: gpu: mali-bifrost: Add compatible for
 RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-30358-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,bp.renesas.com,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,renesas.com:email,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,glider.be:email]
X-Rspamd-Queue-Id: 5619C3369C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 20 Mar 2026 at 17:42, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add a compatible string for the Renesas RZ/G3L SoC variants that include a
> Mali-G31 GPU. These variants share the same restrictions on interrupts,
> clocks, and power domains as the RZ/G2L SoC, so extend the existing schema
> validation accordingly.
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

