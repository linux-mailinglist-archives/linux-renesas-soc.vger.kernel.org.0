Return-Path: <linux-renesas-soc+bounces-28426-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CzBHICJnWnBQQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28426-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 12:20:32 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C61186159
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 12:20:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 926033062525
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 11:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 369CC37C0E6;
	Tue, 24 Feb 2026 11:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ec1Ad9rB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119C937BE83
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Feb 2026 11:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771931960; cv=none; b=NUoUjySs71xB7PWQrIUHBJcZkhQ/5Ik9/gcFeAkAX9+w3+3+JyN1yTCI5vE6lssUiwfx1UtEP1MfYyb6cGS/1ZaiZMNaTqrrkm+RrJMNo0SzJWOjNOZrTLJ2aClkW0ZHLukv2p82AvA0APV25DqTX2tPvVt1E3MDQwbdUgxnCb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771931960; c=relaxed/simple;
	bh=B5BzWRm+eShin5kvq4aIMD1wYheUUZDI+gvled/jh1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gadB8KjkHL14pKzqBN7QdXo9uwBOQN9F5/RC0PA+iyssBynE2JpBPyaRCyjhkt757u/Wr8Ss7rC3/881iwNfO4F2fMC+F6I5KQRzSKj+H9+dzpoMei1IkqqzvuGdZyIICwsheKwQgx2xRqotHqCzk94VTI3Npylkz3M9m4MFxoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ec1Ad9rB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D77A9C2BCB6
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Feb 2026 11:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771931959;
	bh=B5BzWRm+eShin5kvq4aIMD1wYheUUZDI+gvled/jh1k=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=ec1Ad9rBGzW4ziKtYVy9VgteB4iquKM5tiiK76ayw7TSXjyfZqSM984jZYB+hudq3
	 4erjiwp9x0G29uYKomhukDaq52V8ENp3Ovj+DXBJPABve4u5c61ycvUxQJ806cbJKU
	 VI4jAUp3pHXtV7FAczbZFyWoB+iucpnPf+BKDMfRy40CE735aUY1/RVSGJJx983Pjg
	 qPn/BfL6zmsJys0v1fTUJAoX+PdhmHpmajUUYj5fy59Bp/gDgnWtmby8+Sm82OApUu
	 WUon+WH9alNLSf3Ig0ngIs8Ub1nLZIQm3yNfrW3h9KwLRLvYEk4y/pTF076Y2AI74M
	 t9I7T49Q2tgdw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59e65b8e268so5479207e87.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Feb 2026 03:19:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUC2dWJPjDPQMOLvOxooijazNU+eBb8OWU2eABcasBti3VUC8HEIh2dR8xgTu2GU8ARn3dckseuFq9tmJWL8kR66w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9fcS8EOWWuw5/rtf6VXbS2d2KYh58YETOP89/TUvrbaQFCqql
	MP1PM4dK3ShmRob0bEfw2kVVRPphAk5/z/hog55YMDwbk40X3TfJeqOIznk5ZU7bgKvuut/yfC3
	QnQIeZ6PL+Xk5+gmllLlm7NCouReBgfU=
X-Received: by 2002:a05:6512:334b:b0:59e:5fc4:26b2 with SMTP id
 2adb3069b0e04-5a0ed83e246mr3961609e87.0.1771931958134; Tue, 24 Feb 2026
 03:19:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260215100302.136719-1-work@onurozkan.dev>
In-Reply-To: <20260215100302.136719-1-work@onurozkan.dev>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 24 Feb 2026 19:19:04 +0800
X-Gmail-Original-Message-ID: <CAGb2v65ADpZYcwG+nd6sDE3j-wc7v5LEQft9tkbxDh7C-MnziA@mail.gmail.com>
X-Gm-Features: AaiRm51ME-8YiE4AvLn72GWWw2sauxN-ScuBUrDsWnKr42ng_6yKdEudjebdqcE
Message-ID: <CAGb2v65ADpZYcwG+nd6sDE3j-wc7v5LEQft9tkbxDh7C-MnziA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] arm64: dts: add missing sram-supply to mali gpu nodes
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28426-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,sholland.org,samsung.com,collabora.com,glider.be,sntech.de,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-renesas-soc@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	HAS_REPLYTO(0.00)[wens@kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,onurozkan.dev:email]
X-Rspamd-Queue-Id: 98C61186159
X-Rspamd-Action: no action

On Sun, Feb 15, 2026 at 6:04=E2=80=AFPM Onur =C3=96zkan <work@onurozkan.dev=
> wrote:
>
> Some arm64 Mali GPU DT nodes define mali-supply but
> are missing sram-supply.
>
> As discussed in [1], sram-supply should be explicitly
> defined for all relevant compatibles. If there is no
> separate SRAM rail, it can reference the same regulator
> as mali-supply.
>
> This change adds the missing sram-supply properties to
> affected DT files. This aligns DTs with expected regulator
> modeling and avoids relying on implicit fallback behavior.
>
> [1]: https://lore.kernel.org/all/20260213155937.6af75786@nimda/
>
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts          | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dts               | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts          | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts           | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi            | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts             | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi               | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi   | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts     | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts           | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h618-longan-module-3h.dtsi  | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts    | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts     | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts  | 1 +
>  .../boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts      | 1 +
>  arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts          | 1 +
>  arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts           | 1 +
>  arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts          | 1 +
>  arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts        | 1 +

We don't know the internals of these SoCs, even though said power is
likely from the same regulator, as that rail provides power to most
of the SoC. But I would rather not speculate.

I think these systems are at the other end of the spectrum: the power
rail for the GPU and the rest of the SoC is simply never turned off.
Neither is DVFS available. In theory you could make it work, but the
voltage range is fixed so there is little savings to be had.


ChenYu

