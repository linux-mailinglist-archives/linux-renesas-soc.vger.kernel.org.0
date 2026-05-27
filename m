Return-Path: <linux-renesas-soc+bounces-33225-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDLYC9cVF2px3wcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33225-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 18:03:35 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C065E7663
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 18:03:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59555304BDA2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 15:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E947A3822BB;
	Wed, 27 May 2026 15:55:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5957C37CD45
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 15:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779897302; cv=none; b=dRvHVSdnFYpE5jvHr5nVjLtr0hN7oDDBd2pIPKbaHPGotWq6IHdk+YsU5/Pf9P7riloSO/jDww0Rc4jJJgkiOOsdQtPklYr32MP2oiOmYIms3+vb+2aIxLAL3kgJNsYkK+AiQZ27q6vsg9PDww5iGNQ+rXoJAy4mviqTb3VI5ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779897302; c=relaxed/simple;
	bh=zfaGEqI6chxhQqt73siO8PNnMavfdzhEHGno2Nsy2aU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I4n9fsuVWYMoKkhnqdw0zjy3MMoACQpztjhqlPG6FQ1cL4qDHczgOQMg1/31djtOPEDMyCJbIkiefiinpU6foWBsZMDPovHVTEWYAkAoggN+HBg98WS+J0xhhwHBf4bhwesPPLcJ2LSLNcvWN+qo4p+H8+YCTLtf2T9aXFhzYgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-67bfd0ec7f0so5007361137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 08:55:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779897300; x=1780502100;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4OvpwYv40ugn5nzb0kctzJjWJ4ravQczj2OqWNZz8Y4=;
        b=CvHn03Eql4tB6CjnvSjhQGsjJ1FmY/otxTK8/s+mBSt6Ki6Ac3/6wz5Cx2qfFLoA/e
         QALlKh8COISqTkqbfgc80ndQe5M2nH3tAFsN20xb6S+8wNPMbSibKkB+xvv9wEOx78tY
         RMWEw1LXvTykUgSOUITzIYFGJ3AFi2h+oGqM3EpvQKemmVxJIFCHkeTJXI/MZ7fupOMI
         g5b2o9BGitySOFjzKMJd6KYvCWm4oHjjMnNliRKdXjrkElVVXUKhcy2MU7EIKVO1evS+
         i2nU0D3rEXOf7w8M2gKkhVQJ2rHqcNmtrmb7pBbkCB5TQAAL0AxjRMNEJSfc0L5mwMxz
         VqgA==
X-Forwarded-Encrypted: i=1; AFNElJ+vwwk0zVyR/m865+u7TgWc6xBnuOzFR4puCMx4KZWKAwlhQ3nRqBQPgrMAKrskw0QbNMiVL/ek7ieVBijcBLv7/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYAAznI6Kkn/B2O3UxhohwwbJd+eAEVjGC10sRd1YRZ2fJ9+jf
	pqr+EKz4u9V1utJTUHbV0RNtEMkH2+PoCU2MqAscufbZqRphJyaGHg6PrxrrLg2S7uo=
X-Gm-Gg: Acq92OEbxID5ylorUeYsdrkhjyv2WAJfpqlpOfmnWrg65VnCKL5hECMXeqhHiddQoPH
	NMQxYtFkdb0bP7Z+SwbSZ3GpkWNZ4JGohY3UanJAWg1MZvEaOZ5Gu/QqMgoTWmCHBNKvaO06uD3
	oRhyGRLOpoj4eXnzJGjChe5bVckpclDdy9vzGmKLfc6XkViPOkLYchVqA5XvACYH0r1qOH9p4sW
	h0a0EOfSqS7iaCijO1tloxic1JJcMfgAX0YTNaIT8vgvpVjzRGFOJZjJBjtuTGcKvNvRSxAaQHO
	DrVBBNcMa65zqK0ibeKx0GVc50j053cBubp9lTfo/x4yI8ufoKO8ymk41R2ByJH2C+uhFy9c4de
	38eFpY/6drVi3Yxa8bvzQ1Ttj3p5bE/D0inW6kJ3E+8pZW9LOYDad/p8SrX6QF+IViQQ/UI6udS
	VpavpiYCdyj68lbx4a246h2qwe8kCmHB+JzslRww2+nWQjG5cykEGnfAg6H5T1
X-Received: by 2002:a05:6102:5114:b0:633:7d88:c77d with SMTP id ada2fe7eead31-67c90853280mr12902466137.29.1779897300187;
        Wed, 27 May 2026 08:55:00 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96173baf56bsm17452803241.13.2026.05.27.08.54.58
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 08:54:59 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-6314287380bso8718623137.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 08:54:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9lJupmxnB0ZCX0DYlD6L590bA07YHCL5CREidVX632vXpWkBWM2DWmbnj+9hDOFaFJPHNTkzbIHPwIepGdCG+B0A==@vger.kernel.org
X-Received: by 2002:a05:6102:1494:b0:631:28c1:154e with SMTP id
 ada2fe7eead31-67c89aac621mr14097897137.16.1779897298730; Wed, 27 May 2026
 08:54:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505123708.134069-1-biju.das.jz@bp.renesas.com> <20260505123708.134069-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260505123708.134069-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 17:54:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV49XYzD9fog1z9skeWXfkYLTKfNByMYbY9NeDMPD8Awg@mail.gmail.com>
X-Gm-Features: AVHnY4K7YiBz400JWSj4tz7v_P3t75Z4hEgU8IL8Jk593kb3giueL-NSNFJMwvY
Message-ID: <CAMuHMdV49XYzD9fog1z9skeWXfkYLTKfNByMYbY9NeDMPD8Awg@mail.gmail.com>
Subject: Re: [PATCH 1/5] arm64: dts: renesas: r9a08g046: Add DMAC node
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33225-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.983];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,glider.be:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux-m68k.org:email,renesas.com:email]
X-Rspamd-Queue-Id: 40C065E7663
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 5 May 2026 at 14:37, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add the DMA controller device tree node for the RZ/G3L (r9a08g046) SoC.
>
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

