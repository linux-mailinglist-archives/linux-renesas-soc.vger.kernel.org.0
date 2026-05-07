Return-Path: <linux-renesas-soc+bounces-32211-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEgiK81h/Gm7OwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32211-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 11:56:29 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CF14E6536
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 11:56:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B26D8303D4F0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 09:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8F7B3C7E0E;
	Thu,  7 May 2026 09:52:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B0D372B28
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 May 2026 09:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778147544; cv=none; b=Q2auocLzmeMj+vlEk+0CQWzF+qGWFDPXmlNcmymvMaFw+t4zpFYT/lDR72g5RfwNxBTUIKeNCqLaywRiJYjucxNgobOW6Ln8dPyXk/VFMMGTPls6qpyWs57/pxQGGfextUpDbSjZsiop40R+1BwpwqI4IRFErWNaaSsHCl6m6Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778147544; c=relaxed/simple;
	bh=eJ/srp9zrosiZKPztLc0t3HXPykDKM0ecqir8ctUaFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d/Yg5993wWSHm5obuwRtStJjWHJXI4xdteNWbtcIhYRYICTV1V5cueuJYvPRQHxikNDp6eLJIsi4kjL7/gycxbWKNWAH/2vxi79MiP2CO5dRtGRo8eFhrATyoPlwcvStFsp9cHXudm1tCljvZqwtK8yQJIcM/Y5OtlOAQPCORaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56a8e0ea02aso631955e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 02:52:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778147542; x=1778752342;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1bhar/UK+XkT5Dhu83HpcF1mBIkuaB73W2rNiIRK9TU=;
        b=Cbr6F/iDOthz7VVVxVS7+m2hccDlrKxEuHsysEhy4OEsFst0Znkuf8KdVYFQGhld+W
         bt/tmyxvmAyiDWu5SYmd6kkC3Z/Qxae1SQsLaUdsQEGHwc5uwun+nyOLz03lSNQWO1Kc
         lSi9CVcsbaU6FXVcbCZJN23FeEL5yWTJOaaJfVBnYpd1Ob6ObWgJYuuoYlx91vL/YKI7
         VNBIJKmMTeR8z94Y1fgp7GTdWZVTkPTkncMoQr7NsMnaPq4P1XRWQMMHz0jrgSEQ9YMY
         Nxa2KcMysqGIxHDXuZsCsMo1Ox1mteXYXqJUvy/ld5tNXjA3uL/4X9l3JoUnKkJzpiuo
         Ei6w==
X-Forwarded-Encrypted: i=1; AFNElJ8XclJ55cqU8E7AqroTjZz884AwHqAwGgT4Rr9SfRVu1qERoXn5s27cBzW/gACj7tlZMRyxle40N8ZUJCudYWt2sQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxwC6Tv32RPdg5iqI4IYLnM3RUfHHUNgZgRXLZUzQXrTTETWk6
	Zqw9hgB5MDG2lFVEgNeeiRHzHTLyJFvCai1PoqdCl+5e+dyWhbgNVrd1hjloL68JmOk=
X-Gm-Gg: AeBDietRpR4g21ySEO9ZLv7NkjJ5Dn6zqyl6J4mAKO3gaiHwPiI01rJi7RxR0hur6I5
	w4/+9MULat60rlYaDwy3tblCV0kLZtmbNtAtaflZu4QBlYzvUwqEL5f7cvSkWkrSPOUyvLDVlCN
	R1rzvPy2gaAhU74mehME0Awm+8s/a4JJMBw0RRz7COWQWF6O4ttgPYVJSdAq8ig2Y/9XYPrWXcA
	FcmNBxvOdAkK4eRyuaf8M4xNLk+CFrigr+EK+ebzds8WG+W4Y1B60YvWxPrlf/hjhBtFmy6MRnQ
	LlZOz4elLfJKLB2+N8f2D71VASu7kPRklxW1YcEJRckUNO3f+kq8YrHksRbozUtB4ow9568hc/d
	7H0bPqIcKiISKDd09i1c1wF3d7WDlovUJnt7luSOh/qYYtw+l8J25evm2Eaft9c9UaIMtvI5B1A
	cqd3bZvg0ATkaPx5pDtAJou4yMaL+nrklSDi4eIT5fPrJfGp9o81HV7iA90VHpI3rV4Zrei1xzY
	hW/0SRrTg==
X-Received: by 2002:a05:6122:2a13:b0:575:2166:74c3 with SMTP id 71dfb90a1353d-5755960bb57mr4384254e0c.9.1778147542300;
        Thu, 07 May 2026 02:52:22 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95ce0b63bb8sm10822975241.12.2026.05.07.02.52.21
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 02:52:21 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-95cc96eac66so389189241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 02:52:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8B04xdPkfGQcKslJ3EeKqkrivn17gQX314VmHvzAuoxh/KuQrlN/ro3wAb5ACj+DjinnD0133ucDKQuGydTXjN+g==@vger.kernel.org
X-Received: by 2002:a05:6102:374c:b0:612:164e:ab02 with SMTP id
 ada2fe7eead31-630f8e75bc6mr3667660137.5.1778147540890; Thu, 07 May 2026
 02:52:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326111953.31024-1-biju.das.jz@bp.renesas.com> <20260326111953.31024-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260326111953.31024-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 11:52:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU8S6pOxodK-LRWfU9NJhD5is5T-=cxA-K-cohqAyefAQ@mail.gmail.com>
X-Gm-Features: AVHnY4KKrk-p0LtIDnyA7jlpV5cLB8liuCJjfvbTpNoJ0gGv-_9HWUuGQzK5SBg
Message-ID: <CAMuHMdU8S6pOxodK-LRWfU9NJhD5is5T-=cxA-K-cohqAyefAQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: renesas: r9a08g046: Add GBETH nodes
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 27CF14E6536
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32211-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Thu, 26 Mar 2026 at 12:19, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Renesas RZ/G3L SoC is equipped with 2x Synopsys DesignWare Ethernet
> (10/100/1000 BASE) with TSN, IP block version 5.30. Add GBETH nodes
> to R9A08G046 RZ/G3L SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Rebased to boot series.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

