Return-Path: <linux-renesas-soc+bounces-29780-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBc5LKmyumlmawIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29780-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 15:11:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2502BCC6E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 15:11:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0835E3290ECA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 13:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A49A3DBD45;
	Wed, 18 Mar 2026 13:53:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC086390C97
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 13:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841988; cv=none; b=KiVblDS9qnVCghqIB48/FbRKC6aNjJ23Tsoayzp8jRtrwD9PCEuC9Mbeow50kXa20Prw2gL14e8CoTzPFH8+Jj3Gm+S8SdllY92166bjMWhvOGBeRtwNAcfLDafnJCcuXn6Px98JZEX6SquRKsNcQYy05wBZAPBad0f9zyV8R0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841988; c=relaxed/simple;
	bh=Xrx3p6GjwbeMwcpjH5g7VGLEdLArDh49wPH4MF/vJRY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b6sLXJvdb7xy+k2Y77BO3DYQm+oRWgO6nnvzKxdTOu6dHMbbcWhx//UNCKC93SBaXh9cQ6YpB5M1XCIM+vK+SFO/utmdOmIakM50jbJLI3W/9RYJQ0SIRuk/ZpUGU+HyVJsE144c8mFPihTn9TGZ7qTs+QLUvQoHkwvFS80pj0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56b890d1687so2491951e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 06:53:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773841986; x=1774446786;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NSJQCWLDdC8QZhI2uaIgLda/zPgl7cbIArF59/GxqM8=;
        b=I7HDv4Bz15rZbkJXmxxReMgKmTGHrSVY8A143SSGRiQNR8r66WScahjIo13FfBUxP+
         W3QmwyiQcPaY5m/eIzRJgf3E7/pcBNrUG8WTXkEFqQwGowJF4PrKqKeFXFXydqREM7c8
         X2KX+y0K4sJI/zK94P0+SzvNZqVcc3yc0pB8T8UGdmKBTzwhG45mCpchdDiYbq4+7pbF
         x7PqgfeCZhiEj0ExmCjUw0nG3xPBAJGMRFh5vptmr585XV+VYiX20ShojXDZ0z4LyaRW
         WFFnfOGJSkGKrawtQx25iQV9G9Fbx2GeXWAFMIlXZhMYFpgUU81bcncqM34voXrlp2xz
         8TfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtMzgqPl0g8tmPRp0xQ+UNSUL0kF28v8pvvyKnhb2u9JQkg7+0Xg3I2MnWEdM9SPtQnF2dG/K/6P6Ot952RjTYsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwH5qg4Hr5mbIe7alnts45GchMzYo2D/8PHCTOofkMtlWnBQF5R
	Qd8cQMCVNVC27Gy8DM/4ocbNhsKIsFxjR7SYtlAbVNN8eV/Q4+KRjQ0ajBIjdlU4IqI=
X-Gm-Gg: ATEYQzx5yYnONCMH3E9N8Xz4mVYfSXmOkRhOGB9oYzZUNzQ135EqaS58LU/zQ/xrOYl
	i/D6rsaO1pZHndM4YTqPTMYEEPIyW7yFulGeb4g8t3eOV7smTaQEcp/KgXyZKkZCElvHZzrP6Cv
	Iy6im4LFewagrJ65PvrB+Z0nJiXG1MMLM6LtspSbnvbLaXdbbeMYbUi99UZEqhEoxzZt0NRNlO6
	AOQpxJr2wkzfbxj/P3+B3z0lsv4c10WcX+JR/PDxxJUIbXiDkPOSfHDyN3fLY5/g+0ByVTQQ1lF
	pFgl8qBCqzCllE3cdxzGqLqXF8HcjrqL8O1T+zSBNzbID/45lK3xcEjLJr3C9VN8RqNzuOXNCHm
	X5PrhDsq5NGJEL95RfC5Pqkfllq8G/GTo9PeiltLz0uiMW9O6nArY8bu/dmqakBoD3xV5ikdVZk
	fa97PAjdR/FVoAdJhBzsIlbJfHIWe+N3i+qm9+I94e9WuGK/DRGl3OM9hnYFAY
X-Received: by 2002:a05:6123:49:b0:56b:95cf:e9ef with SMTP id 71dfb90a1353d-56ba71d27aemr1860230e0c.16.1773841985797;
        Wed, 18 Mar 2026 06:53:05 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56ba6e737cfsm1635347e0c.6.2026.03.18.06.53.04
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 06:53:05 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5ffabb1dfbaso3768677137.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 06:53:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXIvRrLefDGNVMemZMSCrJCfNCUIASuwoZePbHMnxAvNZZQgckRLr4gpLsY1+rMXy9fGSGwhJS+Bt8ajiXsbouGtA==@vger.kernel.org
X-Received: by 2002:a05:6102:c05:b0:5f7:307e:80d9 with SMTP id
 ada2fe7eead31-6027d38adaemr1718902137.28.1773841984432; Wed, 18 Mar 2026
 06:53:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312160407.3387840-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260312160407.3387840-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260312160407.3387840-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Mar 2026 14:52:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU4MGpKEXC_b4KwmmbUmT-Pn2uZzexLwK_u+k7P7UO8_g@mail.gmail.com>
X-Gm-Features: AaiRm53fXg7MWpSDezkfJaNcTrAFPZdVPLUCc8GkMnQppM2uhe9tRQPMBRntQ28
Message-ID: <CAMuHMdU4MGpKEXC_b4KwmmbUmT-Pn2uZzexLwK_u+k7P7UO8_g@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g087m44-rzn2h-evk: Add PHY
 interrupt support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com,renesas.com];
	TAGGED_FROM(0.00)[bounces-29780-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.996];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,renesas.com:email,linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email]
X-Rspamd-Queue-Id: 0B2502BCC6E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 12 Mar 2026 at 17:04, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add interrupt support for the GMAC1 and GMAC2 PHYs on the RZ/N2H EVK
> board. The PHYs are connected to the ICU via IRQ14 and IRQ15 lines
> respectively.
>
> Define RZN2H_IRQxx macros in the SoC DTSI to map the ICU IRQ_NS lines
> to their absolute ICU interrupt space offsets.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

