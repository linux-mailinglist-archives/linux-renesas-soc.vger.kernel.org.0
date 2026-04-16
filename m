Return-Path: <linux-renesas-soc+bounces-31332-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBIcJp8C4WmJoQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31332-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 17:39:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 051C54110AB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 17:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2E3931170E1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 15:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C1B3A6EF6;
	Thu, 16 Apr 2026 15:36:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9976D3E025E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2026 15:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776353803; cv=none; b=HkV7Kqo6i4n3SIVsO745sqUmVwOea4rEihUsO5/HPk0vcxymQPNW8Fd2B7g5kj8JiWiPTkRKArC59J3eo66SnP6frdrrE+jUKVglCdFhlbTjKFyQhpILwbIO3uQxGHa5sMOzHSjqQJ7B1IFjZ0x6R5qGmeSOE4GlALSg1xb0xfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776353803; c=relaxed/simple;
	bh=3zXFv8Rd4128OvOeNBR/WmSdkPXBPE4BiGO1fVwauR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VArWwDvryVh9t5Ef+KwHj7RRRn2eqLRh9tTIEBA98YlAevvspwUSP98mq0IJFZCJcMomkt8lVLzToQEsdIs1tMdX//UAwwOaEWWUPHKR0jFEmpxY+uIqdeYQHOFrGbpr16JqG9o4nsHgjov+gpNX1txVZymyCvfkz6DM+2dE0j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-606045ef716so4419312137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2026 08:36:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776353799; x=1776958599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8zH9hi6FYBeNQQuf6UwLY9hmQzsEbubp5EckZRTMdhg=;
        b=aUleNruoj0GHw66Z/I+LF86lf1B4OEHQ17z0L1hg0lNTHXoSUMujGK8sZamxG2vRIl
         nIeA3Omx69l8Wr+p/Qbirhli5p2l7fVVTM5fELRLS0z/xsk1ZXFAwC/xwTHJFsmqdsQ+
         PgX/PRM6DozxeWmSsz4kpDFLUbwuLFDfTUHqBAdAKTQ/UNU4+rKLuYIyaULOq4Q53oDv
         pYvjb2v2n/vVoyh5a2ETiSWowlLg7htsthVdb3SepwHO4icwqgYaGD4BvjGG/b1EA3HO
         0/Jp4i1acqSohLZKqzhV3rpWZXzm8BHqsi418e0t64UKmzMu3brk/mUKBtS683r+SLDQ
         56ZA==
X-Gm-Message-State: AOJu0YwIcVP8P6mSJGDD72k6C6xlBfSe4lHq8O+vpg8SxZs0EH73kZPC
	tbWbdPoBr4dlIsmsvmkehH4t2GfxyAjpOdhI6JMtfD+5lVgy7ASCWS1sshhBNOWd
X-Gm-Gg: AeBDievPsY0I1huktIX3iDpgQksdbPxBLIIZdUV4KqZu8j68CJuQl9vNYWzgtid/B2c
	8sAk+fYRDJIOo8c2XBYTaHGn/Epplp/M+fD/LpzuFX/VupTz7YkniQRfcyaZauqs+hRpmnWdZkL
	YeC/PEner0zJ8YgzlQ2M3u+1+XBobVT/K93UOL+S3KwzBR8zlWc2SRLKcqakLM7jPOF6sYjBTTg
	MP5PP6Ml8jbM9AfZiQhFrHKItfJsg6+/wdfXdcAwUN15PJHvstFLAnSvBLuEgq7/vqB/OFBT2QV
	oNChzPGYMmle/gVpiWwQ6reOwy1Aa8HxhYNYFCxFHi0C3KRe7Ep0nQjc5wEyzFuxQo90U2AKTGM
	K1TBqUz1Lhiqr+Xmi/i5U7+bZ2VF91uT5GEtVyOff/PT0aP9pubFk2vnoW8PExc5NAgWOTe3HDm
	Nm9gWKxmg44cg8tyoTCErPVNNJfp4nT450VeW4zMC86f175/H4tSuoy/Ymbp1FAHLHDV2vCHzbd
	U4=
X-Received: by 2002:a05:6102:c89:b0:611:e0c2:1603 with SMTP id ada2fe7eead31-611e0c21d01mr5725718137.20.1776353799365;
        Thu, 16 Apr 2026 08:36:39 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-61677dbf1c3sm105587137.9.2026.04.16.08.36.39
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 08:36:39 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56a8e0ea02aso7997477e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2026 08:36:39 -0700 (PDT)
X-Received: by 2002:a05:6122:828d:b0:56c:d862:37dd with SMTP id
 71dfb90a1353d-56f3bd131camr14190502e0c.14.1776353798877; Thu, 16 Apr 2026
 08:36:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <459d360a8332f92b3766b30814e7e1c76169aaf7.1767719254.git.geert+renesas@glider.be>
In-Reply-To: <459d360a8332f92b3766b30814e7e1c76169aaf7.1767719254.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 17:36:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVOQX5LLWPxhXdg7ZsnbKF6qW3OOz5Gu2j95ij50aJt6w@mail.gmail.com>
X-Gm-Features: AQROBzCrrciH5Y9cjKT2tkJaRWMpjlRUqFQfN6t5xgfDiDoLUiDQUyEP54r5jSM
Message-ID: <CAMuHMdVOQX5LLWPxhXdg7ZsnbKF6qW3OOz5Gu2j95ij50aJt6w@mail.gmail.com>
Subject: Re: [PATCH/RFT] arm64: dts: renesas: r8a78000: Fix SCIF brg_int clocks
To: Khanh Le <khanh.le.xr@renesas.com>, Vinh Nguyen <vinh.nguyen.xz@renesas.com>, 
	Phong Hoang <phong.hoang.wz@renesas.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31332-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[renesas.com,gmail.com];
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
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,linux-m68k.org:email,glider.be:email]
X-Rspamd-Queue-Id: 051C54110AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 6 Jan 2026 at 18:09, Geert Uytterhoeven <geert+renesas@glider.be> w=
rote:
> According to the documentation, the internal clock input for the BRG is
> SGASYNCD4_PERW_BUS=CF=86.
>
> Fixes: c13a643e2c491f5b ("arm64: dts: renesas: Add R8A78000 SoC support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Untested due to lack of access of local hardware.
>
> This is consistent with SCIF on other SOCs, where fck typically runs at
> 1/4 of the speed of brg_int.
>
> The correctness of the clock rates of the various clock sources can be
> tested by forcing the use of  "fck", "brg_int" or "scif_clk", by
> commenting out all but one of the four blocks below the "There can be
> multiple sources for the sampling clock" in drivers/tty/serial/sh-sci.c.

Confirmed on actual hardware, will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

