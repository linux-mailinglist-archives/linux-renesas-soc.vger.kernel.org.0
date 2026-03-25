Return-Path: <linux-renesas-soc+bounces-30241-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHONID/kw2lvugQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30241-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 14:33:51 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5A9325DA5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 14:33:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 419103009F1A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 13:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F9543D7D8C;
	Wed, 25 Mar 2026 13:09:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408C63D5248
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 13:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774444159; cv=none; b=OV3RA0rIHhanO62wsKOgnweYrvsvkA3FhfYO2a9vcn2ik6Rt2tVqAehcbQi/D88hl6UsWr3g5LhSYFeQPt9UhubVY7aaKi/wTCJt/wSiRdy0pWRmghHrUnrIV0aE7Vm44Tl9Jd5Sht900gIolTVyuKEL65IyuEJaXCOiQCPgn0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774444159; c=relaxed/simple;
	bh=5iPawtLo15CwqkkJmwsrHLhxOCNnGqzihkAjVkKHqY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sMdxe7H84Gi0QJZh1M4KvnSp2RCt1oZku4BlxaUSJTlFyAJzcfSqQMX5knHVwUVQOlUclffnGIJy8QCdNYcpUWp7/xgxisnWsF44qJb5wRlYSNFyre88ZieAuMZ18WmqAmAbiL7I7OSdoRo/q+06+wAqFPpN3kiGP1c9dBpjn2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b97c44417ffso558717166b.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 06:09:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774444154; x=1775048954;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ckxAXUDke0h5tovTl8PH/LMAmEb34wiiT3UqWY7x06M=;
        b=NKiOptUxXvdJVemcHlIWajVj25B2Qc5it9S9RE77xSokhYIwmozNcohIK7uYve+6P1
         +VVOzpFH1WTPj/vjQkEY/B0rtjd499nUdrm/rGjhr/TIBbCmcxeqrU7Jzflej/2tCv57
         Jk+u+NXPA0kb50ft/8whyoeysHHlDFR+h+4AoujEGOYyHW01hNWEpc23jirlzD/MJpNY
         26OP26qFuTNlF5RjqGcG/6HEagefXh0WLYGtb4qfNKnVHxsx3x9Up4grftL5qZQ+pxKW
         Zu4mAQgKfc7vPVKVH4hSuoSBX3RljHzx5VYGce0fAxJGIWxxFCCmUsLzQte2bxHVl0eF
         MT2g==
X-Forwarded-Encrypted: i=1; AJvYcCXiHmDDNa/1EX08s+us+ykvq93PNCOs72BDJn7W6Pt+ToHntgLioznZSAEufQhPPjjXbn+trN5roUe/pHbd+h/X0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YypX7qXKkbqtQGnAcktUDQhgyQSQvt+pm0WTp+TF224OF+Adp6E
	OIHCTRyt1ZdxvhE0BUW41RbRW45VXmJ4xz9qgaN2xWXOVh8yZKTSEeqoI1C4hnFdJw0=
X-Gm-Gg: ATEYQzx0R1cSXFBUGXLUwaizTYIr4u/dKgCz1y3anL8xi4l+utW/loaWuD9yom6Vp/U
	8mFCMNx/dD0oB3YGfJturFvIPjxz7JFlumnOwOGOBYFfNr+5Pe2oXDOYvGixisMW9ZtMia2vySq
	elZcJCNgn81RSZvoCmuSBb356UJn+uNqb86LyUMaGsSl1YOT7h3oShqZfP2ysA/nWvSOE7ALNTj
	ym+6qUIU5wuEcu3WQrCPZPOyP24zDmWvRLvMEZGMLBP0Mu9J44ufDEA5W0HKY1us8eNZsFuwPOy
	z+1hxThbQo3X1uzItJlA1p+lozHkg1hc0y/FKAOG+f0fbc4/5/os9j9ya+rCBsIsXhJiMr5wwZJ
	zamFQjPUnakINhytADLR5zddBxzsOYrvlIgs2f3EvxSquM9M4gEz4AWQM/PD7a+u3H/ZaIa62du
	BcCWHrB5HnWT8CMI7+8X7tZbtAa43nbd6kbFHtw5OyK8CatNCTlwOn5FelAbBi
X-Received: by 2002:a17:907:cc1e:b0:b96:e593:fd32 with SMTP id a640c23a62f3a-b9a3f16148amr162291366b.12.1774444154443;
        Wed, 25 Mar 2026 06:09:14 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66a33e0fb64sm2131258a12.12.2026.03.25.06.09.12
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 06:09:12 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-66a922a3a05so849059a12.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 06:09:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV62PWlMrFOPDdlNHNFirTfW2Lh7e7dtycqI0bXMDFJO19/yp5EKok2RndTPiBpcgo8bBnUv1SytS3zNvstsfaemw==@vger.kernel.org
X-Received: by 2002:a05:6402:458d:b0:66a:3390:30bc with SMTP id
 4fb4d7f45d1cf-66a826728a0mr2218507a12.15.1774444152446; Wed, 25 Mar 2026
 06:09:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324143342.17872-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260324143342.17872-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 14:08:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVv5KUma8=2T+ibnXyH+45xvqVrQaPho0CSzP1_r+j_hQ@mail.gmail.com>
X-Gm-Features: AQROBzDnZXf3SxdSqv07tNfP3QRyp5IV9cnubTU8PQao0RladIsBN2aCe5n6Z3Y
Message-ID: <CAMuHMdVv5KUma8=2T+ibnXyH+45xvqVrQaPho0CSzP1_r+j_hQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Reserve first 128 MiB
 of DRAM
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,vger.kernel.org,kernel.org,glider.be,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-30241-lists,linux-renesas-soc=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[2.98.90.0:email];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,mailbox.org:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,glider.be:email,35.195.70.0:email]
X-Rspamd-Queue-Id: EF5A9325DA5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Marek,

On Tue, 24 Mar 2026 at 15:33, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Mark the first 128 MiB of DRAM as reserved. The first 128 MiB of DRAM
> may optionally be used by TFA and other firmware for its own purposes,
> and in such case, Linux must not use this memory.
>
> On this platform, U-Boot runs in EL3 and starts TFA BL31 and Linux from
> a single combined fitImage. U-Boot has full access to all memory in the
> 0x40000000..0xbfffffff range, as well memory in the memory banks in the
> 64-bit address ranges, and therefore U-Boot patches this full complete
> view of platform memory layout into the DT that is passed to the next
> stage.
>
> The next stage is TFA BL31 and then the Linux kernel. The TFA BL31 does
> not modify the DT passed from U-Boot to TFA BL31 and then to Linux with
> any new reserved-memory {} node to reserve memory areas used by the TFA
> BL31 to prevent the next stage from using those areas, which lets Linux
> to use all of the available DRAM as described in the DT that was passed
> in by U-Boot, including the areas that are newly utilized by TFA BL31.
>
> In case of high DRAM utilization, for example in case of four instances
> of "memtester 3900M" running in parallel, unless the memory used by TFA
> BL31 is properly reserved, Linux may use and corrupt the memory used by
> TFA BL31, which would often lead to system becoming unresponsive.
>
> Until TFA BL31 can properly fill its own reserved-memory node into the
> DT, and to assure older versions of TFA BL31 do not cause problems, add
> explicitly reserved-memory {} node which prevents Linux from using the
> first 128 MiB of DRAM.
>
> Note that TFA BL31 can be adjusted to use different memory areas, this
> newly added reserved-memory {} node follows longer-term practice on the
> R-Car SoCs where the first 128 MiB of DRAM is reserved for firmware use.
> In case user does modify TFA BL31 to use different memory ranges, they
> must either use a future version of TFA BL31 which properly patches a
> reserved-memory {} node into the DT, or they must adjust the address
> ranges of this reserved-memory {} node accordingly.
>
> Fixes: a719915e76f2 ("arm64: dts: renesas: r8a779g3: Add Retronix R-Car V4H Sparrow Hawk board support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
> @@ -118,6 +118,17 @@ memory@600000000 {
>                 reg = <0x6 0x00000000 0x1 0x00000000>;
>         };
>
> +       reserved-memory {
> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               ranges;
> +
> +               tfa@40000000 {
> +                       reg = <0x0 0x40000000 0x0 0x8000000>;
> +                       no-map;
> +               };
> +       };

Obviously I don't like this very much, but I agree there is not much
else we can do at this point.  Shall I add a

    /* Temporary workaround for broken TFA BL31 */

comment while applying?

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-fixes for v7.0.

> +
>         /* Page 27 / DSI to Display */
>         dp-con {
>                 compatible = "dp-connector";

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

