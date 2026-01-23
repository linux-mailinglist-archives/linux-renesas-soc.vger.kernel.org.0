Return-Path: <linux-renesas-soc+bounces-27329-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFEbO1d4c2kfwAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27329-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 14:32:07 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A7E7646B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 14:32:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B58C302802E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 13:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 639AB231845;
	Fri, 23 Jan 2026 13:32:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD3C234984
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 13:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769175120; cv=none; b=Bb7GlBkEu/Xp3fAafuF7xiQCAps1W3gBbJjJHAh/WOTPueWXEvbzEG22sjsZPk+ZZveXjXcX2EU9ncRSQrzCgNyaI30IXG0LHtfLOXsJyMjpxyJ0IRbQAEuINnZO2Q77pZLOAFgznNY3yt4ctnchYRVFp/FireWaMkf0DyKn5Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769175120; c=relaxed/simple;
	bh=YGWx7W4coTEOQGPVsFtw2NFIdIsKyCShVU2lesOZnOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hWpFPodrOf8wOzpwwBtNPkGHx4jK2ByxIQeL44kNBG0wW6wcnOtzIjyUp6l/aOEGrCSlHY5q4YnVylUsLiZy18QUaKT4yCKnLQsSlHY0z22DrckXXnmAPV8JJmG284U7Gt542ZlNUlrPSqgRbjteaQGVEXFA5/XFjNA+qZffLuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9480c6f8b43so594267241.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 05:31:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769175118; x=1769779918;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RpS2H3SdIy7+x5vUo7+a2x6ndejrFYA8bNDO09Q1vNI=;
        b=PknZl4618qPoewZsp6vaCBZop6VUl5HlMZyZaq6viZgj6GsI7MfPSdnVAPVHSqXzA9
         qRnE6RH2NdG27eFAFTn7rxm3/t7saERzKRvFMBgOaHpvurFliktGWBROMaqQuLoNWc8F
         EPaWswy2mr1w9gkPRpgZyNZNmPzeCJSWX9MVi/UN2zYcEy2xYCQwRhvHVUP61Rk2Spka
         3X2l1L0Kr8fFffO0Au3RObif8qo0xPq8idHgBwFsjurmiNCtKiGqmAEo4yC69KrdQm2L
         Fk+a3pOV1R7ljW3jR5d25o4iTLdty/reXEtnCfOInVGZUfNKZb8hztYJ+9yAJTCJpCLL
         LbYA==
X-Forwarded-Encrypted: i=1; AJvYcCWGh+VU8coVW2/yODIRLUnEn93VDhpVKX0NfdgoeKPy0Bumml4FfzDWyqbu4VjxV2qGgt2lkCYz/39c4FriZz/Weg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxX0BP2bJRd0fjARbizI/LyXAWL82q1AGsZTfbT1e4x12+T7QE9
	lBOjnCoPlsddiuuYRLh/36yG3J4QNMZDe5Mxs3KM2VF9cHzPhy46VwatWmlNwrC/
X-Gm-Gg: AZuq6aJIc+DQYcy78TaPVS3H0BSBJA2C8mCfxBVWygSUm1eMm3oXLnrOskGvwmqSQXI
	hnwNDvx3jTlUDvIWc/DRaO5roy/lP85iQ+HeliSqRPooNy6shYo4CpuPA35kp62SQt4AwW5Hwyq
	Y2Em/nNA4O93J7ZiEnTv5jj86QDHjnHf+WXCvGtQwxL+mCf5qR9DFoZM4zzfeQQwlejP2RCVYmT
	qSNC/+0MkGKPDbKZS9CE5j3ZVwSJQT9SZv8q3ytvKr/ywQNRQJy3VQDMzgQQ6NHynZWLyi7+CxO
	0EzQlPlLqzJ5Ym5dkRv1U5sOFwFweD3mLJ6gNUVMubqlQ/7ErTWc4ABUrRERVuUuaJ1BROZl6np
	0LAcSh1tBHoKLiiNpi2wE1NT3yQly1T0vEo4DdhfvBoOISrWo5vgVPipcnxAVR7XXgmKv6i9YHQ
	PFpnwiJTR6P4hYbU3eW7KI7Sd+mnJD9xUPfuHqulqzJVNrAkIznhtwFUMSxDE=
X-Received: by 2002:a05:6102:1629:b0:5ef:a346:a020 with SMTP id ada2fe7eead31-5f558517664mr293823137.17.1769175118125;
        Fri, 23 Jan 2026 05:31:58 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f54d4632cbsm555869137.8.2026.01.23.05.31.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 05:31:56 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-941275fece4so439222241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 05:31:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWXEZ/3UZ5BwE1zXi9/MErfttYo4V5OWwXljDoaSpswMy51HErbESz6J4rAfvMToZMSVbW+3aL1yNbWDcmAkmmP+A==@vger.kernel.org
X-Received: by 2002:a05:6102:cd0:b0:5ea:67f4:c1ad with SMTP id
 ada2fe7eead31-5f5586773e5mr314116137.21.1769175115274; Fri, 23 Jan 2026
 05:31:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org> <20260118135038.8033-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260118135038.8033-6-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Jan 2026 14:31:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUFjfe-3YTBQ37bbfgH5xXf_1cQZ8_58vLCQNc=5caF1g@mail.gmail.com>
X-Gm-Features: AZwV_Qhn6Z025XcB1tu3nu-plKR7LvAJNMlqwBqF2kc7a-H-YRSLtx_zGjZz-tc
Message-ID: <CAMuHMdUFjfe-3YTBQ37bbfgH5xXf_1cQZ8_58vLCQNc=5caF1g@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] arm64: dts: renesas: r8a77990: Describe PCIe root port
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,linaro.org,renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-27329-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.989];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,glider.be:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Queue-Id: 68A7E7646B
X-Rspamd-Action: no action

On Sun, 18 Jan 2026 at 14:51, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add node which describes the root port in the PCIe controller DT node.
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

